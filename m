Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277B3F318D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:37:58 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7Wm-0004Wh-SQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7VR-0003e6-E5
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7VO-0000Sp-1J
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629477388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J78D7pMyvIUO1fgbUerS7BMjB+amW0yHqlhEJDOb2SY=;
 b=I6qcZHtJmc0gumk4U4E9qdp/pX/cZAVRWm3/wrG7O+YivejlRBQZaHWoqKX/vPTYoIr6zX
 c4hV8KVgJ5O3x4heuVl6aMS7GahtpiHkafChaI8pC8LQVt1dhz9aba73Yq/rV2XbzCVf+V
 +8tqBYfv6Jijtp5eRo1fOyxnR1bcJLo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-eoaYJTAAP1GSBjko3KOI9Q-1; Fri, 20 Aug 2021 12:36:26 -0400
X-MC-Unique: eoaYJTAAP1GSBjko3KOI9Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so3921890ejt.14
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J78D7pMyvIUO1fgbUerS7BMjB+amW0yHqlhEJDOb2SY=;
 b=tBN1l7AL3ZZq7UrubXAIhEPi33rzgekQ8GH8e0kT4A2SFrTPEc/EGzDoM9DOcodxT3
 6CX+y6L+HQ9GqTPGReBMFtqlYo2lUOguPnlTlnHfObT/lpBWm6XNu8if2Qx8eT5MsCUP
 XZ/nMRRG+jMb6FfIC+hopUTF8JQBZCxYfnNsXr6ZibmhV+X/e4cJByMx8U5ugaT/eS3i
 00DPHOitgmMqyyRiFUfY3IOlpfUf6gTJr8iFPTXH5xY70ygUwayPGag1Nn3R4QM3nwh4
 PyC9OlT4ChPd7KFYE50EjSq75ZpySwJtIbJq/8kDLL5IBPiOkOcRVBsjW33sgk/z/k1M
 uwUw==
X-Gm-Message-State: AOAM533S6XNkuvlpo0abCn134IyUsv5mLphm3pAegKNAW8AMinspsco0
 IbRrFFvQ2Suy2cze4JXSCr2J12kByO7RbIcnj1x9lnH6Z6JM8Mf+NaQ7ShmgfKugdaR6LglCFRo
 X5Pt3HEft10PC4Wo=
X-Received: by 2002:a05:6402:1747:: with SMTP id
 v7mr24167749edx.19.1629477385595; 
 Fri, 20 Aug 2021 09:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDPSnfiaBbL6fpA5CMYAeaA9sHnyJYhYZ7y92r2RYdV9sT7uE7wunLilEXMqRoOSypD4AMbA==
X-Received: by 2002:a05:6402:1747:: with SMTP id
 v7mr24167725edx.19.1629477385361; 
 Fri, 20 Aug 2021 09:36:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h5sm3873530edz.0.2021.08.20.09.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:36:24 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:36:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820183623.32e02362@redhat.com>
In-Reply-To: <3bbd662f-cc25-0a16-6ba0-444635755234@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <20210820180323.7df8751d@redhat.com>
 <3bbd662f-cc25-0a16-6ba0-444635755234@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, "Richard W.M.
 Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 18:06:30 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 8/20/21 6:03 PM, Igor Mammedov wrote:
> > On Fri, 20 Aug 2021 17:47:01 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >  =20
> >> On 20.08.21 17:44, Igor Mammedov wrote: =20
> >>> On Fri, 20 Aug 2021 15:39:27 +0100
> >>> Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>    =20
> >>>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> w=
rote:   =20
> >>>>>
> >>>>> On 20.08.21 16:22, Bin Meng wrote:   =20
> >>>>>> Hi Philippe,
> >>>>>>
> >>>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> >>>>>> <philmd@redhat.com> wrote:   =20
> >>>>>>>
> >>>>>>> Hi Bin,
> >>>>>>>
> >>>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:   =20
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following command used to work on QEMU 4.2.0, but is now bro=
ken
> >>>>>>>> with QEMU head.
> >>>>>>>>
> >>>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -de=
vice
> >>>>>>>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cann=
ot
> >>>>>>>> allocate memory   =20
> >>>>   =20
> >>>>> -m 40000000
> >>>>>
> >>>>> corresponds to 38 TB if I am not wrong. Is that really what you wan=
t?   =20
> >>>>
> >>>> Probably not, because the zynq board's init function does:
> >>>>
> >>>>      if (machine->ram_size > 2 * GiB) {
> >>>>          error_report("RAM size more than 2 GiB is not supported");
> >>>>          exit(EXIT_FAILURE);
> >>>>      }
> >>>>
> >>>> It seems a bit daft that we allocate the memory before we do
> >>>> the size check. This didn't use to be this way around...
> >>>>
> >>>> Anyway, I think the cause of this change is commit c9800965c1be6c39
> >>>> from Igor. We used to silently cap the RAM size to 2GB; now we
> >>>> complain. Or at least we would complain if we hadn't already
> >>>> tried to allocate the memory and fallen over...   =20
> >>>
> >>> That's because RAM (as host resource) is now separated
> >>> from device model (machine limits) and is allocated as
> >>> part of memory backend initialization (in this case
> >>> 'create_default_memdev') before machine_run_board_init()
> >>> is run.
> >>>
> >>> Maybe we can consolidate max limit checks in
> >>> create_default_memdev() by adding MachineClass::max_ram_size
> >>> but that can work only in default usecase (only '-m' is used).   =20
> >>
> >> We do have a workaround for s390x already: mc->fixup_ram_size
> >>
> >> That should be called before the memory backend is created and seems t=
o=20
> >> do just what we want, no? =20
> >=20
> > it's there for compat sake only if I recall correctly,
> > there should be no fixups ever.
> > If user asks for nonsence, QEMU should error out and force
> > user to correct CLI =20
>=20
> Agreed, but this would be cheaper to run the checks *before*
> allocating the resources ;)
Agreed,
Only it will work for default usecase only as I described above.

>=20
> > (fixups were one of items that were in
> > the way of splitting guest RAM into backend/frontend model)
> >  =20
>=20


