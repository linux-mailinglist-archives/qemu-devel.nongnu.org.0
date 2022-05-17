Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC452A7AC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:13:20 +0200 (CEST)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzp0-0002qg-Kj
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nqzkk-00088L-HE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:08:54 -0400
Received: from mail-mw2nam10on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::621]:56096
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1nqzkh-0008Ia-DR
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:08:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmYzRtPKy+3+MahH7Rv4mgdhHqMwDZYt8yqo052c82eTeOWzgeygulm0Eghg1f3fq91TKvRc6UOv2sKbjauKb7gA0q4zg1mDmKulolugNjtMkW96yUnw5V2JPwT1NjbX/+2R+87v/sSFiIB4oZViLsvpCBICi8CnWUohAj0pWhqjP8RX71qYwsMtyVVCFpWz2Zn+qgpDQmI9ObWyyGvrO8eJRV65bqN9hF0OV+n/ZGjqqwfP7GTRIvykkK/EcKhi4yJlZqhrLlsFMngFckSljj8A409w/NTPeRswfrxkV7a6aH1uiv7+EDclnkHDSF2/ZtUIT0WDS3fbvX1uxgrIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=velgOSz5nE8ucrtXxWtNkqzDDPHjpD4+hJqLKOrXmG8=;
 b=iSiKexPkk15IV89kyfe93vBYsIeo8Pd3BmOzx8tWwCNoUaNWE/MAAH3KDh5ss/6lMQ5HN5NXZcrWdhALzmkHwXCieId6V+UltWV+69kz2lwK6Gf2TgYDjcsrbY4mSZegXICrFXAE0rUMrUfzh08OmsT6KwGBEzlyKRRYy0pewNvRKPzy7BnRqkueByB2WfqOk/d+bT47Jr0IEz7xlzDt1QdcYJZDAXfhj9B8uJhq76rXhbrpwLuO5xm1C890+wjACrTlCTe0IRKbDpJcMx9PMcHTDAy37InxtA8YS8jlCD1/zIqnrS/hVd8QEOK5MEOLSvF2TsFeB5mn4nqrNv0mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=velgOSz5nE8ucrtXxWtNkqzDDPHjpD4+hJqLKOrXmG8=;
 b=VldKlwslF9uNXfFun3LliD2LSY7dC4okGJGiYTj07z41Bx+E92gxUyeplD8n8p+6Zq+RLCczo2w9Vp9GGoBY42DTXXANj1rR3PmSLNN32Meb0yUvOCLrpCxW//pgRnmJXDmP/32okbaDPAY8OJxgvfo2RTkSAFMiwzW0PySIrhXgxxEYSHTrCFN8JGp4kZXg8+SomqB9IIyMA0dJXBi5EkkuJeh/xW0K/Ns8p+owMOmo1wKz5Epk2gFzL9HPVvYyqrHr9nBqeqEXdGm4uwtrLrX4sKQxBfAKmSjFid4RnP6saukb3rNAzq96IUuXLZIRDl4zaW3x8wcZTNfpVtyTGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by BY5PR12MB5558.namprd12.prod.outlook.com (2603:10b6:a03:1d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 16:08:45 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::182c:a653:21b2:b351]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::182c:a653:21b2:b351%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 16:08:45 +0000
Date: Tue, 17 May 2022 13:08:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking
 is not supported
Message-ID: <20220517160844.GV1343366@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-5-avihaih@nvidia.com>
 <87h75psowp.fsf@secure.mitica>
 <20220516142200.57003872.alex.williamson@redhat.com>
 <20220516230832.GP1343366@nvidia.com>
 <20220517100045.27a696c9.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517100045.27a696c9.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397e6ee7-dde2-4fd6-d982-08da381f852e
X-MS-TrafficTypeDiagnostic: BY5PR12MB5558:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5558877CE705395EED66EF50C2CE9@BY5PR12MB5558.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJ7QEhzAOJnvw6bdHEDDcoF7EsEe6KKgV+57z9w40eBIJWtiyzPpM+7TEfO93Qmm1DmIw6kx3XCqdaOqClc/0jf+A6CRKylUP7zgSN9PSnbIXcsCgBltAsFrB+UFfTdgtZVn6Sk9gWG5CCUl+LdACD+Uhik1G/e0vCVt4thh64b+/Uh7IYK1b3iBrC7RFncNRa6srBSrUXe4znlg2CZv15CQnZM6GZmU3//ReTuTJo+wtp1TNq8FKRS8DglN+4ltY+vSO6vF0E0+TMYPy7gnCYQHWWF1IL01X80tpUYO9gWf6Wj8W7Vt5eaXhoKjzK36ReZzSSrac9UhLqkn8fwp5qMgP0f1J1Tx3MZKqQolDxKVgbLZMh0IUrKbUxUGf4RyiknZbxGGG2qOpKUUzljU+Tvd4Q78cundihRmSas6pOSANbEsNx6XOeD4dqVyhwGfFPtDYkJ93SOsPt/xxcP2wtcSeLVbWxp0SWi0py0BHgnHD2i7/PrI2v5+W/pV/gbZLcLqIehfMmctvje3rAh+Eu3gurYcwaCSU4aQ7s/2aoBozL0584GJhm0EMiAuVaOLbsV5H9Px3z4x4ur67g192wUDjCZM/EyYulVcITBdHnepH2KLcewidIQC/qu9CMVnRKrBk/XQhfHMUAQFCYFYebbPChxMUK4M0jBueDkplD4GqsSF3Ze/pSajued+4SsJTEOJOPqKkZuQEXe0MQPdCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4181.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6506007)(186003)(1076003)(508600001)(6916009)(54906003)(38100700002)(6486002)(26005)(6512007)(2906002)(66946007)(8676002)(4326008)(66556008)(66476007)(33656002)(2616005)(8936002)(5660300002)(107886003)(316002)(86362001)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DCsLFyaGb52j3k6OcIzTJ6oXnDBmrJXpgGzNN8U2v+VMz2747mutleVoIDAv?=
 =?us-ascii?Q?SdkJu3LZAXYYmQv5azjQn6yjmkoWPfEBOtos8n56eiHg0d0iUsKJ/C+0Rn5Y?=
 =?us-ascii?Q?GXdyQAn3Rd7pys1FJLMkVxsXGVkob0RU6owCvC/Oof4cP5r+5mWMPvzvN+NI?=
 =?us-ascii?Q?8+nBbU7JkoOeS0VruquSPLBKDs4K5g1rQZ2ZXQQPatPYqtXi4Pl/l3yQj4p6?=
 =?us-ascii?Q?hFEE6LtBf6/bGUKPKtrLxVeHA9fSLmlKkLOHoR1welUcudVm6mNBePpf5x7u?=
 =?us-ascii?Q?/Jgjmclgc0nQMvQNOuRBcbVs7/mizqybnFVsBAd3vrcm6Fxec1qBijFeWfYQ?=
 =?us-ascii?Q?yvzs7AAXe0PcMg3C8nt9cCztE6JztFfHu9IdhX0Rn3O3F2pev3cS8hGADxFF?=
 =?us-ascii?Q?mOuhraEilNoJyx+4F3Ke/+/lOwZoM7jtdznM8l3U3frtNWXdjqBrr2M0/nJU?=
 =?us-ascii?Q?oDtVVJq8VFvVQiBpun/kK/307uMEDcOVqSQGM4DnqsKVV1Noe0o2/SirNmSv?=
 =?us-ascii?Q?y9+0vOaaSDUUt1ROPR03IEjjHfUFe4MoiXZ78cVxAdkRIuTTyoMB5SLfTWV6?=
 =?us-ascii?Q?6D/gunjRQiqcyEVAqJBCHc4RIbA5nC5F3bypE0fdmy4CosXCBGD+7a815mK8?=
 =?us-ascii?Q?ruR4BwAfXN95W46wHci272d4ohf0//W0oLm742gAV16BiPR53r2btwFoDOdc?=
 =?us-ascii?Q?eeNoVJnZ6pS/UZpV7bRfl26nKtVfjLs0V8Ag1+25j/8vv5hfd+U1xCgEXJrN?=
 =?us-ascii?Q?yfIzIW7/YOeohVERqXXDi2HAFB3fj45ULdxJy4kRdhG6SytO9E1S043DV3PF?=
 =?us-ascii?Q?So8RDa1UIu7ou1soYeL72tvhoY+az5nAbn6Fg+VhWi4x2ZADHfSV6c8RIh2/?=
 =?us-ascii?Q?wy6kC5Z6ETIj4YE7+w3KBxxrVZGaSseTkIMVhthxDFNgaJT2UTdMZDf1W0HQ?=
 =?us-ascii?Q?d29bp2k91W1LiVYUfUWKQBqst4XhnTVOC+gGNILwJqVwW1VbXgSKkFl09jSd?=
 =?us-ascii?Q?uV9KIATaDKQfW3hFW8HYsotEflhIPlJ/yhveKlHph2Fa8OyMggxK0ROvIt4i?=
 =?us-ascii?Q?HA/kOBU0kpzi20JpTMWsblzGAXDXmN/S2HpkLAJC1eK2hhGLY2TCdpEXfzyw?=
 =?us-ascii?Q?DuYBrhGbLGFSUjYMEdFGVcl1MHEel1cOoNjHbhJOs1VmTy8mJq5fZ80D1glN?=
 =?us-ascii?Q?fu56kkWcFy0kKY9H9LuJ60FqmucznFtNWD68vzCkQrkQ236z6Qkoff3zOGYV?=
 =?us-ascii?Q?k4inzRM031FhNjbyA935aJJC2aYY1GyYgC23pzkOP4LQdmhE+eX0cSNb5arE?=
 =?us-ascii?Q?MytV0NXRE6lpaIGzIGzk7nyj7YGvROb609Dlg5B8aDOMkGkF91hVPW50O3Ol?=
 =?us-ascii?Q?/TAYe2x1/nCyazoD15v5BcP2pVwuNr+PhrQ5ASa9xgFdmae0b9hox8MZUNbD?=
 =?us-ascii?Q?6jPAm//O4REj0/qkI0ubjXBhucOnElmU5UElKAjYFPksZhBjaPpXQ4Ko2V2C?=
 =?us-ascii?Q?gmEbbnl5b1VqgztC1pU/DJjqdybYb0yweXYSf67TZvypdi49wyZqSFZqZ1T8?=
 =?us-ascii?Q?hAiQJxOdBIa12CMtw1sLEGw5GI6b+o2vLFd5W312c61SvM4vyUVocy4wP2CZ?=
 =?us-ascii?Q?o4gwZn8k19zB04H0OLM+MBawCTV9QzbEwVk5v8xtBDwBpIL0CCxl+N9ARUPI?=
 =?us-ascii?Q?MPOaWc0BQ86K28SunEgYkapBFNkM3UdD6wUukRzSJqqA/lqd+nBgQ45xcmgU?=
 =?us-ascii?Q?KpN6maFclw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397e6ee7-dde2-4fd6-d982-08da381f852e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 16:08:45.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GO2EFts35at6LUzpMWSafEOngP8P+XJToB46OeTA2/WSvtaBLXyb6HiB1mBUqPYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5558
Received-SPF: softfail client-ip=2a01:111:f400:7e89::621;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 17, 2022 at 10:00:45AM -0600, Alex Williamson wrote:

> > This is really intended to be a NOP from where things are now, as if
> > you use mlx5 live migration without a patch like this then it causes a
> > botched pre-copy since everything just ends up permanently dirty.
> > 
> > If it makes more sense we could abort the pre-copy too - in the end
> > there will be dirty tracking so I don't know if I'd invest in a big
> > adventure to fully define non-dirty tracking migration.
> 
> How is pre-copy currently "botched" without a patch like this?  If it's
> simply that the pre-copy doesn't converge and the downtime constraints
> don't allow the VM to enter stop-and-copy, that's the expected behavior
> AIUI, and supports backwards compatibility with existing SLAs.

It means it always fails - that certainly isn't working live
migration. There is no point in trying to converge something that we
already know will never converge.

> I'm assuming that by setting this new skip_precopy flag that we're
> forcing the VM to move to stop-and-copy, regardless of any other SLA
> constraints placed on the migration.  

That does seem like a defect in this patch, any SLA constraints should
still all be checked under the assumption all ram is dirty.

> It seems like a better solution would be to expose to management
> tools that the VM contains a device that does not support the
> pre-copy phase so that downtime expectations can be adjusted.

I don't expect this to be a real use case though..

Remember, you asked for this patch when you wanted qemu to have good
behavior when kernel support for legacy dirty tracking is removed
before we merge v2 support.

Thanks,
Jason

