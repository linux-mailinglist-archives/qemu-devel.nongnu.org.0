Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD693C6C1E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 10:41:39 +0200 (CEST)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Dz0-0006Qe-S6
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 04:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3Dy4-0005go-8G
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:40:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:49492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1m3Dy1-0006aV-KS
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 04:40:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="231924238"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="231924238"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 01:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="654075281"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2021 01:40:25 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 01:40:24 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 13 Jul 2021 16:40:22 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.010;
 Tue, 13 Jul 2021 16:40:21 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKtAp0+A
Date: Tue, 13 Jul 2021 08:40:21 +0000
Message-ID: <9a8224c9a02b4d9395f6581b24deaa54@intel.com>
References: <20210630200805.280905-1-peterx@redhat.com>
In-Reply-To: <20210630200805.280905-1-peterx@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.88; envelope-from=wei.w.wang@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras
 Soares Passos <lsoaresp@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, July 1, 2021 4:08 AM, Peter Xu wrote:
> Taking the mutex every time for each dirty bit to clear is too slow, espe=
cially we'll
> take/release even if the dirty bit is cleared.  So far it's only used to =
sync with
> special cases with qemu_guest_free_page_hint() against migration thread,
> nothing really that serious yet.  Let's move the lock to be upper.
>=20
> There're two callers of migration_bitmap_clear_dirty().
>=20
> For migration, move it into ram_save_iterate().  With the help of MAX_WAI=
T
> logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, =
so taking
> the lock once there at the entry.  It also means any call sites to
> qemu_guest_free_page_hint() can be delayed; but it should be very rare, o=
nly
> during migration, and I don't see a problem with it.
>=20
> For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to t=
ake
> that lock even when calling ramblock_sync_dirty_bitmap(), where another
> example is migration_bitmap_sync() who took it right.  So let the mutex c=
over
> both the
> ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.
>=20
> It's even possible to drop the lock so we use atomic operations upon rb->=
bmap
> and the variable migration_dirty_pages.  I didn't do it just to still be =
safe, also
> not predictable whether the frequent atomic ops could bring overhead too =
e.g.
> on huge vms when it happens very often.  When that really comes, we can
> keep a local counter and periodically call atomic ops.  Keep it simple fo=
r now.
>=20
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

FWIW
Reviewed-by: Wei Wang <wei.w.wang@intel.com>

If no one could help do a regression test of free page hint, please documen=
t something like this in the patch:
Locking at the coarser granularity is possible to minimize the improvement =
brought by free page hints, but seems not causing critical issues.
We will let users of free page hints to report back any requirement and com=
e up with a better solution later.

Best,
Wei



