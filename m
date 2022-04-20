Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A65092EB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:37:28 +0200 (CEST)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIwx-00056r-If
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeI-0001Fb-LA; Wed, 20 Apr 2022 18:18:10 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:41891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIeG-0006Dk-Ux; Wed, 20 Apr 2022 18:18:10 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 v12-20020a9d7d0c000000b006054b51c3d4so2047305otn.8; 
 Wed, 20 Apr 2022 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37ljPgHCJP2c7bsIS4SioAST+WA4igDPpUSqHVmoJIg=;
 b=cH9gXoHRGa5TAGVpZBFh4yTtPfyA0jrF/o0IOd9AhiOE8gWejO1UwKP9jWkOxlwwYx
 RToX/x0dRHmHRnMPFtW59SOWEZrqZSAZKy6Z28Fq1NTUk9xuCBVS5MFpTP4/dqR/O9dm
 G+ezJzsZmnkSbsztQUL/UglP9Pv/D3hSLGpXhA8NOILzahcZs3HihNC9kRGHZEeM2O08
 eX8PhehZrt5nEN/XGhaUcOhQMq0fBkkmrKvjx0C5/BCazDoqVlFl0Ot0AeiAQkt8RwHZ
 HuE1zFoEnLi3P9uwWuj9I8mCEsOL1mt+qXjaeBSVeDnKue6z1pFdLmuJXSE2AVw0oHCx
 m9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37ljPgHCJP2c7bsIS4SioAST+WA4igDPpUSqHVmoJIg=;
 b=wUcKth7Ec7pE+IW4+mI1eyP3xtm+Y1pjhpEdyYqVcJPkY+IVusgo8WynppZTrkQ+d4
 P71RDsLv0A8LKn2BlDJej8R51TM2y1YQrgJzMpdt9SVrvZH2rarmvBk6bLpFXfiYdjKd
 Mf9xXkWKeKnkXRGy8ZW7mG5Hft7T6PBvYEqGvU/vfqZQTbbWYyDDjHda43RDnZaHUd5g
 fQ5XJxEaOAaWExq8bQduMshEwQyDane2wRKAZJD9Rvke3x2ApaH2/c1qU+2F52wer7q/
 xWxOD2zaeaVO6KYsGxzuHQ0GAdlxNMy4vkwTte220dhjuLRrre+2jUrRun73Jcb8R/cq
 25aA==
X-Gm-Message-State: AOAM530IUFPjz2HJ2g6OrhIN60y2nutfdI9ZsnwUJfmCcPBdp3f2dRXv
 cn9VsIAh83TLmvgYDlLqyB89ffv12MA=
X-Google-Smtp-Source: ABdhPJxqGe20DQ6wzOcQG5V4f0BhJDeJ0loz52mvWKzh9p3hWT7yJuwOLWyse8kMNrX56wQOVe4ZvA==
X-Received: by 2002:a9d:6f8a:0:b0:605:526f:4694 with SMTP id
 h10-20020a9d6f8a000000b00605526f4694mr4244750otq.51.1650493087409; 
 Wed, 20 Apr 2022 15:18:07 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:18:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] target/ppc: Add two missing register callbacks on POWER10
Date: Wed, 20 Apr 2022 19:13:28 -0300
Message-Id: <20220420221329.169755-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, Fabiano Rosas <farosas@linux.ibm.com>,
 danielhb413@gmail.com, richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Barrat <fbarrat@linux.ibm.com>

This patch adds tcg accessors for 2 SPRs which were missing on P10:

- the TBU40 register is used to write the upper 40 bits of the
timebase register. It is used by kvm to update the timebase when
entering/exiting the guest on P9 and above. The missing definition was
causing erratic decrementer interrupts in a pseries/kvm guest running
in a powernv10/tcg host, typically resulting in hangs.

- the missing DPDES SPR was found through code inspection. It exists
unchanged on P10.

Both existed on previous versions of the processor and a bit of git
archaeology hints that they were added while the P10 model was already
being worked on so they may have simply fallen through the cracks.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220411125900.352028-1-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 5062d0e478..d42e2ba8e0 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6457,6 +6457,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power5p_common_sprs(env);
     register_power5p_lpar_sprs(env);
     register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
     register_power6_dbg_sprs(env);
     register_power8_tce_address_control_sprs(env);
@@ -6467,6 +6468,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_pmu_user_sprs(env);
     register_power8_tm_sprs(env);
     register_power8_pspb_sprs(env);
+    register_power8_dpdes_sprs(env);
     register_vtb_sprs(env);
     register_power8_ic_sprs(env);
     register_power8_book4_sprs(env);
-- 
2.35.1


