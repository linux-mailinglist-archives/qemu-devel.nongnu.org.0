Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48164439D43
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:17:16 +0200 (CEST)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3b1-0000OS-Ci
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3YV-0007Mg-1z
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:14:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3YR-0000lZ-Pn
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635182074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqlhPxMDJrL7R2Xf+TX0bcOT2d1MTaL12pV+9Pu9bIU=;
 b=GhnWCft6Vg+k7H2izTrPQtfQPjoY12Q+HGxuPOe2ivd87/qKNwntd4J9JVPBtqIQmkq4Yf
 aUutyKp17rl0XHYMIMY/5M8mhicdEKZlByptmuvaQrWyV+CLHn7oJVJKKxVBb0dHPiJ5F5
 cvIoKu+ZL1J79IZoMrwNSQap6Mw3qOw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-sHqvRY40O7OuuDff0sV4cQ-1; Mon, 25 Oct 2021 13:14:32 -0400
X-MC-Unique: sHqvRY40O7OuuDff0sV4cQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 s18-20020a056402521200b003dd5902f4f3so123586edd.23
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GqlhPxMDJrL7R2Xf+TX0bcOT2d1MTaL12pV+9Pu9bIU=;
 b=rIjX1eHMOtz7uFzfshKcnoAbO8Z5Pb5AX/tM+zY07QHlobC6D2VtcIh9OVGPorOs/Z
 MGmJ2hIYcXphRMpFJl0YNtNA9MA/tZRY5+4uuwqwO/A1hnfSmMjwdzK6Iw2HmcFErPcC
 j8U8ybn4RB1D6mxv/QZGEOgO8FyTAhbpeLnjGu31Pqfb9GuZllJx/J7JiXUscaosB507
 i7B3VQUcsv4EQ0967oH0HAD5En/wyXhmABxuF4k97CSbHTEl3O/3Xju6J+I9CUNNr/JN
 Ci6WYGJfO2/p/yJhSakGZy8whdWHpMGzkUkpSpIosoOBf2QvtuVl+V2w0mTPFHcjrb/7
 yeSQ==
X-Gm-Message-State: AOAM530DMVLJWGjg1CrKzrEU5yFQN0NRhin6ehcVVOzXef3FUTofwBNE
 mYJG4rMvnysJ+oMehysHRgxAxuuXjST+8BJc7v4Jml56VAFotW2011PDvkIcM3lmALrm3JyOdg0
 s+BV9y+s+6omQ06o=
X-Received: by 2002:a05:6402:5244:: with SMTP id
 t4mr27669475edd.14.1635182071608; 
 Mon, 25 Oct 2021 10:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5hthliamcXO64b4NhHh8/G5BUswUsId6z4f/Jdw1+O1S7NkVYJFkVpWHdJbOBGUiqa5Pxiw==
X-Received: by 2002:a05:6402:5244:: with SMTP id
 t4mr27669436edd.14.1635182071345; 
 Mon, 25 Oct 2021 10:14:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e7sm10061721edk.3.2021.10.25.10.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:14:30 -0700 (PDT)
Message-ID: <55e7387a-4bc0-1743-1013-19c38a6ceb77@redhat.com>
Date: Mon, 25 Oct 2021 19:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] hw/i386: Rename default_bus_bypass_iommu
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com
References: <20211025104737.1560274-1-jean-philippe@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211025104737.1560274-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, richard.henderson@linaro.org,
 qemu-stable <qemu-stable@nongnu.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/10/21 12:47, Jean-Philippe Brucker wrote:
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
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-3-jean-philippe@linaro.org/
> v2: no change, added review tag and resending to be merged separately
>      from the equivalent arm fix
> ---
>   hw/i386/pc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 86223acfd3..54e4c00dce 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>       object_class_property_add_bool(oc, "hpet",
>           pc_machine_get_hpet, pc_machine_set_hpet);
>   
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>           pc_machine_get_default_bus_bypass_iommu,
>           pc_machine_set_default_bus_bypass_iommu);
>   
> 

Queued, with Cc: qemu-stable@nongnu.org.

Thanks,

Paolo


