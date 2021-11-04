Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB444456AA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:58:10 +0100 (CET)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mif7x-00047i-CM
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mif2n-00084j-In
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:52:49 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mif2l-0007r5-Aa
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:52:49 -0400
Received: from [192.168.137.126] (pop.92-184-102-203.mobile.abo.orange.fr
 [92.184.102.203])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BF2DE21A86;
 Thu,  4 Nov 2021 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1636041164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQukZl1QEbro8OFbbAbqjMO41lzp+dkE8v/tPKf8iyw=;
 b=lIgxNE7t3BeCVYbJ0Ucwn//u5rou+KYdkE57Y6WckPzQXoUQET6xDD1zY7UC470LknFE9j
 Wd/w0nNPP0fMdKgoQ8m1/mFpBsQoEmfxnekRLoA7R9MGDn+dyEi/SSuv04H8WvcK7qbLt/
 bHWtYvq15cxkQUmO1v3jH14m+DamZYw=
Message-ID: <d97fef26-9ec5-8504-ed72-808fcfa3c3db@greensocs.com>
Date: Thu, 4 Nov 2021 16:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Content-Language: en-US-large
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <YYOiyTcA6zZgtWBs@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: eblake@redhat.com, berrange@redhat.com, armbru@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/4/21 10:07, Kevin Wolf wrote:
> Am 03.11.2021 um 22:26 hat Paolo Bonzini geschrieben:
>> On 11/3/21 18:29, Kevin Wolf wrote:
>>> This series adds QOM class definitions to the QAPI schema, introduces
>>> a new TypeInfo.instance_config() callback that configures the object at
>>> creation time (instead of setting properties individually) and is
>>> separate from runtime property setters (which often used to be not
>>> really tested for runtime use), and finally generates a marshalling
>>> function for .instance_config() from the QAPI schema that makes this a
>>> natural C interface rather than a visitor based one.
>>
>> That's pretty cool!

Hi,

Just to be sure I understand. Is this config a generalization of the 
qdev-properties we have to describe the parameter used to create a device ?

>>
>> Just one question: why not always use boxed configuration?  It should not
>> make the instance_config types any larger, and it avoids unwieldy argument
>> lists.
> 
> Basically for the same reason as for commands (and for consistency with
> commands): If you have only one or two options, then creating a separate
> type for them feels just a little over the top, and boxing doesn't work
> with implicit types.
> 
> I really like the concise definitions without a separate struct like in:
> 
> { 'class': 'rng-egd',
>    'parent': 'rng-backend',
>    'config': { 'chardev': 'str' } }
> 
> Though maybe we could make it work by giving the implicit type another
> prefixed name?

What's an implicit type in this context ?

> 
>> Also, for the obligatory bikeshedding remark, do you have any other plans or
>> ideas for the colon-separated auto generated typenames?  Having both the
>> "namespace" (qom) and the more specific use (config) before the classname is
>> a bit weird, compared to the existing structs like RngRandomProperties.
>> Especially if boxed config is more used (or becomes the only possibility),
>> it might be that qom:class-name:config, or even just class-name:config, make
>> for nicer code in the object implementation.
> 
> 'qom-config:classname' isn't a type that is useful for the object
> implementations at all. Its only use is really storing the whole
> configuration temporarily in a QAPI C struct before applying it.
> 

Would not this type be useful to generate read-only properties (and 
store the values) corresponding to the config if we expect to always 
have such properties ?

--
Damien

