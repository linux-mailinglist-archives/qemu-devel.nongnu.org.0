Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1306A760E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:18:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTpw-00037i-CX; Wed, 01 Mar 2023 16:18:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pXTps-0002wL-1X
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:18:04 -0500
Received: from mail-co1nam11on2045.outbound.protection.outlook.com
 ([40.107.220.45] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pXTpq-0003M9-01
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:18:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx/mDWACFct37QT2PIoJQZnu44wO4IDgGg7BGYargzlI4w1Z/qxTme7hNwOMUzB0VVQT+JJ8llEn2ZWVp72oEF2OdGkW/Hx8nYER88MrC6MTZwWlxhBAk68X6ta1b7CtUA+YZlc82RmP+Sit/261lA4O+/kig/69UdlcHsxiIm9lButMrmrV6pOpruf3l8etIInVMW6ZYLvfyDGGKD6Tbcalk7+CNosw2kUbBTtc1B7TxEbUjasD7U75yDqfQDLPDlukgLnSdSTCF01DiusOExEx6a24Kc3rT4klXOJIyCa0XsVv9MEitWCTUn0aWpug8iuwYNOqTLsLoqW51Ib9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqK5zXqBx3kN8lL8hX57l+ibIACH3W6/9wNRbEvkfys=;
 b=HnUkcxrbtP6RuzW97Pz1k2fqeWUqtV1d6lBHdZqfWgWeP81AHJaRA7L0IVqRiz6/QMWEUdxLYyro4wqivc4Pp+3VGMp4AaGzDHAdVsuJzb4xlbOKrijhsnvjHsYDRZekiiN8bq4+WyTtPAh28B6paDWepZ9ufiSle55Stu8epZE7SculQTMRQI1BZEglU7a2vClynxfhDMBAZR2S5FD8LFFZRM4SYx2HpMix2WZuopNrzaZmjSXqAgcYj86HlTalr4MWeMA59xxgw8X6iHAFDNHVGwJYlIidmf2JZNHWs0D+2NZbJQN2l2uioVCd5vtGiCTXYhT121yX/743nXuTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqK5zXqBx3kN8lL8hX57l+ibIACH3W6/9wNRbEvkfys=;
 b=ltkOY0csmk+sdKlq/Tloqe4ffYPFpgo5cdf6FKeCSg0iM8fCzFa4agcyfTZF5tpXVfTtOy4JOC5ikXiUdDTi/PZ/5UhAHWdy8ChrU67G6gkzPJBeQWCOd44Ht9TvlTGPvWXK8iU0kXfh87NVNU3Oc2gVLR1PFH6mvxnnUpFPosBK9Cb5ljlH+s+X12SnefaoSQJCnT+HycdfhP6AJrs3pgoNpuDaWHWuNulG14vtQVPbinETOiE4JmwkQircjcGvA2AnO67IcXKs7Ly83u487plKDiG+8eEDJMkxBgHYvtTwxk3bB9C39CF8LZ/sWdKeNp9VuiQRDYqp4zybdnCuqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Wed, 1 Mar
 2023 21:12:54 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6134.029; Wed, 1 Mar 2023
 21:12:54 +0000
Date: Wed, 1 Mar 2023 17:12:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <Y/+/0z/MEkKuLNgk@nvidia.com>
References: <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
 <20230227104308.14077d8a.alex.williamson@redhat.com>
 <b142b581-65c3-285d-bc68-fabc8d5ab0b7@nvidia.com>
 <20230301125559.613c85e9.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301125559.613c85e9.alex.williamson@redhat.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3426e5-2078-4eae-28d2-08db1a99b95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QotY31m7ktQKu6r2DhX0F1vzeRdLWNtoJjBXH9VLEzWJiA6Lw1neZEgsPU1K5NeY7acjnBylDY+I/5PzAeQoMlNVuXl74g6OnQuY/noq9ENMA9WamwnIV6iDs/hJXMRmIgUvbI07QPK0z/V2bMIkAcXM9SsJbmc4SEnePyDeLI7c6tpbY8HPlOHBWIEg+J0hhu50R1kDDoc2BwAAXQfUSXHOq6iNG7R7gYoTgjwbazuS9FjMA4bMm0bL6Qbdtit+Ig/2oH/vGusCyGOitDklrFb9aPMpnkqhJSBTVq1LPUAX8F+EOEByzuxpU0A2qicY0upaUS+hMoGmU5mrgjNW1t7+B+izbGo37etpNu0nzlI1X8MkgqrlWdbMj3H7dG1lLTkd10HBfyyl0bmZLErCvFgKytP5sSGa8OSTXkpZu7kgUMaW5uyX+nDEE95nHJfwSFvAAaYp8TIf2KRlsz0sVibEPLNOHT/hTQb4q5xHWY3nf58PgqerWqpbCr3fpYHYDAXZs31WdMvx6RiAfcHLIdQXH0A6bD8hH1BwiR2EO7sT4McIbTKUHBJvTkXIUpI8yZS6EfYuO2GfbIx0aNhL4t1G2lNGqpLTVAGEAzp9e/4YqAf81EAjxlxGq59uLYFK2MW27n1CgHRLZRCzZr0TMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199018)(478600001)(66556008)(66476007)(4326008)(41300700001)(8936002)(8676002)(36756003)(86362001)(38100700002)(66946007)(6666004)(26005)(2616005)(6512007)(6506007)(186003)(6916009)(4744005)(6486002)(5660300002)(2906002)(54906003)(316002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w/5K0WgPRXmq2RsYnYPMoS0IRacmvqfTAecfyZG6jnFnOSOwq6YGKEx47/cA?=
 =?us-ascii?Q?eXk0cVheUyuothIQhO3NoyUP2Fa5KjpUyt7vpjKhipxmalGilrO5ep4Jx24k?=
 =?us-ascii?Q?OVRCzTYGInlTT6NY7N0zEGev0fAR1otHw+ZOz0i4fymYMBgSNwcd+CZjCgn2?=
 =?us-ascii?Q?Ca+768SOr/FugQEoZZ8j0DSMCd51t34KVH6l69rFF1GpX8zq3qjge/ziKWoy?=
 =?us-ascii?Q?ZDueS12sJWV0MUGuPXr2lFHLTplkgyBsM/U3D9GnrWVDaUnM7J/aO9uXoCFQ?=
 =?us-ascii?Q?flbLP1xWP3PEmq192i3jYs4B+LoJdv5LoBBfWEBaOHrGaqsR2lKcJgT+UgBg?=
 =?us-ascii?Q?odiKDwEdd9HaB/sGodA8Zgq6Ml+Uay6TEIx0MyILvblkngIUnyCOCwLAz8hY?=
 =?us-ascii?Q?/EobO/t6rhYcfyImwKBqCMjMFnUrj3ev28wp70wJxokx94q1L4d86JkS31oU?=
 =?us-ascii?Q?4VXPaNOMnp3RAKJKm7LjGbNA5z0J93/1ahxNXT5l65OrV0rqySuxyR3RYicd?=
 =?us-ascii?Q?gGCm3rREZ9Lk+Oe6akcez4TTJiWf52b/cAgzi1yzAqj3Zn+mJBFazCYYzaFU?=
 =?us-ascii?Q?WqllJ0XShkhD3Bczdq4WCb07/mCtsWFiBbZuxmpiS2skZ8gJkcXHgUDV9wWH?=
 =?us-ascii?Q?DJ1TkoiwgiwOStkxcSFXyt3E7MS42smfFiXqElWWj7Mj36C3ESqr0NoffiIp?=
 =?us-ascii?Q?cv6/I11b6aOb0YLz4HyEwJblc1CoropY1rbVVrRIxrSO/ACxV2BwPxl274ad?=
 =?us-ascii?Q?jKzp3b99UraaAHKO8s6YqaSw5KAvd4Zf6ui05YkERZrCnC3Pff+DKwrnLmgl?=
 =?us-ascii?Q?j4L+XUUOZ7pjobrmmUgdmoCiQmzbe+zIJQHMslidfniD0e28rN567oM/nNEC?=
 =?us-ascii?Q?2E952RjM1ryY3vIxqouYugUFkg7snTAcljDx6UoCc9wjMc3HuOAaYMwpEhSO?=
 =?us-ascii?Q?UXxTsh354btJaOZAwbfDuIYzxZD38a+fVVlzMDLX123HrotuPJRwaTJ7kSl8?=
 =?us-ascii?Q?iWvRkgKMGcfNC967s6wsoZp4U4qexMxFzYzqKzAjV/6D3W7S8CcGHiLH1KSq?=
 =?us-ascii?Q?nJRHrtW7vcRUU2MttFKP1gsY8d+b8dLm4xlKTBsU3P1kBKOBrvnO3g+UKOlQ?=
 =?us-ascii?Q?i3QI7j+1BzhwoJ0pFjR6RxjF4F7SMdmw7vCadXRIPgB+tlKcy1MSrjGtY9ZZ?=
 =?us-ascii?Q?Tn1uFy/i5Qcf6jshKfd5SiznlAzap2vn1Eu4Sfy3QBc/OM3bwSURjgaypMvz?=
 =?us-ascii?Q?eEdrkfY21nkpAsmvOrDLIsp35V4swod5uklaoVgV/4m+OVxG8B2kt8NZuMlE?=
 =?us-ascii?Q?WZ3+TVBcRzoLiByGnbAP2UflnL/CY3uq0PAP/JT3aH33g0FY7WtEAqppZpvJ?=
 =?us-ascii?Q?MUp/iKEiLnG71DOFR9hUDBLVzLaxJqnGV81luo5HxCYntqXiAp2Hkj19u8tg?=
 =?us-ascii?Q?TYrF1AYSy6CCUOBcIAWeLBQ8wWinezaLWAckm6rOSiBf5BJBc7DUmW1uV2+s?=
 =?us-ascii?Q?OxE8VnZS/c+L1LsQNrUIvSEsU7VfJKALurK+09k6P24XjDofL8OF27L/kwkR?=
 =?us-ascii?Q?RdMijiTt9YFHgTVnNUOqfAebuJLRh7yYZMhSUSjt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3426e5-2078-4eae-28d2-08db1a99b95f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 21:12:54.7896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33a0qudmo3UwDswvaW0lki04xy09tgoWz/PL/s8zD4IMS1rn+RHxenNGLbl2t122
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
Received-SPF: softfail client-ip=40.107.220.45; envelope-from=jgg@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Mar 01, 2023 at 12:55:59PM -0700, Alex Williamson wrote:

> So it seems like what we need here is both a preface buffer size and a
> target device latency.  The QEMU pre-copy algorithm should factor both
> the remaining data size and the device latency into deciding when to
> transition to stop-copy, thereby allowing the device to feed actually
> relevant data into the algorithm rather than dictate its behavior.

I don't know that we can realistically estimate startup latency,
especially have the sender estimate latency on the receiver..

I feel like trying to overlap the device start up with the STOP phase
is an unnecessary optimization? How do you see it benifits?

I've been thinking of this from the perspective that we should always
ensure device startup is completed, it is time that has to be paid,
why pay it during STOP?

Jason

