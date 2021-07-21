Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E250A3D078C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 06:16:41 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m63ey-0003rf-SA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 00:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m63d0-0001mL-PW
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 00:14:38 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m63cz-0008Vv-Cl
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 00:14:38 -0400
Received: by mail-ej1-x62a.google.com with SMTP id hr1so1230982ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 21:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LcAhYDpcNmuzO3kaV9cOM/LYwb1N4sIAjwY66/84PCc=;
 b=eo7bSWNxdOYfwJHETYFOxKjq4Uy3pfe29jVdRRjQT0NRzQJuvgzCmzAaD6nPJ17sb/
 XH3BA3R4KniaQq4xi2simOR+frIu4LPoIvF6Uw3ZJ5d1A/cndMi5ATs1k68wHtYX4qoI
 fDZIkrG7V1BAta68ABNGyKGvzlkheUxzmBpKEGBcCrFmMKdjABOrW1kTnExRfamZ4s2X
 XRpyhGaAiO4Hd9uBfkTTX4mGsq0u4zmGODB5bkEKTnj5Vd4pKdGddyuOCGkCpsr3jddk
 pRyTeYK2Go8NJuGl334zm53bR1jyJxGDffOjdJ/X0DamfInUWzl6w+j1JVvIdaZ7IJJr
 tBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LcAhYDpcNmuzO3kaV9cOM/LYwb1N4sIAjwY66/84PCc=;
 b=ifF6KwGN//0wd+zTwoN6J9HzJaEbpRJNR16ymAD0fvBe9/TDu2dForEFoQLfznqEt9
 eubpgaAuC0ZzbBEloPbHgXMxwRqy4hkWeEEJohjEAfyZ/DvkQCgC7+v66YVxojoFtJ9b
 heHK4nuQevqClbAdM4UtUQPuiHNrucBGH7GA9h4o31BFsVsTQJTVWKcE6loZnovm8aV9
 p2EIToTNWho6C2ynSFnwbJkpSZFC4OESuACqpmWwb0LhSsh2Y8DJdj9TDHv0HfjoO+l6
 GLKIt9L1UCprSbKAd6aPOcXm8kEha6vdGJSXK4TKbosTWXDvzQQlJxCjbSoSUtae8qQX
 hNsQ==
X-Gm-Message-State: AOAM533btD6OojEpme1ergqhuPAxTy6aaP8kAsEA/uhGoaaYfw6CARnp
 DOMbaIyjxA+jPHVKKw6M+eQ=
X-Google-Smtp-Source: ABdhPJxbL5aCBBaU/1yvnx36hRblcHHh4droIqyVqP1hF1q2E8v4AE8PtbMV6X495hV2k7um2tvCqg==
X-Received: by 2002:a17:906:cc15:: with SMTP id
 ml21mr37720907ejb.49.1626840875824; 
 Tue, 20 Jul 2021 21:14:35 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id r27sm9444720edb.66.2021.07.20.21.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 21:14:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/net: e1000e: Don't zero out the VLAN tag in the
 legacy RX descriptor
Date: Wed, 21 Jul 2021 12:15:04 +0800
Message-Id: <20210721041504.464403-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721041504.464403-1-bmeng.cn@gmail.com>
References: <20210721041504.464403-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christina Wang <christina.wang@windriver.com>

In the legacy RX descriptor mode, VLAN tag was saved to d->special
by e1000e_build_rx_metadata() in e1000e_write_lgcy_rx_descr(), but
it was then zeroed out again at the end of the call, which is wrong.

Fixes: c89d416a2b0f ("e1000e: Don't zero out buffer address in rx descriptor")
Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Christina Wang <christina.wang@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v1)

 hw/net/e1000e_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b4bf4ca2f1..8ae6fb7e14 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1285,7 +1285,6 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
                              &d->special);
     d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
     d->status = (uint8_t) le32_to_cpu(status_flags);
-    d->special = 0;
 }
 
 static inline void
-- 
2.25.1


