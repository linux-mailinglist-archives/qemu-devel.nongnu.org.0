Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F261E665
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:18:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orn0k-0003BS-8t; Sun, 06 Nov 2022 16:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1orn0h-0003A0-VS
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:16:55 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1orn0g-0002lF-6W
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:16:55 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id z189so8955623vsb.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qkl7n40MVHTlj5jGhb/Qdl8SSxxuzDMk1W6tp9Ej0VQ=;
 b=nwcuZ6iF3dMLhg/4ky+rmINmIlSUqiUVLPrs/rgqVVIOCmd/SlBO5nRsdeSDASwzWv
 +fSzqlD29dG9dF2+ISjWaG14N89z+nKTqnAAJovVtL0wSvQxS+zNRLPlVGefn900xPGw
 ReYcw9Rif0IKlmfLSTEWB3ra9Ft/vORs11m19CIXSX38JDn97ktgLw/pjpFINpt+lPbU
 cOFtAg/RME6oxs1fk+1S/O9KnOZMBq4F4+ADneo0OdBwRXwmO8YiCsrVc1FnLeFUBGIB
 UeORe1dpalUlX+3+hH+eKOTFIgplUYrjQddQYDrViW8oLDtKOb+qOK+CZNzO21zazmE9
 jXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkl7n40MVHTlj5jGhb/Qdl8SSxxuzDMk1W6tp9Ej0VQ=;
 b=ODueH8hNW7XJXOs/0wkG/NKj4zUL7Ug1GL+cLEw2W+gI0fQEz8v26JkjyJu0OBQ1IM
 XQ6blVmQngwXfoswoeSqotB6UayPTmfBc2ykcpUOXw/ljiNBmFhTV/taIYo5cktDjuLn
 LITfbb6UHyIHfeNZq9cDFdbmiKnO2zI0urf02i3O/+3D9RHgOxB1SFfN2wlSTIOqclnV
 7z1iSQQVfK614nQbauSg/TmAbYHluIALahJAFJLEDYOc/I1KzgmtRc34SX/Z4p5nC2Gv
 PfmbFc/Yz6Iv9aeGYOClzLtR1IdNxjcFei5SRRGKhz4hqX5n/cGUC+kdlgllDn7TxkiA
 SEcQ==
X-Gm-Message-State: ACrzQf3RZ0cLzIj1iR9/KsR1rLXu8V5+OXkVTPM+s6IRqZcUTCd/g0QL
 70fbOLppMj1YOIEw1g4fZ5eWGl5OWpFC/NuQB0g=
X-Google-Smtp-Source: AMsMyM7Fm2rXMATqC94kLNl/1NH4TuFdTo49TFSEPz+xqWJ6GqlHrlayDOQ7BLO+EEpuNJmGcH71VvjAG1feT4i1gSQ=
X-Received: by 2002:a67:d606:0:b0:3aa:3a3e:95d1 with SMTP id
 n6-20020a67d606000000b003aa3a3e95d1mr27326790vsj.6.1667769412534; Sun, 06 Nov
 2022 13:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
In-Reply-To: <20221105171116.432921-50-mst@redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 6 Nov 2022 22:16:41 +0100
Message-ID: <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: multipart/alternative; boundary="00000000000066c6b605ecd3d3a1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000066c6b605ecd3d3a1
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> From: Igor Mammedov <imammedo@redhat.com>
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> NB: we do not expect any functional change in
> any ACPI tables with this change. It's only a refactoring.
>
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/display/vga_int.h       |  2 ++
>  hw/display/acpi-vga-stub.c |  7 +++++++
>  hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
>  hw/display/vga-pci.c       |  4 ++++
>  hw/i386/acpi-build.c       | 26 +-------------------------
>  hw/display/meson.build     | 17 +++++++++++++++++
>  6 files changed, 57 insertions(+), 25 deletions(-)
>  create mode 100644 hw/display/acpi-vga-stub.c
>  create mode 100644 hw/display/acpi-vga.c
>

With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails due
to the symbol "aml_return" being undefined:

# starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.sock
-qtest-log /dev/null -chardev socket,path=/tmp/qtest-515650.qmp,id=char0
-mon chardev=char0,mode=control -display none -vga none -device virtio-vga
-accel qtest
----------------------------------- stderr
-----------------------------------
Failed to open module:
qemu/build/qemu-bundle/usr/lib/qemu/hw-display-virtio-vga.so: undefined
symbol: aml_return
qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device
model name
Broken pipe
../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)

(test program exited with status code -6)

Best regards,
Bernhard

--00000000000066c6b605ecd3d3a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 5, 2022 at 6:45 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Igor=
 Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_blank">imam=
medo@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20221017102146.2254096-2-imammedo@redhat.=
com" target=3D"_blank">20221017102146.2254096-2-imammedo@redhat.com</a>&gt;=
<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank">mst@redhat.com</a>&gt;<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;<br>
NB: we do not expect any functional change in<br>
any ACPI tables with this change. It&#39;s only a refactoring.<br>
<br>
Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_bl=
ank">ani@anisinha.ca</a>&gt;<br>
---<br>
=C2=A0hw/display/vga_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0hw/display/acpi-vga-stub.c |=C2=A0 7 +++++++<br>
=C2=A0hw/display/acpi-vga.c=C2=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++++++++=
++++<br>
=C2=A0hw/display/vga-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 26 +----------------=
---------<br>
=C2=A0hw/display/meson.build=C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
=C2=A06 files changed, 57 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 hw/display/acpi-vga-stub.c<br>
=C2=A0create mode 100644 hw/display/acpi-vga.c<br></blockquote><div><br></d=
iv><div>With this &quot;qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test=
&quot; fails due to the  symbol &quot;aml_return&quot; being undefined:</di=
v><div><br></div><div># starting QEMU: exec ./qemu-system-hppa -qtest unix:=
/tmp/qtest-515650.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qte=
st-515650.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none =
-vga none -device virtio-vga -accel qtest<br>------------------------------=
----- stderr -----------------------------------<br>Failed to open module: =
qemu/build/qemu-bundle/usr/lib/qemu/hw-display-virtio-vga.so: undefined sym=
bol: aml_return<br>qemu-system-hppa: -device virtio-vga: &#39;virtio-vga&#3=
9; is not a valid device model name<br>Broken pipe<br>../src/tests/qtest/li=
bqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered e=
xit status 1 (expected 0)<br><br>(test program exited with status code -6)<=
/div><div><br></div><div>Best regards,</div><div>Bernhard</div><br></div></=
div>

--00000000000066c6b605ecd3d3a1--

