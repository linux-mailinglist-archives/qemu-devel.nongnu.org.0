Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597D6B2E30
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWo-0004UF-4y; Thu, 09 Mar 2023 15:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWl-0004Rf-Dv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:15 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWj-0000hB-U3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:15 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2987169pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzCYWYun9utcf/yffzWbF4JVUtryRJqMxPcZiTQQedg=;
 b=o3ZeDGyfepCbaFRvqoFv8MKcJwmtRATv0HKL/lM57JH+GzQ3VMKWDgeUHpq219gwtb
 x3Z3VF2GcE50CGTeMJ8/Tb5FqRSbL+VxWIPiNM+pi/XXGj/m1LeG4TLPwqpxoOSxp+hM
 6aKPTxcw2/tM6aPhafXXoHN1hm2lq8RIDr33RGJDtWfUEqL/vgP2s4/UrAvvt/Ybb+hA
 lMM0I4CQ4BJGhvOygRWqBfB5wpjxecLZ3FFrmZHLpPXb1Vuccljp7yMzpKnbdIdV9bCy
 Q/2xD757l4VvhDGf2THRMwM57F9fY9j5ccsyGp8TtZXL9N407uQRjd+Ba3cZ3XrvEKcj
 c8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzCYWYun9utcf/yffzWbF4JVUtryRJqMxPcZiTQQedg=;
 b=iX9EIngUVLZqeIqK0io6F+7tQEsIDaQgljKdxaKv8alqBcqkvxV81gxSdtcuPPcwwB
 aUxIpZ1JKu+fY5b3fPXlI9YDAHjhNSEoafBrh1ktnXmyw6B2oYYCdI7jjHVwnaeyqI5X
 sBzcLNKFWnPzYFf4feQGmXTKcLktvXkJ/DlfLhN6NW3C0RqiyaLQQOGWpad7LQ97sixz
 eRFsUVDF8tM4ZM5lQ1KEuAu/6auanuAJCdWMB0KVEXh+WWFb5VmlMAbvo0H2RChJHsFF
 87bmlUiArX4XcgfWQ5Y72nY7K0gFCZK8fjnVeHX7jmMjXlj3eD2RHBZwFPuMM1XIb+Qx
 7w9A==
X-Gm-Message-State: AO0yUKXtAlEQvF3+8JevBnrxX/cUbdNSP9wQlwYwLe2vNPZp28acLpab
 /JSYrh5RKd0o855+6ytXujOJc3TeQJqR2kkAwzs=
X-Google-Smtp-Source: AK7set8nUxd+ZsuXTrQMr92SU31iIpBeD0CemkZyoTJzNnRyISxEHCsBseGbPgxcenOiw1n8euIvJA==
X-Received: by 2002:a17:90b:1e0a:b0:234:c07f:c04d with SMTP id
 pg10-20020a17090b1e0a00b00234c07fc04dmr23235315pjb.49.1678392373018; 
 Thu, 09 Mar 2023 12:06:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 24/91] target/loongarch: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:43 -0800
Message-Id: <20230309200550.3878088-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Message-Id: <20230306175230.7110-10-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
index 414d8fff46..1265dc7cb5 100644
--- a/target/loongarch/cpu-param.h
+++ b/target/loongarch/cpu-param.h
@@ -13,6 +13,5 @@
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 
 #define TARGET_PAGE_BITS 14
-#define NB_MMU_MODES 5
 
 #endif
-- 
2.34.1


