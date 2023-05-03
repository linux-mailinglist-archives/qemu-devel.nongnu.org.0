Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA686F5464
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xn-0004Gf-Aw; Wed, 03 May 2023 05:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xl-0004C5-0b
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xb-0005sN-CU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:13:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so50266105e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105168; x=1685697168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PFj4eIUaihGsJoKv8B5FRcn5X+Xksm/i/JPGpiTgTM=;
 b=IcbLT8YcJbi98CWXU4bx8gvJM91v67dSWmRDefk4A8vRO7iWvzqWMOD3wX9TOLfmA8
 Wbu4mBG3s7LiRNRyuWGHT/rQ9hzQDqFPOsuab+nRPSOm/UJgaiBKPCtY7FEtrNFI2chn
 UxeVfpFK4cLh7HcWLyqFM3+owKLtr+D/3/J1EmfEhFLxS2RMPTtnikgxw0VaofYj8WR6
 HvlHLudKJ2mIqwDSxs2fRoif+sguePdCL17RXgVhjUU7vOC5kd7U5RkrSO43k0MgB7D6
 djdVRsKdkD9hyh7zyvTMB3vBujn7X0bOWfbMjvxujs9E4Zt1FOKFfVsn0qGFyKDRwkwg
 c7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105168; x=1685697168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PFj4eIUaihGsJoKv8B5FRcn5X+Xksm/i/JPGpiTgTM=;
 b=ZCVFya5YeI0C5jwA6pJ5qcvdMHRF9bz2so2UEVAC7oAWJ7zi2GfphXYx+fbNze1cQB
 OQ2sfqrRQ8wKHxSrMKcFZEvtDrzDXBM8Grejaqx8YuZ2Be3sojbgkEjW9dCe67YvT80u
 NixExaITONtQzmYwIzbaOJ/722ONCehIoRL5pMBM7Fth/3/LJOSAZTdnF4hB026p7Ujn
 zGy5c8wLyffmBQrkzd63NIFyXihsjMQKe6XHha8KjMqk+o2FqbMNMv1w+khtZyf2/ZlK
 aVvIGcUN1TbpQFmPgZxFm0fvkvAC83NinJGwTsNmsChP1jssTrBgsU7zb53EUakLkux7
 HdMQ==
X-Gm-Message-State: AC+VfDwICF4TxCdZPWu5sMTLxRRGjYhjRxRzsY1BLtTXwHEVYchgVQlu
 ZlYyhXrCyZ2gZeRSBBk2Fg90xA==
X-Google-Smtp-Source: ACHHUZ7uVwohLnzqlqa4SpFlwU5DA7ToSWqhe12+o2njYfZaqXcGYJ3baG+WPcA1nXk06MZVH3o0qQ==
X-Received: by 2002:adf:e64b:0:b0:306:4569:34a0 with SMTP id
 b11-20020adfe64b000000b00306456934a0mr491835wrn.69.1683105168698; 
 Wed, 03 May 2023 02:12:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y11-20020adfe6cb000000b002f81b4227cesm33420949wrm.19.2023.05.03.02.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12D7B1FFBA;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 10/22] hw/arm: Select VGA_PCI for sbsa-ref machine
Date: Wed,  3 May 2023 10:12:32 +0100
Message-Id: <20230503091244.1450613-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

The sbsa-ref machine explicitly creates a VGA PCI device, so make sure
vga-pci.c is included in the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-11-farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 06f58d1a6f..9e6e7ababe 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -254,6 +254,7 @@ config SBSA_REF
     select WDT_SBSA
     select ARM_GICV3_TCG
     select E1000E_PCI_EXPRESS
+    select VGA_PCI
 
 config SABRELITE
     bool
-- 
2.39.2


