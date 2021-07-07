Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26343BEC7F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:45:31 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Afz-0001St-0f
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Aeg-0000oJ-RV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Aee-0005dK-Ss
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625676248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BS4ZEgWMUrMZHr2+avt3Rf1Xr5lgyorppDAMaUlYszc=;
 b=DBZOpaWh/jB4MI3Izv/1oxAVOiCw+NJ+I2IFLa8dPK3ZQ/Ldi0BZzhavM6wTR2a2cmkK1A
 jMl+yTxPcgU+JZ98qM+kvdJA9b1mOLK3mNX4JmW0CVUlOBk7pXA6F+4E4F7oetLl27SeEN
 7pWF78J2QnYpci0cQ6WHrqxo6BtnzSE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-kLPzdqnqONiUAeD7nAShZQ-1; Wed, 07 Jul 2021 12:44:07 -0400
X-MC-Unique: kLPzdqnqONiUAeD7nAShZQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 f10-20020a05620a15aab02903b3210e44dcso1943884qkk.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 09:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BS4ZEgWMUrMZHr2+avt3Rf1Xr5lgyorppDAMaUlYszc=;
 b=hBEC9YGqQzV1bh2s4fT4KT9FBviBonn3NnkjPGq7s3RHG9LB71QcBBahXYSckTzoui
 77HJwOZBlyfO4FnRsHi4JOl3kHoBa+0ZsizbmDLkS7HbGtbq3b8xbW2WXpZP6YGE7+ur
 7ZE/LoHOLeH8YY6/42e3Alo22hzrcUObQS4dsTrn5+Jqo83AU5KDHqRDC2I204JFH2w3
 Zt9A2EVjCPkdm38PMooclSpuYK8jT7R1VHL4WeejCdWCLhX4ofMGlTgZwOl+OJx3Fub3
 Yck/nIoItxMB3K4UVwhznCJGrWVdDUed3EIdCpGeyRpL2AqVvlwZNZ+hdX49Byq5nFGm
 STAg==
X-Gm-Message-State: AOAM53012iipa9153qgg9bwNcOzAtlaWmwt9oahaU+1mcRxclR8jQN47
 OdBN4wqJ34zimILyhrtvT0Id5MxFfHSBLXSKGQHPbGr0vWTFeZR8UhMAQSu0KrJJ/aMeZbjPhRT
 sIFL0slqQ48FZt9k=
X-Received: by 2002:a05:6214:19e5:: with SMTP id
 q5mr17721755qvc.57.1625676247029; 
 Wed, 07 Jul 2021 09:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUybTNZywh/c0F72NMbKNXxyNPqu3mDjfI9d4KUbiagT5+mXJtLlFukVtsnCkWoIXstSks0A==
X-Received: by 2002:a05:6214:19e5:: with SMTP id
 q5mr17721741qvc.57.1625676246850; 
 Wed, 07 Jul 2021 09:44:06 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l190sm6722207qkc.120.2021.07.07.09.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 09:44:06 -0700 (PDT)
Date: Wed, 7 Jul 2021 12:44:05 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOXZ1fzH+qXGJLs1@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <27cb8a0141fa493a8d4bb6bb918e8a82@intel.com>
 <YOSaDzCd4ZmcRQHl@t490s>
 <2eb1ccd7105d4823898ea68a614d16f9@intel.com>
MIME-Version: 1.0
In-Reply-To: <2eb1ccd7105d4823898ea68a614d16f9@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 08:33:21AM +0000, Wang, Wei W wrote:
> On Wednesday, July 7, 2021 2:00 AM, Peter Xu wrote:
> > On Fri, Jul 02, 2021 at 02:29:41AM +0000, Wang, Wei W wrote:
> > > With that, if free page opt is off, the mutex is skipped, isn't it?
> > 
> > Yes, but when free page is on, it'll check once per page.  As I mentioned I still
> > don't think it's the right thing to do.
> 
> With free page opt on, if the migration thread waits for lock acquire on a page, it actually means that it is trying to skip the transfer of a page.
> For example, waiting for the lock takes 100ns, then the skip of sending a page saves back 1000ns, then overall we saved 900ns per page (i.e. pay less and earn more).

The overhead we measured are purely for taking the lock, without sleeping.  The
case you mentioned happens very rare, while the cpu cycles to take the lock
(even if it's a cmpxchg) happens constantly for every guest page.

> 
> > 
> > We encountered this problem when migrating a 3tb vm and the mutex spins and
> > eats tons of cpu resources.  It shouldn't happen with/without balloon, imho.
> 
> I think we should compare the overall migration time.

In reality, we've already applied this patch with the 3tb migration test and it
allows us to start migrate the 3tb vm with some light workload, while we can't
do so without this patch.  I don't know whether balloon is enabled or not,
but.. It means, if virtio balloon is enabled, we can't migrate either even if
we make it a conditional lock, becaust the guest is using 2tb+ memory so there
aren't a lot free pages.

> 
> > 
> > Not to mention the hard migration issues are mostly with non-idle guest, in that
> > case having the balloon in the guest will be disastrous from this pov since it'll start
> > to take mutex for each page, while balloon would hardly report anything valid
> > since most guest pages are being used.
> 
> If no pages are reported, migration thread wouldn't wait on the lock then.

Yes I think this is the place I didn't make myself clear.  It's not about
sleeping, it's about the cmpxchg being expensive already when the vm is huge.

> 
> To conclude: to decide whether the per page lock hurts the performance considering that the lock in some sense actually prevents the migration thread from sending free pages which it shouldn't, we need to compare the overall migration time.
> (previous data could be found here:https://patchwork.kernel.org/project/kvm/cover/1535333539-32420-1-git-send-email-wei.w.wang@intel.com/, I think the situation should be the same for either 8GB or 3TB guest, in terms of the overall migration time comparison) 

We can't compare migration time if it can't even converge, isn't it? :) The
mutex is too expensive there so this patch already start to help it converge.

Again, I understand you're worried the patch could make balloon less efficient
for some use cases.  I think we can take the lock less than 50ms, but as I said
it multiple times.. I still don't think it's good to take it per-page; I still
don't believe we need that granularity.  Or please justify why per-page locking
is necessary.

Thanks,

-- 
Peter Xu


