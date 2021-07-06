Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4223BDD5B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 20:38:29 +0200 (CEST)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0pxk-0008EX-6j
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 14:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pwf-0007ZX-I8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 14:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m0pwc-0000y3-Jm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 14:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625596636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g2OeyAFVUOqVVcVU6ZXWl8jnATQmbcMXzB8KUkldUL8=;
 b=AikRbkItYCSmbDQjfWonAkI61uW5xMqVC32FmKRxZGZsCs2weY5MgJrJG9G2L+zC924BLA
 qxYVHzoGdVkg7bKdklejgxW7Z/82FzigMKH0wrDvYy45kjWxkBxxwMgHDmu1Y16uQNZtnI
 V/IVhAYGal7z7Z/jgBVaVnjvAnsog9U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-KKMEduUwPPGlbSSUMAHQ7Q-1; Tue, 06 Jul 2021 14:37:13 -0400
X-MC-Unique: KKMEduUwPPGlbSSUMAHQ7Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 a2-20020a05620a0662b02903ad3598ec02so17255155qkh.17
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 11:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g2OeyAFVUOqVVcVU6ZXWl8jnATQmbcMXzB8KUkldUL8=;
 b=EMihvgZZU/9f27uyR4xXs9cf3KPNJj+1kKsmyv7wnMNcjJ7+gu5LRXa6Uy3+gRWFi3
 9obGWA/R23swdj5Ai8eN2XcFhtZRKkkNRth03nCX8+tBfrzbrGFZsDJSeR8yU/OoTQIW
 J7fbDZglIeVvmKIg2S0s5sfQ2KnCHkf1n3WshBsWSD8dsjQpwlVFQ5wPi0n9kh5M8fvV
 HIwxvSQGFplgpNQOeMxOdPmOEywgN+8XyY48L90Po9h3MJtKa+C8iVvd0a/5pqiY+652
 Vm7aUHtg/maXRMvh2n702nlWjrC/0NF+GqQnOwEvu2h0ZEzL0f7QHMuyk8/hZ6TDvPfd
 71nQ==
X-Gm-Message-State: AOAM532U3dEsrTym0bF+qcyxFtAhQDLelZYMxsY3WzXqGVRJX4i4DRNt
 INoGKhpnUNDPsJMH5C/vOdsECr8AGA68tteneyclGxXwrSXcDDAShZVz+UhfhJhXJ46BQPCslxn
 ++liBy2ZxnyKZ3oI=
X-Received: by 2002:ac8:7b58:: with SMTP id m24mr18840171qtu.268.1625596633306; 
 Tue, 06 Jul 2021 11:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxgEesgYQ9lzul0DiLfAPEgjk9U6YVEDlpuIFeh2qILnaHDLpGrtQIM6tLYalpp/obQ7XYUA==
X-Received: by 2002:ac8:7b58:: with SMTP id m24mr18840146qtu.268.1625596633056; 
 Tue, 06 Jul 2021 11:37:13 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id l206sm5272427qke.80.2021.07.06.11.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 11:37:12 -0700 (PDT)
Date: Tue, 6 Jul 2021 14:37:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOSi13An2hTDNDhD@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <20210703183115.17f385f6@gecko.fritz.box>
 <20210704161457.17505f40@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210704161457.17505f40@gecko.fritz.box>
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
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Wang <wei.w.wang@intel.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 04, 2021 at 04:14:57PM +0200, Lukas Straub wrote:
> On Sat, 3 Jul 2021 18:31:15 +0200
> Lukas Straub <lukasstraub2@web.de> wrote:
> 
> > On Wed, 30 Jun 2021 16:08:05 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> > 
> > > Taking the mutex every time for each dirty bit to clear is too slow, especially
> > > we'll take/release even if the dirty bit is cleared.  So far it's only used to
> > > sync with special cases with qemu_guest_free_page_hint() against migration
> > > thread, nothing really that serious yet.  Let's move the lock to be upper.
> > > 
> > > There're two callers of migration_bitmap_clear_dirty().
> > > 
> > > For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
> > > logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so
> > > taking the lock once there at the entry.  It also means any call sites to
> > > qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
> > > during migration, and I don't see a problem with it.
> > > 
> > > For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
> > > that lock even when calling ramblock_sync_dirty_bitmap(), where another example
> > > is migration_bitmap_sync() who took it right.  So let the mutex cover both the
> > > ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.  
> > 
> > Hi,
> > I don't think COLO needs it, colo_flush_ram_cache() only runs on
> > the secondary (incoming) side and AFAIK the bitmap is only set in
> > ram_load_precopy() and they don't run in parallel.
> > 
> > Although I'm not sure what ramblock_sync_dirty_bitmap() does. I guess
> > it's only there to make the rest of the migration code happy?
> 
> To answer myself, it syncs the dirty bitmap of the guest itself with
> the ramblock. Of course not only changed pages on the primary need to
> be overwritten from the cache, but also changed pages on the secondary
> so the ram content exactly matches the primary's.
> 
> Now, I still don't know what would run concurrently there since the
> guest is stopped when colo_flush_ram_cache() runs.

Indeed I know little on COLO so I don't know whether it's needed in practise.
It's just easier to always take the mutex as long as those protected fields are
modified; mutexes always work with single threaded apps anyways.

Or do you prefer me to drop it?  I'll need to rely on your colo knowledge to
know whether it's safe..  I don't think common migration code will be run
during colo, then would qemu_guest_free_page_hint() be called for a colo SVM?
If not, it looks safe to drop the mutex indeed.

Thanks,

-- 
Peter Xu


