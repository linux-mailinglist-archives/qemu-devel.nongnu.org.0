Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB68F5F1CCC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:34:58 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedZq-0000Yj-H0
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCQ-0003JW-2q
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:47014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCH-0004D8-TA
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:37 -0400
Received: by mail-qk1-x729.google.com with SMTP id d17so4396049qko.13
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3tGSokHcZxWgS/slVzVzDsrcZh0LFR0wODhgUvI0NQw=;
 b=wYWFVGYPAnRqyCAKBz4JJTSzwM2xJAT9c/WE7xk8YSolBtM/5UQZEg7oKMKp9Zoumt
 a2DWy9FRKSaCRySfPj36bOwTHUWDpsFdjiHAt9fD9oEc1JvkEIhl1UGw9NzsxgVyyw96
 WDfSERrsfrT/MEb72UXN5YicttMb99USqOvKPaQX7YRbBmv+LivU5UbXKrLciKNg0yJ1
 fwBPhKZhot4uPd6MqsgkpPgGR0kAN0TwrgwMtCxzXYwENozJRkWNteNSfiXe5hVkXdil
 hi+BOgaXcQKaAX0Bml7ON/hIsyBrcPMz0MbYd0bV5tdg0ftL0aisrqMbeOoZxpZ67EkD
 5RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3tGSokHcZxWgS/slVzVzDsrcZh0LFR0wODhgUvI0NQw=;
 b=XaHOPJ3kXt+1IjAj/dEqmO7MV+dR/Z+p8bJp4PSSrNb/Bwm3tZgPKV8QNUbXzKEI7D
 rQIuzC/6mN4boDRHEsmSj/9rGtmm2dI0T7Z8BO64Pv97sKOss2GB1n/zFnNlEidCXad5
 0RbeIxp2VNf7EBtTcSSrKiO+nJ+ughLIZGsPVw/FSL6VbCWq1bun0Uevzqmrgw9sBL5I
 ORHcq5amgVLQ2BcyHW/j2gLddCwhVM4/e+0+aqtEFszMXG+wA9JIDg6si2XfYOmAv1PS
 LbqgO37ytQSWFkz6+SDQh7qJT0wKbb81yBQUM5enxN+jrTapafK4P7SPAdOhhW2Vm9Zk
 jZGw==
X-Gm-Message-State: ACrzQf32VybUVcX5u2FPfxxVDyGqq3DzqiI7VXZQEh+gzrdubh0SA3M5
 4kso2M0qhK7hJBeKLnall/OFeCz83k7HKWay
X-Google-Smtp-Source: AMsMyM5jhjNBur2PNKk7NX9/2xvePEYLjm/LwU7KurxsWGa0Zo5IHXvlQbiYQwk2g26wfEIXvjTvxg==
X-Received: by 2002:a05:620a:1017:b0:6ce:d89f:8988 with SMTP id
 z23-20020a05620a101700b006ced89f8988mr9349356qkj.187.1664633428461; 
 Sat, 01 Oct 2022 07:10:28 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 20/26] target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
Date: Sat,  1 Oct 2022 07:09:29 -0700
Message-Id: <20221001140935.465607-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With gen_jmp_rel, we may chain between two translation blocks
which may only be separated because of TB size limits.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5b84be4975..cf23ae6e5e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8798,6 +8798,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
+        gen_update_cc_op(dc);
+        gen_jmp_rel_csize(dc, 0, 0);
+        break;
     case DISAS_EOB_NEXT:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
-- 
2.34.1


