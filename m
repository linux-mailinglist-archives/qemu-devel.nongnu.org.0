Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3F65F26C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTM2-0000aH-Cx; Thu, 05 Jan 2023 11:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLz-0000Wc-WA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:32 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0007Nm-8o
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:31 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1776475wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0ayPkdxL46XexnzpSXNyqqZUrm3nHdGW7BqfJTrIiyQ=;
 b=z7NRP06DQkj+cy/2LKOW04y6z2BTqgon7pm4YonyqyR8qjV9Pv6fg3cgtTRCPysfSe
 hbHojJxu+TXBON9CYQCYAvCfN0V7X/F6EXMfFsSrVBu9YDqZOTLzPI2fxqGn3sIAp8bC
 Y8ez7CHYnpRdvxykgdXkAAyhDVPndYXTWISWIk5gPdQLlQJnpozCTNPqih2deY9VN1nr
 wsfCAjqM4wZX3RsG9Prnfnnhpk/NhhQsojSub47qTF7fKT4oZB4M1CAZOdEcKFJzuOQY
 LhzTRDiE5a3TryyksOLWJSW5beRahy0Tr5LoEOQ7JFzD9tzbrQYMxQP2D5vXlR08s0hy
 WwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ayPkdxL46XexnzpSXNyqqZUrm3nHdGW7BqfJTrIiyQ=;
 b=IVo9hbUtBv8jF8CgFtTqt7NGT+ZfeWg84L2LzI6NMRVQZ0rqRofMGhuwoDhqJa5nE3
 vyisCCefo3Khe3TsWdXAu00RvaETrrWiLOr1NHZWpWwqW+DBKOW42q4kJlahPAyRxvQq
 y+ZnIXsSfSwKAfE2haKoDc4aj4KTa45hXkhjERTzTou06TWgUvvdq7o1dMDiicMLwn1I
 amUiJv3KhLXwWdthyjTqHMay8t1CHwVJSKjQA0FwgFAsMW/rm0U0WkFqUGHqJ+oyN5LU
 9Rw6rpiTa8pEvn97yvpSahv4DcgJ7B0yl8ABhzs3Oseg9ysyv1z5IvQB1T/wEfFMf2zH
 GLCg==
X-Gm-Message-State: AFqh2kqUULFb2/FOUdbAYnUz6OPvXQY+xy/B77kukrHpxvWH+aT7/u0l
 p75Wh0QHmpj0cP4ipPAQN1ivoNalqwa6EvZX
X-Google-Smtp-Source: AMrXdXvvPVEheLzfwifwAcLAgEQOfHc5qN4Gzmicn5KitdQeFwbdLrHlmGiNLym6i9NvQMvU+rIJ5g==
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id
 c17-20020a05600c0a5100b003cf6f4dc259mr35900013wmq.39.1672937066800; 
 Thu, 05 Jan 2023 08:44:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/34] target/arm: fix handling of HLT semihosting in system
 mode
Date: Thu,  5 Jan 2023 16:43:52 +0000
Message-Id: <20230105164417.3994639-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

The check semihosting_enabled() wants to know if the guest is
currently in user mode. Unlike the other cases the test was inverted
causing us to block semihosting calls in non-EL0 modes.

Cc: qemu-stable@nongnu.org
Fixes: 19b26317e9 (target/arm: Honour -semihosting-config userspace=on)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 74a903072fe..1dcaefb8e75 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1184,7 +1184,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled(s->current_el != 0) &&
+    if (semihosting_enabled(s->current_el == 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
-- 
2.25.1


