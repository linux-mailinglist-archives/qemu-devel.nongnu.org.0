Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E83587B7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 17:01:54 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUWAF-0003Q5-H8
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 11:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUW8M-0002ry-5k
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUW8K-0004f8-0w
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617893986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bbSqOKADp2yp4p3ZnV1awT6pukbvxSAU+uljeYu6tGA=;
 b=dOZEaDlh7TRcLAuncRF/uEwb/P3+Y1QiKYGJH5DQJOHR2iRS4k7bTm6sIBvXWFtNRs8c4e
 NjvHBLS3xk11h5jI6HK0GkPx5TvSI+j4icD8CcPbvVKUeMXcW9CEwLCuU6wIXKOXrpBUvf
 Vk+tVhyzS9Uk0avCYqmtbuIgOTJCjGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-6xLo2yKRMTazsJe_FGArZw-1; Thu, 08 Apr 2021 10:59:44 -0400
X-MC-Unique: 6xLo2yKRMTazsJe_FGArZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257046D4E3
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 14:59:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8D110016FD;
 Thu,  8 Apr 2021 14:59:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18A00113525D; Thu,  8 Apr 2021 16:59:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
 <YG77DnwTyCVPL3nw@redhat.com>
Date: Thu, 08 Apr 2021 16:59:34 +0200
In-Reply-To: <YG77DnwTyCVPL3nw@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 8 Apr 2021 13:46:06 +0100")
Message-ID: <87o8eo9609.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Apr 08, 2021 at 01:56:28PM +0200, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > When introspecting properties for devices, libvirt issues a sequence o=
f
>> > QMP  'device-list-properties' commands, one for each device type we
>> > need info for.  The result of this command tells us about all properti=
es
>> > possible on that specific device, which is generally just fine.
>> >
>> > Every now and then though, there are properties that are inherited fro=
m
>> > / defined by the parent class, usually props that are common to all
>> > devices attached to a given bus type.
>> >
>> > The current case in point is the "acpi-index" property that was added =
to
>> > the "PCI" bus type, that is a parent for any type that is a PCI dev.
>> >
>> > Generally when libvirt adds support for a property, it will enable it
>> > across all devices that can support the property. So we're enabling us=
e
>> > of "acpi-index" across all PCI devices.
>> >
>> > The question thus becomes how should we probe for existence of the
>> > "acpi-index" property. The qemu-system-x86_64 emulator has somewhere
>> > around 150 user creatable PCI devices according to "-device help".
>> >
>> > The existance of a class hierarchy is explicitly not exposed in QMP
>> > because we consider that an internal impl detail, so we can't just
>> > query "acpi-index" on the "PCI" parent type.=20
>>=20
>> Not true.
>>=20
>> qapi/qom.json:
>>=20
>>     ##
>>     # @ObjectTypeInfo:
>>     #
>>     # This structure describes a search result from @qom-list-types
>>     #
>>     # @name: the type name found in the search
>>     #
>>     # @abstract: the type is abstract and can't be directly instantiated=
.
>>     #            Omitted if false. (since 2.10)
>>     #
>>     # @parent: Name of parent type, if any (since 2.10)
>>     #
>>     # Since: 1.1
>>     ##
>>     { 'struct': 'ObjectTypeInfo',
>>       'data': { 'name': 'str', '*abstract': 'bool', '*parent': 'str' } }
>>=20
>>     ##
>>     # @qom-list-types:
>>     #
>>     # This command will return a list of types given search parameters
>>     #
>>     # @implements: if specified, only return types that implement this t=
ype name
>>     #
>>     # @abstract: if true, include abstract types in the results
>>     #
>>     # Returns: a list of @ObjectTypeInfo or an empty list if no results =
are found
>>     #
>>     # Since: 1.1
>>     ##
>>     { 'command': 'qom-list-types',
>>       'data': { '*implements': 'str', '*abstract': 'bool' },
>>       'returns': [ 'ObjectTypeInfo' ],
>>       'allow-preconfig': true }
>>=20
>> Example 1:
>>=20
>>     {"execute": "qom-list-types", "arguments": {"abstract": true}}
>>=20
>> returns all type names with their parent type names.
>
> Ah, libvirt isn't setting abstract=3Dtrue when listing types during its
> probing of QEMU capabilities, which is why I didn't see the parents.
>
>
>> > We certainly don't want to issue 'device-list-properties' over and
>> > over for all 147 devices.
>> >
>> > If we just pick one device type, say virtio-blk-pci, and query that
>> > for "acpi-index", then our code is fragile because anyone can make
>> > a QEMU build that compiles-out a specific device. This is fairly
>> > unlikely for virtio devices, but never say never.
>> >
>> > For PCI, i'm tending towards probing for the "acpi-index" property on
>> > both "pci-bridge" and "pcie-root-port", as it seems unlikely that both
>> > of those will be compiled out of QEMU while still retaining PCI suppor=
t.
>> >
>> > I'm wondering if QEMU maintainers have a view on "best practice" to
>> > probe for device props that are common to specific bus types ?
>>=20
>> The obvious
>>=20
>>     {"execute": "device-list-properties",
>>      "arguments": {"typename": "pci-device"}}
>>=20
>> fails with "Parameter 'typename' expects a non-abstract device type".
>> But its cousin qom-list-properties works:
>>=20
>>     {"execute": "qom-list-properties",
>>      "arguments": {"typename": "pci-device"}}
>>     {"return": [
>>      {"name": "type", "type": "string"},
>>      {"name": "parent_bus", "type": "link<bus>"},
>>      {"name": "realized", "type": "bool"},
>>      {"name": "hotplugged", "type": "bool"},
>>      {"name": "hotpluggable", "type": "bool"},
>>      {"name": "failover_pair_id", "type": "str"},
>>      {"name": "romfile", "type": "str"},
>>      {"name": "addr", "description": "Slot and optional function number,=
 example: 06.0 or 06", "type": "int32"},
>>      {"name": "romsize", "type": "uint32"},
>>      {"name": "x-pcie-lnksta-dllla", "description": "on/off", "type": "b=
ool"},
>>      {"name": "rombar", "type": "uint32"},
>>      {"name": "x-pcie-extcap-init", "description": "on/off", "type": "bo=
ol"},
>>      {"name": "acpi-index", "type": "uint32"},
>>      {"name": "multifunction", "description": "on/off", "type": "bool"},
>>      {"name": "legacy-addr", "type": "str"}]}
>>=20
>> Does this help?
>
> Yes, its good.
>
> Is there any reason to use 'device-list-properties' at all, given that
> 'qom-list-properties' exists and works for all types ?

Good question.

device-list-properties uses module_object_class_by_name(), requires the
result to be a concrete device type, iterates over QOM properties with
object_property_iter_init() / object_property_iter_next(), skipping
properties named "type", "realized", "hotpluggable", "hotplugged",
"parent_bus", and any whose starts with "legacy-".

Paolo, can you remind us why we skip the "legacy-FOO" properties?

qom-list-properties uses object_class_by_name(), requires an object type
(an interface won't do).  If it's abstract, it iterates with
object_class_property_iter_init() / object_property_iter_next(), else
with object_property_iter_init() / object_property_iter_next().  It
doesn't skip properties.

Looks like device-list-properties has become[*] pretty much redundant
*except* for the difference between module_object_class_by_name() and
object_class_by_name().

Gerd, you changed device-list-properties from object_class_by_name() to
module_object_class_by_name() in commit 7ab6e7fcce.  Should
qom-list-properties be changed, too?  If yes, is there any reason to use
object_class_by_name() for looking up user-provided type names in QMP
commands?


[*] "has become" because they used to be more different, if memory
serves.


