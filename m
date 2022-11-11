Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F7D625486
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfm-00069G-59; Fri, 11 Nov 2022 02:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfS-00068P-Dw
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:38 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfG-0007UR-0G
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:38 -0500
Received: by mail-pf1-x42a.google.com with SMTP id b29so4205970pfp.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=kXndUWUgqAVlTHwlL/ikUyabC/IIR7Gnr869HIupBA2HF+thhZ2+lVbv4bb0DIFX7K
 kKy/2RJB3mQZbeU65aC+dxgY9EcrmJm/KoiNUJX5hRKIabAcRTgPFOVRY9C90zijoVRq
 3PWpuFhQYgZl1Lkcogoej3/lQ+OMEFp666WY6NB2h3LPjYjV13h5M1fBvDKbHiI13qLd
 +wSkA3WnnynVpock6ltg8XV1MaKkYNzd2UecAj0Cv3TiYXT9j0cyY13+lNeTKhvfxc5Z
 F3vOiHkBcZ2GVtWBjz7FnOOaoUJ+VM+YMWXc7e/7MEnVR/7tbN26J+54MiNkKyObmwl8
 BX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1fcBWbZUmm5Jnpz4Izudl/A6K0HNswQpl9r23JhxDb4=;
 b=bey5m4xrzGCj50ZWVrP7ZvfPuMwGJ0FDo7eYz/4kZkPD6pw2VH14Dk4QuFWCP1vGjg
 hFeGWDLhj5a1TeoJcST0HVd9WuFCdKUo28m84xb/CEvzU8VMo2dfLimTemVP85NnC5Lm
 ez+ScEDumIoLuq1yGQuJU7kVRCfeKrx4NBp14ahv2VH/tYXW/0D1ybytzl+qeRoPO10u
 U0Cb0gOxljzn6ZCL5RBsWUkmGL+Iplx0E1n8avWbRPi4uXFaEmeAME++eKhkDgnncYBQ
 2nfILsGruGCNIdQJAe4nmFT+79k+v115z02vyqLfKsM//KYI8QtACE2oARYNuOGA/udW
 1h1Q==
X-Gm-Message-State: ANoB5pl29RpvqBPhtZ2TFLKLgiYPXciYBvXxNiabPIudnKCsv3IHtnjD
 zT5NoUJI1LYghgaWbyJjB/c21Ke4P1fidKaE
X-Google-Smtp-Source: AA0mqf5FX3iVrGWT5EOSzIH8c7nhtTxJlPyTzC6qvpy0CiQNyCWF2SozS4VC6eUdPoDHzoJdRz18cQ==
X-Received: by 2002:a63:d802:0:b0:43c:ac7c:ee27 with SMTP id
 b2-20020a63d802000000b0043cac7cee27mr572236pgh.583.1668152483981; 
 Thu, 10 Nov 2022 23:41:23 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 07/45] accel/tcg: Set cflags_next_tb in
 cpu_common_initfn
Date: Fri, 11 Nov 2022 17:40:23 +1000
Message-Id: <20221111074101.2069454-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

While we initialize this value in cpu_common_reset, that
isn't called during startup, so set it as well in init.
This fixes -singlestep versus the very first TB.

Fixes: 04f5b647ed07 ("accel/tcg: Handle -singlestep in curr_cflags")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d..6a4022eb14 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -235,6 +235,7 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for softmmu */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
+    cpu->cflags_next_tb = -1;
 
     qemu_mutex_init(&cpu->work_mutex);
     QSIMPLEQ_INIT(&cpu->work_list);
-- 
2.34.1


