Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9BC5EA7B7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoag-0007Fp-Bd
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR6-0004sD-TC
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoR5-000718-By
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:46:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r133-20020a1c448b000000b003b494ffc00bso7566288wma.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iVV/m9jxcZkI6rs189VIII2XD7ETGRPiVpawS5Hykms=;
 b=rnvg8rygKmHXC0mc656bTv5NyO2aJrHcp18ivfgQWYX0zb+DXrVzs3XVp/2oOdi9fk
 e9hDzS/rdMzt36o+Y+MWDz0+5pA7bBvXtA1PdcOSCUd1cIOzGwiO4Lyp3Zq0vztIuwg9
 5APXF/NdKqjF8cvkYub+UbUn0yVROF1bT8M9D9l/GqzLatiZYazdY7aOxH5/eXykfMWN
 DjTNqcMxrtvX19UI4lrPg1nmpv8odwY8jqx2AH1HbrukCbfa6r1AQecOrNuIlv/2l7BX
 9K19AF44MEH8Xur/E2glz0WYc7QBw37Ic/wnPDH1EeCSrFanc+1WyqOmCCG72ycH0102
 jaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iVV/m9jxcZkI6rs189VIII2XD7ETGRPiVpawS5Hykms=;
 b=fDsuODxHitlZTtfNyXuziHScgD6TbkZLkNpj7cwGEiV4fVkuCSuzV5nT1G1ReJh69X
 0NqrWgEU+vVFs2Upu8lW3LxnV9XuWlK/vqvpH36YZyMvAg0R+lXJRLmedBKmruqAF8Ic
 +v5P1EbUegr3TPuQkL5sKZD3W4IOTm1T8BuA6lsG3Ls4DpO7swug7/k1RviqjEZAWHwh
 uZ3Ct3VqfVLTaNLyX9zh+a0/nRl6I3MCIwgWfHwgwvspEXuhB0TvxWIHqEh79g/0pfY1
 dfQk/0lblRplDy/ser1zboiWXLOE+OZL4btF5emYIHd3BECV/pHtffaSd4zJDS4/9BXX
 U9Qw==
X-Gm-Message-State: ACrzQf0waPiifFKsVj1A4brv7GNrFiIjS2rOaMuuG8l5Td4ixiUbBF+a
 LCTQGMZPKbPT6RXOBUP0BEo/tcxAPSOQmg==
X-Google-Smtp-Source: AMsMyM5DuQMVvFKMuJm28RYpyHWscZnKHGYp3b/kKkAN0MxYL2LP6H9+hVHmU5k7Zi9omAwIsVGVCA==
X-Received: by 2002:a05:600c:3c89:b0:3b5:e3:bd0f with SMTP id
 bg9-20020a05600c3c8900b003b500e3bd0fmr15592747wmb.199.1664199973558; 
 Mon, 26 Sep 2022 06:46:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adff0cd000000b002205cbc1c74sm14138628wro.101.2022.09.26.06.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:46:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B2421FFBB;
 Mon, 26 Sep 2022 14:46:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Brook <paul@nowt.org>
Subject: [PATCH  v1 3/7] contrib/gitdm: add Paul to individual contributors
Date: Mon, 26 Sep 2022 14:46:05 +0100
Message-Id: <20220926134609.3301945-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926134609.3301945-1-alex.bennee@linaro.org>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Do you want to map old commits to your canonical email now as well?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paul Brook <paul@nowt.org>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index d5b05041bc..0ec003048c 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -35,3 +35,4 @@ liq3ea@gmail.com
 chetan4windows@gmail.com
 akihiko.odaki@gmail.com
 simon@simonsafar.com
+paul@nowt.org
-- 
2.34.1


