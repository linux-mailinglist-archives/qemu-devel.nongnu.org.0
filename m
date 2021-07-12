Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F9A3C5EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:09:07 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xYQ-0004ci-4K
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xVD-0008NG-Qz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xVC-0000jD-BL
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626102345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FFMPHrel8seilC8G5dAt8wqJTQO1m9MFcGGbdpm8MnA=;
 b=SR1f0CsCKHY0VF2Vpd5IUqzqy4jivKLvcqLJlAOLCwbjBHTk6fvYeKe/UA6r9hMzKiv3Gt
 zsxIB6PxzOPPvvaBCdkBNjkIEZg9mEuTEKK7EbxvtE1i6AV6UoEvhzdJdjN/6nZ0CuDhh8
 SlIbM1x2CwkHnwsWas/ZpQgeU6a8XGE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-0p8l5bu-PHK1y1HaQwhRbw-1; Mon, 12 Jul 2021 11:05:43 -0400
X-MC-Unique: 0p8l5bu-PHK1y1HaQwhRbw-1
Received: by mail-il1-f199.google.com with SMTP id
 h3-20020a056e0213a3b029020127afb1b0so12207804ilo.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FFMPHrel8seilC8G5dAt8wqJTQO1m9MFcGGbdpm8MnA=;
 b=sqQnFSYy7n49G226OQiFJJFb2i9f010iuL1nXzQiMNnlG5etN0pD95sJo/NfG1OuZ+
 YdVWEwjal1xg0amxxaE2efIDWuymfXUs0K4MuzcTrVDCqWeeXHm/XTADyk/R4FJKgizd
 VQpsimOYSZo5BlIDak4h6M0Z3DfKMBY9KMypGbGemFtJAwpBUbt3lhMv6nUW0RJdka7c
 LzZXrFFS79IfQRAb5ee3RE/zFF9iSANkfOMILj83egwM5zKi+IszXreacZuyGWLQGIQF
 DucnFhgoxqy49w85ctjiKEWjQFzlEbxk0K9CuzQc+7UsxehIHQhkHubrKnB95nNP83zj
 Ew0Q==
X-Gm-Message-State: AOAM532NFSVn7OJpZU0VA+rErhKitNMv/nlko6brSyjwn917zFqBh75X
 X6RpPGB2dx+fZlXFfJreWy3AB36gz5elLGwMT465UN5kYg1HRAGLZzLREZ5/VIodNp2l1S+oNfj
 k1J0ql1iuqs6k+Bg=
X-Received: by 2002:a92:8747:: with SMTP id d7mr723535ilm.173.1626102343383;
 Mon, 12 Jul 2021 08:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3EFAYqgUajoecQPA5xnL5ir9ACdsSZ+MSSDmf/Qo4eFuR36AtcRBm/KAaAyCN6l1/1Owbxg==
X-Received: by 2002:a92:8747:: with SMTP id d7mr723520ilm.173.1626102343253;
 Mon, 12 Jul 2021 08:05:43 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id p19sm8162803iob.7.2021.07.12.08.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:05:42 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:05:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 3/6] pc/machine: Perform zero-check for the value of
 -smp dies
Message-ID: <20210712150540.hjgcvmpc2ciplcrj@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-4-wangyanan55@huawei.com>
 <20210712150401.is7nxfwewf7taexa@gator>
MIME-Version: 1.0
In-Reply-To: <20210712150401.is7nxfwewf7taexa@gator>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 05:04:04PM +0200, Andrew Jones wrote:
> On Fri, Jul 02, 2021 at 06:07:36PM +0800, Yanan Wang wrote:
> > It's possible that dies parameter is explicitly specified as "dies=0"
> > in the cmdline, if so we will wrongly calculate the other ommited
> > parameters such as "sockets = maxcpus / (dies * cores * threads);"
> > with a zeroed dies value.
> > 
> > So perform zero-check (default the value to 1 if zeroed) for -smp dies
> > before using it to calculate other parameters.
> 
> OK, dies=0 may make some sense for a user that doesn't want to describe
> dies.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>

But... this is the pc smp parse function, not the general one, so maybe my
comment from patch 1 should apply here as well, which is, that dies=0
should be an error rather than silently changed to dies=1.

> 
> > 
> > Fixes: 1b45842203540 (vl.c: Add -smp, dies=* command line support and update doc)
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/i386/pc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index a44511c937..93d1f12a49 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -714,12 +714,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
> >  {
> >      unsigned cpus    = config->has_cpus ? config->cpus : 0;
> >      unsigned sockets = config->has_sockets ? config->sockets : 0;
> > -    unsigned dies    = config->has_dies ? config->dies : 1;
> > +    unsigned dies    = config->has_dies ? config->dies : 0;
> >      unsigned cores   = config->has_cores ? config->cores : 0;
> >      unsigned threads = config->has_threads ? config->threads : 0;
> >      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> >  
> >      /* compute missing values, prefer sockets over cores over threads */
> > +    dies = dies > 0 ? dies : 1;
> > +
> >      if (cpus == 0 || sockets == 0) {
> >          cores = cores > 0 ? cores : 1;
> >          threads = threads > 0 ? threads : 1;
> > -- 
> > 2.19.1
> > 


