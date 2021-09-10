Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39524068EB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:13:14 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcav-000790-9j
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mOcZH-0006T0-0B
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:11:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:31567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mOcZD-00032J-P5
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:11:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="243355134"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="243355134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 02:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480099031"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2021 02:11:19 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 02:11:14 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 10 Sep 2021 17:11:10 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 10 Sep 2021 17:11:09 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Ashish Kalra <ashish.kalra@amd.com>
Subject: RE: [PATCH v4 10/14] migration: add support to migrate shared regions
 list
Thread-Topic: [PATCH v4 10/14] migration: add support to migrate shared
 regions list
Thread-Index: AQHXiSixYzJlWQ0zGE+pIA+UAsFsgKt42gHAgCPOlwCAAIhTgA==
Date: Fri, 10 Sep 2021 09:11:09 +0000
Message-ID: <be7540ec24274ea0bc2c933281d0a5a9@intel.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
 <6a48e7c8b6e14933aa0085d12e2c5ff7@intel.com>
 <20210910084740.GA2686@ashkalra_ubuntu_server>
In-Reply-To: <20210910084740.GA2686@ashkalra_ubuntu_server>
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

On Friday, September 10, 2021 4:48 PM, Ashish Kalra wrote:
> On Fri, Sep 10, 2021 at 07:54:10AM +0000, Wang, Wei W wrote:
> There has been a long discussion on this implementation on KVM mailing li=
st.
> Tracking shared memory via a list of ranges instead of using bitmap is mo=
re
> optimal. Most of the guest memory will be private and the unencrypted/sha=
red
> regions are basically ranges/intervals, so easy to implement and maintain=
 using
> lists.

OK. At which version did you discuss this or do you have a link? (I didn't =
find it in v9 KVM patches)

> A list will consume much less memory than a bitmap.
>=20
> The bitmap will consume more memory as it will need to be sized as per gu=
est
> RAM size and will remain sparsely populated due to limited amount of
> shared/unencrypted guest memory regions.

I also thought about this. It depends on the guest.
I think "A list will consume much less memory" is true when we assume most =
of guest pages are private pages.
From design perspective, what if guest chooses to have most of its pages be=
ing shared?
Lists might consume much more memory than bitmaps in some cases, I think.
(Probably I can check your previous discussions first)

Best,
Wei

