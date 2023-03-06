Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A46AB3E4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyui-00063g-Gs; Sun, 05 Mar 2023 19:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytu-0004VM-KN
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:27 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyts-0006ia-Tk
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:26 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p6so8576300plf.0
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfSIcs2kYXJieeaERSRfIUg2bVd+2Gvz3YbqekvGrNg=;
 b=DXkHILNYmJAm6a1Rkdy8nKjh+B6KXHGCNXhI6xRUyn+LWDpkp6Idy2TLxQ8IS9Q/DO
 rjm/u1iAX98uajN29YoVm2xfCToDqD2RLqu7ZulYqNISgpFw2WGku8je44nC9rX12Gek
 Bh4KUn8kLo2GnH13o/Ig5h5cwgNQJ9QWdN+2CAUEcBybcCgw1LJYCv/lNZDF3a/SMIQb
 xe14cbrfj616rvbaH/AEFs8pJvl7Zt6kv/jwarAHEnLGCYwmoKZVFVesIWRgIa0o1UoO
 IIImavXK7rt2W1u2yPi5SshOebw8LAtUCuVl/pJ6p9Aif/1tLhYfDwqFMuXEBsVf5Zch
 STow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfSIcs2kYXJieeaERSRfIUg2bVd+2Gvz3YbqekvGrNg=;
 b=ZnvQXQgzHF1xCqNhdnk7FBIfKLIOTwNkpTHVvjWzJDh4a1XfNXDkEV7oqNZN2ESI2Q
 F9vjW8fxyu/2kYPFzyNVPuZ3WfErHRNdS9kCeDErCO0i+uz7GVOtl5rly5i3yuuSXm8M
 PIL28Kho3OFReRDVfLLe10dfrgb33P7gtNUp946EhsoMKPALuytWmXA73QbM0cmgQajb
 6qrLApTK1VRCwgHxS4bxQwsKLaeJ9JjhPPFhNe8rnZ+/1DJ0k9a3ZBvWpXCfWVxL70k6
 733hhv5/OCYD14TNEeeTQP1E/DfBTR92D/ghlv4e2xa0U9xpiNonYlOVBRXsh1Qb/kGW
 GJGg==
X-Gm-Message-State: AO0yUKWU3WGsLh05Pt0XC06rfe8sZwa0tF8e+VKaX+gIEXq78oQHwEIs
 1BntJv5DII0ddrmOLU/EmcGmQ+PFZzxd2pC1cHjczw==
X-Google-Smtp-Source: AK7set+V0gEGv6s+kdCaKaI+xCqfY7KkIFkJb2L/jsSNOeHLyRqv+rzLG4bj0dB7yIlK2MmvCR2QQQ==
X-Received: by 2002:a17:90b:38d0:b0:237:24eb:99d8 with SMTP id
 nn16-20020a17090b38d000b0023724eb99d8mr9905175pjb.19.1678063222504; 
 Sun, 05 Mar 2023 16:40:22 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 30/84] target/avr: Drop R from trans_COM
Date: Sun,  5 Mar 2023 16:39:00 -0800
Message-Id: <20230306003954.1866998-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

This variable is not used, only allocated and freed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e7f0e2bbe3..4f8112c3e6 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -670,7 +670,6 @@ static bool trans_EOR(DisasContext *ctx, arg_EOR *a)
 static bool trans_COM(DisasContext *ctx, arg_COM *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv R = tcg_temp_new_i32();
 
     tcg_gen_xori_tl(Rd, Rd, 0xff);
 
@@ -678,9 +677,6 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
     tcg_gen_movi_tl(cpu_Cf, 1); /* Cf = 1 */
     tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
     gen_ZNSf(Rd);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
-- 
2.34.1


