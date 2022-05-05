Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C447851C2D6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 16:46:24 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmckJ-0007tI-CC
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 10:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmcgk-0005yv-Rg
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:42:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:49010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmcgh-0000ts-RN
 for qemu-devel@nongnu.org; Thu, 05 May 2022 10:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651761758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyiWLiTEEGiRpnGFU2p0guTZ+DrhSOhGEL/qyiWNCFc=;
 b=Px1lzYBBt1IARo77WgZ6m3hdGNI1MY1d6mytFpmS8iEhtHANCiodIFY9TQPHSaUzOGstHj
 GMxM79goFQfSpLy7nmNsc3hCAvtFtmZvookpdnsAoFk4+fwcC2EMdfOpp21gWwdbSwQ9ee
 k+lXSKbIBfP003aQFk5kjSxN7MzeZCQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-JIkt-UtWOpe9x1y7OUvERA-1; Thu, 05 May 2022 10:42:35 -0400
X-MC-Unique: JIkt-UtWOpe9x1y7OUvERA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3B5299E74F;
 Thu,  5 May 2022 14:42:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9064010E2C;
 Thu,  5 May 2022 14:42:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2B96B21E6880; Thu,  5 May 2022 16:42:33 +0200 (CEST)
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
 <87k0b0zamn.fsf@pond.sub.org>
 <A0DB61EE-A8D2-4EBB-82E7-BC5F205C7051@oracle.com>
Date: Thu, 05 May 2022 16:42:33 +0200
In-Reply-To: <A0DB61EE-A8D2-4EBB-82E7-BC5F205C7051@oracle.com> (Jag Raman's
 message of "Thu, 5 May 2022 13:39:41 +0000")
Message-ID: <87y1zgqbvq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

>> On May 5, 2022, at 3:44 AM, Markus Armbruster <armbru@redhat.com> wrote:
>>=20
>> Jag Raman <jag.raman@oracle.com> writes:
>>=20
>>>> On May 4, 2022, at 7:42 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
>>>>=20
>>>> Jagannathan Raman <jag.raman@oracle.com> writes:
>>>>=20
>>>>> Setup a handler to run vfio-user context. The context is driven by
>>>>> messages to the file descriptor associated with it - get the fd for
>>>>> the context and hook up the handler with it
>>>>>=20
>>>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

[...]

>>>>> @@ -164,6 +172,76 @@ static void vfu_object_set_device(Object *obj, c=
onst char *str, Error **errp)
>>>>> vfu_object_init_ctx(o, errp);
>>>>> }
>>>>>=20
>>>>> +static void vfu_object_ctx_run(void *opaque)
>>>>> +{
>>>>> + VfuObject *o =3D opaque;
>>>>> + const char *vfu_id;
>>>>> + char *vfu_path, *pci_dev_path;
>>>>> + int ret =3D -1;
>>>>> +
>>>>> + while (ret !=3D 0) {
>>>>> + ret =3D vfu_run_ctx(o->vfu_ctx);
>>>>> + if (ret < 0) {
>>>>> + if (errno =3D=3D EINTR) {
>>>>> + continue;
>>>>> + } else if (errno =3D=3D ENOTCONN) {
>>>>> + vfu_id =3D object_get_canonical_path_component(OBJECT(o));
>>>>> + vfu_path =3D object_get_canonical_path(OBJECT(o));
>>>>=20
>>>> Hmm. @vfu_id is always the last component of @vfu_path. Why do we need
>>>> to send both?
>>>=20
>>> vfu_id is the ID that the user/Orchestrator passed as a command-line op=
tion
>>> during addition/creation. So it made sense to report back with the same=
 ID
>>> that they used. But I=E2=80=99m OK with dropping this if that=E2=80=99s=
 what you prefer.
>>=20
>> Matter of taste, I guess.  I'd drop it simply to saves us the trouble of
>> documenting it.
>>=20
>> If we decide to keep it, then I think we should document it's always the
>> last component of @vfu_path.
>>=20
>>>>> + g_assert(o->pci_dev);
>>>>> + pci_dev_path =3D object_get_canonical_path(OBJECT(o->pci_dev));
>>>>> + qapi_event_send_vfu_client_hangup(vfu_id, vfu_path,
>>>>> + o->device, pci_dev_path);
>>>>=20
>>>> Where is o->device set? I'm asking because I it must not be null here,
>>>> and that's not locally obvious.
>>>=20
>>> Yeah, it=E2=80=99s not obvious from this patch that o->device is guaran=
teed to be
>>> non-NULL. It=E2=80=99s set by vfu_object_set_device(). Please see the f=
ollowing
>>> patches in the series:
>>> vfio-user: define vfio-user-server object
>>> vfio-user: instantiate vfio-user context
>>=20
>> vfu_object_set_device() is a QOM property setter.  It gets called if and
>> only if the property is set.  If it's never set, ->device remains null.
>> What ensures it's always set?
>
> That=E2=80=99s a good question - it=E2=80=99s not obvious from this patch.
>
> The code would not reach here if o->device is not set. If o->device is NU=
LL,
> vfu_object_init_ctx() would bail out early without setting up
> vfu_object_attach_ctx() and vfu_object_ctx_run() (this function)
> handlers.

Yes:

    static void vfu_object_init_ctx(VfuObject *o, Error **errp)
    {
        ERRP_GUARD();
        DeviceState *dev =3D NULL;
        vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
        int ret;

        if (o->vfu_ctx || !o->socket || !o->device ||
                !phase_check(PHASE_MACHINE_READY)) {
            return;
        }

Bails out without setting an error.  Sure that's appropriate?

> Also, device is a required parameter. QEMU would not initialize this obje=
ct
> without it. Please see the definition of VfioUserServerProperties in the
> following patch - noting that optional parameters are prefixed with a =E2=
=80=98*=E2=80=99:
> [PATCH v9 07/17] vfio-user: define vfio-user-server object.
>
> May be we should add a comment here to explain why o->device
> wouldn=E2=80=99t be NULL?

Perhaps assertion with a comment explaining why it holds.

> Thank you!

You're welcome!


