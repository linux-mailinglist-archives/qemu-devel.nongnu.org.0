Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819A6F08A3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:47:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oF-0001sX-Ul; Thu, 27 Apr 2023 11:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o7-0001pp-5O
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o4-0004kc-Cq
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso49490515e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fpyH5AwC5Qg4YEV6tQjjlqv6VK+Xr7HhmB8/VhCFqAY=;
 b=am5Ud7iPip2YUkmI4yUYD0Wt3sv4UYwa6fP1DCHmcV4qxkmRjkh4EOtuK5NNowvYL8
 wlgUCcZaEJwawyCUhVoKu/KPl3bIs/yqTqN0DNOX0MxQtz/z5njKGqJlJ3pD+se9c3oP
 2ANcK/Nad394Q2UqJ+7NaEqWmehwdOdK5Jix3AB3CzhoDpQpUdmnM95guI8iUYvCIDfj
 uWKPsZ2DEBGDA0vvNNUN5cAmUdQcf/KLrmZ6z4Q7tr273BRjKnyF3gfFdKdgOLn0SekN
 CuAb+Z9TtC2Zr2d8fxH9a8OX3z8cKvnBcm/cjTzRWNWmYcSZjy0aFhY6VnpNR1SNPh46
 88xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fpyH5AwC5Qg4YEV6tQjjlqv6VK+Xr7HhmB8/VhCFqAY=;
 b=EiRd/D8AoeeSGDA2tw/924/Vy0twMhtr/sXLUCi873eTqqOTd2N9rGlBupkt4koxrT
 TUXyjlrl96Lrp5N9+NqLQrgz347BrmqFcVo58sxJRZmelieufajaWrlJXhF8C3I/yaqy
 pr2Vi16KW8WfaO91/r5GGsA1GN9qdQghup1fiJIlnBJA1+Zn+7Y3CPElnspPhEAAIO6b
 8xtzh7ZXElW/o0LWjGXziFAu9AD7Gp6WfXWSAg7b57acyECpozxuplZTwtRneNO/T393
 qmqkG9TgdiGYE3sy2YVL+b+EZCzvp64M9M92wwLRFbxmMWaoFw21w+gOePnHz6blkVs7
 H5NA==
X-Gm-Message-State: AC+VfDyBryAmk+RSN3PDDhMibmOoGnQFl7J6x1xp/PfMe3Wa9uXdjvkz
 U5BYIMVSNUtDwZrZ6PGfXfGhuw==
X-Google-Smtp-Source: ACHHUZ6Jli1202t/S0YoyJyThk8x9GdyLusyRCh55YHUbQGqeLZZHMjXm9hcjsxL4nXTKjMG07mzGg==
X-Received: by 2002:a7b:cb93:0:b0:3f1:6eaf:daa7 with SMTP id
 m19-20020a7bcb93000000b003f16eafdaa7mr1834302wmi.10.1682610313734; 
 Thu, 27 Apr 2023 08:45:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003f195d540d9sm17368111wmo.14.2023.04.27.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABAE61FFC1;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/18] MAINTAINERS: Cover tests/avocado/machine_aspeed.py
Date: Thu, 27 Apr 2023 16:45:02 +0100
Message-Id: <20230427154510.1791273-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

tests/avocado/machine_aspeed.py should belong to the ASPEED section
in the maintainers file. Improve the wildcards here a little bit,
so that it is covered, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-4-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-11-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 214124c84c..b22b85bc3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1113,7 +1113,7 @@ F: include/hw/misc/pca9552*.h
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
-F: tests/qtest/*aspeed*
+F: tests/*/*aspeed*
 F: hw/arm/fby35.c
 
 NRF51
-- 
2.39.2


