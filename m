Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BB6F542F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xg-0003aE-7M; Wed, 03 May 2023 05:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xa-0003QH-9W
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8XY-0005r5-HJ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4563382f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuMUZ3Jto+GI82BEkL0AAF4RSUAKjs+//2ZiVK1O18w=;
 b=nNGm7ATau1g5LtFEOZvBp3vBBrCkKUsgh+q5+uTYxOqSo8IwbqXu88Qo9dXISedGmM
 7/8xNbjCHBhQDbxyr7kp7v0+4UIgCI0QSR9IKVOVGEMeOMstVFFZtYQy1cmxd2lbZnbY
 ELfKL/JQddNSPOL9DQ5E9b/4PIsTyM3pX1b7vNI4RAMyDxxpRzFc/6VsU3nXuZdGDN79
 Ipgwv0jdSYsBD/oYHBf9DTTElhf4BbQVHGMbXdBtPsuyAm0V2ma4qZRYJp2VNX8LtdGc
 n5fMDsvRE6oam+J1lCDnjl8o5R1NY1GuUDf4K3i4tSOSDGIGQ8/aH2OlWVCD7nJPq9B3
 UxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuMUZ3Jto+GI82BEkL0AAF4RSUAKjs+//2ZiVK1O18w=;
 b=Oe3VBCe6MUdU6oQbGGIKsm2GOLnyuk6/i4+fF4nAwCkEk7P0t4ZSH3GdKTS7RITOOx
 pxYl+PQVnNFZjKTnmwhyavMmKcGVGVbeWASviUxIO1x/Wb888wReURHmW75a7sajSHHk
 WwP7HqtFGEkvmlDrmqcqQPFGfvspdTa8+YZKjfjRfo+liyKbQspaOqD1m4BSEfw4qcka
 iV+DPgDzHFm0YwAC0rpg7rQi9SsG3BKmawdiYIqMsGKbR2Pt+Ae6S3+rR+UyQjxdhkhv
 wyAFxCmKPa1+2h9h6Tlv/I3Jid+n0tUzaQGkEnBtInCxY0jW4qFtocytLdO/dek/3Djx
 zP1w==
X-Gm-Message-State: AC+VfDzrdPpfMm25EyNkOn2MFk3VxE5zHEWLqPpdtSaM0Sf/lkgEXRXo
 7l5qB8tLgs1s8A+XvZi9hwoe7Q==
X-Google-Smtp-Source: ACHHUZ4tvpoZuSASG/71v8Z/kQDW2Sz7mhETc9L3dgOJ64j8Hr9Z97If+tCGH5ilYqTmH+nRzf4/lQ==
X-Received: by 2002:a5d:618c:0:b0:2fe:c0ea:18a5 with SMTP id
 j12-20020a5d618c000000b002fec0ea18a5mr15336376wru.58.1683105166200; 
 Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adfd084000000b003064088a94fsm1459942wrh.16.2023.05.03.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 246511FFBB;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
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
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH 01/22] gitlab/cirrus: reduce scope of the FreeBSD testing
 matrix
Date: Wed,  3 May 2023 10:12:23 +0100
Message-Id: <20230503091244.1450613-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

While the Cirrus build machines are quite beefy it looks like we are
still hitting timeouts. Lets reduce the testing matrix like we do for
the other BSDs to see if this brings us under the line. This is
however a pretty restricted set and I'm sure there are stalls
happening on FreeBSD which should be addresses.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ed Maste <emaste@freebsd.org>
Cc: Li-Wen Hsu <lwhsu@freebsd.org>
---
 .gitlab-ci.d/cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 1507c928e5..7c93db4962 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -55,6 +55,7 @@ x64-freebsd-13-build:
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update; pkg upgrade -y
     INSTALL_COMMAND: pkg install -y
+    CONFIGURE_ARGS: --target-list=x86_64-softmmu,arm-bsd-user
     TEST_TARGETS: check
 
 aarch64-macos-12-base-build:
-- 
2.39.2


