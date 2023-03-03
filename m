Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D606AA129
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxP-0004bv-Et; Fri, 03 Mar 2023 16:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxK-0004bQ-DT; Fri, 03 Mar 2023 16:28:46 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxI-00028n-IZ; Fri, 03 Mar 2023 16:28:45 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 f19-20020a9d5f13000000b00693ce5a2f3eso2184739oti.8; 
 Fri, 03 Mar 2023 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eaiwNziqNZ9tzBgMhv3+qNMBuzTH6Hd0kPNNVktQvA=;
 b=M557FZ+zNUnOvHnoQJLZdp4QhUZcW8xbxL6f20/riCG3K6fKEVhE9qD4pZavm9LliN
 oHj06Et4bocHls7TbzGwZZAjHfxQhW+OH47wEcHGcxZuFIVbMTP2r0HxAiVnPM6Mkkp1
 QV8iiSX369+58zL+bKd+/pA7J85LPFkdhKNFAGPIEbuvnukLQ9gGK64YpdF+s2PKUjNi
 4XUPC9KAdFFd1XTOKYyiCLujJPrnNJZOocJP3dHu4AeuySgQLtiE9+1cwMj8Aqcx8SrD
 mnYp98YQ6oAWrFUKCcxT4M2fcI1S2LQbOVbRMmyXPKH4Po8hGCy+114Gfdpwnf4l6x7+
 WYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eaiwNziqNZ9tzBgMhv3+qNMBuzTH6Hd0kPNNVktQvA=;
 b=3mz+MaTt5o7ooA1l2MK/RdJDPIAXoO3MA1pWSlQCrGTTCSgYdQ2DdK4M97Pyh8LEke
 Xl/BguqyUfipoY8o9HRE/y43sfmiTzuomxQi6Ms64g8nTH6dSeSujDMmfGCkd+42GC0n
 aJlvcjHdfKs86XqRgzFm3sX3QehU0D39p5dW9bRIfNyx5jfLL7cjNAEatJANov0In8S1
 1VY99Go+AyWcn6/APQec/7b183LalmU4JVYIdaqUfwaT/vCHES6wfSK/r8XFM3VxK5MJ
 rFjDyBQVlsg5pVcfDNprge+wHb5HPAmLYdcDGQCBCdqQyeBuXrDDlTHUGtozgAS5j0lA
 fiOg==
X-Gm-Message-State: AO0yUKXnX031mCtncJVSejIhnEEYcNazgpHQEjFXeAMXVMWSQWWBzywi
 vrkehXopX6G9to7ixqlD9g0LCNh0G34=
X-Google-Smtp-Source: AK7set8WkDbZG7dATXcUlm4K0+/1rGBvGFnQmGhvo61KsVbWGAgTllp7yWnhLIyQ2Ku2oaUZRhvdMg==
X-Received: by 2002:a9d:705c:0:b0:68b:bf5e:492c with SMTP id
 x28-20020a9d705c000000b0068bbf5e492cmr1380870otj.28.1677878922922; 
 Fri, 03 Mar 2023 13:28:42 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/5] target/ppc/translate: Add dummy implementation for dcblc
 instruction
Date: Fri,  3 Mar 2023 18:28:27 -0300
Message-Id: <20230303212831.830278-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
References: <20230303212831.830278-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The dcblc instruction is used by u-boot in mpc85xx/start.S. Without it,
an illegal istruction exception is generated very early in the boot
process where the processor is not yet able to handle exceptions. See:

https://github.com/u-boot/u-boot/blob/v2023.01/arch/powerpc/cpu/mpc85xx/start.S#L1840

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230130184950.5241-1-shentey@gmail.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2956021e89..37b67d5175 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5253,6 +5253,14 @@ static void gen_dcbtls(DisasContext *ctx)
     tcg_temp_free(t0);
 }
 
+/* dcblc */
+static void gen_dcblc(DisasContext *ctx)
+{
+    /*
+     * interpreted as no-op
+     */
+}
+
 /* dcbz */
 static void gen_dcbz(DisasContext *ctx)
 {
@@ -6824,6 +6832,7 @@ GEN_HANDLER_E(dcbtep, 0x1F, 0x1F, 0x09, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER(dcbtst, 0x1F, 0x16, 0x07, 0x00000001, PPC_CACHE),
 GEN_HANDLER_E(dcbtstep, 0x1F, 0x1F, 0x07, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(dcbtls, 0x1F, 0x06, 0x05, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
+GEN_HANDLER_E(dcblc, 0x1F, 0x06, 0x0c, 0x02000001, PPC_BOOKE, PPC2_BOOKE206),
 GEN_HANDLER(dcbz, 0x1F, 0x16, 0x1F, 0x03C00001, PPC_CACHE_DCBZ),
 GEN_HANDLER_E(dcbzep, 0x1F, 0x1F, 0x1F, 0x03C00001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER(dst, 0x1F, 0x16, 0x0A, 0x01800001, PPC_ALTIVEC),
-- 
2.39.2


