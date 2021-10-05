Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B26422FC7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:13:41 +0200 (CEST)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXowe-0005Ic-7x
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXnw2-0003td-SR
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mXnw0-0007tR-Cu
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 13:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633453735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUFfLEoR+6FwsuRrEmojDIbIHovZCSSHeqdovpmAtrg=;
 b=AUskfqP3N7iSPNSXwa8cdABxHCr6vWkrIPs/aY3RrR6xhA6SivzStSWsLoEn5rTlwNwUBG
 jmmxZ4yU+5ZKjDw7IXpYnigSvzSlCk4H8LGqnnZcYugvTn5mN0IXyyghL+3s7vGkVnjNwC
 DKBu0nbfLlHrjWcNXDWyJgUa80t7CDE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-T1cbkJDWNyGQ0Y7w-zP0rg-1; Tue, 05 Oct 2021 13:08:54 -0400
X-MC-Unique: T1cbkJDWNyGQ0Y7w-zP0rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so1593415wma.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 10:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AUFfLEoR+6FwsuRrEmojDIbIHovZCSSHeqdovpmAtrg=;
 b=qPwLmDl8+ccS6CH6Dploe/5EKrk2LNUMfuGmD9vQEMpAZZJL+ZDmu1sYjD+OPWgGpe
 Lwt4XZZORev4x88kR1RJa6pbbCtC0DwVzjK0aQU91WOE/59bOj877F5W1PFFTcxkuzon
 yJlQLosMZbnznS6kgVQsJwfD94VuTjesbKphGtalq6dSLR6PRRXc9rhaN3KMqyVJhGu8
 s9OWZk7eT76G0uXpOyvSYX260yebR3lSzSOU0iZj4if8mY14XOQVz8U2l4lpSXFg4QNX
 tvCha2YhgJrPuAXqoC+dJJIpuzjmCAbHnfOBkPxjyH6bF0vbAHeyaKn6c/3rF30nViXi
 etIg==
X-Gm-Message-State: AOAM53374AIuVm/SbgUIjnZRNaDRhJKYADtglPgGNyVQo+k7zCck7y/W
 YGmKx6aYq8Hg4RiYbxOrZYTKTTX9MdICftFlUKH6sKeUW7gHHU9ymIOc/KKxTlGdSuiocfTET9I
 orLTrziB+Ru1zk04Sqf141XD1py3UqXw3r/tDnkDx+6ixIuxgzhlaQOlFYTRkP3ra
X-Received: by 2002:a1c:7e04:: with SMTP id z4mr4741709wmc.95.1633453732412;
 Tue, 05 Oct 2021 10:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvYtpyR6ep3Etv4zdcbMWlhK+O886ongW98v+gFhBx4YYyV/pUK+YcKenTHD/YXgbBTDUNlQ==
X-Received: by 2002:a1c:7e04:: with SMTP id z4mr4741669wmc.95.1633453732130;
 Tue, 05 Oct 2021 10:08:52 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d8sm11048017wrz.84.2021.10.05.10.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 10:08:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/i386: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, pbonzini@redhat.com
References: <20210811085842.2511545-1-jean-philippe@linaro.org>
 <20210811085842.2511545-2-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
Message-ID: <abc497bd-e15e-5d61-b8ee-4666f5197fae@redhat.com>
Date: Tue, 5 Oct 2021 19:08:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210811085842.2511545-2-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> $ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
> qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found
> 
> Rename the parameter to "default-bus-bypass-iommu". Passing
> "default_bus_bypass_iommu" is still valid since the underscore are
> transformed automatically.
> 
> Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>


Eric

> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fb24f000e7..ce4756ad59 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1779,7 +1779,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>          pc_machine_get_default_bus_bypass_iommu,
>          pc_machine_set_default_bus_bypass_iommu);
>  
> 


