Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49D6A05F1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8iu-0005z3-77; Thu, 23 Feb 2023 05:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8ip-0005xQ-0A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:07 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8in-0001V5-7A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i10so3315859plr.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNOjcckbVLx/23/g6t4iefFUn+kYW7NtIXTVzOhDNpg=;
 b=AZfm2u6CMm13nYuxi5xsVvv9PwUb/chbVesDbPsvaUAlvFGHxuMheD7COUkVsHcGwA
 PAjUbZT8Ptn1t8+TECPg5eYxCmyaVlMJ1PFqLgJJ6FMMWTT1macHnCdPQxxshfULxX5p
 VRBbjhnFK6r/889eR5Oe5q1M9SpTe5rwE8yKTPbY9Q3Jq3/rZGD+JxuFoRxz7si9gbvY
 e1IlHzN4+iNotQ1Wd7QcNIUEgtv3MUQpBOi77R6J6Cs4/wmWxB+lQODmmSdGgCqjwj62
 Y5c1u7/LOZsglerwLWhamLG1uEVgSq1MK1YGeiZQubsPCX1aSE+pMtnt1sO4J+Mlbwp4
 ZQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNOjcckbVLx/23/g6t4iefFUn+kYW7NtIXTVzOhDNpg=;
 b=JUN5a8Xe9phyXgN5KxLdu2rodIaGu7/GSNQro32+cz+vISsU3Q0URpQgTJ8gwL9ADU
 Udi2h0tE85avMl0PEeiN7KvLQ3ITebr1EHlqd/x7ynrbzDMhrinmyDiVsrtOE5QzU6rE
 JuRQYX/Or8A6U4airqgfXP6IU3v0I+v5FqSFWADTjjF4zcZQOS0Ga6j71Aw/xzxpm1pH
 JJ0pqIS2Hoqn+0SGZkTkEuY1YA+yov5raxMZLjP3HaZhy1U3h1ttD7/YpWspo2xPNS4r
 8vl/rmCuxL7i/CfNO1BLK6yZcLjQtal15xvX+r9YBpbhuoRZzDxis9ttpvbaHY804pum
 lG2g==
X-Gm-Message-State: AO0yUKWFG2qOyhQZudIDwZGgaJBRHET82CJ1QtVQl+WrGkhoRnE/xRgS
 aMeEx+KhaQG4vGNsUF2jnVPq1w==
X-Google-Smtp-Source: AK7set8l9mxOQbD78dk6+V5mnaUvXeinBEFeyU23qhHe9JuPdj76Fg7hiszMvitYe85WJZMG6U4a1w==
X-Received: by 2002:a17:903:848:b0:19b:3b4:3ae8 with SMTP id
 ks8-20020a170903084800b0019b03b43ae8mr9534231plb.57.1677147663953; 
 Thu, 23 Feb 2023 02:21:03 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 06/34] e1000e: Introduce E1000E_LOW_BITS_SET_FUNC
Date: Thu, 23 Feb 2023 19:19:50 +0900
Message-Id: <20230223102018.141748-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

e1000e_set_16bit and e1000e_set_12bit look so similar so define a
generic macro.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 181c1e0c2a..1cafc38f50 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2440,17 +2440,15 @@ e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
     core->mac[FCRTL] = val & 0x8000FFF8;
 }
 
-static inline void
-e1000e_set_16bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xffff;
-}
+#define E1000E_LOW_BITS_SET_FUNC(num)                                \
+    static void                                                      \
+    e1000e_set_##num##bit(E1000ECore *core, int index, uint32_t val) \
+    {                                                                \
+        core->mac[index] = val & (BIT(num) - 1);                     \
+    }
 
-static void
-e1000e_set_12bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xfff;
-}
+E1000E_LOW_BITS_SET_FUNC(12)
+E1000E_LOW_BITS_SET_FUNC(16)
 
 static void
 e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
-- 
2.39.1


