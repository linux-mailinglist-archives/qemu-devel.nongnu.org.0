Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC83D2661
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:06:36 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aHT-0003af-Lp
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6aGG-0002qL-I7
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m6aG8-0006uc-E3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626966310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcDdrBj+X9Ol1ClBCDAW+S/zVcHrLlDWVRfChhk9pmE=;
 b=PkIuR+skxtWFh4lE9RnVwldPfYAvlKiIU8AWW8EZKUMl4YOYhB5r9eVKcHz22avyxCwy1d
 Uxkg51JG16ky4gbxc9TIw6qQZnLo7dk8TnC9/W501qJlXplJcqG2Bl5Kzbk/WT5mMxWSDF
 6AGbZEZDqV7aMyegpZaVypIvLazlNgU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-A7TF-9mSNvW7H27QDQxp6Q-1; Thu, 22 Jul 2021 11:05:09 -0400
X-MC-Unique: A7TF-9mSNvW7H27QDQxp6Q-1
Received: by mail-io1-f71.google.com with SMTP id
 s203-20020a6b2cd40000b0290528db19d5b3so4200184ios.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pcDdrBj+X9Ol1ClBCDAW+S/zVcHrLlDWVRfChhk9pmE=;
 b=ouSjkVO5ybxvJiFWoUS/sycYeV+5FXRZeHORfTBQVYe8iehiKKNhYnjoMlBp5yv5kt
 rN69O3CQbKkgbkUEVsXXDpeadVlwGLFhnZWe4DQqlzl7Q22cdZ0ausA7Dj+Xx5w55iBM
 MgbWk0jeCEGVJHDaS5mvnieVmho4JSjVv5yt8jUotL87HdIJ2PxsrEnwXRFU/JH1Nndz
 kvTxpyHft2fPaO549n7l8kAxYTbMJq6f7zolgi6hsxtNk4bg31Ig9hf2DYOrqYcGg+m3
 Osrtw+JFd67l+wiRLXVsAHt8nU59R3PCQRJfSy1z8ZTzeHZ87hrhnEHtPeOdnxlljd/J
 +8hw==
X-Gm-Message-State: AOAM5314PBLh1DZGmxhTqsJFdlslhWSxVTGXa5nhp30tyh1Xl+H4GbGJ
 eF4NS7S4CnrlvQqL+r5rSt8lB8mVZxx3s1E5FBQrOvFY1mZlp9AyChZKgmJ/L5SQo2KzNocWcxF
 HYbGAl1iRf3zOU30=
X-Received: by 2002:a6b:3e8b:: with SMTP id l133mr141350ioa.137.1626966308766; 
 Thu, 22 Jul 2021 08:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl+Rtrz8LUG1ha8n4sFMbT4Lt/sEmSnRnLgC88aAdMws7g1d4+AGQ83AIOlPNZhK9u+7/d1g==
X-Received: by 2002:a6b:3e8b:: with SMTP id l133mr141324ioa.137.1626966308576; 
 Thu, 22 Jul 2021 08:05:08 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id k4sm3374752ilu.67.2021.07.22.08.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:05:07 -0700 (PDT)
Date: Thu, 22 Jul 2021 17:05:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v2 04/11] machine: Use the computed parameters to
 calculate omitted cpus
Message-ID: <20210722150505.okdd6fv6dnkv6rcn@gator>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-5-wangyanan55@huawei.com>
 <20210719164203.r3f4qdbw3y3ieghb@gator>
 <ddf16035-d99f-9974-aec6-5bd0466205ed@huawei.com>
 <20210722122737.6zncj26bgjevflyh@gator>
 <6a75b589-3ad7-5a81-5804-3f9d07864a7c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6a75b589-3ad7-5a81-5804-3f9d07864a7c@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 10:59:11PM +0800, wangyanan (Y) wrote:
> Ok. If we remove the rounding, then the calculation code has to be modified
> to be like the following. We have to separately consider the case that cpus
> and maxcpus are both omitted (e.g. -smp sockets=16).
> 
> maxcpus = maxcpus > 0 ? maxcpus : cpus;
> 
> if (cpus == 0 && maxcpus == 0) {
>     sockets = sockets > 0 ? sockets : 1;
>     cores = cores > 0 ? cores : 1;
>     threads = threads > 0 ? threads : 1;
>     goto cal;
> }
> 
> if (sockets == 0) {
> ...
> } else if (cores == 0) {
> ...
> } else if (threads == 0) {
> ...
> }
> 
> cal:
> maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
> cpus = cpus > 0 ? cpus : maxcpus;

Whatever works, but hopefully you can avoid an ugly goto.

Thanks,
drew


