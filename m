Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5432ACB4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 02:09:13 +0100 (CET)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHG0l-0003pY-AO
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 20:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHFx2-00034F-Dg; Tue, 02 Mar 2021 20:05:20 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHFx0-0001Cx-7W; Tue, 02 Mar 2021 20:05:20 -0500
Received: by mail-pg1-x52b.google.com with SMTP id x29so6845834pgk.6;
 Tue, 02 Mar 2021 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd5GvI+CUtHO9kj/+hMuYljebVOyggSX2d6N90WNDsE=;
 b=Y2ZFOXX8igsaPBTNz1Qoeo5XiB9i2pCPLLGQEvqNyhr4CUytoXe5e2Whd+ya9F5CGT
 7QdKpBJklHkVmygs0cGrmhA1W1Lgto/prZHZBBX/Z64yJo/OMkK8Pdy9G9XIUn+YUq7p
 XJJhW/U9uwNYP9l39lRY9INFhc8DCj2DA+NZfXZzyNnw3wwqBVy9kxGycJg9uiHo3ZLX
 3b09ZtuurtT0J2wOhkvus7ouHk9SLejzmbpVDnuAjtD0hPs0dBd6ULuUohA1rr5h8CLl
 ltS+bxbsTvzrFzXpTwjXpJVC01A6w/7aCRTSa+Izsn48VBPZ6IbdZwaKSkXsAJu928kh
 7zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jd5GvI+CUtHO9kj/+hMuYljebVOyggSX2d6N90WNDsE=;
 b=aNkXbn1IAl7+Tg+juoQIWWmJ5M27LIU2sfp15RM2P7tn2wtUtifa0tVgPv3uWgnbNa
 ZiEkVa0ZHhO2xnT6j79UZnqFHHqpgr7FC7vg4xI57pIDU12r5i3vdCpmefB+dBwSfbLy
 HSx0uE0uXIsHwyx/PBI21V5r1DqLnKL0DnmnTa6TIEAq+zHA5TOzY9dGXnM0XNyoL718
 yemzvXHGEM6FqQKmvlJFcS9qJNJbzgCSzJnqpIjebFXeSSC+pnUPz+q4CTtl1/RiRN3t
 LDaUYhGGxxGmLPYIbg4pE0SVCRKe8Cl6KL2jX8b3xwKoUbtBRom8gIBYN7tJlYK/nFva
 Jwdw==
X-Gm-Message-State: AOAM530FqJ9uRB0v9APHCB0f3p9gGD0d3jCeVGS7plHgFXZThaAl6GD3
 hjeEZjLkfJPk3V5b+asHeTc=
X-Google-Smtp-Source: ABdhPJz+qreqwymAumvXK+GDZ/GOZZ7G0lZTJwgvxm04rjL5q4IyPdCBE/3ga4hBOREHSwNO58iA7Q==
X-Received: by 2002:a63:e608:: with SMTP id g8mr9968522pgh.433.1614733515892; 
 Tue, 02 Mar 2021 17:05:15 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q21sm54197pfh.189.2021.03.02.17.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:05:14 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] arm/ast2600: Fix SMP booting with -kernel
Date: Wed,  3 Mar 2021 11:35:05 +1030
Message-Id: <20210303010505.635621-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ast2600 machines do not have PSCI firmware, so this property should
have never been set. Removing this node fixes SMP booting Linux kernels
that have PSCI enabled, as Linux fails to find PSCI in the device tree
and falls back to the soc-specific method for enabling secondary CPUs.

The comment is out of date as Qemu has supported -kernel booting since
9bb6d14081ce ("aspeed: Add boot stub for smp booting"), in v5.1.

Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_ast2600.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..49b00763864c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -241,8 +241,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
-        object_property_set_int(OBJECT(&s->cpu[i]), "psci-conduit",
-                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
         if (sc->num_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                     ASPEED_A7MPCORE_ADDR, &error_abort);
@@ -253,11 +251,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
 
-        /*
-         * TODO: the secondary CPUs are started and a boot helper
-         * is needed when using -kernel
-         */
-
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
-- 
2.30.1


