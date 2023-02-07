Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782B168E10D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:22:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTWC-00006w-KZ; Tue, 07 Feb 2023 14:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPTW9-00006W-1I
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:20:37 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPTW7-0006zs-FC
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:20:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id v10so17446812edi.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y4kzQ4G2/YWvQd1Js9x/k76y/oucxVOi5ZZcjeRNFFU=;
 b=Y+TtghdjFfBWJATRyFn3qGxj7DqJe4SgH7kDVve6zxBcwbGo7B0KJfSqwjegYXVC0v
 5iz4boVm2ydru6nX5s370wprI6FaeZnIu1KCA0PnPxCpbVk1tc4XpZ03CmysXBDlXJz1
 AXV7OAlWzIDNF09ayhPmqcw4UVxipguRw87b/r7vM8+hP0sVCxpn1yXpwnHXtU39Sub4
 8sPwRwzakr3g3gscVAE8pBINAo+x0lXNy2b4CkBQ591BFEIjhcp2JV9nKdWMjDnW3Iqt
 ZAsotvRemap/VQi0LGmu4SaEwFgn3rF761wwtXl6YfHUu79uP9KaoYAhoaWDGscFcRJ7
 e65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4kzQ4G2/YWvQd1Js9x/k76y/oucxVOi5ZZcjeRNFFU=;
 b=HZzXFnuwbAt8cxnpgeTLHqh4NqKNwjPjUr3nJSiGhe9POlr+YiRXxuJzaQX8tQmd5T
 uRWa6CSwnqykjcfdodysnAxR5SvPdsRX2snkpb/M+81w103fCuc0RhKJaKci19FNJExp
 f2vBGJgVQ7lsgkBq9y0nwDHMN5ZumG3C1URV/rlkcqIGDrYwQKbEeMMdjiSIl1/BfkXp
 i1Xi/9ztaMGhHmKk4Dq0Buy25qev6grH0TyhQjgS6XvOaXMuhTqUFnUUUkcOBK0WpBvF
 zO2gsaIlxlQRWkAj+EzQsaSeeQONX0zeSMwfNf7SCSvSImUFb1pkgXJAooiMhaqC4Br7
 7Vvw==
X-Gm-Message-State: AO0yUKU6kF79pkto/oVS/6OEC1UOLJl/EoXKaChDm7RrHeGKqFPDHkNc
 MER9dY7sHiHOU1ykCDYk/wCWSg==
X-Google-Smtp-Source: AK7set8yrpwivPAC5Tn2KvINyb5DNZQznltUCrVbf3PvSLze1zvRKMlXNbiN7dLZSl1gOsbEEC8RTg==
X-Received: by 2002:a50:bac4:0:b0:497:948b:e8 with SMTP id
 x62-20020a50bac4000000b00497948b00e8mr4843838ede.6.1675797633424; 
 Tue, 07 Feb 2023 11:20:33 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a509502000000b0049e08f781e3sm6971906eda.3.2023.02.07.11.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 11:20:32 -0800 (PST)
Date: Tue, 7 Feb 2023 20:20:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230207192031.pu5uy2yppv3htjw5@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230207102353.hpg2gxh22urjbebu@orel>
 <CABJz62M+n4DFqMPttzaDrSRzDcjkyEduX_NAv=-9J58mmUe+Ng@mail.gmail.com>
 <9c05b850-ae25-12aa-c6d0-b7a813a5ee03@redhat.com>
 <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJz62PuT+kG2X9OEBQRfybWn2ESJ3aNaEBkvDG=XK_43ZC_8w@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 07, 2023 at 06:38:15AM -0800, Andrea Bolognani wrote:
> On Tue, Feb 07, 2023 at 03:02:19PM +0100, Thomas Huth wrote:
> > On 07/02/2023 14.56, Andrea Bolognani wrote:
> > > It looks like i440fx and q35 both have an 'acpi' machine property. Is
> > > -no-acpi just sugar for acpi=off?
> >
> > Yes, it is, see softmmu/vl.c:
> >
> >             case QEMU_OPTION_no_acpi:
> >                 qdict_put_str(machine_opts_dict, "acpi", "off");
> >                 break;
> >
> > > Is it considered desirable to get rid of -no-acpi?
> >
> > Sounds like a good idea, indeed!
> >
> > > If so, we should follow the usual deprecation
> > > process and get rid of it after libvirt has had a chance to adapt.
> > >
> > > In the scenario described above, it would make sense for RISC-V to
> > > only offer the machine type option (assuming that -no-acpi doesn't
> > > come for free with that) instead of putting additional effort into
> > > implementing an interface that is already on its way out.
> >
> > I agree. IMHO the machine parameter should be enough, no need to introduce
> > "-no-acpi" here.
> 
> Well, it looks like -no-acpi will come for free after all, thanks to
> the code you pasted above, as long as the machine property follows
> the convention established by x86, arm and (I just noticed this one)
> loongarch.

Not quite, because we also have

$ grep -A1 '"no-acpi"' qemu-options.hx
DEF("no-acpi", 0, QEMU_OPTION_no_acpi,
           "-no-acpi        disable ACPI\n", QEMU_ARCH_I386 | QEMU_ARCH_ARM)

So that means neither riscv nor loongarch get -no-acpi just by adding
the "acpi" machine property.

If the plan is to deprecate -no-acpi, then riscv can be like loongarch
and only have the "acpi" property from the start.

Thanks,
drew

