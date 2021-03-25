Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E103491A1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:11:35 +0100 (CET)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOpq-0003ek-PI
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOnn-0002lG-2h; Thu, 25 Mar 2021 08:09:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPOnl-0004Rc-Id; Thu, 25 Mar 2021 08:09:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b9so2019502wrt.8;
 Thu, 25 Mar 2021 05:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DDB34aTqVGG92E44rNQAvqPm5804Nt8FjXcNgJmKNas=;
 b=gUjirW28Dg1dDfO39fcnB/AVxPBPdLBRn6Rtmpr18lriZ3i2RcZWaG25eG4MdkpuCP
 LGK+Ha/hTEJ3BAtSpVZCRkGMf/1J85/NetDxRqKsZq4MSJgUgG+r52/nTswibaJYEJru
 vyMcMiiJwSPvbotk8TbiZcp1DfNy6E5anGHZ1iYDbK0GsaWhBjv8CDz7C9ks5/3kt1lq
 uRzYeIByJmnmYaT4IOYrSts7JVm0T8QLe7j2cD/TYBYPXxHfedGlOjpfP+6iPzoQhI4G
 7BprYM74p2UkuITRJkhOFwR5wWVkbRgFp5wNT6ymfVgW2G/s/JksH5DrM19jCpS2huI5
 EGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DDB34aTqVGG92E44rNQAvqPm5804Nt8FjXcNgJmKNas=;
 b=mmADVvcP55IVOwPwN9T8UnFOQ/5bkA5O3i3Su9O1uvCLqpelEMGrgT+jD9kL0xvAF/
 qmOcU9OEbyCZTyRvAF8QuXKlV8KU5iGYbn6PiiGMpSiEBYCV1RuzkC6MYhrRyP+s77tk
 0vczXjTLG5Pnp+DOuzgvBWRjCZaFoJ1SdTwUQ55dM4N/FxsNVdvO9siQts2VTHFpZ9vY
 qSMpgJwlGawzRBVU4PQQZieffS29fDoWdbndyejQfsf31G6yCaO7awTUdZ99QDNkmpDU
 8JaNmih17xJef/MEvZYiEDavSmRMFJ9noNT2IcIqwfTca8yFkQp1BIRNj0pV3im/vDps
 6KGQ==
X-Gm-Message-State: AOAM5327lUodU/uQUfFefYkWDt55X+BcHHt/1fK4g26nAoYdU0mRpFB5
 j+kLVc8DnT7rS1v/WVqV+BUpR/REeRrp2A==
X-Google-Smtp-Source: ABdhPJyydAPeq3j0Z9ctYzphOX4sFewyKCsbMkPp57cEQZqjKP0hDZ4GtEGMLB0US/K4lM2SAoS91g==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr8416279wri.318.1616674163289; 
 Thu, 25 Mar 2021 05:09:23 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h21sm5950759wmp.10.2021.03.25.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:09:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 0/2] hw/block/pflash_cfi02: Do not create aliases when
 not necessary
Date: Thu, 25 Mar 2021 13:09:19 +0100
Message-Id: <20210325120921.858993-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify memory layout when no pflash_cfi02 mapping requested.=0D
For example using the r2d machine:=0D
=0D
  (qemu) info mtree=0D
  address-space: memory=0D
    0000000000000000-ffffffffffffffff (prio 0, i/o): system=0D
      0000000000000000-0000000000ffffff (prio 0, i/o): pflash=0D
        0000000000000000-0000000000ffffff (prio 0, romd): alias pflash-alia=
s =3D=0D
@r2d.flash 0000000000000000-0000000000ffffff=0D
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga=0D
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram=0D
=0D
  (qemu) info mtree=0D
  address-space: memory=0D
    0000000000000000-ffffffffffffffff (prio 0, i/o): system=0D
      0000000000000000-0000000000ffffff (prio 0, romd): r2d.flash=0D
      0000000004000000-000000000400003f (prio 0, i/o): r2d-fpga=0D
      000000000c000000-000000000fffffff (prio 0, ram): r2d.sdram=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  hw/block/pflash_cfi02: Set romd mode in pflash_cfi02_realize()=0D
  hw/block/pflash_cfi02: Do not create aliases when not necessary=0D
=0D
 hw/block/pflash_cfi02.c | 10 +++++++---=0D
 1 file changed, 7 insertions(+), 3 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

