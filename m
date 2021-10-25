Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88A43A5AE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 23:17:56 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf7Lu-00039Y-8e
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 17:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mf7Jz-0002T6-UB
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mf7Jt-0001cw-Gf
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 17:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635196545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JL3A9XyF1VBSgL47JmnVTipoBpP02jbl8+cU0fLnuQM=;
 b=Vb+mGVazAtdg5o/k0SA1zWgh6HANyrfhieeRwU4b7lSZP7DC/C+EHKR3Um2Y3AZPL4NUwY
 hHNEROEZlLO+/JuC9+GiHvjN7viVDtByrDYFH4VJ2NkVDiyf+GXb2k5MHyFrIPkgcJ68+J
 rwz1Re6pwxc41SfsmdQ/P3BGeYsaut0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-cCH-RNsIP2iSDWC87SSbqw-1; Mon, 25 Oct 2021 17:15:44 -0400
X-MC-Unique: cCH-RNsIP2iSDWC87SSbqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 f63-20020a1c3842000000b0032a621260deso162446wma.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 14:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JL3A9XyF1VBSgL47JmnVTipoBpP02jbl8+cU0fLnuQM=;
 b=v7zcd+6o+s99U5NZqV87D0TEEVINYAps9j26VldzSJvCjXkGpY5gVvVZQCULWobtxg
 /CX70mZqq63szfzNG5zPC1WDOiAgvdusoN2iSiHtHia49iCpis/UP51Itwh72F8x+5fM
 AhTyD0eEu7cCkAETWlecLogQQCJxOckBLn1WnFYXcomvh4wfrAySWG/gBhtBCygzJ5Ng
 hGE8N+1gkVeZMxyPRVoDqePX34c1yYOetPAWNWp9XyHRyWWw9XbaYUnKCiTdeuiJOH4S
 1fE4I9WG15bFwrIb+/4fSlTctc+afi7/vbrZoglUn71v896VB0y2sG/SS0LwTmnkYlnD
 ztZQ==
X-Gm-Message-State: AOAM532SfizDwH82uj/jICOEXk7CyAhJbEQZPBSGX/Yru3vzrlvaS+1S
 qGplu26ThWYD1dRxb7xWYktuge08saqcuKcpM+QOlkDuV0ovrwtSCHZ+OW9jrpYod6nqbi3BQZE
 kdkQ8K+WWVhiqm7Y=
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr21876287wmq.54.1635196543384; 
 Mon, 25 Oct 2021 14:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbgeC1omsxixC50Q/9JKcKXz0JavQaS1xw0pM4T0lHVhp96SHvh9KUOKrzUhLCHI1YOX3NUQ==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr21876248wmq.54.1635196543143; 
 Mon, 25 Oct 2021 14:15:43 -0700 (PDT)
Received: from redhat.com ([2.55.12.86])
 by smtp.gmail.com with ESMTPSA id 25sm19672339wmo.18.2021.10.25.14.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 14:15:42 -0700 (PDT)
Date: Mon, 25 Oct 2021 17:15:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2] hw/i386: Rename default_bus_bypass_iommu
Message-ID: <20211025171532-mutt-send-email-mst@kernel.org>
References: <20211025104737.1560274-1-jean-philippe@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211025104737.1560274-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ehabkost@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, pbonzini@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 11:47:38AM +0100, Jean-Philippe Brucker wrote:
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

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v1: https://lore.kernel.org/qemu-devel/20211013160607.649990-3-jean-philippe@linaro.org/
> v2: no change, added review tag and resending to be merged separately
>     from the equivalent arm fix
> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 86223acfd3..54e4c00dce 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      object_class_property_add_bool(oc, "hpet",
>          pc_machine_get_hpet, pc_machine_set_hpet);
>  
> -    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
> +    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
>          pc_machine_get_default_bus_bypass_iommu,
>          pc_machine_set_default_bus_bypass_iommu);
>  
> -- 
> 2.33.0


