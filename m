Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6E386F51
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:35:02 +0200 (CEST)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liodQ-0004WT-RJ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1liobt-0003s9-4l
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:33:25 -0400
Received: from mga03.intel.com ([134.134.136.65]:59404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1liobq-0005Sv-DZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 21:33:24 -0400
IronPort-SDR: ECuKxaleCebSfGgzxqxEqj85UXzjPAduNKMg28vPPKt35Sq4eb8IqNT0g7JfhR1PYPsP3UMp9e
 LcnG846uZXUQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="200656202"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="200656202"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 18:33:13 -0700
IronPort-SDR: WvVTRhrpWKGrzrMJ+E0pq5cOOAU56ST6jQgAQ23vxKq02by1FjQMwSWR2QcW0DMsIB6MkmR3VN
 yfUn8BsrawPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="626872932"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 17 May 2021 18:33:12 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 18:33:12 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 09:33:10 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Tue, 18 May 2021 09:33:10 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, "Rao, Lei" <lei.rao@intel.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH v6 00/10] Fixed some bugs and optimized some codes for COLO
Thread-Topic: [PATCH v6 00/10] Fixed some bugs and optimized some codes for
 COLO
Thread-Index: AQHXLPJaZ8Ozl5WD6UyFHHEt2RjK06rnyrIAgADj1qA=
Date: Tue, 18 May 2021 01:33:10 +0000
Message-ID: <79a39d11ea124acbab097d17034ab6ff@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
 <20210517214638.7519781b@gecko.fritz.box>
In-Reply-To: <20210517214638.7519781b@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Tuesday, May 18, 2021 3:47 AM
> To: Rao, Lei <lei.rao@intel.com>
> Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com;
> jasowang@redhat.com; quintela@redhat.com; dgilbert@redhat.com;
> pbonzini@redhat.com; qemu-devel@nongnu.org
> Subject: Re: [PATCH v6 00/10] Fixed some bugs and optimized some codes
> for COLO
>=20
> On Thu,  8 Apr 2021 23:20:46 -0400
> leirao <lei.rao@intel.com> wrote:
>=20
> > From: Rao, Lei <lei.rao@intel.com>
> >
> > Changes since v5:
> >         --Replaced g_slice_new calls with g_slice_new0.
> >
> > Changes since v4:
> >         --Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD in
> colo_bitmap_clear_dirty.
> >         --Modify some minor issues about variable definition.
> >         --Add some performance test data in the commit message.
> >
> > Changes since v3:
> >         --Remove cpu_throttle_stop from mig_throttle_counter_reset.
> >
> > Changes since v2:
> >         --Add a function named packet_new_nocopy.
> >         --Continue to optimize the function of colo_flush_ram_cache.
> >
> > Changes since v1:
> >         --Reset the state of the auto-converge counters at every checkp=
oint
> instead of directly disabling.
> >         --Treat the filter_send function returning zero as a normal cas=
e.
> >
> > The series of patches include:
> >         Fixed some bugs of qemu crash.
> >         Optimized some code to reduce the time of checkpoint.
> >         Remove some unnecessary code to improve COLO.
> >
> > Rao, Lei (10):
> >   Remove some duplicate trace code.
> >   Fix the qemu crash when guest shutdown during checkpoint
> >   Optimize the function of filter_send
> >   Remove migrate_set_block_enabled in checkpoint
> >   Add a function named packet_new_nocopy for COLO.
> >   Add the function of colo_compare_cleanup
> >   Reset the auto-converge counter at every checkpoint.
> >   Reduce the PVM stop time during Checkpoint
> >   Add the function of colo_bitmap_clear_dirty
> >   Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()
> >
> >  migration/colo.c      | 10 +++----
> >  migration/migration.c |  4 +++
> >  migration/ram.c       | 83
> +++++++++++++++++++++++++++++++++++++++++++++++++--
> >  migration/ram.h       |  1 +
> >  net/colo-compare.c    | 25 +++++++---------
> >  net/colo-compare.h    |  1 +
> >  net/colo.c            | 25 +++++++++++-----
> >  net/colo.h            |  1 +
> >  net/filter-mirror.c   |  8 ++---
> >  net/filter-rewriter.c |  3 +-
> >  net/net.c             |  4 +++
> >  softmmu/runstate.c    |  1 +
> >  12 files changed, 129 insertions(+), 37 deletions(-)
> >
>=20
> I guess Zhang Chen can already take the network-related patches through h=
is
> tree.

Sure, I will queue the patch 1-6 and 10.
Hi Dave, can you take the patch 7-9? Or do you think it's more convenient t=
o take all series?

Thanks
Chen=20

>=20
> Regards,
> Lukas Straub
>=20
> --


