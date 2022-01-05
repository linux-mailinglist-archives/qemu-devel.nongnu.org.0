Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B94856A1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 17:27:07 +0100 (CET)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n597x-00017Y-Tr
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 11:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n596V-0000M9-HU
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:25:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n596S-0003YB-Td
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 11:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641399930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hknNMTwFhbYpQSmz5No5xN0sw1+0JrW2QZ6zSfztptA=;
 b=iOiNEKC3H6LuXA3y9OxW+NVY6NMrGIIXRV/2XAfCKPh9w3IF+YUBSeiX9v/I81A3T0Nl2o
 5lJXy7molKB4hnDPk0lmNrbZ1juSzhjFQyjn7BvGd6lo9JVwAiV37IvDmwVdT9gCmTADNh
 VgHBf6r7Ta84hu/bFKh9pjxL79OPuC8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-GljRxsFSPWC1NZGAeSzHrw-1; Wed, 05 Jan 2022 11:25:24 -0500
X-MC-Unique: GljRxsFSPWC1NZGAeSzHrw-1
Received: by mail-qv1-f69.google.com with SMTP id
 gf14-20020a056214250e00b00411ba2ba63dso26859514qvb.21
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 08:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hknNMTwFhbYpQSmz5No5xN0sw1+0JrW2QZ6zSfztptA=;
 b=jr4hZky6GYo9jEqEsN1t7iDAYdLrCgvm7cVSRDdQGhY1bZIJDZc6Rdlltp/o797XjT
 1TaCuYONW5XaT2vk88RF2cISKqL4fNaC2VzfEOQUkNds1QS7HUN2cJ59jOvO2KXQqDbU
 J388n9SSO/aXTw2tgudT51Hx9Sy9vlVOOZ09qzaTm8jOzt8N08KhJ/ducQWaQssjD4hm
 aUrEq+BKVIVOQ7N0xkHSqg7NILAfhFUL/oSyXTBGqw4D7v6pLSkxlL4mfZX/znqU8OUq
 tw+b+qao+TFEqui6Eifk4FHI/HJEph8Znv9fZcAdnp6sHR6e8WVAzyVMsdUwPGW6yYFU
 IkNg==
X-Gm-Message-State: AOAM531yt/VIaho4BhW7FEtx8WRj5lXcHTOeHy1nSU2/gIUcwi/AIToi
 r047FOchPwDkXB/OpU0cfjKbPO5TWSzDT31uAc0D7e+JP5EKybQz963yrloZlU1Ov2Ycynu88pb
 E543ZisyRKZW3FK0=
X-Received: by 2002:a05:6214:4015:: with SMTP id
 kd21mr51294320qvb.41.1641399924301; 
 Wed, 05 Jan 2022 08:25:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlKHgt/quzEpSNY3x5FQOure6fAVMboTj7d0dDxEXUBGTvUItt4q2D6fkCkEzFQ7R/QFrV9w==
X-Received: by 2002:a05:6214:4015:: with SMTP id
 kd21mr51294296qvb.41.1641399924089; 
 Wed, 05 Jan 2022 08:25:24 -0800 (PST)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id f12sm34865877qtj.93.2022.01.05.08.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 08:25:23 -0800 (PST)
Date: Wed, 5 Jan 2022 17:25:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] hw/arm/virt: KVM: Enable PAuth when supported by the host
Message-ID: <20220105162519.5kjtkhphv3sdyaw4@gator>
References: <20211228182347.1025501-1-maz@kernel.org>
 <20220103134601.7cumwbza32wja3ei@gator>
 <878rvwzocq.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <878rvwzocq.wl-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 06:05:41PM +0000, Marc Zyngier wrote:
> Andrew Jones <drjones@redhat.com> wrote:
> > 
> > Thanks for considering a documentation update. In this case, though, I
> > think we should delete the "TCG VCPU Features" pauth paragraph, rather
> > than add a new "KVM VCPU Features" pauth paragraph. We don't need to
> > document each CPU feature. We just document complex ones, like sve*,
> > KVM specific ones (kvm-*), and TCG specific ones (now only pauth-impdef).
> 
> Sure, works for me. Do we need to keep a trace of the available
> options?

For arm we need to extend target/arm/helper.c:arm_cpu_list() to output
the possible flags like x86 does. On x86 doing this

  qemu-system-x86_64 -cpu help

not only gives us a list of cpu types, but also a list of flags we can
provide to the cpus (although not all flags will work on all cpus...)
On arm doing this

  qemu-system-aarch64 -cpu help

only gives us a list of cpu types.


> I'm not sure how a user is supposed to find out about those
> (I always end-up grepping through the code base, and something tells
> me I'm doing it wrong...). The QMP stuff flies way over my head.
>

Indeed, currently grepping is less awkward than probing with QMP.
With an extension to target/arm/helper.c:arm_cpu_list() we can
avoid grepping too. I've just added this to my TODO [again]. It
was there once already, but fell off the bottom...

Thanks,
drew


