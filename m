Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB452F7FA4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:34:09 +0100 (CET)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0R72-0007Xu-HN
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R41-0005Xw-2I; Fri, 15 Jan 2021 10:31:02 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0R3u-0000xH-P3; Fri, 15 Jan 2021 10:30:56 -0500
Received: by mail-ej1-x62c.google.com with SMTP id n26so13839419eju.6;
 Fri, 15 Jan 2021 07:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uiFGIlAxUu4JOJhVYdjndEVzVqFiiMzibebdemylKWc=;
 b=SmLOaRcNu35hmJxclAkpq/Z2zfsTp3xq16m9aSBrEvCu4FTaet74EH1C46B8PkjM87
 sQiV1D9fOSG78UGvFdezNOZ2hyIYV7F1iVLeMVgL8Su/nlR8DEKiYKAdBfaD/8dX4rzG
 tfzb+bx6E085mzcsc/RO8uv+TAvOjqdGdjFcpdq1ia+q5FvH24m92rFEdsF4LzATePIu
 v92PDJCdFkfr9O1JOrg10fm+IG4zWNPt3L9t/vmpQXnYU/BFUEqJX1s7eE5gocN3AGLq
 5JyHJcOHIr40D0O9VLE1yB2Rm21el8Dzx1zpg6RyGydaGFLsZu+itOh8VMcY2Q+vzh/2
 N2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uiFGIlAxUu4JOJhVYdjndEVzVqFiiMzibebdemylKWc=;
 b=loLgq0wmHsg4A6I00FGe1JAyOdIHHPNzkhZDH5/e3nBrcX5H+eKazLu4ReR6JiEtyo
 DWbDGxhtjqy1Za4W3UjwPLT812PS/oQUk05hBdvcMTo8uz3OwvwUFKzt1EazUyPKF28q
 HDf0ErW4GL5fMNT6bqHsO9Sv0E3D+0t/dGwx87fNN/gIATGMVQxioM4r6nTbGcAjaykK
 ZNoBhZKlPFFkeBd1yQHkw7pH807aI/n/Jq3iXqZnRm0yB10h540kA8gcPJ/cA1MFJ8J8
 A2n+AU4Zds1Wjapjeku7tKNTK2Ku8Z8GOm8RWQUyFS/06UTRix80hq3TFWiW3vrZV2tq
 mTqg==
X-Gm-Message-State: AOAM532z5FYdhc5N1Ag3NtEUAnIxr0p98FbsNyInmuyTN/arSxKtNaK5
 smOXBsd7BReGQjbXXclncsEgJ7jCJX0=
X-Google-Smtp-Source: ABdhPJz+SELq/tgKJRbXYPqq96EQjxJjXEQIWGf52pq+7rP3wqlOsvG5MCGBL4+yGfesghburUs1YQ==
X-Received: by 2002:a17:907:3f29:: with SMTP id
 hq41mr9334716ejc.227.1610724651944; 
 Fri, 15 Jan 2021 07:30:51 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k22sm4261481edv.33.2021.01.15.07.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:30:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/9] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Fri, 15 Jan 2021 16:30:40 +0100
Message-Id: <20210115153049.3353008-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This is how I understand the ecSPI reset works, after=0D
looking at the IMX6DQRM.pdf datasheet.=0D
=0D
This is a respin of Ben's v5 series [*].=0D
=0D
Since v6:=0D
- Dropped "Reduce 'change_mask' variable scope" patch=0D
- Fixed inverted reset logic=0D
- Added Juan R-b tags=0D
- Removed 'RFC' tag as tests pass=0D
=0D
Based-on: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>=0D
(queued on riscv-next).=0D
=0D
Copy of Ben's v5 cover:=0D
=0D
  This series fixes a bunch of bugs in current implementation of the imx=0D
  spi controller, including the following issues:=0D
=0D
  - chip select signal was not lower down when spi controller is disabled=0D
  - remove imx_spi_update_irq() in imx_spi_reset()=0D
  - round up the tx burst length to be multiple of 8=0D
  - transfer incorrect data when the burst length is larger than 32 bit=0D
  - spi controller tx and rx fifo endianness is incorrect=0D
=0D
[*] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg02333.html=0D
=0D
Diff with v6:=0D
=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/9:[----] [--] 'hw/ssi: imx_spi: Use a macro for number of chip selects =
su=3D=0D
pported'=0D
002/9:[----] [--] 'hw/ssi: imx_spi: Remove pointless variable initializatio=
n'=0D
003/9:[----] [-C] 'hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG r=
eg=3D=0D
ister value'=0D
004/9:[----] [-C] 'hw/ssi: imx_spi: Rework imx_spi_read() to handle block d=
is=3D=0D
abled'=0D
005/9:[0003] [FC] 'hw/ssi: imx_spi: Rework imx_spi_write() to handle block =
di=3D=0D
sabled'=0D
006/9:[----] [--] 'hw/ssi: imx_spi: Disable chip selects when controller is=
 d=3D=0D
isabled'=0D
007/9:[----] [--] 'hw/ssi: imx_spi: Round up the burst length to be multipl=
e =3D=0D
of 8'=0D
008/9:[----] [--] 'hw/ssi: imx_spi: Correct the burst length > 32 bit trans=
fe=3D=0D
r logic'=0D
009/9:[----] [--] 'hw/ssi: imx_spi: Correct tx and rx fifo endianness'=0D
=0D
Bin Meng (4):=0D
  hw/ssi: imx_spi: Use a macro for number of chip selects supported=0D
  hw/ssi: imx_spi: Round up the burst length to be multiple of 8=0D
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic=0D
  hw/ssi: imx_spi: Correct tx and rx fifo endianness=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (4):=0D
  hw/ssi: imx_spi: Remove pointless variable initialization=0D
  hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value=0D
  hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled=0D
  hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled=0D
=0D
Xuzhou Cheng (1):=0D
  hw/ssi: imx_spi: Disable chip selects when controller is disabled=0D
=0D
 include/hw/ssi/imx_spi.h |   5 +-=0D
 hw/ssi/imx_spi.c         | 137 +++++++++++++++++++++++----------------=0D
 2 files changed, 86 insertions(+), 56 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

