Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A2C6A421D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWd5C-0003lj-TI; Mon, 27 Feb 2023 07:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd4z-0003jo-N2; Mon, 27 Feb 2023 07:58:10 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWd4x-00070N-FT; Mon, 27 Feb 2023 07:58:09 -0500
Received: by mail-ed1-x534.google.com with SMTP id d30so25399865eda.4;
 Mon, 27 Feb 2023 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B5zggyZjvmOw/4139SlhqhQ6pnq8/WqaY6vuJBs+amg=;
 b=UBzI+oG0JE4hKfrY7YYcTYLk8/ibJrzJY6TJHM49zCFuWUcG8cdBbthv8hg85xnYWg
 UhB92wlD0msvEynoO72p2ZQw45nlzfYLsGeIKHxoJfdu1uNukVjVt+5knCggTCSi45Ee
 f4W3o4z7P7kjb1ElEGyHPIZeE+6bnrhd0QbHfIFmO+bbxcLWtIduTbr5JMekgNw94/l9
 aWobYCgYsbfLaE2Dqrpe+jeprCjBYJjrqazBjm28haEeZhA+7jNL/qHna4ekoSsF9paV
 rTn2kRerphGuIKLO8KesIn+Wu1wGYisQ7N0R3ttvCoogXIiqEQ9DGB4Ikxbgc5UBoBX4
 PmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5zggyZjvmOw/4139SlhqhQ6pnq8/WqaY6vuJBs+amg=;
 b=C5pqcFLU16ViUDNrR/Sa2WSfPwPfdv1cxjnUEJjKgAowEd7HUGX+JoY2m8gfzHkE0A
 fCSe8SjwphrCMkkgjdT2iVnaCdLINXMJzfP18pxy+cPFTpkuLaU1ogdFls6ajUSYrc+4
 9IP+8knnF5LRf2OMYOZEJCDVX41Ljn2QZyk958My/JnOK8XsE+uvYEmYlDeyCL2E2ykv
 kGlgf71kGQv3ec1DIemlbaTQ+zTAx3aNQMkS12yX9+5wEaC0mEOJCKlRBzmQx9N79hvF
 rxgJhfZrEcsyA6X9UolMRI9FFRCdmf7JffgukKlLkPrCF+uZTVvFEehBv3lV0RPW5Y5q
 pd5g==
X-Gm-Message-State: AO0yUKVkEfhmaQRLlCq25bn7nHv+4vdQxEX88jufan1c2damU1UiI6YQ
 HiAxZ5eBSDZqbHVDkd/gWkSd81TZqNI=
X-Google-Smtp-Source: AK7set+R8kAblSkFyQcdjCJ0pDCqUPVwonuRcsGj06lPEZACz4pnkCmkXd5WNnSVs+a5w7uUiTnSqA==
X-Received: by 2002:a17:907:9543:b0:8b2:c2fc:178e with SMTP id
 ex3-20020a170907954300b008b2c2fc178emr26452671ejc.74.1677502684957; 
 Mon, 27 Feb 2023 04:58:04 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 bk4-20020a170906b0c400b008d7a8083dffsm3186414ejb.222.2023.02.27.04.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:58:04 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/7] Pegasos2 fixes and audio output support
Date: Mon, 27 Feb 2023 13:57:25 +0100
Message-Id: <20230227125732.20941-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On behalve of Zoltan BALATON:=0D
=0D
Hello,=0D
=0D
This is marked v3 to avoid confusion with previously separate patches=0D
that already had v2, even if the series had no v2 yet.=0D
=0D
This series now includes all patches needed to get AmigaOS 4.1 run=0D
well on pegasos2 and add audio output to this board. It has 3 parts:=0D
patches 1-3 improve hw/display/sm501 model to avoid graphics problems=0D
that were present with AmigaOS; patches 4-6 fix PCI interrupt routing=0D
in VIA VT8231 model and in pegasos2 board that fixes PCI cards such as=0D
network or sound card not working before; finally patches 7-8 add=0D
basic implementation of the via-ac97 audio part of VT8231 (also used=0D
on VT82C686B) for output that is the default audio device on pegasos2.=0D
=0D
This version was re-tested by Rene Engel with latest AmigaOS version=0D
and runs as well as my original series did (posted a video with that=0D
before). This works now on an M1 MacStudio on macOS where it was=0D
unusable before. I've also tested it on Linux x86_64 with older=0D
AmigaOS version that also boots and makes sound and verified MorphOS=0D
still boots and also has sound now.=0D
=0D
One known problem with this version that includes Berhard's=0D
alternative vt82c686 patches is with MorphOS which uses level=0D
sensitive mode of the i8259 PIC that QEMU does not support so it hangs=0D
when multiple devices try to raise a shared IRQ. I could work around=0D
that in my otiginal series (see here:=0D
https://lists.nongnu.org/archive/html/qemu-ppc/2023-02/msg00403.html )=0D
where this works and was also tested, that version is available here:=0D
https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/=0D
but I could not convince Bernhard so I now expect him to provide a=0D
work around for that. This isn't a blocker though as MorphOS already=0D
runs on mac99 and sam460ex and only available as a time limited demo=0D
(they only sell licenses for real hardware) so not really usable apart=0D
from testing anyway so getting it running on pegasos2 would be nice=0D
but not a prioriey, more important is that AmigaOS runs for which this=0D
is the only viable machine as sam460ex version runs much slower. So=0D
I'd like this to be merged for 8.0 as it is now or only minor chnages=0D
(or alternatively we can return to my series which was also tested the=0D
same way and apart from different VIA IRQ router modelling contains=0D
the same patches).=0D
=0D
Please review and let me know who will take care of merging this for 8.0.=0D
=0D
Regards,=0D
BALATON Zoltan=0D
=0D
v4:=0D
* Rebased onto "[PATCH v3 0/3] VT82xx PCI IRQ routing fixes"=0D
=0D
Based-on: <20230227123316.18719-1-shentey@gmail.com>=0D
          "[PATCH v3 0/3] VT82xx PCI IRQ routing fixes"=0D
=0D
BALATON Zoltan (7):=0D
  hw/display/sm501: Implement more 2D raster operations=0D
  hw/display/sm501: Add fallbacks to pixman routines=0D
  hw/display/sm501: Add debug property to control pixman usage=0D
  hw/isa/vt82c686: Declare gpio inputs so it can be connected in board=0D
    code=0D
  hw/ppc/pegasos2: Fix PCI interrupt routing=0D
  hw/audio/ac97: Split off some definitions to a header=0D
  hw/audio/via-ac97: Basic implementation of audio playback=0D
=0D
 hw/audio/ac97.h           |  65 ++++++=0D
 include/hw/isa/vt82c686.h |  25 +++=0D
 hw/audio/ac97.c           |  43 +---=0D
 hw/audio/via-ac97.c       | 455 +++++++++++++++++++++++++++++++++++++-=0D
 hw/display/sm501.c        | 119 +++++++---=0D
 hw/isa/vt82c686.c         |   3 +-=0D
 hw/pci-host/mv64361.c     |   4 -=0D
 hw/ppc/pegasos2.c         |  20 +-=0D
 hw/audio/trace-events     |   6 +=0D
 hw/isa/trace-events       |   1 +=0D
 10 files changed, 662 insertions(+), 79 deletions(-)=0D
 create mode 100644 hw/audio/ac97.h=0D
=0D
-- =0D
2.39.2=0D
=0D

