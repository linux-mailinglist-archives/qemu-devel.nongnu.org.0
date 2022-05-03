Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA28518D95
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:56:50 +0200 (CEST)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlydd-00064W-D9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVv-0000uk-Cx
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVt-0003Vy-H5
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:51 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so2280378pjb.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Tl4F0M/gOxqcmd1Ho0EBp9s9GppksaThNyFvq/k0E0E=;
 b=nOGB2d2ykFcR7cORq1EVOOEjV3dgItwgPDgfetyovX8KuiIbkwXQpw4RzxPEvxa6OT
 ktOPzuz3Y5oqOMmFzzr4YXM2GB9PJ6LpAbNLNWgzxIexDKprzXPndboV4ryEdSQoGZgx
 9Mc9yxRuhpU4lP9nTDzWW8jBuMC1jo8bzscMZMheStuIHySnX3uJQJCnVpmGlQD2SnXk
 WJop/Y6U7m/110xv561q8gamtcvum4h/mGfBY+HqCgFQfWhVwLhZRbCuyqXYZa058Pb+
 eOMgjUDvKqMB2VC6DuDj0DTJ2zGyFqi3ZEjugSNV3rBu9SsHT279MU7Vwanj4zUoSwDy
 d+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tl4F0M/gOxqcmd1Ho0EBp9s9GppksaThNyFvq/k0E0E=;
 b=hT1pMnU7QXJ9MVFLrNtlE6Ob+4j434xqlVgz08j6KtQi0m60kzEAFdajmGw0earCXi
 4eY5h0yt0+bZ33ipxw5OfVKGwb6GPAt4Lkfm2ALV1wWFPqJuFys5RKZTmYmC+7js3Oic
 qljWfGIwBcwAKC+xd+ME7CGCKzFZ+87WUWw3mO3MtvgMIN+A6Q1V9aZe8IZhvqmOAjrg
 kCTvr/TM3dh/Mojn+Ff0FZbuWeEVm2hIX2imtjLvxVNGyEv6HPh0aVBc6Znc993IotlD
 XzXAuNguWzKCiisdiFjl9FBhi+jXzArCZiTtggttrCqV9LlTDt/XJx75LWQTohXtD7IB
 RyzQ==
X-Gm-Message-State: AOAM531du4O1yjT3Rf1xKR+c6cjeGeb8tr1cAZbFu1ZssI6z0PLGIz1o
 NbPNsiAr+GTMr9gwpvquarz74hFz9UG1Xw==
X-Google-Smtp-Source: ABdhPJy25FgeJvVaQkAc9wPgrohNGmQzEFcMyPxtYMSX1CZWciI4jPQSZBKH/DS3WqxbwQMa4Q/c1g==
X-Received: by 2002:a17:902:e5c1:b0:15e:b847:2958 with SMTP id
 u1-20020a170902e5c100b0015eb8472958mr3876172plf.101.1651607328239; 
 Tue, 03 May 2022 12:48:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/74] semihosting: Improve condition for config.c and
 console.c
Date: Tue,  3 May 2022 12:47:32 -0700
Message-Id: <20220503194843.1379101-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

While CONFIG_SEMIHOSTING is currently only set for softmmu,
this will not continue to be true.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index ea8090abe3..4344e43fb9 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,4 +1,4 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
 ))
-- 
2.34.1


