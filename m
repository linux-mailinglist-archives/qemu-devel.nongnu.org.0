Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226D65D5D2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:35:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD4qE-0006OK-Lm; Wed, 04 Jan 2023 09:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+39aad489ac015f13314d+7073+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pD4pn-0006Ny-Bi
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:33:39 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+39aad489ac015f13314d+7073+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pD4pk-0008Mg-QP
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vhw7sKluNG6VaQU2QYgrpTBX/iKbDOLt4NVEpz4a3JY=; b=vChivVzzU5we2Scr1rRiPH1JSg
 LLPTk8MXZ16XPmmuh9FiaD/cxAgENLg46EusixFNB+a6wI/pVl4LZ9jk7BRAMWn5eSb9czXDGmGlW
 OjP16JGKXAbqPXs2RLJoRGGbP4iQtEpkt2ubZ+ZyTzNYApQw7R7Et9P0WYDzCUh8+zAC0NqH77djn
 FbyYgdw6ZJ9LB1dTVh1FpPf5PXw7GwB+MAnmy/Rsp0zxoDU3bSGct/VBqNDDQknxjKNhHkYOemQpy
 Hqv8/HFOzmHpTS5W2UUys7EZTlsPVF76cl91OiPt8nK/GxFNDlgmHKLvurDBJWrBto9oLWfaBUvxq
 6uHDH1mw==;
Received: from [185.81.162.228] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pD4pj-00F7OO-Sy; Wed, 04 Jan 2023 14:33:36 +0000
Date: Wed, 04 Jan 2023 14:33:22 +0000
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
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v5_50/52=5D_hw/xen=3A_Add_backend_imp?=
 =?US-ASCII?Q?lementation_of_interdomain_event_channel_support?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Y7VhWyGCCNz0+k+H@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-51-dwmw2@infradead.org> <Y7VhWyGCCNz0+k+H@work-vm>
Message-ID: <03D229F7-12B7-4AFE-9013-8717D039EF12@infradead.org>
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



On 4 January 2023 11:22:03 GMT, "Dr=2E David Alan Gilbert" <dgilbert@redha=
t=2Ecom> wrote:
>* David Woodhouse (dwmw2@infradead=2Eorg) wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> The provides the QEMU side of interdomain event channels, allowing even=
ts
>> to be sent to/from the guest=2E
>>=20
>> The API mirrors libxenevtchn, and in time both this and the real Xen on=
e
>> will be available through ops structures so that the PV backend drivers
>> can use the correct one as appropriate=2E
>>=20
>> For now, this implementation can be used directly by our XenStore which
>> will be for emulated mode only=2E
>>=20
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>  hw/i386/kvm/xen_evtchn=2Ec | 342 +++++++++++++++++++++++++++++++++++++=
--
>>  hw/i386/kvm/xen_evtchn=2Eh |  20 +++
>>  2 files changed, 353 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/hw/i386/kvm/xen_evtchn=2Ec b/hw/i386/kvm/xen_evtchn=2Ec
>> index 34c5199421=2E=2Ec0f6ef9dff 100644
>> --- a/hw/i386/kvm/xen_evtchn=2Ec
>> +++ b/hw/i386/kvm/xen_evtchn=2Ec
>> @@ -35,6 +35,7 @@
>>  #include "sysemu/kvm=2Eh"
>>  #include "sysemu/kvm_xen=2Eh"
>>  #include <linux/kvm=2Eh>
>> +#include <sys/eventfd=2Eh>
>> =20
>>  #include "standard-headers/xen/memory=2Eh"
>>  #include "standard-headers/xen/hvm/params=2Eh"
>> @@ -85,6 +86,13 @@ struct compat_shared_info {
>> =20
>>  #define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
>> =20
>> +/* Local private implementation of struct xenevtchn_handle */
>> +struct xenevtchn_handle {
>> +    evtchn_port_t be_port;
>> +    evtchn_port_t guest_port; /* Or zero for unbound */
>> +    int fd;
>> +};
>> +
>>  /*
>>   * For unbound/interdomain ports there are only two possible remote
>>   * domains; self and QEMU=2E Use a single high bit in type_val for tha=
t,
>> @@ -93,8 +101,6 @@ struct compat_shared_info {
>>  #define PORT_INFO_TYPEVAL_REMOTE_QEMU           0x8000
>>  #define PORT_INFO_TYPEVAL_REMOTE_PORT_MASK      0x7FFF
>> =20
>> -#define DOMID_QEMU      0
>> -
>>  struct XenEvtchnState {
>>      /*< private >*/
>>      SysBusDevice busdev;
>> @@ -108,6 +114,8 @@ struct XenEvtchnState {
>>      uint32_t nr_ports;
>>      XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
>>      qemu_irq gsis[GSI_NUM_PINS];
>> +
>> +    struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
>>  };
>> =20
>>  struct XenEvtchnState *xen_evtchn_singleton;
>> @@ -115,6 +123,18 @@ struct XenEvtchnState *xen_evtchn_singleton;
>>  /* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xx=
x) */
>>  #define CALLBACK_VIA_TYPE_SHIFT 56
>> =20
>> +static void unbind_backend_ports(XenEvtchnState *s);
>> +
>> +static int xen_evtchn_pre_load(void *opaque)
>> +{
>> +    XenEvtchnState *s =3D opaque;
>> +
>> +    /* Unbind all the backend-side ports; they need to rebind */
>> +    unbind_backend_ports(s);
>> +
>> +    return 0;
>> +}
>> +
>>  static int xen_evtchn_post_load(void *opaque, int version_id)
>>  {
>>      XenEvtchnState *s =3D opaque;
>> @@ -148,6 +168,7 @@ static const VMStateDescription xen_evtchn_vmstate =
=3D {
>>      =2Eversion_id =3D 1,
>>      =2Eminimum_version_id =3D 1,
>>      =2Eneeded =3D xen_evtchn_is_needed,
>> +    =2Epre_load =3D xen_evtchn_pre_load,
>>      =2Epost_load =3D xen_evtchn_post_load,
>>      =2Efields =3D (VMStateField[]) {
>>          VMSTATE_UINT64(callback_param, XenEvtchnState),
>> @@ -362,6 +383,20 @@ static int assign_kernel_port(uint16_t type, evtch=
n_port_t port,
>>      return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
>>  }
>> =20
>> +static int assign_kernel_eventfd(uint16_t type, evtchn_port_t port, in=
t fd)
>> +{
>> +    struct kvm_xen_hvm_attr ha;
>> +
>> +    ha=2Etype =3D KVM_XEN_ATTR_TYPE_EVTCHN;
>> +    ha=2Eu=2Eevtchn=2Esend_port =3D port;
>> +    ha=2Eu=2Eevtchn=2Etype =3D type;
>> +    ha=2Eu=2Eevtchn=2Eflags =3D 0;
>> +    ha=2Eu=2Eevtchn=2Edeliver=2Eeventfd=2Eport =3D 0;
>> +    ha=2Eu=2Eevtchn=2Edeliver=2Eeventfd=2Efd =3D fd;
>> +
>> +    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
>> +}
>> +
>>  static bool valid_port(evtchn_port_t port)
>>  {
>>      if (!port) {
>> @@ -380,6 +415,32 @@ static bool valid_vcpu(uint32_t vcpu)
>>      return !!qemu_get_cpu(vcpu);
>>  }
>> =20
>> +static void unbind_backend_ports(XenEvtchnState *s)
>> +{
>> +    XenEvtchnPort *p;
>> +    int i;
>> +
>> +    for (i =3D 1; i <=3D s->nr_ports; i++) {
>> +        p =3D &s->port_table[i];
>> +        if (p->type =3D=3D EVTCHNSTAT_interdomain &&
>> +            (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ) {
>> +            evtchn_port_t be_port =3D p->type_val & PORT_INFO_TYPEVAL_=
REMOTE_PORT_MASK;
>> +
>> +            if (s->be_handles[be_port]) {
>> +                /* This part will be overwritten on the load anyway=2E=
 */
>> +                p->type =3D EVTCHNSTAT_unbound;
>> +                p->type_val =3D PORT_INFO_TYPEVAL_REMOTE_QEMU;
>> +
>> +                /* Leave the backend port open and unbound too=2E */
>> +                if (kvm_xen_has_cap(EVTCHN_SEND)) {
>> +                    deassign_kernel_port(i);
>> +                }
>> +                s->be_handles[be_port]->guest_port =3D 0;
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>  int xen_evtchn_status_op(struct evtchn_status *status)
>>  {
>>      XenEvtchnState *s =3D xen_evtchn_singleton;
>> @@ -815,7 +876,14 @@ static int close_port(XenEvtchnState *s, evtchn_po=
rt_t port)
>> =20
>>      case EVTCHNSTAT_interdomain:
>>          if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
>> -            /* Not yet implemented=2E This can't happen! */
>> +            uint16_t be_port =3D p->type_val & ~PORT_INFO_TYPEVAL_REMO=
TE_QEMU;
>> +            struct xenevtchn_handle *xc =3D s->be_handles[be_port];
>> +            if (xc) {
>> +                if (kvm_xen_has_cap(EVTCHN_SEND)) {
>> +                    deassign_kernel_port(port);
>> +                }
>> +                xc->guest_port =3D 0;
>> +            }
>>          } else {
>>              /* Loopback interdomain */
>>              XenEvtchnPort *rp =3D &s->port_table[p->type_val];
>> @@ -1047,8 +1115,27 @@ int xen_evtchn_bind_interdomain_op(struct evtchn=
_bind_interdomain *interdomain)
>>      }
>> =20
>>      if (interdomain->remote_dom =3D=3D DOMID_QEMU) {
>> -        /* We haven't hooked up QEMU's PV drivers to this yet */
>> -        ret =3D -ENOSYS;
>> +        struct xenevtchn_handle *xc =3D s->be_handles[interdomain->rem=
ote_port];
>> +        XenEvtchnPort *lp =3D &s->port_table[interdomain->local_port];
>> +
>> +        if (!xc) {
>> +            ret =3D -ENOENT;
>> +            goto out_free_port;
>> +        }
>> +
>> +        if (xc->guest_port) {
>> +            ret =3D -EBUSY;
>> +            goto out_free_port;
>> +        }
>> +
>> +        assert(xc->be_port =3D=3D interdomain->remote_port);
>> +        xc->guest_port =3D interdomain->local_port;
>> +        if (kvm_xen_has_cap(EVTCHN_SEND)) {
>> +            assign_kernel_eventfd(lp->type, xc->guest_port, xc->fd);
>> +        }
>> +        lp->type =3D EVTCHNSTAT_interdomain;
>> +        lp->type_val =3D PORT_INFO_TYPEVAL_REMOTE_QEMU | interdomain->=
remote_port;
>> +        ret =3D 0;
>>      } else {
>>          /* Loopback */
>>          XenEvtchnPort *rp =3D &s->port_table[interdomain->remote_port]=
;
>> @@ -1066,6 +1153,7 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_=
bind_interdomain *interdomain)
>>          }
>>      }
>> =20
>> + out_free_port:
>>      if (ret) {
>>          free_port(s, interdomain->local_port);
>>      }
>> @@ -1130,11 +1218,16 @@ int xen_evtchn_send_op(struct evtchn_send *send=
)
>>          if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
>>              /*
>>               * This is an event from the guest to qemu itself, which i=
s
>> -             * serving as the driver domain=2E Not yet implemented; it=
 will
>> -             * be hooked up to the qemu implementation of xenstore,
>> -             * console, PV net/block drivers etc=2E
>> +             * serving as the driver domain=2E
>>               */
>> -            ret =3D -ENOSYS;
>> +            uint16_t be_port =3D p->type_val & ~PORT_INFO_TYPEVAL_REMO=
TE_QEMU;
>> +            struct xenevtchn_handle *xc =3D s->be_handles[be_port];
>> +            if (xc) {
>> +                eventfd_write(xc->fd, 1);
>> +                ret =3D 0;
>> +            } else {
>> +                ret =3D -ENOENT;
>> +            }
>>          } else {
>>              /* Loopback interdomain ports; just a complex IPI */
>>              set_port_pending(s, p->type_val);
>> @@ -1190,6 +1283,237 @@ int xen_evtchn_set_port(uint16_t port)
>>      return ret;
>>  }
>> =20
>> +struct xenevtchn_handle *xen_be_evtchn_open(void *logger, unsigned int=
 flags)
>> +{
>> +    struct xenevtchn_handle *xc =3D g_new0(struct xenevtchn_handle, 1)=
;
>> +
>> +    xc->fd =3D eventfd(0, EFD_CLOEXEC);
>> +    if (xc->fd < 0) {
>> +        free(xc);
>> +        return NULL;
>> +    }
>> +
>> +    return xc;
>> +}
>> +
>> +static int find_be_port(XenEvtchnState *s, struct xenevtchn_handle *xc=
)
>> +{
>> +    int i;
>> +
>> +    for (i =3D 25; valid_port(i); i++) {
>
>Magic 25 number ?

Ah, yes, I kept meaning to remove that=2E Was just for testing that I had =
remote vs=2E local port correct by ensuring the numbers were actually diffe=
rent=2E Really will remember to kill it and start the qemu-side numbering f=
rom 1 next time round!

