Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B67584288
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:05:40 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH550-0004GX-Pn
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oH4kY-0008UL-FS
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oH4kV-00024T-7h
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659019466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oYOuffALX1JzN6sCP1a4RnuxVmo3aivYFvPLfQB29SQ=;
 b=R9lTB/vww2tWFwH8RZO/HATYpSIuv/ga25VbiUcw29sfvEoNDEaYY1nClLbiM5r67A7Tb5
 u5wA+Mfc8ZZUKqqQSjqqpf0i7JEl+Q7rtj4xqtt+/Wmpoe6Y6UTDksYvcgIZ/A+1d1e1e2
 ZR0pzZkPbXnM3/xpiSvpTYYI/kLqTs0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-rYdHJv0SMAu-6n4iNfcbAg-1; Thu, 28 Jul 2022 10:44:24 -0400
X-MC-Unique: rYdHJv0SMAu-6n4iNfcbAg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so2594515wms.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oYOuffALX1JzN6sCP1a4RnuxVmo3aivYFvPLfQB29SQ=;
 b=snJZMS9mLjICtWRThAVZwsZ4VNzxtUdkoL98na2mo/x7rGcKuRnz+dagche/TkV/vM
 1ZGLCrkW1NYvAYSbw2oprOXyZbxzZWLdTcLKFwwmW+qKc29PvJsipgfLOEJUDCPEbwDD
 3ZwRTLrLa7suYGTEWRDKoaRYVy4HF2tPL29i1IE/0Z15FEEbJ/lQcfhSTfnOq+6ydIlS
 Tbttf5lD2dMQU6YScjxH6h92w+aJzdpbokFWe8+6ZKQW4R0+HPcCNsGuxArIxe0IiQ5k
 iLILT78iAf2Uyh9q08EB0PK1pjvPxwWFrvAzllDA47stR81EFhF1TBd94YahN5T5FYGN
 vEWg==
X-Gm-Message-State: AJIora/x5MGqKk7pFQW+ntsrCQlufToJcNZS4YPq268yGn/lHwaTuMO5
 4p7u772lbetPNLNP2hPFAufrCE+In7L4DaYFWx2uVmhE3sRNok/KpaeB0mc/nTd28F6eJ9tWv8v
 P11PcU1ZRXBbaHbw=
X-Received: by 2002:a05:600c:1d9a:b0:3a3:34d:d6ac with SMTP id
 p26-20020a05600c1d9a00b003a3034dd6acmr6829273wms.206.1659019463075; 
 Thu, 28 Jul 2022 07:44:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4YWt+yjlyv2LAcn1v2aJmu2fit6L1B/XCOMDdBx1ZjxnuTFYMJIGph5leRNJZwJ4I61KQ4Q==
X-Received: by 2002:a05:600c:1d9a:b0:3a3:34d:d6ac with SMTP id
 p26-20020a05600c1d9a00b003a3034dd6acmr6829256wms.206.1659019462595; 
 Thu, 28 Jul 2022 07:44:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b0021ea1bcc300sm1177166wrq.56.2022.07.28.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:44:22 -0700 (PDT)
Date: Thu, 28 Jul 2022 15:44:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Message-ID: <YuKgxM4IjAXh/goO@work-vm>
References: <20220728115034.1327988-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728115034.1327988-1-imammedo@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

* Igor Mammedov (imammedo@redhat.com) wrote:
> QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
>   $ qemu-system-mips -monitor stdio
>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>   Segmentation fault (core dumped)
> 
> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> which are valid only for x86 and not for MIPS (as it requires ACPI
> tables support which is not existent for ithe later)
> 
> Issue was probably exposed by trying to cleanup/compile out unused
> ACPI bits from MIPS target (but forgetting about migration bits).
> 
> Disable compiled out features using compat properties as the least
> risky way to deal with issue.

Isn't the problem partially due to a 'stub' vmsd which isn't terminated?

Dave

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
> another approach could be setting defaults to disabled state and
> enabling them using compat props on PC machines (which is more
> code to deal with => more risky) or continue with PIIX4_PM
> refactoring to split x86-shism out (which I'm not really
> interested in due to risk of regressions for not much of
> benefit)
> ---
>  hw/mips/malta.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 7a0ec513b0..0e932988e0 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
>      .instance_init = mips_malta_instance_init,
>  };
>  
> +GlobalProperty malta_compat[] = {
> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> +};
> +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> +
>  static void mips_malta_machine_init(MachineClass *mc)
>  {
>      mc->desc = "MIPS Malta Core LV";
> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
>      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
>  #endif
>      mc->default_ram_id = "mips_malta.ram";
> +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
>  }
>  
>  DEFINE_MACHINE("malta", mips_malta_machine_init)
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


