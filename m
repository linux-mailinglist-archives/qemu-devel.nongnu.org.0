Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90297640943
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 16:24:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p17rw-00055F-GN; Fri, 02 Dec 2022 10:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p17rm-00053t-Sh
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:22:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p17ra-0003sM-Sn
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669994522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOepTM+4Z0XSUm3dxyi2jd1sDmaMOGFt2lnag7aOpDA=;
 b=FZO2DEJSjg3YTxmchmgJjmC7+dOEJPfUfixEMUNXdnZJJpfonwx97M9KY2AGOd4m5tKxI5
 BiZvmg5wmaqIZU3XVVRT6Ul901TAMH2zfAzhoZW8mBHFXDHJeYJjYnxoNrMzsnRgoa1p+A
 ImylapInCa/I07uufTOd26uZJJygZQA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-pL17kPv7MYqNec1nMpRq3w-1; Fri, 02 Dec 2022 10:21:58 -0500
X-MC-Unique: pL17kPv7MYqNec1nMpRq3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C15329AB40D;
 Fri,  2 Dec 2022 15:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B182111E3FF;
 Fri,  2 Dec 2022 15:21:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E578021E6921; Fri,  2 Dec 2022 16:21:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Jonah Palmer <jonah.palmer@oracle.com>,  qemu-devel@nongnu.org,
 lvivier@redhat.com,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Date: Fri, 02 Dec 2022 16:21:53 +0100
In-Reply-To: <6c917ccc-c458-3545-de73-6f9aee132b45@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 2 Dec 2022 15:17:17
 +0100")
Message-ID: <87bkolrfu6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 2/12/22 13:23, Jonah Palmer wrote:
>> On 11/30/22 11:16, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi,
>>>
>>> On 11/8/22 14:24, Jonah Palmer wrote:
>>>> From: Laurent Vivier <lvivier@redhat.com>
>>>>
>>>> This new command lists all the instances of VirtIODevices with
>>>> their canonical QOM path and name.
>>>>
>>>> [Jonah: @virtio_list duplicates information that already exists in
>>>> =C2=A0 the QOM composition tree. However, extracting necessary informa=
tion
>>>> =C2=A0 from this tree seems to be a bit convoluted.
>>>>
>>>> =C2=A0 Instead, we still create our own list of realized virtio devices
>>>> =C2=A0 but use @qmp_qom_get with the device's canonical QOM path to co=
nfirm
>>>> =C2=A0 that the device exists and is realized. If the device exists but
>>>> =C2=A0 is actually not realized, then we remove it from our list (for
>>>> =C2=A0 synchronicity to the QOM composition tree).

How could this happen?

>>>>
>>>> =C2=A0 Also, the QMP command @x-query-virtio is redundant as @qom-list
>>>> =C2=A0 and @qom-get are sufficient to search '/machine/' for realized
>>>> =C2=A0 virtio devices. However, @x-query-virtio is much more convenient
>>>> =C2=A0 in listing realized virtio devices.]
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>>>> ---
>>>> =C2=A0 hw/virtio/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
>>>> =C2=A0 hw/virtio/virtio-stub.c=C2=A0=C2=A0=C2=A0 | 14 ++++++++
>>>> =C2=A0 hw/virtio/virtio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 44 ++++++++++++++++++++++++
>>>> =C2=A0 include/hw/virtio/virtio.h |=C2=A0 1 +
>>>> =C2=A0 qapi/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 qapi/qapi-schema.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 qapi/virtio.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 68 ++++++++++++++++++++++++++++++++++++++
>>>> =C2=A0 tests/qtest/qmp-cmd-test.c |=C2=A0 1 +
>>>> =C2=A0 8 files changed, 132 insertions(+)
>>>> =C2=A0 create mode 100644 hw/virtio/virtio-stub.c
>>>> =C2=A0 create mode 100644 qapi/virtio.json
>>>
>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>> index 5d607aeaa0..bdfa82e9c0 100644
>>>> --- a/hw/virtio/virtio.c
>>>> +++ b/hw/virtio/virtio.c
>>>> @@ -13,12 +13,18 @@
>>>> =C2=A0 =C2=A0 #include "qemu/osdep.h"
>>>> =C2=A0 #include "qapi/error.h"
>>>> +#include "qapi/qmp/qdict.h"
>>>> +#include "qapi/qapi-commands-virtio.h"
>>>> +#include "qapi/qapi-commands-qom.h"
>>>> +#include "qapi/qapi-visit-virtio.h"
>>>> +#include "qapi/qmp/qjson.h"
>>>> =C2=A0 #include "cpu.h"
>>>> =C2=A0 #include "trace.h"
>>>> =C2=A0 #include "qemu/error-report.h"
>>>> =C2=A0 #include "qemu/log.h"
>>>> =C2=A0 #include "qemu/main-loop.h"
>>>> =C2=A0 #include "qemu/module.h"
>>>> +#include "qom/object_interfaces.h"
>>>> =C2=A0 #include "hw/virtio/virtio.h"
>>>> =C2=A0 #include "migration/qemu-file-types.h"
>>>> =C2=A0 #include "qemu/atomic.h"
>>>> @@ -29,6 +35,9 @@
>>>> =C2=A0 #include "sysemu/runstate.h"
>>>> =C2=A0 #include "standard-headers/linux/virtio_ids.h"
>>>> =C2=A0 +/* QAPI list of realized VirtIODevices */
>>>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>>> +
>>>> =C2=A0 /*
>>>> =C2=A0=C2=A0 * The alignment to use between consumer and producer part=
s of vring.
>>>> =C2=A0=C2=A0 * x86 pagesize again. This is the default, used by transp=
orts like PCI
>>>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *d=
ev, Error **errp)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->listener.commit =3D virtio_memory=
_listener_commit;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->listener.name =3D "virtio";
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory_listener_register(&vdev->listene=
r, vdev->dma_as);
>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>>> =C2=A0 }
>>>> =C2=A0 =C2=A0 static void virtio_device_unrealize(DeviceState *dev)
>>>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState =
*dev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->unrealize(=
dev);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 QTAILQ_REMOVE(&virtio_list, vdev, next);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_free(vdev->bus_name);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdev->bus_name =3D NULL;
>>>> =C2=A0 }
>>>> @@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass=
 *klass, void *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->stop_ioeventfd =3D virtio_device_s=
top_ioeventfd_impl;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdc->legacy_features |=3D VIRTIO=
_LEGACY_FEATURES;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_INIT(&virtio_list);
>>>> =C2=A0 }
>>>> =C2=A0 =C2=A0 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>> @@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevi=
ce *vdev)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return virtio_bus_ioeventfd_enabled(vbu=
s);
>>>> =C2=A0 }
>>>> =C2=A0 +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 VirtioInfoList *list =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0 VirtioInfoList *node;
>>>> +=C2=A0=C2=A0=C2=A0 VirtIODevice *vdev;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEVIC=
E(vdev);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error *err =3D NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 QObject *obj =3D qmp_qom_g=
et(dev->canonical_path, "realized", &err);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err =3D=3D NULL) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GS=
tring *is_realized =3D qobject_to_json_pretty(obj, true);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*=
 virtio device is NOT realized, remove it from list */
>>>
>>> Why not check dev->realized instead of calling qmp_qom_get() & qobject_=
to_json_pretty()?
>>
>> This check queries the QOM composition tree to check that the device act=
ually exists and is
>> realized. In other words, we just want to confirm with the QOM compositi=
on tree for the device.

Again, how could this happen?

If @virtio_list isn't reliable, why have it in the first place?

>> This was done to have some kind of synchronicity between @virtio_list an=
d the QOM composition
>> tree, since the list duplicates information that already exists in the t=
ree.
>> This check was recommended in v10 and added in v11 of this patch series.
>
> Thanks, I found Markus comments:
>
> v10:
> https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/

My recommendation there was to *delete* virtio_list and search the QOM
composition tree instead:

    @virtio_list duplicates information that exists in the QOM composition
    tree.  It needs to stay in sync.  You could search the composition tree
    instead.=20

The QOM composition tree is the source of truth.

This above is about the command's implementation, and ...

> v11:
> https://lore.kernel.org/qemu-devel/87ee4abtdu.fsf@pond.sub.org/
>
> Having the justification from v11 in the code rather than the commit
> description could help.

... this part is about why the command could be useful.

[...]


