Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7016F5439
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8YS-0005n2-Il; Wed, 03 May 2023 05:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xv-0004XT-SX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xg-0005vL-2g
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315735514so14868445e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYDvZUsIhInwPW03MTF99p4xI8+tuKyXF0ZctjY31L8=;
 b=y4SSf7p63s9532XEFNleJupIoV5LUj01mCVEMuXZ3llnpjq2HwnWqOC2AkjV641W3z
 Rpbzf9tO9cjxTCtVbfd6ddLzDOX7nSulkbqCRDOiLPhy2++ILBCjk2jDKhdYX22PVec2
 WCJQxgt5KrwXci8gQ1IbPmjBhMzq41BfM3DAXgUDuSesX9j9slRQQmkdEWWH0FWe7c3+
 tuMndrUdiJdxU74roEyr8o2rMaLPdtla+DnH39/bnRfWEyeg1bYi8mtqI+QskjLtw8DA
 LNwgHwqxYFMVRcjna9zYMtfjpqRnCRpzV7jzMmnSqWiIrzouUHso9VC8K2kiizfk1A+2
 A/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYDvZUsIhInwPW03MTF99p4xI8+tuKyXF0ZctjY31L8=;
 b=H99m+vLgOUhhixmicN09HHbJ8hvaU0mLlfhmxjBZAsjs26lksp0yDyctuW6ePUbMrt
 PpRRGaakpSd50cJrj2AzcDaal+4oXt0qWNEvRdP6O71r7BNyrSuEK/wual+An97pr91v
 3q2rhZ8vv83wzquyzF7InA9vEPOkNfTfX/tudTXksGKM2fY/uhdLxTJEP45sm5PaaBL+
 Z/sB+5TncQXOdbW4VIO08ZZWgvUcKKqy5THKAd5MPVHgCu0ZL1DPtIZgDyN2qDqJUz2C
 G1njQ2fcY1LFetdY8QJGuJjHNXq5bKyTj7U/ihi5blSog5HJQsBayTgBdRQLhHnKCXEN
 BsLw==
X-Gm-Message-State: AC+VfDwLFcSM8/HaT2df5kJQHeOr2kinYAjElWOVMGjiXFNKl02n1lgQ
 mbSs35AZpZwDk6/zOzgjrTvgCg==
X-Google-Smtp-Source: ACHHUZ4MbCjwD59cWoL+xfch0ykU93xg/EDMczlmW1vzO81S8ejDzXJO64noR/7fnaZilolSlAM7DQ==
X-Received: by 2002:a05:600c:6024:b0:3f1:89de:7e51 with SMTP id
 az36-20020a05600c602400b003f189de7e51mr984876wmb.12.1683105172731; 
 Wed, 03 May 2023 02:12:52 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003f193d7c6b7sm1223276wme.41.2023.05.03.02.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A8B21FFBC;
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
Subject: [PATCH 15/22] hw/sh4: make RTL8139 a hard dependency for RD2
Date: Wed,  3 May 2023 10:12:37 +0100
Message-Id: <20230503091244.1450613-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

We can't just imply it as the board will fail to create otherwise.
This shows up as a "make check" failure with a
--without-default-devices build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/sh4/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index ab733a3f76..03f3469ae1 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -2,7 +2,7 @@ config R2D
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
-    imply RTL8139_PCI
+    select RTL8139_PCI
     select I82378 if TEST_DEVICES
     select IDE_MMIO
     select PFLASH_CFI02
-- 
2.39.2


