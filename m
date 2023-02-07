Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B992C68D405
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPL8w-0000PM-9C; Tue, 07 Feb 2023 05:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPL8s-0000P6-NC
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:24:02 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPL8m-00069T-MU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:23:58 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so41937335ejc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 02:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bJCbIn/X3OEHsr0kP2AP7buRcYHWFmb4XL0AYUpRdFM=;
 b=genjaXAxfvpYtmrRmNhxGucPdT75NDwtY8ZFpptqPKpTKbT8jj7W4LAYpf+xDzSH9K
 qASfV7QCJE49WIvcCvzgtdKq79hmWaVQpLLoBucnCIOIaiD4h2Aacc6sjwuuIpoMUihf
 hVjoCEIHqyCs/Dub15w7rzIxnNuO3YiEhD0CBsYtthnDkST9khHBG8PUh0j4IkP+MVB/
 0OyxgWxtDUiDQnCT/G0jzxoFX0r+UII+ZtW/Ovu10NJGWEQJ2sPj5PRRQZkLYlyhtLUH
 TZLtrhNOBU8rexodwm9WukOXz/c948eviaXkwd6o/xFdinNzrbOOoFJanJwMQf7zo/Qk
 3NxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJCbIn/X3OEHsr0kP2AP7buRcYHWFmb4XL0AYUpRdFM=;
 b=4Zt8gs6+ce+rbirCbMpG1K4MceH1TexydEARjitPwCyD/Rz00PEvF9kpaGiYxuDn+g
 6miDmtBs9/WDrc/UaV3bwGJWdFzyONj/4yrbWPEZGKVHDYmnbP5i82nURUckngZDtvnt
 xwSj0JIPC6SQdY8xl9fBseT+c+uZaBFghuMCX/df9lFmTlxffxLLs2UuI4yhOjYdESrT
 kzteKfJPd8qTMUKNTWeTTp7vGNC1TVQV6NiLFGhMJAfRqrKnLolimhOnYIV4VZT8ipBN
 6oDzyS8069MsjlI1yYbsYRn43XBfj/QYyeeXjIYCiNg1KBGnjW4FkyVwj9DBcfY3XqqV
 1WCw==
X-Gm-Message-State: AO0yUKXPv2w/OkbWFbm58B7TcmCsoBOdvyIdlY90Jc8sArzNkEeUFPZC
 yNsPOJWdo22RGZ7H10ng8bHEww==
X-Google-Smtp-Source: AK7set8hSotccKhxvoJcYtgAJCHWufyOfchofHPEwaZXOY4wsnGpsL1C5AmOxbiKOGXagHngG9jqWw==
X-Received: by 2002:a17:906:f1c1:b0:7c1:458b:a947 with SMTP id
 gx1-20020a170906f1c100b007c1458ba947mr3114932ejb.26.1675765434806; 
 Tue, 07 Feb 2023 02:23:54 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ot17-20020a170906ccd100b0088272bac7c5sm6631246ejb.121.2023.02.07.02.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 02:23:54 -0800 (PST)
Date: Tue, 7 Feb 2023 11:23:53 +0100
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
Message-ID: <20230207102353.hpg2gxh22urjbebu@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62f.google.com
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
> 
> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> has a high maintenance cost / burden.

Can you elaborate on this? RISCV doesn't need '-no-acpi' specifically.
If -no-acpi is problematic for some reason, then something like
'-machine virt,acpi=off' would be sufficient for switching to DT too.

Thanks,
drew

