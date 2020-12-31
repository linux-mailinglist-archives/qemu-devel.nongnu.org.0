Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F5E2E7FAE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 12:34:21 +0100 (CET)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuwDk-0001Ls-CT
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 06:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAF-0007VT-Bf; Thu, 31 Dec 2020 06:30:43 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuwAD-0007Cs-NJ; Thu, 31 Dec 2020 06:30:43 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x12so9923545plr.10;
 Thu, 31 Dec 2020 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w30FYM3mucc4ZAI7XS3v5QTVZYCtts9RS0bA0E7DMfw=;
 b=HfRd9tSQLV7tJx3wRlnEgCInTh0jzwGpfoo/vPKTb0mbVWU9m47XYHVLEdQRKz45BD
 GutcrgGHe0kx1ZXywvua2iBLAxTfcpUf+8DjsokJnVMEq/CFKEf/Z9Zz+kFJOmx0EbV0
 kOE0/9k6HyybR+71xNPhPTSd0O7m9jmYTbN7smbBJWlTcS7IXT4bf/89Ex20pzXm1vaG
 dCR9aNXFwbgbeOSxyTP/ilF6HPh2uCjVVS0pskpaRNAet+VakTA28OEms7lKlF81Jza2
 XeKdufb+7wJ78+wKfTbG2ST9OysS0Lonh9LJTfkgPC8Yi9vn0xdFyhiOd/mO6cjJB04v
 plEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w30FYM3mucc4ZAI7XS3v5QTVZYCtts9RS0bA0E7DMfw=;
 b=Dcg7ixKd2rLRC0E5Ya9VtdH95lSo0gIkGlDk09b8t321s5rKiF+3n1FTUmlWOrfn1a
 T1j4s8d2H+loywbfh8YEyn9nq9JZZDQDhTvbfownzGTpj0Y5qh+aV96o6FkAoSzxfMse
 I2NldyUaU+ChPSmiHlHexE39byVPUYqnYcsgfshdJaXvB/WRzDdHiy1toDhGb//wcka2
 IK05SlBm1EYUtPE0KAs3ZMjXxlau/Tr3z73u/Co7ks3nCbhEC5HtYf2dSSRLNI0/R9tx
 l0qHth2+mT8DxgsbzRsMDvJJiaZcatXtD98+0aFYYOoI7YuHI+6zcozSkPYWo5UBgtsV
 8KUQ==
X-Gm-Message-State: AOAM531YdD6rkow00VQ9/cMSD/07euC2BeAsXEAwdxTCYCeJecXuGo3c
 2ZdC2meew4tR0eQA+7E1rAA=
X-Google-Smtp-Source: ABdhPJy5sCjItFP5FL5UD7rzzqN8qDaWTgLUmYpjVjpm9ZqrTi5NDHCb+oSwK0hEB0HE2T9g1ysx/A==
X-Received: by 2002:a17:902:7c0a:b029:da:62c8:90cb with SMTP id
 x10-20020a1709027c0ab02900da62c890cbmr56903946pll.59.1609414239770; 
 Thu, 31 Dec 2020 03:30:39 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id t23sm45957591pfc.0.2020.12.31.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:30:39 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 04/22] hw/sd: sd: Support CMD59 for SPI mode
Date: Thu, 31 Dec 2020 19:29:52 +0800
Message-Id: <20201231113010.27108-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201231113010.27108-1-bmeng.cn@gmail.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

After the card is put into SPI mode, CRC check for all commands
including CMD0 will be done according to CMD59 setting. But this
command is currently unimplemented. Simply allow the decoding of
CMD59, but the CRC check is still ignored.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/sd/sd.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1842c03797..2036734da1 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1516,18 +1516,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         if (!sd->spi) {
             goto bad_cmd;
         }
-        goto unimplemented_spi_cmd;
+        return sd_r1;
 
     default:
     bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
-
-    unimplemented_spi_cmd:
-        /* Commands that are recognised but not yet implemented in SPI mode.  */
-        qemu_log_mask(LOG_UNIMP, "SD: CMD%i not implemented in SPI mode\n",
-                      req.cmd);
-        return sd_illegal;
     }
 
     qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state\n", req.cmd);
-- 
2.25.1


