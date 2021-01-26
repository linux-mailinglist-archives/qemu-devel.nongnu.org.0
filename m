Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A42303FC6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:11:45 +0100 (CET)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4P4K-0004O3-Ro
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4P3W-0003xm-8C
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4P3S-0002gc-Av
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rvy3Af7tU8mrQd6Z5UFy5ift63nv2gQpRE17tnPoVK0=;
 b=YuTI5jN2dyUV0uxFkg8GmhS2v4EroI06S8Owh4m893t45Y42ARCJyPrR7GndalDavf6wI7
 Yu1fTPfPBveMEWo1epfGQMxs5pOUOcctBT95ijts2vgJ6uc6h3fnCfiznj/vRZi1Somxqf
 HbKv+lFdnRIA2e0Ck5/FNY/u1Ru9lFA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-EMlqUrKONJG6hdneegFm4A-1; Tue, 26 Jan 2021 09:10:47 -0500
X-MC-Unique: EMlqUrKONJG6hdneegFm4A-1
Received: by mail-wm1-f71.google.com with SMTP id q24so1430598wmc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rvy3Af7tU8mrQd6Z5UFy5ift63nv2gQpRE17tnPoVK0=;
 b=KZ3qKBhJrEikEf0qFHb1yrRJhdCS6DKmJ7O30MmcCDJfpjuRdwCUP3Fp8fbKSHOULM
 Y78rYKJPSW/hwQNzwQttf9UhChPLG2EpifPwdd7pvbK7EpDLfaHdgtUZg3c/uo7U0V+Q
 jFcQtlpzkRNwo8tWTtaUhKBLe5MvvYHxBq/p/T+KTrmqAJ+wTyBWAA9NIQPPbh27B/FP
 /sFE8x5rpgEV8MuPecXRsGeWu4ntjheNi6lw+X1sFujcLPTnNrbYiEs4sfdiQhBq9EA3
 eZi9d+qYGWHplRdjqFY30mSlIvYa2rKex0QmfHj0DS7QFMZEKVakPhoNlI0JQxtYQhsH
 xKXA==
X-Gm-Message-State: AOAM531HrMC3fh3qnE17rAaXERQ29HFbY68tATo84eXeL47KUVQyElJZ
 zIIdDW9vE/+56uZQfOHXsUxeF3OwGLx83pql17/mZh7Qqz8Ab6C4hr2taQNJMUIc2KNfd0IiKxY
 9L7dNtnD4QEjTMfA=
X-Received: by 2002:a05:600c:27d1:: with SMTP id
 l17mr4823630wmb.18.1611670246059; 
 Tue, 26 Jan 2021 06:10:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZwYnP/HYZwdEjU72bRTPWaq4GtxAIg9WM0jAN/mU9fzZzgKys0cmw9Dv+U35lEJxq4zsmnw==
X-Received: by 2002:a05:600c:27d1:: with SMTP id
 l17mr4823614wmb.18.1611670245886; 
 Tue, 26 Jan 2021 06:10:45 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id d5sm25070959wrs.21.2021.01.26.06.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:10:44 -0800 (PST)
Date: Tue, 26 Jan 2021 09:10:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] vhost_user_gpu: Drop dead check for g_malloc() failure
Message-ID: <20210126091022-mutt-send-email-mst@kernel.org>
References: <20210126124240.2081959-1-armbru@redhat.com>
 <20210126124240.2081959-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210126124240.2081959-3-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 01:42:40PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/display/vhost-user-gpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 51f1747c4a..db042c7c5e 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -332,7 +332,6 @@ vhost_user_gpu_chr_read(void *opaque)
>      }
>  
>      msg = g_malloc(VHOST_USER_GPU_HDR_SIZE + size);
> -    g_return_if_fail(msg != NULL);
>  
>      r = qemu_chr_fe_read_all(&g->vhost_chr,
>                               (uint8_t *)&msg->payload, size);
> -- 
> 2.26.2


