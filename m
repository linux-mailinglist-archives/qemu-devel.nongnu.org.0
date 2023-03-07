Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84796AED1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaV-00060Z-5x; Tue, 07 Mar 2023 12:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaT-0005zO-Dn
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:57 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaR-0000Cz-Um
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so12616440pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjockYhWelpkA89u8rBpdCNAuPTh1O+y0bM/jqR+q/Q=;
 b=EDCzMcJIKjVcP4YNXksm1U2VvxQTYSvdbk+q1JhqsXAMR1YAjskite80gBVZINURde
 fMhlkxALtBlw56CRG8xchi50B3uUO2r+4GB7pEgDmnZQJknWlADtYNgPRnASwAyS8VFC
 cBOaTm4UnV6PPO7zFGfJT4RATnrifEBn8YG35odb1/SQP2fcrnHEH4XHqbD9QcwQr9Bq
 R59omYH9+GrxJbeMesBbmIJ78YusNFEyxHU98DfnoQbfKICv4AHRA0BIURKEQ+sV1Skw
 +eQVJd0iZTHeqTZyvZGSN0cxl79PaaQBrJI7sYqWvFBghUFDTe40Mw/LHmQtyw4chkfR
 hG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjockYhWelpkA89u8rBpdCNAuPTh1O+y0bM/jqR+q/Q=;
 b=VrRNhmBa1afK7lvwpXvW5W8QrcMlhVeaX4gnPF47DX4yr+h8Dez0TAltIOQYHKNSMH
 revS48u/ePdCisqnJDdcsb5U8CSM8U0LulfXfu/oEco0OsK4NtZLrfY7+tR0BE52f4D9
 15VTVzHv1FsG2YNV44Hl9nHB8CxbXECrpMjyVq6tLt2DFpBiw49z+aF2MvpMC7iQtGXh
 MxzjS/RcOiFVKsTY7jjj50zFBkkzkM0KR4yJNLNItTJgzm93e0lsU7SqhfjjgyS1kmVZ
 0p+R0tFCNRUczC8clTkGN2gtHfuGRukDk7EC/JOa7AOkEA3udedJaeTwRfKB6HViwXAV
 bpnA==
X-Gm-Message-State: AO0yUKVrEK4NbGQpXwYvdkpF+Wa0OzBkgXktM/KianVSpNRahO7RsN3b
 FjRMBnhqDJ9KTtc+th/V6h77J6lkIjLQXKUcGhw=
X-Google-Smtp-Source: AK7set9X5LRmG8CG1PLSroH/7Nlxn1lfV3aMe9ePcpicWF1J9eb97+t+Hj4jOcL3oRl7B4EDX2MEHA==
X-Received: by 2002:a17:903:32c8:b0:19e:2298:c53d with SMTP id
 i8-20020a17090332c800b0019e2298c53dmr18169360plr.10.1678211934306; 
 Tue, 07 Mar 2023 09:58:54 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/67] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Tue,  7 Mar 2023 09:57:47 -0800
Message-Id: <20230307175848.2508955-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


