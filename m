Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A389666F25
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:11:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuMD-0003U6-5Q; Thu, 12 Jan 2023 04:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMB-0003TG-4X
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuM9-0004OK-GX
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:46 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so779589pje.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=q/u9MU41Ym/nBzHy0ljHh7SeGpldDiVkOh8vbPoLl/sc4f71cTnH3WrD6LWBF9suXj
 eknMom/Ccu5JOfTwO0QEGfcZK44G4kCIKCZcxW7CoubRIClW7LCGndEI/7vb8BLK6fQh
 OLWsddaA7b/kqNgiGYL8i5w/sXtJ9BkwWcCpSht3Ef7zAn+e1ozoV0js96S6t2lETEqf
 NIXxSyUwEfAAfO2OQHCUAt9i+34OX4Iyj3r9iHDxNt4EsvCApVgnnBXctlDEUU/dLmRE
 ODNa8yHK3ATyckVtIALr5g8Y91a0GY3j/m9W3VSM+Ilnp7PrXJj1U6LxT5uoTtZRosbt
 uTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DfHbFzEFpZAIU4LZ6NgwvgYjQ8+Nr9IG/Jg0A+8VsYk=;
 b=IyPuLUw44LBEnuHeAOawuMtdxXuyHGaUN0u93UHhQ41fnhFGwy32rG45RKABSC5rbj
 HtNN+Hbu23MqPj7G8H5WEd4HX9JROg/qYYqmnR1qJkokNJZSMHEPpl5Zih/El+UWOMwP
 d05OfUlixgTYZKfDGKUtZ0ddReH3wQflpMfUtYAvIxmvE6k/0h4aCMeJz7Pm/Uy4gbnI
 z5EKX/8e+uKbU+mDz1De2qdubPAU3/WVS4SZWah441Jir+evds1ffrDfwwVz/EjC332c
 5PGnNxw9qJcPne9EoIWX7jTLtNsiWPQG1bkbr+eht914sTY6f51YB/LBOtMfeXi/250B
 n9IQ==
X-Gm-Message-State: AFqh2kpsl96IGTlQQQkmw7gPMX2+6TEP9jsis2+psvJKml0uGA5Kf/Du
 roJpAs66s6Odwe8zruY8JKEvyg==
X-Google-Smtp-Source: AMrXdXviiaFrx9c2QVYJ0LGGFMBvu9pAG/yBxhmvfCUuVLQXDiQXzI7HFcAUc24EZEVTmrlceyabCQ==
X-Received: by 2002:a17:90a:5d08:b0:219:4578:6409 with SMTP id
 s8-20020a17090a5d0800b0021945786409mr78839507pji.41.1673517524871; 
 Thu, 12 Jan 2023 01:58:44 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 10/31] e1000e: Use memcpy to intialize registers
Date: Thu, 12 Jan 2023 18:57:22 +0900
Message-Id: <20230112095743.20123-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
2.39.0


