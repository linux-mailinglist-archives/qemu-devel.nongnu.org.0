Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B190135828B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:58:19 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUTIg-0003r2-7J
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUTH7-0002sy-Lg
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUTH4-0003Nh-JN
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617882996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gi+6QMArEedPXOZLolydMGs2nrmCoDBya1m0V7918jg=;
 b=SqN0rupwPZw4TTzDtr/8tCcxzEDRfpw+mLOuBD6TmNl/WGuSA9BAPgYAhQSTCl3++MJ3/7
 FxVQmTX/FVbKQlIAFlbhH3MBrqxiHi6T3bHjKRqaMqhixOSw227fucmRLtpJZJwuoiJAxp
 A04amTHGeH/f951xWa9F1fgb8fyJhhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-zVTfZi1ZPYmuewGWiEZYqw-1; Thu, 08 Apr 2021 07:56:34 -0400
X-MC-Unique: zVTfZi1ZPYmuewGWiEZYqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6CB1883520
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 11:56:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32AAF6A90B;
 Thu,  8 Apr 2021 11:56:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 954781132D66; Thu,  8 Apr 2021 13:56:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
References: <YG23ILea4H36TllU@redhat.com>
Date: Thu, 08 Apr 2021 13:56:28 +0200
In-Reply-To: <YG23ILea4H36TllU@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 7 Apr 2021 14:44:00 +0100")
Message-ID: <87pmz5at1v.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> When introspecting properties for devices, libvirt issues a sequence of
> QMP  'device-list-properties' commands, one for each device type we
> need info for.  The result of this command tells us about all properties
> possible on that specific device, which is generally just fine.
>
> Every now and then though, there are properties that are inherited from
> / defined by the parent class, usually props that are common to all
> devices attached to a given bus type.
>
> The current case in point is the "acpi-index" property that was added to
> the "PCI" bus type, that is a parent for any type that is a PCI dev.
>
> Generally when libvirt adds support for a property, it will enable it
> across all devices that can support the property. So we're enabling use
> of "acpi-index" across all PCI devices.
>
> The question thus becomes how should we probe for existence of the
> "acpi-index" property. The qemu-system-x86_64 emulator has somewhere
> around 150 user creatable PCI devices according to "-device help".
>
> The existance of a class hierarchy is explicitly not exposed in QMP
> because we consider that an internal impl detail, so we can't just
> query "acpi-index" on the "PCI" parent type.=20

Not true.

qapi/qom.json:

    ##
    # @ObjectTypeInfo:
    #
    # This structure describes a search result from @qom-list-types
    #
    # @name: the type name found in the search
    #
    # @abstract: the type is abstract and can't be directly instantiated.
    #            Omitted if false. (since 2.10)
    #
    # @parent: Name of parent type, if any (since 2.10)
    #
    # Since: 1.1
    ##
    { 'struct': 'ObjectTypeInfo',
      'data': { 'name': 'str', '*abstract': 'bool', '*parent': 'str' } }

    ##
    # @qom-list-types:
    #
    # This command will return a list of types given search parameters
    #
    # @implements: if specified, only return types that implement this type=
 name
    #
    # @abstract: if true, include abstract types in the results
    #
    # Returns: a list of @ObjectTypeInfo or an empty list if no results are=
 found
    #
    # Since: 1.1
    ##
    { 'command': 'qom-list-types',
      'data': { '*implements': 'str', '*abstract': 'bool' },
      'returns': [ 'ObjectTypeInfo' ],
      'allow-preconfig': true }

Example 1:

    {"execute": "qom-list-types", "arguments": {"abstract": true}}

returns all type names with their parent type names.

The following script prints a QOM type forest:

    #!/usr/bin/python3

    true =3D True
    false =3D False
    ts =3D ... output of the qom-list-types above ...
    child=3D{}

    for t in ts:
        n =3D t['name']
        p =3D t.get('parent')
        if p not in child:
            child[p] =3D []
        child[p].append(n)

    def print_type_tree(name, level=3D-1):
        if name is not None:
            print(" " * level * 4 + name)
        for c in child.get(name, []):
            print_type_tree(c, level + 1)

    print_type_tree(None)

Example 2:

    {"execute": "qom-list-types", "arguments": {"implements": "pci-device"}=
}

returns all the (concrete) PCI device type names.

Note that "implements" may be an interface, too.

> We certainly don't want to issue 'device-list-properties' over and
> over for all 147 devices.
>
> If we just pick one device type, say virtio-blk-pci, and query that
> for "acpi-index", then our code is fragile because anyone can make
> a QEMU build that compiles-out a specific device. This is fairly
> unlikely for virtio devices, but never say never.
>
> For PCI, i'm tending towards probing for the "acpi-index" property on
> both "pci-bridge" and "pcie-root-port", as it seems unlikely that both
> of those will be compiled out of QEMU while still retaining PCI support.
>
> I'm wondering if QEMU maintainers have a view on "best practice" to
> probe for device props that are common to specific bus types ?

The obvious

    {"execute": "device-list-properties",
     "arguments": {"typename": "pci-device"}}

fails with "Parameter 'typename' expects a non-abstract device type".
But its cousin qom-list-properties works:

    {"execute": "qom-list-properties",
     "arguments": {"typename": "pci-device"}}
    {"return": [
     {"name": "type", "type": "string"},
     {"name": "parent_bus", "type": "link<bus>"},
     {"name": "realized", "type": "bool"},
     {"name": "hotplugged", "type": "bool"},
     {"name": "hotpluggable", "type": "bool"},
     {"name": "failover_pair_id", "type": "str"},
     {"name": "romfile", "type": "str"},
     {"name": "addr", "description": "Slot and optional function number, ex=
ample: 06.0 or 06", "type": "int32"},
     {"name": "romsize", "type": "uint32"},
     {"name": "x-pcie-lnksta-dllla", "description": "on/off", "type": "bool=
"},
     {"name": "rombar", "type": "uint32"},
     {"name": "x-pcie-extcap-init", "description": "on/off", "type": "bool"=
},
     {"name": "acpi-index", "type": "uint32"},
     {"name": "multifunction", "description": "on/off", "type": "bool"},
     {"name": "legacy-addr", "type": "str"}]}

Does this help?


