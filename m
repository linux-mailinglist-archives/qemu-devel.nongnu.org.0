Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46218533DF7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 15:36:15 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrBM-0005zk-6t
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 09:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntr7p-0005FC-7c
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:32:33 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:34982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntr7h-0001W7-U8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 09:32:32 -0400
Received: from [192.168.15.104] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 79D2C21A86;
 Wed, 25 May 2022 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653485541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6CS6EpnYzYF4qpq6jQt6SvITzEy1mLkmzNbJ59mxFs=;
 b=EAlvqnq15zXEzUcq9ulMK3uz1D0pIB7TKWGgdlpj1xXQRrQ6ye0V43BZlLaJRsKVWhQbcx
 qBUOZqvURL1QBB6fZuT0DxK6q8rIaheGIHF/xJl+tcjjj+h02qaT2i+w3jb7wfUsp8ILii
 OyOUse+qU21pv4LWa1NpKd91/RM3HEs=
Message-ID: <6e83ac2f-18ce-10dd-3e4c-3fcf68c313b0@greensocs.com>
Date: Wed, 25 May 2022 15:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
 <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/22 13:45, Peter Maydell wrote:
> On Wed, 25 May 2022 at 10:51, Damien Hedde <damien.hedde@greensocs.com> wrote:
>> On 5/24/22 19:44, Mark Cave-Ayland wrote:
>>> Sorry for coming late into this series, however one of the things I've
>>> been thinking about a lot recently is that with the advent of QOM and
>>> qdev, is there really any distinction between TYPE_DEVICE and
>>> TYPE_SYS_BUS_DEVICE anymore, and whether it makes sense to keep
>>> TYPE_SYS_BUS_DEVICE long term.
>>
>> On QAPI/CLI level there is a huge difference since TYPE_SYS_BUS_DEVICE
>> is the only subtype of TYPE_DEVICE which is subject to special
>> treatment. It prevents to plug a sysbus device which has not be allowed
>> by code and that's what I want to get rid of (or workaround by allowing
>> all of them).
> 
> Yes, but the fact that TYPE_SYS_BUS_DEVICE is a special subclass
> is an accident of history. At some point we really ought to tidy
> this up so that any TYPE_DEVICE can have MMIO regions and IRQs,
> and get rid of the subclass entirely. This isn't trivial, for
> reasons including problems with reset handling, but I would
> prefer it if we didn't bake "sysbus is special" into places like
> the QMP commands.
> 
> More generally, I don't think that the correct answer to "is this
> device OK to cold-plug via commandline and QMP is "is it a sysbus
> device?". I don't know what the right way to identify cold-pluggable
> devices is but I suspect it needs to be more complicated.

"sysbus is special" is already into the QMP commands.

Right now, any user-creatable device (but sysbus devices) can be 
cold-plugged by CLI using "-device".
The checks are basically:
+ does this device is "user-creatable" ?
+ do realize succeed ? (check device properties and handle bus connection)
So basically this is down to the bus realize mechanism to deal with any 
non-trivial constraint.

Concretely "user-creatable" means cold-pluggable by CLI.
And the reason why it cannot be done by QMP is because QMP commands are 
not possible at that time (the based-on series fix that).

For sysbus device, it is the same but there is an additional check to 
verify that the device is present in the machine allow list.

> 
>> I'm note sure what you mean by identification and enumeration. I do not
>> do any introspection and rely on knowing which mmio or irq index
>> corresponds to what. The "id" in `device_add` allows to reference the
>> device in following commands.
> 
> This is then baking in a device's choices of MMIO region
> ordering and arrangement and its IRQ numbering into a
> user-facing ABI. I can't say I'm very keen on that -- it
> would block us from being able to do a variety of
> refactorings and cleanups.
>

It's the same for any device property, we make a choice that is exposed 
to the user.

Whether this is done at TYPE_DEVICE or TYPE_SYS_BUS_DEVICE level does 
not change anything to that matter. We could, for example, choose to 
follow the order/name convention used in device tree specs if the issue 
is having no rules. That would probably ease any fdt generation from a 
device qemu model.

That does not prevent us to make change after. Right now, this would be 
accessible only if using the _none_ machine and with '-preconfig' 
experimental and using the _none_ machine. So I don't think we have to 
follow some deprecation policy.

What would you consider a starting point to allow that kind of plug ?

--
Damien

