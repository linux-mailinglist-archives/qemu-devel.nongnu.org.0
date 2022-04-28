Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35088513809
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:18:12 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5uD-0000ZC-Je
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jp-0005X5-Dk
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jm-0006NI-Q4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso3144899wml.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ibs0YQIPKnCUXyTop+YLhuEAiwNbq0oQD0taXCbtZ/w=;
 b=VEfGJcqCiUn7NmL3nqW85RIff2jLVxqvSoAvCtgS4Ik1RbEUzWDZeRM+1vhQcJzRb0
 w2FHAx4fSHMSczKkfnMEgNZ1EovyeyTv4FndJanAxM1U8ixeUqVdfuukMCG3dsxr32JD
 rRzSUzibx5ZAD7zoVWU8iD18oIDIvv0LsDriGpJisHcEzYHoG9Iv+nHnU1H9oc4csxZE
 y2xVIu7YDjUuojHas6+m8cL6zmU9P6zYEDN9KuCv+FzMP18AGwXTy5IMWeR9dFqCB6yu
 AdfO00xRpkdaOvmaKpuiOvTr8eCl/O68pMm0LVAEdMF24Vv2p6u1O8UiCTewiYVOlllM
 fiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ibs0YQIPKnCUXyTop+YLhuEAiwNbq0oQD0taXCbtZ/w=;
 b=I4YG5natJHtBGRp2xA8VVlLFXYFzv5qD6I/UM2AXBRoVxuOecAGYk/rsT9+Qp/TYN8
 S7lmW6NGX11Jn0Xx7WznBJpsCXzlGid6SIUTUKhnG0WFu9dv7oHTTPt1mA4aBWLvIRCR
 efdkEZ18hNQwyoFcfHY9wtEp/bBnqcj1dA+o8fOb1Y/mJdNDvQ95HKU2ss9fgOfUs4cX
 /+88JnsyudcpiHzhKuTvm+1zXZcZSBTqHXiERLgAT88X2lw11xPEwdVvYN4CDyhymcsS
 69iX2JGIp/8F+tKVrjeYqy7ZxuBnqQMPOxgYgz1p/y5P58twk7vFSu3RGxxm4DygVH1V
 7Vkg==
X-Gm-Message-State: AOAM532TnXjOYiLHwunI60VNugBfxhA8budjaGaKyUdzSAsqr2lAvBE0
 NWkgHh5ESGFui4cYnt1fh7eYXRZOCNQjTg==
X-Google-Smtp-Source: ABdhPJyWtH8zb/nJwRtaBtE099bVLXaIZPlPKHNvLakZ8ZphmcHTKnYVsbJdMmD959tJgqd9E4wVuA==
X-Received: by 2002:a05:600c:3493:b0:38e:bbbb:26f7 with SMTP id
 a19-20020a05600c349300b0038ebbbb26f7mr31162409wmq.114.1651156828912; 
 Thu, 28 Apr 2022 07:40:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/54] target/arm: Use tcg_constant for gen_srs
Date: Thu, 28 Apr 2022 15:39:31 +0100
Message-Id: <20220428143958.2451229-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-28-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e4f3db26f66..8476f259fcc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5137,12 +5137,10 @@ static void gen_srs(DisasContext *s,
     }
 
     addr = tcg_temp_new_i32();
-    tmp = tcg_const_i32(mode);
     /* get_r13_banked() will raise an exception if called from System mode */
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_get_r13_banked(addr, cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_get_r13_banked(addr, cpu_env, tcg_constant_i32(mode));
     switch (amode) {
     case 0: /* DA */
         offset = -4;
@@ -5185,9 +5183,7 @@ static void gen_srs(DisasContext *s,
             abort();
         }
         tcg_gen_addi_i32(addr, addr, offset);
-        tmp = tcg_const_i32(mode);
-        gen_helper_set_r13_banked(cpu_env, tmp, addr);
-        tcg_temp_free_i32(tmp);
+        gen_helper_set_r13_banked(cpu_env, tcg_constant_i32(mode), addr);
     }
     tcg_temp_free_i32(addr);
     s->base.is_jmp = DISAS_UPDATE_EXIT;
-- 
2.25.1


