Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4D39174F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:27:03 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsco-0000z1-EZ
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV6-0001a4-9y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUy-00033q-CB
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so382730wme.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzZcKLssN7IMbDyrpIALXOlPU1SgzuV4mOV0Xk2F1ro=;
 b=EdvBbosOQzKMxr8CF4OHRsrOo+a4DByEwTwhnCH4NvbGm/DN0eTvXW7z47PeIQf7i1
 hWD3UjR24N3L0WVWOr5gbbaK2L1QxOReU24L6OpROSYkH/aIE7SAno+yNp+Gs0FhqLrw
 4Fvan53o8KG8Higqh+wMRfuczEVdoBx9hN77+IwTzjTOi/PiEi+2jJ+5MIP6MIp/mDKt
 0sceW266kQBnSHyyWTQBaVYmQejIDCKq4Ov8G3K96Imol0JZVkLfBsZwEbrDl6K6W/uV
 6QPs+E+Xs2/9HSDLfo9A4VKFNk0hBUqdD3CYSGOULrkgc0Qthw5l4L0pGtSGwQMT4hIO
 chJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzZcKLssN7IMbDyrpIALXOlPU1SgzuV4mOV0Xk2F1ro=;
 b=Egznp0+w5AldQF2d+fTpu3GtRx2NYBPYHs/cgRUl2Eg7wo82xdnnc+mDw/ijGJGPQs
 FbqP637hyMsDZnIHzLCkwsVn/jtVXZ9jkggPDY8aMEtO5620HeXr/VYVRkkozp1gfnzp
 AXDpnzY8CCWgp0h2W9Y7p3bsOqSRjtBp9etqJnv43ZMppaBgNMwTZxWb8HPl74PMNS/G
 L7ZKMmFwvXVl8iLRZTIvTCb0V81g7GYx5CRsuDwywG6Aaz0Nsl3ubJwoQ7S6MQxoDpKz
 QneMgFd+BhSlnyxuCZAfRrKbgqeXmH2FmlY6I1X7dS0cAei4vO5rHqj69EEWu3jb1fwj
 KM5w==
X-Gm-Message-State: AOAM5335r16S0+0+FkzD4DhYbA+kI/FDUwXHimnZUVXBbNLiG+OddU4x
 cx1FEx+Z8mWlyZWfRt8Dg3I1EA==
X-Google-Smtp-Source: ABdhPJz/YwYJK9TWFzbv6ha0yQNxxvWtkT/WCKqqWxvRgjZhOCw1PkRPDq+3Ja1SN2SnuG2fcCjGdg==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr28463396wmq.37.1622031535083; 
 Wed, 26 May 2021 05:18:55 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id q11sm14634522wrx.80.2021.05.26.05.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:54 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 3/4] target/arm: use raise_exception_ra for MTE check failure
Date: Wed, 26 May 2021 13:18:46 +0100
Message-Id: <20210526121847.1935454-4-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that raise_exception_ra restores the state before raising the
exception we can use restore_exception_ra to perform the state restore +
exception raising without clobbering the syndrome.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/mte_helper.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index a6fccc6e69e2..d48419583747 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -563,20 +563,13 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
 
     switch (tcf) {
     case 1:
-        /*
-         * Tag check fail causes a synchronous exception.
-         *
-         * In restore_state_to_opc, we set the exception syndrome
-         * for the load or store operation.  Unwind first so we
-         * may overwrite that with the syndrome for the tag check.
-         */
-        cpu_restore_state(env_cpu(env), ra, true);
         env->exception.vaddress = dirty_ptr;
 
         is_write = FIELD_EX32(desc, MTEDESC, WRITE);
         syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
                                     is_write, 0x11);
-        raise_exception(env, EXCP_DATA_ABORT, syn, exception_target_el(env));
+        raise_exception_ra(env, EXCP_DATA_ABORT, syn,
+                           exception_target_el(env), ra);
         /* noreturn, but fall through to the assert anyway */
 
     case 0:
-- 
2.30.2


