Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA466AC83
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 17:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGjAM-0008Cw-HS; Sat, 14 Jan 2023 11:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAK-0008CY-UQ; Sat, 14 Jan 2023 11:13:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pGjAJ-0005zp-Fk; Sat, 14 Jan 2023 11:13:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e3so14438561wru.13;
 Sat, 14 Jan 2023 08:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roNn3SpXSMUmx447vswU4kZUnjYahKbuV9DtjkyBlJM=;
 b=R1edhttxRmW5MGnOPQsODqzst+ujrIYeE1qUoqgVH7ypmUKosxp1NlsomEPtBqudtD
 FthPxl1epjxrjQyT6q5RLLspxyJb1maNdcwQLClnw0VlxdsPkHUA74ajAciIfhh29V8I
 WMmTmvuZJZC64ubkXICyfvQaj93QT1CF2MnHHxXEO7bANt9eXA2GElJktJFpS4jsC3YL
 LXsTQedQtSGh/P+UTDGAx9ykJGl1w2o+gZzpcmY3XoVr4pE6WnKHySqmyRmRJ41nWH68
 mpAkdqi9+3hNYoImi6CvLOKKVXMI2Uh/7XGdEr5uW/kbRTOIKA0rkm1qcEzkMR1a6be+
 o/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roNn3SpXSMUmx447vswU4kZUnjYahKbuV9DtjkyBlJM=;
 b=IKuhOiyZGz2+/Ntw1yZEIuXC68ztlN9AbwrWUTshHLjxeo4vB8FVyJQOiFNIJzA+i3
 YKR8k6mwuqN8SyXQOOD8kE80SRvC5R4KJCJpxHregSOCG2aVMcB/3xRjmfrUTZWxZbXh
 Y4qssqrwIPL9X7Bjcc/cjRghmZ5AuMcpcDQsqnY46XWBltFppLnbhw8Y/0YnzMkQf6GK
 WN/9Q1xJT0Bq+jWSGhsQIbXc5UIYR703RwyerGyqqYsfDKFHLP/Vpnhwqfe/lNjbheo8
 Upm/vQmywvCbgWoNQniOdoL1sJsnZvJh5hdCRh4EG9zMNIPBP9+Va4Su7LaEdCADd3aV
 nIXw==
X-Gm-Message-State: AFqh2koLuCLv2NknDt/U4dc7uQFkLZXzCQrsqwfYNrxtUpCI71AgB3/E
 MJjvwq4Mg7sEbQ/yzIZP6ow+am/muJCPGg==
X-Google-Smtp-Source: AMrXdXt7SmpRyXNGYqQG44mXxmQdlMc8cbVxZSvTGVccTJ0tIa8yWiCdsxbnVeptCgmE9maJ1Wr63A==
X-Received: by 2002:adf:c70b:0:b0:2bd:ef73:3b6e with SMTP id
 k11-20020adfc70b000000b002bdef733b6emr2074901wrg.35.1673712833827; 
 Sat, 14 Jan 2023 08:13:53 -0800 (PST)
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Jan 2023 08:13:53 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v3 3/3] hvf: handle singlestepping over instructions which
 trigger a VM exit
Date: Sat, 14 Jan 2023 17:13:02 +0100
Message-Id: <20230114161302.94595-4-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Francesco Cagnin <fcagnin@quarkslab.com>

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c63e8da6a5..87c531508e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1807,6 +1807,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         pc += 4;
         r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
         assert_hvf_ok(r);
+
+        if (cpu->singlestep_enabled) {
+            ret = EXCP_DEBUG;
+        }
     }
 
     return ret;
-- 
2.39.0


