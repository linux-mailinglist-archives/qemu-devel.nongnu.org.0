Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F868DBC7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPP74-0005hx-Sy; Tue, 07 Feb 2023 09:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPP72-0005gh-G2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pPP71-0000hy-32
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675780702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFtY7ec7mQocFsctKKKJRJ5Gd4uawOzZqJ3gbQS4dVg=;
 b=h1oYDHL+7xOQTBO4DZ75FbF4qAZKD2G1+8VoYKlW/ubA+5ksS1N00I72FzjvYU35BkiMPg
 P0S/IOoiM8Tt8uSJw2eXxNnYOVYf/kBB4uv14Qj6KiKgajeI1j8iX3ZFYBydU9F5LGa7XD
 rW0a4e4vB88/fPvlklYiEIFrpb6pgt4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-75eqIHTqObaHrKKfbmUSAQ-1; Tue, 07 Feb 2023 09:38:17 -0500
X-MC-Unique: 75eqIHTqObaHrKKfbmUSAQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 qb3-20020a17090b280300b002307b2547b5so904022pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EFtY7ec7mQocFsctKKKJRJ5Gd4uawOzZqJ3gbQS4dVg=;
 b=rsZEzAWQ7ePVi/4CRYJwPb6hbtTWjO8ncBEI0MuN5uK+jXqwGRlY+wefOLPMMscZTo
 tDn5cqSxf4akYFqekM1ImuUXi2kobMVXnqIHgAYHlTHp5midXctrz2IT8F3QYYAq32JA
 +Ilylf/d50YXF4nEl6Ep9tHDjJV8zgroLtAaYwNuRIkhh/tonxEIjtNgP8nX1b32RHm1
 tSlSU3g+hkakwGi2LA9kGmWNulrDWW4gcWh6ZKleiasPKGnO56mJElnLpGCPLO5QkyAo
 5uwyVnIb3RpYggEPz1brSHFa4zoaJwh3tS33Mlr1V6BCxionxCc1qNmQA1c1CvUVpQRz
 QFxA==
X-Gm-Message-State: AO0yUKXDKfaW7GzFgKEAlOkkzxbpYs2ek7pf2iC7T8KyW66olOoPTdpV
 tUHdt5lOEZeqbTbs0y1ThzFr6bd5dBFmahuF6jkS0m2iyWHGcbsICkW8Xej4xu7RxmM5Y/9/4C6
 8nYTNilkrL0eAMC5q1oDwut+o/8+Qq5I=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr707864plr.29.1675780696562; 
 Tue, 07 Feb 2023 06:38:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/ntBA+fYPv7QoIdjcUyEiEluIbww7kxzs35RlMBgUf0rkFvThOjpxM4LoKHyAq8TpW+h4Rc6Xxm80vHxW7Jp0=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr707847plr.29.1675780696206; Tue, 07 Feb
 2023 06:38:16 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Feb 2023 06:38:15 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
 <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
Date: Tue, 7 Feb 2023 06:38:15 -0800
Message-ID: <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 07, 2023 at 03:02:19PM +0100, Thomas Huth wrote:
> On 07/02/2023 14.56, Andrea Bolognani wrote:
> > It looks like i440fx and q35 both have an 'acpi' machine property. Is
> > -no-acpi just sugar for acpi=off?
>
> Yes, it is, see softmmu/vl.c:
>
>             case QEMU_OPTION_no_acpi:
>                 qdict_put_str(machine_opts_dict, "acpi", "off");
>                 break;
>
> > Is it considered desirable to get rid of -no-acpi?
>
> Sounds like a good idea, indeed!
>
> > If so, we should follow the usual deprecation
> > process and get rid of it after libvirt has had a chance to adapt.
> >
> > In the scenario described above, it would make sense for RISC-V to
> > only offer the machine type option (assuming that -no-acpi doesn't
> > come for free with that) instead of putting additional effort into
> > implementing an interface that is already on its way out.
>
> I agree. IMHO the machine parameter should be enough, no need to introduce
> "-no-acpi" here.

Well, it looks like -no-acpi will come for free after all, thanks to
the code you pasted above, as long as the machine property follows
the convention established by x86, arm and (I just noticed this one)
loongarch.

So I guess the -no-acpi deprecation can be handled separately, and
the only thing that needs changing in the current patch is making
sure that ACPI is opt-out rather than opt-in, as is the case for
other architectures :)

-- 
Andrea Bolognani / Red Hat / Virtualization


