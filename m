Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2D3F3114
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:07:12 +0200 (CEST)
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH731-0006vO-3O
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6zT-0001s6-9Z
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH6zR-00088l-Ck
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHe66gXNq+ap9l8IJOAoHstXF/Hcfk422KpynzkNAx8=;
 b=D3FFodJXgkQ2XTuxxqF02BnUCeOxnN71RynHM7WIy5g5q/CuWAjorX4JuS604qLY32OPk0
 ZmRDS2OytsUj4A8aRP3FqHZyL5NVXitEoi5s9ARJ4355elxhWi8t+mAssNCnHyc2cBs9eY
 7NAAYgmGYWd/VoFlSQ17y99YFQFlW5s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-eAwCcC2tMdSWhshjv1dD5g-1; Fri, 20 Aug 2021 12:03:26 -0400
X-MC-Unique: eAwCcC2tMdSWhshjv1dD5g-1
Received: by mail-ed1-f70.google.com with SMTP id
 eg56-20020a05640228b8b02903be79801f9aso4737244edb.21
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rv/NoGLl01sXJCJTv2lBx8ZMh6/K4n2hKUQtbvN/xss=;
 b=JVpW8YcEag+OfXkHStEX1OFli6VfUloVcsy83zzbvJdcbAejLUzK6hzrdvRAK02U3G
 bGhvvyOLx+tlV28U/kjZg1gjGPsW+w15vpmVpXVaqRZRXJhidw7Q+HXMNFhRdk4/8yzJ
 n+9hsSXsIaQ+GGg+AMBaD4z1ERV0jV2M28A8ldb4cXYPw1U63dTbfOE3YAkL8BCnJ8sj
 3B+Jzgv2YGZQsfx2Am5ZM9OmZXTTvBl6x88bOoJSbxAkVvGJR1/dAsjEXHneL/VuBGDL
 qOCYFhKdj+z4303Tj8Tu5Twg4fmJW9fWP8Qy+qqqc2rtJw+5l1ko3lctsRXl5aIVEsjM
 Mjcg==
X-Gm-Message-State: AOAM5325hysGYLHRNvmgOxIGbxK3jHLy6eeBb7pjNfFo3rFTK0MFIfnh
 iTVsew03ia4OyEncrhRQ7THta4yqxgkI0r6ZrJrS6dVLNEdBdbo4jTTejujJcJaeyU1zy0mZX36
 IzNKDylKC80NY/24=
X-Received: by 2002:aa7:d787:: with SMTP id s7mr23256404edq.336.1629475405307; 
 Fri, 20 Aug 2021 09:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+35EFI+cgBR2dUS3EsNJMgkMRGwOKo5WFfiuBYgrsTzMYnG7juG6sIozNUygAEer87RDjkA==
X-Received: by 2002:aa7:d787:: with SMTP id s7mr23256358edq.336.1629475404951; 
 Fri, 20 Aug 2021 09:03:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b10sm3787780edd.33.2021.08.20.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:03:24 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:03:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820180323.7df8751d@redhat.com>
In-Reply-To: <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "Richard W.M.
 Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 17:47:01 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 20.08.21 17:44, Igor Mammedov wrote:
> > On Fri, 20 Aug 2021 15:39:27 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  =20
> >> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wro=
te: =20
> >>>
> >>> On 20.08.21 16:22, Bin Meng wrote: =20
> >>>> Hi Philippe,
> >>>>
> >>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> >>>> <philmd@redhat.com> wrote: =20
> >>>>>
> >>>>> Hi Bin,
> >>>>>
> >>>>> On 8/20/21 4:04 PM, Bin Meng wrote: =20
> >>>>>> Hi,
> >>>>>>
> >>>>>> The following command used to work on QEMU 4.2.0, but is now broke=
n
> >>>>>> with QEMU head.
> >>>>>>
> >>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -devi=
ce
> >>>>>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> >>>>>> allocate memory =20
> >> =20
> >>> -m 40000000
> >>>
> >>> corresponds to 38 TB if I am not wrong. Is that really what you want?=
 =20
> >>
> >> Probably not, because the zynq board's init function does:
> >>
> >>      if (machine->ram_size > 2 * GiB) {
> >>          error_report("RAM size more than 2 GiB is not supported");
> >>          exit(EXIT_FAILURE);
> >>      }
> >>
> >> It seems a bit daft that we allocate the memory before we do
> >> the size check. This didn't use to be this way around...
> >>
> >> Anyway, I think the cause of this change is commit c9800965c1be6c39
> >> from Igor. We used to silently cap the RAM size to 2GB; now we
> >> complain. Or at least we would complain if we hadn't already
> >> tried to allocate the memory and fallen over... =20
> >=20
> > That's because RAM (as host resource) is now separated
> > from device model (machine limits) and is allocated as
> > part of memory backend initialization (in this case
> > 'create_default_memdev') before machine_run_board_init()
> > is run.
> >=20
> > Maybe we can consolidate max limit checks in
> > create_default_memdev() by adding MachineClass::max_ram_size
> > but that can work only in default usecase (only '-m' is used). =20
>=20
> We do have a workaround for s390x already: mc->fixup_ram_size
>=20
> That should be called before the memory backend is created and seems to=
=20
> do just what we want, no?

it's there for compat sake only if I recall correctly,
there should be no fixups ever.
If user asks for nonsence, QEMU should error out and force
user to correct CLI (fixups were one of items that were in
the way of splitting guest RAM into backend/frontend model)

=20


