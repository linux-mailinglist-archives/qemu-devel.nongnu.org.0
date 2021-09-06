Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C1401E1E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 18:17:09 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNHIy-0002JE-7P
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 12:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNHHU-0001QL-Qy
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:15:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNHHQ-0004bj-39
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 12:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630944930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9o//+xgbWBZU75mGw9CeHU5EKtySdAmjKiKyx/wwURE=;
 b=SKeMKMvA1x6PALt0HYzLPhO6lRP7gwNZ1wJiIXHVrv6b6QWWujLzMIKokz9gvr75ea16rY
 9VTnUCdcb3SC/KWwg+CVX2D9pG1FA52KnGgThA3mB60cuLe0gZzDETd0zTGDj9SYLWbfOg
 F3FcRoSush7H4N6VDfUW4vNDVdStH5s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-JbLTAeXeOu-xMnILIYOezg-1; Mon, 06 Sep 2021 12:15:27 -0400
X-MC-Unique: JbLTAeXeOu-xMnILIYOezg-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso3690544edq.20
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9o//+xgbWBZU75mGw9CeHU5EKtySdAmjKiKyx/wwURE=;
 b=bStC3+DVRJ+h5FlNd8x8Jk+bolzcbCNMbqvV1//zv3qx5gbdCDel9PXh6WCqkg7A3Y
 bs0CwP2KLXwpQZaES0SgiGsXXragBzel/p8DkfW3tQsh1pt+6GlurBSAVUudhurMjliw
 TKHXu8eSNWc582mmlIJRv4E6L2HhlkI2OxXP0lu6tfkXPP8iX193BWrzcSbBDWQLTxDG
 qm88sUBsFdBKmPdurM81TCAqoiIjBMz5ZaVmPQlGctcCWbOSJJXv407xDvEDnptNVHMS
 1KFVYCcjYW4NpnNeLROyKoTvbu+YAqE1aXnCUEFtUockAqtfhX/3ec3gHVxdbSU3UEWt
 Ahdw==
X-Gm-Message-State: AOAM530zYtP4Xv9Q7zasYowhKtZl022IdgUQWXioaSC+HZqcS3TSu/i0
 w2rF51smFrHZLf2fL2qvURVoQ6aoQaT1uQrjTiq2COuEU355M1eOFuThVwcMUsOW7SwE8ieoG/z
 M0KNE9fvZZYsxjBk=
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr13946817edi.132.1630944926342; 
 Mon, 06 Sep 2021 09:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDH8b9Us6SRFVZDyuBtF/yDECpL5aSsPGsnIz9VRjHFUxFD+tb5FqVuiKVyCrsFqtOHwDXlw==
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr13946777edi.132.1630944926014; 
 Mon, 06 Sep 2021 09:15:26 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id h10sm4989585edf.85.2021.09.06.09.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 09:15:25 -0700 (PDT)
Date: Mon, 6 Sep 2021 18:15:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
Message-ID: <20210906161523.4kc5l3usbw6l2s6r@gator.home>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
 <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
 <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 03:38:13PM +0800, wangyanan (Y) wrote:
> 
> On 2021/9/3 15:25, Peter Maydell wrote:
> > On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
> > > 
> > > On 2021/9/2 23:56, Peter Maydell wrote:
> > > > On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
> > > > > This new version is based on patch series [1] which introduces some
> > > > > fix and improvement for smp parsing.
> > > > > 
> > > > > Description:
> > > > > Once the view of an accurate virtual cpu topology is provided to guest,
> > > > > with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
> > > > > e.g., the scheduling performance improvement. See Dario Faggioli's
> > > > > research and the related performance tests in [2] for reference.
> > > > > 
> > > > > This patch series introduces cpu topology support for ARM platform.
> > > > > Both cpu-map in DT and ACPI PPTT table are introduced to store the
> > > > > topology information. And we only describe the topology information
> > > > > to 6.2 and newer virt machines, considering compatibility.
> > > > > 
> > > > > patches not yet reviewed: #1 and #3.
> > > > > 
> > > > > [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
> > > > > [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
> > > > > -friend-or-foe-dario-faggioli-suse
> > > > Hi; this series doesn't apply to current head-of-git. Is it
> > > > intended to be based on some other series ?
> > > > 
> > > Yes, it was based on the -smp parsing changes in [1] which hasn't been
> > > picked yet. Given that [1] somehow affects the topology parsing results
> > > which we will describe to guest, I think it may be better that [1] can be
> > > merged first and then this series follows.
> > OK. I'll ignore this for now; please resend once that other series
> > has been accepted.
> Got it.

Also, you'll likely want to rebase on Igor's acpi refactor series[*]

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html

Thanks,
drew

> 
> Thanks,
> Yanan
> > thanks
> > -- PMM
> > 
> > .
> 


