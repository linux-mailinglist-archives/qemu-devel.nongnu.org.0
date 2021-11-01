Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFFA442383
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:40:38 +0100 (CET)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfyn-0005WR-HC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfkw-0005xN-9k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfkp-0006BK-A2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635805569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wirbSOmYxmDfJCx0Rsfs4ORV8tna9B55LQ7YsVSNMgg=;
 b=aHJmgLtvKZ458RuFy5QdA5F8cDsfLR9P6QAJ3myc+IW/3UyzmKj1FXD3JslbuSf6sdqqT3
 g4+QJM8g9yO8zMLNxpFRFNQoUVeHOA/iU3I5E4CxUOPx9FTTHvg/Lp/K47WJj3pCV+gbjL
 9Qy0iv4F+w55m99tj2DDBSJLUNyAtxo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-ZHOuAiHgNOuaey5If87rpA-1; Mon, 01 Nov 2021 18:26:08 -0400
X-MC-Unique: ZHOuAiHgNOuaey5If87rpA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so16867488edl.17
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wirbSOmYxmDfJCx0Rsfs4ORV8tna9B55LQ7YsVSNMgg=;
 b=hP5v3dZsqOKf4AuGn3pRcvwP3JVal6YQ1LC5TeFKPW5KvJgFMRtXAAbaUfP02j2rb3
 cn+XcdHQVSIwOSaRpcRMGZvtwR6Io14rJCdhU6yCThgYce6BH25KVwZJKjI/sJyI9WKo
 JjCHkniFTyRLEHziHf13InRlpBEYxUcHkKoU2JT3kwdqIwqN2Iau++VEdJCmi24NjpkY
 h8aNG5d3dQibd5hCc55QkpRJWg0R3UHJm9WXetVQlojxvVD6SNvmkdks0RhMnH5xRpuP
 HNiAo6gVdR0J2zpxdrmWRwDEV3A/sqh54bCFIWmh7WOpcVi3SAJ6FJkUh6ocSnvapPQ5
 4Cmw==
X-Gm-Message-State: AOAM532+9ucWn7ijOljiqyVc4YWVpN9rNgX8n/8qT9NXQIIumkBL3aoo
 HViyPAQMcJR8kTFfOCwEqnthxo74cViGTZ6B2gmg5Va4aG24hi+ZBtn5xOtNnjPvZ0XflZ8IxbV
 wibmg9toSF1MkNx8=
X-Received: by 2002:a05:6402:2808:: with SMTP id
 h8mr14408426ede.267.1635805567641; 
 Mon, 01 Nov 2021 15:26:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0M29bumGEVCem1AvV7smhsLNVTIkk7q+M/7oPkxQud2b2V7ps1bTQ+CkFCoLTPTd4N2680w==
X-Received: by 2002:a05:6402:2808:: with SMTP id
 h8mr14408404ede.267.1635805567435; 
 Mon, 01 Nov 2021 15:26:07 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id z2sm7578562ejb.41.2021.11.01.15.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:26:06 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:26:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211101182532-mutt-send-email-mst@kernel.org>
References: <20211012082428.16222-1-jean-louis@dupond.be>
MIME-Version: 1.0
In-Reply-To: <20211012082428.16222-1-jean-louis@dupond.be>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 10:24:28AM +0200, Jean-Louis Dupond wrote:
> hw_compat modes only take into account their base name.
> But if a device is created with (non)-transitional, then the compat
> values are not used, causing migrating issues.
> 
> This commit adds their (non)-transitional entries with the same settings
> as the base entry.
> 
> Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
> 
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>


Jean-Louis, any chance you are going to address the comments
and post a new patch?


> ---
>  include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 4ff19c714b..5726825c2d 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
>      bool optional;
>  } GlobalProperty;
>  
> +
> +/**
> + * Helper to add (non)transitional compat properties
> + */
> +static inline void
> +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
> +{
> +    GlobalProperty *transitional = g_new0(typeof(*transitional), 1);
> +    transitional->driver = g_strdup_printf("%s-transitional", prop->driver);
> +    transitional->property = g_strdup(prop->property);
> +    transitional->value = g_strdup(prop->value);
> +    transitional->used = prop->used;
> +    transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)transitional);
> +
> +    GlobalProperty *non_transitional = g_new0(typeof(*non_transitional), 1);
> +    non_transitional->driver = g_strdup_printf("%s-non-transitional", prop->driver);
> +    non_transitional->property = g_strdup(prop->property);
> +    non_transitional->value = g_strdup(prop->value);
> +    non_transitional->used = prop->used;
> +    non_transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)non_transitional);
> +}
> +
>  static inline void
>  compat_props_add(GPtrArray *arr,
>                   GlobalProperty props[], size_t nelem)
> @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
>      int i;
>      for (i = 0; i < nelem; i++) {
>          g_ptr_array_add(arr, (void *)&props[i]);
> +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
> +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
> +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
> +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
> +            g_str_equal(props[i].driver, "virtio-net-pci") ||
> +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
> +            compat_props_add_transitional(arr, &props[i]);
> +        }
>      }
>  }
>  
> -- 
> 2.33.0
> 
> 
> 


