Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F4F53664D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:04:35 +0200 (CEST)
Received: from localhost ([::1]:42578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudO6-0007Sf-8x
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8W-0001pc-R4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:29 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8U-0005O7-Ju
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:28 -0400
Received: by mail-pg1-x536.google.com with SMTP id v15so4356157pgk.11
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frtjY4kXdf+btOwpubtlaBEs6SblJPqCp8QSyGl5a7Y=;
 b=a+PuiOW9io/F7nmg17trSxtOLBRkL7HBe3cPKNBdOjpG4r0e+gn78E/iFqfBfQUoUN
 vjbhILJXT7Z2bwm86GIyEcKrNiPdtK3XtUiy2kuBIOf2TkRTkEQErStV/XhpyLxEUweP
 IJzyH45iFaqOUiOTZCsYIT3ytLSXx1Q+23xA10MMir9zm4Jn3rRm1kxhRLpI/WqWPE1Z
 MN7JqbQXG3OKPxsvJrV0J4dD72jiDUX6CKpHUftnEO2mUa+54rabj8iB+z7LKujChYqA
 a7I/ZwNhSQCVR96ojIoZD68cYnv3Hf1cz6ekud/6CVdxY3C5FFewjB/RYbnIK8Vz3/Us
 /Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frtjY4kXdf+btOwpubtlaBEs6SblJPqCp8QSyGl5a7Y=;
 b=EcmfMpqdAIMUDG0yRVqx2PZInJH5L3Wjeo7fWkeUmKDx3MzVTAdcRRNRXyGUx7HmP6
 m9+DBU+vjAM6j9GrSbG8kYGAZ8UROTlmAIGBuXc7TWRdNqfl0+093midMsEOcUOQtjJL
 km5CJHdvZ43Z3GtSpkFTsT2zqS8fAfOAETVgkgk2pc6GkN/OxGX4eqGuI33pdgY2XDaa
 mlB9WgCkq97Kzh6ewDQuTkUGsh8JirUgxc0ap6WJVSbsORKUfa8wsCSkb1YclKuK24dx
 pZxY9IUwbkum57bFYYuoeCJCqfDzAslT+IRmhAfflTE3x6NZdD+S4W3/DUKlkh8QMFm2
 keGg==
X-Gm-Message-State: AOAM532YgNM+r05tbYLP0+0LFQELPRYfo+H4YMVWqHvfgMVSXQ+VsXAc
 Qs8xjHxZVXLDvurY3q8qGaYVado88/OjXQ==
X-Google-Smtp-Source: ABdhPJx/K7C/OZEtJQan0o/rlcw4ApUrb4OmjeS7swspWY+7SQGS1dJ4DjpU5SGt2Wat7nK6JkTh4Q==
X-Received: by 2002:a65:47ca:0:b0:3fa:e914:9643 with SMTP id
 f10-20020a6547ca000000b003fae9149643mr11383776pgs.430.1653670105884; 
 Fri, 27 May 2022 09:48:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 16/17] linux-user/strace: Adjust get_thread_area for m68k
Date: Fri, 27 May 2022 09:48:06 -0700
Message-Id: <20220527164807.135038-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Unlike i386, m68k get_thread_area has no arguments.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.list | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 278596acd1..72e17b1acf 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -384,8 +384,13 @@
 { TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_thread_area
+#if defined(TARGET_I386) && defined(TARGET_ABI32)
 { TARGET_NR_get_thread_area, "get_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
   NULL, NULL },
+#elif defined(TARGET_M68K)
+{ TARGET_NR_get_thread_area, "get_thread_area" , "%s()",
+  NULL, print_syscall_ret_addr },
+#endif
 #endif
 #ifdef TARGET_NR_gettid
 { TARGET_NR_gettid, "gettid" , "%s()", NULL, NULL },
-- 
2.34.1


