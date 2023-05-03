Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36716F545A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:16:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8YU-00060s-VM; Wed, 03 May 2023 05:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xx-0004bt-ST
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xg-0005vl-2w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso3132286f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105174; x=1685697174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtGJ0DxvwEMx1kTCXq/Fb+TysmWfvIQ/cxIROhwqFXk=;
 b=xWyEajPqrQrxTVXm4q+ga9l3RLmn2O/Qs5KOW70xspuJ8cMAPm438LZ+0BV7j2Y4R2
 2Jog7Q8qjESdop4CmvBEu9uys/hTWYvNIPT0amOu0ZI38ee+hvIq4G5CgGbbg9NIi1gK
 XujOpoDfJznIHvjghc/hUedX+sgFVGg6Pf/M5ZWuqqLmYfToKoaq6DBAyXkfBdYATe7t
 wq1SPpMilG2cBTbx3bVqnfDHuqO3iwuTkuuR4p3IZF3pypVoebKcHxKpptkrNyVZGFSG
 /ElrhGW5QafH2XGJjuyenOI5nQjpt+iQPgEImUmQmiPHtuTyoRK18X2NmmGWrYKoDXYm
 uMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105174; x=1685697174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtGJ0DxvwEMx1kTCXq/Fb+TysmWfvIQ/cxIROhwqFXk=;
 b=kt3Rb41vSAoj6+NviTAvLaB0EkrQgrGmjFazMf2G/dkFHkXY7SwRSvO7cb0EsrG/dm
 Mk5XpHjOeRTyVERFBujs5yxCEQZ/Xa44+yQlgYUHBraz67I/SLKPPX8SQTFfUv84o8WZ
 OpXSV10lhCZnTd7vRJXO5FXjifyxUMIhCd8Kz9pAtpEfI/lyT9ALu2tC13J51BFUGHOq
 V+rtMpJ/CnCUPDNc64Pq/v9lIHlzwbvKUgKmNgUfNH7yWpIJ4FTjmmlWAzGbE0Ar8occ
 RTSKDIILq80QXwI7bCM+BJ8Ox6Qjq5lxZIgTKAM7UkDSFIUfjXxBMpjLjMKdul07GQcR
 hLcg==
X-Gm-Message-State: AC+VfDwD5khcWhMe25HkBnz3Rv0EZFrp+EFjwDcyqGHSscJHBUclDIfl
 1ZVYtD4l3+GzuHv4zkJD8/KC9g==
X-Google-Smtp-Source: ACHHUZ71wNU2t8A9SaMmvTWaYcEagLmr1hWw+4PxNUogAm27vI2GIh/3iYp7dtSytHO8FeKVyV/X+g==
X-Received: by 2002:a5d:4a0a:0:b0:2cb:2775:6e6 with SMTP id
 m10-20020a5d4a0a000000b002cb277506e6mr15607212wrq.45.1683105174086; 
 Wed, 03 May 2023 02:12:54 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b00304b5b2f5ffsm14942914wrv.53.2023.05.03.02.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F155F1FFCA;
 Wed,  3 May 2023 10:12:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/22] gitlab: add ubuntu-22.04-aarch64-without-defaults
Date: Wed,  3 May 2023 10:12:41 +0100
Message-Id: <20230503091244.1450613-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This does a very minimal build without default devices or features. I
chose the aarch64 runner as it doesn't count towards CI minutes and is
a fairly under-utilised builder.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/ubuntu-22.04-aarch64.yml   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 57303c12e1..f8489dd3fc 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -45,6 +45,28 @@ ubuntu-22.04-aarch64-all:
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
 
+ubuntu-22.04-aarch64-without-defaults:
+ extends: .custom_runner_template
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_22.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-user --without-default-devices --without-default-features
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check
+
 ubuntu-22.04-aarch64-alldbg:
  extends: .custom_runner_template
  needs: []
-- 
2.39.2


