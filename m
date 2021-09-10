Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB49406B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:06:16 +0200 (CEST)
Received: from localhost ([::1]:49778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfIN-0001sR-Um
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mOf40-0002RU-R6
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:51:24 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mOf3x-0005mg-6m
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:51:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4A8487496A2;
 Fri, 10 Sep 2021 13:51:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 253387496A1; Fri, 10 Sep 2021 13:51:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 237AD74969E;
 Fri, 10 Sep 2021 13:51:16 +0200 (CEST)
Date: Fri, 10 Sep 2021 13:51:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
In-Reply-To: <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
Message-ID: <aa588212-b557-223c-cf85-4c97b7d71cfa@eik.bme.hu>
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
 <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
 <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sep 2021, Howard Spoelstra wrote:
> On Fri, Sep 10, 2021 at 7:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>> On Thu, Sep 09, 2021 at 05:06:17PM -0400, Programmingkid wrote:
>>> Hi Gerd,
>>>
>>> Howard and I were talking about USB audio problems with Mac OS guests.
>> We think the issue might be with frames being sent to the USB audio card
>> too soon. My guess is only one frame is suppose to be transmitted every 1
>> millisecond. I was also reading the todo notes in the file hw/hcd-ohci.c.
>> This is what it says:
>>>
>>>  * TODO:
>>>  *  o Isochronous transfers
>>>  *  o Allocate bandwidth in frames properly
>>>  *  o Disable timers when nothing needs to be done, or remove timer usage
>>>  *    all together.
>>>  *  o BIOS work to boot from USB storage
>>> */
>>>
>>> Do you think implementing isochronous transfers would fix the audio
>> problems Mac OS guest are experiencing?
>>
>> Most likely yes, audio devices typically use iso endpints.
>>
>> take care,
>>   Gerd
>>
>
> Hi,
>
> Below I pasted the first lines mentioning isochronous traffic from a pcap
> file when running fedora12 with the usb-audio device and the first lines
> from a pcap file running Mac OS 9.2 with the usb-audio device
>
> Fedora:
> 91 56.715001 host 0.5.1 USB 256 URB_ISOCHRONOUS out
> 92 56.715018 0.5.1 host USB 64 URB_ISOCHRONOUS out
>
> MacOS:
> 143 56.031989 host 0.16.1 USB 256 URB_ISOCHRONOUS out
> 144 56.032026 0.16.1 host USB 64 URB_ISOCHRONOUS out
>
> The usb-audio device works for the fedora guest, so would this not indicate
> that the iso endpoints are already working?
>
> The usb-audio device also work (for a limited amount of time) when running
> MacOS. Looking at USB logging in the Mac OS guest, to me it seems the MacOS
> side runs into timing issues when packages drift too far apart. It then
> finally gives up trying to keep the stream open.

I was also trying to find why the usb-audio device does not work with 
MorphOS but I could not figure it out. Now I have two machines (mac99 and 
pegasos2) that can boot MorphOS but usb-audio does not work with either so 
maybe it's not because of the USB controller. I've found there is a debug 
property that enables some logging: -device usb-audio,debug=1 but that did 
not reveal much more. It looks like MorphOS tries to query the device but 
replies come very slow (not sure if that's normal or a problem) then just 
gives up after a while. Maybe you can try comparing what Fedora and other 
OSes query as it may be we're missing some info in USB descriptors that 
other drivers than Linux's rely on but that's just a guess I haven't 
tested with Linux guest on pegasos2 or mac99 yet.

Regards,
BALATON Zoltan

