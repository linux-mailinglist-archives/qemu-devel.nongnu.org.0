Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CBB5800A9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:23:19 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyzO-00053j-Rb
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiO-00016W-Hh
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiM-0000J8-VJ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so9461088wmb.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3jT/+HPPsIEXc/KjYHBbDuZ3dYXOI8VpfNKzZc6+cU=;
 b=F5R7JsTWCfgXv3Lf78HYG3mpIyMweWmppnXyvoueB0cPAWs/8+BzgIfRkTAZfBcfLM
 7zQPiUeyONVPCVvzB4O5sOnjXO7lsSdz4ttfQWPO2THBNS4VjlVHxjWG5BDLAz/Er968
 Lamz46heag7ey/fTQHXrVS78CMws6LmzYMgCSqHjLPfeJZt46rLCMtzoTUkU9FNwca/2
 u+i5GTaUGAe8Ef1/jaytJczu3x17si0v1ZcmIebL8DMyLXkAf3i58qlXfxkmSLvKuRZ9
 85EmHOTETfdEYNz7EtsZnu1Ok3yFpDSrqgLLR6ISB0kn6iwrWY7YPcZugpCI5drwrXvu
 ZdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3jT/+HPPsIEXc/KjYHBbDuZ3dYXOI8VpfNKzZc6+cU=;
 b=Tw2SlVSitetWPf1crWXBNxGu/8W5rh0Qsyldaf8Y0SpDD7yppdPdbUd4HCFmFsNR19
 hORxisHzNUKQWtWPjfWe+IYqR0vIXPPNBwmAdxe/VpFf65wgqUvgC8WkV2gFt4rtPPpJ
 hV0EJiJzluxPH60XRfgLwoGD6WG0zhjO10jtP8l1Xe3y4smvrg8ROgeY9k5TeVfDeUy1
 8ohCsyagaC2hWwtGDWNl0/Ua+72T8GZTHVB5UQTX8TkBdpp4yKOrod93PBb3z3g325kT
 9TeZSIVeWaX5sYS9w8pUtd4d2Qn0DKzQqPGEyQktmFmKgHf5D1jeUfzGpqxGrwv5rYzf
 nbIA==
X-Gm-Message-State: AJIora/V7Y7elcDs209soCuC/pAw8OYbCmDe4KVIXvLbYgyCb5idNTEi
 HpD7+6+Gw3nu0wjKkEZNGJjgdg==
X-Google-Smtp-Source: AGRyM1t9dFZoWS9f2hFUuyMz/yY8Llkw0X1zvysQbya4Rhe/jbyDy1/pL54UZ0TnZyLTYn2Ew+7dDw==
X-Received: by 2002:a1c:2981:0:b0:3a2:ffe9:945c with SMTP id
 p123-20020a1c2981000000b003a2ffe9945cmr21066933wmp.38.1658757941610; 
 Mon, 25 Jul 2022 07:05:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6446000000b0021db2dcd0aasm14340627wrw.108.2022.07.25.07.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 971BB1FFC4;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v1 12/13] docs/devel: fix description of
 OBJECT_DECLARE_SIMPLE_TYPE
Date: Mon, 25 Jul 2022 15:05:19 +0100
Message-Id: <20220725140520.515340-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 30b5707c26 (qom: Remove module_obj_name parameter from
OBJECT_DECLARE* macros) we don't need the additional two parameters.
Fix the documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220712103131.2006653-1-alex.bennee@linaro.org>
---
 docs/devel/qom.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index e5fe3597cd..0cf9a714f0 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -292,8 +292,7 @@ in the header file:
 .. code-block:: c
    :caption: Declaring a simple type
 
-   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, my_device,
-                              MY_DEVICE, DEVICE)
+   OBJECT_DECLARE_SIMPLE_TYPE(MyDevice, MY_DEVICE)
 
 This is equivalent to the following:
 
-- 
2.30.2


