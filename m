Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B46B2E29
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:08:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWu-0004Xt-Sc; Thu, 09 Mar 2023 15:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWs-0004XD-O4
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:22 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWr-0000gK-6m
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so3142690pjg.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fj2jWBdUMjUoeMA5SjYj93zZDOmglkhMdA5VSDsF/H0=;
 b=dBgTNqW/2NNbtjpA9LRZLaSY04q9dRVQSAP45VeldcypxRejAVmR0HvGgXM2QMXp1C
 yHkg5y44u7WHMxPqBrZss+npQLY4ZKokRQ+hLjs5Ln/8HqOgzR8kZovqGCqudD3QQ0m1
 uvBJqEkpnmRga/KO7qNNRkrNOaGdojonXIz8HPxg2Mm8dA/RTjdlNDPtWFmSQ6w35pZd
 5omV7qxcBptYy5cn8EHUwb879e57seLvfc/YjNUeFF0pEMARt12HeoZuqx9GA9ZDznka
 fYofOb/eU+WDpKE1+k0zpYikTjlBIqb6UHs1g3WtcYEsTM3xrE6YV4Mpbw3SvjXbnhKW
 iAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fj2jWBdUMjUoeMA5SjYj93zZDOmglkhMdA5VSDsF/H0=;
 b=oUletgoi1Bnc7yhDHq48N8B73J1D1vfsBSSMERAGlml5NJ443TqcN7Ql21hyQgz+wq
 WnwjsMt2zJQeV9hYb9RzurePKWELnZr2+Sy47O0rCyq5yPH3NWQ6ZNX2SIuh1XsbvxJj
 Pe3d9l6Q1guzeV+/B6LjU8B3rbwVapfAmZzchvQnDA+BGPKD8EwSNRq6n0ZloZtyqOvD
 XOvOHFCINo29qXk97TkDAGXWc7tbEecxQVdG0l2GN0KcNMMptNMaNl6IgAWg4JWLtJMb
 CGJDgpNeT6WOzOi4DFG0Ffbp/TuebycEdlNLV5b8lNPLI3lYzgfBlojbAquu7EDlAsXA
 7vGQ==
X-Gm-Message-State: AO0yUKXkYOB+HHMXkcXRfPZMpJy5isLbbJvN3/ph5yCxLjavUu5eyUaf
 v7xnXGsvH+d/80vV9YgLPtVyy0u5dbK1mmakk70=
X-Google-Smtp-Source: AK7set+jXGOmA/pRnW7U659lC3p6u9F1c06NGNiMUeZh5hGnx6CnGMtzPaaaRjcQ/gia0CSYhLP9Ew==
X-Received: by 2002:a17:90b:1c05:b0:231:248c:6ac4 with SMTP id
 oc5-20020a17090b1c0500b00231248c6ac4mr23663001pjb.7.1678392380481; 
 Thu, 09 Mar 2023 12:06:20 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 32/91] target/rx: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:51 -0800
Message-Id: <20230309200550.3878088-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-18-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/rx/cpu-param.h b/target/rx/cpu-param.h
index b156ad1ca0..521d669bdf 100644
--- a/target/rx/cpu-param.h
+++ b/target/rx/cpu-param.h
@@ -25,6 +25,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define NB_MMU_MODES 1
-
 #endif
-- 
2.34.1


