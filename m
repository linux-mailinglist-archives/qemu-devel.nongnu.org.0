Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524D215C85
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:02:19 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUVW-0000or-C0
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCO-0003j4-9K
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45782
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCJ-00038G-Ve
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjzbHJB011P4JrSJGu5RW392psBXRe2s43oXx8KYWow=;
 b=Or9cLG7oYY7MZdnYOSeZAVTPRZfwH/w9Mn+lsQ8SeF6F4LnSQXdM72G5ISnA8zWre8QgiH
 rT1ainOZCPz1PLXSaoxxh2CCTfl8cqjnmD85+EvKKYGiLeBMMU9v6ntFLUB7uPP+dgT92J
 u0N5gDzeLlPg5isxo75ZUQT0KrCfl7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-jGM_f0jxPFGYplIyAsNk6w-1; Mon, 06 Jul 2020 12:42:24 -0400
X-MC-Unique: jGM_f0jxPFGYplIyAsNk6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9851005510
 for <qemu-devel@nongnu.org>; Mon,  6 Jul 2020 16:42:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9047B40D;
 Mon,  6 Jul 2020 16:42:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/53] target/i386: sev: provide proper error reporting for
 query-sev-capabilities
Date: Mon,  6 Jul 2020 12:41:34 -0400
Message-Id: <20200706164155.24696-33-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:22:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The query-sev-capabilities was reporting errors through error_report;
change it to use Error** so that the cause of the failure is clearer.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c  | 10 +---------
 target/i386/sev-stub.c |  3 ++-
 target/i386/sev.c      | 18 +++++++++---------
 target/i386/sev_i386.h |  2 +-
 4 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 27ebfa3ad2..7abae3c8df 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -726,13 +726,5 @@ SevLaunchMeasureInfo *qmp_query_sev_launch_measure(Error **errp)
 
 SevCapability *qmp_query_sev_capabilities(Error **errp)
 {
-    SevCapability *data;
-
-    data = sev_get_capabilities();
-    if (!data) {
-        error_setg(errp, "SEV feature is not available");
-        return NULL;
-    }
-
-    return data;
+    return sev_get_capabilities(errp);
 }
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index e5ee13309c..88e3f39a1e 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -44,7 +44,8 @@ char *sev_get_launch_measurement(void)
     return NULL;
 }
 
-SevCapability *sev_get_capabilities(void)
+SevCapability *sev_get_capabilities(Error **errp)
 {
+    error_setg(errp, "SEV is not available in this QEMU");
     return NULL;
 }
diff --git a/target/i386/sev.c b/target/i386/sev.c
index d273174ad3..70f9ee026f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -399,7 +399,7 @@ sev_get_info(void)
 
 static int
 sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
-                 size_t *cert_chain_len)
+                 size_t *cert_chain_len, Error **errp)
 {
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
@@ -410,8 +410,8 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
         if (err != SEV_RET_INVALID_LEN) {
-            error_report("failed to export PDH cert ret=%d fw_err=%d (%s)",
-                         r, err, fw_error_to_str(err));
+            error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+                       r, err, fw_error_to_str(err));
             return 1;
         }
     }
@@ -423,8 +423,8 @@ sev_get_pdh_info(int fd, guchar **pdh, size_t *pdh_len, guchar **cert_chain,
 
     r = sev_platform_ioctl(fd, SEV_PDH_CERT_EXPORT, &export, &err);
     if (r < 0) {
-        error_report("failed to export PDH cert ret=%d fw_err=%d (%s)",
-                     r, err, fw_error_to_str(err));
+        error_setg(errp, "failed to export PDH cert ret=%d fw_err=%d (%s)",
+                   r, err, fw_error_to_str(err));
         goto e_free;
     }
 
@@ -441,7 +441,7 @@ e_free:
 }
 
 SevCapability *
-sev_get_capabilities(void)
+sev_get_capabilities(Error **errp)
 {
     SevCapability *cap = NULL;
     guchar *pdh_data = NULL;
@@ -452,13 +452,13 @@ sev_get_capabilities(void)
 
     fd = open(DEFAULT_SEV_DEVICE, O_RDWR);
     if (fd < 0) {
-        error_report("%s: Failed to open %s '%s'", __func__,
-                     DEFAULT_SEV_DEVICE, strerror(errno));
+        error_setg_errno(errp, errno, "Failed to open %s",
+                         DEFAULT_SEV_DEVICE);
         return NULL;
     }
 
     if (sev_get_pdh_info(fd, &pdh_data, &pdh_len,
-                         &cert_chain_data, &cert_chain_len)) {
+                         &cert_chain_data, &cert_chain_len, errp)) {
         goto out;
     }
 
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 8eb7de1bef..4db6960f60 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -34,6 +34,6 @@ extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
 extern char *sev_get_launch_measurement(void);
-extern SevCapability *sev_get_capabilities(void);
+extern SevCapability *sev_get_capabilities(Error **errp);
 
 #endif
-- 
2.26.2



