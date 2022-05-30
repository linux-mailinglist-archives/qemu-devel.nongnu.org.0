Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C385387E7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:56:20 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlUx-0006sa-Nb
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFL-0000fp-7b; Mon, 30 May 2022 15:40:12 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlFJ-000073-HS; Mon, 30 May 2022 15:40:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so191036pjl.4; 
 Mon, 30 May 2022 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8A7wws51gDKT5DGErSwXdU4YKfYnaGCZbjXp+wS8YIQ=;
 b=MZGoBShhGxr+wZbC4BpGDlm5bMWsgf0e4ZpSv+U19hoBQ6bvk7LRJbUv1rXsbV4OqK
 xgrte/ua/Qf4RFfuvA9C1tHtdD0gw4Bcc18y+tjMdQ6inxealTnE+w0bt0Y2cNDym+AG
 6Fu6Tm5enKVG61vY78i3cGFqlBBhcDSQ7pX/1Mm+D0FIIJW/DEL29hMn+6av/ipCwmfq
 zl4Zkcvrvn9q/TcoUFsfikNjJjURDr9+cKvPc5DRPkpWwlvq5yF3LxbxoVWp4ui1qsaV
 a7lYvjtiZ3DkxFEUpZeqF6jI+9a1ebAJeTUVzyNakqCasiVM1EwmQfvmib3wz1fATOGM
 7mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8A7wws51gDKT5DGErSwXdU4YKfYnaGCZbjXp+wS8YIQ=;
 b=0BaSABB+qlLbE51vJS/+cKhRJB6GApHYIloSD9Df1mfKiYwmgijy56LDba1ke+t75X
 /AH8+3KJihHdUgbsk3jgNl6Iza1dt1UznZ5qu9QtQ+bUPKgX8vffyvt3FlXITHPXFqlc
 4M4ueICGXicvWGB21TbbreFsP6nTOB2dzhE2XgGnSwZk1CE84olT9BeGATewo+rdml//
 aMkOTkOlg+h/j35bfiYe30knFVN6IZDBxV4HTtm/RgZanMj5oGzg40SasVoGQ91aKToa
 TF3Z6l9p7UGcpZamEtL0cW3NSBw15HrVNXmF1xoNirr/mOfzQ5g/lbVee6lYwM7EdAF0
 AjSg==
X-Gm-Message-State: AOAM532H+KcV63zrxFea3nZm3KpEwJZ1O193X2N1hPwqDCK7eGQZr4y0
 RUBRjwkd0WpJtAKkOuVDsY3heKB4AqQ=
X-Google-Smtp-Source: ABdhPJz7uAaQNkOo+4gMAvB5hLj5n5KEA97BPsLj8FHyo1r/TA7eXhoeM7TNrnnRCh3hsMxnFyAihA==
X-Received: by 2002:a17:903:234c:b0:162:50f2:a850 with SMTP id
 c12-20020a170903234c00b0016250f2a850mr31628855plh.89.1653939607618; 
 Mon, 30 May 2022 12:40:07 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk3-20020a056a02028300b003f5d7f0ad6asm8899350pgb.48.2022.05.30.12.40.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:40:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 12/25] hw/sd: Add sd_cmd_SEND_TUNING_BLOCK() handler
Date: Mon, 30 May 2022 21:38:03 +0200
Message-Id: <20220530193816.45841-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[PMD: Rebased]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2fe05c5a3d..a9130155be 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1062,6 +1062,22 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
     }
 }
 
+static sd_rsp_type_t sd_cmd_SEND_TUNING_BLOCK(SDState *sd, SDRequest req)
+{
+        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            return sd_cmd_illegal(sd, req);
+        }
+
+        if (sd->state != sd_transfer_state) {
+            return sd_invalid_state_for_cmd(sd, req);
+        }
+
+        sd->state = sd_sendingdata_state;
+        sd->data_offset = 0;
+
+        return sd_r1;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1305,17 +1321,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 19:    /* CMD19: SEND_TUNING_BLOCK (SD) */
-        if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
-            return sd_invalid_state_for_cmd(sd, req);
-        }
-        if (sd->state == sd_transfer_state) {
-            sd->state = sd_sendingdata_state;
-            sd->data_offset = 0;
-            return sd_r1;
-        }
-        break;
-
     case 23:    /* CMD23: SET_BLOCK_COUNT */
         if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
             return sd_invalid_state_for_cmd(sd, req);
@@ -2152,6 +2157,7 @@ static const SDProto sd_proto_sd = {
         [2]         = sd_cmd_ALL_SEND_CID,
         [3]         = sd_cmd_SEND_RELATIVE_ADDR,
         [5]         = sd_cmd_illegal,
+        [19]        = sd_cmd_SEND_TUNING_BLOCK,
         [52 ... 54] = sd_cmd_illegal,
         [58]        = sd_cmd_illegal,
         [59]        = sd_cmd_illegal,
-- 
2.36.1


