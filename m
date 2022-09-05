Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EBD5AD170
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:21:09 +0200 (CEST)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAA7-0006uU-QN
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oV9jz-0003eE-Ve
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oV9jw-0002GW-Dn
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662375243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rwAGuZo5p0cjpeYGSQOmODHLFMF/D4RWe7mGPbUeeM0=;
 b=RMIJGjzvLYN3cZl+LO3/oGNKUKXZwRFpiDqGnX10aMhKN4Src036JDCRZQc2AfJGCn1sgg
 RedvDQRL1Yw2Mj0CCSKBFyD5QwOAXCgjqyoodCCq0o/VKUW6uob33Jbe1LFmnTK3RzkpGE
 r5Of/wwFsm8pZUEHTv8AaU5uP26nrZg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-STBDHFHfOyKwJi8nKhNIFw-1; Mon, 05 Sep 2022 06:54:02 -0400
X-MC-Unique: STBDHFHfOyKwJi8nKhNIFw-1
Received: by mail-wr1-f70.google.com with SMTP id
 s1-20020adf9781000000b002286cd81376so518459wrb.22
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=rwAGuZo5p0cjpeYGSQOmODHLFMF/D4RWe7mGPbUeeM0=;
 b=6bjBVpSm8sIbXoPBHucWGm/1gCMw3+d51fZiM3vHly7ATpJs/xxAnPvrM1W4yXkFWw
 Y/qYF7Uofhf+deOwUE8v5jb9/cA11S8ek4vSnZJM0wL0VbHmaooQgdUp8oQ49mowga7x
 BWMBNCC9I7r5YQ5rQGWTT7oPFpX6coCoHbR7bYEHN/gwoWJ/Lmj7FnIZaslXlMDZ0YHX
 cKsyab1wurYLXyrP1G4AfksaFsG3yBcixe/T0ft4Eqc7PvyNk8Cdlq1A8Mn/GtpvejZ6
 flL48at0P4Jjykwg3rFLg8ulbEBwfixrJjpe52kmJU7f9mONUkV/XKOGYsBbdP5TiMhR
 9FsQ==
X-Gm-Message-State: ACgBeo2F/lAQaESPzzz0XhCRmY+dX5bYYTnXkv0xFILJIJ3PWeuyTvVj
 20UH3ahx5Ma/umDDtMFcX28snmbONMTntKqgLyeNAthH8/TxMBKWbx556R4nzhpJuk5ZuQBoT4T
 /OnBfyaWvMPcWXEM=
X-Received: by 2002:a05:600c:25d1:b0:3a5:371d:38f with SMTP id
 17-20020a05600c25d100b003a5371d038fmr10103822wml.75.1662375240736; 
 Mon, 05 Sep 2022 03:54:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CP5p0wYXovHoG/7ZzEIey9CqiBSalal1nUl3JIOHgdutfguWM400BEkzu2EJIgZAfwkKdHw==
X-Received: by 2002:a05:600c:25d1:b0:3a5:371d:38f with SMTP id
 17-20020a05600c25d100b003a5371d038fmr10103799wml.75.1662375240424; 
 Mon, 05 Sep 2022 03:54:00 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm5097101wrp.96.2022.09.05.03.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:53:59 -0700 (PDT)
Date: Mon, 5 Sep 2022 06:53:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org, kkostiuk@redhat.com, yvugenfi@redhat.com,
 yiwei@redhat.com, ybendito@redhat.com, jusual@redhat.com
Subject: Re: [RFC PATCH] hw/acpi: do not let OSPM set pcie native hotplug
 when acpi hotplug is enabled
Message-ID: <20220905064415-mutt-send-email-mst@kernel.org>
References: <20220905072531.8059-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905072531.8059-1-ani@anisinha.ca>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Sep 05, 2022 at 12:55:31PM +0530, Ani Sinha wrote:
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
>  
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


0x12 ->

 ( 0x1 << 4 ) /* _OSC failure */ | ( 0x1 << 1) /* capabilities masked */


> +        aml_append(if_ctx, if_ctx3);
> +    }
>      if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
>      /* Unknown revision */
>      aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));

Hmm wait a sec


    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
    /* Capabilities bits were masked */
    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
    aml_append(if_ctx, if_ctx2);


this one seems subtly different ...


> -- 
> 2.34.1


