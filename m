Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9488469FF74
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWO-0000Ra-Uw; Wed, 22 Feb 2023 18:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWM-0000R1-LO
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWL-0005KQ-7q
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:34 -0500
Received: by mail-pl1-x629.google.com with SMTP id bh1so10787537plb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=NkGaC3LqACoIeNAU/ZTtsTTAPQ+y5Ia5cmW7XexwmK0L3AvPp9yAzYN6N8DQjU5eYT
 sEhfwlnYA75p+dRvSZxcw1Gv+bb2eoSdxj0hoVimoTGTx1X+N6sUiBgIPSOUprK8KQD+
 y0iwuiKmlZU/hcUUEutY8GPsfdfrKwfZ81B2/9cJM/wvf0ms4B7nUHt5tBUY+nfToS5N
 WS3ZLV4HQRRi2pLeyn2Ag9bbBweKt1YWFCd4lnz/pI62o0BcX8M+BOL4SgnJ1GWsuZTI
 /9ngPmU7E5/Q+dhedr5xgjvEh0nb+JS3RwlLhKKhZgqiHuvGRk8QkbFVdhDRhiVketcX
 7VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8JhNPBurv6UPBw5+T0ptsUEofBEBgdE2LEBxrO3wBY=;
 b=jlRFAiuQZQDxMSyBtfcwuO/PElxe/hyz8d93NHCawa93z7y+VgvAoOEUcJVJpI8ysL
 uYFmmfyAiALt9SPAhjpF1P9bRNAYjRQA6TgTPgnIbpueM1KSglYeM5as8hCUT6xbXjtX
 0EFXl8VB++mBx4A14CR0Je5U3AmUE7KuSevT10eqT9HFUF42yV52GQQ9uswtj3CYylEJ
 3v8LIJWVovfuzvjDkwaKFOJ4ieFLVRV3Rqy81SAtVZjMFbniPZ0q8cqnnRIKn3LtPKJa
 QM20OK2dVSySC/Rvh5SoUf4C1ya3i7AOw5xbNf/qQSkBgHZjFTqACy+mtAKfoj8YiNuc
 aznQ==
X-Gm-Message-State: AO0yUKU04WoPPYOSXa2IREOq+iitbFiEnDHPRymyVM8k9M4XUYpUUysZ
 pulCGhwVs97+at5c8gjNnulPo5Y9u5OzQOBchZk=
X-Google-Smtp-Source: AK7set/p9KndWyTqlobV0IQnIaPej5aXtKD/Oq28BS1OrSNWP1DBv+5UoB2pYkGElqxNrDA1F7MsfQ==
X-Received: by 2002:a17:90b:1e05:b0:233:d12f:f43a with SMTP id
 pg5-20020a17090b1e0500b00233d12ff43amr11717915pjb.1.1677108451644; 
 Wed, 22 Feb 2023 15:27:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/28] tcg: Add tcg_gen_movi_ptr
Date: Wed, 22 Feb 2023 13:26:57 -1000
Message-Id: <20230222232715.15034-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 839d91c0c7..66b1461caa 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1285,6 +1285,11 @@ static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
     glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
 }
 
+static inline void tcg_gen_movi_ptr(TCGv_ptr d, intptr_t s)
+{
+    glue(tcg_gen_movi_,PTR)((NAT)d, s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


