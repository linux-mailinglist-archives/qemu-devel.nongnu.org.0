Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5E061E6AD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:48:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornVB-0007si-Km; Sun, 06 Nov 2022 16:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ornV8-0007lK-5H
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:48:23 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ornV6-00074T-CT
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:48:21 -0500
Received: by mail-vk1-xa35.google.com with SMTP id i15so5541339vka.0
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5401t3gfNvEzu/xnOeUNytoPHAQ230HFk+GCouWPsgI=;
 b=UNPr4vsDpMaAzG1RxFIgMoGy79L0tmqjAhT3bzc+8b/WuwAtF1RAYB9QA/f4Frtns+
 BtswuagM8FaQ9R/I+kxL77yyRHfJYk1FSIbjIVyRNSVAQfFBgPesRV6S0OgN1drZp20d
 S6ZNC/F1iEM7BzldRez4ktX8RKqqIhs75rx7RTa4cHJi+stXMHaWp4W2QLyict2q5Ng3
 Y0DtENu/lISx9XEDo3XhtyNQLV1oCmg8NScJvD/WWl5ZSj5+SMjIzldB2DLGLpmboDq5
 nBvWJ/viPCNN8bOR0Z0rSQSayFo9aYswgQOlIo5YiNZhqWzrFXxt2utH9LzKe+UaZ/xU
 /OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5401t3gfNvEzu/xnOeUNytoPHAQ230HFk+GCouWPsgI=;
 b=402cFlEc6SdMLVmXAa9epbfsuE1FZBh6xrDDdLWftvBMsqXA/MeudvoRu3iajPUcFV
 N0vBCQfdzMhRgiSum/RVgshMf+I8aiIyluKaY8//5/FkCMkGHaeiWQtIq4snGNfSD0Ms
 UUpsRaB8GU7iOwKaZbsGjg4ULWngPfFOI0y62tdgTuYuLCrKY43zRnYiMvv5Ii24mEI3
 o/dHpLKBhLI+/qpavF1Z91xnMM9zyxiAa+X//Qk4U8G/9Txp35i9N8SMspBex0wXB8Ke
 2RsVKzYIocLUXsVaxoyUTAcKiJT369SaHWHT54ToRl5I0jtKMjIWE1++A+zCD++aXaL+
 zZLw==
X-Gm-Message-State: ACrzQf3z1BTB8j01Sa1kTzkOADw8+aTIjcOA/cI0vuIjwVxDsX5tryWM
 IL9PG47MQXJIYfLc82zfnMZaZfSRdXvadbdCCgc=
X-Google-Smtp-Source: AMsMyM4/zCC2sUOHCP+/TgMqOY7YCgkFfM0KNKz43r3EYYvXD9WzbPmAYp4nKc4mm6baWE9NFjQfsEdDHn0Y9OhFKbk=
X-Received: by 2002:a1f:2f57:0:b0:3b7:537b:ac59 with SMTP id
 v84-20020a1f2f57000000b003b7537bac59mr5472187vkv.6.1667771299032; Sun, 06 Nov
 2022 13:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-51-mst@redhat.com>
In-Reply-To: <20221105171116.432921-51-mst@redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 6 Nov 2022 22:48:07 +0100
Message-ID: <CAG4p6K64=LmX75NP4mYX7OFrSqKxsh3nVBzguOj3GvxbH1NwuQ@mail.gmail.com>
Subject: Re: [PULL v3 50/81] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Content-Type: multipart/alternative; boundary="000000000000d8744d05ecd44316"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa35.google.com
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

--000000000000d8744d05ecd44316
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 5, 2022 at 6:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> From: Igor Mammedov <imammedo@redhat.com>
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
> b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..570b17478e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,35 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/DSDT",
> +"tests/data/acpi/pc/DSDT.acpierst",
> +"tests/data/acpi/pc/DSDT.acpihmat",
> +"tests/data/acpi/pc/DSDT.bridge",
> +"tests/data/acpi/pc/DSDT.cphp",
> +"tests/data/acpi/pc/DSDT.dimmpxm",
> +"tests/data/acpi/pc/DSDT.hpbridge",
> +"tests/data/acpi/pc/DSDT.hpbrroot",
> +"tests/data/acpi/pc/DSDT.ipmikcs",
> +"tests/data/acpi/pc/DSDT.memhp",
> +"tests/data/acpi/pc/DSDT.nohpet",
> +"tests/data/acpi/pc/DSDT.numamem",
> +"tests/data/acpi/pc/DSDT.roothp",
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.acpierst",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.applesmc",
> +"tests/data/acpi/q35/DSDT.bridge",
>

+"tests/data/acpi/q35/DSDT.core-count2"

... and probably in more patches down the road.

Best regards,
Bernhard

+"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.cxl",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.ipmismbus",
> +"tests/data/acpi/q35/DSDT.ivrs",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.multi-bridge",
> +"tests/data/acpi/q35/DSDT.nohpet",
> +"tests/data/acpi/q35/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT.pvpanic-isa",
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> +"tests/data/acpi/q35/DSDT.viot",
> +"tests/data/acpi/q35/DSDT.xapic",
> --
> MST
>
>
>

--000000000000d8744d05ecd44316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 5, 2022 at 6:27 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Igor=
 Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" target=3D"_blank">imam=
medo@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" tar=
get=3D"_blank">imammedo@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20221017102146.2254096-3-imammedo@redhat.=
com" target=3D"_blank">20221017102146.2254096-3-imammedo@redhat.com</a>&gt;=
<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank">mst@redhat.com</a>&gt;<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/bios-tables-test-allowed-diff.h | 34 ++++++++++++++++++++=
+<br>
=C2=A01 file changed, 34 insertions(+)<br>
<br>
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios=
-tables-test-allowed-diff.h<br>
index dfb8523c8b..570b17478e 100644<br>
--- a/tests/qtest/bios-tables-test-allowed-diff.h<br>
+++ b/tests/qtest/bios-tables-test-allowed-diff.h<br>
@@ -1 +1,35 @@<br>
=C2=A0/* List of comma-separated changed AML files to ignore */<br>
+&quot;tests/data/acpi/pc/DSDT&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.acpierst&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.acpihmat&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.bridge&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.cphp&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.dimmpxm&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.hpbridge&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.hpbrroot&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.ipmikcs&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.memhp&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.nohpet&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.numamem&quot;,<br>
+&quot;tests/data/acpi/pc/DSDT.roothp&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.acpierst&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.acpihmat&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.applesmc&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.bridge&quot;,<br></blockquote><div><br></di=
v><div>+&quot;tests/data/acpi/q35/DSDT.core-count2&quot;<br></div><div><br>=
</div><div>... and probably in more patches down the road.</div><div><br></=
div><div>Best regards,</div><div>Bernhard</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+&quot;tests/data/acpi/q35/DSDT.cphp&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.cxl&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.dimmpxm&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.ipmibt&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.ipmismbus&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.ivrs&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.memhp&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.mmio64&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.multi-bridge&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.nohpet&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.numamem&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.pvpanic-isa&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.tis.tpm12&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.tis.tpm2&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.viot&quot;,<br>
+&quot;tests/data/acpi/q35/DSDT.xapic&quot;,<br>
-- <br>
MST<br>
<br>
<br>
</blockquote></div></div>

--000000000000d8744d05ecd44316--

