Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB53C35E9
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:51:52 +0200 (CEST)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2H8p-0008KV-8y
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H72-0005pj-MH
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H71-0000vt-2W
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so17235373wri.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kE5DEyfQo7/40LoJhy/tb9hNnD7C2EQV6IaO+zvVn5k=;
 b=N0mvVArVCwn/aP7x9CZaCNmvTTvpb5Eu5ZpzrFZ9dHOzyYioneouCOxvRCPSdbnQiK
 6nCwY97p4T9re/sAtQrIZOmDR4WoltjU7aJbc/BMjAo8XFxUQngZwzKCYvB49Fgf6Y0w
 m+xeJ2fbug/pU2IDo70K0nsXTjuRSIKnaIQHpBY4xSnRPome3gJpo03FnOHxIoP1UQwo
 QzJ87CEMgT5+vVBw8zjLg6LyWp8ja49bChZmmFP4yZaHIHpWnOTug7sMptS2ELW1ZCDl
 z9gq3hnpkO0qz0vxTgjCBOqp9T6SmyjtAXaEcKpi90GvSjTWIBfvuJQzXlPhKWAByTW+
 m9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kE5DEyfQo7/40LoJhy/tb9hNnD7C2EQV6IaO+zvVn5k=;
 b=InrkLCQNMAdTPAfh54LuJKmS5rARFf2WaMjG3uUsvA/POhkLHYJA0IB40kff4Omf6n
 W3j8dBF1hJry2/yUB2v7CqH2e2IU1k1PSDJsoMn0CUm3VLTsjzTPYiseV7dXHaqPQo7V
 M6DNLzJCgJfWuNaoE4VoPyrNyoPupm8dqhPLHpLeFDpPlocnDrJXcXMuURBGqj1Gzc7a
 ZBFKjKzha0Fa5B+Q3+n6qCC57SYbW1JfA6S1jrirJOustqeXVZaz0X9w0DFdQ9I8MM8R
 PxVQj5Wc4tusKHOP1j+o1R8YS8gmRC57jzFa8Y/3LF82ueYgU3+DkhkqlhXfOoHTHbjv
 Opyg==
X-Gm-Message-State: AOAM532MJr6T8EG5H3nZy2ESRnmj2pmojJyyB/tE3S3IOcc5Ax+wxEC9
 1iqIkDUY0k/m3X3jkx6X+xhGEKLwLDvBJQ==
X-Google-Smtp-Source: ABdhPJxD7kwsY0FWPGCF83UD62ZKNEzL2BTRDnaHeCRNfb7/nd0M/a2FBVfPhBYSbpGdkgeLFSxdyQ==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr45227615wry.0.1625939396603; 
 Sat, 10 Jul 2021 10:49:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s9sm9060698wrn.87.2021.07.10.10.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:49:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] dp8393x: fixes and improvements
Date: Sat, 10 Jul 2021 19:49:46 +0200
Message-Id: <20210710174954.2577195-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark, Finn.=0D
=0D
This respin aims go group all the fixes sent/suggested on the list=0D
the last weeks around the dp8393x device.=0D
=0D
Mark, can you send your S-o-b for patches 4 & 6?=0D
=0D
The last 2 patches are included for Mark, but I don't plan to merge=0D
them without Finn's Ack, and apparently they require more work.=0D
=0D
Tested with NetBSD guest on Magnum Jazz.=0D
=0D
Based-on mips-next.=0D
=0D
Mark Cave-Ayland (1):=0D
  NOTFORMERGE dp8393x: don't force 32-bit register access=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  dp8393x: Replace address_space_rw(is_write=3D1) by address_space_write()=
=0D
  dp8393x: Replace 0x40 magic value by SONIC_REG16_COUNT definition=0D
  dp8393x: Only shift the device registers mapping by 1 bit=0D
  dp8393x: Store CAM registers as 16-bit=0D
  dp8393x: Migrate registers as array of uint16=0D
  dp8393x: Store CRC using device configured endianess=0D
  NOTFORMERGE dp8393x: Rewrite dp8393x_get() / dp8393x_put()=0D
=0D
 hw/m68k/q800.c   |   2 +-=0D
 hw/mips/jazz.c   |   2 +-=0D
 hw/net/dp8393x.c | 219 +++++++++++++++++++++--------------------------=0D
 3 files changed, 99 insertions(+), 124 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

