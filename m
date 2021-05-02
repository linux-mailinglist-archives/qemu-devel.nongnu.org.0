Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67602370DFA
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:31:37 +0200 (CEST)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF0J-0002sh-To
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElJ-0005BG-6N
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElH-0007Lt-Qr
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id z6so3097457wrm.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGJF5dKqSB+KKQYLEJgSlRUAv3AoaIgySDoRGS9mRQ8=;
 b=ZBhkZ3avbPBD+unZdLOSvLrunbCtylkj/8CXloDNx5unBLjNGsgSKbKrdb53V9H4I/
 nzHfHhCa5cuF8GloXGnq+iYKxqJCh+YvP7nJsJTrKUoPTNB11Li/JNQWXfNkWg7Ife1i
 JcH6Rh+DUckjOUoBsYPO7c/pF4cACgGAMx69Ri+csGNgqFGGTdzAQo4Wuv0lvFrY+kMM
 9eQuno/uAs66f/0aailBzEbqrj+JF9Rq8bf/EksakdQ9tGD3dpQr8e5hqLNm/pH6saxe
 9q6RJC0Xw/bYAoE96vSu6D+rgezy+TAr3blArAhugmeMXS6n/YJIIgep2d5bI9rufWMh
 VovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PGJF5dKqSB+KKQYLEJgSlRUAv3AoaIgySDoRGS9mRQ8=;
 b=bbUJQ7gWilnqgzoqNYPOFssQM1Gw39IpSsGTdZAxm5Pyvf0lj+sV43h8fXVDIqyTAB
 82B57XT18ehbELJJksK+0xlozCDFXx3dVchOSZSkBoUflPuzcwo3O4tiZfBFkBQ6JHZ9
 yiBQjY+6AkO3L4i8bglhg+ngPgVSEsMPZFaidb34k7XGnpAyG9yWxfc2QDoyurWlXYu7
 brXispdRODl12lebIB6koL/5OMJzhZ15OPnbQC8shIAa93LG+89ATltZPobHp2XqSboa
 IA53gOcUqGWVP3zc8PCOplMGtD1kivksRzsoLvqRDyld8jcQ0cQYLkY27p2Y2WghQAXY
 VPxA==
X-Gm-Message-State: AOAM533BzWXNrCmtjhk/GpGc9mBRGbwwzuAgX+5ZepbxZyJNC9mNnb7G
 WjIge5dTpuZolNT1stEJ0v6YXdYDV5HpRa14
X-Google-Smtp-Source: ABdhPJyiTY1NbMlgVwF4AhvRe47z8Ilms3XXJUnsGuJKHpPfOMUHectDG2xVDtWJknlySV1Vpt56Lg==
X-Received: by 2002:a05:6000:180a:: with SMTP id
 m10mr19852327wrh.215.1619972161600; 
 Sun, 02 May 2021 09:16:01 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z7sm9508056wrl.11.2021.05.02.09.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/36] target/mips: Remove spurious LOG_UNIMP of MTHC0 opcode
Date: Sun,  2 May 2021 18:15:06 +0200
Message-Id: <20210502161538.534038-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running with '-d unimp' all MTHC0 opcode executed
are logged as unimplemented... Add the proper 'return'
statement missed from commit 5204ea79ea7.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210422081055.2349216-1-f4bug@amsat.org>
---
 target/mips/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8a0a2197426..3230b2bca3b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -5945,6 +5945,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         goto cp0_unimplemented;
     }
     trace_mips_translate_c0("mthc0", register_name, reg, sel);
+    return;
 
 cp0_unimplemented:
     qemu_log_mask(LOG_UNIMP, "mthc0 %s (reg %d sel %d)\n",
-- 
2.26.3


