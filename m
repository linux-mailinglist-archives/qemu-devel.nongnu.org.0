Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1233AB311
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:55:23 +0200 (CEST)
Received: from localhost ([::1]:34272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqcE-0007pp-6O
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqaZ-0005o2-Rw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqaX-00057A-U4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id m18so6461575wrv.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5HNk+XBZv9LiexhVLSNKk+Yj6Thwvmk0FUlmqoDVsdY=;
 b=vJgMTUbkRkfu3DT/lCkjnKO/1SwArjOA4rzvG63zvPIBo9BQu2e5IRcCCfhnkvl9VF
 Zilx4WHfAGrNjpkz0xko8vtME4cZUeiPKiqReRpaSVZeu0LQA96ZBHWfY0n8oEG6TZ94
 yUq+UVCCjtkBWgt8RxnVbSvX3aM1TTpp7Oq/kPcQvLOc8peKtqo64Q0WBBQJRuY/QK4r
 jzh/sVF1q+Lz6xO9PgNuExvz66j+xkFnsQL7zItJcjspHL5eB1j9Rm4tt7KcYfUF8fwR
 ZOnH1jlvaqnZcIjuQKOzhYWDOx4zJuVKOikk787DtGgj6Ns4+H+fmNc8/wxfG5ywM/Z6
 C+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5HNk+XBZv9LiexhVLSNKk+Yj6Thwvmk0FUlmqoDVsdY=;
 b=YCESrbR3Lq/AgpZfrZEqTTZvApJX66wyoQdZpYPtDMcnu7BWzBOxCJAGNWcpv+P/m/
 TH2GLSoBPBIIeKDCke3kbIfL2HLMMW8j45KtyS/fxtMYNZ3mVD35lFAM8pmDUNI23yaK
 Ka5aRy0kqTRIEZnYVN9ym9nDvY79gXUZa8Nr8su3oG600kKneOS0VH2c9Y/3X9unH2Jq
 NXq4j5kQe2wpycQLWh7EHcHT8xMI2WbAsKqXU5n64DzK/8k4DmTtXRRi7GaQWdb4jfHJ
 Xmo6cX5oXH1ToE9PM1wLr/1Lp9ZD6N9YDL+DHpIk5SMVgasl+/qj3ah6ChmjZQpYc6mW
 iogg==
X-Gm-Message-State: AOAM5327Wp8+n5tv8KIjldQ7XehRf5GmW4tV8PREMr+HH6MgH5fT/b5l
 ewme3qUMOdcw4MFtdQGVq2a4IOi9oNBhEA==
X-Google-Smtp-Source: ABdhPJw2+SFOkubuyVrtYjbYmG9M09XGHPPPcBfsSMWWegyGD0C4gQ0lO3Cmt/UzZdK44U8tKi9w3w==
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr5063961wrw.422.1623930816266; 
 Thu, 17 Jun 2021 04:53:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y16sm1755408wrp.51.2021.06.17.04.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/15] hw/i2c: Remove confusing i2c_send_recv() API
Date: Thu, 17 Jun 2021 13:53:19 +0200
Message-Id: <20210617115334.2761573-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Full series reviewed, all comments addressed.=0D
=0D
Corey, could you take this via your tree?=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
This is a respin of Zoltan's patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html=0D
=0D
Since v4:=0D
- removed assertion in i2c_do_start_transfer (Richard)=0D
- added Richard R-b tags=0D
=0D
Since v3:=0D
- addressed minor review comments from Richard/Corey=0D
- added R-b/A-b tags=0D
- implemented Richard suggestion (last 2 patches, 14 & 15)=0D
=0D
Since v2, tried to address Corey's review comments resulting=0D
in a i2c_send_recv() removal and code easier to review (to my=0D
taste at least).=0D
=0D
BALATON Zoltan (1):=0D
  hw/i2c: Make i2c_start_transfer() direction argument a boolean=0D
=0D
Philippe Mathieu-Daud=C3=A9 (14):=0D
  hw/input/lm832x: Move lm832x_key_event() declaration to "lm832x.h"=0D
  hw/input/lm832x: Define TYPE_LM8323 in public header=0D
  hw/display/sm501: Simplify sm501_i2c_write() logic=0D
  hw/display/sm501: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c/ppc4xx_i2c: Add reference to datasheet=0D
  hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/misc/auxbus: Fix MOT/classic I2C mode=0D
  hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT cases=0D
  hw/misc/auxbus: Replace 'is_write' boolean by its value=0D
  hw/misc/auxbus: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c: Remove confusing i2c_send_recv()=0D
  hw/i2c: Rename i2c_set_slave_address() -> i2c_slave_set_address()=0D
  hw/i2c: Extract i2c_do_start_transfer() from i2c_start_transfer()=0D
  hw/i2c: Introduce i2c_start_recv() and i2c_start_send()=0D
=0D
 include/hw/i2c/i2c.h      | 46 +++++++++++++++++++++---=0D
 include/hw/input/lm832x.h | 28 +++++++++++++++=0D
 hw/arm/nseries.c          |  3 +-=0D
 hw/arm/pxa2xx.c           |  2 +-=0D
 hw/arm/spitz.c            |  4 +--=0D
 hw/display/ati.c          |  2 +-=0D
 hw/display/sm501.c        | 16 +++++----=0D
 hw/display/xlnx_dp.c      |  2 +-=0D
 hw/i2c/core.c             | 76 ++++++++++++++++++++++-----------------=0D
 hw/i2c/imx_i2c.c          |  2 +-=0D
 hw/i2c/pm_smbus.c         |  4 +--=0D
 hw/i2c/ppc4xx_i2c.c       | 15 +++++---=0D
 hw/i2c/smbus_master.c     | 22 ++++++------=0D
 hw/input/lm832x.c         |  2 +-=0D
 hw/misc/auxbus.c          | 70 ++++++++++++++++++++++++++----------=0D
 MAINTAINERS               |  1 +=0D
 16 files changed, 207 insertions(+), 88 deletions(-)=0D
 create mode 100644 include/hw/input/lm832x.h=0D
=0D
-- =0D
2.31.1=0D
=0D

