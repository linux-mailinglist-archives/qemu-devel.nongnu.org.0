Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F05842304F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:45:42 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXpM2-00011Z-EC
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXoF3-0002Ra-P7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXoF0-0007ph-Vl
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633454914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ah9Wg60IfU0GzP7IObG5+zQcNol76z02MIgcVjuOgEI=;
 b=eguQlNR6TplUlmria8BMnZrq0OWX+px7q+nzmuDGeZ7sBRVAS7EVX6/0jYZxg3zcWOhmJL
 b2oa294/1g+hOYRR9ZI3TNRUFPNFhW8GMxxPX6dK+tZO82mTUtYsrHJHpC8PnlzI/ev5/U
 XivbvSvMjRDuDDLu5IVB0470PyuFuzA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-glPcjW-IPe-hAlvPCffkFQ-1; Tue, 05 Oct 2021 13:28:33 -0400
X-MC-Unique: glPcjW-IPe-hAlvPCffkFQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so1620522wma.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 10:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ah9Wg60IfU0GzP7IObG5+zQcNol76z02MIgcVjuOgEI=;
 b=l3+ZvHPoCGDTF+UBencKZlxxIdYMEMSLpdES5l1N58lVdHKQasBAojvbUW1ib4alXP
 4UpM4UUwYgyCcbZZd7iw2IYgMJATJq8c378lTf0kGQALx/wvCpXkBXYpeyOAZVSFFBkL
 hLpOCNc8qMpuEVVYZhgaMuY4xxJ+XD7b3LMqubV4Bhc0Ma4woCWji+God+7Jd/dbQ1BJ
 etcKeAshhLiSBrB2cImvrOiPteJADGNnU8v1qW7pYsRZo2tx4afX3grA1OLg4kF6FohR
 0fgI/TlkbNc0zAj+F2oR0gAdXaTxdvb1FU1aIk96Fxtq97ZE4CUA1eAtqX71dCkZDEOS
 4leQ==
X-Gm-Message-State: AOAM533FjaRdIHrpDkIU9IMPfkzE610uIGvOYZSH+kZ0WKRRtCMn7iBj
 ynfobxFuMt76JLIYkKHcDUi82PZcvkTDd8OSCU+fSqjsJV//I5bcQ2NzdXuS6kefJVjEwDQDjJC
 yF95+SDyVV0TVa0vB54hYm1fHW7qYX8HP7G4o9CSNQX2Ku1F9BUR4hnKJL/vC632Z
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr22439687wrg.359.1633454911631; 
 Tue, 05 Oct 2021 10:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQSR4osbqNtnxE6+16N5HL2d/Cv/GQ10a6UAwHWLGOzftwbfjCtGIZaULAyZ/UQwWpYatnJg==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr22439663wrg.359.1633454911377; 
 Tue, 05 Oct 2021 10:28:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o26sm2601170wmc.17.2021.10.05.10.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 10:28:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm/virt: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, pbonzini@redhat.com
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <e3fe63b8-fe0c-7d89-3340-af6ca0ada24d@redhat.com>
Date: Tue, 5 Oct 2021 19:28:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210811085842.2511545-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/11/21 10:58 AM, Jean-Philippe Brucker wrote:
> Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
> parameter definitions cannot use underscores, because keyval_dashify()
> transforms them to dashes and the parser doesn't find the parameter.
> 
> This affects option default_bus_bypass_iommu which was introduced in the
> same release:
> 
> $ qemu-system-aarch64 -M virt,default_bus_bypass_iommu=on
> qemu-system-aarch64: Property 'virt-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 
> Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b4598d3fe6..7075cdc15e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2671,10 +2671,10 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>                                            "Set the IOMMU type. "
>                                            "Valid values are none and smmuv3");
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>                                     virt_get_default_bus_bypass_iommu,
>                                     virt_set_default_bus_bypass_iommu);
> -    object_class_property_set_description(oc, "default_bus_bypass_iommu",
> +    object_class_property_set_description(oc, "default-bus-bypass-iommu",
>                                            "Set on/off to enable/disable "
>                                            "bypass_iommu for default root bus");
>  
> 


