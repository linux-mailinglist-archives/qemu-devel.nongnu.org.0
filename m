Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB44148AD5D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:12:56 +0100 (CET)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7G1H-0004hg-CQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7FxG-0002XP-JZ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:08:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7FxD-0003gr-IC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641902921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n11iNm7Cs15eVJURMSjsAZglvTdnx+SD9bJZKyVyv6U=;
 b=dxubBB1Gv7fHODErzsZodWJy8A1QOnGpYn/+7K1clyfhI0p01nEV+HPMfLXBi9Fx9gOXkv
 oZrlIvjzOsZQ7P/yBVMS+Fh/x5xLuh5yjGeQUgIFkEFWpnQMVnzQe/84JYTa/zF9DqTNOK
 P7r9DY+oL7BSOfQKjBnjD8d9QyRInrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-iieDCpzcMDKpbexc8s68Rw-1; Tue, 11 Jan 2022 07:08:39 -0500
X-MC-Unique: iieDCpzcMDKpbexc8s68Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 056013459B;
 Tue, 11 Jan 2022 12:08:39 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C647B6E3;
 Tue, 11 Jan 2022 12:08:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] util/oslib-posix: Fix missing unlock in the error path of
 os_mem_prealloc()
Date: Tue, 11 Jan 2022 13:08:30 +0100
Message-Id: <20220111120830.119912-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 David Hildenbrand <david@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're missing an unlock in case installing the signal handler failed.
Fortunately, we barely see this error in real life.

Fixes: a960d6642d39 ("util/oslib-posix: Support concurrent os_mem_prealloc() invocation")
Fixes: CID 1468941
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta@ionos.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 util/oslib-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9efdc74bba..ac0dbc2adc 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -683,6 +683,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
         ret = sigaction(SIGBUS, &act, &sigbus_oldact);
         if (ret) {
+            qemu_mutex_unlock(&sigbus_mutex);
             error_setg_errno(errp, errno,
                 "os_mem_prealloc: failed to install signal handler");
             return;
-- 
2.33.1


