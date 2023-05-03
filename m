Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BAA6F5432
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8YS-0005mi-IU; Wed, 03 May 2023 05:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xq-0004P9-GE
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:09 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xc-0005ts-N3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so30084295e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJIZUc7aZgGYP7XQ7psrxYa21EZeauWd7EvhUiQOMlw=;
 b=vsKdKy5I0o9FKkKWelXTt0Go0g2AQwlndClyC9sL5bhPHbLoYzOnlqxOmFEUxtVoXr
 +mrnbhwz4oxoVqh2SyfetPD7oiv7wRZxLFT/n1qFIL6Ag+QnIuunnVxsN9GLSEE346fM
 yYfBPudmyoArPOYB4OGXnDpqDJgMYVsftqXp1JO9NT85CUOgRtZSqmpjHq38BQKNj+wv
 SS+7ba4s/xpPq4g9sFAC3L4i1JzOpJ4AZvyGIygZUjIdeOkS9I+hJWiXWUwWUPWzByY2
 1rARsDUQeLer3oLiZ35Iabee+acrl0t931g+4y+HQMp6l+44+YK4nid94K4TM3NOoN1G
 b+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105170; x=1685697170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJIZUc7aZgGYP7XQ7psrxYa21EZeauWd7EvhUiQOMlw=;
 b=ImXmWOVhA2b9h4B5A2IDk8yeIIDoYLmluUjkx5E8BZdTTILXn7ytI3OD89SYtH2ajf
 GdiEgrlGRrj/PcHxE4ipY2VbsUC7OmkzQsX0a3KAe7uh0dyLvjJaaf4Qq2Z3/KcBCGfk
 Zof8ck+ybw9WE0EcxBGdUgZ6wY9IIExDDwABCmpYxwpagrGr2kZ2ukPmmGby+627GeVi
 Makd8LBwIPUO25r8E558nNtJsUqxI2tes44X8C0OvqNddprISiNE/9CRfrk2DBmdkher
 yYbkDnqfsskBLH9CgN8Ycu9GsTeob25hQQlcGBx2T0XRwNA96bUqFsoHhBwjWH8aHxiv
 2z6w==
X-Gm-Message-State: AC+VfDypg9tQ6H3x/QEtCVtFFEG6IoleNVAaU6dsyh1dBinmyMvYT+WS
 ps+OblgVYYvCwPWNU/SqiGNnnw==
X-Google-Smtp-Source: ACHHUZ7WPJqUBgTpc/tmzlw4wmNyIXrGFmAl+jFslV6qJKlBCaphuIUUlmUkHgK30XoO415piWyn2A==
X-Received: by 2002:a05:600c:2209:b0:3f1:94fe:65e2 with SMTP id
 z9-20020a05600c220900b003f194fe65e2mr13719832wml.33.1683105170694; 
 Wed, 03 May 2023 02:12:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b003edef091b17sm1252787wmk.37.2023.05.03.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2AB021FFC4;
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
Subject: [PATCH 11/22] hw/alpha: make E1000_PCI a hard dependency for clipper
Date: Wed,  3 May 2023 10:12:33 +0100
Message-Id: <20230503091244.1450613-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
 hw/alpha/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
index 9af650c94e..4db7f84e9e 100644
--- a/hw/alpha/Kconfig
+++ b/hw/alpha/Kconfig
@@ -2,7 +2,7 @@ config DP264
     bool
     imply PCI_DEVICES
     imply TEST_DEVICES
-    imply E1000_PCI
+    select E1000_PCI
     select I82378
     select IDE_CMD646
     select MC146818RTC
-- 
2.39.2


