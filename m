Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736631B872
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:55:59 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcTu-0003Er-FY
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQV-0007aQ-Sj
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQU-0003zs-2y
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id x4so9060860wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DWcDLedvIdrpO/Dyf18yelSJMFxD3oqKzuBHwfEwOy0=;
 b=lxKioMnIiYfAs3AIWfKk9BlDEfzhv6Hqmg8rBE0k06s8Ijyj7/qjl/TSmWMR0+zD9e
 2VI8w1YoxpnjwGu0dANvqK0zPDB6k4Jt0QdxUhVGEA0eA3UBJhKmboH7rVUFj1sn+uRb
 3cza+JFR0/wKYi6EE2P6JXyvBlQxio1yDFht0TNjx/erdcAWEcBIDR6I63TLgCGW3Px+
 jMyFtxB2asENtZHagCgmIo6r1qGlrW8kBIG/z4i9uYERw5hdPggM1wOruEwD+cNPIVj+
 lFHnWMY33hTTsu3Vsd1664HdYQwet6gNsNtDoDh4ZTmc6ucIl02BLLItRtzzWCU9qA7C
 njtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWcDLedvIdrpO/Dyf18yelSJMFxD3oqKzuBHwfEwOy0=;
 b=K5JifrQybJwfP03MWOUZNeYiYRRPS77Qo/Pr9RwJSb50vg0mIL9kYrOqkEqDqLq1jA
 w/NqONqMw3+mzMIg605wcvQF99vah6P/Dftt5DkGo7UwW9frOKDh+IsxljDm89QQ+ta9
 UuIgFSRovRHhYqIXPtZ8fN7VOIjrTWOBdLxtUhfpk7RAibPP44YIlO8aw4EkGBT+hB9X
 JNaYQToI0b6m1mFknCk0Z+CD4zRJLqkL8KnnKO5hartbTxMpqNwIc3dxoyf3uP320T9Z
 W3E6FoiLTRhpTnHuKNqalff/ehxSdMFS96fp9N4fCZuUchyktRGnAyoTihqVFycK9mwH
 P1EQ==
X-Gm-Message-State: AOAM531HpP7/4iROGbsZe5QIPDTEKOuzaSkjp1hi96JrDAzBDzyATq1G
 xJ0T8FMs26xQSBP/yzJXanLb4Q==
X-Google-Smtp-Source: ABdhPJyiDdbCymhAeV2zgR2FRi/Hz8l2h20tGM386wb8J0jSX9XZqbyN5HDTMlNqJevoH3pp6OO2bg==
X-Received: by 2002:a1c:2403:: with SMTP id k3mr14258325wmk.130.1613389944836; 
 Mon, 15 Feb 2021 03:52:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/24] hw/misc/mps2-scc: Implement CFG_REG5 and CFG_REG6
 for MPS3 AN524
Date: Mon, 15 Feb 2021 11:51:24 +0000
Message-Id: <20210215115138.20465-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN524 version of the SCC interface has different behaviour for
some of the CFG registers; implement it.

Each board in this family can have minor differences in the meaning
of the CFG registers, so rather than trying to specify all the
possible semantics via individual device properties, we make the
behaviour conditional on the part-number field of the SCC_ID register
which the board code already passes us.

For the AN524, the differences are:
 * CFG3 is reserved rather than being board switches
 * CFG5 is a new register ("ACLK Frequency in Hz")
 * CFG6 is a new register ("Clock divider for BRAM")

We implement both of the new registers as reads-as-written.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/mps2-scc.h |  3 ++
 hw/misc/mps2-scc.c         | 71 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 514da49f69e..49d070616aa 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -29,7 +29,10 @@ struct MPS2SCC {
 
     uint32_t cfg0;
     uint32_t cfg1;
+    uint32_t cfg2;
     uint32_t cfg4;
+    uint32_t cfg5;
+    uint32_t cfg6;
     uint32_t cfgdata_rtn;
     uint32_t cfgdata_out;
     uint32_t cfgctrl;
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 52a4e183b71..562ace06a58 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -31,8 +31,11 @@
 
 REG32(CFG0, 0)
 REG32(CFG1, 4)
+REG32(CFG2, 8)
 REG32(CFG3, 0xc)
 REG32(CFG4, 0x10)
+REG32(CFG5, 0x14)
+REG32(CFG6, 0x18)
 REG32(CFGDATA_RTN, 0xa0)
 REG32(CFGDATA_OUT, 0xa4)
 REG32(CFGCTRL, 0xa8)
@@ -49,6 +52,12 @@ REG32(DLL, 0x100)
 REG32(AID, 0xFF8)
 REG32(ID, 0xFFC)
 
+static int scc_partno(MPS2SCC *s)
+{
+    /* Return the partno field of the SCC_ID (0x524, 0x511, etc) */
+    return extract32(s->id, 4, 8);
+}
+
 /* Handle a write via the SYS_CFG channel to the specified function/device.
  * Return false on error (reported to guest via SYS_CFGCTRL ERROR bit).
  */
@@ -100,7 +109,18 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
     case A_CFG1:
         r = s->cfg1;
         break;
+    case A_CFG2:
+        if (scc_partno(s) != 0x524) {
+            /* CFG2 reserved on other boards */
+            goto bad_offset;
+        }
+        r = s->cfg2;
+        break;
     case A_CFG3:
+        if (scc_partno(s) == 0x524) {
+            /* CFG3 reserved on AN524 */
+            goto bad_offset;
+        }
         /* These are user-settable DIP switches on the board. We don't
          * model that, so just return zeroes.
          */
@@ -109,6 +129,20 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
     case A_CFG4:
         r = s->cfg4;
         break;
+    case A_CFG5:
+        if (scc_partno(s) != 0x524) {
+            /* CFG5 reserved on other boards */
+            goto bad_offset;
+        }
+        r = s->cfg5;
+        break;
+    case A_CFG6:
+        if (scc_partno(s) != 0x524) {
+            /* CFG6 reserved on other boards */
+            goto bad_offset;
+        }
+        r = s->cfg6;
+        break;
     case A_CFGDATA_RTN:
         r = s->cfgdata_rtn;
         break;
@@ -131,6 +165,7 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
         r = s->id;
         break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC read: bad offset %x\n", (int) offset);
         r = 0;
@@ -159,6 +194,30 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
             led_set_state(s->led[i], extract32(value, i, 1));
         }
         break;
+    case A_CFG2:
+        if (scc_partno(s) != 0x524) {
+            /* CFG2 reserved on other boards */
+            goto bad_offset;
+        }
+        /* AN524: QSPI Select signal */
+        s->cfg2 = value;
+        break;
+    case A_CFG5:
+        if (scc_partno(s) != 0x524) {
+            /* CFG5 reserved on other boards */
+            goto bad_offset;
+        }
+        /* AN524: ACLK frequency in Hz */
+        s->cfg5 = value;
+        break;
+    case A_CFG6:
+        if (scc_partno(s) != 0x524) {
+            /* CFG6 reserved on other boards */
+            goto bad_offset;
+        }
+        /* AN524: Clock divider for BRAM */
+        s->cfg6 = value;
+        break;
     case A_CFGDATA_OUT:
         s->cfgdata_out = value;
         break;
@@ -202,6 +261,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         s->dll = deposit32(s->dll, 24, 8, extract32(value, 24, 8));
         break;
     default:
+    bad_offset:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "MPS2 SCC write: bad offset 0x%x\n", (int) offset);
         break;
@@ -222,6 +282,9 @@ static void mps2_scc_reset(DeviceState *dev)
     trace_mps2_scc_reset();
     s->cfg0 = 0;
     s->cfg1 = 0;
+    s->cfg2 = 0;
+    s->cfg5 = 0;
+    s->cfg6 = 0;
     s->cfgdata_rtn = 0;
     s->cfgdata_out = 0;
     s->cfgctrl = 0x100000;
@@ -260,11 +323,15 @@ static void mps2_scc_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription mps2_scc_vmstate = {
     .name = "mps2-scc",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(cfg0, MPS2SCC),
         VMSTATE_UINT32(cfg1, MPS2SCC),
+        VMSTATE_UINT32(cfg2, MPS2SCC),
+        /* cfg3, cfg4 are read-only so need not be migrated */
+        VMSTATE_UINT32(cfg5, MPS2SCC),
+        VMSTATE_UINT32(cfg6, MPS2SCC),
         VMSTATE_UINT32(cfgdata_rtn, MPS2SCC),
         VMSTATE_UINT32(cfgdata_out, MPS2SCC),
         VMSTATE_UINT32(cfgctrl, MPS2SCC),
-- 
2.20.1


