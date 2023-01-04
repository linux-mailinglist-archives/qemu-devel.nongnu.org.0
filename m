Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9EC65D155
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:24:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD1qZ-0001k9-7h; Wed, 04 Jan 2023 06:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD1qX-0001jt-MF
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD1qV-00009U-1T
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 06:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672831329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qo4lDBkop1bRocN3/GHhzKnLA4N3FXba8mO2MJ9+51A=;
 b=ZGOQVXgD8UB/0PCBzA1CFbs/D+MoOnPKkWqi+6XydTVkhzT7cQQthz6RhIjNc8Jlz5Sadb
 yhBLJrdH1y+OVMAPkS9kJEdisF2FdD1/N/4cFiJ/c0F6tvvORMpk0Sy4TWOix8nHftkpBW
 mNGJxRFvkGBqG3f9n7mjNg529CRU+Rc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-96-MMoIvq3UMtemlrm6aQFL1A-1; Wed, 04 Jan 2023 06:22:08 -0500
X-MC-Unique: MMoIvq3UMtemlrm6aQFL1A-1
Received: by mail-wr1-f72.google.com with SMTP id
 h24-20020adfaa98000000b0028abfe5b8d9so2005452wrc.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qo4lDBkop1bRocN3/GHhzKnLA4N3FXba8mO2MJ9+51A=;
 b=2RdwmTz9a72elTd0+cFGtbVHSslxbX9/a/FP8RNZmJtUk0CYeB5K+dFbtkHMcS7XG7
 KG1gC+mBGKjsi3sYEOpue8eMPUmLCD84ZgRJEhtdjDWLUabxdUVmnSdWAcgIOC9ZMBQo
 iFLdw2TXxfL2wTRRpu0aLg4hwz0e7gzRpZmjw5cRDgrpW12aQbhqrvJO64pVZkjhgqIE
 +0OCIJ7jR4QjEiUD5ZqSauBXEvSfYq3rIxv7qcoOWZiNI586a9PCADtzCDIfN8469K/3
 KPwrntaa5O8yt9ySAP6mHDZYqbAZSMFBRCPqNKu7mLux/GR9b+q3zl8LpTUYM4aWexfJ
 /yMg==
X-Gm-Message-State: AFqh2krulw1jK+QSndZJW5MW16+dGt1pMfRbU4U/83Ke4AWAyR+tH5Zy
 dwdQoPOIa9o2GIjv8i3r8+p6XMO+zBG8dnHVk6jvZw7vr5GlKi/rkS4ebxva+XPeq+dCV2sV+/y
 5Nh4SXQnSnbEIQb8=
X-Received: by 2002:a05:600c:34ca:b0:3d6:80b5:f948 with SMTP id
 d10-20020a05600c34ca00b003d680b5f948mr33785288wmq.39.1672831327103; 
 Wed, 04 Jan 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYFfbrj/9dQv5O1BYW+rxhaWgMr/uJNQ221wqEvH1ClgtBBGyRdNvq84aRACshPcymfHeOUQ==
X-Received: by 2002:a05:600c:34ca:b0:3d6:80b5:f948 with SMTP id
 d10-20020a05600c34ca00b003d680b5f948mr33785261wmq.39.1672831326783; 
 Wed, 04 Jan 2023 03:22:06 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 ay39-20020a05600c1e2700b003cfa80443a0sm45286690wmb.35.2023.01.04.03.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 03:22:06 -0800 (PST)
Date: Wed, 4 Jan 2023 11:22:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v5 50/52] hw/xen: Add backend implementation of
 interdomain event channel support
Message-ID: <Y7VhWyGCCNz0+k+H@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-51-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230121235.1282915-51-dwmw2@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* David Woodhouse (dwmw2@infradead.org) wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The provides the QEMU side of interdomain event channels, allowing events
> to be sent to/from the guest.
> 
> The API mirrors libxenevtchn, and in time both this and the real Xen one
> will be available through ops structures so that the PV backend drivers
> can use the correct one as appropriate.
> 
> For now, this implementation can be used directly by our XenStore which
> will be for emulated mode only.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/i386/kvm/xen_evtchn.c | 342 +++++++++++++++++++++++++++++++++++++--
>  hw/i386/kvm/xen_evtchn.h |  20 +++
>  2 files changed, 353 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 34c5199421..c0f6ef9dff 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -35,6 +35,7 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/kvm_xen.h"
>  #include <linux/kvm.h>
> +#include <sys/eventfd.h>
>  
>  #include "standard-headers/xen/memory.h"
>  #include "standard-headers/xen/hvm/params.h"
> @@ -85,6 +86,13 @@ struct compat_shared_info {
>  
>  #define COMPAT_EVTCHN_2L_NR_CHANNELS            1024
>  
> +/* Local private implementation of struct xenevtchn_handle */
> +struct xenevtchn_handle {
> +    evtchn_port_t be_port;
> +    evtchn_port_t guest_port; /* Or zero for unbound */
> +    int fd;
> +};
> +
>  /*
>   * For unbound/interdomain ports there are only two possible remote
>   * domains; self and QEMU. Use a single high bit in type_val for that,
> @@ -93,8 +101,6 @@ struct compat_shared_info {
>  #define PORT_INFO_TYPEVAL_REMOTE_QEMU           0x8000
>  #define PORT_INFO_TYPEVAL_REMOTE_PORT_MASK      0x7FFF
>  
> -#define DOMID_QEMU      0
> -
>  struct XenEvtchnState {
>      /*< private >*/
>      SysBusDevice busdev;
> @@ -108,6 +114,8 @@ struct XenEvtchnState {
>      uint32_t nr_ports;
>      XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
>      qemu_irq gsis[GSI_NUM_PINS];
> +
> +    struct xenevtchn_handle *be_handles[EVTCHN_2L_NR_CHANNELS];
>  };
>  
>  struct XenEvtchnState *xen_evtchn_singleton;
> @@ -115,6 +123,18 @@ struct XenEvtchnState *xen_evtchn_singleton;
>  /* Top bits of callback_param are the type (HVM_PARAM_CALLBACK_TYPE_xxx) */
>  #define CALLBACK_VIA_TYPE_SHIFT 56
>  
> +static void unbind_backend_ports(XenEvtchnState *s);
> +
> +static int xen_evtchn_pre_load(void *opaque)
> +{
> +    XenEvtchnState *s = opaque;
> +
> +    /* Unbind all the backend-side ports; they need to rebind */
> +    unbind_backend_ports(s);
> +
> +    return 0;
> +}
> +
>  static int xen_evtchn_post_load(void *opaque, int version_id)
>  {
>      XenEvtchnState *s = opaque;
> @@ -148,6 +168,7 @@ static const VMStateDescription xen_evtchn_vmstate = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = xen_evtchn_is_needed,
> +    .pre_load = xen_evtchn_pre_load,
>      .post_load = xen_evtchn_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(callback_param, XenEvtchnState),
> @@ -362,6 +383,20 @@ static int assign_kernel_port(uint16_t type, evtchn_port_t port,
>      return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
>  }
>  
> +static int assign_kernel_eventfd(uint16_t type, evtchn_port_t port, int fd)
> +{
> +    struct kvm_xen_hvm_attr ha;
> +
> +    ha.type = KVM_XEN_ATTR_TYPE_EVTCHN;
> +    ha.u.evtchn.send_port = port;
> +    ha.u.evtchn.type = type;
> +    ha.u.evtchn.flags = 0;
> +    ha.u.evtchn.deliver.eventfd.port = 0;
> +    ha.u.evtchn.deliver.eventfd.fd = fd;
> +
> +    return kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &ha);
> +}
> +
>  static bool valid_port(evtchn_port_t port)
>  {
>      if (!port) {
> @@ -380,6 +415,32 @@ static bool valid_vcpu(uint32_t vcpu)
>      return !!qemu_get_cpu(vcpu);
>  }
>  
> +static void unbind_backend_ports(XenEvtchnState *s)
> +{
> +    XenEvtchnPort *p;
> +    int i;
> +
> +    for (i = 1; i <= s->nr_ports; i++) {
> +        p = &s->port_table[i];
> +        if (p->type == EVTCHNSTAT_interdomain &&
> +            (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ) {
> +            evtchn_port_t be_port = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
> +
> +            if (s->be_handles[be_port]) {
> +                /* This part will be overwritten on the load anyway. */
> +                p->type = EVTCHNSTAT_unbound;
> +                p->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +
> +                /* Leave the backend port open and unbound too. */
> +                if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +                    deassign_kernel_port(i);
> +                }
> +                s->be_handles[be_port]->guest_port = 0;
> +            }
> +        }
> +    }
> +}
> +
>  int xen_evtchn_status_op(struct evtchn_status *status)
>  {
>      XenEvtchnState *s = xen_evtchn_singleton;
> @@ -815,7 +876,14 @@ static int close_port(XenEvtchnState *s, evtchn_port_t port)
>  
>      case EVTCHNSTAT_interdomain:
>          if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
> -            /* Not yet implemented. This can't happen! */
> +            uint16_t be_port = p->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +            struct xenevtchn_handle *xc = s->be_handles[be_port];
> +            if (xc) {
> +                if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +                    deassign_kernel_port(port);
> +                }
> +                xc->guest_port = 0;
> +            }
>          } else {
>              /* Loopback interdomain */
>              XenEvtchnPort *rp = &s->port_table[p->type_val];
> @@ -1047,8 +1115,27 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
>      }
>  
>      if (interdomain->remote_dom == DOMID_QEMU) {
> -        /* We haven't hooked up QEMU's PV drivers to this yet */
> -        ret = -ENOSYS;
> +        struct xenevtchn_handle *xc = s->be_handles[interdomain->remote_port];
> +        XenEvtchnPort *lp = &s->port_table[interdomain->local_port];
> +
> +        if (!xc) {
> +            ret = -ENOENT;
> +            goto out_free_port;
> +        }
> +
> +        if (xc->guest_port) {
> +            ret = -EBUSY;
> +            goto out_free_port;
> +        }
> +
> +        assert(xc->be_port == interdomain->remote_port);
> +        xc->guest_port = interdomain->local_port;
> +        if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +            assign_kernel_eventfd(lp->type, xc->guest_port, xc->fd);
> +        }
> +        lp->type = EVTCHNSTAT_interdomain;
> +        lp->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU | interdomain->remote_port;
> +        ret = 0;
>      } else {
>          /* Loopback */
>          XenEvtchnPort *rp = &s->port_table[interdomain->remote_port];
> @@ -1066,6 +1153,7 @@ int xen_evtchn_bind_interdomain_op(struct evtchn_bind_interdomain *interdomain)
>          }
>      }
>  
> + out_free_port:
>      if (ret) {
>          free_port(s, interdomain->local_port);
>      }
> @@ -1130,11 +1218,16 @@ int xen_evtchn_send_op(struct evtchn_send *send)
>          if (p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) {
>              /*
>               * This is an event from the guest to qemu itself, which is
> -             * serving as the driver domain. Not yet implemented; it will
> -             * be hooked up to the qemu implementation of xenstore,
> -             * console, PV net/block drivers etc.
> +             * serving as the driver domain.
>               */
> -            ret = -ENOSYS;
> +            uint16_t be_port = p->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +            struct xenevtchn_handle *xc = s->be_handles[be_port];
> +            if (xc) {
> +                eventfd_write(xc->fd, 1);
> +                ret = 0;
> +            } else {
> +                ret = -ENOENT;
> +            }
>          } else {
>              /* Loopback interdomain ports; just a complex IPI */
>              set_port_pending(s, p->type_val);
> @@ -1190,6 +1283,237 @@ int xen_evtchn_set_port(uint16_t port)
>      return ret;
>  }
>  
> +struct xenevtchn_handle *xen_be_evtchn_open(void *logger, unsigned int flags)
> +{
> +    struct xenevtchn_handle *xc = g_new0(struct xenevtchn_handle, 1);
> +
> +    xc->fd = eventfd(0, EFD_CLOEXEC);
> +    if (xc->fd < 0) {
> +        free(xc);
> +        return NULL;
> +    }
> +
> +    return xc;
> +}
> +
> +static int find_be_port(XenEvtchnState *s, struct xenevtchn_handle *xc)
> +{
> +    int i;
> +
> +    for (i = 25; valid_port(i); i++) {

Magic 25 number ?

Dave

> +        if (!s->be_handles[i]) {
> +            s->be_handles[i] = xc;
> +            xc->be_port = i;
> +            return i;
> +        }
> +    }
> +    return 0;
> +}
> +
> +int xen_be_evtchn_bind_interdomain(struct xenevtchn_handle *xc, uint32_t domid,
> +                                   evtchn_port_t guest_port)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    XenEvtchnPort *gp;
> +    uint16_t be_port = 0;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    if (domid != xen_domid) {
> +        return -ESRCH;
> +    }
> +
> +    if (!valid_port(guest_port)) {
> +        return -EINVAL;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    /* The guest has to have an unbound port waiting for us to bind */
> +    gp = &s->port_table[guest_port];
> +
> +    switch (gp->type) {
> +    case EVTCHNSTAT_interdomain:
> +        /* Allow rebinding after migration, preserve port # if possible */
> +        be_port = gp->type_val & ~PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +        assert(be_port != 0);
> +        if (!s->be_handles[be_port]) {
> +            s->be_handles[be_port] = xc;
> +            xc->guest_port = guest_port;
> +            ret = xc->be_port = be_port;
> +            if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +                assign_kernel_eventfd(gp->type, guest_port, xc->fd);
> +            }
> +            break;
> +        }
> +        /* fall through */
> +
> +    case EVTCHNSTAT_unbound:
> +        be_port = find_be_port(s, xc);
> +        if (!be_port) {
> +            ret = -ENOSPC;
> +            goto out;
> +        }
> +
> +        gp->type = EVTCHNSTAT_interdomain;
> +        gp->type_val = be_port | PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +        xc->guest_port = guest_port;
> +        if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +            assign_kernel_eventfd(gp->type, guest_port, xc->fd);
> +        }
> +        ret = be_port;
> +        break;
> +
> +    default:
> +        ret = -EINVAL;
> +        break;
> +    }
> +
> + out:
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    return ret;
> +}
> +
> +int xen_be_evtchn_unbind(struct xenevtchn_handle *xc, evtchn_port_t port)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    if (port && port != xc->be_port) {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    if (xc->guest_port) {
> +        XenEvtchnPort *gp = &s->port_table[xc->guest_port];
> +
> +        /* This should never *not* be true */
> +        if (gp->type == EVTCHNSTAT_interdomain) {
> +            gp->type = EVTCHNSTAT_unbound;
> +            gp->type_val = PORT_INFO_TYPEVAL_REMOTE_QEMU;
> +        }
> +
> +        if (kvm_xen_has_cap(EVTCHN_SEND)) {
> +            deassign_kernel_port(xc->guest_port);
> +        }
> +        xc->guest_port = 0;
> +    }
> +
> +    s->be_handles[xc->be_port] = NULL;
> +    xc->be_port = 0;
> +    ret = 0;
> + out:
> +    qemu_mutex_unlock(&s->port_lock);
> +    return ret;
> +}
> +
> +int xen_be_evtchn_close(struct xenevtchn_handle *xc)
> +{
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    xen_be_evtchn_unbind(xc, 0);
> +
> +    close(xc->fd);
> +    free(xc);
> +    return 0;
> +}
> +
> +int xen_be_evtchn_fd(struct xenevtchn_handle *xc)
> +{
> +    if (!xc) {
> +        return -1;
> +    }
> +    return xc->fd;
> +}
> +
> +int xen_be_evtchn_notify(struct xenevtchn_handle *xc, evtchn_port_t port)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    int ret;
> +
> +    if (!s) {
> +        return -ENOTSUP;
> +    }
> +
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    if (xc->guest_port) {
> +        set_port_pending(s, xc->guest_port);
> +        ret = 0;
> +    } else {
> +        ret = -ENOTCONN;
> +    }
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +
> +    return ret;
> +}
> +
> +int xen_be_evtchn_pending(struct xenevtchn_handle *xc)
> +{
> +    uint64_t val;
> +
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    if (!xc->be_port) {
> +        return 0;
> +    }
> +
> +    if (eventfd_read(xc->fd, &val)) {
> +        return -errno;
> +    }
> +
> +    return val ? xc->be_port : 0;
> +}
> +
> +int xen_be_evtchn_unmask(struct xenevtchn_handle *xc, evtchn_port_t port)
> +{
> +    if (!xc) {
> +        return -EFAULT;
> +    }
> +
> +    if (xc->be_port != port) {
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * We don't actually do anything to unmask it; the event was already
> +     * consumed in xen_be_evtchn_pending().
> +     */
> +    return 0;
> +}
> +
> +int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc)
> +{
> +    return xc->guest_port;
> +}
> +
>  static const char *type_names[] = {
>      "closed",
>      "unbound",
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index eb6ba16f72..029496eaa9 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -14,6 +14,9 @@
>  
>  #include "hw/sysbus.h"
>  
> +typedef uint32_t evtchn_port_t;
> +#define DOMID_QEMU      0
> +
>  void xen_evtchn_create(void);
>  int xen_evtchn_soft_reset(void);
>  int xen_evtchn_set_callback_param(uint64_t param);
> @@ -22,6 +25,23 @@ void xen_evtchn_set_callback_level(int level);
>  
>  int xen_evtchn_set_port(uint16_t port);
>  
> +/*
> + * These functions mirror the libxenevtchn library API, providing the QEMU
> + * backend side of "interdomain" event channels.
> + */
> +struct xenevtchn_handle;
> +struct xenevtchn_handle *xen_be_evtchn_open(void *logger, unsigned int flags);
> +int xen_be_evtchn_bind_interdomain(struct xenevtchn_handle *xc, uint32_t domid,
> +                                   evtchn_port_t guest_port);
> +int xen_be_evtchn_unbind(struct xenevtchn_handle *xc, evtchn_port_t port);
> +int xen_be_evtchn_close(struct xenevtchn_handle *xc);
> +int xen_be_evtchn_fd(struct xenevtchn_handle *xc);
> +int xen_be_evtchn_notify(struct xenevtchn_handle *xc, evtchn_port_t port);
> +int xen_be_evtchn_unmask(struct xenevtchn_handle *xc, evtchn_port_t port);
> +int xen_be_evtchn_pending(struct xenevtchn_handle *xc);
> +/* Apart from this which is a local addition */
> +int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc);
> +
>  void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
>  void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
>  
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


