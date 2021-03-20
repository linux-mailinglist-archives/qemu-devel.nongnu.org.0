Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5A342E73
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:49:48 +0100 (CET)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNenL-0000bu-4u
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNelt-0008PA-K7
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:48:17 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1lNelp-00062E-HW
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:48:17 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j7so12269712wrd.1
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLteRjOk20aLA3lfO0lOsZkfXiLgV3PDYmI6pn7R4ak=;
 b=ef1IuWahYvxptHEvqtOGvqn2FXIeFIVHG1ONWBeK8X9Az5zin4xXodLiplU4D2J0V7
 QIrRMPLg/6uZ/QI6CvfrdzW2w6NjYL/0fGChgFLCFzy6XHGyK8ybnGI9HHgQLFGn/bTD
 0So0haXk4PqDud3wHywz407v+aos5eje7kU5M51M105Kp2VECHUYoCIzp/ILYntAtjs2
 XAWc9soFGnUJikwp+2uB/sOApgOeZbS4Ckb1R1NscWSs5SpCHMRjx8gk6IfgT6AYVm91
 W+61KuAGjwdG2OUPGm1sXkYU8WXhD+V3eXfnxVgqpakDEkEDqTgDFrQnta2cp2MeWw+a
 14Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLteRjOk20aLA3lfO0lOsZkfXiLgV3PDYmI6pn7R4ak=;
 b=NJhrQ2hpro6+TJFvnSCK1ipw2EDZ32YjCU0S6Z/qEymbgV/bC5ieQgygi27V5TlBwR
 TJfe6I1/hfPXmm0YUYUuXCB4YH1OG1+nwmAgrxXwwvXmIrG83A1ojiNjU8RnG6fx4Ki5
 X83slsjdJontHF34aixVfvHJVPSTZi2y/LU3tea+GIqLjxCpwXiScaQtJmypF/pMog1b
 oDiz3Y3op7+HB+Aea0xb6A2Ga2b2jt6ApUMpsSvuG1Mv3/+ZNExGcG8bRfZ/54XQvGYe
 QI1YrUFQvxWLt+ewXNOtc3nnCKGlaafz3dGPtZLgsANSKnMUmc16bARItFEm11ZoJPri
 EPcg==
X-Gm-Message-State: AOAM530roHO5NkinqOpx94yE36kdXZNS1+1Hl97Dct6s3f0VKhyzSyml
 +vVRByxRAqSkyl6JQaqgwU+ZsA==
X-Google-Smtp-Source: ABdhPJx0ZDafoeYvc1BTz+DA8cCwwoPpXtyEhZA8K3Yvtdyt5z54Ef/GIuwUfew3O1knfMyyKGCZRA==
X-Received: by 2002:a5d:66c8:: with SMTP id k8mr10142175wrw.163.1616258891148; 
 Sat, 20 Mar 2021 09:48:11 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local
 (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id p16sm16367184wrt.54.2021.03.20.09.48.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 20 Mar 2021 09:48:10 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id 6F650336127; Sat, 20 Mar 2021 16:48:09 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Propagate gnutls dependency to migration
Date: Sat, 20 Mar 2021 16:47:30 +0000
Message-Id: <20210320164730.33285-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Jessica Clarke <jrtc27@jrtc27.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
for softmmu configs, which pull in migration's use of gnutls.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 migration/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/meson.build b/migration/meson.build
index 9645f44005..6fa2f8745d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -24,7 +24,7 @@ softmmu_ss.add(files(
   'savevm.c',
   'socket.c',
   'tls.c',
-))
+), gnutls)
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
 softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
-- 
2.31.0


