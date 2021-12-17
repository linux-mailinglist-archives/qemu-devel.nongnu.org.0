Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F047978F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:35:31 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMl8-00088M-Uf
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:35:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMg7-0001ov-2s; Fri, 17 Dec 2021 18:30:19 -0500
Received: from [2a00:1450:4864:20::435] (port=34554
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMg5-0000em-Le; Fri, 17 Dec 2021 18:30:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so6871821wrg.1;
 Fri, 17 Dec 2021 15:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WJe8RjsoLjMomrT57K8fG8USP01ZAKlrT79WsOA/JOw=;
 b=Fb9MN1BMQFKmoLYEqANq06HR2tAF4NE0E5j+aQcjBY5cR6w2auQG7cM17CbYmlqm7Y
 sEcTT2VGwU/5Kz+YddYj0OdKN4X6qS0wnYYV46UXNGnrDp0XHC6TVpaet2CR1hpS+FFl
 TGsXF89fY+TkC1qtBzHi6DTsRZ6arhZPbCnOYnfL2OM3OrdBGRDMChrnwvX6einofXlA
 JQL4BSBh/LycgbFgpy/ID4Jn/52IOHdEoihaajXS7VXR66XI7xB/IDB0IKDTkJWK1WDE
 ftrN16/Zsqb4drHGO05iDimrP1WRSd+rT6shkG/QwyWTaCUMX1V+X0ik8kSl4Tbh144T
 clQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WJe8RjsoLjMomrT57K8fG8USP01ZAKlrT79WsOA/JOw=;
 b=l/kVrLW8MGI5yQz6izLlvO4ZIaS6+kYIBrltlJUMGDAV6gpFlSiIEcIU4wKyEaMaIe
 5TGjqqBy2SBtETOdsKlrgyujFR6Cej4vKxhktSaTvCUC1TqmP3GkFKSn3pKtGB8P8kgH
 CwCVIAL/EBnZXfKxipHaX8oQLgWv0RDFvjfUWpGdfV+YiT5Vo+2TSYGFUOKiQetoRkUL
 7+UketP2rJFth61WetHzT279AUPS/YUGs96OiWN0IR3RCuAcmzaabprPDWBpMkjInaRT
 4FE3dcQpoXWM2NdlxxWJs/P99neh5E3RtWzNdu5Sgfzlh9saRhbLb/pEabTtCpusWsjt
 aJeQ==
X-Gm-Message-State: AOAM533kfQZdvmYRYd1/kVweFHbCUWnMNBafNnRYR2hqxMAbnZw4cph6
 mFLxQtiPvf28eUw3DGJSHB5YBlwMUVA=
X-Google-Smtp-Source: ABdhPJwh1dQxOgxD7yAsrCTwxCNj4SwBbh7uZ4q/YjihOmjOqbJvtkDkGyOTx8vJfuK/Vwhi0Puflg==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr4120448wro.0.1639783814514;
 Fri, 17 Dec 2021 15:30:14 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n1sm10530570wrc.54.2021.12.17.15.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:30:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/
Date: Sat, 18 Dec 2021 00:30:04 +0100
Message-Id: <20211217233006.1466747-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217233006.1466747-1-f4bug@amsat.org>
References: <20211217233006.1466747-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Marvell 88W8618 is a system-on-chip with an ARM core.
We implement its audio codecs and network interface.
Homogeneous SoC Kconfig are usually defined in the hw/$ARCH
directory. Move it there.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Kconfig   | 3 +++
 hw/audio/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e6525909438..c459c897cc7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -94,6 +94,9 @@ config MUSCA
     select SPLIT_IRQ
     select UNIMP
 
+config MARVELL_88W8618
+    bool
+
 config MUSICPAL
     bool
     select OR_IRQ
diff --git a/hw/audio/Kconfig b/hw/audio/Kconfig
index e9c6fed8261..e76c69ca7e7 100644
--- a/hw/audio/Kconfig
+++ b/hw/audio/Kconfig
@@ -47,6 +47,3 @@ config PL041
 
 config CS4231
     bool
-
-config MARVELL_88W8618
-    bool
-- 
2.33.1


