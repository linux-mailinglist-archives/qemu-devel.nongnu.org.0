Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380054DB147
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:22:57 +0100 (CET)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTc8-00019i-7S
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:22:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTPI-0006xC-C0
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUTPF-0001el-2L
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647436176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUjDUMLR1cceFSXs3+vNunkuSyJVRtv6LfmBiXXSacU=;
 b=CwjFcJ4HPmYWRB/gW0hs0mLxuiRemsDfKJfmBqcUaCaXDhdVuKWXP/t9uPEQH5Qatx14w0
 pJ5BwIAuiqjbbm2UVDWIwKwh6P85HfMP97xJduokiybvF15IiRcdDoYOlCJxK8k9y0DUZv
 1bvz8TV7lM7xOt8Tum5jyVIX1RLscUk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-C10HdkHQMb6gnU_ORIq0GA-1; Wed, 16 Mar 2022 09:09:33 -0400
X-MC-Unique: C10HdkHQMb6gnU_ORIq0GA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2d07ae11467so18199277b3.12
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LUjDUMLR1cceFSXs3+vNunkuSyJVRtv6LfmBiXXSacU=;
 b=VM14IyRSBvVmH2SVpGAbbt77+XqLwEHc2xjBuZcpF0uwReBbM88lRK9DMSVoVO2iU3
 aoPoELJ6Sp/P0KInIQIjyyLJSPohrftLU/Q9zALw8/UIay8aMgAu9coyRfdKkieMZmnC
 SMYf8OoAivxro9RFzg9nifQ3EUOSaOF77GhsA0Sd9R/cx0DlxBvTQu9AEntZqr8odhCs
 TY+P92YlOdGU9glO5BAusBgMkKUpNUie786ROGDJ3Kik6xYua0pLY4OnWi8z05IVM1xL
 I71zLJj6DYPn81mxdcRRk3c7KaHQsSBSNCe/GuoM7Q24r7UT7qhMaNssvRVhyTl/vIkf
 pRtA==
X-Gm-Message-State: AOAM531mIToWO8IzLASkLBDAdw11+r8ToIXy4fQtVEf5S1TiGBLc8ngq
 v2UIwsRN8DvESGXuplqvUGP1Y53N+yP4SuMi1PUqYfiAjIbGU+4zXMznU5gISKyKXJJGGYo0/1p
 OxA0pj9nwIkLq/TWIJh0fDpBYJwMjbf0=
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id
 c1-20020a25af41000000b00633905f9e9bmr2095211ybj.77.1647436173247; 
 Wed, 16 Mar 2022 06:09:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwToic1VCw89tOgg6dLGkbX6rIrees3emMg2eW+6ryHxYcS2vnVMbPuSnxY+ZB8fHjLhsti7f5gQsm9BATcOPY=
X-Received: by 2002:a25:af41:0:b0:633:905f:9e9b with SMTP id
 c1-20020a25af41000000b00633905f9e9bmr2095185ybj.77.1647436173029; Wed, 16 Mar
 2022 06:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
In-Reply-To: <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 17:09:21 +0400
Message-ID: <CAMxuvaze+OAZevgxnUSiwUN_ARch-Dgd643RYEC+vVm4J84d-Q@mail.gmail.com>
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Huacai Chen <chenhuacai@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 5:04 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace a config-time define with a compile time condition
> > define (compatible with clang and gcc) that must be declared prior to
> > its usage. This avoids having a global configure time define, but also
> > prevents from bad usage, if the config header wasn't included before.
> >
> > This can help to make some code independent from qemu too.
> >
> > gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   meson.build                             |  1 -
> >   accel/tcg/atomic_template.h             |  4 +-
> >   audio/audio.h                           |  2 +-
> >   hw/display/pl110_template.h             |  6 +--
> >   hw/net/can/ctucan_core.h                |  2 +-
> >   hw/net/vmxnet3.h                        |  4 +-
> >   include/exec/cpu-all.h                  |  4 +-
> >   include/exec/cpu-common.h               |  2 +-
> >   include/exec/memop.h                    |  2 +-
> >   include/exec/memory.h                   |  2 +-
> >   include/fpu/softfloat-types.h           |  2 +-
> >   include/hw/core/cpu.h                   |  2 +-
> >   include/hw/i386/intel_iommu.h           |  6 +--
> >   include/hw/i386/x86-iommu.h             |  4 +-
> >   include/hw/virtio/virtio-access.h       |  6 +--
> >   include/hw/virtio/virtio-gpu-bswap.h    |  2 +-
> >   include/libdecnumber/dconfig.h          |  2 +-
> >   include/net/eth.h                       |  2 +-
> >   include/qemu/bswap.h                    |  8 ++--
> >   include/qemu/compiler.h                 |  2 +
> >   include/qemu/host-utils.h               |  2 +-
> >   include/qemu/int128.h                   |  2 +-
> >   include/ui/qemu-pixman.h                |  2 +-
> >   net/util.h                              |  2 +-
> >   target/arm/cpu.h                        |  8 ++--
> >   target/arm/translate-a64.h              |  2 +-
> >   target/arm/vec_internal.h               |  2 +-
> >   target/i386/cpu.h                       |  2 +-
> >   target/mips/cpu.h                       |  2 +-
> >   target/ppc/cpu.h                        |  2 +-
> >   target/s390x/tcg/vec.h                  |  2 +-
> >   target/xtensa/cpu.h                     |  2 +-
> >   tests/fp/platform.h                     |  4 +-
> >   accel/kvm/kvm-all.c                     |  4 +-
> >   audio/dbusaudio.c                       |  2 +-
> >   disas.c                                 |  2 +-
> >   hw/core/loader.c                        |  4 +-
> >   hw/display/artist.c                     |  6 +--
> >   hw/display/pxa2xx_lcd.c                 |  2 +-
> >   hw/display/vga.c                        | 12 +++---
> >   hw/display/virtio-gpu-gl.c              |  2 +-
> >   hw/s390x/event-facility.c               |  2 +-
> >   hw/virtio/vhost.c                       |  2 +-
> >   linux-user/arm/nwfpe/double_cpdo.c      |  4 +-
> >   linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-
> >   linux-user/ppc/signal.c                 |  3 +-
> >   linux-user/syscall.c                    |  6 +--
> >   net/net.c                               |  4 +-
> >   target/alpha/translate.c                |  2 +-
> >   target/arm/crypto_helper.c              |  2 +-
> >   target/arm/helper.c                     |  2 +-
> >   target/arm/kvm64.c                      |  4 +-
> >   target/arm/neon_helper.c                |  2 +-
> >   target/arm/sve_helper.c                 |  4 +-
> >   target/arm/translate-sve.c              |  6 +--
> >   target/arm/translate-vfp.c              |  2 +-
> >   target/arm/translate.c                  |  2 +-
> >   target/hppa/translate.c                 |  2 +-
> >   target/i386/tcg/translate.c             |  2 +-
> >   target/mips/tcg/lmmi_helper.c           |  2 +-
> >   target/mips/tcg/msa_helper.c            | 54 ++++++++++++------------=
-
> >   target/ppc/arch_dump.c                  |  2 +-
> >   target/ppc/int_helper.c                 | 22 +++++-----
> >   target/ppc/kvm.c                        |  4 +-
> >   target/ppc/mem_helper.c                 |  2 +-
> >   target/riscv/vector_helper.c            |  2 +-
> >   target/s390x/tcg/translate.c            |  2 +-
> >   target/sparc/vis_helper.c               |  4 +-
> >   tcg/tcg-op.c                            |  4 +-
> >   tcg/tcg.c                               | 12 +++---
> >   tests/qtest/vhost-user-blk-test.c       |  2 +-
> >   tests/qtest/virtio-blk-test.c           |  2 +-
> >   ui/vdagent.c                            |  2 +-
> >   ui/vnc.c                                |  2 +-
> >   util/bitmap.c                           |  2 +-
> >   util/host-utils.c                       |  2 +-
> >   target/ppc/translate/vmx-impl.c.inc     |  4 +-
> >   target/ppc/translate/vsx-impl.c.inc     |  2 +-
> >   target/riscv/insn_trans/trans_rvv.c.inc |  4 +-
> >   target/s390x/tcg/translate_vx.c.inc     |  2 +-
> >   tcg/aarch64/tcg-target.c.inc            |  4 +-
> >   tcg/arm/tcg-target.c.inc                |  4 +-
> >   tcg/mips/tcg-target.c.inc               |  2 +-
> >   tcg/ppc/tcg-target.c.inc                | 10 ++---
> >   tcg/riscv/tcg-target.c.inc              |  4 +-
> >   85 files changed, 173 insertions(+), 173 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index f20712cb93d7..88df1bc42973 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1591,7 +1591,6 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.=
project_version().split('.')[2]
> >
> >   config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
> >   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device=
)
> > -config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() =3D=
=3D 'big')
>
> Can we poison HOST_WORDS_BIGENDIAN definition to force cleaning old
> patches before merging them?
>

Sure, next patch :)


