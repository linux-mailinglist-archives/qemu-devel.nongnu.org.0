Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C506765D5D3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:36:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4rk-0007Wv-7x; Wed, 04 Jan 2023 09:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+39aad489ac015f13314d+7073+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pD4rg-0007WR-1x
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:35:36 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+39aad489ac015f13314d+7073+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pD4re-0000On-1d
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=x7OUSUHbsIl2lwpu6+MbtMMSWoZMoZKDzyAFlrHCCsw=; b=t5Wa+ZWrSo4EA0MiK/kHTyXt8m
 iKX3ZWPVxjhPD031//DP8HJLm/ERDl0rzf/o7o3lFMSitTXApr9yd3ZjvWy8oxwvWeUnjJYyO9gXH
 o1WQMgmAXXhBgy0o4bHJbjrI7zIe0tDCfgsmoAgDsGaHGgqbZeLwe2GQUtZdsbKbnNc87kkPQZI8j
 W84jrKdXXttQ4vrujsRujVB4ANnBVSbcn9EcSDDxcGCyliF/ESzUVdRMZ1VPmQPCfxbAhtngbu99Z
 0/9byMIfilcfDcQpY9nAGvLwnqeXw6OISVcOPQRDycFGwryywa02SoD+AsPvyI4jc/RhaKx2VR5Cc
 nRdZlG6g==;
Received: from [185.81.162.228] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pD4rn-00F7VQ-Dc; Wed, 04 Jan 2023 14:35:43 +0000
Date: Wed, 04 Jan 2023 14:35:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Julien Grall <julien@xen.org>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v5_51/52=5D_hw/xen=3A_Add_xe?=
 =?US-ASCII?Q?n=5Fxenstore_device_for_xenstore_emulation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y7VqsgBgK5XYkvzE@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-52-dwmw2@infradead.org> <Y7VqsgBgK5XYkvzE@work-vm>
Message-ID: <775B5623-223F-4CF7-96CB-C1C7AF1082AD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+39aad489ac015f13314d+7073+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On 4 January 2023 12:01:54 GMT, "Dr=2E David Alan Gilbert" <dgilbert@redha=
t=2Ecom> wrote:
>* David Woodhouse (dwmw2@infradead=2Eorg) wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> The hookup to event channel is a bit of a special case hack right now; =
as
>> we make this work for real PV driver back ends, that will be implemente=
d
>> for the general case of Dom0 ports binding to DomU=2E
>>=20
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>  hw/i386/kvm/meson=2Ebuild    |   1 +
>>  hw/i386/kvm/xen_evtchn=2Ec   |   1 +
>>  hw/i386/kvm/xen_xenstore=2Ec | 248 +++++++++++++++++++++++++++++++++++=
++
>>  hw/i386/kvm/xen_xenstore=2Eh |  20 +++
>>  hw/i386/pc=2Ec               |   2 +
>>  target/i386/kvm/xen-emu=2Ec  |  12 ++
>>  6 files changed, 284 insertions(+)
>>  create mode 100644 hw/i386/kvm/xen_xenstore=2Ec
>>  create mode 100644 hw/i386/kvm/xen_xenstore=2Eh
>>=20
>> diff --git a/hw/i386/kvm/meson=2Ebuild b/hw/i386/kvm/meson=2Ebuild
>> index e02449e4d4=2E=2E6d6981fced 100644
>> --- a/hw/i386/kvm/meson=2Ebuild
>> +++ b/hw/i386/kvm/meson=2Ebuild
>> @@ -8,6 +8,7 @@ i386_kvm_ss=2Eadd(when: 'CONFIG_XEN_EMU', if_true: file=
s(
>>    'xen_overlay=2Ec',
>>    'xen_evtchn=2Ec',
>>    'xen_gnttab=2Ec',
>> +  'xen_xenstore=2Ec',
>>    ))
>> =20
>>  i386_ss=2Eadd_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
>> diff --git a/hw/i386/kvm/xen_evtchn=2Ec b/hw/i386/kvm/xen_evtchn=2Ec
>> index c0f6ef9dff=2E=2E0653cad3bb 100644
>> --- a/hw/i386/kvm/xen_evtchn=2Ec
>> +++ b/hw/i386/kvm/xen_evtchn=2Ec
>> @@ -31,6 +31,7 @@
>> =20
>>  #include "xen_evtchn=2Eh"
>>  #include "xen_overlay=2Eh"
>> +#include "xen_xenstore=2Eh"
>> =20
>>  #include "sysemu/kvm=2Eh"
>>  #include "sysemu/kvm_xen=2Eh"
>> diff --git a/hw/i386/kvm/xen_xenstore=2Ec b/hw/i386/kvm/xen_xenstore=2E=
c
>> new file mode 100644
>> index 0000000000=2E=2E63530059fa
>> --- /dev/null
>> +++ b/hw/i386/kvm/xen_xenstore=2Ec
>> @@ -0,0 +1,248 @@
>> +/*
>> + * QEMU Xen emulation: Shared/overlay pages support
>> + *
>> + * Copyright =C2=A9 2022 Amazon=2Ecom, Inc=2E or its affiliates=2E All=
 Rights Reserved=2E
>> + *
>> + * Authors: David Woodhouse <dwmw2@infradead=2Eorg>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later=2E
>> + * See the COPYING file in the top-level directory=2E
>> + */
>> +
>> +#include "qemu/osdep=2Eh"
>> +
>> +#include "qemu/host-utils=2Eh"
>> +#include "qemu/module=2Eh"
>> +#include "qemu/main-loop=2Eh"
>> +#include "qemu/cutils=2Eh"
>> +#include "qapi/error=2Eh"
>> +#include "qom/object=2Eh"
>> +#include "migration/vmstate=2Eh"
>> +
>> +#include "hw/sysbus=2Eh"
>> +#include "hw/xen/xen=2Eh"
>> +#include "xen_overlay=2Eh"
>> +#include "xen_evtchn=2Eh"
>> +#include "xen_xenstore=2Eh"
>> +
>> +#include "sysemu/kvm=2Eh"
>> +#include "sysemu/kvm_xen=2Eh"
>> +
>> +#include "standard-headers/xen/io/xs_wire=2Eh"
>> +#include "standard-headers/xen/event_channel=2Eh"
>> +
>> +#define TYPE_XEN_XENSTORE "xen-xenstore"
>> +OBJECT_DECLARE_SIMPLE_TYPE(XenXenstoreState, XEN_XENSTORE)
>> +
>> +#define XEN_PAGE_SHIFT 12
>> +#define XEN_PAGE_SIZE (1ULL << XEN_PAGE_SHIFT)
>> +
>> +#define ENTRIES_PER_FRAME_V1 (XEN_PAGE_SIZE / sizeof(grant_entry_v1_t)=
)
>> +#define ENTRIES_PER_FRAME_V2 (XEN_PAGE_SIZE / sizeof(grant_entry_v2_t)=
)
>> +
>> +#define XENSTORE_HEADER_SIZE ((unsigned int)sizeof(struct xsd_sockmsg)=
)
>> +
>> +struct XenXenstoreState {
>> +    /*< private >*/
>> +    SysBusDevice busdev;
>> +    /*< public >*/
>> +
>> +    MemoryRegion xenstore_page;
>> +    struct xenstore_domain_interface *xs;
>> +    uint8_t req_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
>> +    uint8_t rsp_data[XENSTORE_HEADER_SIZE + XENSTORE_PAYLOAD_MAX];
>> +    uint32_t req_offset;
>> +    uint32_t rsp_offset;
>> +    bool rsp_pending;
>> +    bool fatal_error;
>> +
>> +    evtchn_port_t guest_port;
>> +    evtchn_port_t be_port;
>> +    struct xenevtchn_handle *eh;
>> +};
>> +
>> +struct XenXenstoreState *xen_xenstore_singleton;
>> +
>> +static void xen_xenstore_event(void *opaque);
>> +
>> +static void xen_xenstore_realize(DeviceState *dev, Error **errp)
>> +{
>> +    XenXenstoreState *s =3D XEN_XENSTORE(dev);
>> +
>> +    if (xen_mode !=3D XEN_EMULATE) {
>> +        error_setg(errp, "Xen xenstore support is for Xen emulation");
>> +        return;
>> +    }
>> +    memory_region_init_ram(&s->xenstore_page, OBJECT(dev), "xen:xensto=
re_page",
>> +                           XEN_PAGE_SIZE, &error_abort);
>> +    memory_region_set_enabled(&s->xenstore_page, true);
>> +    s->xs =3D memory_region_get_ram_ptr(&s->xenstore_page);
>> +    memset(s->xs, 0, XEN_PAGE_SIZE);
>> +
>> +    /* We can't map it this early as KVM isn't ready */
>> +    xen_xenstore_singleton =3D s;
>> +
>> +    s->eh =3D xen_be_evtchn_open(NULL, 0);
>> +    if (!s->eh) {
>> +        error_setg(errp, "Xenstore evtchn port init failed");
>> +        return;
>> +    }
>> +    aio_set_fd_handler(qemu_get_aio_context(), xen_be_evtchn_fd(s->eh)=
, true,
>> +                       xen_xenstore_event, NULL, NULL, NULL, s);
>> +}
>> +
>> +static bool xen_xenstore_is_needed(void *opaque)
>> +{
>> +    return xen_mode =3D=3D XEN_EMULATE;
>> +}
>> +
>> +static int xen_xenstore_pre_save(void *opaque)
>> +{
>> +    XenXenstoreState *s =3D opaque;
>> +
>> +    if (s->eh) {
>> +        s->guest_port =3D xen_be_evtchn_get_guest_port(s->eh);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int xen_xenstore_post_load(void *opaque, int ver)
>> +{
>> +    XenXenstoreState *s =3D opaque;
>> +
>> +    /*
>> +     * As qemu/dom0, rebind to the guest's port=2E The Windows drivers=
 may
>> +     * unbind the XenStore evtchn and rebind to it, having obtained th=
e
>> +     * "remote" port through EVTCHNOP_status=2E In the case that migra=
tion
>> +     * occurs while it's unbound, the "remote" port needs to be the sa=
me
>> +     * as before so that the guest can find it, but should remain unbo=
und=2E
>> +     */
>> +    if (s->guest_port) {
>> +        int be_port =3D xen_be_evtchn_bind_interdomain(s->eh, xen_domi=
d, s->guest_port);
>> +        if (be_port < 0) {
>> +            return be_port;
>> +        }
>> +        s->be_port =3D be_port;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription xen_xenstore_vmstate =3D {
>> +    =2Ename =3D "xen_xenstore",
>> +    =2Eversion_id =3D 1,
>> +    =2Eminimum_version_id =3D 1,
>> +    =2Eneeded =3D xen_xenstore_is_needed,
>> +    =2Epre_save =3D xen_xenstore_pre_save,
>> +    =2Epost_load =3D xen_xenstore_post_load,
>> +    =2Efields =3D (VMStateField[]) {
>> +        VMSTATE_UINT8_ARRAY(req_data, XenXenstoreState, sizeof_field(X=
enXenstoreState, req_data)),
>> +        VMSTATE_UINT8_ARRAY(rsp_data, XenXenstoreState, sizeof_field(X=
enXenstoreState, rsp_data)),
>> +        VMSTATE_UINT32(req_offset, XenXenstoreState),
>> +        VMSTATE_UINT32(rsp_offset, XenXenstoreState),
>> +        VMSTATE_BOOL(rsp_pending, XenXenstoreState),
>> +        VMSTATE_UINT32(guest_port, XenXenstoreState),
>> +        VMSTATE_BOOL(fatal_error, XenXenstoreState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void xen_xenstore_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D xen_xenstore_realize;
>> +    dc->vmsd =3D &xen_xenstore_vmstate;
>> +}
>> +
>> +static const TypeInfo xen_xenstore_info =3D {
>> +    =2Ename          =3D TYPE_XEN_XENSTORE,
>> +    =2Eparent        =3D TYPE_SYS_BUS_DEVICE,
>> +    =2Einstance_size =3D sizeof(XenXenstoreState),
>> +    =2Eclass_init    =3D xen_xenstore_class_init,
>> +};
>> +
>> +void xen_xenstore_create(void)
>> +{
>> +    xen_xenstore_singleton =3D XEN_XENSTORE(sysbus_create_simple(TYPE_=
XEN_XENSTORE,
>> +                                                           -1, NULL));
>> +
>> +    /*
>> +     * Defer the init (xen_xenstore_reset()) until KVM is set up and t=
he
>> +     * overlay page can be mapped=2E
>> +     */
>> +}
>> +
>> +static void xen_xenstore_register_types(void)
>> +{
>> +    type_register_static(&xen_xenstore_info);
>> +}
>> +
>> +type_init(xen_xenstore_register_types)
>> +
>> +uint16_t xen_xenstore_get_port(void)
>> +{
>> +    XenXenstoreState *s =3D xen_xenstore_singleton;
>> +    if (!s) {
>> +        return 0;
>> +    }
>> +    return s->guest_port;
>> +}
>> +
>> +static void xen_xenstore_event(void *opaque)
>> +{
>> +    XenXenstoreState *s =3D opaque;
>> +    evtchn_port_t port =3D xen_be_evtchn_pending(s->eh);
>> +    if (port !=3D s->be_port) {
>> +        return;
>> +    }
>> +    printf("xenstore event\n");
>> +    /* We know this is a no-op=2E */
>> +    xen_be_evtchn_unmask(s->eh, port);
>> +    qemu_hexdump(stdout, "", s->xs, sizeof(*s->xs));
>
>debug ?

Perhaps, but it goes away in the next patch anyway, and Paul is working on=
 something that actually works (instead of just returning ENOSYS to everyth=
ing)=2E


