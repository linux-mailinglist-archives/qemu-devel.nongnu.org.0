Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16485EC5E3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:22:21 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBTU-0003s8-Be
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0b-0001m1-3p
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0Y-0007FJ-SF
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eig4h6XvaBCCNnnThtNKOtsC59Q/xOgaZws4eVtAdZM=;
 b=JI1JYbkJgooT+XP+OLKJeCCcjNaPPGMS7cgwlejw3+hrM9I9vioTSQbX7L+b7o7rBgLX1f
 tlOlJEkX3YO+Qe8b28YTIY60nxn02mdAMlvUTEYPlzv916C7X/PZp6dQH7kohX+0v1q0OE
 knJj0kwoL10WMSzTQz/I3kyVof0k7AU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-nC11kJZLP86F6CqRpn6NFA-1; Tue, 27 Sep 2022 08:48:16 -0400
X-MC-Unique: nC11kJZLP86F6CqRpn6NFA-1
Received: by mail-ej1-f72.google.com with SMTP id
 i11-20020a1709064fcb00b00783415e70c2so2794152ejw.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=eig4h6XvaBCCNnnThtNKOtsC59Q/xOgaZws4eVtAdZM=;
 b=M0GbFyuS0ProTJO7uPqMu2lYJiWO8n+z3uYGPgBJn17Z5DIJNvtGcFJ/Is2H4u0ufZ
 +fMy5C4hcFwh5gUJ7pNpwBAgnZdGajJ45pdCgskmPawXEqZZs7GjYGO3tj9iN7O9Ljmv
 kPrGN3WFrMpeIHduN2lI4U6bxAh2up5Ejy/ixuNdQfFAz5PAXxar79LzfvkPM/1NNHyI
 MmNjdtN66ARZtmWtgle1Ht+9zBK+CBdMg6u/lcWDNy2MA6HqQ/SQyrFilx6gaRxDAGi2
 BOxPIabcwdVWRJTL7YGKdkP/a83/RnimWXpeTjDc7lzbd9jmEZ9WnIXaAdJZtTfp3/Be
 D/uw==
X-Gm-Message-State: ACrzQf0XVjmHXY0FAjveL3mLlRC7nYxo4UN6UWXFnSBtQN+slwW/6DLP
 RfGaLh+9NZqceSvfTFBnY5YbFd0qCwBkYZH5u+V2snDtIHQRDRIPva4P0bEs6PnYVY04gsGGUmh
 crKhbCy6IlLMcYxE=
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr23226469ejb.181.1664282895796; 
 Tue, 27 Sep 2022 05:48:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cfk2tetm4Otkd/EZ1CP30dZ8vWZKOH+OWIwcn+HjM2XmaAhJu0czD06QTbm+m1eo+xGNSOg==
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr23226460ejb.181.1664282895612; 
 Tue, 27 Sep 2022 05:48:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b0073dcdf9b0bcsm784350ejy.17.2022.09.27.05.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:15 -0700 (PDT)
Message-ID: <3229b3da-116a-f0fa-95eb-042825a95e98@redhat.com>
Date: Tue, 27 Sep 2022 14:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/8] hw/arm/virt: Fix devicetree warning about the root
 node
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-2-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi jean,

On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The devicetree specification requires a 'model' property in the root
> node. Fix the corresponding dt-validate warning:
> 
>   /: 'model' is a required property
>   From schema: dtschema/schemas/root-node.yaml
> 
> Use the same name for model as for compatible. The specification
> recommends that 'compatible' follows the format 'manufacturer,model' and
> 'model' follows the format 'manufacturer,model-number'. Since our> 'compatible' doesn't observe this, 'model' doesn't really need to
> either.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 1a6480fd2a..83ab1a37fb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -252,6 +252,7 @@ static void create_fdt(VirtMachineState *vms)
>      qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> +    qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
>  
>      /* /chosen must exist for load_dtb to fill in necessary properties later */
>      qemu_fdt_add_subnode(fdt, "/chosen");


