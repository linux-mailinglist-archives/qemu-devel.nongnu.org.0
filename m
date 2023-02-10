Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC3691ECA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQS5i-0006N0-G8; Fri, 10 Feb 2023 07:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQS5g-0006MW-2J
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:01:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQS5d-0003oG-QW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676030476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o81EEe7V7LrbjPz3jmPqvJyEGnpkhQAnvLjNgbFKfKM=;
 b=BoKJai+i+KVIQ67OPYUrbWDJ8UQCF9MdHhcllr17XR6OOA27ku2baMmmJFzq/Os3Pvk1+G
 vQ9cWHk3ZnDgZWKay3FHBE4gg9oDJi2Gwn9pbC5PN1bNaczmPRVN0PMzDrp90mzh21ESyD
 M5DUXpK3wDE09PF8RjLOxII370jrAps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-tXcv98ilN9WP4XMaNYosRQ-1; Fri, 10 Feb 2023 07:01:15 -0500
X-MC-Unique: tXcv98ilN9WP4XMaNYosRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 080BA87A9EF;
 Fri, 10 Feb 2023 12:01:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A269FC158BB;
 Fri, 10 Feb 2023 12:01:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E76E221E6A1F; Fri, 10 Feb 2023 13:01:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 eblake@redhat.com,  eduardo@habkost.net,  berrange@redhat.com,
 pbonzini@redhat.com,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
 <875yc9vmxz.fsf@pond.sub.org>
 <c361c5f3-c623-09e9-0519-cf9ba68ae0a1@yandex-team.ru>
Date: Fri, 10 Feb 2023 13:01:12 +0100
In-Reply-To: <c361c5f3-c623-09e9-0519-cf9ba68ae0a1@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 10 Feb 2023 14:36:37 +0300")
Message-ID: <874jrtsp9z.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 10.02.23 13:23, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
>> 
>>> For PCIe and SHPC hotplug it's important to track led indicators,
>>> especially the power led. Add an event that helps.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---

[...]

>>> +##
>>> +# @HotplugState:
>>> +#
>>> +# @hotplug-device: hotplug device id
>>> +# @hotplug-path: hotplug device path
>>> +# @hotplug-slot: hotplug device slot (only for SHPC)
>>> +# @device: device name
>>> +# @path: device path
>>> +# @power-led: Power Indicator
>>> +# @attention-led: Attention Indicator
>>> +# @state: slot state, only for SHPC hotplug controller
>>> +# @power: Power Controller state, only for PCIe hotplug
>> 
>> 
>> 
>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'struct': 'HotplugState',
>>> +  'data': { '*hotplug-device': 'str',
>>> +            'hotplug-path': 'str',
>>> +            '*hotplug-slot': 'int',
>>> +            '*device': 'str',
>>> +            'path': 'str',
>>> +            '*power-led': 'HotplugLedState',
>>> +            '*attention-led': 'HotplugLedState',
>>> +            '*state': 'HotplugSlotState',
>>> +            '*power': 'HotplugPowerState' } }
>> 
>> Too terse.
>
> Will fix)
>
>> 
>> What do @hotplug-device and @device name?  Are these qdev-id?
>> 
>> What kind of paths are @hotplug-path and @path?  Are these paths to an
>> object device in the QOM tree?  Which object?
>
> device / path is same name and path as for DEVICE_DELETED

Got it.  But there we have just one device, and here we have two.  Which
two?

Also, DEVICE_DELETED's doc comment is better:

    # @device: the device's ID if it has one
    #
    # @path: the device's QOM path

Suggest to steal from there.

>> What's a @hotplug-slot?
>
> pci slot. Significant for SHPC
>
>> 
>>> +
>>> +##
>>> +# @HOTPLUG_STATE:
>>> +#
>>> +# Emitted whenever the state of hotplug controller is changed.
>> 
>> Suggest "the state of hotplug controller changes."
>> 
>> Regardless, too terse.  What state changes exactly trigger the event?
>
> Any change of power-led / attention-led / state / power.
>
> Will add a description
>
>> 
>>> +# Only changed values are included into event.
>> 
>> "in the event"
>> 
>> Which values are included for each event trigger?
>
> - device ids and names always included
> - power-led / attention-led / state / power  - only those who changed
>
>> 
>>> +# Only SHPC and PCIe-native hotplug are supported.
>> 
>> Suggest something like "only ... provide this event."
>> 
>> Are parts of HotplugState specific to "SHPC and PCIe-native"?  Or asked
>> differently: when we make other kinds of hotplug send the event, what
>> would we need to change here?
>
> Hmm. Looks like I'd better use a union with type discriminator. This way we'll be able to add any other hotplug later.
>
> (and even now it's better, as not all 4 state fields are shared for PCIe and SHPC)

A union feels like the way to go.

>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'event': 'HOTPLUG_STATE',
>>> +  'data': 'HotplugState' }
>> 
>> [...]


