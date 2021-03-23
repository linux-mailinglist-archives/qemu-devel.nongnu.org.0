Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA779346CEE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:28:05 +0100 (CET)
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpVM-0008CT-Rx
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOp3O-0002iq-5H; Tue, 23 Mar 2021 17:59:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46160
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOp3L-0003wh-Ga; Tue, 23 Mar 2021 17:59:09 -0400
Received: from host86-143-93-99.range86-143.btcentralplus.com ([86.143.93.99]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOp37-0002xm-9P; Tue, 23 Mar 2021 21:58:59 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <8cf90aad5a9fce1a20cbf49e4ef71c51ba04faed.1615345138.git.balaton@eik.bme.hu>
 <a112d264-7540-9e4b-bc10-fe8e4518d828@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ef7a0bc6-3150-2f16-492f-5138fcee0b52@ilande.co.uk>
Date: Tue, 23 Mar 2021 21:58:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a112d264-7540-9e4b-bc10-fe8e4518d828@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.143.93.99
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 1/8] vt82c686: Implement control of serial port io
 ranges via config regs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 12:54, BALATON Zoltan wrote:

> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>> In VIA super south bridge the io ranges of superio components
>> (parallel and serial ports and FDC) can be controlled by superio
>> config registers to set their base address and enable/disable them.
>> This is not easy to implement in QEMU because ISA emulation is only
>> designed to set io base address once on creating the device and io
>> ranges are registered at creation and cannot easily be disabled or
>> moved later.
>>
>> In this patch we hack around that but only for serial ports because
>> those have a single io range at port base that's relatively easy to
>> handle and it's what guests actually use and set address different
>> than the default.
>>
>> We do not attempt to handle controlling the parallel and FDC regions
>> because those have multiple io ranges so handling them would be messy
>> and guests either don't change their deafult or don't care. We could
>> even get away with disabling and not emulating them, but since they
>> are already there, this patch leaves them mapped at their default
>> address just in case this could be useful for a guest in the future.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Could this patch be reviewed now please? I've dropped it from later versions to avoid 
> this holding back the series but now that it won't be in 6.0 I'd like to go back to 
> this. This is implementing the behaviour of the real hardware better than the 
> unsettable default value we have as a replacement. That approach also works for the 
> guests I've tried (MorphOS and Linux) but if we can do better than why not do it?

Do bear in mind that several people have already looked at this patch and haven't 
felt comfortable enough to review it, and I've also said in a previous email that 
this isn't the right approach. Given that the ISA bus partly uses the ioport address 
to reference the device, manually moving the memory regions around for devices on the 
bus without the ISA bus seeing those changes is going to cause issues.

IIRC the ability to dynamically change the standard ISA addresses was present in 
several motherboards from that era, and given that this functionality hasn't been 
implemented in QEMU this already tells us that no firmware is currently is using it.

I don't understand why using the hard-coded addresses in the v10 is a problem here? 
The addresses you added in the comments representing the programmed values are the 
standard ISA device addresses, so if those are what the firmware is programming then 
there will be no change. You also reported that it works fine with both your MorphOS 
and Linux test images, indicating that neither of these guest OSs require the feature.

If you find a guest OS that needs the functionality then certainly we can talk about 
trying to come up with a solution, but for me the extra complexity of this approach 
and the fact that you're overriding the management of the device by the ISA bus is 
why I haven't given it a R-B tag (I should add that my R-B for v10 using the 
hard-coded ISA addresses still stands).


ATB,

Mark.

