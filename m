Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5106F5435
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8YU-00060q-VI; Wed, 03 May 2023 05:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Y3-0004oL-9U
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xd-0005un-7C
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso48169255e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cp5aWpNFEKNfX4cniASWWTTXEPawh8hxWsJm6GasqjU=;
 b=apn4aRAwdbZ8pkONEchfSSZ+pjVdhKCVKDn+N51GaTNY1/E9eOmxf319Xfdm9CDRP6
 2r79LSmkvJCSfi5a/9c4ZnAVHBkn7jbHF4Txz6OUg6G9pPNXbZ7Bo39bO/sirWNXmM1G
 H/F81gMJTaLyhcDjz1ynRf9PNrugSNCyk/gecyO/NL+or070n9tTnwDcooW59gVdVKcb
 pEhPcHYU+IU3gUMkQkGKNk2qHgcX4m5dPAWL73P6m/BzOGUhjZXqHdfaK8ubOXUTVFuY
 7AoVeSkDVPmiYtFgjdKbRN+lR/YKg7suc6UDZeSPvWVLBytorje6xztRxDe+nIbhkRex
 XNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105172; x=1685697172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cp5aWpNFEKNfX4cniASWWTTXEPawh8hxWsJm6GasqjU=;
 b=WsfoW9+7mXLDnaiGfNTIqIYt/8zkRzpoPFRc5Tg+p76c7cQ83GrPDUQ4pt1kvA6cOP
 oOOE82UcL5KiHmlr+mA+Fa93Qz0GbSAdeOvNUv9RZeBXxLqJozmOJRzIx/zLW6kY26aT
 708WT1sasnPdzsS4Z4V2JicwGtmTXOZTaNNQjyT2EHR3fbvfc3izrNTTDWWEqrzvArkK
 N5oXfwjx82dpdgFQ0IU4rRlVJ9/FTNXFCFlDbZNWodcALGNjQkrLUa1qqaKRyxGZmEZE
 xtMOHc9IuCmm3VBAa4vzfOJ0HOj9BKFektZ0CrTx3lHiKvVrUsu2i4AINxFT7XufnTZT
 Lxqw==
X-Gm-Message-State: AC+VfDwQmlBJYmHFOEVp964RASOK/jt9SQBVzAvbzSaCQZmZnSsCmPB8
 3CGjJdGPwW8e50/qCm5wG8IEAQ==
X-Google-Smtp-Source: ACHHUZ4vz3I0FkYdLdsRfkjTsb1D2iyb4nDGkw9dwRzuQR0NK9mgCTLHiXoypsYsa7QNKVaWApikuw==
X-Received: by 2002:a7b:c3c8:0:b0:3f1:745a:784 with SMTP id
 t8-20020a7bc3c8000000b003f1745a0784mr14374016wmj.23.1683105171920; 
 Wed, 03 May 2023 02:12:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm1251460wmq.26.2023.05.03.02.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB3EE1FFC8;
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
Subject: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for XTENSA_VIRT
Date: Wed,  3 May 2023 10:12:39 +0100
Message-Id: <20230503091244.1450613-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

These are needed for board creation so fail under "make check" with a
--without-default-devices build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/xtensa/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/xtensa/Kconfig b/hw/xtensa/Kconfig
index 0740657ea5..a54a9d395e 100644
--- a/hw/xtensa/Kconfig
+++ b/hw/xtensa/Kconfig
@@ -6,6 +6,8 @@ config XTENSA_VIRT
     select XTENSA_SIM
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PCI_DEVICES
+    select VIRTIO_PCI
+    select VIRTIO_NET
 
 config XTENSA_XTFPGA
     bool
-- 
2.39.2


