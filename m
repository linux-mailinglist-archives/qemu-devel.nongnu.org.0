Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F65EAB07
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:29:05 +0200 (CEST)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocq2a-0004D0-Kv
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ocprH-0000MM-0X
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ocprF-0003jQ-0e
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664205438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b0++vIydGYyk1KmIKAyUZC66eX/AoBdkjIcqCDtVfX4=;
 b=ThVeYBxqsVPIOTR1yH3h0q3q7C5q4rimc6zfqrNGKiKW2/pwCpTnqgud4hzxP3k0cDW080
 so/YXs8k4Z1JPSBadQUhEBAjfGA3dVbRjJ1AnMz//sLi9iJ5Lbns06vKhCFwRea7QN852s
 xr9BEhWeZ7o9BMniSJakZUK1trl5480=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-eYQ87wtZMbaMShQx2yCnKg-1; Mon, 26 Sep 2022 11:17:16 -0400
X-MC-Unique: eYQ87wtZMbaMShQx2yCnKg-1
Received: by mail-qk1-f199.google.com with SMTP id
 j13-20020a05620a288d00b006be7b2a758fso5145559qkp.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=b0++vIydGYyk1KmIKAyUZC66eX/AoBdkjIcqCDtVfX4=;
 b=Zd2Iv7cLoBHm+yZJvB+s2ApysSZrWlWaGZzalCpd8a7wYWH/6urdWI5zJcsWMhXHfB
 Pw5SbPcjLG6d/wkEZqoUuRQovWnTe2msNCSt90cq+sPwIIT+bDPeYn+9yUm/AJ5cHadQ
 eaySBlxcGTJO/JEisNfa0h7WA8nM6YNY9YQmCehuJM8BF15S1PdM/Ls5TmsI3V1BqNDE
 rT1KNtAdV2MU2Tc+nEtGrhOoiXciZ9YlMuLPwr6/EKcYR2PAJExJ3kyTZBg8M8wxub+5
 w6gz0cfRd5SHPgr+D21NQX168oI3s6wbW8MIlXhPgQuIaW4t7o2js09RdTYym2p0Xd09
 01Jw==
X-Gm-Message-State: ACrzQf0jouJ7Bf4Da/UIzy3QSzsJcs7ckS9VrcaR4sRZVkaoLZlCRBSl
 Z908gZXQPU5zMOfgkOFEki7ByjLhwTSwWV5eVu+R5oewpuLmIRmprci/C1qwlA4kCSW8zWyQr42
 yJgjjEh+BW/+m0g4=
X-Received: by 2002:a05:6214:2468:b0:4ac:8786:f20e with SMTP id
 im8-20020a056214246800b004ac8786f20emr17652920qvb.50.1664205436298; 
 Mon, 26 Sep 2022 08:17:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6z9YCa6H+awvdk+PRCye16wMTC8NvfRYD7K/ug+NiIBC/789LcLzosOpuAeeWYYE+ON9OKsg==
X-Received: by 2002:a05:6214:2468:b0:4ac:8786:f20e with SMTP id
 im8-20020a056214246800b004ac8786f20emr17652902qvb.50.1664205436066; 
 Mon, 26 Sep 2022 08:17:16 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 s2-20020a05620a29c200b006ce40fbb8f6sm11386754qkp.21.2022.09.26.08.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 08:17:15 -0700 (PDT)
Date: Mon, 26 Sep 2022 11:17:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] Revert "intel_iommu: Fix irqchip / X2APIC configuration
 checks"
Message-ID: <YzHCeugdNR/9kOHV@x1n>
References: <20220921161227.57259-1-peterx@redhat.com>
 <20220922154617.57d1a1fb@redhat.com> <YyyP4b2uKghi1EHL@xz-m1.local>
 <20220923102034.6579b66c@redhat.com>
 <20220923104159.39576159@redhat.com> <Yy4tQAeOUd49DpX6@x1n>
 <Yy5c7M10df3OINwH@x1n> <20220926113311.417316b7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220926113311.417316b7@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 26, 2022 at 11:33:11AM +0200, Igor Mammedov wrote:
> On Fri, 23 Sep 2022 21:27:08 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > On Fri, Sep 23, 2022 at 06:03:44PM -0400, Peter Xu wrote:
> > > On Fri, Sep 23, 2022 at 10:41:59AM +0200, Igor Mammedov wrote:  
> > > > It's worth putting history excavation with explanation what is broken and why
> > > > compat stuff is being ignored in the patch.  
> > > 
> > > Makes sense, I'll amend the commit message and repost.  Thanks,  
> > 
> > There's actually one way to slightly remedy this single case, mostly for
> > any QEMU 7.1.0 user with -smp <=8 and the intel iommu (as 77250171bdc02 is
> > merged only in 7.1.0).
> > 
> > We can have one compact parameter x-eim-enable-kvm-x2apic, setting it "on"
> > by default, "off" for 7.1, and "on" for 7.0-.
> > 
> > I'm not very sure whether that'll worth it.  Any thoughts?
> 
> How it (enabling x2apic API) would affect kvm/guests running with 8 or less CPUs
> and with intel iommu + remapping?

It's more from the guest ABI level, but indeed at least from what I see so
far <=8 CPUs are fine.

I'll keep the patch short, thanks.

-- 
Peter Xu


