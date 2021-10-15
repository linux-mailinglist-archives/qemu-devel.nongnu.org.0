Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D20A42E812
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:50:06 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFAT-0007Yg-Ax
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc7-0006fs-Nw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:35 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc6-0002ow-58
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:35 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so2155569pjd.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=gtye64QlPCiBbLjHqNVos/qlT7dkyTO2SNa3K4gwysvsfAekGxicpmUOyT72zufiel
 SK4eS+hHbKMi+j8KA4COItmQZ5rec1NpVQeAZtK16vIh8Ov9ep4TLGhevwyCwweIcKsT
 lGjuIU/0VO19NmNRm0K3QbYV+sdijmuaNuuh4ZzWgy8UJRbtvWVUeCQDWWnEZbKiF5Qv
 nTJdykhv60j58SEcvHwI7mFVZJhF2GQkLSbpbig44NnntLkV9njJ4ne+LmGPkuXAS20p
 x+Dt1yvyRKAlITtCn1z2Gd50alyT7OUsD4Zfl1CrD7b4W077AZr5BLkER2L+eKsqaiDa
 kRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fbekWwHWkYvCfsIkbs+I86iCi1VerGNgnv3kr2JgTV8=;
 b=t0DrO0TPmLQSg36OIKE7mr2K0X56Pb2rwkQ3hi4ENmoaiIjJJ4SICYmsv75HkkVUC4
 ZVN5Ahq+VQ0WuneIcBTwKEy9AAaKcb9a7oi9NXjkNFE0oJ7H6r5pVBN9ioACFVJqwiBO
 wKg8mng6PIl+C5UIC+py/BVkh0NvAWaDgD/pSs78E7ChfsPId5fiwEloHl/rRAuU3WMj
 pvRV2xZIXm58I0bFGdm2NpjRAh8MCVpXX2gQBiiCUmRwaSeyUlCqZJpjoZvURQEVwH75
 kbCgILxZNAJXEDa3G5adxTtSLUHIMVFpoMPSSuLh//kpgeU/3EsmUnagI+/uUP3SYmF8
 pXZA==
X-Gm-Message-State: AOAM531HjLQ5/of1OZkOfanB+H37tScjIfD6NGN/BQWSadCWNNYvDm28
 +gTqE3tpzmq9lMJ+iBXo2IidXML5IUkwJA==
X-Google-Smtp-Source: ABdhPJyrC4taB19rFvD5tGgEqfMlDd2S01m16UzMcYEo1LvnbwZULad9wWQLDzXPDtGCvO4U6DFy4g==
X-Received: by 2002:a17:90a:5108:: with SMTP id
 t8mr25228071pjh.201.1634271272784; 
 Thu, 14 Oct 2021 21:14:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 47/67] linux-user/hppa: Remove EXCP_UNALIGN handling
Date: Thu, 14 Oct 2021 21:10:33 -0700
Message-Id: <20211015041053.2769193-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will raise SIGBUS directly from cpu_loop_exit_sigbus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index e0a62deeb9..375576c8f0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,13 +144,6 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
-        case EXCP_UNALIGN:
-            info.si_signo = TARGET_SIGBUS;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->cr[CR_IOR];
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-- 
2.25.1


