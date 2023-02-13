Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85892694155
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:35:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVBN-0007pl-Vy; Mon, 13 Feb 2023 04:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRVAz-0007EU-UD
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:31:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRVAs-0007Iz-Qg
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676280661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mb0e20nVxeWzFscapOHWh+PoVeZDcxi3+N2In5XCQXA=;
 b=aJQoljGzcr1DDiuDq/tIz1BztTpomrycZGsSjnjh82kpH/G1HgFIkwNsrZ1zRyCPLojuUs
 O3zdA1UDVcw4s33OFgenKs8m6dtxDdDc5L0xGdMIFwzr/AwF5zL69LqqvGYk/zo6oL2rUA
 NkSrmSgiNOc05i6lbO5xH+xEOvZ3CpQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-_M-q8K2yPuywZgI-mqYcvA-1; Mon, 13 Feb 2023 04:30:57 -0500
X-MC-Unique: _M-q8K2yPuywZgI-mqYcvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77EFF800050;
 Mon, 13 Feb 2023 09:30:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1383492B04;
 Mon, 13 Feb 2023 09:30:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F04221E6A1F; Mon, 13 Feb 2023 10:30:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,  eblake@redhat.com,
 eduardo@habkost.net,  berrange@redhat.com,  pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com,  mst@redhat.com, den-plotnikov@yandex-team.ru
Subject: Re: [PATCH v3 14/15] qapi: introduce DEVICE_ON event
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-15-vsementsov@yandex-team.ru>
 <37ebba4c-b522-37ee-dab8-c88061848d34@linaro.org>
 <ad626b08-1bc4-7e3b-cc69-e5384a3dc6e3@yandex-team.ru>
Date: Mon, 13 Feb 2023 10:30:54 +0100
In-Reply-To: <ad626b08-1bc4-7e3b-cc69-e5384a3dc6e3@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 10 Feb 2023 16:49:18 +0300")
Message-ID: <873579x67l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

> On 10.02.23 00:37, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
>>> We have DEVICE_DELETED event, that signals that device_del command is
>>> actually complited. But we don't have a counter-part for device_add.
>>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>>> when the device in some intermediate state. Let's add an event that say
>>> that the device is finally powered on, power indicator is on and
>>> everything is OK for next manipulation on that device.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>> =C2=A0 qapi/qdev.json | 24 ++++++++++++++++++++++++
>>> =C2=A0 hw/pci/pcie.c=C2=A0 | 12 ++++++++++++
>>> =C2=A0 hw/pci/shpc.c=C2=A0 | 12 ++++++++++++
>>> =C2=A0 3 files changed, 48 insertions(+)
>>>
>>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>>> index 40dc34f091..94da7ca228 100644
>>> --- a/qapi/qdev.json
>>> +++ b/qapi/qdev.json
>>> @@ -220,3 +220,27 @@
>>> =C2=A0 ##
>>> =C2=A0 { 'event': 'HOTPLUG_STATE',
>>> =C2=A0=C2=A0=C2=A0 'data': 'HotplugState' }
>>> +
>>> +
>>> +##
>>> +# @DEVICE_ON:
>>> +#
>>> +# Emitted whenever the device insertion completion is acknowledged by =
the guest.
>>> +# For now only emitted for SHPC and PCIe-native hotplug.
>>> +#
>>> +# @device: device name

Make that "the device's ID if it has one", and ...

>>> +#
>>> +# @path: device path

... "the device's QOM path", please.

>>> +#
>>> +# Since: 8.0
>>> +#
>>> +# Example:
>>> +#
>>> +# <- { "event": "DEVICE_ON",
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data": { "device": "virtio-net-pci-0",
>>> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "path": "/machine/peripheral/virtio-net-pci-0" },
>>
>> Why provide both device & path? Could the type_name be helpful?
>
> I just follow DEVICE_DELETED event. Not sure that it's the best thing to =
do)

The device ID is redundant, since the QOM path of a device with an ID is
/machine/peripheral/ID.

Fine print: code could conceivably violate this invariant.  But code
should *not* create devices with IDs.  IDs are strictly for the user.

We commonly send both device ID and QOM path, mostly for historical
reasons: the former precede the latter.

There are exceptions, such as query-cpus-fast.  Can't say offhand
whether CPUs can be created with IDs.

It's probably best to remain consistent with DEVICE_DELETED here.

I'd be in favour of deprecating and deleting redundant device IDs in QMP
output.

[...]


