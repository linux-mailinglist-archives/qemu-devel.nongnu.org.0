Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8E4F9B3D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:01:19 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrz4-0006PJ-9o
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsq-0008Is-KK
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:52 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrsp-0003ub-3l
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:54:52 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b15so10747380edn.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFP0HbJwpn4b/8mC3zm1M94yL+pYYUEsnbWxKZ7xRO4=;
 b=w2Bx6K/BdmJ1ra+KbuXMj2STD1KouuvTD4HoMkk/yXNNX3N8aLuQPsO4YFyav47CI1
 JC//EQ1VwseGzJdmx+t6a0uUfCYhwajdNzggyuxKxk1ELCVVdYQxqnDHuc7I+6k8n6Xi
 4iPxpLpDPzGnla51HvFWfBknyGT7jagS+glMDTokVX/ckMlhih9Xw4LpfliYULpCy2dc
 +V/sUYSXxNWYY5NNheKivWk6KBhsx4fapwHW64e0R1JGecSyyDrgoZyMAYIsJMUAXPBP
 Bjk46hSsGT3QkqTX48TMdO+J8oIB1iNK1Z0jFAG+W9vomoqSt1Mt25bUXTX6536oCk09
 cPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFP0HbJwpn4b/8mC3zm1M94yL+pYYUEsnbWxKZ7xRO4=;
 b=Il6SDk14BqTn/euyT2bph8MrIblUo37bclYjxRNVmDImnAcASU9X5iswyqpdA020EO
 x4HXyRU3/I+urKfzj6tcyUdUhz1TIsbpoeXoDa5zt4Umw9RCzEDBygdyOl6BHDnYFmsM
 C36ymR5QUmi7b6fAKlAyM42FCRbYMqiCjWdPlw9hGkbOJWs/g4IX1cRU1p8ZSk2dC2D9
 O/daKJh9ER+ydeI50UB8g3u/eV/a3+JLGra5hpKM8oZjRE92brhhcVnerIUcRYrOvusV
 EWVpkfxMQVP0nl4ilOLo1lkyxU0fnGYw75V5CH2uDGtc1NDTIQvxMLWL06pODsZb5Qag
 99Hg==
X-Gm-Message-State: AOAM533PrC9KJgj0NrR8xZ7UHqLgytrVOlk3tExFbvyeN/awzREWCBHx
 uQjgftWk+xOeUNV+zWV2jqK2+Q==
X-Google-Smtp-Source: ABdhPJxyXKGuelWIKSLpsquIq0lZ0Ibmmy2VLe6O6eMwXK2dlGN/PgYRdETsDCO4DPx/8naAk0SHRA==
X-Received: by 2002:a05:6402:26d0:b0:419:75eb:b3a with SMTP id
 x16-20020a05640226d000b0041975eb0b3amr20744011edd.0.1649436889750; 
 Fri, 08 Apr 2022 09:54:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170906390200b006e7f5fedbe7sm5336427eje.3.2022.04.08.09.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:54:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97FCD1FFBA;
 Fri,  8 Apr 2022 17:47:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 14/15] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Fri,  8 Apr 2022 17:47:41 +0100
Message-Id: <20220408164742.2844631-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: fam@euphon.net, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Coverity reports out-of-bound accesses here.  This should be a
false positive due to how the index is decoded from MemOpIdx.

Fixes: Coverity CID 1487201
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20220401190233.329360-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/plugins/api.c b/plugins/api.c
index 7bf71b189d..2078b16edb 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -289,6 +289,8 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     enum qemu_plugin_mem_rw rw = get_plugin_meminfo_rw(info);
     hwaddr_info.is_store = (rw & QEMU_PLUGIN_MEM_W) != 0;
 
+    assert(mmu_idx < NB_MMU_MODES);
+
     if (!tlb_plugin_lookup(cpu, vaddr, mmu_idx,
                            hwaddr_info.is_store, &hwaddr_info)) {
         error_report("invalid use of qemu_plugin_get_hwaddr");
-- 
2.30.2


