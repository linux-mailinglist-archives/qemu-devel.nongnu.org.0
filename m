Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65643445E94
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:26:26 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mips1-0005Pt-FK
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplj-0004Gl-CD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:56 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplg-00043m-Hw
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:55 -0400
Received: by mail-io1-xd34.google.com with SMTP id n128so9290814iod.9
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=5qxLB4ZdqD/SJBGHlPvaveJoxwDCsTLPc1BgkXHsVd66IEUWrWYpJqlAKHBi2XLhXA
 aeLFmEiuuPW1DoxMSihZoZpe3HRGloi0gRJwlZ4ivjG5xeX27kW2gUqOEk8fWEnQ2twq
 MVRU4QT6UluKanUDEovoM4JeFyeWe4g+e4svjuI8dM842OxeVTG10vsgcimkxulxt4sb
 dkk7Qc8Mbwt/gUm/W/4piTpofMPWHD/mTQZWvKUJkbUwYSGtR9z/9lJMaC6B0qGaB5Kx
 VDkqyQyVsY9Spop+JbD1GdduDJytNRuFX4bSe8+8Sk+KM004/ZzCdBBde8P/rwEEIkI8
 taRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUhiVOQnmpNFSdmZg3CHyQkzJYfHEf7WcwU0TPM0Y70=;
 b=eWRzzwYseB5GHnYDY80wpkWvxDjFwrQebBBUU47bbHNksMHNH9eOCc96MBtmufpM0F
 TtJa8G1gJg+j1vrCcCSjfu7Z5uYdVZzseXc3a1WnBXCoN1IprodlmYWl441POL27yjGa
 HOXsp/SaCDbGc07uNKdevXiKAbr3y7sY2p+pCUKx5G2QoFnyCzisxU8ARNTVV72HqgLb
 a9ptXO+f/0N/ocIlLYrOrWB32ODSC98if+l4I3keboSKlXEAgRvuW0zfkiEt9P7q/cfx
 1URl5q8CPB5voiFA96a6qkcA7lP7ACywktUel/d8cGdJGCNl5txhXTV8m/LceIUD2ztl
 bKyA==
X-Gm-Message-State: AOAM532hkkTO8zezjcDWPOQBkufoOs43kt2ZivLXXm0LfI1oYb0R9sN5
 Q/AWL/P1AmC2bybpTo/G5IMKxA9PgftC3w==
X-Google-Smtp-Source: ABdhPJyvL+2Tm/sSUxGF6AVJBfltr0yDymFvwceUglM2QXjAVc/Y5dLIH+O6iO9zdLRCnuFys20+6w==
X-Received: by 2002:a02:84ec:: with SMTP id f99mr7027850jai.122.1636082390824; 
 Thu, 04 Nov 2021 20:19:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:50 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/36] bsd-user/i386/target_arch_signal.h: use new
 target_os_ucontext.h
Date: Thu,  4 Nov 2021 21:18:46 -0600
Message-Id: <20211105031917.87837-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211105031917.87837-1-imp@bsdimp.com>
References: <20211105031917.87837-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_signal.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
index e262667bda..bf7263c4f8 100644
--- a/bsd-user/i386/target_arch_signal.h
+++ b/bsd-user/i386/target_arch_signal.h
@@ -30,14 +30,7 @@
 typedef struct target_mcontext {
 } target_mcontext_t;
 
-typedef struct target_ucontext {
-    target_sigset_t   uc_sigmask;
-    target_mcontext_t uc_mcontext;
-    abi_ulong         uc_link;
-    target_stack_t    uc_stack;
-    int32_t           uc_flags;
-    int32_t         __spare__[4];
-} target_ucontext_t;
+#include "target_os_ucontext.h"
 
 struct target_sigframe {
     abi_ulong   sf_signum;
-- 
2.33.0


