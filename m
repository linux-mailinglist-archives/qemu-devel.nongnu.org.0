Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00C69E334
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUNY-0005uA-VW; Tue, 21 Feb 2023 10:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pUUNX-0005sy-BQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:16:27 -0500
Received: from mail-dm6nam04on2053.outbound.protection.outlook.com
 ([40.107.102.53] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1pUUNV-0005gU-J9
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:16:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCCrIKEzPVMzTyctYGUIjye30y5XiOV8KPj8Uutmk+eNnv9mMT2PpxQmv7PmtP0K0eBFZk6aaqzRmy70DumiX9GZd6BexsHFd963AB4E/o7wOcNLrfrb2iKX+nm6VzR19FEGIFme3WoIbpdTWGj2MhnvZ00Ij3EPOgQ7CQgY1UvG+wisae3Hanu5BpYqW9F6PsnV2cFwGd63yX3KqprbIcP37EsD6Ze8A8NfcDWuzELeeNrBZ5jac7K1MzSWokPIbCnlcDCa8cYuDGdKJmgTqRqOtzE7kwU0Krar02uBP3eTQaopY0QjhZKVnchYnMh6hhtPevz9V5HYCM1EITJ7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKbOlJTbD1MCZa62OX6oHGLLPnMsPScz30TINaOi7Mc=;
 b=LHk1TmWxgSfw02poXrRL5n+cEQ7keSCMf8IBjIJuJufvUu19WLP6SaSN/agJHI6lscUGEFSY2ZJqhk6Tclm3HrcXmLlBcy6AxTaL/kawJeSlYc2nPvHVTpMUfByfyVKik5g/4k/jGrUvOYdd3XeTOM/vPVQgRjjjIPQLXW7PNgqFDqv2IYunsX/JHiBeRsy41ZMGrOl5oQcZhOApNJxqJj2bnBpriO+0elpMcavQ77I9xdy2SGhzR7czH8uy4KOifK297DfRDBONaxUWB3P5QcmnMlB30iNep2ABoUnx7ExZCteW7OzXwPWlXXzpoqVAnuN0Lmlg9chu0/6Z4d2lMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKbOlJTbD1MCZa62OX6oHGLLPnMsPScz30TINaOi7Mc=;
 b=YhxxEZh1bgn1mqr9Q+YrsLNpqKt1u2ZI2ujFu8/FB7E8MMnmBKNhA4pjQYPOFsrbVEN3CeLnRYFRI1K6S3j4WUjJjpXcwMkdaNWM78+CBgkiyebSKIfQWGBp4Jv5synfmkG70bwnnjWq+f6XkteOWuCBtNkZ3rO8ZcbmKx98hok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from BN6PR17MB3121.namprd17.prod.outlook.com (2603:10b6:405:7c::19)
 by CH2PR17MB3909.namprd17.prod.outlook.com (2603:10b6:610:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 15:11:20 +0000
Received: from BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660]) by BN6PR17MB3121.namprd17.prod.outlook.com
 ([fe80::d253:1eb3:9347:c660%3]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 15:11:20 +0000
Date: Sat, 18 Feb 2023 04:47:54 -0500
From: Gregory Price <gregory.price@memverge.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-acpi@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/18] CXL RAM and the 'Soft Reserved' => 'System RAM'
 default
Message-ID: <Y/CeykFm6A4vYw7P@memverge.com>
References: <167564534874.847146.5222419648551436750.stgit@dwillia2-xfh.jf.intel.com>
 <Y+vSj8FD6ZaHhfoN@memverge.com>
 <63ebd56e639e9_32d61294f4@dwillia2-xfh.jf.intel.com.notmuch>
 <Y+vag3hg3VRNRUti@memverge.com>
 <20230214211824.00007f91@Huawei.com>
 <Y+wCeSig++c3ACkj@memverge.com> <Y+wC+rPRbAc9rudx@memverge.com>
 <20230215100327.0000728f@Huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215100327.0000728f@Huawei.com>
X-ClientProxiedBy: BL0PR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:207:3d::48) To BN6PR17MB3121.namprd17.prod.outlook.com
 (2603:10b6:405:7c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR17MB3121:EE_|CH2PR17MB3909:EE_
X-MS-Office365-Filtering-Correlation-Id: 0460e43d-f73c-4bbb-5691-08db141de2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWsbnEioOErB82we4lUpQ8mftJSAtB6OnXNbbVZ4gcKBFf9MwjWHExi538DHDra+eLAmlzy1aE1YNVXTId/+xRzQSalJcdKYptxV0YPeiomNzg1FXf8qZuAYniOYinUye2Q7z0omria24c/vxWhbp9djxUboAfJ36KIJ/1adVNZydoKJEWpQVx9mFVBCTWjFxprJ253IIN+Io2KalwHU2PT+P2ggfpoPUoAFM8WMPmo6ulJTDwsvKUyNWD7muCVdpia/rB4FbV9wvfwEu0HU4g5xCE+RBjyOIQgdFP19jGQgfg21oYcZk0RK/DZ1leNNAKFuNV0eZU+eMlrgYibJQRAlmKgCDZ4hNgXKqu+jXx112tEalhWulfhx5dRRnqVBMVt9BGMLAxplJIGVd2IHZVfx1RZ2CIR2OGoAKmkErrVrPKPLcqM3nr94Wemh+1l5WiaArAeVm/tE9sUP2uOSiePeMqgNakUhsov0tOHoDjFhR+Y+QsakJHuUjZssCqiV5JkxdTnHjlnMVePZqicEa49X8HpmkAIk7rul+ksmzQQdRkAJOIZ86bW0QbJvf787mUSF2XDIkj4inQUl8678/T2vDBNFmpbgfIjye4AkftEzc/HgqQ3WG4R90BusTo8LuuMMfTd78tJoYodMgNnCzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR17MB3121.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(346002)(366004)(136003)(396003)(376002)(451199018)(86362001)(36756003)(5660300002)(41300700001)(44832011)(7416002)(2906002)(8936002)(38100700002)(66476007)(66946007)(66556008)(6916009)(478600001)(54906003)(8676002)(6486002)(316002)(186003)(26005)(6512007)(2616005)(4326008)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ipGZxOmzV6A4TT+TF3UsR03yKWYThHItNUSwygX7D2160pRIL9ZOmAFB0lyr?=
 =?us-ascii?Q?AEXv6Pw/2IyAodH3kHAzOnyiOwTn86ig+hA3UEFhoEmZR2TGDtI69syM4uni?=
 =?us-ascii?Q?CG2Mk2w7PR0zDtxib8cGuYPPfvBSfnlwTDWh/cWAczkYQzrnBQimOpp+2SyH?=
 =?us-ascii?Q?k9xHA7Hj/sTDoe4QrzqkEe2tqWUcU+2MY4PbNgvBDvwhISmFOttwD63FNM97?=
 =?us-ascii?Q?75EKlF3ix+lWfBEKNaQZkUT7+PqrqY046L8e86RquCQhJPTQm+j4kU0HhvlF?=
 =?us-ascii?Q?bvggCAOpZC2CuCvOLMdAfkCQ4fAHOLj29CcgA1ZKRj8IMV37lLqbU6zTKWjG?=
 =?us-ascii?Q?Wdf52Ms6SEHqwn0gE+0XRpJfvq6HSo7yS+vy+EjiDGCz+UE3qgiwXPNUz4RS?=
 =?us-ascii?Q?WmpgefYQMImtDU7xr67WC41eUMQHc+jvQOnlapyzgxJso0Vb6MzglyZNa1M5?=
 =?us-ascii?Q?R1mwGkjrK9bQcUo5EqvVCvu32646m3atWtNTMvInfB3MG25hxONlQUndzIS0?=
 =?us-ascii?Q?LYG9iDBOhRiA23a1osAkEdXwlx2V1wDPFbcJOGKJFKuhXVqW/TmPeSjj+ZbB?=
 =?us-ascii?Q?PxsGKEnXUWvmHBCKoLK2QlLSMhc7L8JvU6C5iBaM2tAIKdaAIC8fMi3Bvek6?=
 =?us-ascii?Q?3EtGYRu48pGcjYh70CCKS/Yc00ZrRLuLuPOMV+JDqV0qk2MYRJOl8D9ZRnnB?=
 =?us-ascii?Q?mRw049TrhzRRT93dcdjN3qiBollRcza5CdWlXuNfLWg+krgowXCdiQrMLp3j?=
 =?us-ascii?Q?nLPjDudvjIre/FKABXdDrKiOMUFhprqRCNLW9RlytUeMwtKA/QjBfriuRocA?=
 =?us-ascii?Q?ycvTtCh6SHL31Vig/SVQvnoqgz7DHUPwOBZpoWSOC2Sm0mQtIC8NBloWnvRZ?=
 =?us-ascii?Q?9nENskyS0y25HCoDKiq6t0kYTmv4MXVuW9ziwXkNgTYn70zD2K1wWBCvYLoE?=
 =?us-ascii?Q?EG4vZQ1ItwbinDfNU2c2CSLJ1inRxkvRVaY8RSnkqd4SjqF0ZhLkCOXjHou0?=
 =?us-ascii?Q?QPdRwlmWENZ/ZLAecPR0uy5oK7I/LgmaHglWUs9f0mNQP1x8jc3wovU2svSU?=
 =?us-ascii?Q?lksa1CL5AKo2xFULaUE4PmnMoRbpEjyjVIOaGpntmxpM70HNgCToXD2rkpBd?=
 =?us-ascii?Q?pf6rcQPuROEUAplkfyBvlZEBGhJoN2qjEDf3szVUR+uWai9Yb4sQeKw4bRyS?=
 =?us-ascii?Q?NX5M+fswmIYi14cU0rAxVhV87RRXzOAi5ET9iLbwWCBrYJlKvtLlU4AzNl/K?=
 =?us-ascii?Q?mYDT+egaF9SCUvo8Xhk3x/54+/QoIBIaDRJwaLsnAkrs43mGyAPajtD/6u/M?=
 =?us-ascii?Q?BkTNeBL0dDIWyOS4bIV5ouyeCImezPz8Kmg81xy/b8X/uVlG6sLeRFBKA4Cf?=
 =?us-ascii?Q?NPSyY65jO4UUlaJTODpEvwLBsBsi0wWEnlaTlG3dCqfjiw9A0GKe11CRrqiu?=
 =?us-ascii?Q?VXzStc4WcS+ySEuRIJvhtM8JOlY9KEm3emwDvpw68ucXkezi6djhp/mUxRp8?=
 =?us-ascii?Q?OosBOteG10UZ4KF8fHHqC1MP47ZbmB5LvFStydHxO85033GmM5pQDr2s0evz?=
 =?us-ascii?Q?D5h3TCmRfDc7Z40YZuXHobwQbSRDqBvYd6IiLOROUiXUroHXW42wZshGuxA8?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0460e43d-f73c-4bbb-5691-08db141de2f4
X-MS-Exchange-CrossTenant-AuthSource: BN6PR17MB3121.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 15:11:20.0452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6xf5r9ppeHkWGmlYG0Y324OAwC+D+w2wh1I+bIe7M2+gsafQx7Fo1pskVz8k87flCilY3IdNCP+m/n5K5MZKBR3Vni1Bofe0MaObf5cYuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR17MB3909
Received-SPF: none client-ip=40.107.102.53;
 envelope-from=gregory.price@memverge.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 10:03:27AM +0000, Jonathan Cameron wrote:
> On Tue, 14 Feb 2023 16:54:02 -0500
> Gregory Price <gregory.price@memverge.com> wrote:
> 
> > Just clarifying one thing:  Even with the patch, KVM blows up.
> > Disabling KVM fixes this entirely.  I haven't tested without KVM but
> > with the patch, i will do that now.
> 
> yup.  The patch only fixes TCG so that's expected behavior.
> 
> Fingers crossed on this 'working'.
> 
> I'm open to suggestions on how to work around the problem with KVM
> or indeed allow TCG to cache the instructions (right not it has
> to fetch and emulate each instruction on it's own).
> 
> I can envision how we might do it for KVM with userspace page fault handling
> used to get a fault up to QEMU which can then stitch in a cache
> of the underlying memory as a stage 2 translation to the page (a little
> bit like how post migration copy works) though I've not prototyped
> anything...
> 

Just following up.  With the patch applied and KVM turned off, no crash.
I've been working with this for a while.

We should move the instruction alignment issue into a separate
discussion thread.

