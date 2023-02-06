Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44068BCFD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0j0-0004SG-EB; Mon, 06 Feb 2023 07:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pP0iV-0004Hx-Fs
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:35:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pP0iR-0001BR-Il
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:35:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so8669201wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NYa0j72PWc+nBQemWoL8OJL1TfSAnOza+b+PCPlRNs8=;
 b=QvczlEBtWDoDhPYxe5I2WJkzpdAHUxivKaNOf9WUy9HD+wAmkFZGV3QqkD7WqSLSxr
 +D2L/KWid5WoECaOmf2tBblBL73+3nPqyHCYRylv/PyStQS9iGaHO3S1stajJ2ONNK03
 rXh6lcxm8lXONEBexjwRHyl7TraD1cPzqErsQuoO+O4Hmpz+bCCPG5nFg4etdajK4beS
 kWVdlFhKju6GHm4z/jcda26kJlYB5CMxw6eql16yRrNJLZsBkoz+UVrmgerliTzhAkXm
 qVnsul9NlXUgQrA6n+OybhPSf3xkNWovvbjvdn4C7LHeTOhACgfNj4Tve5wBI19INGiF
 iMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NYa0j72PWc+nBQemWoL8OJL1TfSAnOza+b+PCPlRNs8=;
 b=j5GSKpoCPpBsn+4gkA0kXNXtoD3PUqYg3XDN1fzWPSuBZG0HDwsxGUjbry35xloNgu
 YQpKLnyUvIc5u0a5vH5nlgFFzyKHOgPYHH8fWcpwiSjjP4fpQjQ4triY7pKqIXamOz0w
 2Uu3RogDKDk4FTGlqj1Ap3yueuUc6TB7tK+lCu4XscpyYRroU51EtdPCXWpHlCNHct7M
 sV5GSzkEvn2Q2FToINV+ZfU0iwWCePXaRn9nDFhQEvKcAcXxEgqWapfV2G32GSDxgw8k
 CbNGVamiOi3rvvWBH5n7bo6e3Xt6CqmYoI6zrOCJjKWEnOlSwDBKDKqw8PtThAoYmRY3
 ROZA==
X-Gm-Message-State: AO0yUKXt3h1OuzSS6ffWx3q19vfetKCjAuLK7aSlvMi2X/gnm1koWoHU
 uzRyBwUnvBAzxtJvEbJIDeMFTQ==
X-Google-Smtp-Source: AK7set8dx2ZZ+nRHDYt17NRGdC/kdNYVgNE7WGmmFxn/Bh3C5RixOgokp4LS+2tLpK2qzOJk8ZAI/A==
X-Received: by 2002:a05:600c:4fd2:b0:3df:e41f:8396 with SMTP id
 o18-20020a05600c4fd200b003dfe41f8396mr13980577wmq.37.1675686921419; 
 Mon, 06 Feb 2023 04:35:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003db06493ee7sm17613755wmb.47.2023.02.06.04.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:35:20 -0800 (PST)
Date: Mon, 6 Feb 2023 13:35:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230206123520.feomnevavp4olbie@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x336.google.com
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

On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/23 11:54, Andrea Bolognani wrote:
> > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > +                              virt_get_acpi, virt_set_acpi,
> > > +                              NULL, NULL);
> > > +    object_class_property_set_description(oc, "acpi",
> > > +                                          "Enable ACPI");
> > 
> > The way this works on other architectures (x86_64, aarch64) is that
> > you get ACPI by default and can use -no-acpi to disable it if
> > desired. Can we have the same on RISC-V, for consistency?

Default on, with a user control to turn off, can be done with a boolean.
I'm not sure why/if Auto is needed for acpi. Auto is useful when a
configuration doesn't support a default setting for a feature. If the
user hasn't explicitly requested the feature to be on or off, then the
configuration can silently select what works. If, however, the user
explicitly chooses what doesn't work, then qemu will fail with an error
instead.

> 
> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> has a high maintenance cost / burden.
> 
> If hardware provides ACPI support, QEMU should expose it to the guest.
> 
> Actually, what is the value added by '-no-acpi'?

IIRC, when booting, at least arm guests, with edk2 and ACPI tables,
then edk2 will provide the guest ACPI tables instead of DT. To ensure
we can boot with edk2, but still allow the guest to boot with DT, we
need a way to disable the generation of ACPI tables.

Thanks,
drew

