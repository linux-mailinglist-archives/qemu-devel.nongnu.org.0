Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC29478CD7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:53:52 +0100 (CET)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDgF-0004cV-Hk
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZm-0005me-Gx
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1myDZl-0008N8-2Y
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzq1+LNic1KF/MEspKD0a9iTSfwrsblw57W1b4UDQ9Y=;
 b=TWJ2R+okuu2JmMfiklW7so54zFgLsdFfHCjGCGaQnRxQYLwPGa6azAEUlxR8DRCaUudP4t
 +9BdxZ37yvsrmPbUnel7EUxNnUhUUPaZzOC7zo5mYwHfg5+SbZWj7KXXCoUxW+ONR8YqvO
 1cpe+oV9RZlIF7plspr1LdGvX2GATLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-jMIdMK2mMreKWTJqrRMm6w-1; Fri, 17 Dec 2021 08:47:05 -0500
X-MC-Unique: jMIdMK2mMreKWTJqrRMm6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8220D801962;
 Fri, 17 Dec 2021 13:47:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 936345E482;
 Fri, 17 Dec 2021 13:47:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] util/oslib-posix: Avoid creating a single thread with
 MADV_POPULATE_WRITE
Date: Fri, 17 Dec 2021 14:46:08 +0100
Message-Id: <20211217134611.31172-6-david@redhat.com>
In-Reply-To: <20211217134611.31172-1-david@redhat.com>
References: <20211217134611.31172-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's simplify the case when we only want a single thread and don't have
to mess with signal handlers.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 67c08a425e..efa4f96d56 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -564,6 +564,14 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     }
 
     if (use_madv_populate_write) {
+        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
+        if (context.num_threads == 1) {
+            if (qemu_madvise(area, hpagesize * numpages,
+                             QEMU_MADV_POPULATE_WRITE)) {
+                return -errno;
+            }
+            return 0;
+        }
         touch_fn = do_madv_populate_write_pages;
     } else {
         touch_fn = do_touch_pages;
-- 
2.31.1


