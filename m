Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9C32278D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:13:39 +0100 (CET)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETlC-00014k-4V
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETjl-0000YS-P2; Tue, 23 Feb 2021 04:12:09 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:49003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lETji-00034i-Cj; Tue, 23 Feb 2021 04:12:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6A5D57462D3;
 Tue, 23 Feb 2021 10:12:01 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 310267456B7; Tue, 23 Feb 2021 10:12:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2F5547456B4;
 Tue, 23 Feb 2021 10:12:01 +0100 (CET)
Date: Tue, 23 Feb 2021 10:12:01 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
In-Reply-To: <YDSSgrTDipRIq2Lx@yekko.fritz.box>
Message-ID: <d8d7fed-5c74-9755-fa34-10d97e9319cd@eik.bme.hu>
References: <20210209110252.110107-1-aik@ozlabs.ru>
 <YDRxdIIiX9gCLEFM@yekko.fritz.box>
 <ccdc8cae-56a6-fa36-82bb-0cd6ea2a6c75@ozlabs.ru>
 <YDSSgrTDipRIq2Lx@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021, David Gibson wrote:
> On Tue, Feb 23, 2021 at 04:01:00PM +1100, Alexey Kardashevskiy wrote:
>> On 23/02/2021 14:07, David Gibson wrote:
>>> On Tue, Feb 09, 2021 at 10:02:52PM +1100, Alexey Kardashevskiy wrote:
>>>>   #endif /* HW_SPAPR_H */
>>>
>>> VOF is pretty much inherently papr specific, so I'm not really seeing
>>> a clear rationale for the distinction between vof_*() things and
>>> spapr_vof_*() things.
>>
>> spapr_vof_ uses SpaprMachineState, vof_ does not and can be used ... I do
>> not know... for macs? freescale?
>>
>> I thought it might be useful for whatever Balaton Zoltran wanted to use it
>> for.
>
> Hmm, I hadn't thought of that sort of application.  I guess that's a
> point.
>
> I feel like the call for vof is less for those platforms, because they
> admit a full in-guest firmware implementation, whereas the paravirt
> nature of papr means that some components have to go into the
> hypervisor.

The immediate plan is to try to use vof for pegasos2 as replacement 
firmware to be able to at least boot guests without needing a 
non-distributable firmware blob (as mentioned and further explained on 
https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2). This seems to be 
a better option than reimplementing its firmware which would then be yet 
another OpenFirmware implementation in QEMU. I was waiting for vof to get 
in before trying to actually implement that to avoid to need too much 
rebasing but in theory it could work. It's true we don't have a hypervisor 
on those platforms but could have one at least while the firmware is 
running to avoid having to do everything in guest firmware. Most guests 
just query the device tree via client interface and vof should be enough 
for that. I'm not sure about RTAS but that's a small problem if this 
allows to boot guests without having to write a whole guest open firmware 
implementation.

>>> Vof is pretty unavoidably tied to spapr, so I don't think you really
>>> need an interface to abstract this.
>>
>> Balaton Zoltran asked for that, more or less :)

This was my original comment:
https://lists.nongnu.org/archive/html/qemu-ppc/2020-12/msg00063.html

One reason is to keep vof reusable but also to make it clear what are the 
changes to spapr that was previously hard to distinguish from what's part 
of vof itself.

Regards,
BALATON Zoltan

