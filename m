Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CF82F63FF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:17:23 +0100 (CET)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04NG-00045b-8l
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GI-0005rz-R5; Thu, 14 Jan 2021 10:10:10 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l04GG-0003xc-Rx; Thu, 14 Jan 2021 10:10:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y12so3237745pji.1;
 Thu, 14 Jan 2021 07:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t2ETafJuNe5QRSDUuiXSiKWyirde+D6J5I6WLc2cTvc=;
 b=a9gt0Q8jmR77DGEN9ARNwmR9UyaGiGnpffSX1nhuJSEQYZDM6zsYnqQoms/3U55Ich
 8htrfohCk4b0bjiWkqWv/fxw/2I83B2CJY8heHz6vnNWD4tWHuoE1rvOf4cDsave4ijN
 3P2rgSshmCn1iahEIIHdlVj1SB+kLPBt1RQIDbewe/rpUA1NrUchyATvrjjqSbMyp2Uy
 SXa9r/qJa/V4sCfHVBvjYs+PFfgpURo/zWWDK5cFFwpzzIHfAuHWz8SvwbezDL5VHGkx
 9XsH6oN856+gDmr3Y2r8eO+E5+f1NFMtbvln/i075HU449+LH1fuokiv5RvMSQ1s2jp2
 JbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t2ETafJuNe5QRSDUuiXSiKWyirde+D6J5I6WLc2cTvc=;
 b=GxbCxIjtagWkyopdBtCqWimho+bLAqTWr185vrHBnmPqVoFhxk5Rz0WAyNd8EER2td
 VedWVkgzM4Xc56+fdUayXVP3YRgKjE07Y57SnkiwoUFh5wLzzvXWAyIFcMXe8BjJffPf
 UIJIZu9uq6rhj6CxSSoqnW4m0WnxKYvS2S8qHtYBtKqZxagsqITFjihPT5G6gtErNWF9
 uKsCb9CviTz/e48jQTZZDHpKKRwaWO9KZCQ/5ukAP6xbcPYHVkR7XnBXlopTzBPUgKTy
 U+MG6WuraMXaJtAPgaR/4LgxnxsiZsLXOvcCmRxIdy9QATlpc80u9nwl25oXc80UujF5
 D6UQ==
X-Gm-Message-State: AOAM532ZQZfi2HstJI9WHtPrW+6TvHjxk/NeOvMXB3UN1tqWdtMuXHeK
 U67gg0dYW1yeiITIQkyunwh3SB453A4=
X-Google-Smtp-Source: ABdhPJw8NAxCnsFrVs/ldkcB3mh5G1EcF0JfKtGmdTJq3PvAIXSYQITBrxcYeGNFLFTWVQCWIZGGCw==
X-Received: by 2002:a17:90a:520e:: with SMTP id
 v14mr4624083pjh.233.1610637007333; 
 Thu, 14 Jan 2021 07:10:07 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id w21sm5372051pfq.67.2021.01.14.07.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:10:06 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH 4/9] hw/block: m25p80: Fix the number of dummy bytes needed
 for Spansion flashes
Date: Thu, 14 Jan 2021 23:08:57 +0800
Message-Id: <20210114150902.11515-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Per datasheet [1], the number of dummy cycles for Spansion flashes
is configurable via 4 volatible bits in a configuration register.

Do the same dummy cycle to dummy byte conversion fix as others.

[1] https://www.cypress.com/file/316171/download

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/m25p80.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 44508b3da9..e1e5d5a76f 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -955,10 +955,25 @@ static void decode_fast_read_cmd(Flash *s)
         s->needed_bytes += 1;
         break;
     case MAN_SPANSION:
-        s->needed_bytes += extract32(s->spansion_cr2v,
-                                    SPANSION_DUMMY_CLK_POS,
-                                    SPANSION_DUMMY_CLK_LEN
-                                    );
+        if (extract32(s->spansion_cr2v, SPANSION_DUMMY_CLK_POS,
+                      SPANSION_DUMMY_CLK_LEN) != 8) {
+            qemu_log_mask(LOG_UNIMP,
+                          "M25P80: the number of dummy bits is not multiple of 8");
+        }
+        switch (s->cmd_in_progress) {
+        case FAST_READ:
+        case FAST_READ4:
+            s->needed_bytes += 1;
+            break;
+        case DOR:
+        case DOR4:
+            s->needed_bytes += 2;
+            break;
+        case QOR:
+        case QOR4:
+            s->needed_bytes += 4;
+            break;
+        }
         break;
     default:
         break;
@@ -978,10 +993,12 @@ static void decode_dio_read_cmd(Flash *s)
         break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += extract32(s->spansion_cr2v,
-                                    SPANSION_DUMMY_CLK_POS,
-                                    SPANSION_DUMMY_CLK_LEN
-                                    );
+        if (extract32(s->spansion_cr2v, SPANSION_DUMMY_CLK_POS,
+                      SPANSION_DUMMY_CLK_LEN) != 8) {
+            qemu_log_mask(LOG_UNIMP,
+                          "M25P80: the number of dummy bits is not multiple of 8");
+        }
+        s->needed_bytes += 2;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
@@ -1018,10 +1035,12 @@ static void decode_qio_read_cmd(Flash *s)
         break;
     case MAN_SPANSION:
         s->needed_bytes += SPANSION_CONTINUOUS_READ_MODE_CMD_LEN;
-        s->needed_bytes += extract32(s->spansion_cr2v,
-                                    SPANSION_DUMMY_CLK_POS,
-                                    SPANSION_DUMMY_CLK_LEN
-                                    );
+        if (extract32(s->spansion_cr2v, SPANSION_DUMMY_CLK_POS,
+                      SPANSION_DUMMY_CLK_LEN) != 8) {
+            qemu_log_mask(LOG_UNIMP,
+                          "M25P80: the number of dummy bits is not multiple of 8");
+        }
+        s->needed_bytes += 4;
         break;
     case MAN_NUMONYX:
         s->needed_bytes += numonyx_extract_cfg_num_dummies(s);
-- 
2.25.1


