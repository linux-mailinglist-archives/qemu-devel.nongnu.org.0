Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F065EC5DF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:21:26 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBSe-0003Nz-8d
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA1J-00024K-L1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA1I-0007KB-7w
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjA06iHvrYEC1gHjlQUHmscVY89zOnX4QqZ39wawjbY=;
 b=MBzzQrvJIbNfhfqCucwA6bmCWwa3WPPGAkXQyeR5eeWxyl4yuWrDrW6SaaM3VPVPx0/vdI
 PVYIwTEJzpa32M59M80NgVNqfRgw9Zw/8r+IM39UEjKzy3Yq4IPPBYqceK8oTVAzJAgOp6
 PA0ypht418z5vRK0M8hiiUdal4GIVzk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-qV-8Sb3EMd2IEx84UX2XFA-1; Tue, 27 Sep 2022 08:48:53 -0400
X-MC-Unique: qV-8Sb3EMd2IEx84UX2XFA-1
Received: by mail-ed1-f70.google.com with SMTP id
 m3-20020a056402430300b004512f6268dbso7802168edc.23
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZjA06iHvrYEC1gHjlQUHmscVY89zOnX4QqZ39wawjbY=;
 b=QTnNplC7H4wPIZ6Rul+xwWc630XctWLqZ0j2ccUAC3KuOnJ1P+w2frMd2AWK0HpV7Q
 kPk5iOc6gWQhwoBM6lE3gmjPHidDAG9ATbXCGDe4nOrbndrCYRnPgNju8z9AjRyYgPfp
 HcTwHx2oxiBDSwYEKQykhYVgQknPgT5hvcc+fst8i8d/Hzl2H3rtMHfMN0I17I0bULkK
 RpIR/1ELSaq1rmxyjxJLC12kzAW8c9aaqbHJvz8IXvRAvcBOHWG77FofwJ8V/Y5wukqf
 DjsBhP01//Xxm4aF0kQi09DZXMntJKQtXFlgzq2TgOBuy2RUjHr4xZ7iQSQKncZKEiOB
 3Cag==
X-Gm-Message-State: ACrzQf2q7ku5zvzNsHk4qeOHFNz+3CeLPLNfC0qUdo91RAkbje5uR+Y6
 dpbqZg9I8YvaPmmtkmM935ZjTWw46hMX0P0udUPunePM4Ib2ni2qOBwOrYMdqiAG2GAceLSpX02
 A7w0rRwlVxMvldcE=
X-Received: by 2002:a05:6402:1247:b0:456:eb22:1978 with SMTP id
 l7-20020a056402124700b00456eb221978mr18513627edw.374.1664282932930; 
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6/y+JAcCLSCaj+s02LwxEIMdh217ykgkX2LYtUsO5C67YMBLWVjN2AyY93aKU9QIYKRA0NOg==
X-Received: by 2002:a05:6402:1247:b0:456:eb22:1978 with SMTP id
 l7-20020a056402124700b00456eb221978mr18513604edw.374.1664282932706; 
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 kw26-20020a170907771a00b0073dd8e5a39fsm742036ejc.156.2022.09.27.05.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
Message-ID: <745ad260-b11b-8c72-8bb6-cc72acbb2987@redhat.com>
Date: Tue, 27 Sep 2022 14:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC
 node
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-3-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Hi Jean,

On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
> the corresponding dt-validate warning:
> 
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

nit: you may add
linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
says

      "#msi-cells":
        description:
          The single msi-cell is the DeviceID of the device which will
generate
          the MSI.
        const: 1



> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Besides,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 83ab1a37fb..ed6f1ac41e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -487,6 +487,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
>      qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
>                              "arm,gic-v3-its");
>      qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
>                                   2, vms->memmap[VIRT_GIC_ITS].base,
>                                   2, vms->memmap[VIRT_GIC_ITS].size);


