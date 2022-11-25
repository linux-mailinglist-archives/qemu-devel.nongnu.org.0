Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A86638BCA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZGg-0007mi-Hn; Fri, 25 Nov 2022 09:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZGY-0007iN-Eq
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:01:20 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZGW-0006aQ-KL
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:01:18 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q12so145250pfn.10
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HkURA5rrc7cPw3f9lPSPOzq7XCulGkXY+0PZiZMVG94=;
 b=d42W3kB43ufADsykzzjI9E2pinz4A7MP7T+lKfqUWqSJkFJibCGXLBm2RUXY7XBcTp
 1c+zp53aLSGp5eekugbdUhSGLJmRj3amS0aVUiRru9t8VkdgDLXD+E74IEy1OpBegzDd
 FfEvYK6aF0NCF1bdDbotLLtffsYi5Bcct4TcDyzpkVBDmhad3mDS6fzWXyMFZylwU/Yt
 4YEjqjtlD6XUZTlwiBpO9c4U7zVUuToiyrW6mTetKsxkqq7cOx2OmWQhmLLnwmE8vGEl
 8IACOFtoBgtD71bKFNYFpqZnZW+k8duB2/mbhvYr+wFMjN9BIFOsitHCe/U05fqLz8Gt
 wosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HkURA5rrc7cPw3f9lPSPOzq7XCulGkXY+0PZiZMVG94=;
 b=YkIftE29ohGJhmrZF/0zeFQqV8mc1a12jNtnTNI9aPSsfQZ1xIEnfm0gGTTKJaOIOK
 NaGRQyqlgCFa8qiqnrSYjXDDo9i9d4+nE4N2VC/Y1NdL6zJ8lxN/Y5OqLP9IM8OCD3qg
 CcDoKOP62Fkpjy7+7Lp0AnbpbMnXqU6/+UXsZvJ8YwOIAmWvis9zF10tgDFeSjSOUN4P
 VhmED0E45XslbTzF98DsIEgWXWSIZr8WMXDv7v5DhquZH6acSnUlGgSYyewdgGy/s0QL
 VrZ8uJxpQ3isgWfdcrBGB1yXfdqbyxmW+TJ/bDy86rQQQEDrHudR3JxFojtNbOQHqmLv
 gNsg==
X-Gm-Message-State: ANoB5pnMligFKBFTpeaVMzUb48106TeK9s3sckNqT7yszNEmNCwCJN7A
 lQvija85G/qcuR3sQEhJIONBvV+wWNHJsw==
X-Google-Smtp-Source: AA0mqf6zaYFB9E2yzBBvjavHXf8Q3+NZAwWNTBy8hu0R39TzKDaBi8f84Y5JojxaP4XUMT7gaiedAQ==
X-Received: by 2002:a63:5c02:0:b0:476:898c:ded5 with SMTP id
 q2-20020a635c02000000b00476898cded5mr17380891pgb.299.1669384873810; 
 Fri, 25 Nov 2022 06:01:13 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a631e55000000b004597e92f99dsm2625867pgm.66.2022.11.25.06.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:01:13 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000e: Use memcpy to intialize registers
Date: Fri, 25 Nov 2022 23:01:05 +0900
Message-Id: <20221125140105.55925-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
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
index fc9cdb4528..60df0d8f00 100644
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
2.38.1


