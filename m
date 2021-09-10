Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26090406940
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:45:46 +0200 (CEST)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOd6P-0004Bx-7o
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOd3U-0001aX-NY
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:42:45 -0400
Received: from mail-dm6nam11on2064.outbound.protection.outlook.com
 ([40.107.223.64]:35297 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mOd3P-0004lp-9y
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:42:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYmJzRB3onC2MOFC/RCIiLdT26VGPDfYn5Lsv7v2B5sQiyfqgzjrm5OP696ipfOIZNPo1jMrz1pzACg5FFTUcTcLDX+HvivWN2z5aoFMmHr7nGg02xBqjdps6JPpm/Swsf5s9cUWK6DTT/355rJVROKK2cCX9kRoi1aTUuhzb4AgDTYrmrpXdvKKh6IP+GpxzxixWr+/Y3r8cZaRoqj4KR8QcH7Wb/SVKAmoOQEa8r8xmS6nhFsO2KumAcC+uIvoXSXwaFFYW/PydJhFFP1gUqeX5TfzZFUHOLrB4B1ybxOY8p7Ky+nCRcWs9MoVy3jnlOSBFt1LPCHDyA4SDupwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=IonJeeW1LE7wplMujUg8IWgdkSRpIiTYFWLYFAP/W1Y=;
 b=WJwJKeAF5jPQMVe5ApEz/AHBfn+1TC14JWeyxlh/BCH43ZjOYkrDGCT1RpA7nUlNVS/anlLHN45o7Z8pFx/Al6gYDFS3Ur/BgQIlPuc1RowokVdUqF4n+4e/St2E7QAmKFFOHHzSnfKVlQsR2viNBc51rGTrD6CeurVjuXUe14lA4lZRIqh5Lvw7jee6IF0eX2IkdIUbEmzyTmkTMREytA71P9gZEYR4Ud8Rg3J61JyoNi3FJ0rl6nmm5XbheUWLCQ0sJNhJCSRoobnm+EIuxMAGWftlfUqyzEn/2zb3eYX6E6Nrzij/YnmtHCYszwINY5T3XC4pdZxSLdHc/o2e5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IonJeeW1LE7wplMujUg8IWgdkSRpIiTYFWLYFAP/W1Y=;
 b=EgZc2NSyXwsrSpNY9vpU/O7q4tLpNks/kStDlmUhsUwcR0QacDk0cI8GfZo1aFA4f0TFDvbESsERLAQhpXq+Jfa3yO7hpJ/I/wrPQG0oiWLQyk1BiJQqmcLVD349JJ32EFXu4hk0uVaUalM02bcinUCCFxo4r4AimQTe44/Irck=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2830.namprd12.prod.outlook.com (2603:10b6:805:e0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:42:35 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4478.026; Fri, 10 Sep 2021
 09:42:35 +0000
Date: Fri, 10 Sep 2021 09:42:32 +0000
From: Ashish Kalra <ashish.kalra@amd.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Thomas.Lendacky@amd.com" <Thomas.Lendacky@amd.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "dovmurik@linux.vnet.ibm.com" <dovmurik@linux.vnet.ibm.com>,
 "tobin@ibm.com" <tobin@ibm.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: Re: [PATCH v4 10/14] migration: add support to migrate shared
 regions list
Message-ID: <20210910094232.GC2686@ashkalra_ubuntu_server>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <9236f522e48b67fe7136de7620276f7dc193be37.1628076205.git.ashish.kalra@amd.com>
 <6a48e7c8b6e14933aa0085d12e2c5ff7@intel.com>
 <20210910084740.GA2686@ashkalra_ubuntu_server>
 <be7540ec24274ea0bc2c933281d0a5a9@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be7540ec24274ea0bc2c933281d0a5a9@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: SN7PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:806:121::34) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
Received: from ashkalra_ubuntu_server (165.204.77.1) by
 SN7PR04CA0089.namprd04.prod.outlook.com (2603:10b6:806:121::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 09:42:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ebdb303-6972-47f0-1bb9-08d9743f519b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2830ADAA286BAEF2E8C250CF8ED69@SN6PR12MB2830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uUYFhd6lfDzC/mtIew0ope4/YV/xpCxYJsgwVB58T6ZQjwkEdzClYsaU9MXCqg9w32aUexzfZAO0SaB74tGhhGi19nFbNFrVrG5qMSyRqnpWIi79tufLKEGApR01g+0XT16y4CrgOW+VJu42gEs4ijTuAuk7kvYXyBRcYmNoHsWDg8t/SToc9nfr/BBfTpFzPQrPaz76nr0Mb+hG/ZinD2E8uh11XP3qZNjRyE/qvNiHjR0OmEr/rHOX5lI4WTKRakSQLXS9PFhmdUHYML/zMVRWyc7m3ZyWXI/6sq9Cjh0PFap1en12tk+B2xMKOoFnatocg9mMYBGv1LIU4HOsEiIHE+vcdtVle7SYSddr/BeLWwBOKssp11oFHtEnmS5YRRFAeM3KlrvomwGUJZuvDcWf5OYYRWciF15ileNsGjR8NJlDIQn6ME8rlizeclKz8Rd5EietbgEtXkijlKexpBQeljMKGQExTpQ0L8/t6qalvr+X6eWO3QIJREAABngn7JdfkcNhDRp90YVhNl/jGFgh5HempIx9Kz+yNaQf/2vHKGYqVWiF/F8ijOXFZsePd7ZkyX8XUwd+lYY3S2rekyGccX9wMotZJq7nAM31x4c9nvTLo7WDz32cHSxkz400zssdRk9/Xns9f3f8R+ISURe7Wb5kvjfcVjmz7uqMzX+FWRfh46hhWvZ5RQdqnUzjdz5tGdgvIFJQy7xdbz+8EEObBJndMMZuwc9r8hSbGPXvhUmlEeXTafTsNEJGYxG1407bfRA2iwpMU/bUpaD4A1bJAosj+orHqYNJFhnBa1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(316002)(2906002)(53546011)(83380400001)(8936002)(33656002)(478600001)(5660300002)(66556008)(66476007)(6916009)(38350700002)(38100700002)(186003)(6496006)(66946007)(55016002)(9686003)(54906003)(33716001)(52116002)(1076003)(4326008)(956004)(86362001)(26005)(8676002)(966005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fYZaEndLcnU+pzxj1nHazqyiWtcSyFBrEBv8L8kYRZO+g+ckUIV6zDKjpCyR?=
 =?us-ascii?Q?i3akDxM2RIg7Ym/VjSA6KxRDF9USS/b9XXbr4xorz+YSKQuDlVT2LHxi8y6C?=
 =?us-ascii?Q?4uDYLuoq48X9qHEVfQS28tKJ1BKfhRRYUs+rliMRBRy//oNaQit5jVuox+Pp?=
 =?us-ascii?Q?7kAM8bNa1m/zKQmml0hmi50XWAMEuv5UxymmTxn7DekyxgIxjMAWdYFfZJ1v?=
 =?us-ascii?Q?DDA0es5ODunf/p/f25lh5tLxR8UiEt4LsvCYo46ROShIdjbd6O2Iwc/iVBSi?=
 =?us-ascii?Q?lBrUbys8pksJHqIJkSnvqja7pGuMkLFg8OCEM+z0GQZftkSN8eRJ7t7CQnxA?=
 =?us-ascii?Q?e54D3wAvjh0UkSNvagO9HAggGtwLadEEkkddcrObZVP7vhbmjw747wZ3nddt?=
 =?us-ascii?Q?YxudEn8qJUyca8IiOfN+Fw4SnBxYk8hIIk9WMdgjZVuTkqsgTcqR5x0Rq0XG?=
 =?us-ascii?Q?qujB6HJVmGhys8ZvAI+DchCaKHf8XG1vzZJYvxTX4OAmCZg8wggaX5UR1+At?=
 =?us-ascii?Q?lXqw/r1XiBqBEZwpKlIPRY+w5kOwEAmSXEy6i5n44XJ9Urt7RaB0BfSVtwG3?=
 =?us-ascii?Q?3IS6HmreFHSY/6CTB4oKduPFwqYmqSPSBfQrUGlKJXJCYn/mmXVR260lZlJj?=
 =?us-ascii?Q?0MuZmOCVXhvNy81UaadpqIrACiDL+Fo3dxj0kgqI+/5MchWtjVPSfETooVPX?=
 =?us-ascii?Q?a/jNdj/WKArsqsp7/9ribeLLzjpbsDKwr7QDkV2GLn/utCQtIRNSZ0jns9zd?=
 =?us-ascii?Q?BpWv+uBl7tt9B0myRWX0fP/ucaQKmE6u7Ou7bUD70HSlleD6NivwvPztOVgC?=
 =?us-ascii?Q?+CwrUcQ1doT0O3VBxYKZycbfNOjTu8BudGUb6ZL5aGLWZR/WZCEhrmab+RJW?=
 =?us-ascii?Q?g6r7gvng/QLC+VAgoSpU5yjspH6/b5efNFmKu1icZWJzdwFxToXpzgN0FX+0?=
 =?us-ascii?Q?nBn6u2iOu3Ba9tBM4xk07zGKyRL7aTcnBasHzaHb0a4HPY+edS220CxdRH9V?=
 =?us-ascii?Q?YxHbskB+nF5rmX14ovR9EmIKC775cdgsepTgRvaOhn0IY4cZtz2G3tixsDEi?=
 =?us-ascii?Q?7jAyYsany+zuBM2I/oYg4BhxBt4UVJyZiyyrgNMDI5UkjW4W5vNIv1kXx9cL?=
 =?us-ascii?Q?4tzjTUbS7AVaZwaz4TE1v5X75Nfq9sk3QdG6jaTLEfXQ/skPUMVbBK5pn0Tu?=
 =?us-ascii?Q?9t0EpzDUr0dqivWbaxCkLdeya5TjNMvGccZZpp4gqt8Jq0RWsV3taKLXYNrK?=
 =?us-ascii?Q?iGvoevVYuy+uN0lJU4GDYlzqp5yzaE4l77vNbdiB1hNwGn50sxvs389QFFfn?=
 =?us-ascii?Q?k56c3yfkIL1jmWIbEGZHHp/C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebdb303-6972-47f0-1bb9-08d9743f519b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:42:35.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5p0UEliSt1JAejuCbOJurm8qJ2727tbL0JlBDD+UYsrpEMorh8JWS7zN4de6EN24ftS3iOnZCJMYD0ak20RSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
Received-SPF: softfail client-ip=40.107.223.64;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 09:11:09AM +0000, Wang, Wei W wrote:
> On Friday, September 10, 2021 4:48 PM, Ashish Kalra wrote:
> > On Fri, Sep 10, 2021 at 07:54:10AM +0000, Wang, Wei W wrote:
> > There has been a long discussion on this implementation on KVM mailing list.
> > Tracking shared memory via a list of ranges instead of using bitmap is more
> > optimal. Most of the guest memory will be private and the unencrypted/shared
> > regions are basically ranges/intervals, so easy to implement and maintain using
> > lists.
> 
> OK. At which version did you discuss this or do you have a link? (I didn't find it in v9 KVM patches)
> 

You can follow this email thread:
https://lore.kernel.org/kvm/20201211225542.GA30409@ashkalra_ubuntu_server/

> > A list will consume much less memory than a bitmap.
> > 
> > The bitmap will consume more memory as it will need to be sized as per guest
> > RAM size and will remain sparsely populated due to limited amount of
> > shared/unencrypted guest memory regions.
> 
> I also thought about this. It depends on the guest.
> I think "A list will consume much less memory" is true when we assume most of guest pages are private pages.
> From design perspective, what if guest chooses to have most of its pages being shared?
> Lists might consume much more memory than bitmaps in some cases, I think.
> (Probably I can check your previous discussions first)
> 

This will probably depend on the most common use case and scenario, i
think that most common use case will be a mostly encrypted guest.

Thanks,
Ashish

