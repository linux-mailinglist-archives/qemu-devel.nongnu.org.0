Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10F685DFB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:37:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3v5-0006US-Gq; Tue, 31 Jan 2023 22:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3v3-0006Sx-4P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:21 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3v1-0000QI-M6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:20 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so17188239plo.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=W84Vc4NE0Ry/t8z8OJXstgFgBS8i5Ambhw82ArubGEagajhrhYZMd/oQxa+13frs5D
 Nkh3dtqgDd67x0JgBTRZrOfZu3qOWRm0jNbAXsVm0zWmSFTmLkziL9dEg43t7VrjwASr
 eGUmlXPkwzi2/lqwNniZw3ocSFwdmK8jdAN4cbTBcMYLhKdxbPq4vcVHPt+dG7Xaga8t
 yvrQO53vVG9mrh7/YuObGDF4FKKVi1CwQ/Z/PxrlfAxlRs6ghQZzO1LCudaFf4UjgT2Y
 /fuqHEqmNoZ7a5YlbuJSswgU/h/QA4lz5zoTrj2QGQnFtXzZaPQU0hHdc6nz1fHmb2Qs
 cgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I2qnGVaZLWPm0YolfUBdJT/b10cmArelvHHWWX/I+I=;
 b=s1q+fOMRmgmECPhIk6aaWs8qrc86Gr5XvjQpWWLAEtj5GLrIWOQOy00ELZF8IjUteK
 Ol2nxa3NfsYAWXZFrtQ+fJgrgi6nOtNgKhedbHz2N4ds7pH1lX1yxESYp/3mk6HrE9M6
 dP/gl5D/9LBFWiLVewG+3fElD7Lm4oH1dVpEqIK94aDFZrTkPUgzZcmM5g99JbeVEQUo
 Pc8q7cVYSYolW8zBRb8lowID5h6VXWt5HTry5lhC6XxHwpp7n71ayqjJcfqd/TZMrCLa
 Zm1/VcjsXw5d+wjDEEVRPC9ASxNX+RBKf5f1OnzMRP7HbZLEABpfB3VxkPvS7BmlAZl9
 qtuA==
X-Gm-Message-State: AO0yUKXBgkcygDDJp61MUV2PMTKpOJ/d4LmCI6+7e/ZOyt8bOixRbpw2
 7NU2RFvR5+aNEArPTMD26YrCnw==
X-Google-Smtp-Source: AK7set+whwaMntuHqZqwezAI+wHvJY8JuViom609LpfY5KPqeo6+bTppeyY7oxqhrpTZg8bv/lSpKA==
X-Received: by 2002:a17:902:d50e:b0:196:82b6:3d8d with SMTP id
 b14-20020a170902d50e00b0019682b63d8dmr1362454plg.46.1675222579062; 
 Tue, 31 Jan 2023 19:36:19 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:18 -0800 (PST)
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
Subject: [PATCH v5 10/29] e1000e: Use memcpy to intialize registers
Date: Wed,  1 Feb 2023 12:35:20 +0900
Message-Id: <20230201033539.30049-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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

Use memcpy instead of memmove to initialize registers. The initial
register templates and register table instances will never overlap.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 6a4da72bd3..87f964cdc1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3511,9 +3511,9 @@ e1000e_core_reset(E1000ECore *core)
     e1000e_intrmgr_reset(core);
 
     memset(core->phy, 0, sizeof core->phy);
-    memmove(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
+    memcpy(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
     memset(core->mac, 0, sizeof core->mac);
-    memmove(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
+    memcpy(core->mac, e1000e_mac_reg_init, sizeof e1000e_mac_reg_init);
 
     core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
 
-- 
2.39.1


