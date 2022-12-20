Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C396A6522C4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dik-0003i0-9C; Tue, 20 Dec 2022 09:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dia-0003eX-Bx
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:46 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7diY-0000uo-Fc
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso8949234wmp.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtKJes66/4jOGZqiJaNKdd7x6uDxsmpWf7n+U2lM5lE=;
 b=NzqVb3JTffWzhT7FSm+CBjrpFGKmGH60tPLlcLI0E7y0g5l9zRMn+cSPiKjwVZksNC
 B7oyrxP44J13H0v/qFYExs4JWtee0zDpHpkmv+BM3SxtGr/KL0NWO1qjXxJxy4OqsjBT
 BfmoXWH5MSQgj/gO83QZo66/A7nqWTNG40Qf9GWv+PYBK/zqT/XasBlLb0rhakwdPFyD
 1N1FC9ZBFvhwnmbALrWALRi1MncrHZqOjjZ4nPbWyuRwS+JChsPswgTH6iOsKPNinWll
 fzh5sDRhC94BI9/zzzLCHi1Yjl2r7mLvZH0fHIZ1CmlsROM93OOPNVpz5h0/u6LH3+bU
 LHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtKJes66/4jOGZqiJaNKdd7x6uDxsmpWf7n+U2lM5lE=;
 b=McxwD+1Lk+pQ/YWt6GbDe0iMBdu6bOofBf61802kKSvIZTpo7zusDz+/CecK4NKOf1
 ewWpU7soXaPn/ym/PxGB9navHaitkwkhPsP5azCaa8llMT9YM2bME0YoBnUqlhpy39uI
 0FRacnSxv5C2XOOsesukxH3S76NQD1Z4JaVFvJOtWOf8of7GQaM6D3cGdZQpYw4XY6/w
 YujjmtECQ2MBI/sn4tRdKqpumJwcSuUZlzKv37ingsAjrifWhjpvOjinbBUdz3EWLV3h
 xbCebd/JL9S1hkx6OS6BdRkuF9Go6vlfsJZ9n+r8CTE7XTyh0+Fhqo/d+sIxKw/0Au0M
 WX9g==
X-Gm-Message-State: AFqh2kpSTRqZfc5/K8H1fGbqKWdCII7JA1uV74GaZVTf/gMTmBEEe9Wp
 Rd/PME8gL+poc2XQn2FMBRUcTnheggifZ8AgOWc=
X-Google-Smtp-Source: AMrXdXu6W4jBstWrKM+QE6scUoWOSzbL52dvRkQ55mXgZDBhqJSkHFLdm6Bfp2G+3ZTef2EZDHFKdw==
X-Received: by 2002:a05:600c:3d96:b0:3d2:2105:1761 with SMTP id
 bi22-20020a05600c3d9600b003d221051761mr1806999wmb.25.1671546939688; 
 Tue, 20 Dec 2022 06:35:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003a3170a7af9sm15867920wml.4.2022.12.20.06.35.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:35:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] tcg: Silent -Wmissing-field-initializers warning
Date: Tue, 20 Dec 2022 15:35:30 +0100
Message-Id: <20221220143532.24958-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220143532.24958-1-philmd@linaro.org>
References: <20221220143532.24958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Silent when compiling with -Wextra:

  tcg/i386/tcg-target.opc.h:34:1: warning: missing field 'args_ct' initializer [-Wmissing-field-initializers]
  DEF(x86_punpckl_vec, 1, 2, 0, IMPLVEC)
  ^
  ../tcg/tcg-common.c:30:66: note: expanded from macro 'DEF'
         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
                                                                 ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index aa0c4f60c9..35e7616ae9 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -27,7 +27,7 @@
 
 TCGOpDef tcg_op_defs[] = {
 #define DEF(s, oargs, iargs, cargs, flags) \
-         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags },
+         { #s, oargs, iargs, cargs, iargs + oargs + cargs, flags, NULL },
 #include "tcg/tcg-opc.h"
 #undef DEF
 };
-- 
2.38.1


