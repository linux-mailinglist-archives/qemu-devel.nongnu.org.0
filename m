Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE6699716
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:21:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf86-0003UF-SM; Thu, 16 Feb 2023 09:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSf7e-0003DC-Jr; Thu, 16 Feb 2023 09:20:30 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pSf7c-0003LB-Nf; Thu, 16 Feb 2023 09:20:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A5DEF74633D;
 Thu, 16 Feb 2023 15:17:52 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E85D8746324; Thu, 16 Feb 2023 15:17:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E6345745712;
 Thu, 16 Feb 2023 15:17:51 +0100 (CET)
Date: Thu, 16 Feb 2023 15:17:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org, 
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Li Qiang <liq3ea@163.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, 
 xiaoqiang zhao <zxq_yx_007@163.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 01/14] hw/char/serial-pci: Replace
 DO_UPCAST(PCISerialState) by PCI_SERIAL()
In-Reply-To: <892b6b09-6adc-c935-ab3d-d55965792d5f@linaro.org>
Message-ID: <c39404f9-40ac-0595-45b7-f49bd251ca4e@eik.bme.hu>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-2-philmd@linaro.org>
 <f987749e-d7d8-7812-b118-2eb449ff09f6@redhat.com>
 <892b6b09-6adc-c935-ab3d-d55965792d5f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-678830211-1676557071=:10520"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-678830211-1676557071=:10520
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 16 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 16/2/23 12:20, Thomas Huth wrote:
>> On 13/02/2023 19.43, Philippe Mathieu-Daudé wrote:
>>> Use the PCI_SERIAL() QOM type-checking macro to avoid DO_UPCAST().
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/char/serial-pci.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
>>> index 801b769aba..9689645cac 100644
>>> --- a/hw/char/serial-pci.c
>>> +++ b/hw/char/serial-pci.c
>>> @@ -36,7 +36,10 @@
>>>   #include "qom/object.h"
>>>   struct PCISerialState {
>>> +    /*< private >*/
>>>       PCIDevice dev;
>>> +    /*< public >*/
>>> +
>> 
>> I'm not sure about this part of the patch. It does not seem to be related 
>> to the other changes at all, and are you sure about which parts are really 
>> "public" and which parts are "private"? If so, I'd like to see a 
>> description about this in the commit message, preferably in a separate 
>> patch. Also, why an empty line after the "public" comment?
>
> This is how QOM style separates the object 'private' part -- the
> inherited parent, used by the QOM-cast macros -- and the fields
> specific to this object.
> The private field *must* be the first one in the structure for the
> cast macros to work.
>
> Maybe this isn't a convention and we could make one, to unify the
> API style. I'm open to better suggestion :)
>
> I suppose I got custom to see it to distinct the QOM hierarchy and
> now it helps me to detect what is QOM and what isn't.
> Anyway I'll remove from this patch.

I also dislike these comments and empty lines in these struct definitions. 
I think it should be enough to document this QOM convention in the docs 
saying that each QOM object state has to have it's parent's state as first 
member and you're not supposed to access it directly (except maybe from 
very closely related sub class) but do a QOM cast instead. If this is 
clearly stated in the docs then there's no need to add comments about this 
in every object. You could tell QOM objects from other structs by the 
first member also being a QOM object and usually called parent or similar 
but sometimes just dev. If you really want to get fancy maybe you could 
hide it in a macro, something like:

OBJECT_STATE(PCISerialState, PCIDevice)
...
END_OBJECT_STATE

but I'm not sure I like that because it has to hide the braces in the 
macro so it's not clear it's just a struct. So just describing it in the 
docs if it's not already is probably enough.

Regards,
BALATON Zoltan
--3866299591-678830211-1676557071=:10520--

