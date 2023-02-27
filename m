Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830DC6A42E1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeZ-0005F4-Rc; Mon, 27 Feb 2023 08:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWdeS-00056A-MQ; Mon, 27 Feb 2023 08:34:48 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWdeP-0007sE-No; Mon, 27 Feb 2023 08:34:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5B6C1746335;
 Mon, 27 Feb 2023 14:34:42 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1C3F174632B; Mon, 27 Feb 2023 14:34:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1A3A77462DB;
 Mon, 27 Feb 2023 14:34:42 +0100 (CET)
Date: Mon, 27 Feb 2023 14:34:42 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
cc: Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 vr_qemu@t-online.de, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 0/8] Pegasos2 fixes and audio output support
In-Reply-To: <cover.1677445307.git.balaton@eik.bme.hu>
Message-ID: <fa88c0a2-09b9-4feb-9469-53b2563837b4@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 26 Feb 2023, BALATON Zoltan wrote:
> Hello,
>
> This is marked v3 to avoid confusion with previously separate patches
> that already had v2, even if the series had no v2 yet.
>
> This series now includes all patches needed to get AmigaOS 4.1 run
> well on pegasos2 and add audio output to this board. It has 3 parts:
> patches 1-3 improve hw/display/sm501 model to avoid graphics problems

Gerd, Peter, Daniel or Philippe,

Could you please review and merge the first 3 sm501 patches that's 
independent of the rest of the series and useful in themselves to reduce 
the size of this series and make it less confusing? The rest is still 
debated but at least these sm501 patches should be simple to review and 
merge now.

Regards,
BALATON Zoltan

> that were present with AmigaOS; patches 4-6 fix PCI interrupt routing
> in VIA VT8231 model and in pegasos2 board that fixes PCI cards such as
> network or sound card not working before; finally patches 7-8 add
> basic implementation of the via-ac97 audio part of VT8231 (also used
> on VT82C686B) for output that is the default audio device on pegasos2.
>
> This version was re-tested by Rene Engel with latest AmigaOS version
> and runs as well as my original series did (posted a video with that
> before). This works now on an M1 MacStudio on macOS where it was
> unusable before. I've also tested it on Linux x86_64 with older
> AmigaOS version that also boots and makes sound and verified MorphOS
> still boots and also has sound now.
>
> One known problem with this version that includes Berhard's
> alternative vt82c686 patches is with MorphOS which uses level
> sensitive mode of the i8259 PIC that QEMU does not support so it hangs
> when multiple devices try to raise a shared IRQ. I could work around
> that in my otiginal series (see here:
> https://lists.nongnu.org/archive/html/qemu-ppc/2023-02/msg00403.html )
> where this works and was also tested, that version is available here:
> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
> but I could not convince Bernhard so I now expect him to provide a
> work around for that. This isn't a blocker though as MorphOS already
> runs on mac99 and sam460ex and only available as a time limited demo
> (they only sell licenses for real hardware) so not really usable apart
> from testing anyway so getting it running on pegasos2 would be nice
> but not a prioriey, more important is that AmigaOS runs for which this
> is the only viable machine as sam460ex version runs much slower. So
> I'd like this to be merged for 8.0 as it is now or only minor chnages
> (or alternatively we can return to my series which was also tested the
> same way and apart from different VIA IRQ router modelling contains
> the same patches).
>
> Please review and let me know who will take care of merging this for 8.0.
>
> Regards,
> BALATON Zoltan
>
> BALATON Zoltan (6):
>  hw/display/sm501: Implement more 2D raster operations
>  hw/display/sm501: Add fallbacks to pixman routines
>  hw/display/sm501: Add debug property to control pixman usage
>  hw/ppc/pegasos2: Fix PCI interrupt routing
>  hw/audio/ac97: Split off some definitions to a header
>  hw/audio/via-ac97: Basic implementation of audio playback
>
> Bernhard Beschow (2):
>  hw/isa/vt82c686: Implement PCI IRQ routing
>  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
>
> hw/audio/ac97.c            |  43 +---
> hw/audio/ac97.h            |  65 ++++++
> hw/audio/trace-events      |   6 +
> hw/audio/via-ac97.c        | 455 ++++++++++++++++++++++++++++++++++++-
> hw/display/sm501.c         | 119 ++++++++--
> hw/isa/trace-events        |   1 +
> hw/isa/vt82c686.c          |  41 +++-
> hw/pci-host/mv64361.c      |   4 -
> hw/ppc/pegasos2.c          |  26 ++-
> hw/usb/vt82c686-uhci-pci.c |  12 -
> include/hw/isa/vt82c686.h  |  25 ++
> 11 files changed, 706 insertions(+), 91 deletions(-)
> create mode 100644 hw/audio/ac97.h
>
>

