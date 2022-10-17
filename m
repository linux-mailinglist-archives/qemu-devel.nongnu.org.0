Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA4E60052E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 04:19:33 +0200 (CEST)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okFj2-0004Qk-G3
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 22:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okFh7-0001Ug-70
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:17:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:5710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okFh3-00076z-SO
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 22:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665973049; x=1697509049;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/NdmAgCeXU0OkpgJYXyWMCFdjmKqCgxPQMGpn30qsZo=;
 b=jA8jZGaMlS5yaAgnRYDTuDUpGqcwwvMzMs3cLmTK7NpGn1HIQbxKBGbt
 +5wx67yqVW3rHswLJH9FVk43s4dW1Y0YHsKVqkc98FBYdr3HyJqt7QzRf
 yVaonjLB5b8DwEVjD0ouIngWjtpadxjH8YBMTpDUdfxoKkOXw5YG4rJF8
 Vqc0/A9CnSk/xRrG2QtpYkd7INgWnmzm2vhhiIKu0lYLtBL9B4/QhosZ2
 HwFgPkmLluitmJefITgrX+1smp81IkyfMdI70OU7OY/NCkh1YvJyW8vHA
 T37PWp4esN8h8JzpzUTUlax1amzr4UsxgN0CZpWir7LAxSqS97jvnRiz4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="306766770"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="306766770"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2022 19:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="691177470"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="691177470"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2022 19:17:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 16 Oct 2022 19:17:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sun, 16 Oct 2022 19:17:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sun, 16 Oct 2022 19:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzAdAzE2zffjs2hAhsdxYfkDbvJ2Z2zlBX68YG5QpZo3vWXylCSB0n2f72xy4gc+xi77jI8fbWg/47mTGmVZeCgReurltZLxY/A/0Vz52+yrPYq5zlcWaDGmMsjn0w4tzd3uwgNkZfBsRVpynWCeFzuCOrhsFg54/F5T5nn90vgndYkvorgHyOp8aSUbWJVf6mHFSkiAefhA29dbvg7Xe+JZ47wxk1ieiJX6UJwPtg1xBQzak/+c9nrf9eHRUECEd8lacIrqmynxbHgUXWgu6OPGNDtagccH39Y0D8U8yHyiUmnl3HXtWeEXUpRN+z+pyw00FWxoNB79gPbP2tj1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eAqHRw+bB/FXNUHvcXTzOEpZ7ii1Mwhhp/g57jlr00=;
 b=UyZRXFKSveYU1ACmclxTQt13tLYTzGgvTm6VELUqRaBMJVQDf4SJM4iRrEz16ufATco+k16pguO4VkwvA2ztvKG7W7kC3YUOO8gSfM0PSZGdCYs6vjIfDEfobS4J0GQza7RCEVQD1BbB0MlcvBaX0Lui3S89SOh5V9aG7fC72g58EcRDiF3fqFIHg02MJWAYMYxAWhCUgNQaCGZtEbT3YBRMavDpuvzXIYVV9SInC4u4clHxt9kKj6F+u6C0gwRDjYfPPJcoBL6IBvPj5G5mFEkg0gyB4WYSv/xMV7e6o4NIWxnnRZHRGwLaBM6AfK2lSA6JkoUuchY+AJIE0cOpWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by DS7PR11MB6014.namprd11.prod.outlook.com
 (2603:10b6:8:73::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Mon, 17 Oct
 2022 02:17:19 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::b173:e9a1:a680:4740%12]) with mapi id 15.20.5723.033; Mon, 17 Oct
 2022 02:17:19 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "quintela@redhat.com"
 <quintela@redhat.com>
Subject: RE: [PATCH] migration: Fix a potential guest memory corruption
Thread-Topic: [PATCH] migration: Fix a potential guest memory corruption
Thread-Index: AQHY3WFxbNAjs/ghWEOj/oidm+U6iq4R15Aw
Date: Mon, 17 Oct 2022 02:17:19 +0000
Message-ID: <MWHPR1101MB21106FA9CFC027E30A3B515092299@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220919093237.2219892-1-zhenzhong.duan@intel.com>
 <Y0VOBwuMrdMwSUo+@work-vm>
In-Reply-To: <Y0VOBwuMrdMwSUo+@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1101MB2110:EE_|DS7PR11MB6014:EE_
x-ms-office365-filtering-correlation-id: 3ef33a05-cdd4-4d33-0d14-08daafe5b7d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRvQ+ISX7+Fm1hguGlkUsLJdMYtBKf845q//ZkD4wiIL1qrsh8ArgeBwOcthl6HLQ+HDljqHapnbHnunGY3QtvicTloFO99ar4kEsRDTIWtrcMkurz1Khp61njijovKveGXjBxE/8k5/ZDwqvdq5nhWpaq4B+5RyOYox9C9Oxa7h/U7pqP+mv925VfnB2tg7fcOwrSrsICTqzoMPcdBAtLKejN3Y/Xc2DzXpAJQmhwMbAmyxu1wajmevVqcakIySltvqQakKDDHoqU0YKq9MdvdCGJiFDw5jSD4WUobGMGPZSIzD+PaTQ6IS71N1lnS6RFPzOXV4gFOcDRthwmkoF7kafUCJxM1KgmO38sDwg+XMYBTt17QseL7lR+7zQeGyXHu5d8B3gRdSsehQpiXowIfhYsN662T31vefvyaVkG2TI6iFTcvegqCPj+tOQDT6y5wTWSVOQdWqaoQqCsyP6mq0+D6VHhd/KFmIJyQ5nK+RB3SmBGAeTParylEaJl9DaEp8L20Kiv0Xiq0Jf45FTd/Wa0w4IfeEhqfSOGjvlcJhKWdLqopZqKCjgQ0JkSk54SpihsyI/9wOZGR1mv/rNpVH+nId7hFrokL7oqq6QF/oPjZm0OIp7iREHQeixeuIP1pUNiU+s/TPqQgnqJggYW7GAb9SKniuurO9UH3cjS2ai4aiNd+Q+ko/Mwx2dOKWPfxd8oqM7gcVRUcOEzVXp2R8dSRpkyILhv3MXBkhNNsIugf8sckUMXOc1UTkz11qBje2eizfrYpB8m/yzS4QnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199015)(38100700002)(8936002)(5660300002)(52536014)(122000001)(82960400001)(4326008)(9686003)(7696005)(6506007)(26005)(55016003)(33656002)(64756008)(76116006)(8676002)(66946007)(66476007)(66556008)(66446008)(83380400001)(316002)(6916009)(54906003)(41300700001)(478600001)(71200400001)(86362001)(2906002)(186003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G2ouqDjzHKhpkMcz1hylEZLjIGnXfB225ImNqxMIqf9cSVHYeAJ7ySsXrMtO?=
 =?us-ascii?Q?ujCs/n6Qrk+Me355jUXWkvXmG6BVplBclSfZll08J5AN+IQf5BdEX1NeNP4T?=
 =?us-ascii?Q?xSB/bKyUgPgci+hQ5Y0k+8ceD248J3LC2b0vFPD+9aruMo/if6EcoE+0zWez?=
 =?us-ascii?Q?++h8E9GxUHVLn86fXOqgGVXJnylFtsuATioKSFbBm1pzjEM6kO1/oeP6a6Pi?=
 =?us-ascii?Q?c2cw1hf9gI2FBTQdKRqlfbHj+kxCgv+9xypK4lDPcBXgcIbEXGeJMJUDHsMD?=
 =?us-ascii?Q?hRsLvMHcUbVMdH2lHIDYo7wQN1cWTkxRk5KY7mkH+ZfjEjnqMLlImxyLN3sa?=
 =?us-ascii?Q?0NkQW7e74t9I3BYuow3O6jE7SKq15r+HxiLB4ZoK/AQHcE2xVVR6XIXarqsX?=
 =?us-ascii?Q?BDubnSfinoQxkKBKZ5Qcfh5oAsgX6p/6DveiZNmPN7zGtHMf5syH1IdJLxGJ?=
 =?us-ascii?Q?Y89eebwIE56lXyqIJ6hMcI8EK+1w1H138m+GNmASdBfbRYE6n1kMfVmpO5B6?=
 =?us-ascii?Q?tYW9Y4jEl3nEejiONqgE6KmiB6XsXvHyHhMPFHcrcL3JgSwW7pYh4MegxZfw?=
 =?us-ascii?Q?xlf1R00VeXCKucnloz3w/DEKspBGwy7Scs2yt7Uzks2PSNXUbWwewDvQXVu9?=
 =?us-ascii?Q?1gUFX4jPqCEkKunUfj6tY5jHKOMjSO7YNgdIAWGtJAULvDUyQBjYg0dLRlx+?=
 =?us-ascii?Q?ZeSdZIFiL131RvPn+DyVrgLVVrAX7UzmcfUAXt5B9llhLgWzFbXgTWfNmEhX?=
 =?us-ascii?Q?lU3+ERyl7LGOCEHmo+HHDNvcDavSd68eeBl4HjIpLMKsqvCjj7tV2Ra9W53s?=
 =?us-ascii?Q?/yvmQslMoxelZk8NnSTqQDI6qmja2BNLyL6OPBSB7+APYoi3a0CilbVI6z8R?=
 =?us-ascii?Q?qdsrOOabDtok3MRBNAOFxjtnbeVSnONc1EDMbcuWd9PH041n0fc4EkUau9e9?=
 =?us-ascii?Q?FSWADft9KkcQvhkyzmz51EncuTO8yQyeHr7gEAhEFJba5Vi9basyfTRvAjFF?=
 =?us-ascii?Q?UdL3oI7J+1neTUWx8TE77YZAWKZc7kLKfGkEtPxcVNO4o7kPOFbJXuSoIZS4?=
 =?us-ascii?Q?iIdqOFlrTOEEB9v4uJLBd3sprX+S30qqSJzSVlMG65qqMlS4gVytW2wzYge7?=
 =?us-ascii?Q?0R7niD9ajNu8Qle5RCt9LZm0jC7X6qf+rx6o9E6vaC8ZR6OAjZjyrJ3dbUz8?=
 =?us-ascii?Q?qZ1w1YRIwLcDtOYqGDcS62WAJRgay8fBj2ELOMMlqR1JGtLraT1HH9VknZT5?=
 =?us-ascii?Q?4WkQiBwUDMKncGRuB5sQdkbH8bTuHxKfPo8pUD3pf0wDHqxBPkxthIHDtJUO?=
 =?us-ascii?Q?OYY8oKU4AYs2u9WPVU67BQSXIw8ioPa336zsVhQGme+UKOvuWQLD9zTHeeES?=
 =?us-ascii?Q?g6PKY/ZewGUKzX9O93/a6QzooZ2aLgh9GFdSa5NxDUqVb+4534mcp3Ozq60l?=
 =?us-ascii?Q?KnB4g8peiCqlKDtpxGBJc0swkSMa8YOECt5SGcIzeagkhrA/+4DKQNM7z2pX?=
 =?us-ascii?Q?AlfNKBVzkUsFPqpBH+KeJ/XvgiGydkY5ivlA9+J5TtRdiVR2Mjf08I9i9P08?=
 =?us-ascii?Q?lkCPIB6p4SJ2QmrqGD8JUCfF9kTsbyP0taWTSOaN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef33a05-cdd4-4d33-0d14-08daafe5b7d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 02:17:19.2704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sv7Hm4TJRw1jnAvnOFMUeSIYrgJ5ph6c2owYFriRG5Ru3frthfbfXvIIgUQ8zf6I3Fyu8W/u9YZuUGlBX+C1ppfswg2wL+cxQKOTYI3fyCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=zhenzhong.duan@intel.com; helo=mga09.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



>-----Original Message-----
>From: Dr. David Alan Gilbert <dgilbert@redhat.com>
>Sent: Tuesday, October 11, 2022 7:06 PM
>To: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Cc: qemu-devel@nongnu.org; quintela@redhat.com
>Subject: Re: [PATCH] migration: Fix a potential guest memory corruption
>
>* Zhenzhong Duan (zhenzhong.duan@intel.com) wrote:
>
>Hi,
Hi,
Sorry for late response. Just back from vacation.

>
>> Imagine a rare case, after a dirty page is sent to compression
>> threads's ring, dirty bitmap sync trigger right away and mark the same
>> page dirty again and sent. Then the new page may be overwriten by
>> stale page in compression threads's ring in the destination.
>
>Yes, I think we had a similar problem in multifd.
Multifd flush operation multifd_send_sync_main() is called in each memory i=
teration
which is more aggressive than in compression. I think not an issue in multi=
fd?

>
>> So we need to ensure there is only one copy of the same dirty page
>> either by flushing the ring after every bitmap sync or avoiding
>> processing same dirty page continuously.
>>
>> I choose the 2nd which avoids the time consuming flush operation.
>
>I'm not sure this guarantees it; it makes it much less likely but if only =
a few
>pages are dirtied and you have lots of threads, I think the same thing cou=
ld
>still happy.
I didn't get it, imagine there are dirty page "A B C D E F G" in current RA=
MBLOCK.
1. Page "A B C D" are sent to compression thread.
2. dirty page sync triggers, update dirty map to "A B D E F G"
3. Page D is checked and sent to compression thread again, so there may be =
two copy of page D in compression thread, corruption!
4. Page "E F G" are sent to compression thread.
5. flush operation triggered at end of current RAMBLOCK.
6. In next iteration, page "A B" are sent.

After patch:
1. Page "A B C D" are sent to compression thread.
2. dirty page sync triggers, update dirty map to " A B D E F G"
3. Page after page D are checked and sent to compression thread which are P=
age "E F G".
5. flush operation triggered at end of current RAMBLOCK, ensures page D flu=
shed.
6. In next iteration, page "A B D" are sent.

Thanks
Zhenzhong
>
>I think you're going to need to flush the ring after each sync.
>
>Dave
>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> ---
>>  migration/ram.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c index
>> dc1de9ddbc68..67b2035586bd 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1551,7 +1551,7 @@ static bool find_dirty_block(RAMState *rs,
>PageSearchStatus *pss, bool *again)
>>      pss->postcopy_requested =3D false;
>>      pss->postcopy_target_channel =3D RAM_CHANNEL_PRECOPY;
>>
>> -    pss->page =3D migration_bitmap_find_dirty(rs, pss->block, pss->page=
);
>> +    pss->page =3D migration_bitmap_find_dirty(rs, pss->block, pss->page
>> + + 1);
>>      if (pss->complete_round && pss->block =3D=3D rs->last_seen_block &&
>>          pss->page >=3D rs->last_page) {
>>          /*
>> @@ -1564,7 +1564,7 @@ static bool find_dirty_block(RAMState *rs,
>PageSearchStatus *pss, bool *again)
>>      if (!offset_in_ramblock(pss->block,
>>                              ((ram_addr_t)pss->page) << TARGET_PAGE_BITS=
)) {
>>          /* Didn't find anything in this RAM Block */
>> -        pss->page =3D 0;
>> +        pss->page =3D -1;
>>          pss->block =3D QLIST_NEXT_RCU(pss->block, next);
>>          if (!pss->block) {
>>              /*
>> @@ -2694,7 +2694,7 @@ static void ram_state_reset(RAMState *rs)  {
>>      rs->last_seen_block =3D NULL;
>>      rs->last_sent_block =3D NULL;
>> -    rs->last_page =3D 0;
>> +    rs->last_page =3D -1;
>>      rs->last_version =3D ram_list.version;
>>      rs->xbzrle_enabled =3D false;
>>      postcopy_preempt_reset(rs);
>> @@ -2889,7 +2889,7 @@ void
>ram_postcopy_send_discard_bitmap(MigrationState *ms)
>>      /* Easiest way to make sure we don't resume in the middle of a host=
-page
>*/
>>      rs->last_seen_block =3D NULL;
>>      rs->last_sent_block =3D NULL;
>> -    rs->last_page =3D 0;
>> +    rs->last_page =3D -1;
>>
>>      postcopy_each_ram_send_discard(ms);
>>
>> --
>> 2.25.1
>>
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


