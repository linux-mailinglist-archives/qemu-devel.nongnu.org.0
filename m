Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80C6B2E4D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWs-0004X7-W5; Thu, 09 Mar 2023 15:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWr-0004W1-7f
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:21 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWp-0000if-Np
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:21 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso2994028pjs.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azdY6avdKxjuArQutxZnvZW5WUkxMdxkfEZ7Z83LJ9U=;
 b=d/wz5vJQwgYpFu0y2Ny9SQbHtmATs3gyykZt5ZI19dmAG0f/QaGxrlxxFwiWKUJI2L
 onaPLzgYckPzOUnURr7TuLFUkkwkGNjrQomIfXOKzV0+CRyymHTV0O2n+GimzgVkkj7t
 kkv8JsLCiU5cOmaV867vECdWWUfi257HNH9ohtgiLljdutxEnm2sVNYzgqNd/Uoo34Ur
 KcfFDPxgX24jSmtAf6+jrR5tfV7eKVYN270FpK39g4OBhQNOZaOXEp67rWYWwpOxbSaa
 gUHGc3rPVsUwYh0wACXWZ8IWfvcd/EPrU+YLavc0ugtXG7iJMSMad0FpBkjYvRbaKnAR
 IHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azdY6avdKxjuArQutxZnvZW5WUkxMdxkfEZ7Z83LJ9U=;
 b=UJGEQ+S49b88c8wOIIZ6ESE5PNSTVOyfxle1mL8h7vggJtO41toeG9B/JmGgqkledq
 fgIRnbimBSXxgcjfUkZUPCdj39aw8TG9f6Cv8HzFBldIvetEaLoabwAj4J3EGbaD4ODz
 xICZjJhy+gecumoqVt0TUkfZNUz1CiQdmjfEzz4MaMoDafDjQS1GJS6BKv2dAxTTf+tD
 vZWSKqzSis8/slEUclaPCaFnqTvbMOJ2SNxKHmFTMyAG+yDZynCrNtK2EB6dX1o4FzUk
 oEPWeri1VnGZvZRLwIOTlAkEKLNym6eLlw7LASbuk2DAU1ns0JVYXpXPzX2tvy0xOxmg
 /LzA==
X-Gm-Message-State: AO0yUKVNX/uxSa4g+It5XBctJL2pau1XcCfUOXFAgjXYtF8sPkIaV1LD
 sDsa3N8dmjdy5Zua5CXLKm1pDsC1D8WcMp9D9Ps=
X-Google-Smtp-Source: AK7set8mP9yNmVTE4qcwj/LaPW+hkQ50majbhiPrI+IRk2AA1ZwrnD7RwCKneWgTFpW/y+GxQozs5w==
X-Received: by 2002:a17:90b:4d12:b0:234:b786:6867 with SMTP id
 mw18-20020a17090b4d1200b00234b7866867mr24527442pjb.36.1678392378743; 
 Thu, 09 Mar 2023 12:06:18 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 30/91] target/ppc: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:49 -0800
Message-Id: <20230309200550.3878088-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Message-Id: <20230306175230.7110-16-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
index ea377b7d06..0a0416e0a8 100644
--- a/target/ppc/cpu-param.h
+++ b/target/ppc/cpu-param.h
@@ -32,6 +32,5 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 10
 
 #endif
-- 
2.34.1


