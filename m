Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4C48E6FA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:55:32 +0100 (CET)
Received: from localhost ([::1]:57306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IMu-00007y-2a
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n8IDd-0000sr-6i
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:46:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n8IDb-0007Zd-HX
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642149954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nFFDsLvIiLoWR0WFRWbUEThEi12UvcsOYd0bEDF/LAo=;
 b=XtvaH3vHs9Q/GK5Val8C9ogGrDr/Vewm8JIQ9IG8wHPze8IjfVWMVTEzLDukANS/9WapC0
 AzfzfjRvfansO7hJwVrpRguxnMp/f8ZtS8MbOYc+CfXQbO8ttUcvRJ2E4iyD3vOJzv2r/I
 0gGGWeipaEtl18pfEopgdkZ7KvkEe/Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-rRz_Du8cOryucBdz7Q10ow-1; Fri, 14 Jan 2022 03:45:53 -0500
X-MC-Unique: rRz_Du8cOryucBdz7Q10ow-1
Received: by mail-wr1-f72.google.com with SMTP id
 w2-20020adfbac2000000b001a540eeb812so1562015wrg.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFFDsLvIiLoWR0WFRWbUEThEi12UvcsOYd0bEDF/LAo=;
 b=BFBcmF6ZdE4TfGF6t7lNR6ZjO97k+kmZhaHKOvLCg558ykx99F7UOZ72BfAljHb5QV
 0HR8RVsGsW9k8CjijKE26RCm7HK9g0XEAYLJ7K3yIsz4EsIbQKSWhmz1yhJ5/XYA6W5c
 VXRZy8D4b4QKzKsrL7p5ZzBYQNrFycx5WQ7PrFNXrRGQqBjmzK9WDrGmiGHw7nwBHccA
 j0/dmamYwiI08I0yB3+iM0WFrofua+WLOP3IlzmsukYghyChH8/oGFkqZ3BsYJDvFmvu
 mY6qseBPvfdy7yKYolhTjnzJQmEHyZNR1StKQgWW5ptZ6ictkkJrRkUkQSc+GeDJjXl4
 AEcw==
X-Gm-Message-State: AOAM530+cwYK8YwyhhyxearQIAa3bekOrQD5S1cU0Umr1b92yB/x9Dxg
 AybSCX1OUrcmonnGTLW9SjcHd3+tbZm0cFsTzayndJwG6V+BJiyfmoi2o5yboLQLBUhcryt3K27
 /6l6wfmMxh2l8YDM=
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr7342990wmd.121.1642149952213; 
 Fri, 14 Jan 2022 00:45:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcZlAADVA9l9eWzW4pGcnQTgg2dLQaEwy+A37zRaSEN0kJQHgaGfnvCkgo8JL7wAbqoqKWhQ==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr7342967wmd.121.1642149951962; 
 Fri, 14 Jan 2022 00:45:51 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id z7sm5536226wrm.117.2022.01.14.00.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 00:45:51 -0800 (PST)
Date: Fri, 14 Jan 2022 09:45:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH] hw/arm/virt: Default enable the virtualization
 option(VHE) on A64FX
Message-ID: <20220114084549.5lkdhqushaxivpew@gator>
References: <20220114072438.3085054-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20220114072438.3085054-1-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 04:24:37PM +0900, Shuuichirou Ishii wrote:
> At A64FX specification, VHE is enabled by default, so
> the virtualization option should be enabled when -cpu a64fx
> is specified.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  hw/arm/virt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b45b52c90e..56acf5cc7e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1932,6 +1932,12 @@ static void machvirt_init(MachineState *machine)
>      firmware_loaded = virt_firmware_init(vms, sysmem,
>                                           secure_sysmem ?: sysmem);
>  
> +    /* A64FX proceesor is supported the ARMv8.1-VHE */
> +    if (!vms->virt &&
> +            !strncmp(machine->cpu_type, ARM_CPU_TYPE_NAME("a64fx"), 13)) {
> +        vms->virt = true;
> +    }
> +
>      /* If we have an EL3 boot ROM then the assumption is that it will
>       * implement PSCI itself, so disable QEMU's internal implementation
>       * so it doesn't get in the way. Instead of starting secondary
> -- 
> 2.27.0
>

a64fx isn't the only CPU type the virt machine type supports which has
EL2 support. In fact, all the CPU types supported by mach-virt do, unless
KVM is enabled. So, while I understand the sentiment of this patch, it
doesn't fit the current model. And, since we don't want to start
accumulating hacks like this one in mach-virt, then the options are either
a) push the problem up the stack to whatever constructs the QEMU command
line or b) consider/propose a different machine type.

Thanks,
drew


