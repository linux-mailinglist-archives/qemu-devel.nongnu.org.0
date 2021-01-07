Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D912EE932
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:51:39 +0100 (CET)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe82-0005O1-Fj
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjY-0002MP-KG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdjX-0005yl-5Q
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:26:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id r4so6806036wmh.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lMAe3ErcpY6GT5lLpyLZ/gixtllrok8K5UMFavL1mtI=;
 b=PWPFGmWNroy2+z8o046XV+RRv5ussCHdG8BVtGR00vYOqM9oX9LgL8nM6wOfr7q+9Y
 nzfGMFsMNq7GXwYqFxprRvZ3rQttFpo1vdLm08aKLmNfHhcpdVwN5L/4UBReJ6TY63KQ
 WWzsliI/pIz/Bx05xQ4XrJdUJHPHHq0unkex/6xe2UnUtwXlMMIT9E/QZrxtxkot08oA
 iaTh7YelP6zcHWaTMh2VFmgUOCeqhAIIAE80zpOr4LYQBj4KEBvhTp6Ei9Idq0zX6iDE
 +ZK2ZCgJ90WtNKH4N0IbrZCKk1Vpmbml60Vu0AR/u39KP11q2FrwE9jZvBbZ/2BNJqg0
 F2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lMAe3ErcpY6GT5lLpyLZ/gixtllrok8K5UMFavL1mtI=;
 b=JxwKavPnjiO2WWXFoZU+xfzKsYw7JJYECQIT1xt7yUtdxhkbwK0t31XVde+gyPuuZI
 9OY19ei64JHoYPaw+jtqo2QbpgAh/skp3v0Hf6nLeQJBvyuydTPuN2htwZNOM+btUHYN
 sR6ezrRkFnKQEJqVYi6PQKAIp6RzzGOxSXaLz+83TQMizxQHRl2keDNZXRoxYSPE8lRh
 TbvNriCmeheGqgYladt52WYjRwqWwGSfDXInhJOmztCXg4jtqlHyxkSXeFET1pPG9KUx
 QSHxSkQHIeyJwImm5P98OT0SKXHfHHriPNkKXZ5ldGmPbAVXAJ63afPyzKJKZ9/6UqWq
 5zbQ==
X-Gm-Message-State: AOAM532cIZivYVTfXB4HIpIH0vurClB1//xt1LtJXy92lJr7I94SzRju
 5Q9mqMoT2WaWuhyR9eEiEx1EEtb+uVI=
X-Google-Smtp-Source: ABdhPJyGDwF7m1uVQYBA4ggoEa6lGAw05oUCdgZak1buPwMk2BLm6IfyffQb+MhOHXU/UoyBigfjwQ==
X-Received: by 2002:a05:600c:d8:: with SMTP id
 u24mr499760wmm.103.1610058377747; 
 Thu, 07 Jan 2021 14:26:17 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i7sm10218260wrv.12.2021.01.07.14.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:26:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/66] target/mips: Use CP0_Config3 to set MIPS_HFLAG_MSA
Date: Thu,  7 Jan 2021 23:22:26 +0100
Message-Id: <20210107222253.20382-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA presence is expressed by the MSAP bit of CP0_Config3.
We don't need to check anything else.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20201208003702.4088927-4-f4bug@amsat.org>
---
 target/mips/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 9a7698019e2..1048781bcf4 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -378,7 +378,7 @@ static inline void compute_hflags(CPUMIPSState *env)
             env->hflags |= MIPS_HFLAG_COP1X;
         }
     }
-    if (env->insn_flags & ASE_MSA) {
+    if (ase_msa_available(env)) {
         if (env->CP0_Config5 & (1 << CP0C5_MSAEn)) {
             env->hflags |= MIPS_HFLAG_MSA;
         }
-- 
2.26.2


