Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5953F4DCA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:54:32 +0200 (CEST)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICHP-0005Sz-Ch
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICGP-00047A-5Q
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICGN-00088S-Nf
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hXnCLG9H71lVP40TV9sgoIc+jcNtRZ32L0RgRK0BSZI=;
 b=dacD5ZtjAtm5z3c9ODHX4t1LpbF6PZN+w0t+aLGqQ2lwqA74BgRdl9Odw/PDKIUdkH8gf4
 V9lXV/LWPU2SPrXeR3tRMnRPIhHK21CxNG6mx6O7NQYbMvBsvDWmDGQxJJaXTzhPOARnnJ
 2KnYklTCrRxubZW4P4I2GnVvJPPll1Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-IhutlfM8MNSTqUUW_CcB-w-1; Mon, 23 Aug 2021 11:53:23 -0400
X-MC-Unique: IhutlfM8MNSTqUUW_CcB-w-1
Received: by mail-ed1-f72.google.com with SMTP id
 bx23-20020a0564020b5700b003bf2eb11718so8932247edb.20
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hXnCLG9H71lVP40TV9sgoIc+jcNtRZ32L0RgRK0BSZI=;
 b=KQehJIgYD8UJeoXrOYoVomC25kl84dcgrSkp69yhfYu9K5XIRz6iwmsdvYZNIe0DV9
 c0+HEDKO1u8+eZ9kiMxMgqVjRkaZjMpmWxfUz00p6f4L+UTNWhV9/IvDkl9bp5Ccc3L9
 QPBw5VQNjUtBJ+ErdB3kSSzjKQ984svXLQb5BVD1cQhC28rl3rMWnItSjbkeNWZhGDUD
 e8LSoDDCPitaWr37OSh1bxxkxaIYmDqLVRrbDtE/0Dr0b2oHTEQnO00umsgr0IRXxAjk
 7sPD9XLPgpo+Xzf5ntvzksJ/V+l3KiOrES4BF+SeYlavuph51qj13BtQyZQsupn6w7Ev
 gYEA==
X-Gm-Message-State: AOAM530GUjcx+OamknMhDsZ/M0kscL2iLeH9xQMKEpREUxg4f2j8FyAQ
 C1LbE+uAV0oiDFIcO6+tb+mkrSDYqPaIkFtsjihE1dCFMiHcgCGGJje5QZGh7zN0vvVw/uC8g+B
 lgAAlbYmrxeNRwe1nJguEfa9QJQUfa7nY6CXhAIMtu7fxTAkUDU9JDWlnR/q1nJ/hGw==
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr38872176edc.210.1629734002255; 
 Mon, 23 Aug 2021 08:53:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx81gfeuQu+NoQsOF3ojpUUcM50KMjIo2B2P5BVohnQltGD+nX4W6Rz81weUuwZoiLbOPQOw==
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr38872160edc.210.1629734002057; 
 Mon, 23 Aug 2021 08:53:22 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id n23sm9755721eds.41.2021.08.23.08.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:53:21 -0700 (PDT)
Date: Mon, 23 Aug 2021 17:53:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/4] target/arm/cpu: Introduce sve_vq_supported bitmap
Message-ID: <20210823155320.6pr3432lzoihn32a@gator.home>
References: <20210819193758.149660-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 09:37:54PM +0200, Andrew Jones wrote:
> While reviewing the new A64FX CPU type it became clear that CPU
> types should be able to specify which SVE vector lengths are
> supported. This series adds a new bitmap member to ARMCPU and
> modifies arm_cpu_sve_finalize() to validate inputs against it.
> So far we only need to set the bitmap for the 'max' CPU type
> though and, since it supports all vector lengths, we just fill
> the whole thing.
> 
> This series was inspired by Richard Henderson's suggestion to
> replace arm_cpu_sve_finalize's kvm_supported bitmap with something
> that could be shared with TCG.
> 
> So far I've only lightly tested this. I'll do more testing and
> report back later. I'd also be happy to get test results from
> others.

I did more testing and it looks good to me except for the extra
space in an error message that I reported in patch 4.

Thanks,
drew

> 
> Thanks,
> drew
> 
> Andrew Jones (4):
>   target/arm/cpu: Introduce sve_vq_supported bitmap
>   target/arm/kvm64: Ensure sve vls map is completely clear
>   target/arm/cpu64: Replace kvm_supported with sve_vq_supported
>   target/arm/cpu64: Validate sve vector lengths are supported
> 
>  target/arm/cpu.h   |   4 ++
>  target/arm/cpu64.c | 118 +++++++++++++++++++++------------------------
>  target/arm/kvm64.c |   2 +-
>  3 files changed, 61 insertions(+), 63 deletions(-)
> 
> -- 
> 2.31.1
> 


