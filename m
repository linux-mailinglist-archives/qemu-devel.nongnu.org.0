Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E270C3D42D2
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 00:21:01 +0200 (CEST)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m73XQ-0008Mu-QP
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 18:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73WA-0007gr-Hk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73W8-0002tO-A7
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627078779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c124M8BTnQQYvZckXLTZ9axGbH9li65kvr1RL4kJyRg=;
 b=KQUFe00CJeWsg78L4kc3M1MyxDCDBT+SDmLm22EQGm9FCAz+6CzeKYorg6RgMRjg5AGBqr
 RwgC8z5h5z8zfz0zNNqSl3ObksiM1dXH3atCJnmIAT46cM4hCdrjWVRFwA2PrFlPcJisFF
 WU5uWy+hRA5GmlhuRjLplyFriptJcsw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-OANSFev9MsSfK1BnSPNjGw-1; Fri, 23 Jul 2021 18:19:38 -0400
X-MC-Unique: OANSFev9MsSfK1BnSPNjGw-1
Received: by mail-qk1-f198.google.com with SMTP id
 p123-20020a378d810000b02903ad5730c883so2142595qkd.22
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 15:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c124M8BTnQQYvZckXLTZ9axGbH9li65kvr1RL4kJyRg=;
 b=HFNSIH8ydtBluwdOx94UmchxmoArbj4bMCTR0u/GDfR347AXz1abySb7u7YJsB2mOE
 rb/o0WF3PSItrUOjsD4cTrgZbU/tbWf1yFzczKiWNC9Mmdmb+y57BMFhgQGA+tjnoS5s
 gu4JQid+AHeCTIr6SUgWYW61T2fWYA5+qTI1Q79BCMG9ZZhZFAbSV9Czt5RlXOhpOfM7
 BS8vxoq6qzpexECawSJJDza6DD/QuUNy2oUEaAYctomUJWJDuOTZ+1jVel92lezGiXwG
 sGwWIQp7RRfXcZuNni7++4c3g4beZXN17GTsvGf2nXd+MAe4rAweb4Oym9No2+wcdQw7
 igVg==
X-Gm-Message-State: AOAM532+BflYSEz4m2NMUsAvNcz+Np1Wrb7+Bl1ehOLfabpF3kjVr+PG
 /z2fYA0d0hDn/WA1OvevE1jUTiqw68QQwQaR+YnJfDz9cTCGjQBjc0Hg0LcD5PxUFYApFjmak/V
 DEPTSIkkwOE0XAvo=
X-Received: by 2002:a37:ad0a:: with SMTP id f10mr7061079qkm.284.1627078777656; 
 Fri, 23 Jul 2021 15:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznPWIJkInfz3AklLqfshs8nFAZD06Pfz7hKe3xMLz6e0P579In2JO271ihUCeaeri2W7hssQ==
X-Received: by 2002:a37:ad0a:: with SMTP id f10mr7061055qkm.284.1627078777443; 
 Fri, 23 Jul 2021 15:19:37 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d79sm10524891qke.45.2021.07.23.15.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:19:36 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:19:35 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YPtAd+JqfNeQqGib@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 08:41:40PM +0200, David Hildenbrand wrote:
> On 23.07.21 18:12, Peter Xu wrote:
> > On Thu, Jul 22, 2021 at 01:43:41PM +0200, David Hildenbrand wrote:
> > > > > a) In precopy code, always clearing all dirty bits from the bitmap that
> > > > >      correspond to discarded range, whenever we update the dirty bitmap. This
> > > > >      results in logically unplugged memory to never get migrated.
> > > > 
> > > > Have you seen cases where discarded areas are being marked as dirty?
> > > > That suggests something somewhere is writing to them and shouldn't be.
> > > 
> > > I have due to sub-optimal clear_bmap handling to be sorted out by
> > > 
> > > https://lkml.kernel.org/r/20210722083055.23352-1-wei.w.wang@intel.com
> > > 
> > > Whereby the issue is rather that initially dirty bits don't get cleared in
> > > lower layers and keep popping up as dirty.
> > > 
> > > The issue with postcopy recovery code setting discarded ranges dirty in
> > > the dirty bitmap, I did not try reproducing. But from looking at the
> > > code, it's pretty clear that it would happen.
> > > 
> > > Apart from that, nothing should dirty that memory. Of course,
> > > malicious guests could trigger it for now, in which case we wouldn't catch it
> > > and migrate such pages with postcopy, because the final bitmap sync in
> > > ram_postcopy_send_discard_bitmap() is performed without calling notifiers
> > > right now.
> > 
> > I have the same concern with Dave: does it mean that we don't need to touch at
> > least ramblock_sync_dirty_bitmap in patch 3?
> 
> Yes, see the comment in patch #3:
> 
> "
> Note: If discarded ranges span complete clear_bmap chunks, we'll never
> clear the corresponding bits from clear_bmap and consequently never call
> memory_region_clear_dirty_bitmap on the affected regions. While this is
> perfectly fine, we're still synchronizing the bitmap of discarded ranges,
> for example, in
> ramblock_sync_dirty_bitmap()->cpu_physical_memory_sync_dirty_bitmap()
> but also during memory_global_dirty_log_sync().
> 
> In the future, it might make sense to never even synchronize the dirty log
> of these ranges, for example in KVM code, skipping discarded ranges
> completely.
> "
> 
> The KVM path might be even more interesting (with !dirty ring IIRC).
> 
> So that might certainly be worth looking into if we find it to be a real
> performance problem.

OK; hmm then I feel like what's missing is we didn't have the dirty bmap and
the clear map synced - say, what if we do memory_region_clear_dirty_bitmap()
when dropping the virtio-mem unplugged ranges too?

If disgarded ranges are static during migration, the clear dirty log should
happen once for them at bitmap init time.  Then IIUC when sync we don't need to
worry about unplugged memory anymore.

> 
> > 
> > Doing that for bitmap init and postcopy recovery looks right.
> > 
> > One other trivial comment is instead of touching up ram_dirty_bitmap_reload(),
> > IMHO it's simpler to set all 1's to disgarded memories on dst receivedmap;
> > imagine multiple postcopy recovery happened, then with that we walk the disgard
> > memory list only once for each migration.  Not a big deal, though.
> 
> Right, but I decided to reuse
> ramblock_dirty_bitmap_exclude_discarded_pages() such that I can avoid yet
> another helper.

Yeah, that's okay.

Thanks,

-- 
Peter Xu


