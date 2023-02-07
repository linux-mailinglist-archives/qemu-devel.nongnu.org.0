Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A768D6D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:35:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNAp-0007d4-5j; Tue, 07 Feb 2023 07:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPNAn-0007c1-GJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:34:09 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPNAk-00010G-7i
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:34:09 -0500
Received: by mail-pf1-x429.google.com with SMTP id ea13so1373806pfb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 04:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jnIsDvta7NZxVHd7LnlBHZ35p5nPwuLeuPmb/ZK5jes=;
 b=Od+bBkKqBThPmPpYoSmkSkGfJOuFba3m3659bNCDhp/Njq1woDL0XzknnPQeW9vRz+
 H3ninOD/ibjOpAOVpHgNz4vtpiz+i4Wu9FmPKcrzuapCE9FYEtL9z2TBo/b50ImFmiUv
 MZSUpspEYTF7FPK1JvdVtZ5G/HM/kgGM2kYLhA8kYh/cS4Z+Mtd3xB5cLmrr+u1BS/kK
 Jm+BPV2l2riDtZDhroHV2D9pEBEuK13Oc5g9onSo4vef2ooFinibrsY6kLNrG7Haj7K3
 E6I1MicTfg5UPQMmuh3yYAf1JLHJ+vUZQ1O4nG1nrDwR8jhZM3dA+vp1G8veRWYjr/Rd
 K2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jnIsDvta7NZxVHd7LnlBHZ35p5nPwuLeuPmb/ZK5jes=;
 b=tUgpJ1nXvjmdlP8U/7mAH1P8IXTTYWV0gr+CA72y5I6fQ1qBEbfhsbGqy5rs1ZbG1f
 xyNF1wZjx8pJXPjfdd9G796ijHCKhxNlaAjlQWkSnMshFYsOUxFzfW5yjnV10h69IWUQ
 /h/FWwokwvMmgEWpLTCINZB2OD3oEAjOd0LwBu2vSj/+cuuGxKwoqMqd9Dp2HCSIW4M5
 UItJbBjIyI1DVeEElf6KIKm2XIztxnCntkYx0TueDzuyMiDqfjC2zn9HMo+6jG75ULRf
 7e+OZB+b8A2jyAUQCx/8KYarKYoCSo4Uh4k5+MXoEujWqcpbvFx5kIC775vL4k774YKC
 XUnw==
X-Gm-Message-State: AO0yUKWkMuyQCmr19uhWmjozWjoSo69IXT3GSUK5nxwW/R+Oc2jCFuB3
 mOqBDojUQfvH/KfGsNAI7uaTjQ==
X-Google-Smtp-Source: AK7set9IlgmWIGhF1LyH0qHKM2Xg3zMBpAqnr33vHqq6YsigtXl4aPUo7BJt3hk71BpZUYmIdNB2lw==
X-Received: by 2002:a62:1452:0:b0:592:40cd:ce83 with SMTP id
 79-20020a621452000000b0059240cdce83mr2961603pfu.4.1675773240127; 
 Tue, 07 Feb 2023 04:34:00 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 t8-20020aa78f88000000b0059260f01115sm9029011pfs.76.2023.02.07.04.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:33:59 -0800 (PST)
Date: Tue, 7 Feb 2023 18:03:48 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <Y+JFLOPIVuHhGNF2@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206123520.feomnevavp4olbie@orel>
 <CAEUhbmUDuH47SFyvHRzB6ZD_Ofs0DZpQDCpcyVELZgF+cTat9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmUDuH47SFyvHRzB6ZD_Ofs0DZpQDCpcyVELZgF+cTat9g@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
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

On Tue, Feb 07, 2023 at 11:57:29AM +0800, Bin Meng wrote:
> On Mon, Feb 6, 2023 at 8:36 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > > +                              virt_get_acpi, virt_set_acpi,
> > > > > +                              NULL, NULL);
> > > > > +    object_class_property_set_description(oc, "acpi",
> > > > > +                                          "Enable ACPI");
> > > >
> > > > The way this works on other architectures (x86_64, aarch64) is that
> > > > you get ACPI by default and can use -no-acpi to disable it if
> > > > desired. Can we have the same on RISC-V, for consistency?
> >
> > Default on, with a user control to turn off, can be done with a boolean.
> > I'm not sure why/if Auto is needed for acpi. Auto is useful when a
> > configuration doesn't support a default setting for a feature. If the
> > user hasn't explicitly requested the feature to be on or off, then the
> > configuration can silently select what works. If, however, the user
> > explicitly chooses what doesn't work, then qemu will fail with an error
> > instead.
> 
> I have a confusion about "OnOffAuto" vs. "bool" type.
> 
> Both "OnOffAuto" vs. "bool" type property can have a default value if
> user does not assign a value to it from command line. The default
> value is:
> 
> - ON_OFF_AUTO_AUTO for "OnOffAuto"
> - false for "bool"
> 
> But the default value can be overridden in the machine's init
> function, like in this patch.
> 
> So I am not really sure how these 2 types of properties are different.
> Why did we introduce a "OnOffAuto" type, and how is that type supposed
> to be used in which scenario?
> 

I don't know either. Since it is the same property across architectures,
I used the OnOffAuto instead of a bool. 

May be Gerd and other qemu experts can help us to understand better.
https://github.com/qemu/qemu/commit/17e89077b7e3bc1d96540e21ddc7451c3e077049

Thanks,
Sunil

