Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE1F68BD78
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1AY-0000Oi-F8; Mon, 06 Feb 2023 08:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pP1AW-0000OD-2x
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:04:24 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pP1AU-0006hm-BD
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:04:23 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so15130520pjq.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8+48++G+ydJdpFfW3hpLateS0N15bzTcLXgvwtNF7GA=;
 b=PfyslZ0CCqIMfKvyq3jyNPaJ8NWQ2hm/OvkJqS0znkp4GiC840xEClv3AguMFFt+Pw
 JBUXl8/GJREh2Ra9sht6eNhfTXly9D3hVeZg45KvknulA+9bOysYlp1rEQ6YbEFiBMEE
 LynMXyfHluqKMMCMWCtijktDtBznPtumy07JTULRHaWhCe24lNiBP0lHxdrBxyjE5gqF
 6w48ToVPe+S2HpEBaAza5gdWCmWtr3yRM6yIHCSouzOHfcT0WIP91vuXq58l07lfmi/k
 Ulye0RAE+cBhC7DcQGV4AEGcc1q/y4tUdvlwtx7K28c3rnTKV5QDm4Pe4GmgOhXqkiQc
 Ur0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+48++G+ydJdpFfW3hpLateS0N15bzTcLXgvwtNF7GA=;
 b=vo2uDVfzosHDlXc/+H1+ylK9ttvT+DC26LG/ImuzkaL2mfLVuet0pM0sg2tAkAuxys
 D+MP6neNW/I00zaHly+ueY12QL3hlrFsp80E9BwRc2ni3ls7/5P8IP+vzUUZH00w+8rE
 +HVD0/bpewnkpqKQ5mIaQWBPYZSNQYQvDVwDTwEV7uazSKpkQ8VdkaDsqNKmtyOzouI6
 bgStNH6L6FX4JQnq/wXQ70CN3g1bqaBtEWlEn2GrrK93qrnYoLSNlZMzRu/meMkjDpzB
 kHI3zw1hg9YVV35DlL4+z0ZyZweRQhfNllITL6x3/sre2fEULaHXDbtpNZSHAnypjjmp
 bSFQ==
X-Gm-Message-State: AO0yUKVrT4JbypTaVZ/fVjVNtb0d4MU1wsIi2C3j6hlyHzj5baGn3D/S
 rNVU3YQ9uYSrEqzJCukWjDMxjA==
X-Google-Smtp-Source: AK7set+CxMu5xEDPLc8URX9mjj3Lu23CiBVLJBwgap9blcQ5sUgnju5Mv0rL/piLrD1Ak8q6j83FRw==
X-Received: by 2002:a17:903:11c7:b0:196:489a:a79f with SMTP id
 q7-20020a17090311c700b00196489aa79fmr25065661plh.6.1675688660081; 
 Mon, 06 Feb 2023 05:04:20 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 i5-20020a170902eb4500b00199204c94c9sm1287737pli.57.2023.02.06.05.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:04:19 -0800 (PST)
Date: Mon, 6 Feb 2023 18:34:11 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
Message-ID: <Y+D6y6i1zV+nOaBl@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206123520.feomnevavp4olbie@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230206123520.feomnevavp4olbie@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 06, 2023 at 01:35:20PM +0100, Andrew Jones wrote:
> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > +                              virt_get_acpi, virt_set_acpi,
> > > > +                              NULL, NULL);
> > > > +    object_class_property_set_description(oc, "acpi",
> > > > +                                          "Enable ACPI");
> > > 
> > > The way this works on other architectures (x86_64, aarch64) is that
> > > you get ACPI by default and can use -no-acpi to disable it if
> > > desired. Can we have the same on RISC-V, for consistency?
> 
> Default on, with a user control to turn off, can be done with a boolean.
> I'm not sure why/if Auto is needed for acpi. Auto is useful when a
> configuration doesn't support a default setting for a feature. If the
> user hasn't explicitly requested the feature to be on or off, then the
> configuration can silently select what works. If, however, the user
> explicitly chooses what doesn't work, then qemu will fail with an error
> instead.
> 

Since all other architectures use Auto instead of a simple bool, I opted
for the same to keep it consistent.

However, default AUTO looked ambiguous to me. Since we still need to
support external interrupt controllers (IMSIC/APLIC/PLIC), I chose to
keep it OFF by default for now.

Thanks
Sunil

> > 
> > -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> > has a high maintenance cost / burden.
> > 
> > If hardware provides ACPI support, QEMU should expose it to the guest.
> > 
> > Actually, what is the value added by '-no-acpi'?
> 
> IIRC, when booting, at least arm guests, with edk2 and ACPI tables,
> then edk2 will provide the guest ACPI tables instead of DT. To ensure
> we can boot with edk2, but still allow the guest to boot with DT, we
> need a way to disable the generation of ACPI tables.
> 
> Thanks,
> drew

