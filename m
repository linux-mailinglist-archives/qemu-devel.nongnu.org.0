Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A901D5EF6B2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:35:00 +0200 (CEST)
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtgp-0008VU-QJ
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwE-0004cB-NH
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwD-0001Bw-3i
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id s14so1793428wro.0
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TheWSguGhRqniI62gc+1hhanmtlCzZ/ZQDcCAwGaUoc=;
 b=jk6Zb+DC42VJhy/nEo+xrYZ7n5u+jHhrWua+fIxEdF721Mu9IsHsIwUJBICbQ9iQZs
 btE3tyAsCK5EFrDi0Bzc//DGS/5FAW6KUTsLQeKLt3TFhlbgXRQdff1V9hsHDm4OvMz/
 t8Ix7zzzI9Ri6DbmawzfF+KeoxkRO2TR6cPMzkRcu9E8OERX995nnv5lgXGuQblyGTKX
 8W8N/YTYMoJIYjcnSD8fWW7zvpvb63D/a2nkPthOC48flakCafTXKM9dAHDvk9u6hv+6
 IIh9Xbc5kk1GlGwjPFobBjp4VfFQZkkjpdN4CZ7PamAfnNXOxp2/9SxBarRTV1cTwo5x
 hIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TheWSguGhRqniI62gc+1hhanmtlCzZ/ZQDcCAwGaUoc=;
 b=JG4p/YwGvDgHKj0K3zWfGYDt2Ha2aUUIeFLojiGLe/KDrzhODSgBX7E13PDHxGha2y
 IJBebyop3QyKeplHHso8+TTNL3RFx6XqPGkaShrZcjc86KbMo3Cuiu8YBN2nO4r2/3Nb
 fyBqx3IG1aZ24PpJblNewLMvy3gKghGCHdHeJ5iB14Pmz0u5YtUN+XsZ3PVoZsdVxPAP
 qzwJzdQPvoA9h7E1jS7FihZlnS4bJVorvJAkeSnFAvpBqZqgJaGqFHmYzFwyscgRHn/H
 AM0W0DxkhJlVs579VR7tVULVyxhcSoGtPepccc1uuR7JwLosqn+VP0/q4MNeBC4LwzxP
 Fg9w==
X-Gm-Message-State: ACrzQf1wKdmNddlKo7HspsTSSpksA0+ylpRhirishDy6zhYq7JIDFz50
 fhcu29bnuNaNP7bf3ABGNCaJ0A==
X-Google-Smtp-Source: AMsMyM52IZpdjVuWkJGRBzfkq5u8WpdVvMJom1LVz/SQgyFmRB0ZW6ZHVRgBhryncswYnEXEIVoVaQ==
X-Received: by 2002:a05:6000:1f16:b0:22c:cb05:5097 with SMTP id
 bv22-20020a0560001f1600b0022ccb055097mr2042628wrb.591.1664451764319; 
 Thu, 29 Sep 2022 04:42:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bk8-20020a0560001d8800b0022af865810esm6201145wrb.75.2022.09.29.04.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 668FE1FFD6;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v1 36/51] plugins: Assert mmu_idx in range before use in
 qemu_plugin_get_hwaddr
Date: Thu, 29 Sep 2022 12:42:16 +0100
Message-Id: <20220929114231.583801-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Coverity reports out-of-bound accesses here.  This should be a
false positive due to how the index is decoded from MemOpIdx.

Fixes: Coverity CID 1487201
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20220401190233.329360-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220921160801.1490125-7-alex.bennee@linaro.org>
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
2.34.1


