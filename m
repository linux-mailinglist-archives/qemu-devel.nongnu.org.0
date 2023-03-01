Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9926A65F0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf6-00020W-ID; Tue, 28 Feb 2023 21:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf0-0001Rl-0K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:44 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCey-00039T-BT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:41 -0500
Received: by mail-pl1-x636.google.com with SMTP id z2so12529695plf.12
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4agBn68Y8gdxvYT6Yik1Q+P2GqHDnoSblHlhOryqMg=;
 b=eDGnvRJn7iEuXOR138DYkDiOhoTVtkES79gAjmjBPl8ZgZKeRaX8x7DOX1kN0vQepV
 ytNKALUuMEhn2p9eLboBfyXcu5bcTuvNOX89DXOIMJf8B7GixzdF2ippv7A0byO16h5T
 nud+6EI+7tBwcEUc8SShxDbCxas5zjtL04WsO1Qp6TvSICAjNazRxs1IulsYoMBIZXd0
 vtvQWI6O2a63qBR7zyPqX/eDqI7vM9FCpnKlyw2ayQTYyes3HuUCfhPpJe4+QfK6y8ug
 Q9F1CpN/91sJqGpu/hwuvKnWVHUoS4OEiOprjYompbiVB9pOcbaP7djBbWWjDN845AIG
 KGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4agBn68Y8gdxvYT6Yik1Q+P2GqHDnoSblHlhOryqMg=;
 b=Tavi5Si/rmw5Rvu50BAYdcOcPMq9EW9jOnT3yWFET+YpWzCXNFcWMhpa8kS3QGxRo1
 886bWZ2rN5Qp4ROMS410kCbLlokObhd+m1s8adrp+1GImRPVA332AvAGD62QkbyYCVPS
 93tFYQTPbleQcKRw/fvmf1bj9mzESZZBeh71GjwF34o/5D1yv/LMkDmBHJoO8f7BuHut
 ajuo8zfiQpt6XpsOlrMBVzDwL5W+TUzuSEGlk7ar3FHvhonKIpsyDDUNW57bqN9cqm7+
 0dzQDw3d4ywlXtvzRMCsuQ/UL3R8yUJHfNnu96TwQJn6rodrFH9NNAV7qWgxDEmkmuX2
 CjCw==
X-Gm-Message-State: AO0yUKVlmAN8+E8AabCd3Z85PoCG2COUiipf7tnSITUxlfNLy/Q4b1GU
 gpoM6R2huHla7m87Q0IunScZULf2a6D9P9yZG3A=
X-Google-Smtp-Source: AK7set9jfMw88VjHB7N51xJ1SuTtFSMu1VyLxlHpkjs8hq3pZ8Ur+Xk8mZX03K+MgiicuH/ayMof6g==
X-Received: by 2002:a17:902:e806:b0:19a:9897:461 with SMTP id
 u6-20020a170902e80600b0019a98970461mr5752748plg.52.1677639459464; 
 Tue, 28 Feb 2023 18:57:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/62] include/exec: Remove `tb_pc()`
Date: Tue, 28 Feb 2023 16:56:12 -1000
Message-Id: <20230301025643.1227244-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-28-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 6af001bfde..e09254333d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -619,13 +619,6 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
     return qatomic_read(&tb->cflags);
 }
 
-/* Hide the read to avoid ifdefs for CF_PCREL. */
-static inline target_ulong tb_pc(const TranslationBlock *tb)
-{
-    assert(!(tb_cflags(tb) & CF_PCREL));
-    return tb->pc;
-}
-
 static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1


