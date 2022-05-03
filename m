Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06F51827E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:45:58 +0200 (CEST)
Received: from localhost ([::1]:44240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlq2X-0006s7-N1
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqq-0003yi-6q; Tue, 03 May 2022 06:33:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqo-0003f7-Ar; Tue, 03 May 2022 06:33:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1820748pjv.4; 
 Tue, 03 May 2022 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uq6KnBqo+6CSEhbKzngQA2FxHJ1XZB++97y0vZbTJE=;
 b=cVDH97BgMnxeNk5bjazUZ0lKjGbEqvBmZDx2ww33H7FRMk4Ye8aqBKY+2Y+XDXwy5Y
 kE0YR0tnNqB96SzGxc6xHzwo54BcWdLwQxcoZeIzGZ0m+q0jG0igOp3fCruby9yDaPZt
 H+kLuFCJmQWkf8oHV86R/1UJ34u0Qkpjqm8pFpChyde3/YP06DT+m97kocI9CYK+Asiq
 Jm4DDIBr3z3hEq6DYtjcoBRynytwKrGWVjNBw/pvQqnQgUb7mWXG2NvGWTsAdEEPHcH7
 W1Cmto7kun0josBc8QIq6EejubAczdzZ7t5mkMLBfbnMzeOJ5mDobhleagqr/jmc1anZ
 lmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uq6KnBqo+6CSEhbKzngQA2FxHJ1XZB++97y0vZbTJE=;
 b=0DyANN205h5kUQ2f5Jnjw8fuChKPtKGvxFsCMAzI1ap9Lvx1Apj3MvzuSj//cQsLI+
 xKT0nzuO8QenP+8JZfCMFyrFpPKKSw504Slc9ntryK8xmbGM4NLAKRllovarkoueVQKZ
 3HKGb+6mQbJSHipeptdR8B2zCD+KNi4w4WXHmDd0vAK07xj2U0Fl8AvXuudUxhZUT5oR
 //mzsNpn32CtSbKwLfjtH+38fU8mWazAJi/gX4wR6Ot7rZlQFvsV4S+E1/wDFtAY46xB
 RGqwxSkwEzqGJaxr2B4H5ivYltNbxDkX2Rg6uyMMRYtAWP/tsOX8wip1OhgbXyrFzn33
 zZIA==
X-Gm-Message-State: AOAM531wpvEC5LBc/3/dKJUmbbOLEhfsaP0RMPPP7Iwz0+c1vdcebsYz
 FA0NCqWb0aJQRHBwYYPexMxQRRZT1ZYYfQ==
X-Google-Smtp-Source: ABdhPJz/NpmKkgwiexUeF0a4WGl+NsYpxR6LXUrETQ6sRYXCTezIIuV9SMLXUmpmkiX0d5oIajJSLA==
X-Received: by 2002:a17:902:e84d:b0:15e:b0af:477b with SMTP id
 t13-20020a170902e84d00b0015eb0af477bmr5514045plg.49.1651574028691; 
 Tue, 03 May 2022 03:33:48 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-108-62.tpgi.com.au.
 [193.116.108.62]) by smtp.gmail.com with ESMTPSA id
 x48-20020a056a000bf000b0050dc76281dcsm6056301pfu.182.2022.05.03.03.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 03:33:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 2/4] tcg/ppc: ST_ST memory ordering is not provided with
 eieio
Date: Tue,  3 May 2022 20:33:32 +1000
Message-Id: <20220503103334.2046414-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503103334.2046414-1-npiggin@gmail.com>
References: <20220503103334.2046414-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1029.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eieio does not provide ordering between stores to CI memory and stores
to cacheable memory so it can't be used as a general ST_ST barrier.

Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
---
 tcg/ppc/tcg-target.c.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index cfcd121f9c..3ff845d063 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1836,8 +1836,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     a0 &= TCG_MO_ALL;
     if (a0 == TCG_MO_LD_LD) {
         insn = LWSYNC;
-    } else if (a0 == TCG_MO_ST_ST) {
-        insn = EIEIO;
     }
     tcg_out32(s, insn);
 }
-- 
2.35.1


