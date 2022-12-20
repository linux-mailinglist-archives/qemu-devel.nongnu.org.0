Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB9652281
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:27:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dYr-0002kp-B6; Tue, 20 Dec 2022 09:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYd-0002fO-DF
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dYb-00073j-PP
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:25:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id h16so11852061wrz.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SRfQXt0cpRTOP0e5a6mN6QzhWZi0GjW4YvHNsYLxYhI=;
 b=MsCKeFeUB215xQ0Idjul67RCk8ITzj0rPWoUjbneLjjlNjKDgNLWg6u8ZDeyfXvYzA
 zMWjC2Egf75hYcFsfy5itih33Vrusctz1eHUvbD2OZxAIZX8DbsZ92ZFRf2DTqBUAjSb
 /q1i5YnbVriFmbIPt+XMB747XYiHI9XyZ+mEzV2v5zS1mjF3lmKft+rhkOnu6t+etgaR
 Mv3oKQDpW/D3Zk3OC+VHXZePluy/36WaOh1T/f2KfGbmJ/lAf4e4I8KwAPl9gl85+RZE
 OzRKBI4SvSaOsMyuAVrUZBJ8uD4KEIVO+kIE4OsPZwfaYYzshGgUZWuM/SjRCD+EdZwN
 RMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRfQXt0cpRTOP0e5a6mN6QzhWZi0GjW4YvHNsYLxYhI=;
 b=mHtuNQambFl4AhZWelSxpb8zFkadJ4D5s4ZjtwLCHtxOgTzMxMXP7OaKlo0n78Cv+I
 TVkrrhpM7/pnqSojkdanBpao7Nry7KCQzySsLxExT1dGhpL3G9PFbrnCGAgGSztswQEe
 PDctS1YKyupEK4W7B+lIaiEXF8ZPlHtC1MpsJW9ArBVlW01SfwPMnbqQZygTJbqO29Nt
 gJfoXF9U9xd2yfNUdJpgZhNzVxU/qgs6j6XT9Z8KenysCa1uu4J8KB3yfFZOlda3FKOo
 fgDH3ekFmlV9ZdPgpu+cPpqe7i32Gl/70sxNEqrXtnxxUcA5wdrsMhh7O5jjLAyBOjC8
 0esg==
X-Gm-Message-State: ANoB5pn/5hiXqO/RybG0lco8vS7tMR7QSLBFQobK4hRBHmuZe789OKYw
 2hYfANfTTraMYaMWEGwCO54J9Zk8GzwabQQ29JI=
X-Google-Smtp-Source: AA0mqf42ogL+w4+kMmN+GBa6kK+ukeb8mqxj7IsHvDnqByNynEaxvcx2wqKE/haxyraamgOJMNja+w==
X-Received: by 2002:adf:a44f:0:b0:242:63e5:2449 with SMTP id
 e15-20020adfa44f000000b0024263e52449mr31951432wra.69.1671546323543; 
 Tue, 20 Dec 2022 06:25:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c18-20020adfa312000000b00228dbf15072sm13322372wrb.62.2022.12.20.06.25.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:25:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] hw/arm/nseries: Minor housekeeping
Date: Tue, 20 Dec 2022 15:25:17 +0100
Message-Id: <20221220142520.24094-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Constify read-only arrays and remove some -Wextra warnings.

Philippe Mathieu-Daudé (3):
  hw/input/tsc2xxx: Constify set_transform()'s MouseTransformInfo arg
  hw/arm/nseries: Constify various read-only arrays
  hw/arm/nseries: Silent -Wmissing-field-initializers warning

 hw/arm/nseries.c           | 28 +++++++++++++---------------
 hw/input/tsc2005.c         |  2 +-
 hw/input/tsc210x.c         |  3 +--
 include/hw/input/tsc2xxx.h |  4 ++--
 4 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.38.1


