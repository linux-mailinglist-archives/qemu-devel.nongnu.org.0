Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C836D463B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:51:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYs-0002xJ-Hy; Mon, 03 Apr 2023 09:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYq-0002uF-55
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYm-0004u8-FA
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l15-20020a05600c4f0f00b003ef6d684102so14580060wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5aVTp29ura2AnXi+mbMTi4HjJNdcHU6J80+OlMAlxY=;
 b=ZHIf9dTR9loLxTXKZEIR0EGR/ksvgHBfh1pbCJ0NAkJGnCKcyHG7CzrW/CiT/e6zrH
 c5PIqG8eRCQSzO+W6MlMgOpUEKLOlaONVz+0y/Ie32Pv08zCE9wv5KII/7LySQ9cSifv
 0VrF88QHDe1uAetUbtrP+UgQGfpltXIh8k2NUcHjpHKnuEOzeGy0++076bIUD5CfPngY
 HxCpv57KPdzbJm73+iwV28AthNhhn3UrMkEROc9b4h6AZbsBiXpFFs5jAPNRM0gFsHDG
 Li+H/g22R0opKVbB3rO6gqSRAFd5djOPW5X0t3kyLNzlJi89cuEmwvGDtGR/ciSuieM3
 R7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5aVTp29ura2AnXi+mbMTi4HjJNdcHU6J80+OlMAlxY=;
 b=wICBvoy1vlk1lh7ZDbXRC6uLbQ52tpXGkNmX43GdxBr5DCmmBLYmPaqRUBzXRFvwLV
 l9hhjV9IQhf48c9JkMc1KtUr6T0f61BpVPxhLO3bjqdpe5pJcU7y1HZCv75BLhqmjl/1
 fcVpBALdlaFocmeoyIcXlj2A2qDAaDDqZ3Nyd3MByYZOGACNMKbNzqr/E50YY2UAGB5S
 aonxPMgA01BlMMkaZRf1K8ElQ2TeLvoCcS+zwi46DsxnnDHWu83L7g0RuW6JrsM4BMq0
 QinFX3BY3wL8kLO+2LoP+hA46Juoc2D+xlX9ChULWU152MGJC9DdVXmZrb79gB9HJKCu
 1Abw==
X-Gm-Message-State: AO0yUKUdq3wbqU1eFqbEcF2OZFf6eYktp5RGuan2lx3J57nocBenRoW6
 TcmwKcUNVA24UPDrQUng5lsLcQ==
X-Google-Smtp-Source: AK7set8lYRugOBzrVk1ygXZ1aDlYhbI/8TypyTwOwvLQVpeVrOmym+zLvkt3BbgcjuFifdsfynZTog==
X-Received: by 2002:a1c:7516:0:b0:3ef:3ce6:7c69 with SMTP id
 o22-20020a1c7516000000b003ef3ce67c69mr27186739wmc.8.1680529763045; 
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a7bcb54000000b003ed2c0a0f37sm12120590wmj.35.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C5EE1FFBC;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v2 04/11] MAINTAINERS: add a section for policy documents
Date: Mon,  3 Apr 2023 14:49:13 +0100
Message-Id: <20230403134920.2132362-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We don't update these often but now at least we have a few like minded
individuals keeping reviewers eye out for changes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230330101141.30199-4-alex.bennee@linaro.org>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e1a60ea24..2f67894604 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -64,6 +64,20 @@ L: qemu-devel@nongnu.org
 F: *
 F: */
 
+Project policy and developer guides
+R: Alex Bennée <alex.bennee@linaro.org>
+R: Daniel P. Berrangé <berrange@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Markus Armbruster <armbru@redhat.com>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
+W: https://www.qemu.org/docs/master/devel/index.html
+S: Odd Fixes
+F: docs/devel/style.rst
+F: docs/devel/code-of-conduct.rst
+F: docs/devel/conflict-resolution.rst
+F: docs/devel/submitting-a-patch.rst
+F: docs/devel/submitting-a-pull-request.rst
+
 Responsible Disclosure, Reporting Security Issues
 -------------------------------------------------
 W: https://wiki.qemu.org/SecurityProcess
-- 
2.39.2


