Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445893C3F74
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:17:46 +0200 (CEST)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gpd-0000Zw-B4
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZt-0007Th-Rz
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZs-00011U-7c
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id n33so9971628wms.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Trkx+yVXbGbO/3qpNg9NqMMf32IKPJHWstTgFyfkCA4=;
 b=KMnIUKv56OsQiY76irBGOpPJjlwql7KWx5XXBHOBkrJOnSj2GLZIFDHXgkK+aIZ1ZR
 FokF4aSyphj0AuQwl2nRAAn2BMLfhoBpRb24Fh0JI+SFu/Kqwc4MVWzqX26cegrjrpqm
 SuudtHi09KpZ16fB9bO4QwW6xHYZxxB2CncZIMDzAoBMxTchdH9mvPL9tjyyZW75DgLw
 B+fmgOkMrKQC/Whoq1/tCWRmCSFPHR5ED+8Yiob6x9X2ecKzeqygp96AP7k6eDfEO/6U
 1uhErVMznxK1k7pzYuaS1ty+RZJz3YMje1X7rzmnVQ8Ol/VeMfGQ/8Tcy3KhKufQkWmB
 jS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Trkx+yVXbGbO/3qpNg9NqMMf32IKPJHWstTgFyfkCA4=;
 b=Q9g0NE7LMzDuW0VzFv6xGhldQ4t0K72hGaQj8Bpm/aP6oVNESWrvkG2aRmLb9ozSVx
 9iJSK6mDaF6jw+2qzs2/befYIS9Vsf/e0NyeAfrLEwUH/MVCh08erC0grERbWCuR5oAU
 aQEGcmRDwktXCZP75ofmikSCLd5Yf1OZ1Wyzl/S2V4+7fWxsgG1wR8wLEbeIYl5V2lzP
 7+W8XZtFqGINTYPmZVWUkYv0YthSc2GfNG33DOsL7t6rMYaGTUE0tExKB+OFEtXIXSXM
 wh01ebrwkNtGo4aJZmrzAg5N3Pug8ejNC41T13wBROGxjSqAw5/yYQgDPIak259XEKWN
 P8aQ==
X-Gm-Message-State: AOAM533op6ntl6mjneij/838tfxdFsd8TRPA0UAOTvCIYQT82vOiqSWL
 nxqlZRl1P8IjTgUFcY/CM2+coqV0hGLzp/Fc
X-Google-Smtp-Source: ABdhPJzXNdHxK5s6kOlWoNXNGPZbx5tvC768K/YDKmXukLKdV1HQ508FVZ7pEcHoOLqi92nf0IgSRg==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr6614993wmh.44.1626037285375; 
 Sun, 11 Jul 2021 14:01:25 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id s6sm1736564wrt.45.2021.07.11.14.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] target/mips/tx79: Introduce SQ opcode (Store Quadword)
Date: Sun, 11 Jul 2021 23:00:09 +0200
Message-Id: <20210711210016.2710100-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the SQ opcode (Store Quadword).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-27-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  1 +
 target/mips/tcg/tx79_translate.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 0af5c6d0ed1..03a25a5096d 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -70,3 +70,4 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
+SQ              011111 ..... ..... ................     @ldst
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index d9193b4d86e..395d6afa1f1 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -369,6 +369,33 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
+static bool trans_SQ(DisasContext *ctx, arg_itype *a)
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv addr = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, addr, a->base, a->offset);
+    /*
+     * Clear least-significant four bits of the effective
+     * address, effectively creating an aligned address.
+     */
+    tcg_gen_andi_tl(addr, addr, ~0xf);
+
+    /* Lower half */
+    gen_load_gpr(t0, a->rt);
+    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+
+    /* Upper half */
+    tcg_gen_addi_i64(addr, addr, 8);
+    gen_load_gpr_hi(t0, a->rt);
+    tcg_gen_qemu_st_i64(t0, addr, ctx->mem_idx, MO_TEQ);
+
+    tcg_temp_free(addr);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.31.1


