Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D224424DC73
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:03:35 +0200 (CEST)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9ARy-0002rO-GC
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bfoster@redhat.com>)
 id 1k9AR9-0002Lp-5O
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:02:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25514
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bfoster@redhat.com>)
 id 1k9AR6-0005Di-1b
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598029358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwS+kAPJtqLdpQqI1czJvEdFIatqGdZKK7fsajHisA0=;
 b=gMth1jkeraWlQnmaLvLtVyUW6NTc+hAV+VNZgeoraESfnm4QGaSFBS5EROiZzMYQvgtBP5
 zG2obFY+eLJOjbQhsWjA3zzrhFq3vFsUxZMa/czm9k9oLHajPVLcDQCdHajt0NrvW1syI2
 TefZRgg6DwJWfs80NigqecLwecAy0AY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-SF_3072jPQajpoxq_FW_aQ-1; Fri, 21 Aug 2020 13:02:36 -0400
X-MC-Unique: SF_3072jPQajpoxq_FW_aQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D178AEF63;
 Fri, 21 Aug 2020 17:02:35 +0000 (UTC)
Received: from bfoster (ovpn-112-11.rdu2.redhat.com [10.10.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34FEE5D9CC;
 Fri, 21 Aug 2020 17:02:33 +0000 (UTC)
Date: Fri, 21 Aug 2020 13:02:32 -0400
From: Brian Foster <bfoster@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH 0/1] qcow2: Skip copy-on-write when allocating a zero
 cluster
Message-ID: <20200821170232.GA220086@bfoster>
References: <w518sedz3td.fsf@maestria.local.igalia.com>
 <20200817155307.GS11402@linux.fritz.box>
 <w51pn7memr7.fsf@maestria.local.igalia.com>
 <20200819150711.GE10272@linux.fritz.box>
 <20200819175300.GA141399@bfoster>
 <w51v9hdultt.fsf@maestria.local.igalia.com>
 <20200820215811.GC7941@dread.disaster.area>
 <20200821110506.GB212879@bfoster>
 <w51364gjkcj.fsf@maestria.local.igalia.com>
 <w51zh6oi4en.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w51zh6oi4en.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=205.139.110.120; envelope-from=bfoster@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Dave Chinner <david@fromorbit.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, linux-xfs@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 02:12:32PM +0200, Alberto Garcia wrote:
> On Fri 21 Aug 2020 01:42:52 PM CEST, Alberto Garcia wrote:
> > On Fri 21 Aug 2020 01:05:06 PM CEST, Brian Foster <bfoster@redhat.com> wrote:
> >>> > 1) off: for every write request QEMU initializes the cluster (64KB)
> >>> >         with fallocate(ZERO_RANGE) and then writes the 4KB of data.
> >>> > 
> >>> > 2) off w/o ZERO_RANGE: QEMU writes the 4KB of data and fills the rest
> >>> >         of the cluster with zeroes.
> >>> > 
> >>> > 3) metadata: all clusters were allocated when the image was created
> >>> >         but they are sparse, QEMU only writes the 4KB of data.
> >>> > 
> >>> > 4) falloc: all clusters were allocated with fallocate() when the image
> >>> >         was created, QEMU only writes 4KB of data.
> >>> > 
> >>> > 5) full: all clusters were allocated by writing zeroes to all of them
> >>> >         when the image was created, QEMU only writes 4KB of data.
> >>> > 
> >>> > As I said in a previous message I'm not familiar with xfs, but the
> >>> > parts that I don't understand are
> >>> > 
> >>> >    - Why is (4) slower than (1)?
> >>> 
> >>> Because fallocate() is a full IO serialisation barrier at the
> >>> filesystem level. If you do:
> >>> 
> >>> fallocate(whole file)
> >>> <IO>
> >>> <IO>
> >>> <IO>
> >>> .....
> >>> 
> >>> The IO can run concurrent and does not serialise against anything in
> >>> the filesysetm except unwritten extent conversions at IO completion
> >>> (see answer to next question!)
> >>> 
> >>> However, if you just use (4) you get:
> >>> 
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>>   ....
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   ....
> >>>   <4k IO completes, converts 4k to written>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>> falloc(64k)
> >>>   <wait for inflight IO to complete>
> >>>   ....
> >>>   <4k IO completes, converts 4k to written>
> >>>   <allocates 64k as unwritten>
> >>> <4k io>
> >>>   ....
> >>> 
> >>
> >> Option 4 is described above as initial file preallocation whereas
> >> option 1 is per 64k cluster prealloc. Prealloc mode mixup aside, Berto
> >> is reporting that the initial file preallocation mode is slower than
> >> the per cluster prealloc mode. Berto, am I following that right?
> 
> After looking more closely at the data I can see that there is a peak of
> ~30K IOPS during the first 5 or 6 seconds and then it suddenly drops to
> ~7K for the rest of the test.
> 
> I was running fio with --ramp_time=5 which ignores the first 5 seconds
> of data in order to let performance settle, but if I remove that I can
> see the effect more clearly. I can observe it with raw files (in 'off'
> and 'prealloc' modes) and qcow2 files in 'prealloc' mode. With qcow2 and
> preallocation=off the performance is stable during the whole test.
> 

That's interesting. I ran your fio command (without --ramp_time and with
--runtime=5m) against a file on XFS (so no qcow2, no zero_range) once
with sparse file with a 64k extent size hint and again with a fully
preallocated 25GB file and I saw similar results in terms of the delta.
This was just against an SSD backed vdisk in my local dev VM, but I saw
~5800 iops for the full preallocation test and ~6200 iops with the
extent size hint.

I do notice an initial iops burst as described for both tests, so I
switched to use a 60s ramp time and 60s runtime. With that longer ramp
up time, I see ~5000 iops with the 64k extent size hint and ~5500 iops
with the full 25GB prealloc. Perhaps the unexpected performance delta
with qcow2 is similarly transient towards the start of the test and the
runtime is short enough that it skews the final results..?

Brian

> Berto
> 


