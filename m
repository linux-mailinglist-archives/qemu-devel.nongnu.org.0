Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC34689BE1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:34:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4U-0006eJ-7q; Fri, 03 Feb 2023 09:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4I-0006cW-Ni
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4G-00053h-7Q
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:34 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6160135wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m8O7Eb+in4iFMyKSZKYhuiuIHFHL3PaJb5r8x77Y6qc=;
 b=i8IPwMDBK6D7U86NTuPt5cIyVUk6mlA4mBJvYgIojsxJzoWKibHeuVtli4qnDOL3pt
 Yd1ld05rY1iYMGsLT5sK2vg9mY+TmQ2TVs/TMmMR3xx6ZDb0RjpiG+7WrXdNZSZhkFhM
 fq6HG09ZyrS7ZODB9X3lz7t0UVq/c5gpZXxdUliRhtvixCSs027smHEyXP+S0KRc83QX
 665VkBj3IGZ2/lflE+CCSqULaMib+1y4TKCByWbm5Q/Qhx/cG3vHJ3GP4kyGz4wZ+gQ4
 0l98wD09AeQ7u+us2R2gdWqnlpmUGjXXsoSH69kT11YiFKcWHJSxhUNpgT3WJ5lCbSyN
 Lv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8O7Eb+in4iFMyKSZKYhuiuIHFHL3PaJb5r8x77Y6qc=;
 b=lFM0aJ9Locjf1yjQeCfmqoZGKETy2b7APbMYDI8AJwXMybAhSx0C0dAy/jdMbJWupX
 DyudobwH75ifZSdK8HWGnFlTnbogYMsKzH4ZO6K5hqbxeRYEEwLSZ/7Nnc86P0n33goa
 KF/T2DzZSKeS8ERz5Kg8lMy+U0Dd8o7qg+Y3XQz8HB2XVVREAjF1BM1jikLlr3zDB+oD
 9HJHxc4bYCrqmE3jFzLcpynPXY+oXp2VZO/CfXIlFY6vqfWu0IDaZXDVdLW7iSsSVppo
 Zu8BHj7cbs3N5CDg/LoXJcGiQKmEYdP1dTx0PVf0R8jY2/ZuOIh6rSMOXAPoNZiWXQ/C
 YvrA==
X-Gm-Message-State: AO0yUKXq8lmNAMhSptnlZO2h36cJy0E4mbMvjAsK6/i4wqSVrKrxqdUB
 7g/nxxa9PuDRzGzzKfob+99OqBHKoMWdROUl
X-Google-Smtp-Source: AK7set9KWLzqe2JMhScMfZ61qBDk0+QCJQCWrGT9tmijUiUXGX9cXQ8WWOegNUqvEtELfEiWiai4rg==
X-Received: by 2002:a05:600c:4ec7:b0:3dc:5e0d:4ce7 with SMTP id
 g7-20020a05600c4ec700b003dc5e0d4ce7mr9786261wmq.11.1675434570955; 
 Fri, 03 Feb 2023 06:29:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] target/arm: Fix physical address resolution for Stage2
Date: Fri,  3 Feb 2023 14:28:56 +0000
Message-Id: <20230203142927.834793-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Conversion to probe_access_full missed applying the page offset.

Cc: qemu-stable@nongnu.org
Reported-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230126233134.103193-1-richard.henderson@linaro.org
Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 57f3615a66d..2b125fff446 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         if (unlikely(flags & TLB_INVALID_MASK)) {
             goto fail;
         }
-        ptw->out_phys = full->phys_addr;
+        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
-- 
2.34.1


