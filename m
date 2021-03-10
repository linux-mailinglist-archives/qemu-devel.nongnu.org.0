Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AD333AB5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:52:55 +0100 (CET)
Received: from localhost ([::1]:54596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwSU-0007mC-Kz
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPQ-0003vd-E6
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lJwPO-0003lh-WF
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:49:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so10723232wml.2
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=bCrgZCxeii031vCKUZxH/XL9c/zKCMM24Rhg07B765uxrd//6J/Qiq9yzYZPz+J9Tg
 PWrahUCEFV3WGP93MKKnAovwULXMixW+nAlxGpESgUZZF5hSs0jjEco7a3nT0lG0zPaT
 OKFgi6pESRDmWymGbXOrlRyBsg+qeFatrj0wXBEbrz0RnXQZ0hVIG0PS+BH1DS1L4vT1
 1wOO6gZBB5jdSbBNKstLbnsO8yop7xha19E/c1pyE1RFrXmju+hyX2G+h+Vc1+w/zKPp
 OioJzTgRjgmpg8ayoskNzKjz6RyUK7fpIW70lIL7w/JhrIL2FywK5mnXVPO7MlIlKasE
 tbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=IoylaMXbh1J8XTeGB/DAq5HuIPliobYDRQ9Kx/ZsfW1PpplGeI0bOFXie1/+1DYzGM
 uwKedaq3wHXoDtWgdEKcdcLSJ+k9LOC5nTXrWHgenNLQf+SwjKtuqJ9ho/hCbfxVxQ56
 Y3f5IIkTJVVuIZxVUBidDBGqPZhBtzGYIVwrL740HwUPBUpJh2WP8emSDdEs1QlfWvwz
 VQb7f0sdpETn2KNlIqsc5Um2WTdQ7s15ifX7gsgZi8tDhlZrWXDekpHkEdDqrJC1P4B3
 YRB5ms/b+bpDhGJU/4Tj7sOqu9uoS3jrxrDCBOsNKjc/+THn3Pyy70hIHmahCcUam6p6
 Gpsg==
X-Gm-Message-State: AOAM533Q5bdMPe8rhodf9sGapNA1qXSUJCLl2nyY0/Fj5r2F58/kN4eg
 6dHJL+vmlLol3xiyhqLn/hEPLcW1hTM=
X-Google-Smtp-Source: ABdhPJwF56Zt0kX2hxpER6h+6X3U9+0rBeeUJKqDZQiJ7T5XmP0N4hPOxJwk14eqAky1c1cmy9OQOg==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr2741186wmh.182.1615373381780; 
 Wed, 10 Mar 2021 02:49:41 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s11sm9060808wme.22.2021.03.10.02.49.41 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:49:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hexagon: use env keyword argument to pass PYTHONPATH
Date: Wed, 10 Mar 2021 11:49:37 +0100
Message-Id: <20210310104937.253532-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310104937.253532-1-pbonzini@redhat.com>
References: <20210310104937.253532-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index bb0b4fb621..aaeee11ac1 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.29.2


