Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A43C1960
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:48:04 +0200 (CEST)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Z47-0005u4-3Y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1YUH-000476-Ec
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1YUC-0002kz-Op
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625767854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w6xujGtwd3eYHhFHchHvFcAfoeqdRNMJBvV1v4K91XE=;
 b=Op2FD2+8T5p50QJF69DA5ZkLz6z5049KX5vcyUCWPSrHWja432qKLGrozmqjocZwkq++1t
 z6HDInCtJD5q99hAldHl+IY3SZYNXrcv2ZhNzPy6y8TMMvHJyeo1Yv3mCyW+gbj8GMEbbK
 J6saqpNBuottTBzP0/fJ5fxS2+ucSyE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-iKROknyoN6Wn73uQmf-QUw-1; Thu, 08 Jul 2021 14:10:53 -0400
X-MC-Unique: iKROknyoN6Wn73uQmf-QUw-1
Received: by mail-qv1-f70.google.com with SMTP id
 u40-20020a0cb9280000b0290290c3a9f6f1so4584466qvf.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w6xujGtwd3eYHhFHchHvFcAfoeqdRNMJBvV1v4K91XE=;
 b=Gj+51vWNtklxYYof7L8ETevQ154fsSVOdK8PlPNPega0xih0Y++eNm+cSMMG1mjXE4
 VrpOOS2nh7M3spd6+VwdDfxHOfmJFnHjUuZ8zM4A3rF5QZIPMeUiDPpKct4GFZHVeB0H
 mJKhp20jYROtouJ4GNc6waVMMM6Owd0Shdv4BunVDV3q/jlnYACXbiziAKffJ4Zd+ZCn
 ddOOPd91bAUHzbKGzr6Dg+pP2VC9LscA5Uy0+z3399w84Ml/WwA8alMkJRYomSUsF4BS
 5FILK7ADqylVwfle7rag8JoDHGVxQL/B3zim2embg1YVWRNHzvv+13vr6wyPERtExZKi
 Rukg==
X-Gm-Message-State: AOAM530+wuwA7FRW5aY8YvGjGRIENeN6bs1+nIGkUK/IuQVRWzDzieBy
 jWnVZmxkYMMw6CwGigLntBaLt3XvZTnarEUEzVRG0Ug5k4dkI2FgP91j35jkgqIEd5kTEMp6fSn
 Klw+lygc2NhFlVKM=
X-Received: by 2002:a05:620a:13fc:: with SMTP id
 h28mr8519126qkl.188.1625767852733; 
 Thu, 08 Jul 2021 11:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwECjVK/+beYhHKRLw0DgDBQFDVLGPkaSnJXiSqma1/VCNEJObh+6S1EwiJzWMrZ5UXK/V2vA==
X-Received: by 2002:a05:620a:13fc:: with SMTP id
 h28mr8519109qkl.188.1625767852465; 
 Thu, 08 Jul 2021 11:10:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l14sm1261962qtj.26.2021.07.08.11.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:10:51 -0700 (PDT)
Date: Thu, 8 Jul 2021 14:10:50 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOc/qmwMK1XJmfoG@t490s>
References: <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <YOSXGpEB323VWepM@t490s>
 <bf763c28d0254cafbdfb7f7485106ae3@intel.com>
 <YOXcUNG3CaR43yrV@t490s>
 <8f6c3a0fdc624c41800314b6a786cd7f@intel.com>
MIME-Version: 1.0
In-Reply-To: <8f6c3a0fdc624c41800314b6a786cd7f@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:55:23AM +0000, Wang, Wei W wrote:
> On Thursday, July 8, 2021 12:55 AM, Peter Xu wrote:
> > On Wed, Jul 07, 2021 at 08:34:50AM +0000, Wang, Wei W wrote:
> > > On Wednesday, July 7, 2021 1:47 AM, Peter Xu wrote:
> > > > On Sat, Jul 03, 2021 at 02:53:27AM +0000, Wang, Wei W wrote:
> > > > > +       do {
> > > > > +            page_to_clear = start + (i++ <<
> > > > > + block->clear_bmap_shift);
> > > >
> > > > Why "i" needs to be shifted?
> > >
> > > Just move to the next clear chunk, no?
> > > For example, (1 << 18) pages chunk (i.e. 1GB).
> > 
> > But migration_clear_memory_region_dirty_bitmap() has done the shifting?
> > 
> 
> Please see this example: start=0, npages = 2 * (1 <<18), i.e. we have 2 chunks of pages to clear, and start from 0.
> First chunk: from 0 to (1 <<18);
> Second chunk: from (1 << 18) to 2*(1<<18).
> 
> To clear the second chunk, we need to pass (start + "1 << 18") to migration_clear_memory_region_dirty_bitmap(),
> and clear_bmap_test_and_clear() there will do ">>18" to transform it into the id of clear_bitmap, which is 1.

I see what you meant, thanks; however I still think it's wrong.

+       do {
+            page_to_clear = start + (i++ << block->clear_bmap_shift);
+            migration_clear_memory_region_dirty_bitmap(ram_state,
+                                                       block,
+                                                       page_to_clear);
+       } while (i <= npages >> block->clear_bmap_shift);.

Consider start=1G-1M, npages=2M, this code will only clear log for the 1st 1G
chunk, while we need to clear both the 1st and 2nd 1G chunk.

If we want to go this route, I think a helper would be great to clear-log for a
range of memory too.

Thanks,

-- 
Peter Xu


