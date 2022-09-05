Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8E85AD6EA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:54:27 +0200 (CEST)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEQX-0004bG-Nb
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVEOr-0001qE-9i
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oVEOn-0004TO-D2
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662393151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8QZr3NghiPG07L60HaPFgSPf6vMhZ5W+3bbAj+6Shs=;
 b=KCDlaZlf41i4J7Z52Kk7j6Er5fo3V2vV5w5vhG+iMPyplX0a4p9eCHzYovClpyPhzywUuO
 GT8BT02xRcnNOXQsuTY0bf086DDcJyQ09zoZzyC0U3KimK+dQVA48GNSDFIDYTFEn3SBAF
 UZQeZAmUIMAZxfmG6TrnQiNkP9qfizY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-82-XoWtHCxgNpKw0QwIVEmO6w-1; Mon, 05 Sep 2022 11:52:30 -0400
X-MC-Unique: XoWtHCxgNpKw0QwIVEmO6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso5974399edd.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Z8QZr3NghiPG07L60HaPFgSPf6vMhZ5W+3bbAj+6Shs=;
 b=DXdjyW3PfauAH7fzyiSi2Ti9YG7/SKmSsJwzXouBskPt7/DrOaO9mwtL3qgFoVc8km
 yezA/2wZUXwaZs4YQ92LZ48ej2udnGJzzP79rVeOLjfKXn19UBKzzmEK78Gzf8/VXnCl
 IoAt09xKt56Ld7KJDdTcPl67ExQHWTRo+G29jZXKrBgiRG338T++2dB/sUaLPro5IkQH
 gw5Xl9pe++dnYpsYXGFp+hAwMVmZE9gBbyqFSkmOxRv9UafyuokOoaEywGrtlwuc/bnX
 D9wgTcbbaTdbGdTeQCOalJcreMjKJ8bAT4+bzPFaJBOVntSKiRTnXu4sHTprms/vrYC9
 23Gw==
X-Gm-Message-State: ACgBeo1pJKjbmjRCHZl3uYe372XG/f495VO6TPZI6lQeMixD/TVG1KpK
 1SSWBfhrNNS7X1nHn57KmGVx31lw/BC9yMNbthYCwCPGu+qR3XpNe/rqnjZXjuBfif+zzKL1MD/
 1Wl9ht00rfAaTJjI=
X-Received: by 2002:a05:6402:2423:b0:446:3b6b:e3ee with SMTP id
 t35-20020a056402242300b004463b6be3eemr44396655eda.412.1662393147723; 
 Mon, 05 Sep 2022 08:52:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44CFtrlIRz1O0R5LyzNpKR/11d7YUX/iBJeiQ/aR08YCx2VFevH+lUh2ksxQgvJNHF9aMpwQ==
X-Received: by 2002:a05:6402:2423:b0:446:3b6b:e3ee with SMTP id
 t35-20020a056402242300b004463b6be3eemr44396636eda.412.1662393147494; 
 Mon, 05 Sep 2022 08:52:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a1709061da900b0073d83f80b05sm5219660ejh.94.2022.09.05.08.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:52:26 -0700 (PDT)
Date: Mon, 5 Sep 2022 17:52:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org, kkostiuk@redhat.com,
 yvugenfi@redhat.com, yiwei@redhat.com, ybendito@redhat.com,
 jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
Message-ID: <20220905175225.74881174@redhat.com>
In-Reply-To: <20220905072531.8059-1-ani@anisinha.ca>
References: <20220905072531.8059-1-ani@anisinha.ca>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  5 Sep 2022 12:55:31 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Possible fix for https://bugzilla.redhat.com/show_bug.cgi?id=2089545
> 
> Change in AML:
> 
> @@ -47,33 +47,39 @@
>      Scope (_SB)
>      {
>          Device (PCI0)
>          {
>              Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
>              Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
>              Name (_ADR, Zero)  // _ADR: Address
>              Name (_UID, Zero)  // _UID: Unique ID
>              Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
>              {
>                  CreateDWordField (Arg3, Zero, CDW1)
>                  If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
>                  {
>                      CreateDWordField (Arg3, 0x04, CDW2)
>                      CreateDWordField (Arg3, 0x08, CDW3)
>                      Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    Local0 &= 0x1E
> +                    Local0 &= 0x1F
> +                    Local1 = (CDW3 & One)
> +                    If ((One == Local1))
> +                    {
> +                        CDW1 |= 0x12
> +                    }
> +
>                      If ((Arg1 != One))
>                      {
>                          CDW1 |= 0x08
>                      }
> 
>                      If ((CDW3 != Local0))
>                      {
>                          CDW1 |= 0x10
>                      }
> 
>                      CDW3 = Local0
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
>                  }
> **
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/i386/acpi-build.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 0355bd3dda..3dc9379f27 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1348,10 +1348,12 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
>  {
>      Aml *if_ctx;
>      Aml *if_ctx2;
> +    Aml *if_ctx3;
>      Aml *else_ctx;
>      Aml *method;
>      Aml *a_cwd1 = aml_name("CDW1");
>      Aml *a_ctrl = aml_local(0);
> +    Aml *a_pcie_nhp_ctl = aml_local(1);
>  
>      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>      aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> @@ -1366,11 +1368,26 @@ static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
>      /*
>       * Always allow native PME, AER (no dependencies)
>       * Allow SHPC (PCI bridges can have SHPC controller)
> -     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
>       */
> -    aml_append(if_ctx, aml_and(a_ctrl,
> -        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
> +    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));

that makes us not actually mask any capabilities since you forgot to mask
bit 1 later under if_ctx3 context.

So OSPM will see a permanent failure (_OSC failure bit in CWD1)
and will have no idea that PCI Hotplug is not supported since we return CWD3
with this bit still set whoever much it tries to negotiate.

So if it boots at all, guest will probably not use any requested features
since _OSC failed to confirm any without error.

And even if we clear hotplug bit it still doesn't help.

some more testing shows that ATS cap doesn't depended hard on native hotplug
(i.e. run QEMU with native hotplug enabled but disable hotplug on root-port in question)
To me it still looks like a bug in Windows' acpi hotplug impl
(or perhaps it's no more properly maintained, so it doesn't account for new features).

> +    /*
> +     * if ACPI PCI Hot-plug is enabled, do not let OSPM set OSC PCIE
> +     * Native hotplug ctrl bit.
> +     */
> +    if (!enable_native_pcie_hotplug) {
> +        /* check if the ACPI native hotplug bit is set by the OS in DWORD3 */
> +        aml_append(if_ctx, aml_and(aml_name("CDW3"),
> +                                   aml_int(0x01), a_pcie_nhp_ctl));
> +        if_ctx3 = aml_if(aml_equal(aml_int(1), a_pcie_nhp_ctl));
> +        /*
> +         * ACPI spec 5.1, section 6.2.11
> +         * bit 1 in first DWORD - _OSC failure
> +         * bit 4 in first DWORD - capabilities masked
> +         */
> +        aml_append(if_ctx3, aml_or(a_cwd1, aml_int(0x12), a_cwd1));
> +        aml_append(if_ctx, if_ctx3);
> +    }
>      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
>      /* Unknown revision */
>      aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));


