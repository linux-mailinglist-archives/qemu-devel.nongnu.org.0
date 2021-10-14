Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9F42DC20
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 16:54:05 +0200 (CEST)
Received: from localhost ([::1]:39950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb27Q-00023O-EL
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 10:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mb26F-0001I6-I4
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:52:51 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:8195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mb26C-0004Ex-Sr
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:52:50 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DA8EF4647E;
 Thu, 14 Oct 2021 16:52:43 +0200 (CEST)
Subject: Re: [PATCH v4 2/2] monitor: refactor set/expire_password and allow
 VNC display id
To: Markus Armbruster <armbru@redhat.com>
References: <20210928090326.1056010-1-s.reiter@proxmox.com>
 <20210928090326.1056010-3-s.reiter@proxmox.com>
 <87zgrebnod.fsf@dusky.pond.sub.org>
 <69473cd0-b01b-a189-e4e8-fcb02738b7b1@proxmox.com>
 <87bl3skrib.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <83d76057-8b43-8a21-18c6-6565ea87bf72@proxmox.com>
Date: Thu, 14 Oct 2021 16:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87bl3skrib.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 9:14 AM, Markus Armbruster wrote:
> Stefan Reiter <s.reiter@proxmox.com> writes:
> 
>> On 10/12/21 11:24 AM, Markus Armbruster wrote:
>>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>>
>>>> It is possible to specify more than one VNC server on the command line,
>>>> either with an explicit ID or the auto-generated ones à "default",
>>>> "vnc2", "vnc3", ...
>>>>
>>>> It is not possible to change the password on one of these extra VNC
>>>> displays though. Fix this by adding a "display" parameter to the
>>>> "set_password" and "expire_password" QMP and HMP commands.
>>>>
>>>> For HMP, the display is specified using the "-d" value flag.
>>>>
>>>> For QMP, the schema is updated to explicitly express the supported
>>>> variants of the commands with protocol-discriminated unions.
>>>>
>>>> Suggested-by: Eric Blake <eblake@redhat.com>
>>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>>>
>>> [...]
>>>
>>>> [...]
>>>
>>> Let me describe what you're doing in my own words, to make sure I got
>>> both the what and the why:
>>>
>>> 1. Change @protocol and @connected from str to enum.
>>>
>>> 2. Turn the argument struct into a union tagged by @protocol, to enable
>>>      3. and 4.
>>>
>>> 3. Add argument @display in branch 'vnc'.
>>>
>>> 4. Use a separate enum for @connected in each union branch, to enable 4.
>>>
>>> 5. Trim this enum in branch 'vnc' to the values that are actually
>>>      supported.  Note that just one value remains, i.e. @connected is now
>>>      an optional argument that can take only the default value.
>>>
>>> 6. Since such an argument is pointless, deprecate @connected in branch
>>>      'vnc'.
>>>
>>> Correct?
>>
>> Yes.
> 
> Thanks!
> 
>>> Ignorant question: is it possible to have more than one 'spice' display?
>>
>> Not in terms of passwords anyway. So only one SPICE password can be set at
>> any time, i.e. the 'display' parameter in this function does not apply.
>>
>>>
>>> Item 5. is not a compatibility break: before your patch,
>>> qmp_set_password() rejects the values you drop.
>>
>> Yes.
>>
>>>
>>> Item 5. adds another enum to the schema in return for more accurate
>>> introspection and slightly simpler qmp_set_password().  I'm not sure
>>> that's worthwhile.  I think we could use the same enum for both union
>>> branches.
>>
>> I tried to avoid mixing manual parsing and declarative QAPI stuff as much
>> as I could, so I moved as much as possible to QAPI. I personally like the
>> extra documentation of having the separate enum.
> 
> It's a valid choice.  I'm just pointing out another valid choice.  The
> difference between them will go away when we remove deprecated
> @connected.  You choose :)
> 
>>> I'd split this patch into three parts: item 1., 2.+3., 4.-6., because
>>> each part can stand on its own.
>>
>> The reason why I didn't do that initially is more to do with the C side.
>> I think splitting it up as you describe would make for some awkward diffs
>> on the qmp_set_password/hmp_set_password side.
>>
>> I can try of course.
> 
> It's a suggestion, not a demand.  I'm a compulsory patch splitter.

I'll just have a go and see what falls out. I do agree that this patch is a
bit long on its own.

> 
>>                       Though I also want to have it said that I'm not a fan
>> of how the HMP functions have to expand so much to accommodate the QAPI
>> structure in general.
> 
> Care to elaborate?

Well, before this patch 'hmp_set_password' was for all intents and purposes a
single function call to 'qmp_set_password'. Now it has a bunch of parameter
parsing and even validation (e.g. enum parsing). That's why I asked in the
v3 patch (I think?) if there was a way to call the QAPI style parsing from
there, since the parameters are all named the same and in a qdict already..

Something like:

   void hmp_set_password(Monitor *mon, const QDict *qdict)
   {
     ExpirePasswordOptions opts = qapi_magical_parse_fn(qdict);
     qmp_set_password(&opts,·&err);
     [error handling]
   }

That being said, I don't mind the current form enough to make this a bigger
discussion either, so if there isn't an easy way to do the above, let's just
leave it like it is.


