Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13923C5F42
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:29:57 +0200 (CEST)
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xsa-0007G1-Mu
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xqW-00054l-NZ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:27:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m2xqU-0008SH-N6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46MumOy/Ho5TC7WGZejQeQ5ZClL+V6OnQ55vEMQZe4Q=;
 b=SbmvnRSrTrQfEhLRg+KLiB3h38eKBtqxWXCJlGUCg2+zzXTwXkBvH5HxrolyTOC4jiOn7a
 BTwVDcJFdfCgPKVbxXeiT7fF6Ilmrm4WKMTfhjWSsgKqk+ddNtV67bVg6qFBVgV1ZD3mpe
 0pPD6Gxtd+OjikSj7VA/QsL+qVJfTNI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-8StZDtErMberGPV_BFCo8w-1; Mon, 12 Jul 2021 11:27:44 -0400
X-MC-Unique: 8StZDtErMberGPV_BFCo8w-1
Received: by mail-io1-f69.google.com with SMTP id
 18-20020a5d9c520000b029043af67da217so6343179iof.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=46MumOy/Ho5TC7WGZejQeQ5ZClL+V6OnQ55vEMQZe4Q=;
 b=pjxJ+LsKb47hi5Ohumpj2H9z6gjzTY3t3aBZxnQAGEDOmU5Hnmz9n+hwqUa/FJj/B0
 dvJ5xYq0rQTzlwy6FZ7f5shJBDI+mbwlMVZ+ouYWNl9kRttPWwbYt+huV5O1ww77Yv96
 7f3K0PJpyrTtV9s3mJg06OWeGrRXfD71J25YoK4y2BFYahIVi+jtZ/1TNfaDyj5aq4uv
 pncv7ZBcyzPIl5QuMPcL5Gi3A/4InK7AQHFWD9YabGI2e2zVS57WExvCM7WLOGvXHC0U
 U9S46J8WtEnCM0NhQi0hp+Hox+WR9dhm+P4okE1ifJOCqQ5K9cbM4HpoVRZ7vIshRmUc
 QAnA==
X-Gm-Message-State: AOAM532frcenb83P4ia6J0ky2+wDvpP6PGCbPqEpq9uLRU683EqFKWkl
 aergDMwWcBUcoXUIT5ZA1yARSa24Uik/QSxiQYZKFwM0p/RTABVgJccEM0iih2IN304KV0Qqbll
 8IiUBzM9TzQbBFbY=
X-Received: by 2002:a92:b308:: with SMTP id p8mr34717590ilh.296.1626103663904; 
 Mon, 12 Jul 2021 08:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyTUhK9nUYoUiND7hJY5s1aK+qlktY9SBIbsfiseXdJlY7LB5PnelLrpORw4zuIhOn7BySpQ==
X-Received: by 2002:a92:b308:: with SMTP id p8mr34717575ilh.296.1626103663778; 
 Mon, 12 Jul 2021 08:27:43 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id x13sm8098287ilo.11.2021.07.12.08.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:27:43 -0700 (PDT)
Date: Mon, 12 Jul 2021 17:27:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH 3/6] pc/machine: Perform zero-check for the value of
 -smp dies
Message-ID: <20210712152741.5q64hicmt5pla472@gator>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-4-wangyanan55@huawei.com>
 <20210712150401.is7nxfwewf7taexa@gator>
 <20210712150540.hjgcvmpc2ciplcrj@gator>
MIME-Version: 1.0
In-Reply-To: <20210712150540.hjgcvmpc2ciplcrj@gator>
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

On Mon, Jul 12, 2021 at 05:05:43PM +0200, Andrew Jones wrote:
> On Mon, Jul 12, 2021 at 05:04:04PM +0200, Andrew Jones wrote:
> > On Fri, Jul 02, 2021 at 06:07:36PM +0800, Yanan Wang wrote:
> > > It's possible that dies parameter is explicitly specified as "dies=0"
> > > in the cmdline, if so we will wrongly calculate the other ommited
> > > parameters such as "sockets = maxcpus / (dies * cores * threads);"
> > > with a zeroed dies value.
> > > 
> > > So perform zero-check (default the value to 1 if zeroed) for -smp dies
> > > before using it to calculate other parameters.
> > 
> > OK, dies=0 may make some sense for a user that doesn't want to describe
> > dies.
> > 
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
> But... this is the pc smp parse function, not the general one, so maybe my
> comment from patch 1 should apply here as well, which is, that dies=0
> should be an error rather than silently changed to dies=1.

Also, after reading Daniel's comment on a later patch, I think anything=0
should just be an error, even for the general parser.

Thanks,
drew

> 
> > 
> > > 
> > > Fixes: 1b45842203540 (vl.c: Add -smp, dies=* command line support and update doc)
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >  hw/i386/pc.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > > index a44511c937..93d1f12a49 100644
> > > --- a/hw/i386/pc.c
> > > +++ b/hw/i386/pc.c
> > > @@ -714,12 +714,14 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
> > >  {
> > >      unsigned cpus    = config->has_cpus ? config->cpus : 0;
> > >      unsigned sockets = config->has_sockets ? config->sockets : 0;
> > > -    unsigned dies    = config->has_dies ? config->dies : 1;
> > > +    unsigned dies    = config->has_dies ? config->dies : 0;
> > >      unsigned cores   = config->has_cores ? config->cores : 0;
> > >      unsigned threads = config->has_threads ? config->threads : 0;
> > >      unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
> > >  
> > >      /* compute missing values, prefer sockets over cores over threads */
> > > +    dies = dies > 0 ? dies : 1;
> > > +
> > >      if (cpus == 0 || sockets == 0) {
> > >          cores = cores > 0 ? cores : 1;
> > >          threads = threads > 0 ? threads : 1;
> > > -- 
> > > 2.19.1
> > > 


