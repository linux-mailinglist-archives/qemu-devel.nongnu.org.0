Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61953F312F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:10:06 +0200 (CEST)
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH75p-0003WW-OJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH74U-0001Sa-7i
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH74S-00041C-HU
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629475720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ru3nWdmNNlsH7QmzfiunRYA8KgyYdFwJUI0hCzgzyoE=;
 b=imDTJkB9jIHKlR8pK6hdwjC8DoQkFxHCdPSsujZDnUxNKD01SOozyarMq1M1HU+72ePffN
 K6K9Qke4RUXmSTPxDMooDP+7iyormzrRj/QOv7IAGRsP3tcPMvs7ZcpiHAVEYUsI7kPKoY
 wt14o+N0JMi8/YQnXRxO0wu307UGbjM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-v8ysfv6OMAKAn8dKZPsAJg-1; Fri, 20 Aug 2021 12:08:38 -0400
X-MC-Unique: v8ysfv6OMAKAn8dKZPsAJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 bx23-20020a0564020b5700b003bf2eb11718so4760047edb.20
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vaXIL8vFsW/ZrqTguiOB2m9rDmWNpjRWYofrsMmr1Rg=;
 b=ln4KNZFRvKljdKznhFpc1s0/G1QGK8FyslzlWsSKQ7BWjniq7yX7eB8K6mCnaBTcm2
 E+ESASNpep/aBDMRNyjkRbmqvEfOVAnWjCOlpmaYVJyR/jLT0Dyz3Mn4AIKWtBDu5qw6
 c29EBo8vWDxqCcVo+Oa7ehO9OE1JkuSlGwo1Anln9Fo5VqtqC+CzZCkmMECy7rAgc87f
 oZ8nuO5XuqXHLQqZj27ioHWJdK3c1/bbGw6e8s9l8GMzdV8+IqgjK3Mnxn/1uE5MMNP8
 FUgkPVMLObaSGoK81Z0vfFOcluJvCAk9ioq/MZJi3mSaB0RDxT/wNO8cd8wC3pYnxfHz
 o/Qw==
X-Gm-Message-State: AOAM531L+yevOZmgI1j7brpBxnfcOkAvnIka2qkIB7y84aWwL2jK79vP
 GNR/rXK+B/mXwWJbmJCpuUdntJDnz0ISH5fmqmVm2vRCNNhVAS4cw1YSetPSbsPBHQb8ERvg5TH
 qax+Q/eWz55LyFhQ=
X-Received: by 2002:a17:906:1d59:: with SMTP id
 o25mr22989297ejh.443.1629475717538; 
 Fri, 20 Aug 2021 09:08:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwugDsPcg08RmJ2WXRIx+PmCxtTWwCbhUHHRvp9WL9CD9jt5Fg+D7bxkEk79hOukyX6jeyE2Q==
X-Received: by 2002:a17:906:1d59:: with SMTP id
 o25mr22989239ejh.443.1629475716980; 
 Fri, 20 Aug 2021 09:08:36 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s24sm3785854edq.56.2021.08.20.09.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:08:36 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:08:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820180835.77fd29d3@redhat.com>
In-Reply-To: <2bcfd8a3-5049-5496-0ca8-a6323c4388e7@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <2bcfd8a3-5049-5496-0ca8-a6323c4388e7@redhat.com>
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

On Fri, 20 Aug 2021 17:53:41 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 8/20/21 5:47 PM, David Hildenbrand wrote:
> > On 20.08.21 17:44, Igor Mammedov wrote: =20
> >> On Fri, 20 Aug 2021 15:39:27 +0100
> >> Peter Maydell <peter.maydell@linaro.org> wrote:
> >> =20
> >>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com>
> >>> wrote: =20
> >>>>
> >>>> On 20.08.21 16:22, Bin Meng wrote: =20
> >>>>> Hi Philippe,
> >>>>>
> >>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> >>>>> <philmd@redhat.com> wrote: =20
> >>>>>>
> >>>>>> Hi Bin,
> >>>>>>
> >>>>>> On 8/20/21 4:04 PM, Bin Meng wrote: =20
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> The following command used to work on QEMU 4.2.0, but is now brok=
en
> >>>>>>> with QEMU head.
> >>>>>>>
> >>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -dev=
ice
> >>>>>>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Canno=
t
> >>>>>>> allocate memory =20
> >>> =20
> >>>> -m 40000000
> >>>>
> >>>> corresponds to 38 TB if I am not wrong. Is that really what you want=
? =20
> >>>
> >>> Probably not, because the zynq board's init function does:
> >>>
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 if (machine->ram_size > 2 * GiB) {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("RAM si=
ze more than 2 GiB is not supported");
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(EXIT_FAILURE);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>
> >>> It seems a bit daft that we allocate the memory before we do
> >>> the size check. This didn't use to be this way around...
> >>>
> >>> Anyway, I think the cause of this change is commit c9800965c1be6c39
> >>> from Igor. We used to silently cap the RAM size to 2GB; now we
> >>> complain. Or at least we would complain if we hadn't already
> >>> tried to allocate the memory and fallen over... =20
> >>
> >> That's because RAM (as host resource) is now separated
> >> from device model (machine limits) and is allocated as
> >> part of memory backend initialization (in this case
> >> 'create_default_memdev') before machine_run_board_init()
> >> is run.
> >>
> >> Maybe we can consolidate max limit checks in
> >> create_default_memdev() by adding MachineClass::max_ram_size
> >> but that can work only in default usecase (only '-m' is used). =20
> >=20
> > We do have a workaround for s390x already: mc->fixup_ram_size
> >=20
> > That should be called before the memory backend is created and seems to
> > do just what we want, no? =20
>=20
> Or maybe more explicit adding a MachineClass::check_ram_size() handler?

On the first glance, just max_size field should be sufficient
with checking code being generic, which should remove code duplication
such checks introduce across tree. Is there a specific board for
which call back is 'must to have'?


