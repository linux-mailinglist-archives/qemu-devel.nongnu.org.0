Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DF30818D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:56:25 +0100 (CET)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GDA-0002qe-8o
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzI-0005Va-NG
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:06 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00085h-5t
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:04 -0500
Received: by mail-pg1-x530.google.com with SMTP id j2so3630590pgl.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=CvUmxM9X2eaF8quUW5YzlNRp8TTpeu52G5JY/4/6pNfV39n6Fx0h98IRLTVfoKl99c
 FBxqV9h/RlS89jjByTZmoOZIfzfT1wwOml2tlNe3Fb1Bpxi7b5aX7+454BhUp0TcPAbE
 lpGktkMLskmmoEl/JhVcFUO2xmHgsVewQiCjjT/IgRtJ6jlox7bDg4Ruof4Qy6PAGPfB
 UbcM9laboiga5j85HzUcCLCIYxjOw+Vud4fakXJyJGU4nwdsUxSWI1SWJ4AsPjH+tSyN
 bt7iO9r7Q59s8UYiSEfORtFmg5d8OFoC5CZMkFq1GO7H7xznkpl5M+nt0gysPF0Ty7Wt
 VUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPFkHBCfiYE2/tooUwU3w49LVJJCP7NOmKVnwS50G54=;
 b=MS/6TboEUt7/WL2Tc8iXSbnXqZ6gHiPFcwIDdAtWPxUbF2NRPec6xe/f0yKBe10s/8
 Z+qHAFESN+4rG+XEJ2DNCbHzxo+xKlTXWduRd2IYEO5Knkgl/BLLND3vzao+bhqFDDGS
 rYmhGoghH5ivFx9FVJHiCjFwCb/i064USN5M6IpXm6SGR2MZZOHgJhbuF9nc3vSFMwnQ
 DTDDywTNYCu6uGgKNDgpjMgyy4D/y41AcRuOpGzA9x1dyagrbxnVLRgfVJBz5c5sEC+S
 okvTwYCxoBc9fDf8y2gO/4JxXYfdmSXc4jgGmY4KVzuGNpqUOUzdb2xoxmag+N+Al5oi
 N3eQ==
X-Gm-Message-State: AOAM5316O4n+bOF4cmp1RWJscf/ompEcSw+GKsxPOJ84gUDQvx5z0Ex2
 sZGrmFx2/jg8mZaAaBva24UVvg6i6/vJgd7o
X-Google-Smtp-Source: ABdhPJzVOkal9PGdRk393v7XvHMYy+1C4ah/1MFZmlguOEILcDI/+kjN20+6qkCGonjbLnPzU0Tqjg==
X-Received: by 2002:a62:25c5:0:b029:1bc:431b:6aa4 with SMTP id
 l188-20020a6225c50000b02901bc431b6aa4mr1414714pfl.58.1611873713096; 
 Thu, 28 Jan 2021 14:41:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/23] exec: Improve types for guest_addr_valid
Date: Thu, 28 Jan 2021 12:41:23 -1000
Message-Id: <20210128224141.638790-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1


