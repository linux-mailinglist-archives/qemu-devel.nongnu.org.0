Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFCD5106EB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:28:05 +0200 (CEST)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPuu-0007eG-J3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmU-0002Tq-TE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmM-0004Jw-4E
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:20 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2860306pju.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kt2BBU1GUjUG3/EJVuAysOFujg46su8Ylz5CGCHbv4o=;
 b=icXI29fQFx8EUBPE1kG1591sIHCEXjgHIWgbv+lliGGI6NT25+GafN5FA0R9kR6gWs
 vsoLI+QgubqRRfoy8sIgWwb22F1rr8QKbGVw2sU2SkDaCEXevqSVLBYufcX49xgte3H3
 t5pAv/W56ltJpY95OU5GAQ6MMa1up4UUxsQpRYxEDGUGkpcbZrp7VmtaOgQQ/c2Fx3Bq
 ZmisXFyaR4s3huI4Q3zwNktkws6K+vXW0QWz4LwCJN+T9sMGC+fqzLQpSyBjaXcQIwN1
 Nu65ee8aN16ac13MD1SWiwnenFKxEya81aUV7OTcUEKtLaUYH/YOc2L+wLrjgKYLgfmO
 IS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kt2BBU1GUjUG3/EJVuAysOFujg46su8Ylz5CGCHbv4o=;
 b=Co6ivw0kpgBh/PA3sG7FHnX1lgcB3QNmZfNN4Ke2R4Iq+/+k4zsQaEcVx+YDbQlEd7
 HtQQGOFSQ5V08fS7O3FIbHRpuobPdysN0p1MgaUEd8GEiSF0nps5LHjaUvMylDZLZjUA
 qJmCTH/RfhanE6V8s7DDkiY+ei/w5RBsTU5K1skASGTUCxH1SZS3Tz6tx+tLh+eLcT3m
 /NbRfy9HbBNZXtLSLXlx9D/BHaJGE01NlQfrPYm0Unf/Vyx9irXUByhe6MylWJ1Bes0P
 CWCDQvYxd5IlzXbIL4Xkw+BIgaYTGnsEbpyDUTxVcJ73rmBC3HyI8P2R1nPvhAfh3TtZ
 rP3w==
X-Gm-Message-State: AOAM531YVUWQKklzOA1YkBKwqAoDWUWXlSQNvfPMktHk1DAy41GkItTG
 X1qVyhi3Vca2VR7aXSetllxD0FI/qytSJw==
X-Google-Smtp-Source: ABdhPJzwu3yGAZhBPSU2P4umv1cjy7RSQBQrvXNsk4s9l7jP3gJoRD8LI/2UDEzkdf85DTDX+62KQQ==
X-Received: by 2002:a17:902:aa8e:b0:158:e94b:7c92 with SMTP id
 d14-20020a170902aa8e00b00158e94b7c92mr24696786plr.126.1650997150521; 
 Tue, 26 Apr 2022 11:19:10 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/68] linux-user/nios2: Fix clone child return
Date: Tue, 26 Apr 2022 11:18:01 -0700
Message-Id: <20220426181907.103691-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The child side of clone needs to set the secondary
syscall return value, r7, to indicate syscall success.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-3-richard.henderson@linaro.org>
---
 linux-user/nios2/target_cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
index 2d2008f002..830b4c0741 100644
--- a/linux-user/nios2/target_cpu.h
+++ b/linux-user/nios2/target_cpu.h
@@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
         env->regs[R_SP] = newsp;
     }
     env->regs[R_RET0] = 0;
+    env->regs[7] = 0;
 }
 
 static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
-- 
2.34.1


