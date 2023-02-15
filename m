Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903B6981A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLGr-0005d6-W7; Wed, 15 Feb 2023 12:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSLGp-0005cr-P1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:08:39 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSLGn-0004H2-Gi
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:08:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 85205746346;
 Wed, 15 Feb 2023 18:05:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 47D2A74633D; Wed, 15 Feb 2023 18:05:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 44F91746324;
 Wed, 15 Feb 2023 18:05:58 +0100 (CET)
Date: Wed, 15 Feb 2023 18:05:58 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <lvivier@redhat.com>
cc: Qiang Liu <cyruscyliu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Bandan Das <bsd@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 13/25] hcd-ohci: Fix inconsistency when resetting ohci
 root hubs
In-Reply-To: <12623898-7b7d-eb78-968a-13168dac3045@redhat.com>
Message-ID: <1c7b37fd-8ad3-addd-49ba-87762bcf2339@eik.bme.hu>
References: <20220926095509.3759409-1-kraxel@redhat.com>
 <20220926095509.3759409-14-kraxel@redhat.com>
 <CAJSP0QVoLf_v2xP6GwDzbFg_RDnP5ppM3UZwTN3XAWPcv6cFCQ@mail.gmail.com>
 <CAAKa2j=2cdYxBFZO1pTJLFcPVb-6R4gnB9zad3rdptfuuo0ixw@mail.gmail.com>
 <CAAKa2jmkjPuTouvk3qRvuFiS7RtTSQ8vC=m_eDYLyV7tUxAkiA@mail.gmail.com>
 <CAJSP0QV=UrYyASRddqTX7KbSw_dLPhVgbdORvYx_N+tQa6Nu+A@mail.gmail.com>
 <12623898-7b7d-eb78-968a-13168dac3045@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Wed, 15 Feb 2023, Laurent Vivier wrote:
> On 2/15/23 15:34, Stefan Hajnoczi wrote:
>> On Wed, 15 Feb 2023 at 08:45, Qiang Liu <cyruscyliu@gmail.com> wrote:
>>> 
>>> Hi,
>>>>> 
>>>>> This commit breaks boot-serial-test on ppc64-softmmu.
>>>>>
>>>>>    $ ./configure --enable-tcg-interpreter
>>>>> '--target-list=aarch64-softmmu alpha-softmmu arm-softmmu hppa-softmmu
>>>>> m68k-softmmu microblaze-softmmu ppc64-softmmu s390x-softmmu
>>>>> x86_64-softmmu'
>>>>>    $ make && cd build && QTEST_QEMU_BINARY=./qemu-system-ppc64
>>>>> ./tests/qtest/boot-serial-test; cd -
>>>>> 
>>>>> (Yes, the full --target-list is needed because boot-serial-test isn't
>>>>> built when only ppc64-softmmu is selected.)
>>>>> 
>>>>> Here is the CI failure:
>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3087540972#L22
>>>
>>>   I reproduced this failure and got "Out of malloc memory" error message 
>>> in the 
>>> [openbios-ppc](https://github.com/openbios/openbios/blob/4a0041107b8ef77e0e8337bfcb5f8078887261a7/libopenbios/ofmem_common.c#L134). 
>>> However, I'm not sure how to debug this. Have you run into this issue 
>>> before?
>> 
>> I don't. Maybe Gerd has an idea?
>> 
>> The memory allocation may be because there is either a request leak or
>> additional USB activity as a result of this patch.
>
> It looks like a bug in openbios ohci, perhaps Zoltan can help?

Unfortunately I don't quite understand neither what this thread is about 
nor that openbios driver. Even though I've added that to openbios, all I 
did was porting the driver from coreboot's libpayload as noted in the 
copyright message of that file. So if you suspect it's a bug there you 
could try checking newer versions in libpayload and see if they've fixed 
anything that could help. On the other hand the OHCI emulation in QEMU is 
known to be incomplete and likely to have some bugs with guests that work 
on real hardware (e.g. MacOS <= 10.1) so it's more likely that QEMU 
behaves differently than it should assuming that the coreboot driver works 
on real hardware but I'm not sure about that either.

Regards,
BALATON Zoltan

