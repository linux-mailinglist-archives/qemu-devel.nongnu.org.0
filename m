Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ACC638BD8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:07:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZLz-0001Rf-CI; Fri, 25 Nov 2022 09:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZLx-0001RW-U2
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:06:53 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZLw-00018U-F8
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:06:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so7819303pjc.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CEZgkTUK8/7o+OF64BRHrgO8GkoUS6kIA2tJ0VRVvCU=;
 b=Bbzoch53u9J6PL3OUOAIUOThQOTz4FmKBGsT89Xg1CE0mlKRHcSHJ4BScNjH5p7lpo
 QtaBkp5au1yOmFY+gd8xh5+RDpHwc0rKs1ASMRzcdPxsAzt+JGAZtSQV6oK2xg25jnfl
 ry9FA85VoEL+rIq3s7WhG+C0Am/bsSSdLejHbqsAYoi7RfeKsV/i4rhUB/fsIIG/07pZ
 wDciunxGoaHXP86CrKD/PAWwigGJxew8YaVwt8836gNXazGqNIPmniWvEkDLfEBUjMDr
 jUTiuerwLLVYejvZrxBSznKRRT9qdw2g8Fwa+kc+pActebkmrmks8iSy/QYIqq174DvH
 O5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEZgkTUK8/7o+OF64BRHrgO8GkoUS6kIA2tJ0VRVvCU=;
 b=6fL1mDtzk52S/kswx4A1WK2GYRmEtbq69FYQxpC3gC8rZoAoeW8zF8U2G1QBQv9ylm
 pAYnZmmOe47i3T6RqoRwx5qos053MpBfLh1oQ6wGowsHrv8AerYUzXoY0/ewEsRHJASc
 HDZBbBp1SofC8iYIkEiuJxm7aN8CbRCGikiQV/81AJCNTVZe+FNei65xmGF+fVmDiB6c
 lgnuqnMkXK3sIuCsiCHALaNDVMcxUhxzYAhWP9wMR1e2YAL/VOGfvFyxF8RimTvag3gL
 yavsFzuxZWNRDKx/Zn0G4cg4xRKZOqvkO3FYd2svUPW+2IHgq6BJ5Voevqwf8hucQiZC
 1nEQ==
X-Gm-Message-State: ANoB5pnQq0oOIN9BJIeCamerpyEvXvGo0Ah2ZWw25OgOWmjMQVuotwtq
 9RK9VC2r/Dcs98JE9PF3g/ABxQL6lFM0Kw==
X-Google-Smtp-Source: AA0mqf4zMZzZ/oW1yKEoXBgKRILxCRhLOVa+OF+D6wPC0lxUw7WtpecistnO7FlD2up2QGkrBgjWUw==
X-Received: by 2002:a17:902:e013:b0:189:40ce:3ecc with SMTP id
 o19-20020a170902e01300b0018940ce3eccmr13240374plo.63.1669385210763; 
 Fri, 25 Nov 2022 06:06:50 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090264d700b00189667acf15sm1706427pli.162.2022.11.25.06.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:06:50 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] docs/devel/reset.rst: Correct function names
Date: Fri, 25 Nov 2022 23:06:45 +0900
Message-Id: <20221125140645.56490-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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

resettable_class_set_parent_phases() was mistakenly called
resettable_class_set_parent_reset_phases() in some places.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/reset.rst | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index 7cc6a6b314..38ed1790f7 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -184,21 +184,20 @@ in reset.
     {
         MyDevClass *myclass = MYDEV_CLASS(class);
         ResettableClass *rc = RESETTABLE_CLASS(class);
-        resettable_class_set_parent_reset_phases(rc,
-                                                 mydev_reset_enter,
-                                                 mydev_reset_hold,
-                                                 mydev_reset_exit,
-                                                 &myclass->parent_phases);
+        resettable_class_set_parent_phases(rc,
+                                           mydev_reset_enter,
+                                           mydev_reset_hold,
+                                           mydev_reset_exit,
+                                           &myclass->parent_phases);
     }
 
 In the above example, we override all three phases. It is possible to override
 only some of them by passing NULL instead of a function pointer to
-``resettable_class_set_parent_reset_phases()``. For example, the following will
+``resettable_class_set_parent_phases()``. For example, the following will
 only override the *enter* phase and leave *hold* and *exit* untouched::
 
-    resettable_class_set_parent_reset_phases(rc, mydev_reset_enter,
-                                             NULL, NULL,
-                                             &myclass->parent_phases);
+    resettable_class_set_parent_phases(rc, mydev_reset_enter, NULL, NULL,
+                                       &myclass->parent_phases);
 
 This is equivalent to providing a trivial implementation of the hold and exit
 phases which does nothing but call the parent class's implementation of the
-- 
2.38.1


