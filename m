Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE56F545E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Y6-0004Z0-0a; Wed, 03 May 2023 05:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xk-00047C-43
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xb-0005ss-39
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fddb442d47so4555502f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105169; x=1685697169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OugowhbhJvZeYWoiqybrCqoOxi0uHlWpSbmhik0QfjU=;
 b=zZMLgeSUx8g3N2A+5iR6690dcjz607sQvhbMUnQjUQX+F3lys8eka+j/c6ICmfyKLP
 E4pOUoHWUQfT7VJPfAg5snIEtdTs7qc5TOYRos2QXIxFLExrZKrzreq/WXhUQBSYjUrP
 rZVvmGcDL9GpMzI0hlCTbNX9ipEuXBd4tS/HGd6wkJcxTXvRroiBFZPLs88bJIB09UQN
 Ib0AEQCCaugScTcxkMTmBHj09mm93aQpX+EfYNsjsEiJitwJNe+bQ7n/wMbq/+0o4gXT
 VTUly7UwsCMMBaQ+NTosMSgvjeOPf4T7LcchQpfsspFB48ukF0tRaxG+StuULWvwszeh
 YDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105169; x=1685697169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OugowhbhJvZeYWoiqybrCqoOxi0uHlWpSbmhik0QfjU=;
 b=LeZ59uM5TBIZXt+qhrf8MR922w0IYYlz22OMoCXpxvqMknkNQzTOlGZg1khFsNjWcC
 5UXpbJ8KTzy4bJWlFWoWFOSFIGvMUnSVuyaicnmxE4YltYTrY6sU2RaFSg5I3ktXY5z+
 CqMBXpVhYLf6dS63cnqaZU6G94bPPF+YNiw91XqI1OIkhtrhJuO/UWuJPBE+ICB49HYN
 aFGvYBXug/9XtPELKk/smuHSqQWybur5nmOnkrn8HqXgjaEKXsC4z0lnT/mNbRfqzMki
 5NWgw+Tg+PrIrpUsNL5vLOzzFlTHvt69cxXFJMfZcNUabi0VUbS+BYl0BzXEb9ovoc6J
 82AA==
X-Gm-Message-State: AC+VfDw+ZEQhLPBA6K0X1xjTmGgZZ82jUwmXz0RIGjGSclK+D/iSrgl1
 gvCQSQH6wZjyP5Pt5XYoTgihcQ==
X-Google-Smtp-Source: ACHHUZ5hfD93GODG0wQfMAWRDVicULFOZKH2QwRND+w07iRUqxjcoGpKi16NkyPcIEB6Zu7/FRISCQ==
X-Received: by 2002:adf:f0c4:0:b0:306:43bc:8067 with SMTP id
 x4-20020adff0c4000000b0030643bc8067mr845191wro.27.1683105169431; 
 Wed, 03 May 2023 02:12:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adffd4d000000b0030631dcbea6sm6208275wrs.77.2023.05.03.02.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D31F81FFC2;
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
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 08/22] hw/arm: Select GICV3_TCG for sbsa-ref machine
Date: Wed,  3 May 2023 10:12:30 +0100
Message-Id: <20230503091244.1450613-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Fabiano Rosas <farosas@suse.de>

This machine hardcodes the creation of the interrupt controller, so
make sure the dependency is explicitly described in the Kconfig.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-9-farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cec7898bb7..0cce0b8d5b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -252,6 +252,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select ARM_GICV3_TCG
 
 config SABRELITE
     bool
-- 
2.39.2


