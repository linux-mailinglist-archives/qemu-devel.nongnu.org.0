Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA26A9DA1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9AY-00038j-Dr; Fri, 03 Mar 2023 12:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9AV-0002rx-Ox
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:26:07 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY9AT-0005ic-OT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:26:07 -0500
Received: by mail-pl1-x631.google.com with SMTP id i3so3404481plg.6
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677864365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BhdCcdoB7Ix7usprZRSN0XJT9vtF8/q58AlOEU+BMew=;
 b=f69OJFahNW3amSA9DOZuYCMrDptwF2AiUjKjDBLYnk4Sd9WoM9uBnjF/lMhiFQNgrn
 IMXq0HdXhkVpre1jeTP9g/bLg6Wj9h1Bahe0A309xnQcSrvU/qy70nt2ukP54O8LlrK3
 S9yJpTkGD5enawvTfMz/MnrRmRf6zEA3dfFN/cjUGXtsNAz5d2WPtWaeQ2oyP0jYb7Bl
 kD5+lBQfAcEAKtbyU2PrpuKBhk4Ahy3J3CMzg/dsCorIOsbSqhY+NBcVk0QF58kU0QQg
 j3atMviCLlu6hGm/8z5itH3PIq82Fzxe6POWjhgMUYUIFaLiiBdO+co7MA2hoAiL7AW3
 eteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BhdCcdoB7Ix7usprZRSN0XJT9vtF8/q58AlOEU+BMew=;
 b=KYqffCsnbn8VAYRrSGNwPGCFUp6DfxOx2wBnH1h3a5P5rugtqcm+VD2roMXt+FahuG
 5zK3csWolkCZi0qmJ2J3RBukJwN7Zh2uQhdAaYzlkLNw74k/h/KEh7A9UHbo8WyEVS+p
 TWV1tHvgtXYzoWmVvvqdzgUnI4HmTt2Zz95EhkS2kzoEErgrUz9XRlWZ9NpNiDHNyoZ+
 /GK1UR2kRBYkDR24qxvVwQ6uNcHp+9dITQ99tzKN++CqcG1UM7WcBHN4HGLdfR0hG+ZC
 qQL407+baEwt0CNdMpb202MhM695bt4O+eTXsqE2VCtPV4folfGRcqH9KdCBJaecT1fB
 KvPA==
X-Gm-Message-State: AO0yUKVPrJ5qo+/D/xJ09tWT5ep0xRasxZ1tjaWM9jl7S0dK6ly3oFPW
 gGZRTuTNiCbF1BFpyX/SPsaZ734aNv4OifRenioNWw==
X-Google-Smtp-Source: AK7set+G3HvsJfl16phF2v0yjv4N52QUUH04wO4TGRPZ2xZv7Xt0OR0Ab3lzNdzjNTdpHcQSuL5hE+RFfu23sFvq9q8=
X-Received: by 2002:a17:903:25ca:b0:19a:5953:e85c with SMTP id
 jc10-20020a17090325ca00b0019a5953e85cmr943968plb.1.1677864364766; Fri, 03 Mar
 2023 09:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
 <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
 <e85a5616-514f-0623-d8ec-eec758ac160b@linaro.org>
In-Reply-To: <e85a5616-514f-0623-d8ec-eec758ac160b@linaro.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 09:25:53 -0800
Message-ID: <CAGD3tSyboZrsZLdB8YLnK-bfxpiBBx=V7cmxK8JDBGPb_=xTBA@mail.gmail.com>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=hshan@google.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Mar 3, 2023 at 2:25=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 3/3/23 11:19, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 3/3/23 08:33, Michael S. Tsirkin wrote:
> >> On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> >>> Add the configure support for the Android Emulator hypervisor driver
> >>> accelerator. The Android Emulator hypervisor driver is a Windows
> >>> driver made by porting the KVM from kernel 4.9-rc7.
> >>>
> >>> Signed-off-by: Haitao Shan <hshan@google.com>
> >>
> >> Replying on patch 1 but it applies to the whole patchset.
> >
> > Indeed this series lacks a cover letter,
> I just noticed the cover letter in my inbox, oddly delivered after
> the patches:
> https://lore.kernel.org/qemu-devel/CAGD3tSzW1QoAsn+uGjoAkBegLt1iZ=3D9YWDF=
cvqbcHMr0S_5kVw@mail.gmail.com/
> (note the patches are disconnected from the cover, and the cover lacks
> the diffstat).
Again, I am sorry for the trouble. I will figure out how to
send cover letter properly together with other patches
using "git sendmail".
>
> > which would show
> > this huge diffstat:
> >
> >   MAINTAINERS                       |   12 +
> >   accel/Kconfig                     |    3 +
> >   docs/about/build-platforms.rst    |    2 +-
> >   hw/i386/aehd/apic.c               |  204 +++++++++++++++
> >   hw/i386/aehd/i8259.c              |  165 ++++++++++++
> >   hw/i386/aehd/ioapic.c             |  164 ++++++++++++
> >   hw/i386/aehd/meson.build          |    6 +
> >   hw/i386/meson.build               |    1 +
> >   hw/i386/pc.c                      |    5 +
> >   hw/i386/x86.c                     |    5 +-
> >   include/exec/poison.h             |    1 +
> >   include/exec/ram_addr.h           |    2 -
> >   include/hw/core/cpu.h             |    7 +
> >   include/hw/intc/i8259.h           |    1 +
> >   include/hw/intc/ioapic.h          |    1 +
> >   include/sysemu/aehd-interface.h   |  878
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   include/sysemu/aehd.h             |  168 ++++++++++++
> >   include/sysemu/hw_accel.h         |    1 +
> >   meson.build                       |   16 ++
> >   meson_options.txt                 |    2 +
> >   qemu-options.hx                   |   20 +-
> >   scripts/meson-buildoptions.sh     |    2 +
> >   target/i386/aehd/aehd-accel-ops.c |  119 +++++++++
> >   target/i386/aehd/aehd-accel-ops.h |   22 ++
> >   target/i386/aehd/aehd-all.c       | 1349
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++
> >   target/i386/aehd/aehd-cpu.c       |  150 +++++++++++
> >   target/i386/aehd/aehd-cpu.h       |   41 +++
> >   target/i386/aehd/aehd-stub.c      |   22 ++
> >   target/i386/aehd/aehd.c           | 2003
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   target/i386/aehd/aehd_i386.h      |   26 ++
> >   target/i386/aehd/aehd_int.h       |   50 ++++
> >   target/i386/aehd/meson.build      |    8 +
> >   target/i386/cpu-sysemu.c          |    3 +
> >   target/i386/cpu.c                 |   12 +-
> >   target/i386/cpu.h                 |    5 +-
> >   target/i386/helper.c              |    3 +
> >   target/i386/meson.build           |    2 +
> >   37 files changed, 5465 insertions(+), 16 deletions(-)
> >
> >> There's obvious duplication with kvm here - probably not surprising.
> >>
> >> I'd be interested to hear from KVM people to know whether
> >> there's interest in unifying code, or they would rather
> >> not bother supporting this platform and it's better off
> >> being kept separate.
> >
> > I believe the hw part can be unified, reducing the maintenance
> > cost. (I gave Haitao few hints replying to the relevant patches).
> >
> > Regards,
> >
> > Phil.
>


--=20
Haitao @Google

