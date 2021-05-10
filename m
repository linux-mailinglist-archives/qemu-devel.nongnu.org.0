Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19804378C43
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:28:07 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg50p-0008OU-9K
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yy-0005Xp-8b
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4yv-00038w-Bx
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:25:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s8so16430772wrw.10
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BkwYn9GlEXVqXaAI4IuFCkOZqyIgHd283tDE2JpygwQ=;
 b=poonjJnEhcjlVMVm69eI7lPupqtM4AnL7da3jOGUWEeFgALbu0W/KQAP7nhyyZK9Aq
 SE0veHREyWmB/zJX6PmfxNQp9A+Yuzia4vAj6J73BqcgMLTpq4GUR1tecOd+/6QLDU70
 TU73wXNDjve7iHML1Yxgmeoq3I3hvDnI8W8yIJP3KJVkatyhp3F6ZWX5AZmxGyb7CFok
 gRq5kJPeAW/r2U8Iqprvopj9DDEuMlUxGIl/IVuoRBwCtRwyTLvWgwcGz0l+UUz/PNwF
 YACSnhsFjL0fZshWe7W/jHcJBkZ7z5NpG/da6BQX/zbcFQUt/+vlTN+sKLAHuukXvZL7
 xZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BkwYn9GlEXVqXaAI4IuFCkOZqyIgHd283tDE2JpygwQ=;
 b=fbXqsRmlRehEdR20kQju1V9FrZ2/6rZGCubJAvZQsm12mPvF/YzMxBBAn+oNGrEp6/
 /CAuC99IY5daaarXJv3VJWdaWH9ipOeLO0a6hKK24CPfYIipLz2m9BxURLvZXxS5AljO
 ZFY5hxcTA0G9BwPPi/CKEwsvVUY9iQ/KZkyZC4EThMHAgAaJ+zynpQv191qmx5wOCU86
 dZNYs0XaqHWQSwKTfXB1bXSGm6CYMnDZjjur1+Pg3kW6Nx5DXZaTaRXn3dlIlzprPeAO
 7c2QfEjHXatZjd1Nv2/Sfy5NhokBywDhYvCPcZsK9a1WO7aXAJRvcmKzbvkM7gUMGYQB
 pTUw==
X-Gm-Message-State: AOAM533n14ZzfkX1ao3XvOGHZlZW16z3njeur62pICDoni64A9YqAOvN
 9tb/rF2gqTq1dKLW+Q+QlVCj0e5B1TQjig==
X-Google-Smtp-Source: ABdhPJx/6BcTwg4UT9SlCRYom7qm9UNgbJLfMpfjLhUeLvt5rXsPUVAukt7X22VXNik9NOwLC45eUQ==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr26730290wrp.152.1620649552099; 
 Mon, 10 May 2021 05:25:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.25.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:25:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] target/arm: Fix tlbbits calculation in
 tlbi_aa64_vae2is_write()
Date: Mon, 10 May 2021 13:25:25 +0100
Message-Id: <20210510122548.28638-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In tlbi_aa64_vae2is_write() the calculation
  bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
                            pageaddr)

has the two arms of the ?: expression reversed. Fix the bug.

Fixes: b6ad6062f1e5
Reported-by: Rebecca Cran <rebecca@nuviainc.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Rebecca Cran <rebecca@nuviainc.com>
Message-id: 20210420123106.10861-1-peter.maydell@linaro.org
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b1b98705f9..3b365a78cbc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
     bool secure = arm_is_secure_below_el3(env);
     int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
-    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
+    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
                                   pageaddr);
 
     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
-- 
2.20.1


