Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC6D6D6CFF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 21:15:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjm69-0006CZ-M8; Tue, 04 Apr 2023 15:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjm68-0006CH-AB
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 15:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjm66-00043S-H9
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 15:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680635616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0J/+OtsPq0ZfqFZWkkgP1rS9veg6N6TrmyGPr4zZQY0=;
 b=Azz2xdg9oBdXY0SzlBktCelt/R/HoXEjQyhJtmIaT4tDXqakJVBcfNzxxGgRrj3iLUE26V
 1+OZ9gsO0BOsyg+SusfEqF7K0RTmkKNFyzFg5V3Obvq0OPa+gTRaH/IA7ILvx4i27Kfg1u
 v2yz+aExgPAD6kLOFX98bnWMpai5m0M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641--y4d4aXiOwSpI4YvGLNNJQ-1; Tue, 04 Apr 2023 15:13:35 -0400
X-MC-Unique: -y4d4aXiOwSpI4YvGLNNJQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s30-20020a508d1e000000b005005cf48a93so47074967eds.8
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 12:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680635614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0J/+OtsPq0ZfqFZWkkgP1rS9veg6N6TrmyGPr4zZQY0=;
 b=IFkTTMq1c3Ti4P18ux2uD2I2o5Xe6Ot8rtrKMwTcLflyTwqM8tIagXpAJCXey/TOh7
 qO+saUEbls8icMkaeSC99iVy48PsbC9Oox4kuosrzXtw6QX9+9DgNbsLBJpSq2ptO08H
 JDhFAMYNTYafoSDHoTB0XP3Tdz6i1XAK/xToyVP7rMF9339M72iMs1yY5JeDZ+WvhCAX
 fGmb+iMMd44e7Pz3fAuM6P+stuohp4TVbaSV7FW+XRphtWEb1h6wy9DsH1PB/zahCo7i
 HZFEOCIMwVmG4rPF4IPpm4mQ4qQGV3bS91xz+WoAD4tpANTXkah1vpDHU7cxgDeUHEJI
 mTzg==
X-Gm-Message-State: AAQBX9f7ZTtXURxllWU1WDhv2fg+yGExj9q6835y/oUsArJcMe8hXoaK
 eUv6asZr82khSsoRwIyF79iHdTuBjn/R+qa5QboEVTFOlOuyecsbH2TcBZRduSXGwJVAVNQ1gQw
 lT6JShlYpgGgIGvU=
X-Received: by 2002:a17:906:3155:b0:947:a6d7:e2b4 with SMTP id
 e21-20020a170906315500b00947a6d7e2b4mr614413eje.8.1680635614235; 
 Tue, 04 Apr 2023 12:13:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMpO5QITBhWGoMBpCXyOklfEyb1C9yd6snSOMPvzWlPQqJhjjVXudHh3RLIVAscOOuRCXV6A==
X-Received: by 2002:a17:906:3155:b0:947:a6d7:e2b4 with SMTP id
 e21-20020a170906315500b00947a6d7e2b4mr614396eje.8.1680635613943; 
 Tue, 04 Apr 2023 12:13:33 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 r2-20020a170906a20200b009323f08827dsm6448323ejy.13.2023.04.04.12.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 12:13:33 -0700 (PDT)
Date: Tue, 4 Apr 2023 15:13:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PULL 36/53] memory: Optimize replay of guest mapping
Message-ID: <20230404150929-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
 <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 04, 2023 at 07:00:04PM +0100, Peter Maydell wrote:
> On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Zhenzhong Duan <zhenzhong.duan@intel.com>
> >
> > On x86, there are two notifiers registered due to vtd-ir memory region
> > splitting the whole address space. During replay of the address space
> > for each notifier, the whole address space is scanned which is
> > unnecessory.
> >
> > We only need to scan the space belong to notifier montiored space.
> >
> > Assert when notifier is used to monitor beyond iommu memory region's
> > address space.
> 
> Hi. This patch seems to have regressed the mps3-an547 board,
> which now asserts on startup:
> 
> $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> -kernel /tmp/an547-mwe/build/test.elf
> qemu-system-arm: ../../softmmu/memory.c:1903:
> memory_region_register_iommu_notifier: Assertion `n->end <=
> memory_region_size(mr)' failed.
> Aborted (core dumped)
> 
> (reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)
> 
> Since this commit says it's just an optimization, for the 8.0
> release can we simply revert it without breaking anything?
> 
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 9d64efca26..da7d846619 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1900,6 +1900,7 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
> >      iommu_mr = IOMMU_MEMORY_REGION(mr);
> >      assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
> >      assert(n->start <= n->end);
> > +    assert(n->end <= memory_region_size(mr));
> 
> In the mps3-an547 case we assert here because n->end is -1.
> This is because tcg_register_iommu_notifier() registers an iommu
> notifier that covers the entire address space:
> 
>         iommu_notifier_init(&notifier->n,
>                             tcg_iommu_unmap_notify,
>                             IOMMU_NOTIFIER_UNMAP,
>                             0,
>                             HWADDR_MAX,
>                             iommu_idx);
>         memory_region_register_iommu_notifier(notifier->mr, &notifier->n,
>                                               &error_fatal);
> 
> thanks
> -- PMM


Fine to revert by me.  Zhenzhong Duan  can you pls fix up
this regression and repost? Maybe fix typos in commit log
when reposting. Thanks!

-- 
MST


