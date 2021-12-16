Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F8C4772B3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:07:46 +0100 (CET)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqU5-0004v5-7m
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxqJo-0004Fi-Pu; Thu, 16 Dec 2021 07:57:09 -0500
Received: from [2a00:1450:4864:20::433] (port=41518
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxqJj-00022L-3I; Thu, 16 Dec 2021 07:57:08 -0500
Received: by mail-wr1-x433.google.com with SMTP id a9so44037286wrr.8;
 Thu, 16 Dec 2021 04:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UufwO9KGbGkX/wnG41kqfgB3vVtM5x/uZTCDfb4Lk80=;
 b=oq9VA0ofunUDQ5iKzkD2GJAdWBW8N1ljNv4/O/0z06LyBewFK/Dnf11Jg/6QmliwiE
 Fa0ADbi77QldaEHUC+xxvGvAuS4gEcm2KEUcWK/Xr08bGNLWCDqvMxLj3o70U98W/XaC
 nK1O1sayPR51t1V4qU7H/PCx6MqPCsQSNWv3Hp2BfidxeNEeOfbgjjbUf2zHdwsyApDk
 Jc9fDgy4uEQgMqeezzQUYzxRDiftfkF7Y7Q0TIUAWnjYF90F8pDUoIKeyEBTSqbtNKHi
 xGFFstqn7n3ZDUZmNd1eVL+8iTELLzekbpUip3T4UiEL0bjKSksnq6l8PrjGF73OehsI
 0L4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UufwO9KGbGkX/wnG41kqfgB3vVtM5x/uZTCDfb4Lk80=;
 b=hXkvvnicZjb/jHiArAKf5gvC4KY6PGEl6AsetM5TgFw3wHNtouSal5R7fHq2QoZdvg
 rlh3wWpKDkUnEn02hO28PLW+ZwWi2D4G6L0SO5M+AydrmcLMxPCaVCLZgI/ji7VHCLxe
 g1zAZtJVWL8Y4YzlR1KhvAwmTejAOFTRkrxFsR5KhFC1THyPX5G/C7Y0B7vq3UnVstJd
 Epsq1eqysSeZIoyy0mskWjvwUHLLlgNF0hzNluWFp5fRKod8PqyXW6YaG/SlVgyWGnex
 vxMEzDUkNiNqnVSix1EghyJrwxreOFMDyjBqw1/cK3VuuFxqrUtEo2C85NUlFF0+Z27s
 xVIw==
X-Gm-Message-State: AOAM533gRREmjw+YhQQTrRooX0TYtSvTshiQf8kYLes5oeMUktyzXySj
 covNOOasEO6LqdLsNhBJmItO3HCWoGw=
X-Google-Smtp-Source: ABdhPJxC5ZIJYyL8h+M0pNYxeItxUSN2uSMdb7J0SgWxt43QIIi5Sq/uX8bUQELc3wrnefp9E1ZaYw==
X-Received: by 2002:adf:9d8c:: with SMTP id p12mr6837114wre.622.1639659420879; 
 Thu, 16 Dec 2021 04:57:00 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o12sm4284302wrv.76.2021.12.16.04.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:57:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Date: Thu, 16 Dec 2021 13:56:45 +0100
Message-Id: <20211216125647.805544-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series simply extract the MV88W8618 device from the ARM=0D
machine in hw/arm/ and move it to hw/net/.=0D
=0D
Since v1:=0D
- update (c) notice=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/arm/musicpal: Fix coding style of code related to MV88W8618 device=0D
  hw/net: Move MV88W8618 network device out of hw/arm/ directory=0D
=0D
 include/hw/net/mv88w8618_eth.h |  12 +=0D
 hw/arm/musicpal.c              | 380 +------------------------------=0D
 hw/net/mv88w8618_eth.c         | 402 +++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |   2 +=0D
 hw/net/meson.build             |   1 +=0D
 5 files changed, 418 insertions(+), 379 deletions(-)=0D
 create mode 100644 include/hw/net/mv88w8618_eth.h=0D
 create mode 100644 hw/net/mv88w8618_eth.c=0D
=0D
-- =0D
2.33.1=0D
=0D

