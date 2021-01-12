Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8F2F3942
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:53:53 +0100 (CET)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOng-0000fm-6i
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOVz-0000ls-Mh; Tue, 12 Jan 2021 13:35:36 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzOVy-00079j-0Q; Tue, 12 Jan 2021 13:35:35 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so4883906ejf.11;
 Tue, 12 Jan 2021 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=txiwHr22GtoLnJcNkS7jAaB6MxcoOFxIFFZX9K+PMVM=;
 b=iK9hCcaaKvGDpLrFwfXALuQ9M1fRQ8IYBrvMWmqeMoDJ2orrltHDZSN8oyCwTDCbkS
 pzgwRkKt/KuAF0nA/EDVX1h26F/e2Uc7qHCE21JuODDPhYczu8d60l7jimlJ0DRMoTa8
 WCuIhgXL3IIPY48ZsgyZ0467lmJy8UiOAY0xFaM1Kw5q4aZ2vevyX7r0kcZH0i+hBq9J
 /qImht5PtKHBXCBCcqYTB5rQtEjTbiBjuZqCf++BPikEBGCG0RoOCFiIy1p9owxsF8vF
 t73hUOmrwIOGPmUV2gD7t/RGa4HjnC2LwiQIApF70DiSaEkdf/mZEY/FqKLE07MexwbW
 Y6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=txiwHr22GtoLnJcNkS7jAaB6MxcoOFxIFFZX9K+PMVM=;
 b=pgt93BDKMk18C3O2hLTvOicJcseOF4qvBj9eGxpJ+4Ujz3coKQ/oOHWSkTTZgQHgax
 Zv2O+rTDU/J3DuYouP/LqGEs5kwPGl+Xcz+TzrURsiXYqvy+i/8XfCo0a36aGISrAm3P
 ZKxRlBJKQkWZrLmLgbOZ7fUBEAVDt14Y8RduPeIhP6QRbcrUMHCOTbIyPBXqUURrlz77
 k0xBYzjpEnvJAmzku/oTtFXs19jkVr/r6yqR72bzH+in9GgKALc9+jtaLKPhR3lMGGqZ
 Ss8HcFrWEqJw8GaktBKG70i5Ru7rCD5L5tUMza3pDEzx3ch1J8v80j+jkr9O4R33+LkN
 v9PQ==
X-Gm-Message-State: AOAM532iK7tNj11hJVIUG9eDFDC2mcx1xEcfC03BQwVhkrYGo11PGXkv
 eqnEubnNMjp/ifewwEBKjeU=
X-Google-Smtp-Source: ABdhPJzJKMye2vRhBrbXNR2+bfKkKHJrQcUxdZunZ7FJNOL55ZhGtH57740UYk+DqVhE4UPRYcUqBw==
X-Received: by 2002:a17:906:d93c:: with SMTP id
 rn28mr135261ejb.50.1610476532195; 
 Tue, 12 Jan 2021 10:35:32 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id d8sm1822878edm.75.2021.01.12.10.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
Date: Tue, 12 Jan 2021 19:35:18 +0100
Message-Id: <20210112183529.2011863-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
As it is sometimes harder for me to express myself in plain=0D
English, I found it easier to write the patches I was thinking=0D
about. I know this doesn't scale.=0D
=0D
So this is how I understand the ecSPI reset works, after=0D
looking at the IMX6DQRM.pdf datasheet.=0D
=0D
This is a respin of Ben's v5 series [*].=0D
Tagged RFC because I have not tested it :)=0D
=0D
Sometimes changing device reset to better match hardware gives=0D
trouble when using '-kernel ...' because there is no bootloader=0D
setting the device in the state Linux expects it.=0D
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
Diff with Ben's v5:=0D
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
001/11:[----] [--] 'hw/ssi: imx_spi: Use a macro for number of chip selects=
 s=3D=0D
upported'=0D
002/11:[down] 'hw/ssi: imx_spi: Remove pointless variable initialization'=0D
003/11:[down] 'hw/ssi: imx_spi: Convert some debug printf()s to trace event=
s'=0D
004/11:[down] 'hw/ssi: imx_spi: Reduce 'change_mask' variable scope'=0D
005/11:[down] 'hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG regis=
te=3D=0D
r value'=0D
006/11:[down] 'hw/ssi: imx_spi: Rework imx_spi_read() to handle block disab=
le=3D=0D
d'=0D
007/11:[down] 'hw/ssi: imx_spi: Rework imx_spi_write() to handle block disa=
bl=3D=0D
ed'=0D
008/11:[0004] [FC] 'hw/ssi: imx_spi: Disable chip selects when controller i=
s =3D=0D
disabled'=0D
009/11:[----] [--] 'hw/ssi: imx_spi: Round up the burst length to be multip=
le=3D=0D
 of 8'=0D
010/11:[----] [--] 'hw/ssi: imx_spi: Correct the burst length > 32 bit tran=
sf=3D=0D
er logic'=0D
011/11:[----] [--] 'hw/ssi: imx_spi: Correct tx and rx fifo endianness'=0D
=0D
Bin Meng (4):=0D
  hw/ssi: imx_spi: Use a macro for number of chip selects supported=0D
  hw/ssi: imx_spi: Round up the burst length to be multiple of 8=0D
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic=0D
  hw/ssi: imx_spi: Correct tx and rx fifo endianness=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (6):=0D
  hw/ssi: imx_spi: Remove pointless variable initialization=0D
  hw/ssi: imx_spi: Convert some debug printf()s to trace events=0D
  hw/ssi: imx_spi: Reduce 'change_mask' variable scope=0D
  hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value=0D
  hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled=0D
  hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled=0D
=0D
Xuzhou Cheng (1):=0D
  hw/ssi: imx_spi: Disable chip selects when controller is disabled=0D
=0D
 include/hw/ssi/imx_spi.h |   5 +-=0D
 hw/ssi/imx_spi.c         | 147 +++++++++++++++++++++++----------------=0D
 hw/ssi/trace-events      |   7 ++=0D
 3 files changed, 97 insertions(+), 62 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

