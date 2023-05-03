Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC96F5437
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xj-0003v4-4e; Wed, 03 May 2023 05:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xg-0003nZ-Bd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:56 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8XZ-0005s9-Lc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:55 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so30570475e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105168; x=1685697168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yi4DR69tbZyoPw+FTLcDv9TUw8qrCrvNefUXp2WvEkI=;
 b=dcV67XhFrthTa5KjylqP4ezGKVhYZ9yj0cpZ4MDRwpqKP5j2S/gpKw6AjvfGsllUdJ
 cD+kHpM2SeUhs94iYYhKoAxU6HwoC9V1TEyY84yIwlqACRphPFoNsMZnMcc90F+sUbyC
 quCmbs5pNQadqLbGVNMHE7rPGJOJpR2dX3zCCP10wJYRCEiF4f0GX9aerxW0vjF1+bpu
 BvnS/Qu383YiYlKsQqFgkwjsmTKRWzPHJF1+iu7BlgXfZVh3juJ/3i6bUimYJAXsL0a9
 7zQ7x0BrvJAvJceQHw2K1Gx7C3KRVcHMUDo3ODFCRRKZsVAVTNdmYAdYToheucuANxY4
 BndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105168; x=1685697168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yi4DR69tbZyoPw+FTLcDv9TUw8qrCrvNefUXp2WvEkI=;
 b=hoY8mg8bTUhp5qiVCyJJAkFiUXFdCx52v7zAANF/zC9GRvspIo9z7YRu4DKwX9/tJ9
 Joy3Uj38nqzT+E55WF9Tf23XsslWjIN4RlhgRev8+fqO/gaxmBuGpv7wyfUBQBuPv6HN
 jWju/cUdns1cO57EJ2YrpwfEa0f99DY7fVCoWd/dtisSEeUuLFnkt54kndUpbQIbmYgB
 yBFJso0Tn6SoR2W47T6Hog0EA/Aa0l3Q0V0Bi7tmW4yBYyzqQZWcvL58AnqiyURodOHt
 w16I0sqt+MNhyv5p3jK0a85z5c0slnKvejymvmyTEbhzlmqfXcjHQ8mnW/odunkcLFcH
 ux+w==
X-Gm-Message-State: AC+VfDxH9TjZYtt2PdoiIKL8MfMyZSR83RJQig6y239Zb/trVAxvbxbA
 8r8CEtO5YUo7G8nr1lLQsJYbdQ==
X-Google-Smtp-Source: ACHHUZ74tRw7sId5BxVbsGuLuhmxEX0AaJrqiuVaZ3R+fZ+dCS/dhcz1dm/pUgzu3VhxkVqUgkrXOg==
X-Received: by 2002:a5d:4a50:0:b0:2fe:c8b5:b5d5 with SMTP id
 v16-20020a5d4a50000000b002fec8b5b5d5mr13302259wrs.2.1683105168244; 
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d574b000000b003049d7b9f4csm19181019wrw.32.2023.05.03.02.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAAF91FFC1;
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
Subject: [PATCH 07/22] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Wed,  3 May 2023 10:12:29 +0100
Message-Id: <20230503091244.1450613-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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

From: Fabiano Rosas <farosas@suse.de>

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-8-farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 168c1e8089..cec7898bb7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -439,6 +439,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index ce4f433976..0ec6def4b8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -136,5 +136,4 @@ config USB_DWC3
 
 config XLNX_USB_SUBSYS
     bool
-    default y if XLNX_VERSAL
     select USB_DWC3
-- 
2.39.2


