Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D374F79BA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:31:22 +0200 (CEST)
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNXz-0002oV-B6
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncNS5-0007re-IS
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:25:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncNS3-00033I-Ls
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:25:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id j12so6690127wrb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 01:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7CPpi31xbD96eiWrdqre0Vls01EA+2iq0FB3FOnzNKA=;
 b=c7gKC5Z0BlMlE4TVgk7RbzZ3RUnmh+wPzL4zir7ihnG3lnm2DqwjLhXQ352ts+fPbs
 sP7p4hyRny9TPw6EW1paMM1WqnyHFJHBR95iEhqqAWml4qcT3MQGVmq16a+Cs5GcUMM8
 zbc9hPbK/8snqHB+xSoksIbTkxIkXoxBch6pRDro+sT/lS6z7oVkw1TcGg+AW3LSUq/f
 jzHEAbh+1jDqNPj4P1xUUYbft7pO9YVTAOPHmNv5zOrhQbmfV1/EXfARgAdoQXM8slAB
 w4B9oplWiDuJ9T7j/0teyDzuFC1iqhOBRTAZO+NRIFuTo5o/0PMk/SpUA6psV8CJ1E71
 +XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7CPpi31xbD96eiWrdqre0Vls01EA+2iq0FB3FOnzNKA=;
 b=Sawg2lwl/fhDp6BhI4pMBXFnCTPzikzCICCuUXzry5ogVP90C2e3Jhhw+B0435qics
 d41D5FRl3R4TuR1M+1JPhQ+cME4h0muk23qwuUFN0Urtr3VpCq7IxPQwBDmyulMVuB3w
 hxvxPFG3CbRau0SIwX3PXhmqytyEpZTKkPGTpdQ2DPB6cxwc5WNhrINlkffdS3jQGjd+
 BaUDoiW7w/Ea7oZBZzcvyerWpK7cltNJX0ko7/OXqjRpO4w7r00ekOhrLO4QGFW3B1rc
 Rk8SffgeCibZnJnCQtQVFek9qQLnCDb2M4iUCnUPAa6m0D4IQevW61nYwST/ph9K93FW
 wQDA==
X-Gm-Message-State: AOAM532Y6I2HApJOofbirRIAimq8UogBKZ2mxuXYv5qrMaJc1Mgs5VbY
 NDNcyRBJJ9eqc2MAHcgS7lvzEA==
X-Google-Smtp-Source: ABdhPJwsYH3BWo7uQz+zgIgZw8RXvuguSRBZ8k/Bb572/4PC1uW1dbjqVjgi94X3WWJpTBK+4mduKg==
X-Received: by 2002:a5d:6d04:0:b0:204:12b6:9eb with SMTP id
 e4-20020a5d6d04000000b0020412b609ebmr9963317wrq.44.1649319909925; 
 Thu, 07 Apr 2022 01:25:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p29-20020a1c545d000000b0038e70d5217dsm9541870wmi.45.2022.04.07.01.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:25:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CAF051FFB7;
 Thu,  7 Apr 2022 09:25:07 +0100 (BST)
References: <20220406173356.1891500-1-alex.bennee@linaro.org>
 <CAFEAcA-iFROkDQ=myCjbBxo5jJKqwCjQb_3tbANYdeNk=YizLw@mail.gmail.com>
 <87wng2ht6c.fsf@linaro.org>
 <CAFEAcA_ecAbd1EucBG=Hy82E7VLcaYkt=_2k5VK=ZpmY-6_O3g@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] tests/qtest: properly initialise the vring used idx
Date: Thu, 07 Apr 2022 09:24:20 +0100
In-reply-to: <CAFEAcA_ecAbd1EucBG=Hy82E7VLcaYkt=_2k5VK=ZpmY-6_O3g@mail.gmail.com>
Message-ID: <87sfqpi9lo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 6 Apr 2022 at 21:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > Guest memory is generally zero at startup. Do we manage to
>> > hit the bit of memory at the start of the virt machine's RAM
>> > where we store the DTB ? (As you say, initializing the data
>> > structures is the right thing anyway.)
>>
>> I don't know - where is the DTB loaded?
>
> Start of RAM (that's physaddr 0x4000_0000). The thing I'm not sure
> about is whether these qtests go through the code in hw/arm/boot.c
> that loads the DTB into guest RAM or not.

Yes because it's linked to the machine creation:

Thread 1 hit Breakpoint 1, arm_load_dtb (addr=3D1073741824, binfo=3Dbinfo@e=
ntry=3D0x55bc4ce26970, addr_limit=3D0, as=3Das@entry=3D0x55bc4d119c50, ms=
=3Dms@entry=3D0x55bc4ce26800) at ../../hw/arm/boot.c:534
534     {
(rr) bt
#0  arm_load_dtb (addr=3D1073741824, binfo=3Dbinfo@entry=3D0x55bc4ce26970, =
addr_limit=3D0, as=3Das@entry=3D0x55bc4d119c50, ms=3Dms@entry=3D0x55bc4ce26=
800) at ../../hw/arm/boot.c:534
#1  0x000055bc4a9f7ded in virt_machine_done (notifier=3D0x55bc4ce26910, dat=
a=3D<optimized out>) at ../../hw/arm/virt.c:1637
#2  0x000055bc4aebc807 in notifier_list_notify (list=3Dlist@entry=3D0x55bc4=
b5f8b20 <machine_init_done_notifiers>, data=3Ddata@entry=3D0x0) at ../../ut=
il/notify.c:39
#3  0x000055bc4a7f82db in qdev_machine_creation_done () at ../../hw/core/ma=
chine.c:1235
#4  0x000055bc4a744b19 in qemu_machine_creation_done () at ../../softmmu/vl=
.c:2725
#5  qmp_x_exit_preconfig (errp=3D<optimized out>) at ../../softmmu/vl.c:2748
#6  0x000055bc4a748a14 in qmp_x_exit_preconfig (errp=3D<optimized out>) at =
../../softmmu/vl.c:2741
#7  qemu_init (argc=3D<optimized out>, argv=3D<optimized out>, envp=3D<opti=
mized out>) at ../../softmmu/vl.c:3776
#8  0x000055bc4a6de639 in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>, envp=3D<optimized out>) at ../../softmmu/main.c:49

(ION: yay, I can capture qtest runs in rr now ;-)

>
>> Currently we are using the first
>> couple of pages in qtest because that where the qtest allocater is
>> initialised:
>>
>>   static void *qos_create_machine_arm_virt(QTestState *qts)
>>   {
>>       QVirtMachine *machine =3D g_new0(QVirtMachine, 1);
>>
>>       alloc_init(&machine->alloc, 0,
>>                  ARM_VIRT_RAM_ADDR,
>>                  ARM_VIRT_RAM_ADDR + ARM_VIRT_RAM_SIZE,
>>                  ARM_PAGE_SIZE);
>>       qvirtio_mmio_init_device(&machine->virtio_mmio, qts, VIRTIO_MMIO_B=
ASE_ADDR,
>>                                VIRTIO_MMIO_SIZE);
>>
>>       qos_create_generic_pcihost(&machine->bridge, qts, &machine->alloc);
>>
>>       machine->obj.get_device =3D virt_get_device;
>>       machine->obj.get_driver =3D virt_get_driver;
>>       machine->obj.destructor =3D virt_destructor;
>>       return machine;
>>   }
>>
>> I don't know if there is a more sane piece of memory we should be using.
>
> The first part of RAM is fine, it's just you can't assume it's
> all zeroes :-)
>
> -- PMM


--=20
Alex Benn=C3=A9e

