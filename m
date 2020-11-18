Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BC2B79FE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:09:45 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJTE-0003J8-Cl
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfJ22-0007Ar-9s
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:41:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfJ1z-0006Oq-Of
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQPn8+YoPpjKpJNo8kF2WtzikzDjihdQxtgFENOGXF8=;
 b=h3PzqxZK8IsYE+j4NWytqafKc3PHdX0kJOuW5jj7CUo3KfW2zHlqyvd2+pSuG90UaQRY8T
 78Z58xv6CZdxrNL1BPpQHaqo0sG4DV5DiKlO4nDO+afoYUgywjTAMz245cRPfzPlhZ5vv9
 MHM8ZbHHl1M7PtKxGRLq0yNlmo3FZs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-tS83GJJSMRet9PxsET-taw-1; Wed, 18 Nov 2020 03:41:30 -0500
X-MC-Unique: tS83GJJSMRet9PxsET-taw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A1E1007483;
 Wed, 18 Nov 2020 08:41:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBD8360C05;
 Wed, 18 Nov 2020 08:41:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C4BF11358BA; Wed, 18 Nov 2020 09:41:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
 <b5c76a27-551f-5b79-a47b-0d4a283a2d37@redhat.com>
Date: Wed, 18 Nov 2020 09:41:26 +0100
In-Reply-To: <b5c76a27-551f-5b79-a47b-0d4a283a2d37@redhat.com> (Thomas Huth's
 message of "Tue, 17 Nov 2020 21:12:49 +0100")
Message-ID: <87blfvoy4p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 16/11/2020 18.00, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> On 16/11/2020 14.25, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Hi Gan,
>>>>
>>>> On 11/15/20 7:49 PM, Gan Qixin wrote:
>>>>> Some peripherals of bcm2835 cprman have no category, put them into th=
e 'misc'
>>>>> category.
>>>>>
>>>>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>>>>> ---
>>>>> Cc: Philippe Mathieu-Daud=C3=83=C6=92=C3=82=C2=A9 <f4bug@amsat.org>
>>>>> ---
>>>>>  hw/misc/bcm2835_cprman.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>>>>> index 7e415a017c..c62958a99e 100644
>>>>> --- a/hw/misc/bcm2835_cprman.c
>>>>> +++ b/hw/misc/bcm2835_cprman.c
>>>>> @@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, vo=
id *data)
>>>>> =20
>>>>>      dc->reset =3D pll_reset;
>>>>>      dc->vmsd =3D &pll_vmstate;
>>>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>>
>>>> Well, this is not an usable device but a part of a bigger device,
>>>> so here we want the opposite: not list this device in any category.
>>>>
>>>> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
>>>> types so management apps can filter them out? (And so we are sure
>>>> all QOM is classified).
>>>>
>>>> Thomas, you already dealt with categorizing devices in the past,
>>>> what do you think about this? Who else could help? Maybe add
>>>> someone from libvirt in the thread?
>>>
>>> My 0.02 =E2=82=AC : Mark the device as user_creatable =3D false if it c=
an not really
>>> be used by the user with the -device CLI parameter. Then it also does n=
ot
>>> need a category. I know Markus will likely have a different opinion, bu=
t in
>>=20
>> You're hurting my feelings!  ;-P
>>=20
>>> my eyes it's just ugly if we present devices to the users that they can=
 not use.
>>=20
>> If we believe a device should only ever be used from C, then we should
>> keep it away from the UI.
>>=20
>> However, I'm wary of overloading user_creatable.  Even though it has
>> shifted shape a number of times (cannot_instantiate_with_device_add_yet,
>> no_user, and now user_creatable), its purpose has always been focused:
>> distinguishing devices that can be instantiated by generic code from the
>> ones that need device-specific code.  See user_creatable's comment in
>> qdev-core.h.
>>=20
>> I don't want to lose that distinction.  That's all.
>
> Well, currently we have the user_creatable flag and the hotpluggable flag=
. I
> guess that's simply not enough.
>
> I think in the long run, we should maybe replace the two flags with a
> "creatable" type instead that could take the following values:
>
>  CREATABLE_AS_SUBDEVICE  /* Device is part of another device and
>                             can only by added by code */
>  CREATABLE_BY_QOM        /* Some fancy new QOM function can be
>                             used to e.g. create this as part of
>                             a machine */
>  CREATABLE_BY_COLDPLUG   /* For cold-plugging via -device */
>  CREATABLE_BY_HOTPLUG    /* For hot-plugging via device_add */

For hot-plug to actually work, both the plug / device and the socket /
bus need to support it.  CREATABLE_BY_HOTPLUG would be about the former.
The latter could depend on bus or machine state.

> ... but that's likely something for the distant future...

The future arrives when the need for it overcomes inertia :)

[...]


