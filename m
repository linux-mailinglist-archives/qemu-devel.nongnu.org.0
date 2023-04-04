Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC946D682B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:02:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjj5k-0006M5-DU; Tue, 04 Apr 2023 12:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjj5B-000622-Oi
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:00:31 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjj55-0000sM-N9
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:00:28 -0400
Received: by mail-ed1-x530.google.com with SMTP id eg48so132501130edb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1680624017; x=1683216017;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnbQpTPXZqn/fH6T+i2fN71U7OOpZ9l2Dr+GSiQ/XkQ=;
 b=Xr3ymvzx9B26FBxCoajHFLAa507jJJ02c8b94QtxRiOcgCEdgTRzZOQvexarLVtcvt
 ixSEAJYkTtTSMzw4vC76Fst0wMu7m1atAIKqT/jnDYt+ViDsgWMzpHUGPlHr71Ce6ke9
 4Va/REVR14Xddua/v3u7dJHbbSqNBMyd5clPeCKWF5yzb/dFz2SWaySzUu0CQhsHezUu
 g5AbtS2mxqGpL9WHVoy25X0vVV1ZeVpUocwKZbqfzs+oGD5hfLmfIuJMqgfy0Md2VXrw
 r76KV09RmlwWyV8hb3n9Zqow2s+dOen6JyieGAAZwSCVQQbVs9G8yqc8fY4VRLz6zkAo
 5Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680624017; x=1683216017;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnbQpTPXZqn/fH6T+i2fN71U7OOpZ9l2Dr+GSiQ/XkQ=;
 b=s9KWyew8E4ASkVo6yeI6T0/cYQpAtpudIoQUwHRWvtNkaYSRIX+rpjbi6ayZiGfXLv
 RQ8jaZ2pQXBEIFAdXKtzIcziid7ZMNijoEHLPZIK8zHsT96XBzV7ToYkfzW7YgiDJ8iq
 6gjZu73VYLDs8NnJPJol222Ysh6uquSQ1WPn28cn5qUoNX9eIoSoxd00n+flC8OSlhpN
 5mvEZ7x8RBjb6KlWMkZhRUGALzd7/uFTArIJEietk2J5KoKL5tBmLvNW/AJaBfHOXuuG
 BjO8+U94jLF1oxMcMZRcAsRUyYehXRL5IYrWFYosthLbZkK4EPoubHa4J3I5tws8PSIc
 xogQ==
X-Gm-Message-State: AAQBX9cLy1LU0mjZxfbcccg7W0DfLc057eTqw6Pr3WCq3tT49OY3v485
 v6WA7/LYd8u1zEpz3ukpgO95sCD4K2OG0Zy7YUY1Qw==
X-Google-Smtp-Source: AKy350YMHFX5xF+wuyKDHnQMn21EQ3GVxt3h2MMOFxfxot+XrerUJN8CF7an213Rolp3XNn33f5Pn30RpKtfyCUqmJQ=
X-Received: by 2002:a50:d597:0:b0:502:3c99:417f with SMTP id
 v23-20020a50d597000000b005023c99417fmr1673503edi.6.1680624017137; Tue, 04 Apr
 2023 09:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
 <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
 <CAMGffE=cxQzMrT+wbPazApmsGfgAx6z8O0DzEJfWyMQaGFs80w@mail.gmail.com>
 <20230404142553.31030bb7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230404142553.31030bb7@imammedo.users.ipa.redhat.com>
From: Yu Zhang <yu.zhang@ionos.com>
Date: Tue, 4 Apr 2023 18:00:06 +0200
Message-ID: <CAHEcVy5xSvOWXNV99DTQ0dBMEATZzEgjw2exKMk5wUstjmR3Kw@mail.gmail.com>
Subject: Re: an issue for device hot-unplug
To: Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Jinpu Wang <jinpu.wang@ionos.com>, 
 Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="0000000000008af65305f884c5f8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::530;
 envelope-from=yu.zhang@ionos.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000008af65305f884c5f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> this patch targets corner case of early boot where
> guest hasn't initialized ACPI subsystem yet and 'broken'
> management asking to unplug device too early which leads
> to device stuck in being unplugged state due to regression
> in QEMU.
> However, It doesn't apply to fully booted guest.

by adding a few debug lines I see that in
acpi_pcihp_device_unplug_request_cb(),

    pdev->qdev.pending_deleted_event =3D true;

was executed, which then directly triggered the error in:

void qmp_device_del(const char *id, Error **errp)
{
    DeviceState *dev =3D find_device_state(id, errp);
    if (dev !=3D NULL) {
        if (dev->pending_deleted_event &&
            (dev->pending_deleted_expires_ms =3D=3D 0 ||
             dev->pending_deleted_expires_ms >
qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
            error_setg(errp, "Device %s is already in the "
                             "process of unplug", id);
            return;
        }

        qdev_unplug(dev, errp);
    }
}

In QEMU code, there are 6 lines where this flag is changed:

hw/core/qdev.c:564:        dev->pending_deleted_event =3D false;
hw/core/qdev.c:601:        dev->pending_deleted_event =3D true;
hw/acpi/pcihp.c:219:                    qdev->pending_deleted_event =3D fal=
se;
hw/acpi/pcihp.c:359:    pdev->qdev.pending_deleted_event =3D true;
hw/pci/pcie.c:516:        dev->qdev.pending_deleted_event =3D false;
hw/pci/pcie.c:573:    dev->pending_deleted_event =3D true;

Considering the complexity of the code, the logic for setting and clearing
this flag
seems not quite straightforward. I doubt that the setting of
pending_deleted_event in
acpi_pcihp_device_unplug_request_cb() is the appropriate approach to
accomplish its target.


On Tue, Apr 4, 2023 at 2:25=E2=80=AFPM Igor Mammedov <imammedo@redhat.com> =
wrote:

> On Tue, 4 Apr 2023 08:45:54 +0200
> Jinpu Wang <jinpu.wang@ionos.com> wrote:
>
> > Hi Yu,
> >
> > On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang <yu.zhang@ionos.com> wr=
ote:
> > >
> > > Dear Laurent,
> > >
> > > Thank you for your quick reply. We used qemu-7.1, but it is
> reproducible with qemu from v6.2 to the recent v8.0 release candidates.
> > > I found that it's introduced by the commit  9323f892b39 (between
> v6.2.0-rc2 and v6.2.0-rc3).
> > >
> > > If it doesn't break anything else, it suffices to remove the line
> below from acpi_pcihp_device_unplug_request_cb():
> > >
> > >     pdev->qdev.pending_deleted_event =3D true;
> > >
> > > but you may have a reason to keep it. First of all, I'll open a bug i=
n
> the bug tracker and let you know.
> > >
> > > Best regards,
> > > Yu Zhang
> > This patch from Igor Mammedov seems relevant,
> >
> https://lore.kernel.org/qemu-devel/20230403131833-mutt-send-email-mst@ker=
nel.org/T/#t
>
> this patch targets corner case of early boot where
> guest hasn't initialized ACPI subsystem yet and 'broken'
> management asking to unplug device too early which leads
> to device stuck in being unplugged state due to regression
> in QEMU.
> However, It doesn't apply to fully booted guest.
>
> [...]
>
> > >> > The purpose is for detecting the end of the PCI device hot-unplug.
> However, we feel the
> > >> > error confusing. How is it possible that a disk "is already in the
> process of unplug"
> > >> > during the first hot-unplug attempt? So far as I know, the issue
> was also encountered by
> > >> > libvirt, but they simply ignored it:
> > >> >
> > >> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
> > >> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659>
> see my other reply email/BZ comment 17.
>
> [...]
>
>

--0000000000008af65305f884c5f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; this patch targets corner case of early boot where<br=
>&gt; guest hasn&#39;t initialized ACPI subsystem yet and &#39;broken&#39;<=
br>&gt; management asking to unplug device too early which leads<br>&gt; to=
 device stuck in being unplugged state due to regression<br>&gt; in QEMU.<b=
r>&gt; However, It doesn&#39;t apply to fully booted guest.<br><br>by addin=
g a few debug lines I see that in acpi_pcihp_device_unplug_request_cb(), <b=
r><br>=C2=A0 =C2=A0 pdev-&gt;qdev.pending_deleted_event =3D true;<br><br>wa=
s executed, which then directly triggered the error in: <br><br>void qmp_de=
vice_del(const char *id, Error **errp)<br>{<br>=C2=A0 =C2=A0 DeviceState *d=
ev =3D find_device_state(id, errp);<br>=C2=A0 =C2=A0 if (dev !=3D NULL) {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dev-&gt;pending_deleted_event &amp;&amp;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dev-&gt;pending_deleted_expir=
es_ms =3D=3D 0 ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&g=
t;pending_deleted_expires_ms &gt; qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Device=
 %s is already in the &quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;process=
 of unplug&quot;, id);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_u=
nplug(dev, errp);<br>=C2=A0 =C2=A0 }<br>}<br><br>In QEMU code, there are 6 =
lines where this flag is changed:<br><br>hw/core/qdev.c:564: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dev-&gt;pending_deleted_event =3D false;<br>hw/core/qdev.c:601=
: =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;pending_deleted_event =3D true;<br>hw/=
acpi/pcihp.c:219: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0qdev-&gt;pending_deleted_event =3D false;<br>hw/acpi/pcihp.c:3=
59: =C2=A0 =C2=A0pdev-&gt;qdev.pending_deleted_event =3D true;<br>hw/pci/pc=
ie.c:516: =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;qdev.pending_deleted_event =3D=
 false;<br>hw/pci/pcie.c:573: =C2=A0 =C2=A0dev-&gt;pending_deleted_event =
=3D true;<br><br>Considering the complexity of the code, the logic for sett=
ing and clearing this flag <br>seems not quite straightforward. I doubt tha=
t the setting of pending_deleted_event in <br>acpi_pcihp_device_unplug_requ=
est_cb() is the appropriate approach to accomplish its target.<br></div><di=
v dir=3D"ltr"><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4, 2023 at 2:25=E2=80=AFPM Igor M=
ammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_blank">imamme=
do@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 4 Apr 2023 08:45:54 +0200<br>
Jinpu Wang &lt;<a href=3D"mailto:jinpu.wang@ionos.com" target=3D"_blank">ji=
npu.wang@ionos.com</a>&gt; wrote:<br>
<br>
&gt; Hi Yu,<br>
&gt; <br>
&gt; On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang &lt;<a href=3D"mailto:=
yu.zhang@ionos.com" target=3D"_blank">yu.zhang@ionos.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Dear Laurent,<br>
&gt; &gt;<br>
&gt; &gt; Thank you for your quick reply. We used qemu-7.1, but it is repro=
ducible with qemu from v6.2 to the recent v8.0 release candidates.<br>
&gt; &gt; I found that it&#39;s introduced by the commit=C2=A0 9323f892b39 =
(between v6.2.0-rc2 and v6.2.0-rc3).<br>
&gt; &gt;<br>
&gt; &gt; If it doesn&#39;t break anything else, it suffices to remove the =
line below from acpi_pcihp_device_unplug_request_cb():<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0pdev-&gt;qdev.pending_deleted_event =3D true;<=
br>
&gt; &gt;<br>
&gt; &gt; but you may have a reason to keep it. First of all, I&#39;ll open=
 a bug in the bug tracker and let you know.<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt; Yu Zhang=C2=A0 <br>
&gt; This patch from Igor Mammedov seems relevant,<br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/20230403131833-mutt-send=
-email-mst@kernel.org/T/#t" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/qemu-devel/20230403131833-mutt-send-email-mst@kernel.org/T/#t=
</a><br>
<br>
this patch targets corner case of early boot where<br>
guest hasn&#39;t initialized ACPI subsystem yet and &#39;broken&#39;<br>
management asking to unplug device too early which leads<br>
to device stuck in being unplugged state due to regression<br>
in QEMU.<br>
However, It doesn&#39;t apply to fully booted guest.<br>
<br>
[...]<br>
<br>
&gt; &gt;&gt; &gt; The purpose is for detecting the end of the PCI device h=
ot-unplug. However, we feel the<br>
&gt; &gt;&gt; &gt; error confusing. How is it possible that a disk &quot;is=
 already in the process of unplug&quot;<br>
&gt; &gt;&gt; &gt; during the first hot-unplug attempt? So far as I know, t=
he issue was also encountered by<br>
&gt; &gt;&gt; &gt; libvirt, but they simply ignored it:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1878659" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D1878659</a><br>
&gt; &gt;&gt; &gt; &lt;<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1878659" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.=
com/show_bug.cgi?id=3D1878659</a>&gt;<br>
see my other reply email/BZ comment 17.<br>
<br>
[...]<br>
<br>
</blockquote></div>

--0000000000008af65305f884c5f8--

