Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568744CC753
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:50:47 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsPO-0000OZ-F1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:50:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLa-0001a9-Mv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:50 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42972
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLX-00010G-UY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:50 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso5671704pjq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ngdOSpEXdyoj/2hX4DgLlWUWJ0os8VUKvzBanI2gIUE=;
 b=RvUciXShU+n6we9vfK68q8jwYeM5FPj8cKsXEPCAak2pkY/q7XSdHgZfBYla+L8ngI
 SihCSpGK5WPORFhBk6GCxInvi9Sd1CT/PYqwcl+3c3E6WX8DuxWAKt2FRzddWh57djwd
 WJIEA7DLX3Xe0wUr5XdXRRry9hMJkQNU3NQGJNSozCjns/ipXrXMxveqkkU8hghuVYr3
 yb6J+Hd9YBsjKdzWOzcdX7ZXvLmFU8jYAHddsKiwl6dC62Ddkb4SskNVg80AZwc6JuBk
 fVUrC51NIVREzSh5+7eVEMbsjEyYBgPoiUpLNuliZOVWHOduDHPhSIIMJl4DD0brhgoj
 0GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngdOSpEXdyoj/2hX4DgLlWUWJ0os8VUKvzBanI2gIUE=;
 b=xffkdUmEVPnNuErKqfaaw2QSq7MutlpqMzps+RuDCBLHBluM3szobdz/A3rGmgkU1y
 QW3mkXaXqyQDrRuQAWn34QZv32/qTvlJhf2D/2JNt0G29Zi8WdjDIPWd8YpHNiZQJH21
 wFeSXf8UDBC9hJPh0zmEylS/EtJ7t4qpqGdhWMOKiHxr0eKm/B1IQl07mtmdZtT5D25+
 2GdQz5njwVRxfiRm3JdCTky3JInCZp12lK/rWrPJaoFy/Uss7KQ8x1gGJ0JSKnuZ3YUX
 jmvPJdQJomL4S4ZuQVo4xiaAxtIexzzZdBbK2qJGWq13mgsGMNql3lTmJcYvWc6WuIj0
 /3Gg==
X-Gm-Message-State: AOAM5310T8duKQdRYyRWJNJ+n4JHHPU9whC2yXR31akQYXJD7rejusr4
 LyhBq3O6iA54kV+GgnTcHuvdYsj/IB8vHg==
X-Google-Smtp-Source: ABdhPJyCC5azTvi8VhTLNedlB0uhHNvfOt95D5vQIpipSH3X8rAaE5WyUO+hyR0SiKoAl5DXbLh/xA==
X-Received: by 2002:a17:90a:d145:b0:1bd:5400:cba9 with SMTP id
 t5-20020a17090ad14500b001bd5400cba9mr7288220pjw.232.1646340396112; 
 Thu, 03 Mar 2022 12:46:36 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/nios2: Special case ipending in rdctl and wrctl
Date: Thu,  3 Mar 2022 10:46:23 -1000
Message-Id: <20220303204624.468786-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was never correct to be able to write to ipending.
Until the rest of the irq code is tidied, the read of
ipending will generate an "unnecessary" mask.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 52965ba17e..a5f8d20729 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -452,6 +452,17 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
     }
 
     switch (instr.imm5 + CR_BASE) {
+    case CR_IPENDING:
+        /*
+         * The value of the ipending register is synthetic.
+         * In hw, this is the AND of a set of hardware irq lines
+         * with the ienable register.  In qemu, we re-use the space
+         * of CR_IPENDING to store the set of irq lines, and so we
+         * must perform the AND here, and anywhere else we need the
+         * guest value of ipending.
+         */
+        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        break;
     default:
         tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
         break;
@@ -477,6 +488,9 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     case CR_TLBMISC:
         gen_helper_mmu_write_tlbmisc(cpu_env, v);
         break;
+    case CR_IPENDING:
+        /* ipending is read only, writes ignored. */
+        break;
     default:
         tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
         break;
-- 
2.25.1


