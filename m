Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FD5543862
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:08:37 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyEV-0006MC-NE
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nyyCd-0004ca-7q
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nyyCa-0001Ia-KJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654704394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezqFEJN0nLL4VZti5cQmcgbWOh4nV0LXx3wYfDebEBw=;
 b=S+RblvZ9QDrLVr+Vr4cANP15NdbVKlROWHN+7MAJixH2In45xO5+vCCDAjVYtp8Dz85Z6e
 iJtNjrXfygfFtS8a8PSmq8zND23XBAcGTJ7DNwzLILkt0ZEvGGhundQiUEtjrEzCdEzGxX
 yErdjLFhKbmk2G5aH5Ww3xbWvToKXKA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-ysnNYm_lP1Gtg4RlXUlIlg-1; Wed, 08 Jun 2022 12:06:25 -0400
X-MC-Unique: ysnNYm_lP1Gtg4RlXUlIlg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so4013397wmb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ezqFEJN0nLL4VZti5cQmcgbWOh4nV0LXx3wYfDebEBw=;
 b=nrZTmm/5GknLDK+3RISJqNSkddAknBIOF+6+12d/dwnC4bmVOQp0jwqe24hynqLEzi
 DHEYhzbfDONAZdtXbP6WocCYdqA7g4gINBxVs2YefDcWmaHAaijlwJza/YIuGueLjj43
 yd9NtE3gtHLwG13kq+AQdMWVNYg/sDzNNTKs6eIfePYD1jeoMIKzh+uvnLHjv9f61yxM
 Kfu8s/9VEn114GJrRMv8IF8lqSfHv0ulFubMWi6qTWrEMggSHHWcieD8twH9uJnoK4f1
 ScvlhlwX/KVPkbR5Vsbz0bSEIyoF8cM8PL9mncnAhY1rOE2FJJBbcYIUc0dNXXhC0PVD
 ckZA==
X-Gm-Message-State: AOAM5320W0ov41ZVb/U5hlVWzkoNFnI1rien1P2EcXca1efB4r+HwLZ0
 /SNmNtapSbx6iM33zqyGmC86bbUjYJg8gYQdQgerp5Hn6EOpIgFZzIYvHe21BFDNaqO6SI5xeZY
 ri4pndqaAMUWmSMI=
X-Received: by 2002:a05:600c:34d2:b0:397:7209:c1f0 with SMTP id
 d18-20020a05600c34d200b003977209c1f0mr35708507wmq.132.1654704384211; 
 Wed, 08 Jun 2022 09:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCp0xInp5kqEy50QES5wCv8FQFGsKUg38U95UUrDZhnzzv9C7hdZoR+SrpxzxO4tVo9jq96w==
X-Received: by 2002:a05:600c:34d2:b0:397:7209:c1f0 with SMTP id
 d18-20020a05600c34d200b003977209c1f0mr35708477wmq.132.1654704383922; 
 Wed, 08 Jun 2022 09:06:23 -0700 (PDT)
Received: from redhat.com ([176.12.150.13]) by smtp.gmail.com with ESMTPSA id
 l19-20020a1ced13000000b0039c1396b495sm24219403wmh.9.2022.06.08.09.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:06:23 -0700 (PDT)
Date: Wed, 8 Jun 2022 12:06:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220608120505-mutt-send-email-mst@kernel.org>
References: <20220603085920.604323-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603085920.604323-1-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> The pcie host bridge has no io window on microvm,
> so io reservations will not work.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I don't much like overriding user like this. We end up users
setting it to silly values and then if we do want to
support this things just break. Thoughts?

> ---
>  hw/i386/microvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 4b3b1dd262f1..f01d972f5d28 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -757,6 +757,12 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>          "Set off to disable adding virtio-mmio devices to the kernel cmdline");
>  
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> +
> +    /*
> +     * pcie host bridge (gpex) on microvm has no io address window,
> +     * so reserving io space is not going to work.  Turn it off.
> +     */
> +    object_register_sugar_prop("pcie-root-port", "io-reserve", "0", true);
>  }
>  
>  static const TypeInfo microvm_machine_info = {
> -- 
> 2.36.1


