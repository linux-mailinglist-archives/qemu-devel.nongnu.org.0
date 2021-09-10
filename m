Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101340692E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:37:53 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcym-0000CB-Ae
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mOcxn-0007Lh-1Q
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:36:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:28406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mOcxk-00081E-PS
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:36:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="208268525"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="208268525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 02:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="694715064"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2021 02:36:43 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 02:36:43 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 17:36:41 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 10 Sep 2021 17:36:41 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Subject: RE: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering and
 handling of MSR_KVM_MIGRATION_CONTROL.
Thread-Topic: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering
 and handling of MSR_KVM_MIGRATION_CONTROL.
Thread-Index: AQHXiSjPALimUABevkmUGKAVuEWD1qudGp0Q//+VXgCAAIaAEA==
Date: Fri, 10 Sep 2021 09:36:41 +0000
Message-ID: <55f5f499084b483f8217bc0f0a8049bc@intel.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <67935c3fd5f29a2ba9d67a91255276d3b9ccc99b.1628076205.git.ashish.kalra@amd.com>
 <c09f985d7a0741a7ab278b2f4bd4c346@intel.com>
 <20210910091406.GB2686@ashkalra_ubuntu_server>
In-Reply-To: <20210910091406.GB2686@ashkalra_ubuntu_server>
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
Received-SPF: pass client-ip=134.134.136.20; envelope-from=wei.w.wang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "tobin@ibm.com" <tobin@ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, September 10, 2021 5:14 PM, Ashish Kalra wrote:
> > It seems this is enabled/disabled by the guest, which means that the gu=
est
> can always refuse to be migrated?
> >
>=20
> Yes.
>=20
> Are there any specific concerns/issues with that ?

It's kind of wired if everybody rejects to migrate from the guest
but they ticked the option "agree to be migrated" when they buy the guest
(e.g. at a discounted price).

In general, I think the migration decision should be made by the management=
 s/w, not the migratable guest.

Best,
Wei

