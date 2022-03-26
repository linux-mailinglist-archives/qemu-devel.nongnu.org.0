Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BF4E811E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:36:09 +0100 (CET)
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6aO-0004f8-KU
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:36:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QW-00071m-7F
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:56 -0400
Received: from [2001:4860:4864:20::2d] (port=37200
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QT-0005Ln-9G
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:55 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-dee0378ce7so360212fac.4
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TOJF6hs6MIWp7u5IOBbMVU2hqWWBLm4vep8AaaojE1I=;
 b=fBlXKjbR5gpIbkK9Q5Knhcq7zY+B5/ShAUt1I6RcwgleJHdeakoTeXP6hrUEXvSu/L
 Gaotd8+EXHS34bzIpKHqoNKqPNr2CCaXE+Hl77TGRa29SZ7vdzLmT+5YQsL2B5OFoeEB
 fexMjxNFrhl6bfcxsK82V7AUgcGGXnJyhgJWLSZpA4C3em00mjLAliomKegrmInuHeyV
 h5m62/aEc4bc5FADkyHCSSQLKIVFVVU8j64C+OJXY9+4T7ndcdHS9eXxOcWW0yEFdL1/
 8k2Qu0/lYphUC37cknd7r5Bgfi+OPVkdSIeFy2HxC8tsUxYndZ0zwMUV41PPP4vpl8Tc
 +vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TOJF6hs6MIWp7u5IOBbMVU2hqWWBLm4vep8AaaojE1I=;
 b=uydTUs8fqbTb2jZyxdUq4pDEt/AIEipiJskRRHUPBvDkVH33C8JkTEniq8VhXZRkmX
 YoHznifk3GT0cSKyWPCiUiYffngZ2HDixeVd/J1X93VLZ4OA+vhwA5ciyp2Jm0+EDYKv
 US9YbSlx8ypiWAKrqEFx0+besFaYegPux+ww7mnBBJ0fPwloJetpl15E4msOuwzcRdIt
 dqaguHlC8IcarDMzcPc30pUc7ql0F1MjhCedAvTofF3vyDtLdoXMNiWcF71xZBrP7jK6
 ws5b77DuLuJ2u0GcUiTfsAVWVKnAWbHDvCK90wULCgDI6eUrEbTQbai3lGjAFTDZG/fb
 2wgw==
X-Gm-Message-State: AOAM530nUTKdKc+8v8q5qYi00uR9rlGlgSDWGtp5X5xWYZ041eUf3Rhu
 Esw0MhQA5Gy6ArlQw2iKu8qiyRD4JLaa+Jqg
X-Google-Smtp-Source: ABdhPJwK2d9IuQc+YfxbiUTtGTFC3kQ0GnmHLaF2RDQRiFtHykkGBLCVwie+weoG+nEjwNlxFeQ5dA==
X-Received: by 2002:a05:6870:9893:b0:d2:87e4:c71c with SMTP id
 eg19-20020a056870989300b000d287e4c71cmr7126176oab.132.1648301152316; 
 Sat, 26 Mar 2022 06:25:52 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] linux-user/nios2: Remove do_sigreturn
Date: Sat, 26 Mar 2022 07:24:58 -0600
Message-Id: <20220326132534.543738-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no sigreturn syscall, only rt_sigreturn.
This function is unused.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/signal.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
index 517cd39270..133bc05673 100644
--- a/linux-user/nios2/signal.c
+++ b/linux-user/nios2/signal.c
@@ -185,13 +185,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
-long do_sigreturn(CPUNios2State *env)
-{
-    trace_user_do_sigreturn(env, 0);
-    qemu_log_mask(LOG_UNIMP, "do_sigreturn: not implemented\n");
-    return -TARGET_ENOSYS;
-}
-
 long do_rt_sigreturn(CPUNios2State *env)
 {
     /* Verify, can we follow the stack back */
-- 
2.25.1


