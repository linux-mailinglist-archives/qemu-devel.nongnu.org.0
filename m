Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2798233C4C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:49:22 +0100 (CET)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrLF-00020v-1M
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBb-0002yZ-VJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBa-0006x5-1L
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id j2so9102891wrx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=ojUcBlMlQT6SyQ+aNpC+Fd/4siE4SBsrUZn1z3ZRMF9VxKPYbMWgKx6YPbPmPe2x+x
 D8sgd4G0i2QVzj+DnuBvbU9ORnShvLrdDJAOwSx+UA7DZHUE9jVNzFMi6EJnflO1O879
 bFVxsnlNU/eM+kqMnldipEECd8iy6UygX/nrS4AS7p9QLddKD8Je1oNYeC/+FNYHUEjw
 5Wv+r5gRPK/GSOpW9ZE1v5myCO7PyJyPE+tS4JAHhSi1JRQ8xPccAOpB3HhAuqNRoP7q
 WV+6eGCyFGhThYj6GEewtNpKk0iLviYJklKaDwJN3uxiE828l9hAIjQEjyxpQM+ABlHt
 5JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YhBo1ZSoIBwZQ5KKbNpd+bGBZNvKDhx/Uj/CIpS1xWc=;
 b=MH0XfJkRmeA7l1G/IdwrrKYdeE50qjOV31iIMu/M4JdhPart8NzEwqOkYg504SBrjM
 +QF05mAyhqRnBYFY4rU0V80w467Ll7hrShH5iAaskCzQUD/X0Lh7BU4ymBHKUARYObqK
 2xerekYgd28hqaMe57QP9c1+UkKJIB0baq+p12DTEf4m9QhK7WEE0VAAYutbj6BTHMCi
 sExWgZF2TYG3a00IdQLYvrllk0hiM0y3D3S5LK03jtR8jNaTPF8pMYckcaygqEiaNjEm
 2lJTbEywa4IaP1HyKSMGSsaT/UQeQSewx/rOFgh7L5u2rGgUU15hcy+w+0lxxWkWGOBe
 TCbw==
X-Gm-Message-State: AOAM5334MA9ErTLA1lLdJdNhH7ckEZoQ9LM92WyHHW4H/1eb8V179LRS
 3AVlz/M3spaEiaX8VbRyaIPnNIUuSXQ=
X-Google-Smtp-Source: ABdhPJxea+BCixMUgyMsgvvw4JV5m5vwYlI4JPb+hYml7MOK7AbQqq4PENtWbgcQo2MLSqYlGMYzmg==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr733259wrs.43.1615829960109;
 Mon, 15 Mar 2021 10:39:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.19 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] hexagon: use env keyword argument to pass PYTHONPATH
Date: Mon, 15 Mar 2021 18:39:12 +0100
Message-Id: <20210315173912.197857-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
References: <20210315173912.197857-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


