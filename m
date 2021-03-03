Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B832B780
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 12:26:56 +0100 (CET)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHPeZ-0002oI-4Z
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 06:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lHPca-0001qR-Vt
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:24:53 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lHPcT-0006Bw-Rt
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:24:52 -0500
Received: by mail-pg1-x52f.google.com with SMTP id p21so16105589pgl.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 03:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8Mv8HKXCDyxPeOa+V1/Dv1dqrwydTLqsI8TIQQVpIM=;
 b=isWdnyULnawtm/ZgeRg4kfz+muOIq0KEg8T15ra0tWg4OMQoQZDWY9M6fRum3zkwsF
 fM760sFKTDwIX36DJlX2BRG2wP19s4Y/b4/Vg1QvddeyKK+g2PYVsP2IQXMs2NDR/G95
 7j8PanAhDRUC7ek4c0rgAbf8K6N9CrczOtDYxcHnYpUWNjyFs1rzgaUNjQH8R8EOtsHi
 W32L1h+fx7TaE8EdLHcswG1fjuHRlnaNcyZANOL7A6lTQ6q0kusBo55WpH9YkUkehQju
 +itU2WBaKcCqAXFz4bxHF3Uju0Xi1hM6EVqonWZexjGJ9FPQoy1wxexg8EVvFevKBjQz
 syoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8Mv8HKXCDyxPeOa+V1/Dv1dqrwydTLqsI8TIQQVpIM=;
 b=ntuEwq3M83n4mu7px8dOqUJc76njZ/To3VNrReAzpq9WyIL8/X1hoDNWd46i1THZH2
 Ik70dA4ImHLPbQtah+DzEbEAULhDX0GqwrTeEqtXTdreON0ASf8D8Tbol3sU/YaeASyf
 sVlRA1raHPIZW6MZj1A+3jmTWZDYhik/1MZJAlIvJEePbC6PF62ohbFW+ACf/nZdWB0l
 TaP36fZ44Bp9lJ5E5Gfv2kZCUUWqzLxZYF8vI/KpD83O7p3Yna11anae9khsSEbDjE8J
 70OXCWOidCYMbyr0B4o32hN3B7/U27G4rCEjZ5VxoyY6Nmll4lKt8YW8ZVJ+/0Z/KhU2
 HtNw==
X-Gm-Message-State: AOAM533yFlVS2GcfAAfB6hnSWBOqMWNOnJgzOS+6Ps1jMvS4ti3uMrE0
 F5gT1gRSbgzrY2g3ZZPP8a3umJxfVC18uhid8VY=
X-Google-Smtp-Source: ABdhPJzBNlaZNwm+H4j3gcI8WthcbNCB+bgP9U2nX6UX86FVCO7FmF1C6ASnh1s0ndmseSigG2dDP2uLNncnGJhvWlI=
X-Received: by 2002:a63:511:: with SMTP id 17mr2566809pgf.173.1614770683700;
 Wed, 03 Mar 2021 03:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20210218134947.1860-1-phillip.ennen@gmail.com>
 <YDWOxkr1/p07UaFE@SPB-NB-133.local>
In-Reply-To: <YDWOxkr1/p07UaFE@SPB-NB-133.local>
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Wed, 3 Mar 2021 12:24:32 +0100
Message-ID: <CAAi_9z78mV-KF6msw+NDrTigu=FwgnRRYeYQbVDgcv2aW55ALQ@mail.gmail.com>
Subject: Re: [PATCH v4] net/macos: implement vmnet-based netdev
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="000000000000feea8705bca0183f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000feea8705bca0183f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much for your help and feedback!

Apologies for my delay in following up. I'll submit a new version that
implements the feedback you've provided here, as well as the QAPI schema
changes @Markus Armbruster <armbru@redhat.com> (thanks to you as well for
your time and review!) pointed out.

Phillip

On Wed, Feb 24, 2021 at 12:25 AM Roman Bolshakov <r.bolshakov@yadro.com>
wrote:

> On Thu, Feb 18, 2021 at 02:49:47PM +0100, phillip.ennen@gmail.com wrote:
> > From: Phillip Tennen <phillip@axleos.com>
> >
> > This patch implements a new netdev device, reachable via -netdev
> > vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
> >
> > The vmnet framework provides native bridging support, and its usage in
> > this patch is intended as a replacement for attempts to use a tap devic=
e
> > via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> > never would have worked in the first place, as QEMU interacts with the
> > tap device via poll(), and macOS does not support polling device files.
> >
> > vmnet requires either a special entitlement, granted via a provisioning
> > profile, or root access. Otherwise attempts to create the virtual
> > interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code.=
 QEMU may not
> > currently be signed with an entitlement granted in a provisioning
> > profile, as this would necessitate pre-signed binary build distribution=
,
> > rather than source-code distribution. As such, using this netdev
> > currently requires that qemu be run with root access. I=E2=80=99ve open=
ed a
> > feedback report with Apple to allow the use of the relevant entitlement
> > with this use case:
> > https://openradar.appspot.com/radar?id=3D5007417364447232
> >
> > vmnet offers three operating modes, all of which are supported by this
> > patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
> >
> > * "Host" mode: Allows the vmnet interface to communicate with other
> > * vmnet
> > interfaces that are in host mode and also with the native host.
> > * "Shared" mode: Allows traffic originating from the vmnet interface to
> > reach the Internet through a NAT. The vmnet interface can also
> > communicate with the native host.
> > * "Bridged" mode: Bridges the vmnet interface with a physical network
> > interface.
> >
> > Each of these modes also provide some extra configuration that=E2=80=99=
s
> > supported by this patch:
> >
> > * "Bridged" mode: The user may specify the physical interface to bridge
> > with. Defaults to en0.
> > * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> > subnet. Allocated by vmnet if not provided.
> >
> > vmnet also offers some extra configuration options that are not
> > supported by this patch:
> >
> > * Enable isolation from other VMs using vmnet
> > * Port forwarding rules
> > * Enabling TCP segmentation offload
> > * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> > * Only available in "host" mode: specifying the IP address for the VM
> > within an isolated network
> >
> > Note that this patch requires macOS 10.15 as a minimum, as this is when
> > bridging support was implemented in vmnet.framework.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > ---
> >  configure         |   2 +-
> >  net/clients.h     |   6 +
> >  net/meson.build   |   1 +
> >  net/net.c         |   3 +
> >  net/vmnet-macos.c | 447 ++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/net.json     | 120 ++++++++++++-
> >  qemu-options.hx   |   9 +
> >  7 files changed, 585 insertions(+), 3 deletions(-)
> >  create mode 100644 net/vmnet-macos.c
> >
>
> Hi Phillip,
>
> Thanks for working on this!
>
> Note that the patch doesn't apply to current master and there's a lot of
> warnings wrt trailing whitespaces:
>
> git am v4-net-macos-implement-vmnet-based-netdev.patch
> Applying: net/macos: implement vmnet-based netdev
> .git/rebase-apply/patch:462: trailing whitespace.
>          * If QEMU is started with -nographic, no Cocoa event loop will b=
e
> .git/rebase-apply/patch:465: trailing whitespace.
>
> dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
> .git/rebase-apply/patch:466: trailing whitespace.
>                                                  0),
> .git/rebase-apply/patch:532: trailing whitespace.
> # @host: the guest may communicate with the host
> .git/rebase-apply/patch:535: trailing whitespace.
> # @shared: the guest may reach the Internet through a NAT,
> error: patch failed: configure:778
> error: configure: patch does not apply
> Patch failed at 0001 net/macos: implement vmnet-based netdev
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Also it would be helpful to provide a changelog under commit message
> delimiter ("---")  for reach new version of the patch to provide an
> overview of what has been changed between the versions.
>
> > diff --git a/configure b/configure
> > index 4afd22bdf5..f449198db1 100755
> > --- a/configure
> > +++ b/configure
> > @@ -778,7 +778,7 @@ Darwin)
> >    fi
> >    audio_drv_list=3D"coreaudio try-sdl"
> >    audio_possible_drivers=3D"coreaudio sdl"
> > -  QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit
> $QEMU_LDFLAGS"
> > +  QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit -framewor=
k
> vmnet $QEMU_LDFLAGS"
>
> I'm not sure this is right approach. Instead, we need a new
> configuration option for the feature + proper discovery. Something like
> this should work:
>
>
> https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782b696853824=
b14bd9
>
> >    # Disable attempts to use ObjectiveC features in os/object.h since
> they
> >    # won't work when we're compiling with gcc as a C compiler.
> >    QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
> > diff --git a/net/clients.h b/net/clients.h
> > index 92f9b59aed..463a9b2f67 100644
> > --- a/net/clients.h
> > +++ b/net/clients.h
> > @@ -63,4 +63,10 @@ int net_init_vhost_user(const Netdev *netdev, const
> char *name,
> >
> >  int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >                          NetClientState *peer, Error **errp);
> > +
> > +#ifdef CONFIG_DARWIN
>
> Respectively, it would be wrapped with #ifdef CONFIG_VMNET instead of
> more generic CONFIG_DARWIN.
>
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                        NetClientState *peer, Error **errp);
> > +#endif
> > +
> >  #endif /* QEMU_NET_CLIENTS_H */
> > diff --git a/net/meson.build b/net/meson.build
> > index 1076b0a7ab..8c7c32f775 100644
> > --- a/net/meson.build
> > +++ b/net/meson.build
> > @@ -37,5 +37,6 @@ endif
> >  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
> >  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
> >  softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true:
> files('vhost-vdpa.c'))
> > +softmmu_ss.add(when: 'CONFIG_DARWIN', if_true: files('vmnet-macos.c'))
> >
> >  subdir('can')
> > diff --git a/net/net.c b/net/net.c
> > index c1cd9c75f6..e68a410a89 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -977,6 +977,9 @@ static int (* const
> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >  #ifdef CONFIG_L2TPV3
> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
> >  #endif
> > +#ifdef CONFIG_DARWIN
>
> CONFIG_VMNET should be used here as well.
>
> > +        [NET_CLIENT_DRIVER_VMNET_MACOS] =3D net_init_vmnet_macos,
> > +#endif
> >  };
> >
> >
> > diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c
> > new file mode 100644
> > index 0000000000..1a762751dd
> > --- /dev/null
> > +++ b/net/vmnet-macos.c
> > @@ -0,0 +1,447 @@
> > +/*
> > + * vmnet.framework backed netdev for macOS 10.15+ hosts
> > + *
> > + * Copyright (c) 2021 Phillip Tennen <phillip@axleos.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "net/net.h"
> > +/* macOS vmnet framework header */
> > +#include <vmnet/vmnet.h>
> > +
> > +typedef struct vmnet_state {
> > +    NetClientState nc;
> > +    interface_ref vmnet_iface_ref;
> > +    /* Switched on after vmnet informs us that the interface has
> started */
> > +    bool link_up;
> > +    /*
> > +     * If qemu_send_packet_async returns 0, this is switched off until
> our
> > +     * delivery callback is invoked
> > +     */
> > +    bool qemu_ready_to_receive;
> > +} vmnet_state_t;
> > +
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                         NetClientState *peer, Error **errp);
> > +
> > +static const char *_vmnet_status_repr(vmnet_return_t status)
>
> Underscore may be dropped.
>
> > +{
> > +    switch (status) {
> > +    case VMNET_SUCCESS:
> > +        return "success";
> > +    case VMNET_FAILURE:
> > +        return "generic failure";
> > +    case VMNET_MEM_FAILURE:
> > +        return "out of memory";
> > +    case VMNET_INVALID_ARGUMENT:
> > +        return "invalid argument";
> > +    case VMNET_SETUP_INCOMPLETE:
> > +        return "setup is incomplete";
> > +    case VMNET_INVALID_ACCESS:
> > +        return "insufficient permissions";
> > +    case VMNET_PACKET_TOO_BIG:
> > +        return "packet size exceeds MTU";
> > +    case VMNET_BUFFER_EXHAUSTED:
> > +        return "kernel buffers temporarily exhausted";
> > +    case VMNET_TOO_MANY_PACKETS:
> > +        return "number of packets exceeds system limit";
> > +    /* This error code was introduced in macOS 11.0 */
> > +#if __MAC_OS_X_VERSION_MAX_ALLOWED >=3D 110000
> > +    case VMNET_SHARING_SERVICE_BUSY:
> > +        return "sharing service busy";
> > +#endif
> > +    default:
> > +        return "unknown status code";
> > +    }
> > +}
> > +
> > +static operating_modes_t _vmnet_operating_mode_enum_compat(
> > +    VmnetOperatingMode mode)
>
> Underscore may be dropped.
>
> > +{
> > +    switch (mode) {
> > +    case VMNET_OPERATING_MODE_HOST:
> > +        return VMNET_HOST_MODE;
> > +    case VMNET_OPERATING_MODE_SHARED:
> > +        return VMNET_SHARED_MODE;
> > +    case VMNET_OPERATING_MODE_BRIDGED:
> > +        return VMNET_BRIDGED_MODE;
> > +    default:
> > +        /* Should never happen as the modes are parsed before we get
> here */
> > +        assert(false);
> > +    }
> > +}
> > +
> > +static bool vmnet_can_receive(NetClientState *nc)
> > +{
> > +    vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);
> > +    return s->link_up;
>
> I'm not sure this is correct.
> Did you mean s->qemu_ready_to_receive?
>
> > +}
> > +
> > +static ssize_t vmnet_receive_iov(NetClientState *nc,
> > +                                 const struct iovec *iovs,
> > +                                 int iovcnt)
> > +{
> > +    vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);
> > +
> > +    /* Combine the provided iovs into a single vmnet packet */
> > +    struct vmpktdesc *packet =3D g_new0(struct vmpktdesc, 1);
>
> packet_count could be used instead of 1.
>
> > +    packet->vm_pkt_iov =3D g_new0(struct iovec, iovcnt);
> > +    memcpy(packet->vm_pkt_iov, iovs, sizeof(struct iovec) * iovcnt);
> > +    packet->vm_pkt_iovcnt =3D iovcnt;
>
> Should we use iov_copy() instead?
>
> > +    packet->vm_flags =3D 0;
>
> The line is redundant with g_new0.
>
> > +
> > +    /* Figure out the packet size by iterating the iov's */
> > +    for (int i =3D 0; i < iovcnt; i++) {
> > +        const struct iovec *iov =3D iovs + i;
> > +        packet->vm_pkt_size +=3D iov->iov_len;
> > +    }
>
> I wonder if we should add a check if packet->vm_pkt_size is beyond
> vmnet_max_packet_size_key?
>
> Also I'm not entirely sure that we should at most transmit only one
> packet, a sort of coalescing might be helpful (Apple claims up ot 200
> packets per one vmnet_write) but I'm not an expert of net part of QEMU.
> Stefan may provide more info on that.
>
> > +
> > +    /* Finally, write the packet to the vmnet interface */
> > +    int packet_count =3D 1;
> > +    vmnet_return_t result =3D vmnet_write(s->vmnet_iface_ref, packet,
> > +                                        &packet_count);
> > +    if (result !=3D VMNET_SUCCESS || packet_count !=3D 1) {
> > +        error_printf("Failed to send packet to host: %s\n",
> > +            _vmnet_status_repr(result));
> > +    }
> > +    ssize_t wrote_bytes =3D packet->vm_pkt_size;
>
> That's going to mismatch with actual number of bytes written if
> packet_count returned from vmnet_write equals zero.
>
> > +    g_free(packet->vm_pkt_iov);
> > +    g_free(packet);
> > +    return wrote_bytes;
> > +}
> > +
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_state_t, nc,
> nc);
> > +    /* Ready to receive more packets! */
> > +    vmnet_client_state->qemu_ready_to_receive =3D true;
> > +}
> > +
> > +static NetClientInfo net_vmnet_macos_info =3D {
> > +    .type =3D NET_CLIENT_DRIVER_VMNET_MACOS,
> > +    .size =3D sizeof(vmnet_state_t),
> > +    .receive_iov =3D vmnet_receive_iov,
> > +    .can_receive =3D vmnet_can_receive,
> > +};
> > +
> > +static bool _validate_ifname_is_valid_bridge_target(const char *ifname=
)
>
> Underscore may be dropped from the function.
>
> > +{
> > +    /* Iterate available bridge interfaces, ensure the provided one is
> valid */
> > +    xpc_object_t bridge_interfaces =3D vmnet_copy_shared_interface_lis=
t();
> > +    bool failed_to_match_iface_name =3D xpc_array_apply(
> > +        bridge_interfaces,
> > +        ^bool(size_t index, xpc_object_t  _Nonnull value) {
> > +        if (!strcmp(xpc_string_get_string_ptr(value), ifname)) {
> > +            /* The interface name is valid! Stop iterating */
> > +            return false;
> > +        }
> > +        return true;
> > +    });
> > +
> > +    if (failed_to_match_iface_name) {
> > +        error_printf("Invalid bridge interface name provided: %s\n",
> ifname);
> > +        error_printf("Valid bridge interfaces:\n");
> > +        xpc_array_apply(
> > +            vmnet_copy_shared_interface_list(),
> > +            ^bool(size_t index, xpc_object_t  _Nonnull value) {
> > +            error_printf("\t%s\n", xpc_string_get_string_ptr(value));
> > +            /* Keep iterating */
> > +            return true;
> > +        });
> > +        exit(1);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static xpc_object_t _construct_vmnet_interface_description(
>
> Underscore is not needed I think.
>
> > +    const NetdevVmnetModeOptions *vmnet_opts)
> > +{
> > +    operating_modes_t mode =3D _vmnet_operating_mode_enum_compat(
> > +        vmnet_opts->mode);
> > +
> > +    /* Validate options */
> > +    if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D VMNET_SHARED_MODE) =
{
> > +        NetdevVmnetModeOptionsHostOrShared mode_opts =3D
> vmnet_opts->u.host;
> > +        /* If one DHCP parameter is configured, all 3 are required */
> > +        if (mode_opts.has_dhcp_start_address ||
> > +            mode_opts.has_dhcp_end_address ||
> > +            mode_opts.has_dhcp_subnet_mask) {
> > +            if (!(mode_opts.has_dhcp_start_address &&
> > +                  mode_opts.has_dhcp_end_address &&
> > +                  mode_opts.has_dhcp_subnet_mask)) {
> > +                error_printf("Incomplete DHCP configuration
> provided\n");
> > +                exit(1);
> > +            }
> > +        }
> > +    } else if (mode =3D=3D VMNET_BRIDGED_MODE) {
>
> I think we want to enable bridging mode only on macOS 10.15 and above
> where vmnet_copy_shared_interface_list() is supported.
>
>
> > +        /* Nothing to validate */
> > +    } else {
> > +        error_printf("Unknown vmnet mode %d\n", mode);
> > +        exit(1);
> > +    }
> > +
> > +    xpc_object_t interface_desc =3D xpc_dictionary_create(NULL, NULL, =
0);
> > +    xpc_dictionary_set_uint64(
> > +        interface_desc,
> > +        vmnet_operation_mode_key,
> > +        mode
> > +    );
> > +
> > +    if (mode =3D=3D VMNET_BRIDGED_MODE) {
> > +        /*
> > +         * Configure the provided physical interface to act
> > +         * as a bridge with QEMU
> > +         */
> > +        NetdevVmnetModeOptionsBridged mode_opts =3D vmnet_opts->u.brid=
ged;
> > +        /* Bridge with en0 by default */
> > +        const char *physical_ifname =3D mode_opts.has_ifname ?
> mode_opts.ifname :
> > +                                                             "en0";
>
> I think a default interface is not needed here, it's better to require
> an explicit inteface to bridge with. Some people prefer wired, others
> wireless. Ocasionally some do both :)
>
> More comments later!
>
> Thanks,
> Roman
>
> > +        _validate_ifname_is_valid_bridge_target(physical_ifname);
> > +        xpc_dictionary_set_string(interface_desc,
> > +                                  vmnet_shared_interface_name_key,
> > +                                  physical_ifname);
> > +    } else if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D VMNET_SHARED=
_MODE) {
> > +        /* Pass the DHCP configuration to vmnet, if the user provided
> one */
> > +        NetdevVmnetModeOptionsHostOrShared mode_opts =3D
> vmnet_opts->u.host;
> > +        if (mode_opts.has_dhcp_start_address) {
> > +            /* All DHCP arguments are available, as per the checks
> above */
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_start_address_key,
> > +                                      mode_opts.dhcp_start_address);
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_end_address_key,
> > +                                      mode_opts.dhcp_end_address);
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_subnet_mask_key,
> > +                                      mode_opts.dhcp_subnet_mask);
> > +        }
> > +    }
> > +
> > +    return interface_desc;
> > +}
> > +
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                        NetClientState *peer, Error **errp)
> > +{
> > +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VMNET_MACOS);
> > +
> > +    NetdevVmnetModeOptions *vmnet_opts =3D netdev->u.vmnet_macos.optio=
ns;
> > +    xpc_object_t iface_desc =3D
> _construct_vmnet_interface_description(vmnet_opts);
> > +
> > +    NetClientState *nc =3D qemu_new_net_client(&net_vmnet_macos_info,
> peer,
> > +                                             "vmnet", name);
> > +    vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_state_t, nc,
> nc);
> > +
> > +    dispatch_queue_t vmnet_dispatch_queue =3D dispatch_queue_create(
> > +        "org.qemu.vmnet.iface_queue",
> > +        DISPATCH_QUEUE_SERIAL
> > +    );
> > +
> > +    __block vmnet_return_t vmnet_start_status =3D 0;
> > +    __block uint64_t vmnet_iface_mtu =3D 0;
> > +    __block uint64_t vmnet_max_packet_size =3D 0;
> > +    __block const char *vmnet_mac_address =3D NULL;
> > +    /*
> > +     * We can't refer to an array type directly within a block,
> > +     * so hold a pointer instead.
> > +     */
> > +    uuid_string_t vmnet_iface_uuid =3D {0};
> > +    __block uuid_string_t *vmnet_iface_uuid_ptr =3D &vmnet_iface_uuid;
> > +    /* These are only provided in VMNET_HOST_MODE and VMNET_SHARED_MOD=
E
> */
> > +    bool vmnet_provides_dhcp_info =3D (
> > +        vmnet_opts->mode =3D=3D VMNET_OPERATING_MODE_HOST ||
> > +        vmnet_opts->mode =3D=3D VMNET_OPERATING_MODE_SHARED);
> > +    __block const char *vmnet_subnet_mask =3D NULL;
> > +    __block const char *vmnet_dhcp_range_start =3D NULL;
> > +    __block const char *vmnet_dhcp_range_end =3D NULL;
> > +
> > +    /* Create the vmnet interface */
> > +    dispatch_semaphore_t vmnet_iface_sem =3D dispatch_semaphore_create=
(0);
> > +    interface_ref vmnet_iface_ref =3D vmnet_start_interface(
> > +        iface_desc,
> > +        vmnet_dispatch_queue,
> > +        ^(vmnet_return_t status, xpc_object_t  _Nullable
> interface_param) {
> > +        vmnet_start_status =3D status;
> > +        if (vmnet_start_status !=3D VMNET_SUCCESS || !interface_param)=
 {
> > +            /* Early return if the interface couldn't be started */
> > +            dispatch_semaphore_signal(vmnet_iface_sem);
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * Read the configuration that vmnet provided us.
> > +         * The provided dictionary is owned by XPC and may be freed
> > +         * shortly after this block's execution.
> > +         * So, copy data buffers now.
> > +         */
> > +        vmnet_iface_mtu =3D xpc_dictionary_get_uint64(
> > +            interface_param,
> > +            vmnet_mtu_key
> > +        );
> > +        vmnet_max_packet_size =3D xpc_dictionary_get_uint64(
> > +            interface_param,
> > +            vmnet_max_packet_size_key
> > +        );
> > +        vmnet_mac_address =3D strdup(xpc_dictionary_get_string(
> > +            interface_param,
> > +            vmnet_mac_address_key
> > +        ));
> > +
> > +        const uint8_t *iface_uuid =3D xpc_dictionary_get_uuid(
> > +            interface_param,
> > +            vmnet_interface_id_key
> > +        );
> > +        uuid_unparse_upper(iface_uuid, *vmnet_iface_uuid_ptr);
> > +
> > +        /* If we're in a mode that provides DHCP info, read it out now
> */
> > +        if (vmnet_provides_dhcp_info) {
> > +            vmnet_dhcp_range_start =3D strdup(xpc_dictionary_get_strin=
g(
> > +                interface_param,
> > +                vmnet_start_address_key
> > +            ));
> > +            vmnet_dhcp_range_end =3D strdup(xpc_dictionary_get_string(
> > +                interface_param,
> > +                vmnet_end_address_key
> > +            ));
> > +            vmnet_subnet_mask =3D strdup(xpc_dictionary_get_string(
> > +                interface_param,
> > +                vmnet_subnet_mask_key
> > +            ));
> > +        }
> > +        dispatch_semaphore_signal(vmnet_iface_sem);
> > +    });
> > +
> > +    /* And block until we receive a response from vmnet */
> > +    dispatch_semaphore_wait(vmnet_iface_sem, DISPATCH_TIME_FOREVER);
> > +
> > +    /* Did we manage to start the interface? */
> > +    if (vmnet_start_status !=3D VMNET_SUCCESS || !vmnet_iface_ref) {
> > +        error_printf("Failed to start interface: %s\n",
> > +            _vmnet_status_repr(vmnet_start_status));
> > +        if (vmnet_start_status =3D=3D VMNET_FAILURE) {
> > +            error_printf("Hint: vmnet requires running with root
> access\n");
> > +        }
> > +        return -1;
> > +    }
> > +
> > +    info_report("Started vmnet interface with configuration:");
> > +    info_report("MTU:              %llu", vmnet_iface_mtu);
> > +    info_report("Max packet size:  %llu", vmnet_max_packet_size);
> > +    info_report("MAC:              %s", vmnet_mac_address);
> > +    if (vmnet_provides_dhcp_info) {
> > +        info_report("DHCP IPv4 start:  %s", vmnet_dhcp_range_start);
> > +        info_report("DHCP IPv4 end:    %s", vmnet_dhcp_range_end);
> > +        info_report("IPv4 subnet mask: %s", vmnet_subnet_mask);
> > +    }
> > +    info_report("UUID:             %s", vmnet_iface_uuid);
> > +
> > +    /* The interface is up! Set a block to run when packets are
> received */
> > +    vmnet_client_state->vmnet_iface_ref =3D vmnet_iface_ref;
> > +    vmnet_return_t event_cb_stat =3D vmnet_interface_set_event_callbac=
k(
> > +        vmnet_iface_ref,
> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +        vmnet_dispatch_queue,
> > +        ^(interface_event_t event_mask, xpc_object_t  _Nonnull event) =
{
> > +        if (event_mask !=3D VMNET_INTERFACE_PACKETS_AVAILABLE) {
> > +            error_printf("Unknown vmnet interface event 0x%08x\n",
> event_mask);
> > +            return;
> > +        }
> > +
> > +        /* If we're unable to handle more packets now, drop this packe=
t
> */
> > +        if (!vmnet_client_state->qemu_ready_to_receive) {
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * TODO(Phillip Tennen <phillip@axleos.com>): There may be
> more than
> > +         * one packet available.
> > +         * As an optimization, we could read
> > +         * vmnet_estimated_packets_available_key packets now.
> > +         */
> > +        char *packet_buf =3D g_malloc0(vmnet_max_packet_size);
> > +        struct iovec *iov =3D g_new0(struct iovec, 1);
> > +        iov->iov_base =3D packet_buf;
> > +        iov->iov_len =3D vmnet_max_packet_size;
> > +
> > +        int pktcnt =3D 1;
> > +        struct vmpktdesc *v =3D g_new0(struct vmpktdesc, pktcnt);
> > +        v->vm_pkt_size =3D vmnet_max_packet_size;
> > +        v->vm_pkt_iov =3D iov;
> > +        v->vm_pkt_iovcnt =3D 1;
> > +        v->vm_flags =3D 0;
> > +
> > +        vmnet_return_t result =3D vmnet_read(vmnet_iface_ref, v, &pktc=
nt);
> > +        if (result !=3D VMNET_SUCCESS) {
> > +            error_printf("Failed to read packet from host: %s\n",
> > +                _vmnet_status_repr(result));
> > +        }
> > +
> > +        /* Ensure we read exactly one packet */
> > +        assert(pktcnt =3D=3D 1);
> > +
> > +        /* Dispatch this block to a global queue instead of the main
> queue,
> > +         * which is only created when the program has a Cocoa event
> loop.
> > +         * If QEMU is started with -nographic, no Cocoa event loop wil=
l
> be
> > +         * created and thus the main queue will be unavailable.
> > +         */
> > +
> dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
> > +                                                 0),
> > +                       ^{
> > +            qemu_mutex_lock_iothread();
> > +
> > +            /*
> > +             * Deliver the packet to the guest
> > +             * If the delivery succeeded synchronously, this returns
> the length
> > +             * of the sent packet.
> > +             */
> > +            if (qemu_send_packet_async(nc, iov->iov_base,
> > +                                       v->vm_pkt_size,
> > +                                       vmnet_send_completed) =3D=3D 0)=
 {
> > +                vmnet_client_state->qemu_ready_to_receive =3D false;
> > +            }
> > +
> > +            /*
> > +             * It's safe to free the packet buffers.
> > +             * Even if delivery needs to wait, qemu_net_queue_append
> copies
> > +             * the packet buffer.
> > +             */
> > +            g_free(v);
> > +            g_free(iov);
> > +            g_free(packet_buf);
> > +
> > +            qemu_mutex_unlock_iothread();
> > +        });
> > +    });
> > +
> > +    /* Did we manage to set an event callback? */
> > +    if (event_cb_stat !=3D VMNET_SUCCESS) {
> > +        error_printf("Failed to set up a callback to receive packets:
> %s\n",
> > +            _vmnet_status_repr(vmnet_start_status));
> > +        exit(1);
> > +    }
> > +
> > +    /* We're now ready to receive packets */
> > +    vmnet_client_state->qemu_ready_to_receive =3D true;
> > +    vmnet_client_state->link_up =3D true;
> > +
> > +    /* Include DHCP info if we're in a relevant mode */
> > +    if (vmnet_provides_dhcp_info) {
> > +        snprintf(nc->info_str, sizeof(nc->info_str),
> > +                 "dhcp_start=3D%s,dhcp_end=3D%s,mask=3D%s",
> > +                 vmnet_dhcp_range_start, vmnet_dhcp_range_end,
> > +                 vmnet_subnet_mask);
> > +    } else {
> > +        snprintf(nc->info_str, sizeof(nc->info_str),
> > +                 "mac=3D%s", vmnet_mac_address);
> > +    }
> > +
> > +    return 0;
> > +}
> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..e4d4143243 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -450,6 +450,115 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @VmnetOperatingMode:
> > +#
> > +# The operating modes in which a vmnet netdev can run
> > +# Only available on macOS
> > +#
> > +# @host: the guest may communicate with the host
> > +#        and other guest network interfaces
> > +#
> > +# @shared: the guest may reach the Internet through a NAT,
> > +#          and may communicate with the host and other guest
> > +#          network interfaces
> > +#
> > +# @bridged: the guest's traffic is bridged with a
> > +#           physical network interface of the host
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'enum': 'VmnetOperatingMode',
> > +  'data': [ 'host', 'shared', 'bridged' ],
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptionsBridged:
> > +#
> > +# Options for the vmnet-macos netdev
> > +# that are only available in 'bridged' mode
> > +# Only available on macOS
> > +#
> > +# @ifname: the physical network interface to bridge with
> > +#          (defaults to en0 if not specified)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetModeOptionsBridged',
> > +  'data': { '*ifname':  'str' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptionsHostOrShared:
> > +#
> > +# Options for the vmnet-macos netdev
> > +# that are only available in 'host' or 'shared' mode
> > +# Only available on macOS
> > +#
> > +# @dhcp-start-address: the gateway address to use for the interface.
> > +#                      The range to dhcp_end_address is placed in the
> DHCP pool.
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp-end-address and
> > +#                       dhcp-subnet-mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp-end-address: the DHCP IPv4 range end address to use for the
> interface.
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp-start-address and
> > +#                       dhcp-subnet-mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the
> interface.
> > +#                    (only valid with mode=3Dhost|shared)
> > +#                    (must be specified with dhcp-start-address and
> > +#                     dhcp-end-address)
> > +#                    (allocated automatically if unset)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
> > +  'data': {
> > +    '*dhcp-start-address': 'str' ,
> > +    '*dhcp-end-address':   'str',
> > +    '*dhcp-subnet-mask':   'str' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptions:
> > +#
> > +# Options specific to different operating modes of a vmnet netdev
> > +# Only available on macOS
> > +#
> > +# @mode: the operating mode vmnet should run in
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'union': 'NetdevVmnetModeOptions',
> > +  'base': { 'mode': 'VmnetOperatingMode' },
> > +  'discriminator': 'mode',
> > +  'data': {
> > +    'bridged':      'NetdevVmnetModeOptionsBridged',
> > +    'host':         'NetdevVmnetModeOptionsHostOrShared',
> > +    'shared':       'NetdevVmnetModeOptionsHostOrShared' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetOptions:
> > +#
> > +# vmnet network backend
> > +# Only available on macOS
> > +#
> > +# @options: a structure specifying the mode and mode-specific options
> > +#           (once QAPI supports a union type as a branch to another
> union type,
> > +#            this structure can be changed to a union, and the content=
s
> of
> > +#            NetdevVmnetModeOptions moved here)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetOptions',
> > +  'data': {'options': 'NetdevVmnetModeOptions' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -458,10 +567,13 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > +#
> > +#        @vmnet-macos since 6.0 (only available on macOS)
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' =
]
> }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> > +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_DARWIN)' } =
]
> }
> >
> >  ##
> >  # @Netdev:
> > @@ -475,6 +587,8 @@
> >  # Since: 1.2
> >  #
> >  #        'l2tpv3' - since 2.1
> > +#
> > +#        'vmnet-macos' since 6.0 (only available on macOS)
> >  ##
> >  { 'union': 'Netdev',
> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> > @@ -490,7 +604,9 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',
> > +                     'if': 'defined(CONFIG_DARWIN)' } } }
> >
> >  ##
> >  # @NetFilterDirection:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 9172d51659..ec6b40b079 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
> >  #ifdef __linux__
> >      "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
> >      "                configure a vhost-vdpa network,Establish a
> vhost-vdpa netdev\n"
> > +#endif
> > +#ifdef CONFIG_DARWIN
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifname=3Difname]\n"
> > +    "         configure a macOS-provided vmnet network in \"physical
> interface bridge\" mode\n"
> > +    "         the physical interface to bridge with defaults to en0 if
> unspecified\n"
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n"
> > +    "
>  [,dhcp_start_address=3Daddr,dhcp_end_address=3Daddr,dhcp_subnet_mask=3Dm=
ask]\n"
> > +    "         configure a macOS-provided vmnet network in \"host\" or
> \"shared\" mode\n"
> > +    "         the DHCP configuration will be set automatically if
> unspecified\n"
> >  #endif
> >      "-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=3Dnd]\n"
> >      "                configure a hub port on the hub with ID 'n'\n",
> QEMU_ARCH_ALL)
> > --
> > 2.24.3 (Apple Git-128)
> >
> >
>

--000000000000feea8705bca0183f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks very much for your help and feedback!<div><br></div=
><div>Apologies for my delay in following up. I&#39;ll submit a new version=
 that implements the feedback you&#39;ve provided here, as well as the QAPI=
 schema changes=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-1" hr=
ef=3D"mailto:armbru@redhat.com" tabindex=3D"-1">@Markus Armbruster</a>=C2=
=A0(thanks to you as well for your time and review!) pointed out.</div><div=
><br></div><div>Phillip</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 2021 at 12:25 AM Roman Bolsha=
kov &lt;<a href=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">On Thu, Feb 18, 2021 at 02:49:47PM +01=
00, <a href=3D"mailto:phillip.ennen@gmail.com" target=3D"_blank">phillip.en=
nen@gmail.com</a> wrote:<br>
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" target=
=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; <br>
&gt; This patch implements a new netdev device, reachable via -netdev<br>
&gt; vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.=
<br>
&gt; <br>
&gt; The vmnet framework provides native bridging support, and its usage in=
<br>
&gt; this patch is intended as a replacement for attempts to use a tap devi=
ce<br>
&gt; via the tuntaposx kernel extension. Notably, the tap/tuntaposx approac=
h<br>
&gt; never would have worked in the first place, as QEMU interacts with the=
<br>
&gt; tap device via poll(), and macOS does not support polling device files=
.<br>
&gt; <br>
&gt; vmnet requires either a special entitlement, granted via a provisionin=
g<br>
&gt; profile, or root access. Otherwise attempts to create the virtual<br>
&gt; interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code=
. QEMU may not<br>
&gt; currently be signed with an entitlement granted in a provisioning<br>
&gt; profile, as this would necessitate pre-signed binary build distributio=
n,<br>
&gt; rather than source-code distribution. As such, using this netdev<br>
&gt; currently requires that qemu be run with root access. I=E2=80=99ve ope=
ned a<br>
&gt; feedback report with Apple to allow the use of the relevant entitlemen=
t<br>
&gt; with this use case:<br>
&gt; <a href=3D"https://openradar.appspot.com/radar?id=3D5007417364447232" =
rel=3D"noreferrer" target=3D"_blank">https://openradar.appspot.com/radar?id=
=3D5007417364447232</a><br>
&gt; <br>
&gt; vmnet offers three operating modes, all of which are supported by this=
<br>
&gt; patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:<br>
&gt; <br>
&gt; * &quot;Host&quot; mode: Allows the vmnet interface to communicate wit=
h other<br>
&gt; * vmnet<br>
&gt; interfaces that are in host mode and also with the native host.<br>
&gt; * &quot;Shared&quot; mode: Allows traffic originating from the vmnet i=
nterface to<br>
&gt; reach the Internet through a NAT. The vmnet interface can also<br>
&gt; communicate with the native host.<br>
&gt; * &quot;Bridged&quot; mode: Bridges the vmnet interface with a physica=
l network<br>
&gt; interface.<br>
&gt; <br>
&gt; Each of these modes also provide some extra configuration that=E2=80=
=99s<br>
&gt; supported by this patch:<br>
&gt; <br>
&gt; * &quot;Bridged&quot; mode: The user may specify the physical interfac=
e to bridge<br>
&gt; with. Defaults to en0.<br>
&gt; * &quot;Host&quot; mode / &quot;Shared&quot; mode: The user may specif=
y the DHCP range and<br>
&gt; subnet. Allocated by vmnet if not provided.<br>
&gt; <br>
&gt; vmnet also offers some extra configuration options that are not<br>
&gt; supported by this patch:<br>
&gt; <br>
&gt; * Enable isolation from other VMs using vmnet<br>
&gt; * Port forwarding rules<br>
&gt; * Enabling TCP segmentation offload<br>
&gt; * Only applicable in &quot;shared&quot; mode: specifying the NAT IPv6 =
prefix<br>
&gt; * Only available in &quot;host&quot; mode: specifying the IP address f=
or the VM<br>
&gt; within an isolated network<br>
&gt; <br>
&gt; Note that this patch requires macOS 10.15 as a minimum, as this is whe=
n<br>
&gt; bridging support was implemented in vmnet.framework.<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br=
>
&gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 net/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 net/vmnet-macos.c | 447 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0| 120 ++++++++++++-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 7 files changed, 585 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 net/vmnet-macos.c<br>
&gt; <br>
<br>
Hi Phillip,<br>
<br>
Thanks for working on this!<br>
<br>
Note that the patch doesn&#39;t apply to current master and there&#39;s a l=
ot of<br>
warnings wrt trailing whitespaces:<br>
<br>
git am v4-net-macos-implement-vmnet-based-netdev.patch<br>
Applying: net/macos: implement vmnet-based netdev<br>
.git/rebase-apply/patch:462: trailing whitespace.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If QEMU is started with -nographic, no =
Cocoa event loop will be<br>
.git/rebase-apply/patch:465: trailing whitespace.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_async(dispatch_get_global_queue(DISPAT=
CH_QUEUE_PRIORITY_HIGH,<br>
.git/rebase-apply/patch:466: trailing whitespace.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
.git/rebase-apply/patch:532: trailing whitespace.<br>
# @host: the guest may communicate with the host<br>
.git/rebase-apply/patch:535: trailing whitespace.<br>
# @shared: the guest may reach the Internet through a NAT,<br>
error: patch failed: configure:778<br>
error: configure: patch does not apply<br>
Patch failed at 0001 net/macos: implement vmnet-based netdev<br>
hint: Use &#39;git am --show-current-patch&#39; to see the failed patch<br>
When you have resolved this problem, run &quot;git am --continue&quot;.<br>
If you prefer to skip this patch, run &quot;git am --skip&quot; instead.<br=
>
To restore the original branch and stop patching, run &quot;git am --abort&=
quot;.<br>
<br>
Also it would be helpful to provide a changelog under commit message<br>
delimiter (&quot;---&quot;)=C2=A0 for reach new version of the patch to pro=
vide an<br>
overview of what has been changed between the versions.<br>
<br>
&gt; diff --git a/configure b/configure<br>
&gt; index 4afd22bdf5..f449198db1 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -778,7 +778,7 @@ Darwin)<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 audio_drv_list=3D&quot;coreaudio try-sdl&quot;<br>
&gt;=C2=A0 =C2=A0 audio_possible_drivers=3D&quot;coreaudio sdl&quot;<br>
&gt; -=C2=A0 QEMU_LDFLAGS=3D&quot;-framework CoreFoundation -framework IOKi=
t $QEMU_LDFLAGS&quot;<br>
&gt; +=C2=A0 QEMU_LDFLAGS=3D&quot;-framework CoreFoundation -framework IOKi=
t -framework vmnet $QEMU_LDFLAGS&quot;<br>
<br>
I&#39;m not sure this is right approach. Instead, we need a new<br>
configuration option for the feature + proper discovery. Something like<br>
this should work:<br>
<br>
<a href=3D"https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782b=
696853824b14bd9" rel=3D"noreferrer" target=3D"_blank">https://github.com/ro=
olebo/qemu/commit/e6c52d6bedb92f16defb5782b696853824b14bd9</a><br>
<br>
&gt;=C2=A0 =C2=A0 # Disable attempts to use ObjectiveC features in os/objec=
t.h since they<br>
&gt;=C2=A0 =C2=A0 # won&#39;t work when we&#39;re compiling with gcc as a C=
 compiler.<br>
&gt;=C2=A0 =C2=A0 QEMU_CFLAGS=3D&quot;-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS=
&quot;<br>
&gt; diff --git a/net/clients.h b/net/clients.h<br>
&gt; index 92f9b59aed..463a9b2f67 100644<br>
&gt; --- a/net/clients.h<br>
&gt; +++ b/net/clients.h<br>
&gt; @@ -63,4 +63,10 @@ int net_init_vhost_user(const Netdev *netdev, const=
 char *name,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NetClientState *peer, Error **errp);<br>
&gt; +<br>
&gt; +#ifdef CONFIG_DARWIN<br>
<br>
Respectively, it would be wrapped with #ifdef CONFIG_VMNET instead of<br>
more generic CONFIG_DARWIN.<br>
<br>
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NetClientState *peer, Error **errp);<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 #endif /* QEMU_NET_CLIENTS_H */<br>
&gt; diff --git a/net/meson.build b/net/meson.build<br>
&gt; index 1076b0a7ab..8c7c32f775 100644<br>
&gt; --- a/net/meson.build<br>
&gt; +++ b/net/meson.build<br>
&gt; @@ -37,5 +37,6 @@ endif<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_POSIX&#39;, if_true: files(tap_=
posix))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#39=
;tap-win32.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VHOST_NET_VDPA&#39;, if_true: f=
iles(&#39;vhost-vdpa.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_DARWIN&#39;, if_true: files(&#39;vmn=
et-macos.c&#39;))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 subdir(&#39;can&#39;)<br>
&gt; diff --git a/net/net.c b/net/net.c<br>
&gt; index c1cd9c75f6..e68a410a89 100644<br>
&gt; --- a/net/net.c<br>
&gt; +++ b/net/net.c<br>
&gt; @@ -977,6 +977,9 @@ static int (* const net_client_init_fun[NET_CLIENT=
_DRIVER__MAX])(<br>
&gt;=C2=A0 #ifdef CONFIG_L2TPV3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_L2TPV3]=C2=A0 =C2=
=A0 =3D net_init_l2tpv3,<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_DARWIN<br>
<br>
CONFIG_VMNET should be used here as well.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [NET_CLIENT_DRIVER_VMNET_MACOS] =3D net_i=
nit_vmnet_macos,<br>
&gt; +#endif<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1a762751dd<br>
&gt; --- /dev/null<br>
&gt; +++ b/net/vmnet-macos.c<br>
&gt; @@ -0,0 +1,447 @@<br>
&gt; +/*<br>
&gt; + * vmnet.framework backed netdev for macOS 10.15+ hosts<br>
&gt; + *<br>
&gt; + * Copyright (c) 2021 Phillip Tennen &lt;<a href=3D"mailto:phillip@ax=
leos.com" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; +#include &quot;net/net.h&quot;<br>
&gt; +/* macOS vmnet framework header */<br>
&gt; +#include &lt;vmnet/vmnet.h&gt;<br>
&gt; +<br>
&gt; +typedef struct vmnet_state {<br>
&gt; +=C2=A0 =C2=A0 NetClientState nc;<br>
&gt; +=C2=A0 =C2=A0 interface_ref vmnet_iface_ref;<br>
&gt; +=C2=A0 =C2=A0 /* Switched on after vmnet informs us that the interfac=
e has started */<br>
&gt; +=C2=A0 =C2=A0 bool link_up;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If qemu_send_packet_async returns 0, this is sw=
itched off until our<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* delivery callback is invoked<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 bool qemu_ready_to_receive;<br>
&gt; +} vmnet_state_t;<br>
&gt; +<br>
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NetClientState *peer, Error **errp);<br>
&gt; +<br>
&gt; +static const char *_vmnet_status_repr(vmnet_return_t status)<br>
<br>
Underscore may be dropped.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (status) {<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SUCCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;success&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;generic failure&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_MEM_FAILURE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;out of memory&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ARGUMENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;invalid argument&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SETUP_INCOMPLETE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;setup is incomplete&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 case VMNET_INVALID_ACCESS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;insufficient permissions&quo=
t;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_PACKET_TOO_BIG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;packet size exceeds MTU&quot=
;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_BUFFER_EXHAUSTED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;kernel buffers temporarily e=
xhausted&quot;;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_TOO_MANY_PACKETS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;number of packets exceeds sy=
stem limit&quot;;<br>
&gt; +=C2=A0 =C2=A0 /* This error code was introduced in macOS 11.0 */<br>
&gt; +#if __MAC_OS_X_VERSION_MAX_ALLOWED &gt;=3D 110000<br>
&gt; +=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUSY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;sharing service busy&quot;;<=
br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;unknown status code&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static operating_modes_t _vmnet_operating_mode_enum_compat(<br>
&gt; +=C2=A0 =C2=A0 VmnetOperatingMode mode)<br>
<br>
Underscore may be dropped.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (mode) {<br>
&gt; +=C2=A0 =C2=A0 case VMNET_OPERATING_MODE_HOST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VMNET_HOST_MODE;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_OPERATING_MODE_SHARED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VMNET_SHARED_MODE;<br>
&gt; +=C2=A0 =C2=A0 case VMNET_OPERATING_MODE_BRIDGED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return VMNET_BRIDGED_MODE;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Should never happen as the modes are p=
arsed before we get here */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(false);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool vmnet_can_receive(NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);<=
br>
&gt; +=C2=A0 =C2=A0 return s-&gt;link_up;<br>
<br>
I&#39;m not sure this is correct.<br>
Did you mean s-&gt;qemu_ready_to_receive?<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t vmnet_receive_iov(NetClientState *nc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct iovec *iovs,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int iovcnt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Combine the provided iovs into a single vmnet packet=
 */<br>
&gt; +=C2=A0 =C2=A0 struct vmpktdesc *packet =3D g_new0(struct vmpktdesc, 1=
);<br>
<br>
packet_count could be used instead of 1.<br>
<br>
&gt; +=C2=A0 =C2=A0 packet-&gt;vm_pkt_iov =3D g_new0(struct iovec, iovcnt);=
<br>
&gt; +=C2=A0 =C2=A0 memcpy(packet-&gt;vm_pkt_iov, iovs, sizeof(struct iovec=
) * iovcnt);<br>
&gt; +=C2=A0 =C2=A0 packet-&gt;vm_pkt_iovcnt =3D iovcnt;<br>
<br>
Should we use iov_copy() instead?<br>
<br>
&gt; +=C2=A0 =C2=A0 packet-&gt;vm_flags =3D 0;<br>
<br>
The line is redundant with g_new0.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Figure out the packet size by iterating the iov&#39;=
s */<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; iovcnt; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct iovec *iov =3D iovs + i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 packet-&gt;vm_pkt_size +=3D iov-&gt;iov_l=
en;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I wonder if we should add a check if packet-&gt;vm_pkt_size is beyond<br>
vmnet_max_packet_size_key?<br>
<br>
Also I&#39;m not entirely sure that we should at most transmit only one<br>
packet, a sort of coalescing might be helpful (Apple claims up ot 200<br>
packets per one vmnet_write) but I&#39;m not an expert of net part of QEMU.=
<br>
Stefan may provide more info on that.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Finally, write the packet to the vmnet interface */<=
br>
&gt; +=C2=A0 =C2=A0 int packet_count =3D 1;<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t result =3D vmnet_write(s-&gt;vmnet_iface=
_ref, packet,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;packet_count);<br>
&gt; +=C2=A0 =C2=A0 if (result !=3D VMNET_SUCCESS || packet_count !=3D 1) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Failed to send packet =
to host: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _vmnet_status_repr(result))=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ssize_t wrote_bytes =3D packet-&gt;vm_pkt_size;<br>
<br>
That&#39;s going to mismatch with actual number of bytes written if<br>
packet_count returned from vmnet_write equals zero.<br>
<br>
&gt; +=C2=A0 =C2=A0 g_free(packet-&gt;vm_pkt_iov);<br>
&gt; +=C2=A0 =C2=A0 g_free(packet);<br>
&gt; +=C2=A0 =C2=A0 return wrote_bytes;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_s=
tate_t, nc, nc);<br>
&gt; +=C2=A0 =C2=A0 /* Ready to receive more packets! */<br>
&gt; +=C2=A0 =C2=A0 vmnet_client_state-&gt;qemu_ready_to_receive =3D true;<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static NetClientInfo net_vmnet_macos_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VMNET_MACOS,<br>
&gt; +=C2=A0 =C2=A0 .size =3D sizeof(vmnet_state_t),<br>
&gt; +=C2=A0 =C2=A0 .receive_iov =3D vmnet_receive_iov,<br>
&gt; +=C2=A0 =C2=A0 .can_receive =3D vmnet_can_receive,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static bool _validate_ifname_is_valid_bridge_target(const char *ifnam=
e)<br>
<br>
Underscore may be dropped from the function.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* Iterate available bridge interfaces, ensure the prov=
ided one is valid */<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t bridge_interfaces =3D vmnet_copy_shared_in=
terface_list();<br>
&gt; +=C2=A0 =C2=A0 bool failed_to_match_iface_name =3D xpc_array_apply(<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bridge_interfaces,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^bool(size_t index, xpc_object_t=C2=A0 _N=
onnull value) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(xpc_string_get_string_ptr(val=
ue), ifname)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The interface name is va=
lid! Stop iterating */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (failed_to_match_iface_name) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Invalid bridge interfa=
ce name provided: %s\n&quot;, ifname);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Valid bridge interface=
s:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_array_apply(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_copy_shared_interface=
_list(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^bool(size_t index, xpc_obj=
ect_t=C2=A0 _Nonnull value) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;\t%s\n&q=
uot;, xpc_string_get_string_ptr(value));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Keep iterating */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static xpc_object_t _construct_vmnet_interface_description(<br>
<br>
Underscore is not needed I think.<br>
<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetModeOptions *vmnet_opts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 operating_modes_t mode =3D _vmnet_operating_mode_enum_c=
ompat(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_opts-&gt;mode);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Validate options */<br>
&gt; +=C2=A0 =C2=A0 if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D VMNET_SH=
ARED_MODE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetdevVmnetModeOptionsHostOrShared mode_o=
pts =3D vmnet_opts-&gt;u.host;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If one DHCP parameter is configured, a=
ll 3 are required */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mode_opts.has_dhcp_start_address ||<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_opts.has_dhcp_end_addr=
ess ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_opts.has_dhcp_subnet_m=
ask) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(mode_opts.has_dhcp_st=
art_address &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_o=
pts.has_dhcp_end_address &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_o=
pts.has_dhcp_subnet_mask)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(=
&quot;Incomplete DHCP configuration provided\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else if (mode =3D=3D VMNET_BRIDGED_MODE) {<br>
<br>
I think we want to enable bridging mode only on macOS 10.15 and above<br>
where vmnet_copy_shared_interface_list() is supported.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Nothing to validate */<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Unknown vmnet mode %d\=
n&quot;, mode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t interface_desc =3D xpc_dictionary_create(N=
ULL, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_mode_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (mode =3D=3D VMNET_BRIDGED_MODE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Configure the provided physical i=
nterface to act<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as a bridge with QEMU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetdevVmnetModeOptionsBridged mode_opts =
=3D vmnet_opts-&gt;u.bridged;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Bridge with en0 by default */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *physical_ifname =3D mode_opts=
.has_ifname ? mode_opts.ifname :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;en0&quot;;<br>
<br>
I think a default interface is not needed here, it&#39;s better to require<=
br>
an explicit inteface to bridge with. Some people prefer wired, others<br>
wireless. Ocasionally some do both :)<br>
<br>
More comments later!<br>
<br>
Thanks,<br>
Roman<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 _validate_ifname_is_valid_bridge_target(p=
hysical_ifname);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(interface_desc,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_shared_interface_na=
me_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 physical_ifname);<br>
&gt; +=C2=A0 =C2=A0 } else if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D V=
MNET_SHARED_MODE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Pass the DHCP configuration to vmnet, =
if the user provided one */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetdevVmnetModeOptionsHostOrShared mode_o=
pts =3D vmnet_opts-&gt;u.host;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mode_opts.has_dhcp_start_address) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All DHCP arguments are a=
vailable, as per the checks above */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
nterface_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start=
_address_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_opts.d=
hcp_start_address);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
nterface_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_end_a=
ddress_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_opts.d=
hcp_end_address);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(i=
nterface_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subne=
t_mask_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode_opts.d=
hcp_subnet_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return interface_desc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(netdev-&gt;type =3D=3D NET_CLIENT_DRIVER_VMNET_M=
ACOS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 NetdevVmnetModeOptions *vmnet_opts =3D netdev-&gt;u.vmn=
et_macos.options;<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t iface_desc =3D _construct_vmnet_interface_=
description(vmnet_opts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_new_net_client(&amp;net_vmn=
et_macos_info, peer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;vmnet&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_s=
tate_t, nc, nc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dispatch_queue_t vmnet_dispatch_queue =3D dispatch_queu=
e_create(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;org.qemu.vmnet.iface_queue&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DISPATCH_QUEUE_SERIAL<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 __block vmnet_return_t vmnet_start_status =3D 0;<br>
&gt; +=C2=A0 =C2=A0 __block uint64_t vmnet_iface_mtu =3D 0;<br>
&gt; +=C2=A0 =C2=A0 __block uint64_t vmnet_max_packet_size =3D 0;<br>
&gt; +=C2=A0 =C2=A0 __block const char *vmnet_mac_address =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* We can&#39;t refer to an array type directly wi=
thin a block,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* so hold a pointer instead.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 uuid_string_t vmnet_iface_uuid =3D {0};<br>
&gt; +=C2=A0 =C2=A0 __block uuid_string_t *vmnet_iface_uuid_ptr =3D &amp;vm=
net_iface_uuid;<br>
&gt; +=C2=A0 =C2=A0 /* These are only provided in VMNET_HOST_MODE and VMNET=
_SHARED_MODE */<br>
&gt; +=C2=A0 =C2=A0 bool vmnet_provides_dhcp_info =3D (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_opts-&gt;mode =3D=3D VMNET_OPERATIN=
G_MODE_HOST ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_opts-&gt;mode =3D=3D VMNET_OPERATIN=
G_MODE_SHARED);<br>
&gt; +=C2=A0 =C2=A0 __block const char *vmnet_subnet_mask =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 __block const char *vmnet_dhcp_range_start =3D NULL;<br=
>
&gt; +=C2=A0 =C2=A0 __block const char *vmnet_dhcp_range_end =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Create the vmnet interface */<br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_t vmnet_iface_sem =3D dispatch_semap=
hore_create(0);<br>
&gt; +=C2=A0 =C2=A0 interface_ref vmnet_iface_ref =3D vmnet_start_interface=
(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iface_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_dispatch_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(vmnet_return_t status, xpc_object_t=C2=
=A0 _Nullable interface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start_status =3D status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vmnet_start_status !=3D VMNET_SUCCESS=
 || !interface_param) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Early return if the inte=
rface couldn&#39;t be started */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(v=
mnet_iface_sem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Read the configuration that vmnet=
 provided us.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The provided dictionary is owned =
by XPC and may be freed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* shortly after this block&#39;s ex=
ecution.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* So, copy data buffers now.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_iface_mtu =3D xpc_dictionary_get_ui=
nt64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mtu_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_max_packet_size =3D xpc_dictionary_=
get_uint64(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_max_packet_size_key<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mac_address =3D strdup(xpc_dictiona=
ry_get_string(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_mac_address_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *iface_uuid =3D xpc_diction=
ary_get_uuid(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_param,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_interface_id_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid_unparse_upper(iface_uuid, *vmnet_ifa=
ce_uuid_ptr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we&#39;re in a mode that provides D=
HCP info, read it out now */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vmnet_provides_dhcp_info) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_dhcp_range_start =3D =
strdup(xpc_dictionary_get_string(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_par=
am,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start_a=
ddress_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_dhcp_range_end =3D st=
rdup(xpc_dictionary_get_string(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_par=
am,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_end_add=
ress_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subnet_mask =3D strdu=
p(xpc_dictionary_get_string(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface_par=
am,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subnet_=
mask_key<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_semaphore_signal(vmnet_iface_sem=
);<br>
&gt; +=C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* And block until we receive a response from vmnet */<=
br>
&gt; +=C2=A0 =C2=A0 dispatch_semaphore_wait(vmnet_iface_sem, DISPATCH_TIME_=
FOREVER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Did we manage to start the interface? */<br>
&gt; +=C2=A0 =C2=A0 if (vmnet_start_status !=3D VMNET_SUCCESS || !vmnet_ifa=
ce_ref) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Failed to start interf=
ace: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _vmnet_status_repr(vmnet_st=
art_status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vmnet_start_status =3D=3D VMNET_FAILU=
RE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Hint: vm=
net requires running with root access\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 info_report(&quot;Started vmnet interface with configur=
ation:&quot;);<br>
&gt; +=C2=A0 =C2=A0 info_report(&quot;MTU:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %llu&quot;, vmnet_iface_mtu);<br>
&gt; +=C2=A0 =C2=A0 info_report(&quot;Max packet size:=C2=A0 %llu&quot;, vm=
net_max_packet_size);<br>
&gt; +=C2=A0 =C2=A0 info_report(&quot;MAC:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 %s&quot;, vmnet_mac_address);<br>
&gt; +=C2=A0 =C2=A0 if (vmnet_provides_dhcp_info) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info_report(&quot;DHCP IPv4 start:=C2=A0 =
%s&quot;, vmnet_dhcp_range_start);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info_report(&quot;DHCP IPv4 end:=C2=A0 =
=C2=A0 %s&quot;, vmnet_dhcp_range_end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info_report(&quot;IPv4 subnet mask: %s&qu=
ot;, vmnet_subnet_mask);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 info_report(&quot;UUID:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0%s&quot;, vmnet_iface_uuid);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* The interface is up! Set a block to run when packets=
 are received */<br>
&gt; +=C2=A0 =C2=A0 vmnet_client_state-&gt;vmnet_iface_ref =3D vmnet_iface_=
ref;<br>
&gt; +=C2=A0 =C2=A0 vmnet_return_t event_cb_stat =3D vmnet_interface_set_ev=
ent_callback(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_iface_ref,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_INTERFACE_PACKETS_AVAILABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_dispatch_queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(interface_event_t event_mask, xpc_objec=
t_t=C2=A0 _Nonnull event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event_mask !=3D VMNET_INTERFACE_PACKE=
TS_AVAILABLE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Unknown =
vmnet interface event 0x%08x\n&quot;, event_mask);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we&#39;re unable to handle more pac=
kets now, drop this packet */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vmnet_client_state-&gt;qemu_ready_to=
_receive) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO(Phillip Tennen &lt;<a href=
=3D"mailto:phillip@axleos.com" target=3D"_blank">phillip@axleos.com</a>&gt;=
): There may be more than<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* one packet available.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* As an optimization, we could read=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* vmnet_estimated_packets_available=
_key packets now.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *packet_buf =3D g_malloc0(vmnet_max_=
packet_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iovec *iov =3D g_new0(struct iovec=
, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov-&gt;iov_base =3D packet_buf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iov-&gt;iov_len =3D vmnet_max_packet_size=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int pktcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vmpktdesc *v =3D g_new0(struct vmp=
ktdesc, pktcnt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;vm_pkt_size =3D vmnet_max_packet_si=
ze;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;vm_pkt_iov =3D iov;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;vm_pkt_iovcnt =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 v-&gt;vm_flags =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_return_t result =3D vmnet_read(vmne=
t_iface_ref, v, &amp;pktcnt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Failed t=
o read packet from host: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _vmnet_status=
_repr(result));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ensure we read exactly one packet */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(pktcnt =3D=3D 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Dispatch this block to a global queue =
instead of the main queue,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* which is only created when the pr=
ogram has a Cocoa event loop.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If QEMU is started with -nographi=
c, no Cocoa event loop will be <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* created and thus the main queue w=
ill be unavailable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_async(dispatch_get_global_queue(=
DISPATCH_QUEUE_PRIORITY_HIGH, <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00), <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Deliver the packet =
to the guest<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the delivery suc=
ceeded synchronously, this returns the length<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* of the sent packet.=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_send_packet_async(=
nc, iov-&gt;iov_base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt=
;vm_pkt_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet=
_send_completed) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_client_=
state-&gt;qemu_ready_to_receive =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* It&#39;s safe to fr=
ee the packet buffers.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Even if delivery ne=
eds to wait, qemu_net_queue_append copies<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the packet buffer.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(v);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(iov);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(packet_buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread(=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 });<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Did we manage to set an event callback? */<br>
&gt; +=C2=A0 =C2=A0 if (event_cb_stat !=3D VMNET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_printf(&quot;Failed to set up a cal=
lback to receive packets: %s\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _vmnet_status_repr(vmnet_st=
art_status));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* We&#39;re now ready to receive packets */<br>
&gt; +=C2=A0 =C2=A0 vmnet_client_state-&gt;qemu_ready_to_receive =3D true;<=
br>
&gt; +=C2=A0 =C2=A0 vmnet_client_state-&gt;link_up =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Include DHCP info if we&#39;re in a relevant mode */=
<br>
&gt; +=C2=A0 =C2=A0 if (vmnet_provides_dhcp_info) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(nc-&gt;info_str, sizeof(nc-&gt;i=
nfo_str),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;d=
hcp_start=3D%s,dhcp_end=3D%s,mask=3D%s&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_d=
hcp_range_start, vmnet_dhcp_range_end,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmnet_s=
ubnet_mask);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(nc-&gt;info_str, sizeof(nc-&gt;i=
nfo_str),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;m=
ac=3D%s&quot;, vmnet_mac_address);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt; index c31748c87f..e4d4143243 100644<br>
&gt; --- a/qapi/net.json<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -450,6 +450,115 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
int&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @VmnetOperatingMode:<br>
&gt; +#<br>
&gt; +# The operating modes in which a vmnet netdev can run<br>
&gt; +# Only available on macOS<br>
&gt; +#<br>
&gt; +# @host: the guest may communicate with the host <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 and other guest network interfaces<br>
&gt; +#<br>
&gt; +# @shared: the guest may reach the Internet through a NAT, <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and may communicate with the host=
 and other guest <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network interfaces<br>
&gt; +#<br>
&gt; +# @bridged: the guest&#39;s traffic is bridged with a <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0physical network interface =
of the host<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;enum&#39;: &#39;VmnetOperatingMode&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: [ &#39;host&#39;, &#39;shared&#39;, &#39;bridg=
ed&#39; ],<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetModeOptionsBridged:<br>
&gt; +#<br>
&gt; +# Options for the vmnet-macos netdev<br>
&gt; +# that are only available in &#39;bridged&#39; mode<br>
&gt; +# Only available on macOS<br>
&gt; +#<br>
&gt; +# @ifname: the physical network interface to bridge with <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (defaults to en0 if not specified=
)<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetModeOptionsBridged&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: { &#39;*ifname&#39;:=C2=A0 &#39;str&#39; },<br=
>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetModeOptionsHostOrShared:<br>
&gt; +#<br>
&gt; +# Options for the vmnet-macos netdev<br>
&gt; +# that are only available in &#39;host&#39; or &#39;shared&#39; mode<=
br>
&gt; +# Only available on macOS<br>
&gt; +#<br>
&gt; +# @dhcp-start-address: the gateway address to use for the interface. =
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 The range to dhcp_end_address is placed in the DHCP pool.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (must be specified with dhcp-end-address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dhcp-subnet-mask)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# @dhcp-end-address: the DHCP IPv4 range end address to use for the i=
nterface. <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (must be specified with dhcp-start-address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dhcp-subnet-mask)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the inte=
rface.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (must be specified with dhcp-start-address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dhcp-end-address)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetModeOptionsHostOrShared&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: { <br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp-start-address&#39;: &#39;str&#39; ,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp-end-address&#39;:=C2=A0 =C2=A0&#39;str&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp-subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#39; =
},<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetModeOptions:<br>
&gt; +#<br>
&gt; +# Options specific to different operating modes of a vmnet netdev<br>
&gt; +# Only available on macOS<br>
&gt; +#<br>
&gt; +# @mode: the operating mode vmnet should run in<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;union&#39;: &#39;NetdevVmnetModeOptions&#39;,<br>
&gt; +=C2=A0 &#39;base&#39;: { &#39;mode&#39;: &#39;VmnetOperatingMode&#39;=
 },<br>
&gt; +=C2=A0 &#39;discriminator&#39;: &#39;mode&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;bridged&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;NetdevVmnet=
ModeOptionsBridged&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;host&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;N=
etdevVmnetModeOptionsHostOrShared&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;shared&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;Netdev=
VmnetModeOptionsHostOrShared&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetOptions:<br>
&gt; +#<br>
&gt; +# vmnet network backend<br>
&gt; +# Only available on macOS<br>
&gt; +#<br>
&gt; +# @options: a structure specifying the mode and mode-specific options=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(once QAPI supports a union=
 type as a branch to another union type,<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this structure can be chan=
ged to a union, and the contents of<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NetdevVmnetModeOptions mov=
ed here)<br>
&gt; +#<br>
&gt; +# Since: 6.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {&#39;options&#39;: &#39;NetdevVmnetModeOption=
s&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -458,10 +567,13 @@<br>
&gt;=C2=A0 # Since: 2.7<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-macos since 6.0 (only available o=
n macOS)<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vde&#39;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39; ] }<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-macos&#39;, &#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; } ] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @Netdev:<br>
&gt; @@ -475,6 +587,8 @@<br>
&gt;=C2=A0 # Since: 1.2<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;l2tpv3&#39; - since 2.1<br>
&gt; +#<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-macos&#39; since 6.0 (only av=
ailable on macOS)<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;union&#39;: &#39;Netdev&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;base&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;type&=
#39;: &#39;NetClientDriver&#39; },<br>
&gt; @@ -490,7 +604,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;hubport&#39;:=C2=A0 &#39;NetdevHubPortOptions=
&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;netmap&#39;:=C2=A0 =C2=A0&#39;NetdevNetmapOpt=
ions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;vhost-user&#39;: &#39;NetdevVhostUserOptions&=
#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39; =
} }<br>
&gt; +=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-macos&#39;: { &#39;type&#39;: &#39;NetdevVmn=
etOptions&#39;, <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;if&#39;: &#39;defined(CONFIG_DARWIN)&#39; } } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetFilterDirection:<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 9172d51659..ec6b40b079 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -2483,6 +2483,15 @@ DEF(&quot;netdev&quot;, HAS_ARG, QEMU_OPTION_ne=
tdev,<br>
&gt;=C2=A0 #ifdef __linux__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path=
/to/dev\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 configure a vhost-vdpa network,Establish a vhost-vdpa netdev\=
n&quot;<br>
&gt; +#endif<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 &quot;-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifna=
me=3Difname]\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configure a mac=
OS-provided vmnet network in \&quot;physical interface bridge\&quot; mode\n=
&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the physical in=
terface to bridge with defaults to en0 if unspecified\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n=
&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[,dhcp_start_address=3Daddr,dhcp_end_address=3Da=
ddr,dhcp_subnet_mask=3Dmask]\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configure a mac=
OS-provided vmnet network in \&quot;host\&quot; or \&quot;shared\&quot; mod=
e\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the DHCP config=
uration will be set automatically if unspecified\n&quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=
=3Dnd]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 configure a hub port on the hub with ID &#39;n&#39;\n&quot;, =
QEMU_ARCH_ALL)<br>
&gt; -- <br>
&gt; 2.24.3 (Apple Git-128)<br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000feea8705bca0183f--

