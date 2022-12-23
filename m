Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCAC6552BF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 17:23:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8koc-0002QZ-VU; Fri, 23 Dec 2022 11:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8koa-0002OW-6B
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p8koX-0007lC-S0
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 11:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671812548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDYDR1LNbBC46pLmxEIsSM75uN/jzQdoY4jnOg0V8S4=;
 b=Fv+LwrVwCNDKQZeolz1KkTQDpRYN2jouw9OmSCAJURmMJKmODpRSjUFN+vYNsBR6tSS70u
 7+v+cQhuOMMzYRq7zj7XAb6YZiocE2FTpILEgNZBhwmTMogG0xBEzGevAuq0w6dT7Rkhno
 45Zb+RkaQuP/cKRvNuDm5oT3igAu648=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-EOh9rWSUMIC7FLEkuQb9zQ-1; Fri, 23 Dec 2022 11:22:27 -0500
X-MC-Unique: EOh9rWSUMIC7FLEkuQb9zQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 r3-20020ab04a43000000b0041168b89479so1717311uae.6
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 08:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDYDR1LNbBC46pLmxEIsSM75uN/jzQdoY4jnOg0V8S4=;
 b=gdDw17QMwkQw5P/9yol7uy0L8eVk/m6BAH77FXg2wPF7dGz6rSup9ulA9eNZpKiEX2
 paPqFad+hOdTQLliQQrWgz0NCF+6LrqPZw7GsAQ2CE64JviV/LAJgJLb3DoO5D5KyyVe
 v/1XoFwRSCRiAgCM+1AIxrLwZVPph6OUy/Wgv17GqcluEtcW/Ls24Fl7lRpi6K/cKe5g
 431HP9K9pwYFrGeqZZoL97ZIBlHaD3DtexbNzN7iOSEb8wu/HSZIElF23z1I1a/XgyX+
 zsG62ELEYZAO/Mc9ukkySM6dgcvmMr+tVFwlpVJGEIaJfkw5Fpru4jhZfd2r3tAhS3I+
 G0ew==
X-Gm-Message-State: AFqh2kqOuiZsyWmi+kFxtofr+Ui5YwdEagD1ShQpTzTWbaRoY/3nmpg7
 560SAfm4IYF4r+PHT26O/B2MntSzclEtpi7TYUFfi4IhWsDoTD+HjXad9Fj23VN4bABnNEQK8/2
 R21sf0wKNLdcYZkg=
X-Received: by 2002:a05:6102:3d96:b0:3b1:3b81:1279 with SMTP id
 h22-20020a0561023d9600b003b13b811279mr4544136vsv.21.1671812546625; 
 Fri, 23 Dec 2022 08:22:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu73wH64tf5aTZQ5AmldwkbIfYVH7A7Ckqkd4lAbZ9kqON9weYCz8AV4kESyeLPTUU8K4Js5A==
X-Received: by 2002:a05:6102:3d96:b0:3b1:3b81:1279 with SMTP id
 h22-20020a0561023d9600b003b13b811279mr4544118vsv.21.1671812546333; 
 Fri, 23 Dec 2022 08:22:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca.
 [70.31.26.132]) by smtp.gmail.com with ESMTPSA id
 133-20020a37088b000000b006bb2cd2f6d1sm2425904qki.127.2022.12.23.08.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 08:22:25 -0800 (PST)
Date: Fri, 23 Dec 2022 11:22:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Message-ID: <Y6XVwMXooIIQJZms@x1n>
References: <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
 <Y4jBMkNEFqUA7edN@x1n>
 <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
 <Y458YMavxao9XSwL@x1n>
 <CACGkMEut82E-c_w_0MUPOwYDLkcM+mt127dbs3bkhATDSr6JQg@mail.gmail.com>
 <Y49Kcr4ivGGZ2hhF@x1n>
 <CACGkMEtgZY_2CHQwivuyMp+C=uJ7+Vom3WrDYqZesMonWKtd4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEtgZY_2CHQwivuyMp+C=uJ7+Vom3WrDYqZesMonWKtd4A@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Dec 23, 2022 at 04:02:29PM +0800, Jason Wang wrote:
> On Tue, Dec 6, 2022 at 9:58 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Dec 06, 2022 at 11:18:03AM +0800, Jason Wang wrote:
> > > On Tue, Dec 6, 2022 at 7:19 AM Peter Xu <peterx@redhat.com> wrote:
> > > >
> > > > Jason,
> > > >
> > > > On Mon, Dec 05, 2022 at 12:12:04PM +0800, Jason Wang wrote:
> > > > > I'm fine to go without iova-tree. Would you mind to post patches for
> > > > > fix? I can test and include it in this series then.
> > > >
> > > > One sample patch attached, only compile tested.
> > >
> > > I don't see any direct connection between the attached patch and the
> > > intel-iommu?
> >
> > Sorry!  Wrong tree dumped...  Trying again.
> 
> The HWADDR breaks memory_region_notify_iommu_one():
> 
> qemu-system-x86_64: ../softmmu/memory.c:1991:
> memory_region_notify_iommu_one: Assertion `entry->iova >=
> notifier->start && entry_end <= notifier->end' failed.
> 
> I wonder if we need either:
> 
> 1) remove the assert

I vote for this one.  Not only removing the assertion, we should probably
crop the range too just like dev-iotlb unmaps?

Thanks,

> 
> or
> 
> 2) introduce a new memory_region_notify_unmap_all() to unmap from
> notifier->start to notifier->end.

-- 
Peter Xu


