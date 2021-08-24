Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E33F5834
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:29:16 +0200 (CEST)
Received: from localhost ([::1]:36052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIPvv-0005ng-FN
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPuv-0004rn-TP
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPut-0002sj-Bm
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 02:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629786489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WjXxN7ar6YtQgntGRH+UhKS+oGpF1B2cVqu5VNaZuLM=;
 b=gTAAmGMA2VTXYeCOfwlkL9HT6dAmIXrkMmX1287Ka5Qnsy8UMHo0lHTegnzAX8d7UXb4Gk
 HzardUJQlcX+3BahpJQ+adAgAeMoM5QIY4DRTgXpkgxQ1Kubwn3WqolNL3b7UoJIvzSkW2
 8qy1tho0JUZP2LiZrrHvhq3epH5dVqM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-os97PkkhM5mziZT0sjBVxQ-1; Tue, 24 Aug 2021 02:28:07 -0400
X-MC-Unique: os97PkkhM5mziZT0sjBVxQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gb24-20020a170907961800b005c158d37301so5632690ejc.17
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 23:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WjXxN7ar6YtQgntGRH+UhKS+oGpF1B2cVqu5VNaZuLM=;
 b=dqayfatd+fgMRDaOMEn999+oAp6CHznOsXTyMgkdSUwFARzT31UuPZLzpP3HsX+5ZC
 712u5soeetcd2yRQpsTZjHJ8xxHt08bSU3Sz1GH9rALNaCoXhPyKpvrGZA3bWq17voGp
 jOaedLi//ZqzFkIixisLLPRYgudjTkPoEKu6rAXcYZmPrrUbDaOR3vn4tXHYY381SD8j
 ZzGTqQYKzpGAE+SOmWqvkAf+4mK5qxwwDuU1XpzIwmW654RGyI3gphVQh3m0/foD8LPs
 32zQdO3Lq68um/pdt9T9NMvdVjPf/sATNGMIk9DMM0clEnGrvTGlZSFBZZRWgS0vxtBc
 ijRQ==
X-Gm-Message-State: AOAM533nicvI/AAC/41w0gueQO+zVzmE+xoAaAyNA6knZjVfGxctssNb
 WMsp9TndFW6QKt+6YFVlG+Nu75q8oMBM3kdrt6HeVLxn16MtkYN0nGhxe1WkDXxpa03EjTaNWrP
 bzKtn6o9jygiJ6ZA=
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr39670593ejb.146.1629786486411; 
 Mon, 23 Aug 2021 23:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl5twL+8QAGFkC9g8lNdoWihdFv9Dt3PWiGBGfq7pKV26r/p3phIlsgUMqXtLaUD7uHYdX3A==
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr39670573ejb.146.1629786486184; 
 Mon, 23 Aug 2021 23:28:06 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j24sm2227720edj.56.2021.08.23.23.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:28:05 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:28:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Message-ID: <20210824062804.amut2hdve4x6ldsw@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-5-drjones@redhat.com>
 <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
MIME-Version: 1.0
In-Reply-To: <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 11:04:49AM -0700, Richard Henderson wrote:
> On 8/23/21 9:06 AM, Andrew Jones wrote:
> > Future CPU types may specify which vector lengths are supported.
> > We can apply nearly the same logic to validate those lengths
> > as we do for KVM's supported vector lengths. We merge the code
> > where we can, but unfortunately can't completely merge it because
> > KVM requires all vector lengths, power-of-two or not, smaller than
> > the maximum enabled length to also be enabled. The architecture
> > only requires all the power-of-two lengths, though, so TCG will
> > only enforce that.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >   target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
> >   1 file changed, 45 insertions(+), 56 deletions(-)
> 
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> > +        } else {
> > +            if (kvm_enabled()) {
> 
> Nit: better as
> 
>     } else if (...) {
> 
> if I'm reading all of the diff context correctly.
>

Yeah, the diff is definitely not easy to read, or even the code
after its applied for that matter... We can't use 'else if' here
because the 'else { if' is part of a pattern like below

  if (...) {
     if (...) {

     } else {

     }
  } else {
     if (kvm_enabled()) {

     } else {

     }
  }

Thanks,
drew


