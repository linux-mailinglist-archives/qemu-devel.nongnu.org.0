Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC36D45BC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:26:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKBF-0004FZ-PQ; Mon, 03 Apr 2023 09:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjKBA-0004FH-Bz
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:25:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1pjKB8-0000oT-Ap
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:25:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id eh3so117235574edb.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ionos.com; s=google; t=1680528294; x=1683120294;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6jcIanIM08U1QVYyWthAHTs9EFuEJ+uc1bp/Pr8cBQs=;
 b=S/nU+5vBCdIaRAB76p/VonIPN6hA3i5Xx4/EcujfcLzdyKECdwzVv5eAaItKHCh6Vc
 +hriv6bHUhzsTh6oXyKUFNuzkpNBfML+FnRX3scysTpfUFLiLZB3W2T1z52Lqx6ExKFK
 qeSVeJcbyKz77whsYY7LVBtJdGuVwhBFtJ9FK1tEWzHaaVhG9AS6dGPDzQ7L57Vte+TL
 9zonNYE3BUeJhyZYIIXQpwtvAGWotkJErDMlXYydIhw2f/Rr24YYIXhz7YnafR5O86Oh
 SldCpiWwJVgDAn1k6j7CBRGo/tFLIatzUQmZcvsKf5PiTz976rXxta/fiBo35zwikbWm
 poeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680528294; x=1683120294;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6jcIanIM08U1QVYyWthAHTs9EFuEJ+uc1bp/Pr8cBQs=;
 b=TXlRSZ3Aw71F++z5ktBdI5p5Gkd6yJ2J5Q0dYAgdQF+lw/YPQjTXhUNKSAbQ/4khbq
 Li5wfuqcq2SWMBCpwZS/TPHAFEn8jZazW0riuJx+S3Wxr0ifLq599kx+DwvGUCoaaDbO
 6TLyOuxLQISf7lEeCIfpFT2Aik/An6fgqd6y2qJmrIqAHeIm4/Yjj6i13VQ5xC2KqBZU
 QJf6eDWaEpLjyh0fGGh8WoSjY8R6MhjvxkCNEyK6qhyxf5nQxV/MKwasnoZ9i5VBM1x6
 pJ+7FKlVwHWNYC1KJrXZug7VRDX5nPhOmFYjq28tRyPPs9AMYjgfOE7JDjILJBK92p8T
 sa9w==
X-Gm-Message-State: AAQBX9fJ1UrwuZn1iTqxnRrvyeulAZiK57f1B53v36hx/BNnMckR/TJW
 zd7XsOvTh4k842nEMY4A4nHeYxM1qltdBGrb0rvO0w==
X-Google-Smtp-Source: AKy350bhBu1sg554ez38IxFxoPsWj7V781aiorkQeJlWmMrcGhtwjIApKoZk5ZhUqC3uMSgr6ng5nAaG6Lk6rKLGhS4=
X-Received: by 2002:a50:9fae:0:b0:501:c965:33bd with SMTP id
 c43-20020a509fae000000b00501c96533bdmr16744963edf.6.1680528294296; Mon, 03
 Apr 2023 06:24:54 -0700 (PDT)
MIME-Version: 1.0
From: Yu Zhang <yu.zhang@ionos.com>
Date: Mon, 3 Apr 2023 15:24:43 +0200
Message-ID: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
Subject: an issue for device hot-unplug
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="00000000000004501805f86e7ccd"
Received-SPF: permerror client-ip=2a00:1450:4864:20::536;
 envelope-from=yu.zhang@ionos.com; helo=mail-ed1-x536.google.com
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

--00000000000004501805f86e7ccd
Content-Type: text/plain; charset="UTF-8"

Dear Laurent,

recently we run into an issue with the following error:

command '{ "execute": "device_del", "arguments": { "id": "virtio-diskX" }
}' for VM "id" failed ({ "return": {"class": "GenericError", "desc":
"Device virtio-diskX is already in the process of unplug"} }).

The issue is reproducible. With a few seconds delay before hot-unplug,
hot-unplug just works fine.

After a few digging, we found that the commit 9323f892b39 may incur the
issue.
------------------
    failover: fix unplug pending detection

    Failover needs to detect the end of the PCI unplug to start migration
    after the VFIO card has been unplugged.

    To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and
reset in
    pcie_unplug_device().

    But since
        17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
Q35")
    we have switched to ACPI unplug and these functions are not called
anymore
    and the flag not set. So failover migration is not able to detect if
card
    is really unplugged and acts as it's done as soon as it's started. So it
    doesn't wait the end of the unplug to start the migration. We don't see
any
    problem when we test that because ACPI unplug is faster than PCIe native
    hotplug and when the migration really starts the unplug operation is
    already done.

    See c000a9bd06ea ("pci: mark device having guest unplug request
pending")
        a99c4da9fc2a ("pci: mark devices partially unplugged")

    Signed-off-by: Laurent Vivier <lvivier@redhat.com>
    Reviewed-by: Ani Sinha <ani@anisinha.ca>
    Message-Id: <20211118133225.324937-4-lvivier@redhat.com>
    Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
------------------
The purpose is for detecting the end of the PCI device hot-unplug. However,
we feel the error confusing. How is it possible that a disk "is already in
the process of unplug" during the first hot-unplug attempt? So far as I
know, the issue was also encountered by libvirt, but they simply ignored it:

    https://bugzilla.redhat.com/show_bug.cgi?id=1878659

Hence, a question is: should we have the line below in
acpi_pcihp_device_unplug_request_cb()?

   pdev->qdev.pending_deleted_event = true;

It would be great if you as the author could give us a few hints.

Thank you very much for your reply!

Sincerely,

Yu Zhang @ Compute Platform IONOS
03.04.2013

--00000000000004501805f86e7ccd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Laurent,<br><br>recently we run into an issue with th=
e following error:<br><br>command &#39;{ &quot;execute&quot;: &quot;device_=
del&quot;, &quot;arguments&quot;: { &quot;id&quot;: &quot;virtio-diskX&quot=
; } }&#39; for VM &quot;id&quot; failed ({ &quot;return&quot;: {&quot;class=
&quot;: &quot;GenericError&quot;, &quot;desc&quot;: &quot;Device virtio-dis=
kX is already in the process of unplug&quot;} }).<br><br>The issue is repro=
ducible. With a few seconds delay before hot-unplug, hot-unplug just works =
fine.<br><br>After a few digging, we found that the commit 9323f892b39 may =
incur the issue.<br>------------------=C2=A0<br>=C2=A0 =C2=A0 failover: fix=
 unplug pending detection<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Failover needs=
 to detect the end of the PCI unplug to start migration<br>=C2=A0 =C2=A0 af=
ter the VFIO card has been unplugged.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 To=
 do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in<b=
r>=C2=A0 =C2=A0 pcie_unplug_device().<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Bu=
t since<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 17858a169508 (&quot;hw/acpi/ich9: Se=
t ACPI PCI hot-plug as default on Q35&quot;)<br>=C2=A0 =C2=A0 we have switc=
hed to ACPI unplug and these functions are not called anymore<br>=C2=A0 =C2=
=A0 and the flag not set. So failover migration is not able to detect if ca=
rd<br>=C2=A0 =C2=A0 is really unplugged and acts as it&#39;s done as soon a=
s it&#39;s started. So it<br>=C2=A0 =C2=A0 doesn&#39;t wait the end of the =
unplug to start the migration. We don&#39;t see any<br>=C2=A0 =C2=A0 proble=
m when we test that because ACPI unplug is faster than PCIe native<br>=C2=
=A0 =C2=A0 hotplug and when the migration really starts the unplug operatio=
n is<br>=C2=A0 =C2=A0 already done.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 See =
c000a9bd06ea (&quot;pci: mark device having guest unplug request pending&qu=
ot;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 a99c4da9fc2a (&quot;pci: mark devices p=
artially unplugged&quot;)<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Signed-off-by:=
 Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com">lvivier@redhat.co=
m</a>&gt;<br>=C2=A0 =C2=A0 Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:ani=
@anisinha.ca">ani@anisinha.ca</a>&gt;<br>=C2=A0 =C2=A0 Message-Id: &lt;<a h=
ref=3D"mailto:20211118133225.324937-4-lvivier@redhat.com">20211118133225.32=
4937-4-lvivier@redhat.com</a>&gt;<br>=C2=A0 =C2=A0 Reviewed-by: Michael S. =
Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt;<br>=C2=
=A0 =C2=A0 Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redh=
at.com">mst@redhat.com</a>&gt;<br>------------------=C2=A0=C2=A0<br>The pur=
pose is for detecting the end of the PCI device hot-unplug. However, we fee=
l the error confusing. How is it possible that a disk &quot;is already in t=
he process of unplug&quot; during the first hot-unplug attempt? So far as I=
 know, the issue was also encountered by libvirt, but they simply ignored i=
t:<br><br>=C2=A0 =C2=A0 <a href=3D"https://bugzilla.redhat.com/show_bug.cgi=
?id=3D1878659">https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659</a><br=
>=C2=A0 =C2=A0 <br>Hence, a question is: should we have the line below in=
=C2=A0 acpi_pcihp_device_unplug_request_cb()?<br><br>=C2=A0 =C2=A0pdev-&gt;=
qdev.pending_deleted_event =3D true;<br>=C2=A0 =C2=A0<br>It would be great =
if you as the author could give us a few hints. <br><br>Thank you very much=
 for your reply!<br><br>Sincerely,<br><br>Yu Zhang @ Compute Platform IONOS=
<br>03.04.2013<br></div>

--00000000000004501805f86e7ccd--

