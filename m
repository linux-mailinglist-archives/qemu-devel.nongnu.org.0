Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC544D938
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:33:57 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlC5M-0003Gv-5D
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:33:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlC34-0001yk-SY
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:31:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlC31-0003jL-51
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636644689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3/dC0datfFAfEhtZSzQzsP+cA00bUiWsUNIpbbWU/QQ=;
 b=AqWlPaxQH1K3Bak/nuWQRPQslqBUUG17nB/8ReMJ4MMZPRu3EfTYLEzD9lTnJr3jijD7Mq
 iQNXdCx9OXP31S4y18lIQW7cJ7I2lNbKI6i2n/KKr+h4Kk4Xkmk5i0chxVxNpaoJyqJqWE
 CRKv5OQfyYbSmmg3j5Ns1GTgrpkOTdk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-eL5SiMKhMru-de7FmyEvFg-1; Thu, 11 Nov 2021 10:31:28 -0500
X-MC-Unique: eL5SiMKhMru-de7FmyEvFg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso2890716wmc.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/dC0datfFAfEhtZSzQzsP+cA00bUiWsUNIpbbWU/QQ=;
 b=o0d6m225kEfTOp+yDu4TWsuSNvnVZDY5mFNoKgz5sR00TiIkcxTnaFoy4G0Aky8AAF
 Q4cWOj/8QvOuN5E0PRFzin7eZSwhMW3G9SqUe53TwhxatF/+0U1U7+UlM9/FVhDDK16A
 tFIu3FJ9lE+ISbGkNjXCKBjLreEqePcqTldP7etNP3zg8xDnfAnt7wryedkBi4jriQbw
 dxx8Rp15koYaZWgAKi4n4jHKUFBE8ViXS/bn4WJPMeVyqyBpm4cvmwSC0DbMJwcg/MRA
 tQg4f6Cy0GmH9ce9fruIABTwNy8f6jEK5khtcblo+UZyAahSATceFRBuwu8BYqTj3yr0
 MMgg==
X-Gm-Message-State: AOAM530Jd6Y+6jzTJRWF+B6IArtf9vi2YNqXV0BwPpwSk98fJKyV32z6
 9U7tGAq1CXp6iSV3vQ6oq3YyJaj8FyDLxu46OFJVCc2jzD+Ibp7KcTaEGc416ETLLKLx3zKeuPJ
 q+FANxSC/89emab7DvUt1Mk1o3m3c+REoH39Kmm+kMsiSha07vQPzVTeWJKwDPtKg
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr10018101wrr.143.1636644687471; 
 Thu, 11 Nov 2021 07:31:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS5+iEPUfuS+qQGC7ULFZtFuiAcjl2Qh5wdXd1tEbginTseyd6Mulod3rQwR+OEu/WJfRGfw==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr10018045wrr.143.1636644687190; 
 Thu, 11 Nov 2021 07:31:27 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g4sm3107610wro.12.2021.11.11.07.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:31:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2] hw/nvme/ctrl: Fix buffer overrun (CVE-2021-3947)
Date: Thu, 11 Nov 2021 16:31:25 +0100
Message-Id: <20211111153125.2258176-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both 'buf_len' and 'off' arguments are under guest control.
Since nvme_c2h() doesn't check out of boundary access, the
caller must check for eventual buffer overrun on 'trans_len'.

Cc: qemu-stable@nongnu.org
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: f432fdfa121 ("support changed namespace asynchronous event")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6a571d18cfa..634b290e069 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4072,7 +4072,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     NvmeNamespace *ns;
     time_t current_ms;
 
-    if (off >= sizeof(smart)) {
+    trans_len = MIN(sizeof(smart) - off, buf_len);
+    if (trans_len >= sizeof(smart)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -4094,7 +4095,6 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
         }
     }
 
-    trans_len = MIN(sizeof(smart) - off, buf_len);
     smart.critical_warning = n->smart_critical_warning;
 
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
@@ -4130,12 +4130,12 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t off,
         .afi = 0x1,
     };
 
-    if (off >= sizeof(fw_log)) {
+    trans_len = MIN(sizeof(fw_log) - off, buf_len);
+    if (trans_len >= sizeof(fw_log)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
     strpadcpy((char *)&fw_log.frs1, sizeof(fw_log.frs1), "1.0", ' ');
-    trans_len = MIN(sizeof(fw_log) - off, buf_len);
 
     return nvme_c2h(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
@@ -4146,7 +4146,8 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     uint32_t trans_len;
     NvmeErrorLog errlog;
 
-    if (off >= sizeof(errlog)) {
+    trans_len = MIN(sizeof(errlog) - off, buf_len);
+    if (trans_len >= sizeof(trans_len)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -4155,7 +4156,6 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     memset(&errlog, 0x0, sizeof(errlog));
-    trans_len = MIN(sizeof(errlog) - off, buf_len);
 
     return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
@@ -4168,8 +4168,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     int i = 0;
     uint32_t nsid;
 
-    memset(nslist, 0x0, sizeof(nslist));
     trans_len = MIN(sizeof(nslist) - off, buf_len);
+    if (trans_len >= sizeof(nslist)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+    memset(nslist, 0x0, sizeof(nslist));
 
     while ((nsid = find_first_bit(n->changed_nsids, NVME_CHANGED_NSID_SIZE)) !=
             NVME_CHANGED_NSID_SIZE) {
@@ -4209,7 +4212,8 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     const uint32_t *src_iocs = NULL;
     uint32_t trans_len;
 
-    if (off >= sizeof(log)) {
+    trans_len = MIN(sizeof(log) - off, buf_len);
+    if (trans_len >= sizeof(log)) {
         trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(log));
         return NVME_INVALID_FIELD | NVME_DNR;
     }
@@ -4237,8 +4241,6 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
         memcpy(log.iocs, src_iocs, sizeof(log.iocs));
     }
 
-    trans_len = MIN(sizeof(log) - off, buf_len);
-
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
-- 
2.31.1


