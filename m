Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17C399FD0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 13:32:06 +0200 (CEST)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lola0-0007G3-Am
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 07:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lolYV-0006Yz-NM
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lolYS-00076n-Pc
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 07:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622719826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UZiwjcm72iwytSkuL3nJmMJUJstjemaA2khGE4VeSss=;
 b=DMOM3T5idLFcSCpYdugKhDWiGcMERZWisNLp1Al7/4/gTx57eJ8Bqch+L4LqYrNGNvCVzr
 xvSJdeSYAA1cYnBkW9SGD99aVD97y1skacRDsjCr+FleTCaOzsoSH0ZPKUPuZBTg8HKsHY
 kig68KKLuVwnRUGraEu1mJYNwkn9Lb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-YM0_GVa6MUiM6RsYYwlsRg-1; Thu, 03 Jun 2021 07:30:24 -0400
X-MC-Unique: YM0_GVa6MUiM6RsYYwlsRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6178802944;
 Thu,  3 Jun 2021 11:30:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-217.ams2.redhat.com
 [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C9F10023B5;
 Thu,  3 Jun 2021 11:30:21 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, ehabkost@redhat.com, brijesh.singh@amd.com,
 ckuehl@redhat.com
Subject: [PATCH] sev: sev_get_attestation_report use g_autofree
Date: Thu,  3 Jun 2021 12:30:17 +0100
Message-Id: <20210603113017.34922-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Removes a whole bunch of g_free's and a goto.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 target/i386/sev.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6..0bd976b4d0 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -500,8 +500,8 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     struct kvm_sev_attestation_report input = {};
     SevAttestationReport *report = NULL;
     SevGuestState *sev = sev_guest;
-    guchar *data;
-    guchar *buf;
+    g_autofree guchar *data = NULL;
+    g_autofree guchar *buf = NULL;
     gsize len;
     int err = 0, ret;
 
@@ -521,7 +521,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (len != sizeof(input.mnonce)) {
         error_setg(errp, "SEV: mnonce must be %zu bytes (got %" G_GSIZE_FORMAT ")",
                 sizeof(input.mnonce), len);
-        g_free(buf);
         return NULL;
     }
 
@@ -532,7 +531,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
         if (err != SEV_RET_INVALID_LEN) {
             error_setg(errp, "failed to query the attestation report length "
                     "ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-            g_free(buf);
             return NULL;
         }
     }
@@ -547,7 +545,7 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
     if (ret) {
         error_setg_errno(errp, errno, "Failed to get attestation report"
                 " ret=%d fw_err=%d (%s)", ret, err, fw_error_to_str(err));
-        goto e_free_data;
+        return NULL;
     }
 
     report = g_new0(SevAttestationReport, 1);
@@ -555,9 +553,6 @@ sev_get_attestation_report(const char *mnonce, Error **errp)
 
     trace_kvm_sev_attestation_report(mnonce, report->data);
 
-e_free_data:
-    g_free(data);
-    g_free(buf);
     return report;
 }
 
-- 
2.31.1


