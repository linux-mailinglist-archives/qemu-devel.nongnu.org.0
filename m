Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896C63D2384
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:46:58 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Y6L-0000On-3H
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6Xwu-0003Yz-EX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6Xws-0004cJ-Ew
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626957429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/q54+MYPayn2IfoKvbOy90CyQUuFc7XRv2g4VY2wxac=;
 b=HfMzNYN583UHuujhAzYKuM88QK08YQPyF2wV37Gwfb7lKC+G+9NPLDLWRYKbdKtvXqQTd6
 M0LzstINYgYu6GonSR85WUBKsd6dG3ck3LPmJIJWxDPtK/D/ZLa0yfdycmu3ppkAyCHgiI
 BVfv8aag0nWAEDOuf/LY2BaRpnnv7Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-UOY-q3kBNpyF389Z1BS-cg-1; Thu, 22 Jul 2021 08:37:08 -0400
X-MC-Unique: UOY-q3kBNpyF389Z1BS-cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1979107ACF5;
 Thu, 22 Jul 2021 12:37:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ECB817A63;
 Thu, 22 Jul 2021 12:36:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] util/oslib-posix: Avoid creating a single thread with
 MADV_POPULATE_WRITE
Date: Thu, 22 Jul 2021 14:36:33 +0200
Message-Id: <20210722123635.60608-5-david@redhat.com>
In-Reply-To: <20210722123635.60608-1-david@redhat.com>
References: <20210722123635.60608-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's simplify the case when we only want a single thread and don't have
to mess with signal handlers.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index a1d309d495..1483e985c6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -568,6 +568,14 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     }
 
     if (use_madv_populate_write) {
+        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
+        if (context.num_threads == 1) {
+            if (qemu_madvise(area, hpagesize * numpages,
+                             QEMU_MADV_POPULATE_WRITE)) {
+                return true;
+            }
+            return false;
+        }
         touch_fn = do_madv_populate_write_pages;
     } else {
         touch_fn = do_touch_pages;
-- 
2.31.1


