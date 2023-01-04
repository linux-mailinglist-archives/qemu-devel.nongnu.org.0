Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8165D0CE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:39:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD1AD-0000mC-Tr; Wed, 04 Jan 2023 05:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pD1AC-0000m4-My
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pD1AB-0005hx-1L
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672828706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhQeNMsK9N2F0mDdTTSnbA2RDunGdkiskfxiMZJsNpE=;
 b=hrUw6kCPjVMzfuvSMaoYZqqH34QNqrA8DvKdmF9g1XxRBH2s/QoDGrGMSuIwYbiBx8ahtb
 ItnL/BVQzAu72wh7XckzLiX4vqLhCUQ2lW0nQycgcRrNLe62evMk1Bf01jwwN3nsWqZNHL
 piZf7K1oRvb5SV144761x7v2IG99s2M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-njY1lKjoM8aDYSbK3JPE5g-1; Wed, 04 Jan 2023 05:38:25 -0500
X-MC-Unique: njY1lKjoM8aDYSbK3JPE5g-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc9-20020a1709078a0900b0084c4e8dc14eso15108634ejc.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 02:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhQeNMsK9N2F0mDdTTSnbA2RDunGdkiskfxiMZJsNpE=;
 b=U7Wk1wXW2487EldFhkmWMkKXrxaBWoJLEjg/G3n151GhIAjnqcA9JueycsLTdLEyg8
 +2eIaMGuLMiK+FuSoqCf4RN3CZ4BRAA1jtj6WWSKlTn0ysZ0GWC8tnI5SdVPIs2JSw4/
 /S1Sp3Gs8UY2zlLwnsQRgjfzpODqzEysJs4Hz6srv+mzqJvX0UjrE8v6XACD1ZPyPq/x
 7ywme+pblSnxRz6LphsnwDlLKOxxGkY2ZOmJcOd5TmE/VWlxaEKZhNPVbUP9UXo6iuBL
 Ewul/oZH1z6GFKd6jRhsJuVhNp30U3T3+qrmYmX6SJwhesKS8RCWb6LmITBACv6suZrB
 P9kQ==
X-Gm-Message-State: AFqh2kq/OnueCWxFqJj5qOPFruaSWwv0Pm68htopKmT0JT4Q5SbkjNsQ
 tAbjvno5/i+U/FD/r/BbSvEwRLzdMxSrsLMhDinkW1itqXriJhMVZektLw99xUxTPztEGtWOPU2
 ICSKhQ1EohlGKG78=
X-Received: by 2002:a17:907:8b89:b0:7c1:6f86:eeb with SMTP id
 tb9-20020a1709078b8900b007c16f860eebmr37090027ejc.7.1672828704003; 
 Wed, 04 Jan 2023 02:38:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsOi1lU9HfQb/gQ4o/QZWNgjvuLe8CETpE3D9z2vLOZO+TZm2pgP6ZjpwsUCQFpc65d9P4iJA==
X-Received: by 2002:a17:907:8b89:b0:7c1:6f86:eeb with SMTP id
 tb9-20020a1709078b8900b007c16f860eebmr37090019ejc.7.1672828703796; 
 Wed, 04 Jan 2023 02:38:23 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 23-20020a170906309700b00809e33ba33dsm15387475ejv.19.2023.01.04.02.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 02:38:23 -0800 (PST)
Date: Wed, 4 Jan 2023 11:38:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu devel list
 <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, Zhu Guihua <zhugh.fnst@cn.fujitsu.com>, Gu Zheng
 <guz.fnst@cn.fujitsu.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] acpi: cpuhp: fix guest-visible maximum access size to
 the legacy reg block
Message-ID: <20230104113822.35d23254@imammedo.users.ipa.redhat.com>
In-Reply-To: <e81f78e2-301e-d920-cd03-6e17c591d677@linaro.org>
References: <20230104090138.214862-1-lersek@redhat.com>
 <e81f78e2-301e-d920-cd03-6e17c591d677@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, 4 Jan 2023 10:34:09 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 4/1/23 10:01, Laszlo Ersek wrote:
[...]
> > diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> > index 53654f863830..ff14c3f4106f 100644
> > --- a/hw/acpi/cpu_hotplug.c
> > +++ b/hw/acpi/cpu_hotplug.c
> > @@ -52,6 +52,9 @@ static const MemoryRegionOps AcpiCpuHotplug_ops =3D {
> >       .endianness =3D DEVICE_LITTLE_ENDIAN,
> >       .valid =3D {
> >           .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    },
> > +    .impl =3D {
> >           .max_access_size =3D 1, =20
>=20
> Arguably:
> Fixes: b8622725cf ("acpi_piix4: Add infrastructure to send CPU hot-plug=20
> GPE to guest")

nope, this one is correct, as legacy interface used 1 byte access only

>=20
> >       },
> >   }; =20



