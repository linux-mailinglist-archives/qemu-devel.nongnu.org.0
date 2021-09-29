Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4B41C6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:39:34 +0200 (CEST)
Received: from localhost ([::1]:37152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVak9-0003b3-BW
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVaix-0002Wc-Kv
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mVait-0002xp-Jm
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gPptCaPb+3Tk3HUBd+J/guZ2dfz52kYwK8bl+wzvJI8=;
 b=iI4nllDgUhmVKB4UVuwy0tQtzPTfNlSZ4sey87RJZ+ce/Hfl91K4NwrDeV7Nrf7UzuqSpm
 IVfvF7J4nBCNjRc88hYM4LPTkoJE8GUxHroRe1Pk6XPXPuoB0Y4keMjjxUTDKUSCvz9M0a
 ynLiCyqjJ+HQ+0fSAn146OhnS0nkano=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-8C0I0P8bPASKt7MTTaWUkw-1; Wed, 29 Sep 2021 10:38:11 -0400
X-MC-Unique: 8C0I0P8bPASKt7MTTaWUkw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso2666202edi.1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 07:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gPptCaPb+3Tk3HUBd+J/guZ2dfz52kYwK8bl+wzvJI8=;
 b=TYeevgG45VhIrDWCwik7DLI+V0vEgWVKrX4fk5AvSyUVfK2qELwnd7lklBrhKrjGw3
 o3rm6MrmmAmYJuxjPaGV2I8VNkvX+K+d4iXXDdA2rcu7Hd2Ai7EjiWTRhcJWp/JBgaZe
 E4nSoW25ZbcsGvVlBmD3Mf5VRhVt4KnDAa8kjK90NLgYZzmGh/s4LP7jASRQjeXA0/ea
 26rqAG5zgimxMa0/yaK7anKyLruT4mKNsPDAmkZVgf2QoPnX46/oCwCZOJafYFcxXuqs
 j9grKH6/S4n8IhuibrFz3MTi3XDalnk2PQtNJKFvxhLXuypB/CkQuGXb3yvg8yLGdiB2
 5XZg==
X-Gm-Message-State: AOAM533p9vq0joNvv4x3D71AzyqHtGP2UYQ6+e5lFd75gXuzLBJkB9dl
 qkzy3yqdOda1uz4TYhklXb2S/BHc3FkXKjC8fmBGlumtg3nbiNYkBSUIAKbninSEUnOfFcB9VYq
 NY6glp+uKf4KKEhk=
X-Received: by 2002:a17:906:919:: with SMTP id i25mr34488ejd.171.1632926290648; 
 Wed, 29 Sep 2021 07:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuF+T83Mfb+C0OJBtFrZLUmItdoSIiumQuYZKF04JDrwZYxH0+A+eEMSrKrfn66sRtG7Kb7w==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr34463ejd.171.1632926290358; 
 Wed, 29 Sep 2021 07:38:10 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id my11sm17692ejc.80.2021.09.29.07.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 07:38:09 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:38:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/2] qemu-options: Tweak [,maxcpus=cpus] to
 [,maxcpus=maxcpus]
Message-ID: <20210929143807.iztxqypswpkknzlt@gator.home>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
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
Cc: qemu-trivial@nongnu.org, wanghaibin.wang@huawei.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 08:11:33PM +0800, Yanan Wang wrote:
> In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
> DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
> Obviously the later is right, let's fix the previous one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 5c1b0311c0..dcd9595650 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -200,7 +200,7 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
> +    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total CPUs, including\n"
>      "                offline CPUs for hotplug, etc\n"
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


