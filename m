Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B051B973
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:48:07 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWDW-0004TI-TA
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmWB8-0003ai-Ix
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:45:38 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:43156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmWB6-0001V3-QJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651736734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS2kOKKeybUZmGbG8yjBftIRd8rq1ctq+VwMMntLL+c=;
 b=CUuMISVqAvGZknnJCrxcqrZ2zA1xwWRodzvEf2DNCzYfuppriGpu9eMBWEiFBYZ/hTcj5L
 PrlU8os/VIpjLij3KWyqjw72NsxYahX31MW9S5NiQzfgurFPD6xxyb7IwVwwyL8hwUe+jf
 pGfxyxFgw1RZMcEO722rrB1+zCHG1W8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-HpdqrqMdOpO8NXci_yIYSA-1; Thu, 05 May 2022 03:45:29 -0400
X-MC-Unique: HpdqrqMdOpO8NXci_yIYSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EED261C08960;
 Thu,  5 May 2022 07:45:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8542026D6A;
 Thu,  5 May 2022 07:44:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37C6B21E6880; Thu,  5 May 2022 09:44:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>,  "pbonzini@redhat.com"
 <pbonzini@redhat.com>,  "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>,  "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,  "berrange@redhat.com"
 <berrange@redhat.com>,  "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,  "quintela@redhat.com"
 <quintela@redhat.com>,  "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,  "peterx@redhat.com"
 <peterx@redhat.com>,  "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,  Elena
 Ufimtseva <elena.ufimtseva@oracle.com>,  John Johnson
 <john.g.johnson@oracle.com>,  Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 10/17] vfio-user: run vfio-user context
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7350f4813b73af783965b758ecf39d0a6a76db53.1651586203.git.jag.raman@oracle.com>
 <877d717cd2.fsf@pond.sub.org>
 <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com>
Date: Thu, 05 May 2022 09:44:48 +0200
In-Reply-To: <86AE24D4-C203-491D-9FBF-BEE748A52E2C@oracle.com> (Jag Raman's
 message of "Wed, 4 May 2022 15:22:30 +0000")
Message-ID: <87k0b0zamn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Jag Raman <jag.raman@oracle.com> writes:

>> On May 4, 2022, at 7:42 AM, Markus Armbruster <armbru@redhat.com> wrote:
>>=20
>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>=20
>>> Setup a handler to run vfio-user context. The context is driven by
>>> messages to the file descriptor associated with it - get the fd for
>>> the context and hook up the handler with it
>>>=20
>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> qapi/misc.json | 30 +++++++++++
>>> hw/remote/vfio-user-obj.c | 102 +++++++++++++++++++++++++++++++++++++-
>>> 2 files changed, 131 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/qapi/misc.json b/qapi/misc.json
>>> index b83cc39029..fa49f2876a 100644
>>> --- a/qapi/misc.json
>>> +++ b/qapi/misc.json
>>> @@ -553,3 +553,33 @@
>>> ##
>>> { 'event': 'RTC_CHANGE',
>>> 'data': { 'offset': 'int', 'qom-path': 'str' } }
>>> +
>>> +##
>>> +# @VFU_CLIENT_HANGUP:
>>> +#
>>> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
>>> +# communication channel
>>> +#
>>> +# @vfu-id: ID of the TYPE_VFIO_USER_SERVER object
>>> +#
>>> +# @vfu-qom-path: path to the TYPE_VFIO_USER_SERVER object in the QOM t=
ree
>>> +#
>>> +# @dev-id: ID of attached PCI device
>>> +#
>>> +# @dev-qom-path: path to attached PCI device in the QOM tree
>>=20
>> I'm still unsure what kind(s) of ID @vfu-id and @dev-id are. See below.
>
> I=E2=80=99m not sure what you mean by kind of ID - I thought of ID as a
> unique string. I=E2=80=99ll try my best to explain.

Okay, let me try to clarify.

We have many, many ID namespaces, each associated with a certain kind of
object: device IDs for TYPE_DEVICE, object IDs for TYPE_OBJECT
implementing TYPE_USER_CREATABLE), block backend node names for
BlockDriverState, ...

Aside: I believe a single namespace would have been a wiser design
choice, but that ship sailed long ago.

To which of these namespaces do these two IDs belong, respectively?

> dev-id and vfu-id are the =E2=80=9Cid" sub-options of =E2=80=9C-device=E2=
=80=9D and =E2=80=9C-object=E2=80=9D command-line
> options respectively.

This answers my question.

> "dev-id=E2=80=9D is the =E2=80=9Cid=E2=80=9D member of =E2=80=9CDeviceSta=
te=E2=80=9D which QEMU sets using
> qdev_set_id() when the device is added.=20
>
> The Object ID (vfu-id in this case) is a bit tricky. It=E2=80=99s also th=
e =E2=80=9Cid=E2=80=9D
> command-line sub-option, but QEMU stores it as a child property
> of the parent object.
>
>>=20
>>> +#
>>> +# Since: 7.1
>>> +#
>>> +# Example:
>>> +#
>>> +# <- { "event": "VFU_CLIENT_HANGUP",
>>> +# "data": { "vfu-id": "vfu1",
>>> +# "vfu-qom-path": "/objects/vfu1",
>>> +# "dev-id": "sas1",
>>> +# "dev-qom-path": "/machine/peripheral/sas1" },
>>> +# "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>>> +#
>>> +##
>>> +{ 'event': 'VFU_CLIENT_HANGUP',
>>> + 'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
>>> + 'dev-id': 'str', 'dev-qom-path': 'str' } }
>>> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
>>> index 3ca6aa2b45..3a4c6a9fa0 100644
>>> --- a/hw/remote/vfio-user-obj.c
>>> +++ b/hw/remote/vfio-user-obj.c
>>> @@ -27,6 +27,9 @@
>>> *
>>> * device - id of a device on the server, a required option. PCI devices
>>> * alone are supported presently.
>>> + *
>>> + * notes - x-vfio-user-server could block IO and monitor during the
>>> + * initialization phase.
>>> */
>>>=20
>>> #include "qemu/osdep.h"
>>> @@ -40,11 +43,14 @@
>>> #include "hw/remote/machine.h"
>>> #include "qapi/error.h"
>>> #include "qapi/qapi-visit-sockets.h"
>>> +#include "qapi/qapi-events-misc.h"
>>> #include "qemu/notify.h"
>>> +#include "qemu/thread.h"
>>> #include "sysemu/sysemu.h"
>>> #include "libvfio-user.h"
>>> #include "hw/qdev-core.h"
>>> #include "hw/pci/pci.h"
>>> +#include "qemu/timer.h"
>>>=20
>>> #define TYPE_VFU_OBJECT "x-vfio-user-server"
>>> OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
>>> @@ -86,6 +92,8 @@ struct VfuObject {
>>> PCIDevice *pci_dev;
>>>=20
>>> Error *unplug_blocker;
>>> +
>>> + int vfu_poll_fd;
>>> };
>>>=20
>>> static void vfu_object_init_ctx(VfuObject *o, Error **errp);
>>> @@ -164,6 +172,76 @@ static void vfu_object_set_device(Object *obj, con=
st char *str, Error **errp)
>>> vfu_object_init_ctx(o, errp);
>>> }
>>>=20
>>> +static void vfu_object_ctx_run(void *opaque)
>>> +{
>>> + VfuObject *o =3D opaque;
>>> + const char *vfu_id;
>>> + char *vfu_path, *pci_dev_path;
>>> + int ret =3D -1;
>>> +
>>> + while (ret !=3D 0) {
>>> + ret =3D vfu_run_ctx(o->vfu_ctx);
>>> + if (ret < 0) {
>>> + if (errno =3D=3D EINTR) {
>>> + continue;
>>> + } else if (errno =3D=3D ENOTCONN) {
>>> + vfu_id =3D object_get_canonical_path_component(OBJECT(o));
>>> + vfu_path =3D object_get_canonical_path(OBJECT(o));
>>=20
>> Hmm. @vfu_id is always the last component of @vfu_path. Why do we need
>> to send both?
>
> vfu_id is the ID that the user/Orchestrator passed as a command-line opti=
on
> during addition/creation. So it made sense to report back with the same ID
> that they used. But I=E2=80=99m OK with dropping this if that=E2=80=99s w=
hat you prefer.

Matter of taste, I guess.  I'd drop it simply to saves us the trouble of
documenting it.

If we decide to keep it, then I think we should document it's always the
last component of @vfu_path.

>>> + g_assert(o->pci_dev);
>>> + pci_dev_path =3D object_get_canonical_path(OBJECT(o->pci_dev));
>>> + qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
>>> + o->device, pci_dev_path);
>>=20
>> Where is o->device set? I'm asking because I it must not be null here,
>> and that's not locally obvious.
>
> Yeah, it=E2=80=99s not obvious from this patch that o->device is guarante=
ed to be
> non-NULL. It=E2=80=99s set by vfu_object_set_device(). Please see the fol=
lowing
> patches in the series:
> vfio-user: define vfio-user-server object
> vfio-user: instantiate vfio-user context

vfu_object_set_device() is a QOM property setter.  It gets called if and
only if the property is set.  If it's never set, ->device remains null.
What ensures it's always set?

> There=E2=80=99s already an assert for o->pci_dev here, but we could add o=
ne
> for o->device too?

I'll make up my mind when I'm convinced o->device can't be null here.

> Thank you!

You're welcome!


