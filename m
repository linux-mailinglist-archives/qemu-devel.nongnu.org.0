Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCC3C73BC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:01:19 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KqT-0004RQ-Vw
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3Koa-0003jI-Ox
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:59:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m3KoY-0001aY-AI
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626191956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1TtydL4aDmzsNx8moNybospMfkfRWqKTGBgZ0ln3vAQ=;
 b=AGI/5oCTrFQKAIRIJIS/jiiswTCGlFw9PhqagJxo3kt7RIw0DD8baJ9ey7MaC3oIjuAEC3
 Wg9rwfY46OEcBBc3GEkuRWClu3wIuDOhwJVKfgLmDOVXmRM32G6RDJX7DPW1/bLmkpHBHs
 QVVBx2PJekPlvdMspbBTkkWkYxT64zU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-nD5M-ELVOruf3T6TK_w_Ag-1; Tue, 13 Jul 2021 11:59:15 -0400
X-MC-Unique: nD5M-ELVOruf3T6TK_w_Ag-1
Received: by mail-qk1-f200.google.com with SMTP id
 o14-20020a05620a0d4eb02903a5eee61155so182018qkl.9
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1TtydL4aDmzsNx8moNybospMfkfRWqKTGBgZ0ln3vAQ=;
 b=shwUdDNB/S/0Mdwx3DCsfySS3SegP15Kc6zb8+1sK+a82R4RB+PuozFeJIajBUtpqb
 tMYHrOgMdl0YLoRJAnyCAsb45VCIiYjpnAgrqD/dgSeUM0bchOEdZrjiTlgq5YRUOXWp
 1zlcQCoBoIM4x7nSfnrvG7IrGsfifEC34X4N+XWFF3gD2/b9lt0EPzPZSojLB6J2jh8H
 9l0HFVxW5u2hSOg7BqQEnbTRE49AuWMB/6R+NMvwgU/FDjTyIrkeqeDsvH0XL5eEniZZ
 MEYiWK88/dA71GBlMetjtGaAJ7VBy13LLa2iZnxY/lhfXGz7hYjJyRyBJadb5seOlk3V
 v1Lg==
X-Gm-Message-State: AOAM5334Yp99BZM9phWmbCVr/gQjK1dNZHa22xsHci/Fd+TbKvDLN/DI
 CCjbtz5YHoqklkx6esIMQgMpPjf9UUa0vTKkrx6bTAnoAJxhRPhQ8zv1p+j4HG2hFCaUsTjbc8+
 pze7A/z+JuuTeaf8=
X-Received: by 2002:a0c:eece:: with SMTP id h14mr5647527qvs.12.1626191954725; 
 Tue, 13 Jul 2021 08:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4nShnH2GnAbF/cOXJtqy/u1g1eLzgv/cp84WMHudE7bZ09THkz5tQ0uHdHcFb4v6P37ZJEA==
X-Received: by 2002:a0c:eece:: with SMTP id h14mr5647508qvs.12.1626191954462; 
 Tue, 13 Jul 2021 08:59:14 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c16sm8052731qka.122.2021.07.13.08.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:59:13 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:59:12 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YO24UM1oWQqLMtvZ@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
MIME-Version: 1.0
In-Reply-To: <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Tue, Jul 13, 2021 at 08:40:21AM +0000, Wang, Wei W wrote:
> On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
> > Taking the mutex every time for each dirty bit to clear is too slow, especially we'll
> > take/release even if the dirty bit is cleared.  So far it's only used to sync with
> > special cases with qemu_guest_free_page_hint() against migration thread,
> > nothing really that serious yet.  Let's move the lock to be upper.
> > 
> > There're two callers of migration_bitmap_clear_dirty().
> > 
> > For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
> > logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so taking
> > the lock once there at the entry.  It also means any call sites to
> > qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
> > during migration, and I don't see a problem with it.
> > 
> > For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
> > that lock even when calling ramblock_sync_dirty_bitmap(), where another
> > example is migration_bitmap_sync() who took it right.  So let the mutex cover
> > both the
> > ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
> > 
> > It's even possible to drop the lock so we use atomic operations upon rb->bmap
> > and the variable migration_dirty_pages.  I didn't do it just to still be safe, also
> > not predictable whether the frequent atomic ops could bring overhead too e.g.
> > on huge vms when it happens very often.  When that really comes, we can
> > keep a local counter and periodically call atomic ops.  Keep it simple for now.
> > 
> > Cc: Wei Wang <wei.w.wang@intel.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Juan Quintela <quintela@redhat.com>
> > Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> FWIW
> Reviewed-by: Wei Wang <wei.w.wang@intel.com>

Thanks, Wei.

> 
> If no one could help do a regression test of free page hint, please document something like this in the patch:
> Locking at the coarser granularity is possible to minimize the improvement brought by free page hints, but seems not causing critical issues.
> We will let users of free page hints to report back any requirement and come up with a better solution later.

Didn't get a chance to document it as it's in a pull now; but as long as you're
okay with no-per-page lock (which I still don't agree with), I can follow this up.

Are below parameters enough for me to enable free-page-hint?

     -object iothread,id=io1 \
     -device virtio-balloon,free-page-hint=on,iothread=io1 \

I tried to verify it's running by tracing inside guest with kprobe
report_free_page_func() but it didn't really trigger.  Guest has kernel
5.11.12-300.fc34.x86_64, should be fairly new to have that supported.  Do you
know what I'm missing?

P.S. This also reminded me that, maybe we want an entry in qemu-options.hx for
balloon device, as it has lots of options, some of them may not be easy to be
setup right.

-- 
Peter Xu


