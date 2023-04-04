Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E46D64DA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNU-0002Q7-Jr; Tue, 04 Apr 2023 10:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjhNH-0002NN-W8
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pjhNE-0001NB-Ss
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680617457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BR3rpZLTV4qe5RCwVbGSyFizXoWR6CoH/lzB5jqh94=;
 b=VUX4XR16rs2Qkn/pvcA2fkDIOoVmbYUyzptvmoH+fMTTsA8pNeEGa4yQIPsGDqKAILZkdC
 sJn+GKjMAsRmmBTIKiWNHk5NortOJwQd8fQguNvmxcEzqC4PhPMg5MRmU5ukY1FZoxLMHz
 2Z7QdYcHq8DrAocsC2RoZSarvpUkosc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-f0tJxxuRMAW_2rImGLm_nA-1; Tue, 04 Apr 2023 10:10:54 -0400
X-MC-Unique: f0tJxxuRMAW_2rImGLm_nA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u30-20020a50c05e000000b0050299de3f82so10480455edd.10
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2BR3rpZLTV4qe5RCwVbGSyFizXoWR6CoH/lzB5jqh94=;
 b=bGfC6/R4L0Atq87AqS9LPdC4ipyzV+QjVLNmwRkA8lGX7BqQgqjZw4QuDX9UMNk5ZK
 GxR3JQfXXMLnwbaHyh1ET+Pd06Q8o5v0e0TJm/2NCI52vBglvEwN9V6y/G/lg9L0TohV
 0YnMyd+fWLImcH/QKqYct5XngtBM0iksTpo9jlP+iL0Pd6DyNy8QasTfbyTmhImGefWt
 U/8adt9p1odVzhpLxbHTY4c/pix5euy/ZKQNI2VV86JmetFXXgn7N8fKYMmfxFK33IMF
 2xjqZmct0XldNiM2PdVc1JQzqkfW40bet0j7R8tEaIn0AINgkhGnkAf0xLt1HmAuT3X8
 fttQ==
X-Gm-Message-State: AAQBX9eOMPFyG1Uu6jeSfXBBs3Ss9YWkk72f1IjL6abZpGuRSD5IRiHb
 pHw8cBkjPEndHK1zWjBqdSwQhllFAOnAAkySkZCJfZ2mp7IPQ87xQBKviR6QQxlZk2kwRktOvz6
 1oawB0Ueffh5UZGXM+MxqYr9DyrcJNdOm2nB8cZY=
X-Received: by 2002:a17:906:5fd4:b0:933:f6e8:26d9 with SMTP id
 k20-20020a1709065fd400b00933f6e826d9mr1478676ejv.15.1680617451865; 
 Tue, 04 Apr 2023 07:10:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350b1EtV5YlQpfLzsDzP88+qsvLe6JSSFpZ2tUgMX6u6RO41jyqbwO2giYwl54mxVbGGlnCbDfRYFGRtzHoS6DRo=
X-Received: by 2002:a17:906:5fd4:b0:933:f6e8:26d9 with SMTP id
 k20-20020a1709065fd400b00933f6e826d9mr1478668ejv.15.1680617451609; Tue, 04
 Apr 2023 07:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230403161618.1344414-1-imammedo@redhat.com>
 <20230403131833-mutt-send-email-mst@kernel.org>
 <20230404102807.4626b0be@imammedo.users.ipa.redhat.com>
 <20230404084603-mutt-send-email-mst@kernel.org>
 <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230404160435.45c2513d@imammedo.users.ipa.redhat.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Tue, 4 Apr 2023 19:40:40 +0530
Message-ID: <CAK3XEhMSt5fWZV+AF6nT5yMxFP+PQNfEyCK0yVpCvJSxRwVoug@mail.gmail.com>
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 jusual@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="00000000000034f31805f8833e2b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000034f31805f8833e2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 7:34=E2=80=AFPM Igor Mammedov <imammedo@redhat.com> =
wrote:

> On Tue, 4 Apr 2023 08:46:15 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:
> > > On Mon, 3 Apr 2023 13:23:45 -0400
> > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > > On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:
> > > > > with Q35 using ACPI PCI hotplug by default, user's request to
> unplug
> > > > > device is ignored when it's issued before guest OS has been boote=
d.
> > > > > And any additional attempt to request device hot-unplug afterward=
s
> > > > > results in following error:
> > > > >
> > > > >   "Device XYZ is already in the process of unplug"
> > > > >
> > > > > arguably it can be considered as a regression introduced by [2],
> > > > > before which it was possible to issue unplug request multiple
> > > > > times.
> > > > >
> > > > > Allowing pending delete expire brings ACPI PCI hotplug on par
> > > > > with native PCIe unplug behavior [1] which in its turn refers
> > > > > back to ACPI PCI hotplug ability to repeat unplug requests.
> > > > >
> > > > > PS:
> > > > > >From ACPI point of view, unplug request sets PCI hotplug status
>
> > > > > bit in GPE0 block. However depending on OSPM, status bits may
> > > > > be retained (Windows) or cleared (Linux) during guest's ACPI
> > > > > subsystem initialization, and as result Linux guest looses
> > > > > plug/unplug event (no SCI generated) if plug/unplug has
> > > > > happend before guest OS initialized GPE registers handling.
> > > > > I couldn't find any restrictions wrt OPM clearing GPE status
> > > > > bits ACPI spec.
> > > > > Hence a fallback approach is to let user repeat unplug request
> > > > > later at the time when guest OS has booted.
> > > > >
> > > > > 1) 18416c62e3 ("pcie: expire pending delete")
> > > > > 2)
> > > > > Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > >
> > > > A bit concerned about how this interacts with failover,
> > > > and 5sec is a lot of time that I hoped we'd avoid with acpi.
> > > > Any better ideas of catching such misbehaving guests?
> > >
> > > It shouldn't affect affect failover, pending_delete is not
> > > cleared after all (only device removal should do that).
> > > So all patch does is allowing to reissue unplug request
> > > in case it was lost, delay here doesn't mean much
> > > (do you have any preference wrt specific value)?
> >
> > I'd prefer immediately.
>
> ok, lets use 1ms then, I'd rather reuse the preexisting
> pending_deleted_expires_ms machinery instead of
> special-casing immediate repeat.
>

Sounds good to me.


>
> >
> > > As for 'misbehaving' - I tried to find justification
> > > for it in spec, but I couldn't.
> > > Essentially it's upto OSPM to clear or not GPE status
> > > bits at startup (linux was doing it since forever),
> > > depending on guest's ability to handle hotplug events
> > > at boot time.
> > >
> > > It's more a user error, ACPI hotplug does imply booted
> > > guest for it to function properly. So it's fine to
> > > loose unplug event at boot time. What QEMU does wrong is
> > > preventing follow up unplug requests.
> > >
> > > >
> > > > Also at this point I do not know why we deny hotplug
> > > > pending_deleted_event in qdev core.
> > > > Commit log says:
> > > >
> > > >     Device unplug can be done asynchronously. Thus, sending the
> second
> > > >     device_del before the previous unplug is complete may lead to
> > > >     unexpected results. On PCIe devices, this cancels the hot-unplu=
g
> > > >     process.
> > > >
> > > > so it's a work around for an issue in pcie hotplug (and maybe shpc
> > > > too?). Maybe we should have put that check in pcie/shpc and
> > > > leave acpi along?
> > > >
> > > >
> > > >
> > > >
> > > > > ---
> > > > > CC: mst@redhat.com
> > > > > CC: anisinha@redhat.com
> > > > > CC: jusual@redhat.com
> > > > > CC: kraxel@redhat.com
> > > > > ---
> > > > >  hw/acpi/pcihp.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > > > > index dcfb779a7a..cd4f9fee0a 100644
> > > > > --- a/hw/acpi/pcihp.c
> > > > > +++ b/hw/acpi/pcihp.c
> > > > > @@ -357,6 +357,8 @@ void
> acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > > > >       * acpi_pcihp_eject_slot() when the operation is completed.
> > > > >       */
> > > > >      pdev->qdev.pending_deleted_event =3D true;
> > > > > +    pdev->qdev.pending_deleted_expires_ms =3D
> > > > > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs =
*/
> > > > >      s->acpi_pcihp_pci_status[bsel].down |=3D (1U << slot);
> > > > >      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS=
);
> > > > >  }
> > > > > --
> > > > > 2.39.1
> > > >
> >
>
>

--00000000000034f31805f8833e2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 7:34=E2=80=AFP=
M Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com">imammedo@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Tue, 4 Apr 2023 08:46:15 -0400<br>
&quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
<br>
&gt; On Tue, Apr 04, 2023 at 10:28:07AM +0200, Igor Mammedov wrote:<br>
&gt; &gt; On Mon, 3 Apr 2023 13:23:45 -0400<br>
&gt; &gt; &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.c=
om" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrot=
e:=C2=A0 <br>
&gt; &gt; &gt; &gt; with Q35 using ACPI PCI hotplug by default, user&#39;s =
request to unplug<br>
&gt; &gt; &gt; &gt; device is ignored when it&#39;s issued before guest OS =
has been booted.<br>
&gt; &gt; &gt; &gt; And any additional attempt to request device hot-unplug=
 afterwards<br>
&gt; &gt; &gt; &gt; results in following error:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0&quot;Device XYZ is already in the process =
of unplug&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; arguably it can be considered as a regression introduce=
d by [2],<br>
&gt; &gt; &gt; &gt; before which it was possible to issue unplug request mu=
ltiple<br>
&gt; &gt; &gt; &gt; times.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Allowing pending delete expire brings ACPI PCI hotplug =
on par<br>
&gt; &gt; &gt; &gt; with native PCIe unplug behavior [1] which in its turn =
refers<br>
&gt; &gt; &gt; &gt; back to ACPI PCI hotplug ability to repeat unplug reque=
sts.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; PS:=C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; &gt;From ACPI point of view, unplug request sets PCI ho=
tplug status=C2=A0 =C2=A0 <br>
&gt; &gt; &gt; &gt; bit in GPE0 block. However depending on OSPM, status bi=
ts may<br>
&gt; &gt; &gt; &gt; be retained (Windows) or cleared (Linux) during guest&#=
39;s ACPI<br>
&gt; &gt; &gt; &gt; subsystem initialization, and as result Linux guest loo=
ses<br>
&gt; &gt; &gt; &gt; plug/unplug event (no SCI generated) if plug/unplug has=
<br>
&gt; &gt; &gt; &gt; happend before guest OS initialized GPE registers handl=
ing.<br>
&gt; &gt; &gt; &gt; I couldn&#39;t find any restrictions wrt OPM clearing G=
PE status<br>
&gt; &gt; &gt; &gt; bits ACPI spec.<br>
&gt; &gt; &gt; &gt; Hence a fallback approach is to let user repeat unplug =
request<br>
&gt; &gt; &gt; &gt; later at the time when guest OS has booted.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; 1) 18416c62e3 (&quot;pcie: expire pending delete&quot;)=
<br>
&gt; &gt; &gt; &gt; 2)<br>
&gt; &gt; &gt; &gt; Fixes: cce8944cc9ef (&quot;qdev-monitor: Forbid repeate=
d device_del&quot;)<br>
&gt; &gt; &gt; &gt; Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imam=
medo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;=C2=A0 =C2=A0=
 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; A bit concerned about how this interacts with failover,<br>
&gt; &gt; &gt; and 5sec is a lot of time that I hoped we&#39;d avoid with a=
cpi.<br>
&gt; &gt; &gt; Any better ideas of catching such misbehaving guests?=C2=A0 =
<br>
&gt; &gt; <br>
&gt; &gt; It shouldn&#39;t affect affect failover, pending_delete is not<br=
>
&gt; &gt; cleared after all (only device removal should do that).<br>
&gt; &gt; So all patch does is allowing to reissue unplug request<br>
&gt; &gt; in case it was lost, delay here doesn&#39;t mean much<br>
&gt; &gt; (do you have any preference wrt specific value)?=C2=A0 <br>
&gt; <br>
&gt; I&#39;d prefer immediately.<br>
<br>
ok, lets use 1ms then, I&#39;d rather reuse the preexisting<br>
pending_deleted_expires_ms machinery instead of<br>
special-casing immediate repeat.<br></blockquote><div><br></div><div>Sounds=
 good to me.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; <br>
&gt; &gt; As for &#39;misbehaving&#39; - I tried to find justification<br>
&gt; &gt; for it in spec, but I couldn&#39;t.<br>
&gt; &gt; Essentially it&#39;s upto OSPM to clear or not GPE status<br>
&gt; &gt; bits at startup (linux was doing it since forever),<br>
&gt; &gt; depending on guest&#39;s ability to handle hotplug events<br>
&gt; &gt; at boot time.<br>
&gt; &gt; <br>
&gt; &gt; It&#39;s more a user error, ACPI hotplug does imply booted<br>
&gt; &gt; guest for it to function properly. So it&#39;s fine to<br>
&gt; &gt; loose unplug event at boot time. What QEMU does wrong is<br>
&gt; &gt; preventing follow up unplug requests.=C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Also at this point I do not know why we deny hotplug<br>
&gt; &gt; &gt; pending_deleted_event in qdev core.=C2=A0 <br>
&gt; &gt; &gt; Commit log says:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0Device unplug can be done asynchronously.=
 Thus, sending the second<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0device_del before the previous unplug is =
complete may lead to<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0unexpected results. On PCIe devices, this=
 cancels the hot-unplug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0process.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; so it&#39;s a work around for an issue in pcie hotplug (and =
maybe shpc<br>
&gt; &gt; &gt; too?). Maybe we should have put that check in pcie/shpc and<=
br>
&gt; &gt; &gt; leave acpi along?<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; CC: <a href=3D"mailto:mst@redhat.com" target=3D"_blank"=
>mst@redhat.com</a><br>
&gt; &gt; &gt; &gt; CC: <a href=3D"mailto:anisinha@redhat.com" target=3D"_b=
lank">anisinha@redhat.com</a><br>
&gt; &gt; &gt; &gt; CC: <a href=3D"mailto:jusual@redhat.com" target=3D"_bla=
nk">jusual@redhat.com</a><br>
&gt; &gt; &gt; &gt; CC: <a href=3D"mailto:kraxel@redhat.com" target=3D"_bla=
nk">kraxel@redhat.com</a><br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 hw/acpi/pcihp.c | 2 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
&gt; &gt; &gt; &gt; index dcfb779a7a..cd4f9fee0a 100644<br>
&gt; &gt; &gt; &gt; --- a/hw/acpi/pcihp.c<br>
&gt; &gt; &gt; &gt; +++ b/hw/acpi/pcihp.c<br>
&gt; &gt; &gt; &gt; @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_reque=
st_cb(HotplugHandler *hotplug_dev,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* acpi_pcihp_eject_slot() whe=
n the operation is completed.<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 pdev-&gt;qdev.pending_deleted_event=
 =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pdev-&gt;qdev.pending_deleted_expires_ms=
 =3D<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clock_get_ms(QEMU_CLO=
CK_VIRTUAL) + 5000; /* 5 secs */<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;acpi_pcihp_pci_status[bsel].d=
own |=3D (1U &lt;&lt; slot);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 acpi_send_event(DEVICE(hotplug_dev)=
, ACPI_PCI_HOTPLUG_STATUS);<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; -- <br>
&gt; &gt; &gt; &gt; 2.39.1=C2=A0 =C2=A0 <br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000034f31805f8833e2b--


