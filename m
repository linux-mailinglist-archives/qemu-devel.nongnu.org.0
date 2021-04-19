Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E73363F13
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:45:55 +0200 (CEST)
Received: from localhost ([::1]:35580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYQTa-0003WK-Q7
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRM-0001ok-G8; Mon, 19 Apr 2021 05:43:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRK-0002u4-QL; Mon, 19 Apr 2021 05:43:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so7717665wmf.3; 
 Mon, 19 Apr 2021 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UqblqeEaUSfpb53UOOnTzqXwtcfVngamQsYUMLNIW4o=;
 b=OJStVtAB6cXd3h28+bg1QYQ912OI+n5rVboxcoOnl053pVVhgBHbpjY2DgaXL+/Xhb
 5wOGS6R+m9HKti080Zf9xA9KRlFnkBIfxbjp3guPuywOgAhdlPz96QNbQ/D4tlw7gIss
 ICXQJaB3oPF5UC9j1F67GEy8n6sZvVFWEy1fVI0Ew6OqGqPLrLnobe+Rm/Z1rQ9UeGjx
 s01x1jsgU1kOSR8zN0PdzVFSSF3DEwttSnsZuAjLdGBcrxZhmMp8GxKOt5uHqgwM6BBB
 xLNifw9kz3izsOKG3+Ul3IQfcJQxN0lyP88Jdhe0dVE6WPWPf1jkVXFI9zJ+gp8M4R+l
 yIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UqblqeEaUSfpb53UOOnTzqXwtcfVngamQsYUMLNIW4o=;
 b=FqX4FlGtfxFgoFQy8oKoQX2Ig2QqRtl7TzKADW+c/hQSi7+zHaMFa1cKLb/iLBAxiy
 8UQQeHdRF+QGgWNqf+JP7Su/xH1G1RJ23CHBQJNQNmis1h2JSA/QU2ISggLN/ZKxAecX
 f4UoTWB3bOxD5+bTdoPUyFzqZb8WLy4FaIOsEAPvc/Dyj1k2pNKdh7GHZQD9q3h1i41m
 J3tDE2Qw8vSOUW8qGXmgUXt7ted6DNmAK6mMlM/dpv24Ts0en4wFZ05dXJT7qA0C4AGv
 EEiFQbyl5ztJPNX4RhvmeE6k9YRYGXe0lQCZzDB2pwZ+3Mzt3IfKBWRvIRe4G/nphI62
 Fo+A==
X-Gm-Message-State: AOAM532PcG5L8Rsx9OnCCsIzh4FkYhNzXkKJLBASzKJUJ6X+xD+KPlCu
 HGmzaxBvGnCFH+AYgNcObEq/QnFqMN2+EA==
X-Google-Smtp-Source: ABdhPJxLKI+PsgVrh8CA23nbbfavDVIDeKihhBMi0aadgYnQyUzj5XheY2NeKtZOt1ER7rW3kR4Glw==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr20112628wmk.55.1618825411792; 
 Mon, 19 Apr 2021 02:43:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z17sm22634798wro.1.2021.04.19.02.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] hw/misc: Add memory_region_add_subregion_aliased()
 helper [pflash part]
Date: Mon, 19 Apr 2021 11:43:22 +0200
Message-Id: <20210419094329.1402767-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series introduce the memory_region_add_subregion_aliased()=0D
helper which basically create a device which maps a subregion=0D
multiple times.=0D
=0D
Since v1:=0D
- Split series in 2, keeping the I/O regions (showed with the q800=0D
  machine) part for 2nd part=0D
- Added R-b tags=0D
=0D
Examples are easier, so having a subregion aliased every @span_size=0D
then mapped onto a container at an offset, you get something like:=0D
=0D
          ^-----------^=0D
          |           |=0D
          |           |=0D
          | +-------+ |                 +---------+          <--+=0D
          |           |                 +---------+             |=0D
          |           |                 |         |             |=0D
          |           |   +-----------> | alias#3 |             |=0D
          |           |   |             |         |             |=0D
          |           |   |             +---------+             |=0D
          |           |   |             +---------+             |=0D
          |           |   |             |         |             |=0D
          |           |   |   +-------> | alias#2 |             |=0D
          |           |   |   |         |         |             |region=0D
          | container |   |   |         +---------+             | size=0D
          |           |   |   |         +---------+             |=0D
          |           |   |   |         |         |             |=0D
          |           |   |   |  +----> | alias#1 |             |=0D
          |           |   |   |  |      |         |             |=0D
          |           |   |   |  |      +---------+  <--+       |=0D
          |           | +-+---+--+--+   +---------+     |       |=0D
          |           | |           |   |         |     |span   |=0D
          |           | | subregion +-> | alias#0 |     |size   |=0D
   offset |           | |           |   |         |     |       |=0D
   +----> | +-------+ | +-----------+   +---------+  <--+    <--+=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      ^-----------^=0D
=0D
I know it need more documentation and tests, but I prefer to send=0D
as draft RFC for early review before spending more time on it.=0D
=0D
Supersedes: <20210326002728.1069834-1-f4bug@amsat.org>=0D
Based-on: <20210325120921.858993-1-f4bug@amsat.org>=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg795218.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  hw/misc: Add device to help managing aliased memory regions=0D
  hw/arm/musicpal: Open-code pflash_cfi02_register() call=0D
  hw/arm/musicpal: Map flash using memory_region_add_subregion_aliased()=0D
  hw/arm/digic: Open-code pflash_cfi02_register() call=0D
  hw/arm/digic: Map flash using memory_region_add_subregion_aliased()=0D
  hw/block/pflash_cfi02: Remove pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Simplify pflash_cfi02_register() prototype=0D
=0D
 include/hw/block/flash.h         |   1 -=0D
 include/hw/misc/aliased_region.h |  87 ++++++++++++++++++++=0D
 hw/arm/digic_boards.c            |  28 +++++--=0D
 hw/arm/musicpal.c                |  29 +++++--=0D
 hw/arm/xilinx_zynq.c             |   2 +-=0D
 hw/block/pflash_cfi02.c          |  36 +--------=0D
 hw/lm32/lm32_boards.c            |   4 +-=0D
 hw/misc/aliased_region.c         | 132 +++++++++++++++++++++++++++++++=0D
 hw/ppc/ppc405_boards.c           |   6 +-=0D
 hw/sh4/r2d.c                     |   2 +-=0D
 MAINTAINERS                      |   6 ++=0D
 hw/arm/Kconfig                   |   2 +=0D
 hw/misc/Kconfig                  |   3 +=0D
 hw/misc/meson.build              |   1 +=0D
 14 files changed, 285 insertions(+), 54 deletions(-)=0D
 create mode 100644 include/hw/misc/aliased_region.h=0D
 create mode 100644 hw/misc/aliased_region.c=0D
=0D
-- =0D
2.26.3=0D
=0D

