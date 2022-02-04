Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9154A9D1F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:46:23 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1j4-0005Cc-Eo
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:46:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nG1fd-0003dN-Cy; Fri, 04 Feb 2022 11:42:52 -0500
Received: from [2001:738:2001:2001::2001] (port=48522 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nG1fY-00010i-T0; Fri, 04 Feb 2022 11:42:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2143D746324;
 Fri,  4 Feb 2022 17:42:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 011257457E7; Fri,  4 Feb 2022 17:42:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F3BC0745708;
 Fri,  4 Feb 2022 17:42:29 +0100 (CET)
Date: Fri, 4 Feb 2022 17:42:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 03/10] target/ppc: Simplify powerpc_excp_7xx
In-Reply-To: <87o83m8ve9.fsf@linux.ibm.com>
Message-ID: <33ad21b4-8b80-151e-eb43-2d497d5fe66@eik.bme.hu>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
 <20220203224246.1446652-4-farosas@linux.ibm.com>
 <b39f22a-d58f-1faa-3777-66ccbbc7b9dd@eik.bme.hu>
 <87o83m8ve9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022, Fabiano Rosas wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>> On Thu, 3 Feb 2022, Fabiano Rosas wrote:
>>> Differences from the generic powerpc_excp code:
>>>
>>> - Not BookE, so some MSR bits are cleared at interrupt dispatch;
>>> - No MSR_HV;
>>> - No power saving states;
>>> - No Hypervisor Emulation Assistance;
>>
>> The pegasos2 can run with -cpu G3 as the real hardware had a processor
>> card either with a G3 or a G4 so this will break VOF with that. I'm not
>> sure if it's worth keeping support for this though as long as the default
>> G4 works because most people would want to use a G4 anyway and those who
>> want a G3 for some reason could still use a firmware rom image instead but
>
> I'll bring 'sc 1' back then. I shouldn't mix the refactoring with
> dropping support of things.
>
> If you think we can drop support for the pegasos2 on the G3 let me know
> and I'll send a follow up patch. Or you can send one yourself if you'd
> like.

I think the G3 is probably rarely used on pegasos2, G4 being the default 
and preferred CPU so maybe only needed if somebody wants to test something 
specifically with G3. That's why I said this is not critical, because 
using a firmware rom image would still boot with -cpu G3 if sc 1 is 
removed for G3 and older. We've made sure it still works with G4 so that's 
fine. However leaving this around for now to keep previous behaviour until 
VOF is changed to support a different hypercall method is nice to have if 
it's not much trouble for you so I'm OK with any decision on this.

Regards,
BALATON Zoltan

>> I wonder if there's another better place where sc 1 could be handled so it
>> could work for these cpus without needing to change these excp helpers.
>
> I spoke to Alexey and the way forward here is to have a MMIO address for
> VOF to use and remove the sc 1 usage altogether. At least for the CPUs
> that wouldn't support it otherwise. I created a GitLab issue to track
> that: https://gitlab.com/qemu-project/qemu/-/issues/859


