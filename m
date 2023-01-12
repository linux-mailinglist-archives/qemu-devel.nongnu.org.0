Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B346687FF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 00:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG7OO-0000zI-Qm; Thu, 12 Jan 2023 18:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pG7OC-0000z0-JW; Thu, 12 Jan 2023 18:53:44 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pG7OA-0003QT-CQ; Thu, 12 Jan 2023 18:53:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F0ADC745720;
 Fri, 13 Jan 2023 00:51:15 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id AB462745712; Fri, 13 Jan 2023 00:51:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A98377456E3;
 Fri, 13 Jan 2023 00:51:15 +0100 (CET)
Date: Fri, 13 Jan 2023 00:51:15 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
Message-ID: <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
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

On Thu, 12 Jan 2023, Howard Spoelstra wrote:
> On Wed, Jan 11, 2023 at 1:15 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
>> On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
>>> On 04/01/2023 21:59, BALATON Zoltan wrote:
>>>
>>>> Setting emulated machine type with a property called "via" is
>>>> confusing users so deprecate the "via" option in favour of newly added
>>>> explicit machine types. The default via=cuda option is not a valid
>>>> config (no real Mac has this combination of hardware) so no machine
>>>> type could be defined for that therefore it is kept for backwards
>>>> compatibility with older QEMU versions for now but other options
>>>> resembling real machines are deprecated.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>
>>> I believe that people do use -M mac99,via=cuda to run some rare versions
>> of
>>> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we
>> would
>>> want to keep this option somewhere.
>>
>> The idea is that after previous patches we now have machine types for all
>> other via option values (that also match real Mac machines) other than
>> via=cude but that is the default for mac99 so after the reprecation period
>> when the via option is removed mac99 (which is the same as mac99,via=cuda)
>> can remain for this use case (and for backward compatibility) until the
>> other machines are fixed to not need this any more. So all via options are
>> still available but as different machine types.
>>
> My 2 cents about naming:
> It seems less important how the machines are named when their name is not
> covering their definition. F.i. the powermac3,1 never had adb, could not be
> equipped with a G3 cpu, did not run at 900Mhz. The closest possible
> qemu-options based definition of a powermac3,1 (via=pmu) will not run Mac
> OS 9.0.4 ;-) due to the 2 USB devices problem. To run that via=cuda is
> already needed.

What does that mean? Should we aim to emulate real Macs or are we happy 
with the Franken-Mac we have now? The names also show what we intend to 
emulate even though the emulation may not be complete or have bugs (this 
is also true for other machines in QEMU where a lot of them are not fully 
emulated, only well enough to boot guest OSes).

Looks like everybody has forgotten the previous discussion and not read 
the docs and deprecation patches where this is explained so I summarise 
the proposed change here again:

- qemu-system-ppc -M mac99 is unchanged and works like before it just 
warns for the via option and when using it in qemu-system-ppc64 suggesting 
using new machines instead so these could evetually be removed next year. 
mac99,via=cuda is just mac99 so you can continue to use that, mac99 is 
not deprecated and don't want to remove it.

- qemu-system-ppc64 -M mac99 -> powermac7_3

- qemu-system-ppc -M mac99,via=pmu -> powermac3,1

- qemu-system-ppc64 -M mac99,via=pmu-adb -> powerbook3_2

The last one is one of the rare Macs that had adb and pmu, all others with 
pmu usually have USB. The PowerMac1,2 (G4 PCI) had CUDA but not with mac99 
hardware but more similar to g3beige and no ADB ports according to 
https://en.wikipedia.org/wiki/Power_Mac_G4#1st_generation:_Graphite
https://en.wikipedia.org/wiki/Power_Macintosh_G3_(Blue_and_White)#Hardware

The PowerMac7,3 seems to be matching the PCI device listing in the comment 
at the beginning of mac_newworld.c and also this article:
https://www.informit.com/articles/article.aspx?p=606582

What is the 2 USB devices problem? Is it the one we've debugged before and 
found that it's noted in a comment marked with ??? in hw/usb/hcd-ohci.c? 
That could be fixed if there was somebody interested enough to provide a 
patch.

But this series does not remove the mac99 and does not even deprecate it. 
What it deprecates are the via option to select different machine types 
and the automatic detection of ppc64 to emulate something different which 
are hard to understand for users and caused several misunderstandings. 
It's much more clear to have a separate machine type for each machine we 
emulate even when they aren't yet complete but at least we know which way 
to go and can compare to real hardware and fix the missing parts later. 
Also introducing powermac7_3 to split the ppc64 mac99 would allow to 
remove qemu-system-ppc if we wanted and only have one executable for all 
machines but even without this it's clearer to have separate machnies for 
G5 and G4 macs than mac99 silently behaving differently.

Regards,
BALATON Zoltan

