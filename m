Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E06309E3D
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:52:52 +0100 (CET)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Hq8-0007OW-1E
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hit-00020f-FH; Sun, 31 Jan 2021 13:45:23 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6His-0007ea-1J; Sun, 31 Jan 2021 13:45:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id 6so14246779wri.3;
 Sun, 31 Jan 2021 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wOeLzgMSRQZ8FekGiXtfrDvmIAILNb9yREGpHP0D6s0=;
 b=KVrY0B8T6uPLzVgWQEfLIqHrX+zuPOpU57rhUUgJQpapXgcQLvl9AN0DHa4z1R9h3a
 eqQZjVURkG30FuFHHvhgvQyorW7RnbW79v3kuvRfDvFSGPXV1s7cKkY2kDchowABAhNS
 9U8EQ/OGtBZkDSsdl2EtQZQJ5aQRNtm6x/cvbHsS4fstxOeX7ubm/BCBsZxDQGq3QZ2b
 R5zN73nly7kxyAhIVu3J6uWfWpLrhprqk0Olf4NkdrOLN1/9l+RuqYdRGgGy29Gc213f
 gJATe5ihE2mtBBON4qLi1ZgosnvBMzTEskNYMwJECA7ez435oGIIYyP+onc7uOBqOl2I
 lohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wOeLzgMSRQZ8FekGiXtfrDvmIAILNb9yREGpHP0D6s0=;
 b=Ojqfn0PBgE+sPC9gbrW+J8JC0C8N05ZAMWNxGntaq5cZ8p2vhuRCuFYQO8s84alt/i
 QakrKTCIE+5uKn5SxGedVcEEnu/kX5rkOoW91xv7d+SXXtNgidpdipvxCKmNMHaDkRGz
 qgOCPLCBrNl9iH8SxHrW1s1l/2L9m7Qu05TVjwSAn7DBfG7TwvDh/7l5eZ6AFTRr2GGz
 RLz3g/kFlAfqIzHSuVoUqyx4t1kspEwh5pIxe/i1T6jjOqGeScFf98A4Xcv/KJ/oMOco
 IXY84ybGUqOA8YvAFz1lst0WkFCJQGloeLaWFcZeIAkdFAc9qe5dMuV3P8z+Qy7OsE4h
 pdxw==
X-Gm-Message-State: AOAM533GNE9UXki09O5d6Y23cRnN/FhGLPzaJpUaSEKyg04Pai4UGOrA
 ZfsPXak0eD8Acb1MCRTCsTLsKznzaJk=
X-Google-Smtp-Source: ABdhPJzsQvoN33vwSUbNLlZsoDPRFKNXvQKn62BfLnbqU7A86wrBONVcMYBD9P61tFgYi4b0aZOG4w==
X-Received: by 2002:adf:d850:: with SMTP id k16mr14517011wrl.191.1612118718139; 
 Sun, 31 Jan 2021 10:45:18 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 17sm18042395wmk.48.2021.01.31.10.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:45:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] hw/net/can: ZynqMP CAN device requires PTIMER
Date: Sun, 31 Jan 2021 19:44:48 +0100
Message-Id: <20210131184449.382425-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a dependency XLNX_ZYNQMP -> PTIMER to fix:

  /usr/bin/ld:
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o: in function `xlnx_zynqmp_can_realize':
  hw/net/can/xlnx-zynqmp-can.c:1082: undefined reference to `ptimer_init'
  hw/net/can/xlnx-zynqmp-can.c:1085: undefined reference to `ptimer_transaction_begin'
  hw/net/can/xlnx-zynqmp-can.c:1087: undefined reference to `ptimer_set_freq'
  hw/net/can/xlnx-zynqmp-can.c:1088: undefined reference to `ptimer_set_limit'
  hw/net/can/xlnx-zynqmp-can.c:1089: undefined reference to `ptimer_run'
  hw/net/can/xlnx-zynqmp-can.c:1090: undefined reference to `ptimer_transaction_commit'
  libcommon.fa.p/hw_net_can_xlnx-zynqmp-can.c.o:(.data.rel+0x2c8): undefined reference to `vmstate_ptimer'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b5a4b..d4cec9e476c 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -81,3 +81,4 @@ config XLNX_ZYNQMP
     bool
     select REGISTER
     select CAN_BUS
+    select PTIMER
-- 
2.26.2


