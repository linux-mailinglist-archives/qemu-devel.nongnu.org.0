Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C26F4E33
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:41:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0XW-0001O7-1d; Tue, 02 May 2023 20:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XR-0001N0-AD; Tue, 02 May 2023 20:40:09 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pu0XP-0006pv-9W; Tue, 02 May 2023 20:40:08 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64115eef620so1107859b3a.1; 
 Tue, 02 May 2023 17:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683074405; x=1685666405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=raYV73kiQjU4FSKpqRIXvmzU7Jm7t5/7IOn4lYHWiio=;
 b=NGAgFHpQsSINaRca0ULR/1QWP3f+P2uxDdUuei9545BDdqOsCYNjOaB53X2KNA/UF1
 aqiS2Co47K89uyWQfBlF+0SkKQluZXuXNK78Q7WX/oXRbGdivBAiTUowjh0tXBJcqhb2
 HjxyoFPE05hKG6DEaMdaqO7YVrZRs/f31DWzzqZfOZkJJ2NaBtM/si79TcFq4pL0iC15
 CPT/UdaMnZ54Cg35EaBXLPxO1yJJ4Fs0jMzcEXxoNLHO29OzZZikjuz9FTlS+IDsqg+6
 AiaFGLZB64OhohuIqvxYUMZQUi+HEU2/JDCZY2D0H5z+MxzRCDpZdO9urKQAFr7UYHcM
 aJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683074405; x=1685666405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=raYV73kiQjU4FSKpqRIXvmzU7Jm7t5/7IOn4lYHWiio=;
 b=gR7jp7V9nYHfRQ6IoCzD4RhQ2+Fx2CuhNzlXRtBSqorbUfZ1DqLl2Xvm72tC4KsKJa
 5sAcTZJP7JqkaMThcfWW0DukKHGaXmnb9Ay+wGdr1KzQ0zgrxAJSqejRJanNZJ8yKEjS
 j8BN9/B4MudBYocZHqPOwcJsV6cq+kFc05US5hgamKjKK6T6+A2znDaIwdxOVvxXxkr5
 ouwm6AVm3iiJoOTGqc+R7IVcN8GtD7tQjgGRgxB6mGLtudhtlkqCRo8E9QcgW3OUpR5h
 wzQlyUgxowoPssErEzTbBBcEbptPMCzwoH4rsR95mJ/sA7Ceax9wQAKSWlj1uPx0knbe
 T0RQ==
X-Gm-Message-State: AC+VfDzHf28CO3Ty2r+xPS+CD8TDOsgC9+nBb2CrcFwFcfUZfF5yI6qR
 PJlmqJ2aLJUnQz1d2aQOKpEr34YfpKIeMg==
X-Google-Smtp-Source: ACHHUZ4qWd3XI7uCt8Y9NaJ1GEQ4VlyAAjWT9DqNXhAYsNH4BYevXf1W2LjoFt0ZG4avxHBimV2nTg==
X-Received: by 2002:a05:6a20:2583:b0:f4:ac2d:8eb7 with SMTP id
 k3-20020a056a20258300b000f4ac2d8eb7mr367589pzd.31.1683074404841; 
 Tue, 02 May 2023 17:40:04 -0700 (PDT)
Received: from wheely.local0.net (118-208-214-188.tpgi.com.au.
 [118.208.214.188]) by smtp.gmail.com with ESMTPSA id
 e13-20020a63db0d000000b0050f7208b4bcsm19332338pgg.89.2023.05.02.17.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:40:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
Subject: [RFC PATCH 1/4] spapr: H_ENTER_NESTED should restore host XER ca field
Date: Wed,  3 May 2023 10:39:51 +1000
Message-Id: <20230503003954.128188-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503003954.128188-1-npiggin@gmail.com>
References: <20230503003954.128188-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix missing env->ca restore when going from L2 back to the host.

Fixes: 120f738a467 ("spapr: implement nested-hv capability for the virtual hypervisor")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ec4def62f8..be225adaf6 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1785,6 +1785,7 @@ out_restore_l1:
     env->cfar = spapr_cpu->nested_host_state->cfar;
     env->xer = spapr_cpu->nested_host_state->xer;
     env->so = spapr_cpu->nested_host_state->so;
+    env->ca = spapr_cpu->nested_host_state->ca;
     env->ov = spapr_cpu->nested_host_state->ov;
     env->ov32 = spapr_cpu->nested_host_state->ov32;
     env->ca32 = spapr_cpu->nested_host_state->ca32;
-- 
2.40.1


