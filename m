Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3AB580059
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:04:03 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFygk-0007Fv-2R
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oFycW-0004Jn-1r
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:59:40 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:35882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oFycN-0007TK-VW
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:59:35 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 1F5F92E132A;
 Mon, 25 Jul 2022 16:59:24 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b423::1:1] (unknown
 [2a02:6b8:b081:b423::1:1])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 4qAmK7xjHN-xLOWbi1K; Mon, 25 Jul 2022 16:59:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658757562; bh=6FhqBMQqh1wUD6pYi00XepkwLu3M9CocOjyRsxhjhpc=;
 h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
 b=Vj+gBgXnkd3p3COJ2Q1TwmPRA8avF+8lMP9rTRRmP9hF58eh70sfv6cUkJMgP4bsS
 LODkqFcaEfojEda9ytGIbAHFL5tE8Q/6Wi49V6yZBgh99CeAQgGGqgkQ9po3GmiETR
 v/XNqEzgDW0vYrKZAzoMojPYPoBfte5nCvpBHmhI=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <630f6dd4-7bb2-0023-9c9a-542e1ce3e0b9@yandex-team.ru>
Date: Mon, 25 Jul 2022 16:59:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <YtfhWgayuGKNVjGq@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <YtfhWgayuGKNVjGq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 7/20/22 14:04, Daniel P. Berrangé wrote:
> On Wed, Jul 20, 2022 at 02:00:16PM +0300, Roman Kagan wrote:
>> On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
>>> On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
>>>> It's possible to create non-working configurations by attaching a device
>>>> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
>>>> specifying a slot number other that zero, e.g.:
>>>>
>>>>      -device pcie-root-port,id=s0,... \
>>>>      -device virtio-blk-pci,bus=s0,addr=4,...
>>>>
>>>> Make QEMU reject such configurations and only allow addr=0 on the
>>>> secondary bus of a PCIe slot.
>>>
>>> What do you mean by 'non-working' in this case.  The guest OS boots
>>> OK, but I indeed don't see the device in the guest, but IIUC it was
>>> said that was just because Linux doesn't scan for a non-zero slot.
>>
>> Right.  I don't remember if it was Linux or firmware or both but indeed
>> at least Linux guests don't see devices if attached to a PCIe slot at
>> addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)
> 
> I vaguely recall there was an option to tell linux to scan all slots,
> not just slot 0, not sure if that's applicable here.
> 
>>
>>> That wouldn't be a broken config from QEMU's POV though, merely a
>>> guest OS limitation ?
>>
>> Strictly speaking it wouldn't, indeed.  But we've had created such a
>> configuration (due to a bug in our management layer) and spent
>> non-negligible time trying to figure out why the attached device didn't
>> appear in the guest.  So I thought it made sense to reject a
>> configuration which is known to confuse guests.  Doesn't it?
> 
> If a configuration is a permissible per the hardware design / spec, then
> QEMU should generally allow it.  We don't want to constrain host side
> configs based on the current limitations of guest OS whose behaviour can
> change over time, or where a different guest OS may have a different POV.
> 

If I understand correctly further answers the configration that we try to forbid is not permissible by PCIe spec. So seems valid to forbid it. We still need to mention specification in commit message and in the comment.

If we still afraid to forbid at once that invalid configuration that was previously allowed, may be we can proceed with some of the following:

1. Make a deprecation period of three releases and print only warning during this period. And forbid the invalid configuration three releases later. Still I'm not sure that someone will see these warnings in logs..

2. Make a boolean config option, like CONFIG_PCIE_STRICT, which forbids invalid configurations. This way we keep default behavior, that allows to test something unusual, but add an option that we can use for production solution where it's important to reduce number of possibilities to break the VM.

What do you think?

-- 
Best regards,
Vladimir

