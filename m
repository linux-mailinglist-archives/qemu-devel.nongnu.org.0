Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C63B8D36
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:43:44 +0200 (CEST)
Received: from localhost ([::1]:56994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoYB-0008Sr-E9
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lyoXS-0007o6-Fv
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:42:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:29374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1lyoXP-0007T9-5R
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:42:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="188849853"
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="188849853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 21:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; d="scan'208";a="408802627"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 30 Jun 2021 21:42:40 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 30 Jun 2021 21:42:40 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 1 Jul 2021 12:42:38 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.008;
 Thu, 1 Jul 2021 12:42:38 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Peter Xu <peterx@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Topic: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Thread-Index: AQHXbeunvJLboMuimkuCIYxaPrgzEKsth5XA
Date: Thu, 1 Jul 2021 04:42:38 +0000
Message-ID: <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
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
Received-SPF: pass client-ip=192.55.52.151; envelope-from=wei.w.wang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

If free page opt is enabled, 50ms waiting time might be too long for handli=
ng just one hint (via qemu_guest_free_page_hint)?
How about making the lock conditionally?
e.g.
#define QEMU_LOCK_GUARD_COND (lock, cond) {
	if (cond)
		QEMU_LOCK_GUARD(lock);
}
Then in migration_bitmap_clear_dirty:
QEMU_LOCK_GUARD_COND(&rs->bitmap_mutex, rs->fpo_enabled);


Best,
Wei

