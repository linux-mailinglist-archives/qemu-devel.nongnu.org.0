Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1428A3D261E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:48:24 +0200 (CEST)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Zzr-0005yl-4t
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6Zwb-0003mP-Eh
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:45:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6Zwa-0002lS-1R
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626965099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rLDfbIGcproIzp2tvA6AqaxDJ5Zb2J0nLjUyiL/xOc8=;
 b=Y6N6ZFSkK+CwngvFG9MhVjMDQsT+pe2YbpRVmKbliGEaWqFwi+oInhVpHovz8aF6JiHrhM
 j1MRpJn80u4G+NruEIiU6/ca/PuJ6r/W5PdXaLgOh54j6sB/y5IcPiN6KwIwKLjp2KEH7f
 ZgzUDogJiwo783mEOHnKe6oTuq+a1uM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-dNo6HAWsNMyuNUChMBgWdQ-1; Thu, 22 Jul 2021 10:44:58 -0400
X-MC-Unique: dNo6HAWsNMyuNUChMBgWdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j11-20020a05600c410bb02902278758ab90so777731wmi.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rLDfbIGcproIzp2tvA6AqaxDJ5Zb2J0nLjUyiL/xOc8=;
 b=FCHOv0UNglmGVMerlDi1IXBBb7t60hZQVmuwdDnWdfna6GeNYG4KHK71SwBPij/OTu
 JZhB9EIy4s7nlIoODGDPnW2EazE9LOzdONeH6Dd49Imb8z203CHNsCV90ItlkI8BqVz1
 fM8p96H2P1J+QENRjJc8pJyVMOdrLJd14I40xwiUETQDk5pv2x8Rht/vg7rYLJH5UyPH
 p9l3Nou+fgljZICKT8BHAg1+njBn6fPT6QCiM2qeR7LPNclDc6tSFQXE4ZfVAnHES+Pg
 KMN2FAVKe2aCnTmeSJpbqG3ffKHM1w2hK6hPKbgbOI9/9vWijch0d/BRoDm1J+j/JngK
 133A==
X-Gm-Message-State: AOAM5316axODlj8LtczJSqVEBE/oYNoSYdufImDfGHunUzPYakaOC8o2
 p+u5VUZTje82TC1XNCA6bQA2RTjkBxRRUAh8PB90SVvivtnqEb4df/z+UTvhXqNG/kH/DNluJJv
 Us+DCwVV6KOZAOP8=
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr6862980wmq.84.1626965096824; 
 Thu, 22 Jul 2021 07:44:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqNojfRQw8n2r1C8WXdkPW4hGTbylVtQ1v3z66H+R5OhMm8aYI1n3lb3Z2kLpZrp/gS9ZYYw==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr6862961wmq.84.1626965096603; 
 Thu, 22 Jul 2021 07:44:56 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id m4sm30482247wrs.14.2021.07.22.07.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:44:56 -0700 (PDT)
Date: Thu, 22 Jul 2021 15:44:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
Message-ID: <YPmEZnBuCMwXq98p@work-vm>
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210721093347.338536-2-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> Since commit 551dbd0846d2 ("migration: check pre_save return in
> vmstate_save_state") the pre_save hook can fail.  So lets finally
> use that to drop the guest-triggerable assert in qxl_pre_save().
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 84f99088e0a0..3867b94fe236 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
>      } else {
>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
>      }
> -    assert(d->last_release_offset < d->vga.vram_size);
> +    if (d->last_release_offset < d->vga.vram_size) {
> +        return 1;

It would be great if there was an error_report or something there
so that we get some idea of what happened.

Dave

> +    }
>  
>      return 0;
>  }
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


