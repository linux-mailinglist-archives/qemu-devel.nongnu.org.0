Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF9645AC4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uNo-0004KW-Nt; Wed, 07 Dec 2022 08:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p2uNm-0004Fx-9J
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:22:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p2uNj-0007U6-7Q
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jOodXfTpP3iM+tw87lvQbwaxfxgWd30QStbKhiZZsJc=;
 b=eASbPvCBE/1j1XgLknigXnz8svKYQ13HuRzRWf3vHBHrRbkMdikfI/YekG0qYF3yvPtI84
 KdQmqIp28uMDFgMcvTmZpmZ2KifDwRId8fe2sI1mtF/ZBpx9u5r0GTFFReQDL5uX1ozBKE
 64Wr7787cN+1AEHOhD64NFr2PqewLsc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Jmgsr339Nee7h2I_dmVSVA-1; Wed, 07 Dec 2022 08:22:35 -0500
X-MC-Unique: Jmgsr339Nee7h2I_dmVSVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B01722932498;
 Wed,  7 Dec 2022 13:22:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BD011121314;
 Wed,  7 Dec 2022 13:22:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0671021E6921; Wed,  7 Dec 2022 14:22:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, lvivier@redhat.com,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 mst@redhat.com,  qemu_oss@crudebyte.com,  kraxel@redhat.com,
 si-wei.liu@oracle.com,  joao.m.martins@oracle.com,  eblake@redhat.com,
 qemu-block@nongnu.org,  david@redhat.com,  arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com,  thuth@redhat.com,  michael.roth@amd.com,
 groug@kaod.org,  dgilbert@redhat.com,  eric.auger@redhat.com,
 stefanha@redhat.com,  boris.ostrovsky@oracle.com,  kwolf@redhat.com,
 mathieu.poirier@linaro.org,  raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
 <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
 <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
 <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
 <6c917ccc-c458-3545-de73-6f9aee132b45@linaro.org>
 <87bkolrfu6.fsf@pond.sub.org>
 <fa6b712c-f785-8fc6-27a7-47f1386d51e2@oracle.com>
Date: Wed, 07 Dec 2022 14:22:31 +0100
In-Reply-To: <fa6b712c-f785-8fc6-27a7-47f1386d51e2@oracle.com> (Jonah Palmer's
 message of "Wed, 7 Dec 2022 03:47:42 -0500")
Message-ID: <875yenmjqg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Jonah Palmer <jonah.palmer@oracle.com> writes:

> On 12/2/22 10:21, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9<philmd@linaro.org>  writes:
>>
>>> On 2/12/22 13:23, Jonah Palmer wrote:
>>>> On 11/30/22 11:16, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> Hi,
>>>>>
>>>>> On 11/8/22 14:24, Jonah Palmer wrote:
>>>>>> From: Laurent Vivier<lvivier@redhat.com>
>>>>>>
>>>>>> This new command lists all the instances of VirtIODevices with
>>>>>> their canonical QOM path and name.
>>>>>>
>>>>>> [Jonah: @virtio_list duplicates information that already exists in
>>>>>>  =C2=A0 the QOM composition tree. However, extracting necessary info=
rmation
>>>>>>  =C2=A0 from this tree seems to be a bit convoluted.
>>>>>>
>>>>>>  =C2=A0 Instead, we still create our own list of realized virtio dev=
ices
>>>>>>  =C2=A0 but use @qmp_qom_get with the device's canonical QOM path to=
 confirm
>>>>>>  =C2=A0 that the device exists and is realized. If the device exists=
 but
>>>>>>  =C2=A0 is actually not realized, then we remove it from our list (f=
or
>>>>>>  =C2=A0 synchronicity to the QOM composition tree).
>>
>> How could this happen?
>>
>>>>>>  =C2=A0 Also, the QMP command @x-query-virtio is redundant as @qom-l=
ist
>>>>>>  =C2=A0 and @qom-get are sufficient to search '/machine/' for realiz=
ed
>>>>>>  =C2=A0 virtio devices. However, @x-query-virtio is much more conven=
ient
>>>>>>  =C2=A0 in listing realized virtio devices.]
>>>>>>
>>>>>> Signed-off-by: Laurent Vivier<lvivier@redhat.com>
>>>>>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>>>>>> ---
>>>>>>  =C2=A0 hw/virtio/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 ++
>>>>>>  =C2=A0 hw/virtio/virtio-stub.c=C2=A0=C2=A0=C2=A0 | 14 ++++++++
>>>>>>  =C2=A0 hw/virtio/virtio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 44 ++++++++++++++++++++++++
>>>>>>  =C2=A0 include/hw/virtio/virtio.h |=C2=A0 1 +
>>>>>>  =C2=A0 qapi/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>>>>  =C2=A0 qapi/qapi-schema.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
>>>>>>  =C2=A0 qapi/virtio.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 68 ++++++++++++++++++++++++++++++++++++++
>>>>>>  =C2=A0 tests/qtest/qmp-cmd-test.c |=C2=A0 1 +
>>>>>>  =C2=A0 8 files changed, 132 insertions(+)
>>>>>>  =C2=A0 create mode 100644 hw/virtio/virtio-stub.c
>>>>>>  =C2=A0 create mode 100644 qapi/virtio.json
>>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>>> index 5d607aeaa0..bdfa82e9c0 100644
>>>>>> --- a/hw/virtio/virtio.c
>>>>>> +++ b/hw/virtio/virtio.c
>>>>>> @@ -13,12 +13,18 @@
>>>>>>  =C2=A0 =C2=A0 #include "qemu/osdep.h"
>>>>>>  =C2=A0 #include "qapi/error.h"
>>>>>> +#include "qapi/qmp/qdict.h"
>>>>>> +#include "qapi/qapi-commands-virtio.h"
>>>>>> +#include "qapi/qapi-commands-qom.h"
>>>>>> +#include "qapi/qapi-visit-virtio.h"
>>>>>> +#include "qapi/qmp/qjson.h"
>>>>>>  =C2=A0 #include "cpu.h"
>>>>>>  =C2=A0 #include "trace.h"
>>>>>>  =C2=A0 #include "qemu/error-report.h"
>>>>>>  =C2=A0 #include "qemu/log.h"
>>>>>>  =C2=A0 #include "qemu/main-loop.h"
>>>>>>  =C2=A0 #include "qemu/module.h"
>>>>>> +#include "qom/object_interfaces.h"
>>>>>>  =C2=A0 #include "hw/virtio/virtio.h"
>>>>>>  =C2=A0 #include "migration/qemu-file-types.h"
>>>>>>  =C2=A0 #include "qemu/atomic.h"
>>>>>> @@ -29,6 +35,9 @@
>>>>>>  =C2=A0 #include "sysemu/runstate.h"
>>>>>>  =C2=A0 #include "standard-headers/linux/virtio_ids.h"
>>>>>>  =C2=A0 +/* QAPI list of realized VirtIODevices */
>>>>>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>>>>> +
>>>>>>  =C2=A0 /*
>>>>>>  =C2=A0=C2=A0 * The alignment to use between consumer and producer p=
arts of vring.
>>>>>>  =C2=A0=C2=A0 * x86 pagesize again. This is the default, used by tra=
nsports like PCI
>>>>>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState =
*dev, Error **errp)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->listener.commit =3D virtio_mem=
ory_listener_commit;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->listener.name =3D "virtio";
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_listener_register(&vdev->list=
ener, vdev->dma_as);
>>>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 =C2=A0 static void virtio_device_unrealize(DeviceState *dev)
>>>>>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceStat=
e *dev)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->unreali=
ze(dev);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 QTAILQ_REMOVE(&virtio_list, vdev, next);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free(vdev->bus_name);
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->bus_name =3D NULL;
>>>>>>  =C2=A0 }
>>>>>> @@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectCla=
ss *klass, void *data)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->stop_ioeventfd =3D virtio_devic=
e_stop_ioeventfd_impl;
>>>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->legacy_features |=3D VIR=
TIO_LEGACY_FEATURES;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_INIT(&virtio_list);
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 =C2=A0 bool virtio_device_ioeventfd_enabled(VirtIODevice *vd=
ev)
>>>>>> @@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODe=
vice *vdev)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return virtio_bus_ioeventfd_enabled(=
vbus);
>>>>>>  =C2=A0 }
>>>>>>  =C2=A0 +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 VirtioInfoList *list =3D NULL;
>>>>>> +=C2=A0=C2=A0=C2=A0 VirtioInfoList *node;
>>>>>> +=C2=A0=C2=A0=C2=A0 VirtIODevice *vdev;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEV=
ICE(vdev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error *err =3D NULL;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QObject *obj =3D qmp_qom=
_get(dev->canonical_path, "realized", &err);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err =3D=3D NULL) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
GString *is_realized =3D qobject_to_json_pretty(obj, true);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* virtio device is NOT realized, remove it from list */
>>>>>
>>>>> Why not check dev->realized instead of calling qmp_qom_get() & qobjec=
t_to_json_pretty()?
>>>>
>>>> This check queries the QOM composition tree to check that the device a=
ctually exists and is
>>>> realized. In other words, we just want to confirm with the QOM composi=
tion tree for the device.
>>
>> Again, how could this happen?
>>
>> If @virtio_list isn't reliable, why have it in the first place?
>
> Honestly, I'm not sure how this even could happen, since the @virtio_list=
 is managed at the realization
> and unrealization of a virtio device. Given this, I do feel as though the=
 list is reliable, although
> this might just bena=C3=AFve of me to say. After giving this a second loo=
k, the @virtio_list is only really needed to provide a nice list of all rea=
lized virtio devices=20
> on the system, along with their full canonical paths. If the user can fin=
d the canonical path of a virtio device by searching the QOM=20
> composition tree, and assuming we can get a @VirtioDevice object (in code=
) from this canonical path, then the rest of the QMP/HMP features of=20
> these patches could be done by solely by searching the QOM composition tr=
ee. However, I think having this list of realized virtio devices as a=20
> subset of the QOM composition tree is worth its weight, since the user no=
 longer has to search the entire tree to find virtio devices and piece=20
> together their canonical paths. Of course, if we're somehow able to gener=
ate a similar list in code by searching the QOM composition tree,=20
> then there would be no need for this @virtio_list. However, it's really n=
ot clear how, or if, such a list could be generated by parsing the QOM=20
> composition tree.

I'm not debating whether to have the command right now.  I'm debating
the introduction of variable @virtio_list.  Please consider...

>>>> This was done to have some kind of synchronicity between @virtio_list =
and the QOM composition
>>>> tree, since the list duplicates information that already exists in the=
 tree.
>>>> This check was recommended in v10 and added in v11 of this patch serie=
s.
>>>
>>> Thanks, I found Markus comments:
>>>
>>> v10:
>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogb=
iw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTN=
ZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$=20=20

... this:

>> My recommendation there was to *delete* virtio_list and search the QOM
>> composition tree instead:
>>
>>      @virtio_list duplicates information that exists in the QOM composit=
ion
>>      tree.  It needs to stay in sync.  You could search the composition =
tree
>>      instead.
>>
>> The QOM composition tree is the source of truth.

Let me tell you a tale of two patches.

One created a niche QMP command.  It also modified core infrastructure
to keep additional state.  State that needed to be kept consistent with
existing state forever.  Consistency was not entirely obvious.  The
command examined this new state.  The examination was simple.

The other one created a niche QMP command, and nothing more.  The
command examined state without changing it.  The examination was
less simple.

One of the two patches had a much easier time in review.  Which one
could it be...

Please give the other approach a serious try.

[...]


