Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88517327585
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:15:58 +0100 (CET)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWE9-00044b-G5
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQN-0006eX-Ub
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQM-00083L-Dv
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b15so9869538pjb.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pz+HX3XRxUJQOaoxsHJ2o7c5UPGEgbHAIRNFXsVNOMQ=;
 b=ED8jxEKrKHxj7yAc5NsmgMIhWhBaTnFziuCrHRpSRu9iWRrl66QddPi9lPjsSPVtve
 ooCc6lVdAZUnB6rS9F/ouWtXk3Npo4elKNDKor7lHaqIoPczJrn34oDWYq/TeXpnt/AO
 DbJLO8kIth7SplcQ87a6//Ap+ypPo+vFLpWcWR4zwyYmKpa8/UFvkUcWCBh2L+c6MTPS
 Xb9d7G+DYSCY35/UMXySgGo1DEm+vPslMWdiG63oXEHNYNUbSGX4A3pmBUORUGfQdoJy
 KYpqTaIx5C2CGex92aI0W3heSobmq0VgydfAo+zqrMY7mOkJ1bQowiNeDpuuHFnS6pZH
 +Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pz+HX3XRxUJQOaoxsHJ2o7c5UPGEgbHAIRNFXsVNOMQ=;
 b=dKDwep+NFTIf1OHH+FbbbAGzR04lRfK2UQM5I1g9yKbGoa0JSmoiIRrVm5qFPzkHlo
 ib2KtR1ZBP9sF4Ej6lQmE8k/01Y6/oBT4Mal+9r2onr4UENvv3jtEx5lK7eE1hVod20F
 1vf68fxiStN9XblIaErf22bymJ4Rpx+/BRo6IoKe0tMHntC9hbLdXM/qp7ZlbB0SPfMx
 6+9pBDCRO1DqY+pyNqlLpPARYlASTAoTtwQmNvMkoyG6jVgKnjM0BMaxd7A63vngvs7J
 rtdPr7imWap+5HoD9oo6egwf8FvmYXnH+EufbALSwH1VsR3i+zs/Kr9WsCWgS1bQshep
 7WmQ==
X-Gm-Message-State: AOAM531F9EJksGuimwPhm2Utq4+nGVnjCrW8jhOykzxHVHkFB7CYdJUh
 J571T356FjV9EAB4Zssq7A5FnsXL36jL1w==
X-Google-Smtp-Source: ABdhPJwhAT9D2eCgr+/R3JVgC0aWoyulE1SnahVu8ubMNnCcF4pjew5ibIq7tWFoPz4ALa+TE8QJzw==
X-Received: by 2002:a17:90a:bb95:: with SMTP id
 v21mr13958010pjr.30.1614554669252; 
 Sun, 28 Feb 2021 15:24:29 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 45/50] target/i386: Exit tb after wrmsr
Date: Sun, 28 Feb 2021 15:23:16 -0800
Message-Id: <20210228232321.322053-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At minimum, wrmsr can change efer, which affects HF_LMA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2493d39f0b..dc31d8667f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7254,6 +7254,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
             }
         }
         break;
-- 
2.25.1


