Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DF16F5491
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:23:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8hH-0000Wz-1b; Wed, 03 May 2023 05:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h4-0000Ir-Sn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8h1-00065X-Ja
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso1540275e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7l/TTuyTWe8/orUummJrgjknEbHUJ50gajnEmcm4LvY=;
 b=cAQpcm7v9KSxvVRF+d7RK77vTV+kZQZL0Iye7S8m74yKk4o/e9F9z+6zT1ls1FMOdQ
 mCfnfENZP1fkLFFwD7rv6Ugor1kuUfsQ6kTLvS5owpKXiraLqUhLy2s1H5y2tUgj6Ba0
 pr+zgOZaiAQb8OpnyxqYZ+YZvPch8CDjRheQKzCXaJ3jsWsjchnMZjtTk62qxGdvExos
 OP/w1LFuLij05/N7m8Ulaj9TbZIRxyV+IlF+LAHTHb21AZ0LhNYKZfjq7pcdeOtA+O8n
 hgIAETi1rktZ2fY7yO8+2hBvQS11KBGPeqB/ht12TCi2AUHs5g3a0DSHTblc+xN2h/u+
 YPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105753; x=1685697753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7l/TTuyTWe8/orUummJrgjknEbHUJ50gajnEmcm4LvY=;
 b=HE8oRj6AvETkwR2HgsJmFwe6K9Wyy0fuLzwo+PQW6AliyB7gyFx9LCZMP9SyPrkNT9
 X7QGyGAO1tdSR6+mZH/59QYVQPtzNz4Z+7cfTLCsgPSimkEbvGgrGaag7TQOCU9th18s
 ozT2CGYyZyIEo7Y70Z2MPnzKFvNALUdWCViD7EwLWvSoT0aVL23IVIAasoB/9bZHLj+g
 Iswq9Nqydg3pDjbLBeSfRCZ0VO/ArT4Jj/onwz3/GwbjlvjahK6aXHon8QJkhOuhfbq9
 cRusG8FEw8+iyhx5blex5DC2Vof5ggKUPPiAz+E8quynn28hP7mx7DcwM/tBGVM9Qr1j
 pbKg==
X-Gm-Message-State: AC+VfDzxmRKfvI04tV0ol9aECkahanFn3hCnz11evDJGjOy6gEvOQm64
 UAk2jYg7BBUULE0Tcbfd0ntbsA==
X-Google-Smtp-Source: ACHHUZ4uoXBp27wk/+6nZaqbufXWQj+BfKsjsbDktu0+ELWr8iyY6/IZGJrYdno48y7Qil5SRk4OKw==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr15166138wma.36.1683105753102; 
 Wed, 03 May 2023 02:22:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003f33f8f0a05sm1305816wmi.9.2023.05.03.02.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1799F1FFCB;
 Wed,  3 May 2023 10:12:47 +0100 (BST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 20/22] gitlab: enable minimal device profoile for aarch64
 --disable-tcg
Date: Wed,  3 May 2023 10:12:42 +0100
Message-Id: <20230503091244.1450613-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

As this is likely the most common configuration people will want once
the --disable-tcg patches land.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>
---
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index f8489dd3fc..374b0956c3 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -145,7 +145,7 @@ ubuntu-22.04-aarch64-notcg:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-tcg
+ - ../configure --disable-tcg --with-devices-aarch64=minimal
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-- 
2.39.2


