Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31254DA62D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 00:20:07 +0100 (CET)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUGSV-0002wS-01
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 19:20:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGQu-0002FJ-NB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:18:28 -0400
Received: from [2607:f8b0:4864:20::b32] (port=44716
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUGQs-0006Yy-6p
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 19:18:28 -0400
Received: by mail-yb1-xb32.google.com with SMTP id y142so1369930ybe.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 16:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Atu8dBUD5nEMVWwe8tD+FfokFBNcG2l0prhJRPaW2DY=;
 b=aOXSXShSpMLjc3dVESReG1ESHKVkKw3dOrOVUbGKifYg4W1C20GmFqQi4Xbzq0O4MT
 FIi4KGTsPjqVwcURvfqPrUEM1s1YgBNqlsW1hWWCFiDfDwX3X2PV624yHkskQdfmDP7+
 +GBX27mCSfRJ38dwiPDlxggEmuUusss30QE5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Atu8dBUD5nEMVWwe8tD+FfokFBNcG2l0prhJRPaW2DY=;
 b=WFmOWiZ45diisHP1ehF9aG+GMgudt2rZzcBtX77GXrlxvFgSI5mrBK+DZtDqHFaByd
 idFcskAQCFSWWCgCsfbgx3V3VNt/c7HeKOvaN3BuOLxUmv3ce4qt7v364h/aIpLew5mg
 jjt01n2mHc2ADSAp3Q9PDKDFwgbphedNDk03aaqqT14j5O2OrZmaa32nrHOZL+FlnzNt
 AJeW93Jyi2zeIAjdTME6qxGXsN2TLA1hxfgFSAUIXGZntMfNIUCLlHaop/CTom3DQGy4
 QbTLxx0pgWbTgYwaBd4XTfpfVZYeNQFgQBCG9kwBMV28vx7stJCEoZvlSC01xSD+bWFS
 FACQ==
X-Gm-Message-State: AOAM531+bnre0jzrowN2BgcWUxLR4mASiUU6Bs9F8EPsnqxX6jrtd2Td
 K69xhsRoJocNbCr8Szd0WD9jpIv5tkl7CgaLFVrh1g==
X-Google-Smtp-Source: ABdhPJxfZ/v5AieT/38oKzmF7CO5lUDlraiYRgKBcclk14kezABhVdqx2VlrdA7Q+3K332advA4IsxevhLhykGvDGes=
X-Received: by 2002:a5b:f0b:0:b0:624:b2f2:cc91 with SMTP id
 x11-20020a5b0f0b000000b00624b2f2cc91mr25501579ybr.324.1647386304997; Tue, 15
 Mar 2022 16:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220315202704.18263-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315202704.18263-5-Vladislav.Yaroshchuk@jetbrains.com>
 <336d22c2-abf7-a060-a665-c7399fc9a1ad@gmail.com>
In-Reply-To: <336d22c2-abf7-a060-a665-c7399fc9a1ad@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Wed, 16 Mar 2022 02:18:14 +0300
Message-ID: <CAGmdLqTvK91dJ7ZE3+oP6TpkbMVrEk8LtQErH-Xm-j-TRV-UmQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/7] net/vmnet: implement host mode (vmnet-host)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Markus Armbruster <armbru@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000848dd405da4a03d9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000848dd405da4a03d9
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 15, 2022 at 11:37 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On 2022/03/16 5:27, Vladislav Yaroshchuk wrote:
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
> > ---
> >   net/vmnet-host.c | 110 ++++++++++++++++++++++++++++++++++++++++++++---
> >   1 file changed, 104 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/vmnet-host.c b/net/vmnet-host.c
> > index a461d507c5..8f7a638967 100644
> > --- a/net/vmnet-host.c
> > +++ b/net/vmnet-host.c
> > @@ -9,16 +9,114 @@
> >    */
> >
> >   #include "qemu/osdep.h"
> > +#include "qemu/uuid.h"
> >   #include "qapi/qapi-types-net.h"
> > -#include "vmnet_int.h"
> > -#include "clients.h"
> > -#include "qemu/error-report.h"
> >   #include "qapi/error.h"
> > +#include "clients.h"
> > +#include "vmnet_int.h"
> >
> >   #include <vmnet/vmnet.h>
> >
> > +
> > +static bool validate_options(const Netdev *netdev, Error **errp)
> > +{
> > +    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
> > +    QemuUUID uuid;
>
> The variable uuid is used only when defined(MAC_OS_VERSION_11_0) && \
> MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0 and may result in a
> compilation warning otherwise. It should be in the #if block as
> network_uuid variable in build_if_desc is in the counterpart.
>
> Also I suggest to unify the names of identifiers. There are
> options->net_uuid, uuid, and network_uuid, but the differences tells
> nothing.
>
> This should be the last thing to be addressed (unless I missed something
> again.) Thank you for persistence (It's v19!). I really appreciate your
> contribution.
>
>
Thank you for your help and persistence in the review
process :)

Fixed bad naming and moved 'QemuUUID net_uuid'
definition into #if block in validate_options in v20.

Best Regards,
Vladislav Yaroshchuk

Regards,
> Akihiko Odaki
>
> > +
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> > +
> > +    if (options->has_net_uuid &&
> > +        qemu_uuid_parse(options->net_uuid, &uuid) < 0) {
> > +        error_setg(errp, "Invalid UUID provided in 'net-uuid'");
> > +        return false;
> > +    }
> > +#else
> > +    if (options->has_isolated) {
> > +        error_setg(errp,
> > +                   "vmnet-host.isolated feature is "
> > +                   "unavailable: outdated vmnet.framework API");
> > +        return false;
> > +    }
> > +
> > +    if (options->has_net_uuid) {
> > +        error_setg(errp,
> > +                   "vmnet-host.net-uuid feature is "
> > +                   "unavailable: outdated vmnet.framework API");
> > +        return false;
> > +    }
> > +#endif
> > +
> > +    if ((options->has_start_address ||
> > +         options->has_end_address ||
> > +         options->has_subnet_mask) &&
> > +        !(options->has_start_address &&
> > +          options->has_end_address &&
> > +          options->has_subnet_mask)) {
> > +        error_setg(errp,
> > +                   "'start-address', 'end-address', 'subnet-mask' "
> > +                   "should be provided together");
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static xpc_object_t build_if_desc(const Netdev *netdev,
> > +                                  NetClientState *nc)
> > +{
> > +    const NetdevVmnetHostOptions *options = &(netdev->u.vmnet_host);
> > +    xpc_object_t if_desc = xpc_dictionary_create(NULL, NULL, 0);
> > +
> > +    xpc_dictionary_set_uint64(if_desc,
> > +                              vmnet_operation_mode_key,
> > +                              VMNET_HOST_MODE);
> > +
> > +#if defined(MAC_OS_VERSION_11_0) && \
> > +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_11_0
> > +
> > +    xpc_dictionary_set_bool(if_desc,
> > +                            vmnet_enable_isolation_key,
> > +                            options->isolated);
> > +
> > +    QemuUUID network_uuid;
> > +    if (options->has_net_uuid) {
> > +        qemu_uuid_parse(options->net_uuid, &network_uuid);
> > +        xpc_dictionary_set_uuid(if_desc,
> > +                                vmnet_network_identifier_key,
> > +                                network_uuid.data);
> > +    }
> > +#endif
> > +
> > +    if (options->has_start_address) {
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_start_address_key,
> > +                                  options->start_address);
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_end_address_key,
> > +                                  options->end_address);
> > +        xpc_dictionary_set_string(if_desc,
> > +                                  vmnet_subnet_mask_key,
> > +                                  options->subnet_mask);
> > +    }
> > +
> > +    return if_desc;
> > +}
> > +
> > +static NetClientInfo net_vmnet_host_info = {
> > +    .type = NET_CLIENT_DRIVER_VMNET_HOST,
> > +    .size = sizeof(VmnetState),
> > +    .receive = vmnet_receive_common,
> > +    .cleanup = vmnet_cleanup_common,
> > +};
> > +
> >   int net_init_vmnet_host(const Netdev *netdev, const char *name,
> > -                        NetClientState *peer, Error **errp) {
> > -  error_setg(errp, "vmnet-host is not implemented yet");
> > -  return -1;
> > +                        NetClientState *peer, Error **errp)
> > +{
> > +    NetClientState *nc = qemu_new_net_client(&net_vmnet_host_info,
> > +                                             peer, "vmnet-host", name);
> > +    if (!validate_options(netdev, errp)) {
> > +        return -1;
> > +    }
> > +    return vmnet_if_create(nc, build_if_desc(netdev, nc), errp);
> >   }
>
>

--000000000000848dd405da4a03d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 15, 2022 at 11:37 PM Akih=
iko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 2022/03/16 5:27, Vladislav Yaroshchuk wrote:<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0net/vmnet-host.c | 110 +++++++++++++++++++++++++++++++++++=
+++++++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 104 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/net/vmnet-host.c b/net/vmnet-host.c<br>
&gt; index a461d507c5..8f7a638967 100644<br>
&gt; --- a/net/vmnet-host.c<br>
&gt; +++ b/net/vmnet-host.c<br>
&gt; @@ -9,16 +9,114 @@<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/uuid.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/qapi-types-net.h&quot;<br>
&gt; -#include &quot;vmnet_int.h&quot;<br>
&gt; -#include &quot;clients.h&quot;<br>
&gt; -#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;clients.h&quot;<br>
&gt; +#include &quot;vmnet_int.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &lt;vmnet/vmnet.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +static bool validate_options(const Netdev *netdev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetHostOptions *options =3D &amp;(netdev-=
&gt;u.vmnet_host);<br>
&gt; +=C2=A0 =C2=A0 QemuUUID uuid;<br>
<br>
The variable uuid is used only when defined(MAC_OS_VERSION_11_0) &amp;&amp;=
 \<br>
MAC_OS_X_VERSION_MIN_REQUIRED &gt;=3D MAC_OS_VERSION_11_0 and may result in=
 a <br>
compilation warning otherwise. It should be in the #if block as <br>
network_uuid variable in build_if_desc is in the counterpart.<br>
<br>
Also I suggest to unify the names of identifiers. There are <br>
options-&gt;net_uuid, uuid, and network_uuid, but the differences tells <br=
>
nothing.<br>
<br>
This should be the last thing to be addressed (unless I missed something <b=
r>
again.) Thank you for persistence (It&#39;s v19!). I really appreciate your=
 <br>
contribution.<br>
<br></blockquote><div><br></div><div>Thank you for your help and persistenc=
e in the review=C2=A0<br>process :)<br><br>Fixed bad naming and moved &#39;=
QemuUUID net_uuid&#39;<br>definition into #if block in validate_options in =
v20.<br><br>Best Regards,<br>Vladislav Yaroshchuk<br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; +<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED &gt;=3D MAC_OS_VERSION_11=
_0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_net_uuid &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_uuid_parse(options-&gt;net_uuid, &am=
p;uuid) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Invalid UUID provi=
ded in &#39;net-uuid&#39;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_isolated) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;vmnet-host.isolated feature is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unavailable: outdated vmnet.framework API&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_net_uuid) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;vmnet-host.net-uuid feature is &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;unavailable: outdated vmnet.framework API&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ((options-&gt;has_start_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&gt;has_end_address ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options-&gt;has_subnet_mask) &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(options-&gt;has_start_address &amp;&amp=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_end_address &amp;&=
amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;has_subnet_mask)) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;&#39;start-address&#39;, &#39;end-address&#39;, &#39;subnet-mask&#39;=
 &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;should be provided together&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static xpc_object_t build_if_desc(const Netdev *netdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *nc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const NetdevVmnetHostOptions *options =3D &amp;(netdev-=
&gt;u.vmnet_host);<br>
&gt; +=C2=A0 =C2=A0 xpc_object_t if_desc =3D xpc_dictionary_create(NULL, NU=
LL, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_uint64(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_operation_mode_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMNET_HOST_MODE);<br>
&gt; +<br>
&gt; +#if defined(MAC_OS_VERSION_11_0) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 MAC_OS_X_VERSION_MIN_REQUIRED &gt;=3D MAC_OS_VERSION_11=
_0<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 xpc_dictionary_set_bool(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_enable_isolation_key,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;isolated);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QemuUUID network_uuid;<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_net_uuid) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_uuid_parse(options-&gt;net_uuid, &am=
p;network_uuid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_uuid(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_network_identifier_key,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network_uuid.data);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (options-&gt;has_start_address) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_start_address_key,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;start_address=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_end_address_key,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;end_address);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 xpc_dictionary_set_string(if_desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet_subnet_mask_key,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options-&gt;subnet_mask);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return if_desc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static NetClientInfo net_vmnet_host_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .type =3D NET_CLIENT_DRIVER_VMNET_HOST,<br>
&gt; +=C2=A0 =C2=A0 .size =3D sizeof(VmnetState),<br>
&gt; +=C2=A0 =C2=A0 .receive =3D vmnet_receive_common,<br>
&gt; +=C2=A0 =C2=A0 .cleanup =3D vmnet_cleanup_common,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int net_init_vmnet_host(const Netdev *netdev, const char *=
name,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NetClientState *peer, Error **errp) {<br>
&gt; -=C2=A0 error_setg(errp, &quot;vmnet-host is not implemented yet&quot;=
);<br>
&gt; -=C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NetClientState *peer, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_new_net_client(&amp;net_vmn=
et_host_info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0peer, &quot;vmnet-host&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 if (!validate_options(netdev, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return vmnet_if_create(nc, build_if_desc(netdev, nc), e=
rrp);<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
</blockquote></div></div>

--000000000000848dd405da4a03d9--

