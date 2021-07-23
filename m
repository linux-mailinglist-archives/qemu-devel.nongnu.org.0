Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108903D35C0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:57:00 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6q3H-00047j-4s
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1t-0002ee-1X
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:33 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1r-0005dl-Kd
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:32 -0400
Received: by mail-ed1-x530.google.com with SMTP id k15so595631edq.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LcAhYDpcNmuzO3kaV9cOM/LYwb1N4sIAjwY66/84PCc=;
 b=ut5fJ3Kav+kIDmIThrq2eVfSabydAjX9u8sAPZ3eDBStvlWwS7S47UuXAyiS8RvHY3
 a1QEdipvflDi8CiK6WMIHatCsXTcQ9f0Pt0EIFesLhtjAXdW1Y3nA/rX18SJVV4XQH2e
 RNw5hxKj30Db2rReLKktMeSspCKe+miN/N58a9/hgFAwZpvNsnijZGjDT07R1ZnwN1ZO
 FVyiWCavd9ylV59Qil4WqyYNIK3+swLLAw4spefXfVivuyNpZ9VUo/SQ1wxQadXYycCH
 0Fwpln+fB7RsVmodJXr7ZNIpKf06ILuq/C3aplU9siLFrhEg2O/PoVtqXOF759Rt8s/f
 0KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LcAhYDpcNmuzO3kaV9cOM/LYwb1N4sIAjwY66/84PCc=;
 b=kT/aObpzVG54PzoakkirM6UJDt59cpmACLhCEXjUjbI8jCZAr49ByaRYXafaTyAjBD
 AzlfwLfcSYoeSJVeqnxyVWTQ8S6WEbQXDlPWx2aGHlTuXbXnmaq6SLQyBQ2J0OqescAz
 3UwtJu/EttcBgdVO/4/kwZT48Tms9VhieAXK5+4YQ1yfz2G3LON+f02EKSah0YS3k/ZD
 kpXvGTrw8/le2vc0WkuxciwssOqacSWAS6kW9TH9BrwlZEt1fv+JblAyJ+PIpq+lOLIM
 MBrR8e2I0EGqwGL1bZSALnYWo9y3C87myBSMeHbssrjGYllpmxH/D6FXfoySE9PSqiNU
 /7tQ==
X-Gm-Message-State: AOAM530ONbGfSfTwmu1i+rNjbm27HOm1s5QurcBwS1YM+e7f8OVNCxLm
 HO0H1pnE1qL1baepPRTDrfg=
X-Google-Smtp-Source: ABdhPJxSuqk20OULlwmX1Mu31dnhvKitVqxmRDjo3qRtN0JkvZH/gzfyxxUH6aykaX5BF7bXJRrosQ==
X-Received: by 2002:a05:6402:74c:: with SMTP id
 p12mr4046901edy.153.1627026930299; 
 Fri, 23 Jul 2021 00:55:30 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jo19sm10330791ejb.59.2021.07.23.00.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:55:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] hw/net: e1000e: Don't zero out the VLAN tag in the
 legacy RX descriptor
Date: Fri, 23 Jul 2021 15:55:12 +0800
Message-Id: <20210723075512.84897-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723075512.84897-1-bmeng.cn@gmail.com>
References: <20210723075512.84897-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
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


