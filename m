Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0E6A0109
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 03:09:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV12K-00011P-PP; Wed, 22 Feb 2023 21:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pV12I-000113-N6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:08:42 -0500
Received: from mail-bn8nam12on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::62d]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pV12G-0007qi-Az
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 21:08:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qhr4dJSf+ZSIaBiQ5TJjdf5OMk8Qj7Ov5yb856IFEjkznP4PlzPDnDFo3wsN0QWKXxGdt4Mn3wVl+QDT0nu51kqxbp8abrG5CS+KYaorswrd3aXJ4gSdUN72NQSpa03cUqTgICgDylWRfOcIE9WRhrwFLif2/Q1dnbYu2d5jl3TJTGSowfKmk1+82CHQTawk1ibAG1qD81b8CdBL/lL4QLsUn2w5iOmOtgWgNe5CVTmd/pHg6D3R5Ok1Utpb90DJUmWjRViZ8ZtKn2XwOkgsFwMkUMQffZKBLvD/pGNhNoZfY9hfgdohuZzE/OZPfDaHgBk/FzevFYMzgzo0HPOmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTY8Qu1uc2r4okrNyvs307bxi0V/wIeNal9WiQJMHdc=;
 b=deqzE/Urilog58YFiCQ3WLXJpCET+HwQCX6gdu/8/W0ZSzMiv6GaU4lmdWeV0brxuWbTNQWb6hV4r1RkuX4ldBgpvxrfd+stYE1FKjZo0Z/IPfkivZ92+X4jwuGt+AU14J4IiO5aHZT7nnuTFPrwKF1GlI6j7ccmPpOb6EpGLVqXvsqR2iZYeD68GABShv/RpdTKPvpFMnOPBW464yDAobpfg1GF8stZ8vWp/OZsQ2QbiF8PWeYj9dvYC0fHIelxcTfJURD/ExBhrR48FOVYjlPUzxHgLd0ZGyFPcXv604lFSaR5iVDpU5cejomTk1H+vP3kLxtRlxG8RIH1TQv9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTY8Qu1uc2r4okrNyvs307bxi0V/wIeNal9WiQJMHdc=;
 b=EA6huJGgSh3GJdLkc5PMuJv6avJax9vi2dNn5dwe4abSoAHLPMwJ7oKnkQ7mvPwi0DvcX8B/qb/Pw4qEbI6ZjgvXm68jTxxYcJZ2ypWXnDAANcxFR8JOO4LWNkJocItg5I63yc+QXdzqbv75MWVinT3CLD0CTsqK4pxuKLYKrsiCScoZuD54TmEwJ/OilGjGUYRyaQQfvspZ+sC4JydzQv3U/MvRSXwFRATRnk9mS6xBo5Z7m7F6zSAJuZ+QXRh1bHZcVWlIn1DTPuW60vxTL6W/iKEhZC8cmeTpLzO8zI+gpAEj1OYP1be+ahsCkc/Pu561/r+6oFS1uD7w/Ck7QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7490.namprd12.prod.outlook.com (2603:10b6:930:91::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 02:08:34 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6111.021; Thu, 23 Feb 2023
 02:08:34 +0000
Date: Wed, 22 Feb 2023 22:08:33 -0400
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
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Message-ID: <Y/bKoUBe17YNhGEA@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222163439.68ad5e63.alex.williamson@redhat.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: 79205c9b-b758-4b9f-2ea2-08db1542de0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EpNrDFcbr1ySkpcXx3EJW0Coug1LquA+ATTnNYJzk/aWzKuDHmpjsaqqBSf9mzpV9uPaQvo96GLF0VU39eRjWqeWTidSlRMcAJBGgtXidP7nYQBI9CXJy9Rstb1ZxHaamJyeiNKnBaqjCAcT5b/9wsIizsgcCvr2otUewEU+hOuKnHrX7tGRYW+ld31ZZarmE1kgqJRdivLOd6H83r8oALXDxYqkPUKENvkLkj0PgutZJaO7YajM6Yn8ZCDw519B8ZkL4IuTEgv61znjpen6r3Lgi2XoyMMNfyqahzTLhkjSCFaJc8oKwPG0zR+sc5DR1Ix8exN/3zmmA01JC7LhvJ80LoN06bKHNY2Ik8ov9bFRKNphOUgJisPstUNoZuZ611eDdWNSro/JEdoKfgYZR5mUhaAUil4R0P7KbqimXKH5dOIj7YMjJfWz9ioknI6CJ7HVmgp03XQFh2dSwZBZZIPI5EfwMNo5LLDh6LWZuD67LV6635UQfQk+yyFnbfRsLezAs/ECGnJsqFJXhQCQHBIVgNB4gM5IU7bQiqWW8IZUX241TB422FDICR2t+z2ISY8s1ukdqekAP7kY6LRHQECR+4YF0OC9dt2zhcNdBZevz6Cv/ozd/kkf+thLCY1/wqDDyMG7OvyvowvI1c7psBvxIokwFBy3canxqK9j4kLhoc9q1AIND2q58CwZX8/j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199018)(2616005)(86362001)(54906003)(316002)(6916009)(26005)(186003)(6486002)(7416002)(6506007)(6512007)(66946007)(66556008)(41300700001)(5660300002)(66476007)(478600001)(8676002)(38100700002)(83380400001)(36756003)(4326008)(2906002)(8936002)(14143004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03NSwVA9autjnVP26I5/k88JFLFW3jWVyMRMW98Kq1YzM7ySmLP8urbIlY/u?=
 =?us-ascii?Q?yZPS1H5sJ2ROxi63/yCDmwMy+cfndvquyjbMZRXf67OsfEB+Ah132+rBn21B?=
 =?us-ascii?Q?Pl3VsMC/gyzHmYZ5y5X1i5mVb63zGzrUHoFaWqjBbg72v5vz9uinTtlQ0arW?=
 =?us-ascii?Q?aPFpjw85TqbpkmCvAIIoZkjnxFgGvOE+aKXdoVTlSXYag1Ht/q9P2kUISt3S?=
 =?us-ascii?Q?MCKJ1vzV+mj6l5mG+DntVMtZqqHXrgktpfTob4nCDzLPAuTLWQAhz6N5t34d?=
 =?us-ascii?Q?9d6ksg3hEOSkx3rZJScJoHVyXOcgDXe2Zg9tH8Y1iRK49nTj2evnbuOWmcx3?=
 =?us-ascii?Q?6/F3CpY9CZC0zO9VB/QMPcKPR/c1N8xx+PDvsRtEUVZ/X26Us0/fzEXl2B6t?=
 =?us-ascii?Q?cuYyCyheVjVl85frqHIyjTd8KGJMql+xbvYQhuwObIdTpKCd5EfTxp1Xf9kG?=
 =?us-ascii?Q?QI648yw3ZGoXxn6wKVgCCEze+S/wFc2k/7sKthozUAJzvgYdEcQ2MebFGbZ3?=
 =?us-ascii?Q?GO1QNCRuzznDHYPNFlZLmqUdKNZZ7RK8iRWigS5M8DnykuePN3I0nm+D5QbL?=
 =?us-ascii?Q?dXLew0Fjg6Kr5u25bV/8/98eukhuTTSCAfY5zG999MvSyyfOwUCxSJE0Jfbh?=
 =?us-ascii?Q?6T6XdCWXEbNBVCepcnRis8GkRfT2jb1dPQzeSq+p4XsMT4zl9yIRt3KUxPnI?=
 =?us-ascii?Q?zqtMQxasJLoZySKarozs1PF7vi576UF2uLA7zvmDaouRT167+LG79y0+C710?=
 =?us-ascii?Q?FNZSVbp84wgQOUMua9vil54xnZeZYrw9bxGNlqoSfUPO8RC8UOx2Ybm2z9mR?=
 =?us-ascii?Q?2q/101MTGdMWVi4ANGIBLs1Hg6D0fV6Z/BxV92/r3xm2W7WVWS+vEsXairkv?=
 =?us-ascii?Q?EyF3yyWNjU4Ho70DZJxNu46yMb8TsZ9yBYzMOwzMd8kKQ0wNBs/0heiQRwpF?=
 =?us-ascii?Q?7D0vjnCvJzJoxjDZxreEIngwwga61ei3WuG5ArcRsBFq2+Wejy2cUCpchuFh?=
 =?us-ascii?Q?aUP2LigLdUEIki6qcy+7kGqONzsaxqgM1DY3HdB0VKm8o4zONtwVad0JVKux?=
 =?us-ascii?Q?22jamGs1Aht1TD+ieON1LZaOfl0+Qw7UiP5UDOsRqNuhkhdBFKC179+MooEF?=
 =?us-ascii?Q?drJwIFTntD1vbLnrg2zaBK1obfQZZZOdO7F0sez9qlKp78BE4l47qa7ePr/9?=
 =?us-ascii?Q?FAjmW+2Bj0oJLXdCGjcdPFym5uXR7YZlUwjoLt/LWQtrKJc2r81PludLHNB6?=
 =?us-ascii?Q?py1I8N/CrV6O3rOBMFX0+D3V3ifzERajTt4VV6uHwX0HQ8Y2WfqduS92sbrS?=
 =?us-ascii?Q?qFCDIe8A1UQtEnDLltc5nWsTlxF77ycNEinXAZbPOClS8RM5yQARBetJ7RfK?=
 =?us-ascii?Q?JMks5nnEOqzhF3W1DVFxoNyED7i10djk+p3kQpcY+lESLwzylTAh5QMtHSvj?=
 =?us-ascii?Q?C8NZtf/F0mdcHLL6LxKZKU5R8y8NhmwBAQ3Z94+SUh9a5hiOrFcS+NmMX56+?=
 =?us-ascii?Q?TiwdL1d6o3N+Q5+BX50r2H9XoubKNkVcJg8+12Rr+dWyTHhF8PNlWTWXUX0J?=
 =?us-ascii?Q?v4wjKpWTtqFmKRBJuz9hQ0ch3jcrT2zNbNj77pCR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79205c9b-b758-4b9f-2ea2-08db1542de0f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 02:08:34.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/iInbB4EyO7jI9JQnb0WnTW5tBJiGKuDgGQ7mvoBroQ6C5yeOw9LidTZq+8J8yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7490
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::62d;
 envelope-from=jgg@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Feb 22, 2023 at 04:34:39PM -0700, Alex Williamson wrote:
> > +    /*
> > +     * With vIOMMU we try to track the entire IOVA space. As the IOVA space can
> > +     * be rather big, devices might not be able to track it due to HW
> > +     * limitations. In that case:
> > +     * (1) Retry tracking a smaller part of the IOVA space.
> > +     * (2) Retry tracking a range in the size of the physical memory.
> 
> This looks really sketchy, why do we think there's a "good enough"
> value here?  If we get it wrong, the device potentially has access to
> IOVA space that we're not tracking, right?

The idea was the untracked range becomes permanently dirty, so at
worst this means the migration never converges.
 
#2 is the presumption that the guest is using an identity map.

> I'd think the only viable fallback if the vIOMMU doesn't report its max
> IOVA is the full 64-bit address space, otherwise it seems like we need
> to add a migration blocker.

This is basically saying vIOMMU doesn't work with migration, and we've
heard that this isn't OK. There are cases where vIOMMU is on but the
guest always uses identity maps. eg for virtual interrupt remapping.

We also have future problems that nested translation is incompatible
with device dirty tracking..

Jason

