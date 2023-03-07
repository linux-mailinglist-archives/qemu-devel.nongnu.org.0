Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421F6AED29
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbJ-0007QL-PF; Tue, 07 Mar 2023 12:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0006Ub-LC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbam-0000JG-Ut
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i3so15005766plg.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkMJfLWgWt3cysDUIeI7lLeNXkJzEwyZuH4sSgliIsI=;
 b=SnMENgv1GFJKe9MJiauUuwiJQpFq3fgnA9n0GZiOpFgSJU/yRwkpwFmCFZ7/csTLZ0
 mT15Q/ZxZ5I5xqTGWfGJAYIyJ9IChwujoIlInAmW/UYoIuBCln90+0u2JMi/d9K6vHoq
 uekZI0LM0iZtPR1A/ujAF2pSGBafZ749IMnmLB4MMAOvHzFwEME6/Cvcww85brxK9qDX
 C8WqjB1M4ebUXFgi+a/Cw3Rs+lp4KbA2opMuHDLhOJwobRr9ed5GvjbPHWV8scKAVneQ
 +6Ka0UYQWdsC3/VXKLnnlnd4lLsij4h8oCeQBnQ3F4PnWuWzpUJ05jbXBscgf6AjF3Ty
 Ciig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkMJfLWgWt3cysDUIeI7lLeNXkJzEwyZuH4sSgliIsI=;
 b=ylEDtiQI9yB78XrGKuNtaxjZDdQEV0CRGMnfF+3dgTfE9uFgKp7y2wtiEnUnmXbxFV
 ydW28/oIQzzUCin6QaPcpP7mOPnhsiRqvKRH0YxhyPfv97NNul0TF6EJNwd17UvJiL1w
 Z3vWiaLvOMZPkedGxzcOJOidH/66nUYZ27u7Mcxvc58MXSmRj+x2D/HFhzGaY1rhXxcx
 JKbZRTDgaYrIdWzjcmc44Zc790ChWAN+sAKAg3xSPjQgpxnxjjhriR4u27IpWdWo8lRK
 PQs2WbezlpO132gBNEnLS8sQJyQghNDi2pBP/iHPg4TXp99qR04hmqOLeCmM9JcC+HiM
 fUAQ==
X-Gm-Message-State: AO0yUKVtcd58W/SMKnp67UR6jcpOaxkoWxsp1CkP712BmEwhP/OUZm2I
 TCjA4oQ1g7W/g6COCQhGEl+Jjvu+XbRWwN4GfgY=
X-Google-Smtp-Source: AK7set/XFvrvIVrqPan8qCJ/20LXMx+6/qR4Bs6BzcumcnLe5CaaS4MlvpiB5NgwueSXOu/89WkKsw==
X-Received: by 2002:a17:902:aa02:b0:19e:2eb5:712d with SMTP id
 be2-20020a170902aa0200b0019e2eb5712dmr13932284plb.25.1678211955168; 
 Tue, 07 Mar 2023 09:59:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 32/67] target/rx: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:13 -0800
Message-Id: <20230307175848.2508955-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-18-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/rx/cpu-param.h b/target/rx/cpu-param.h
index b156ad1ca0..521d669bdf 100644
--- a/target/rx/cpu-param.h
+++ b/target/rx/cpu-param.h
@@ -25,6 +25,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define NB_MMU_MODES 1
-
 #endif
-- 
2.34.1


