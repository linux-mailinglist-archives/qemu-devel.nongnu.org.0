Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555158FF26
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:18:44 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9xL-0002OQ-9t
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tA-0005A7-0u
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t6-0005g0-GV
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q30so21662015wra.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mq28U3S+aorWbPhD7w2jGbd0fR6R3xwjskZSmzoaW9Y=;
 b=i/zRjGLet1jdLxGhPKG23OM5MkOdIE3YkR+w0V3nJE9PYaljdmCoRna/6KrQPG2VB2
 rOoSg9iu6GrFak9BEad+CZlNOwnKAlfwijvhPpPEx5lrCvRRjKF8PochqzwmqsyoPPiW
 AWzeKgVDLOdx6zY0NUpQhbJ3H7Vl42DiairRMaqrTF5bRZv/WSsX+bKPwmlLcYDzP1Qc
 vMtP0XuOv+BUo4N8lhJwJR3FD8sir2aKs4UDz2aFBpOm6IVE58XfKv7DJQ/we6vtMshQ
 bbeNOTwhv021bUUxhGv+CrRF3QKkfGJUV2PR3MEUb8gn0zNA+ydZkFGBBtAORQ5EY2TG
 lZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mq28U3S+aorWbPhD7w2jGbd0fR6R3xwjskZSmzoaW9Y=;
 b=gcowROsVBGrtCbUSN/rFlf4JEb+CDYW46G1HxJr6cQvHwmBJgx4wqmP4AIZoZxmsUm
 8EBjWdGyqxiMeQNXesVnw44j4taHsUv+EtjB1rW0TLQd/s8VfpXlJuWRCzu3871ly3/D
 DaNDf6J7SLA/RaPb3l15D5GXQbh/qIGrGaPlFWp5WLb9lgdsIs9BjoKnhahblJ1+Ji7x
 Aieqs1a37HJqmrBhrgdQCCS8yc5ungc9DC/HvLbwPckzkkgPR2z/KDo86oqr1pbX8syh
 UE9bHPjc57uSaHM+/uH0Kw13VufNkADWWpbh/rrR+nNmPc6CWbqR85+K8b953KZUUTs7
 Ly0g==
X-Gm-Message-State: ACgBeo0tAksKeL8AG8JShnb+rEIsTrjOM9dS4Y+9AENC/3XEY8E6DHwE
 mN2e1BB9YVSiM10BzMHqteh/UQ==
X-Google-Smtp-Source: AA6agR5EQwjVVVzYeRayhhSbcH/ChDiJtpV+rdWern872b4Zjxl+ztJ3gvtH7fe7lDBLlQ7BenIX7w==
X-Received: by 2002:adf:dc87:0:b0:21e:ecad:a6bc with SMTP id
 r7-20020adfdc87000000b0021eecada6bcmr19884154wrj.218.1660230859198; 
 Thu, 11 Aug 2022 08:14:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfcf0f000000b0021d6a520ce9sm19223338wrj.47.2022.08.11.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A06A1FFBB;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 3/8] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Date: Thu, 11 Aug 2022 16:14:08 +0100
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..5eaf2e79e6 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.30.2


