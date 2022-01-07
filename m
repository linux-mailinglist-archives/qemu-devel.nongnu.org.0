Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA9487D51
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 20:51:38 +0100 (CET)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5uMW-0008Fr-Cb
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 13:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uEC-0005CB-RR; Fri, 07 Jan 2022 13:44:40 -0500
Received: from [2a00:1450:4864:20::42d] (port=46918
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5uE6-0004lc-7J; Fri, 07 Jan 2022 13:44:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so1889102wrb.13;
 Fri, 07 Jan 2022 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A2xHx7jyL07FmPjaIz4i4MCNz2Q5o3lQXlGvrwGsc3w=;
 b=UqtozBJSjI0i1njpYmBhopnQlRTuYeChTkkXOQozg9moyCDd7LPbrEDNpORRFqfSuK
 UycKz2ZhJcBw7Ozlsqne8I11Y61ErCQklczoOb1iLlWJv9wnsrU3rH8rHNtf6/23z4p3
 ifWCS2vDD3Bq9tVMc01t2j+t/00tHPxNX/Ey+Miqgr0+AjoSGnn9e04ufhm28IW87rSf
 zB/wS/LXq8CTTCOfI3LjK4mR/7g3R4NMnRYZQxnRCbQgceq2HadNbKCOznz1bimi2C6U
 8QLknDXnUoq/i9jAkjVmcRLGOPyUhbM3fm9/PYDURDKSDn/TMGuTHw7TrmB6BwqutArb
 PwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=A2xHx7jyL07FmPjaIz4i4MCNz2Q5o3lQXlGvrwGsc3w=;
 b=WuXUdqUrE0/PIgSD2hCdhaQQDBBbtv/zrl17LHs1S6e2I5wm5B1qig2mkJ2JA9LQGy
 ZjGkq2UvIR0UynoShwIqUNboMrAXPeiC3asVWiT//chde9rX8asu3pGGEjoRge15vtK1
 EgD1HFhkYteodl5O6pXbRUW78CibiIFOc1LDl2AEOY4BmBBBsUtX4GkCyqa9vhy31Ujc
 e/9RE0/gGRaJjkTGQxWMcmQwUDpVpHI/MZs0MIm/ash9d4ucdzUR8ITOShbTqN6yp8c+
 JMXQ0BSA3tgibnIexCi/jqxKy54XinVGZTTLI5lOFgAEZMH1CE2uUj7XVeCfTOh/DkAn
 1hCA==
X-Gm-Message-State: AOAM531hFhqhCVuE6YYn7pEa/GAul0+qdQtNnfUecon/XED9v2JRpLmC
 2K6tEGhZSmURkezQWtqBBoTyCIoWLdyhCQ==
X-Google-Smtp-Source: ABdhPJwGobNroDYfd1dbGe65O9BTUDBg/Y9C0aQwn18FGaSEp73a7JNLQdPa6bQzYXgPmvYywHmK+w==
X-Received: by 2002:adf:dfcc:: with SMTP id q12mr7651303wrn.86.1641581071482; 
 Fri, 07 Jan 2022 10:44:31 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id i8sm6880069wry.108.2022.01.07.10.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Date: Fri,  7 Jan 2022 19:44:26 +0100
Message-Id: <20220107184429.423572-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series simply extract the MV88W8618 device from the ARM=0D
machine in hw/arm/ and move it to hw/net/.=0D
=0D
Since v3:=0D
- Rebased on latest main/master=0D
=0D
Since v2:=0D
- declare MARVELL_88W8618 in hw/arm/Kconfig=0D
- use MARVELL_88W8618 Kconfig (rth)=0D
=0D
Since v1:=0D
- update (c) notice=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/=0D
  hw/arm/musicpal: Fix coding style of code related to MV88W8618 device=0D
  hw/net: Move MV88W8618 network device out of hw/arm/ directory=0D
=0D
 include/hw/net/mv88w8618_eth.h |  12 +=0D
 hw/arm/musicpal.c              | 381 +------------------------------=0D
 hw/net/mv88w8618_eth.c         | 403 +++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |   2 +=0D
 hw/arm/Kconfig                 |   3 +=0D
 hw/audio/Kconfig               |   3 -=0D
 hw/net/meson.build             |   1 +=0D
 7 files changed, 422 insertions(+), 383 deletions(-)=0D
 create mode 100644 include/hw/net/mv88w8618_eth.h=0D
 create mode 100644 hw/net/mv88w8618_eth.c=0D
=0D
-- =0D
2.33.1=0D
=0D

