Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F029A3F4713
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:03:25 +0200 (CEST)
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5rT-00074Y-AN
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5oz-0006JU-FH
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mI5ot-0000H1-QK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629709238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vhF2pJaRmzUvp6i/qKuTKfFlUrAyN5aAJStLoZuRGCk=;
 b=gUWyJ+TCb3TRaZESJ+9C4j90WD/eToOTnKLlxgE4cvcTNXI9QqfC7Uu8Bdm+5p1rc7qRqj
 mAXR+WQolvcRLBOGFmzCihhZIDGiz8H4V00kQ58qptDz5oHHuu3ngbS7fHV01AYZhshq8h
 Vtrf+zVJMPttBz7mDrlD8uRjlW9Becs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-oEHvfCkWNjqUcDJeHLRnng-1; Mon, 23 Aug 2021 05:00:37 -0400
X-MC-Unique: oEHvfCkWNjqUcDJeHLRnng-1
Received: by mail-ed1-f72.google.com with SMTP id
 v13-20020a056402174d00b003c25d6b2f13so1680846edx.4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vhF2pJaRmzUvp6i/qKuTKfFlUrAyN5aAJStLoZuRGCk=;
 b=jrzZNm8ywElfA9CduAHmfDmfp+j68IFdbX3+/zdqqmFsl+NiB8USV4kHExp2SZVbyg
 DXUD0TBxADF7QlDdrTL8hferXBooxjjsLXyHszN2bmvm++56zA8iow42PKlHeeosyD3+
 C7cfHG4cdo0VZEznv2hc9doartPwYZg371m7UwhdmVBpaG6RBc491pO0xGmC9R65752t
 eULGmLyXGos9KOfODTwsg9YVGjPWTs2SxfT81vAXBMknTZs8Ja5t4KA6Q2YyRiCM7JQo
 qqkkU6jyln5v+/KpwsROSFFLKERtiQrVvkE4EW39X2Y0pvNoUDDEIceWCYJji9oFiFuY
 15/w==
X-Gm-Message-State: AOAM530UJDvUtY2+MtT9rx6y3TluT55DnjPe94zMZ0JuGH0RSsRTscNP
 v4ioWR1cqiuTjjykPxQ6kiOsocrkKwubKEnBfnDRzQAhlDXCIr7MP7GUw9o34Sgj97NqGk0imKN
 s1KIe+2NP/pTx0EY=
X-Received: by 2002:a17:906:25d7:: with SMTP id
 n23mr13068338ejb.322.1629709236468; 
 Mon, 23 Aug 2021 02:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydLD5tW1yHXKGfU5qB5b7sdRyvkUBpSu4c1ijDl4OrO16w08oyG8kaYfmPJRp7Sa70GM2a/Q==
X-Received: by 2002:a17:906:25d7:: with SMTP id
 n23mr13068315ejb.322.1629709236280; 
 Mon, 23 Aug 2021 02:00:36 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id e7sm9224967edk.3.2021.08.23.02.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 02:00:35 -0700 (PDT)
Date: Mon, 23 Aug 2021 11:00:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/3] docs/about: Remove the duplicated doc
Message-ID: <20210823090034.mz64vzpxvxgd2nbv@gator.home>
References: <20210823030005.165668-1-wangyanan55@huawei.com>
 <20210823030005.165668-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210823030005.165668-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 libvir-list@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 11:00:03AM +0800, Yanan Wang wrote:
> There are two places describing the same thing about deprecation
> of invalid topologies of -smp CLI, so remove the duplicated one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/about/removed-features.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index cbfa1a8e31..6a9c5bb484 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -647,19 +647,6 @@ as ignored. Currently, users are responsible for making sure the backing storage
>  specified with ``-mem-path`` can actually provide the guest RAM configured with
>  ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
>  
> -``-smp`` (invalid topologies) (removed 5.2)
> -'''''''''''''''''''''''''''''''''''''''''''
> -
> -CPU topology properties should describe whole machine topology including
> -possible CPUs.
> -
> -However, historically it was possible to start QEMU with an incorrect topology
> -where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
> -which could lead to an incorrect topology enumeration by the guest.
> -Support for invalid topologies is removed, the user must ensure
> -topologies described with -smp include all possible cpus, i.e.
> -*sockets* * *cores* * *threads* = *maxcpus*.
> -
>  ``-machine enforce-config-section=on|off`` (removed 5.2)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> -- 
> 2.19.1
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


