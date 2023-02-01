Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2F686F93
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 21:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJRp-0005dq-9N; Wed, 01 Feb 2023 15:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNJRc-0005dV-6w
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:11:01 -0500
Received: from mail-dm6nam10on2061b.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::61b]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@nvidia.com>) id 1pNJRY-0000Pi-Kr
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 15:10:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKWWIYwEBH6jneF8IWGgSxHeZbFNP7Vr1uDth4lZCIWhwqeB9njWBT9jGPTB37ulf1seKo5LY3x8Fp/F2C60zlo6pf9pkAytk0HMq0D6YdKuK65FTiZgXK4ZTBtDSfNumMgfSz+i0NPKLZbHIPt+JSGVxE3TvJnZpLBCKShuLL6+Dvwu07mHH3DXC0WRzlUsD6+ecDLiBv/0UDXYDXvHI0+mkd1IMhpbUOklRdmvDhWRJuk7mu/Po/W5dqKn+H0GppX3432L7KwhSBFdu+GNjHwrhsk9/RYFxTi70nEMeKgYlftbZyFt+g4CA71suBkxMPs7HClMZwWmiv/3vKLLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQxAJcjuUrR/HHeF/2wJmc8hkeEb9a5dvU9uXHjF9oo=;
 b=U6P7uiLkwuFjveCiZMSB9hVgcxayepTp4ixz+Ak+/otXfswCY80/U2y9lv/3Tukc07T4Tk/XrbBHXoCd8aPF3EBLSAhZG+4Mfb9VcpzyCAKU14aPo1lOLWrXxXzU15KBV8G2O7Z503R0iLI805JVfN/xkLzzyUmjUGE+hxanSbAnLUjimPTkN4TVEzFtURdb6kasO7oHUrvNQdPpurSdCmzuHQI1zG9KMa7NiNyoRd3r7QXJDygSgviMdn2FR/JoqOn901bMSnnmXYkafLwqV7p3sFfxhDFcK942NYJa+Vpb4aqGYRBX32DKyNXINLIo92YpLMZk9+CrL9OsR/qd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQxAJcjuUrR/HHeF/2wJmc8hkeEb9a5dvU9uXHjF9oo=;
 b=UxWENda2vCmIoKw/QzquIC8BRuN1hAySyupUGDB3frTol4SBQ6oRQOa0aq7dqkK1idJF+WlbIzZUlXn7GccY+5t2KX7xrd0iOSBABwLgJPVomuybJ+MjFPpzK8uQz5GBE9TqFB5vRoi4mDDTH9HVxXG9FJms3peZKLhtx9gwE2k5h0MIOEffZ/uSavtrLwZGUde23e9LzEYWyl/Nc8NtfYCHRr0s4EJWqC6sdjyCmgjGub3b2JJV0E98hBLUhruJeYzfoLNnIbgmLvgWnmCZrc2mdcJZcL5ShCK/Yv7qyd1XUFZ0TJGBCZLb6wgcHLWEfc6mXI1IXj67o/tB6g7whg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Wed, 1 Feb 2023 20:10:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3cb3:2fce:5c8f:82ee%4]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 20:10:52 +0000
Date: Wed, 1 Feb 2023 16:10:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
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
Subject: Re: [PATCH 01/18] vfio/migration: Add VFIO migration pre-copy support
Message-ID: <Y9rHSlnWAxj3Zm40@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
 <20230126184948.10478-2-avihaih@nvidia.com>
 <20230126165232.0e7a2316.alex.williamson@redhat.com>
 <0c6856e7-ab92-7276-256c-6226aa692698@nvidia.com>
 <20230131154301.4aaa8448.alex.williamson@redhat.com>
 <Y9mkbLczUb2LFb1o@nvidia.com>
 <20230131211503.3a328e0a.alex.williamson@redhat.com>
 <Y9qhSK9ivzBmhnpZ@nvidia.com>
 <20230201114246.12d659d3.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201114246.12d659d3.alex.williamson@redhat.com>
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 167e8baf-9d4d-41db-faab-08db04906ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AulYwrZlOEcifGH2BHpEIGOrpi4+FYaXNaUoyj1oExoNjfEOYs1waaML0kv+K1aPSiWF47fBgZCYXZ+Qcnm6OGeS3LyisqxGEhrxc5tzpboVn+IfpORsWaBCJK2KwI5GnMlbMVInvMsoh43oa167d6MDhJUEADWgYdpm3vViPg6hywu4nV9GjfPmKY1dnXSIAjy1h18ipAD/7wsncNNmMvEP8tRy/Zjm/AI8v8zTOwhQShTrNTYysHCmwDdHdsayKQQc5ghbw6oDJ5McHNLdFSXkuvUttxVyUYLR1XIAQDRGY0lMKumUX/ZDJ6b42hSfk8yiFxtGmsrPpWvwPMLI4SYFM8UhDcEkqf8BDp/fUKfdp831J6g/NnwOpyc/qN1FM5H7YGLDK/Ari040wgnxh2ySS/qzl8kOtyKB86GrFzSr2KRum2SplXFK3na5X1puwM/bI7bFB6nu/S9pqNZFvbykpRyOC3vESO4Homwn/gDtCC7e8uOvgD9EnuK4eZUI+hXfjKHB0HOlCu7u/rNrY3NdNzmRFhBcjkD/uvnrpWVGflBujjF+sL/2Y7zcuU2sUG+S9NfwJZIozmPkKoEMMBJe+e/wlYwloXGA0SnAzgz10wJN6IuUW+bJhwTwogm8yVOdkh5EI21ZCiR5gSiUFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199018)(5660300002)(8936002)(7416002)(41300700001)(38100700002)(36756003)(86362001)(2906002)(4326008)(6486002)(478600001)(54906003)(26005)(186003)(6512007)(66476007)(6506007)(2616005)(6916009)(66946007)(316002)(8676002)(66556008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GIM2dAduGJ52K1RKBZtLEtcNzXI+sm5pbMKm6hwvuKlNr5msmix87aTzHfqH?=
 =?us-ascii?Q?ps7gE/MScnNTkdKx3OwDYAd3g4pLuvWpfvTc2+RtCYR+3I3DsP215m+Vk4/y?=
 =?us-ascii?Q?MA2UtxAOra9BqD8ONAiNwMjOokknWiCys155XyF8i8upXzfko7ucur2fNALc?=
 =?us-ascii?Q?EqBfamTRTw8xeOBhR9ryp12wHi6RXHOFLZYc48nAoiAVZfiwzI9sj1O8Qs5K?=
 =?us-ascii?Q?ThCKe4SXgeNO902lFjN3iK62qAVDdOkBKmJatnYGccNt3rY2l3xQO2LGb8Az?=
 =?us-ascii?Q?jAobYsEzN6+M2PWQEzFolZmA8OwtjdOaFSZARzZ5lyszatXhtThPLkDUcmSA?=
 =?us-ascii?Q?qn8OXwG8uLIXpJu1w0N2v5lFpmfmPBFo11J1/Oa78/fU14vv9PRV21p0lK/8?=
 =?us-ascii?Q?ZR2kLdrioj8/etldGKeEZ41fmxkosf9XYVxrkITQZqfZYofbmTn3GSeoWjQq?=
 =?us-ascii?Q?uz8LSUQOaBeBZMDpodNCrOK2AlJRycRC8U2f6LeBtwG6w87DRO1zbWO4rJOT?=
 =?us-ascii?Q?Pvk+CUqX1zBG2qatbnxCaSN3zj2AwBWjKvQ6z51YvMhyqDhrOrHdGCZpxSkN?=
 =?us-ascii?Q?IM2KcZZo4U5pe/zcMu9Et9ZaTSo2+hCVTUw8ZtKPX2alRKvw8IQLVT9pBBk1?=
 =?us-ascii?Q?GYZJILOJ11TMwic/uYqtC6Z/Qe5uq14NmTIdCKDeYCNuZVBkb9QUL6uX4Chm?=
 =?us-ascii?Q?zxhxVmdvplkrMjFAkT7IO4PprF9+a6VXwqbk3oyHT/cX14GFsizb/wLaSnSP?=
 =?us-ascii?Q?Y0JNsXzEkFM/ifhdN0hJLMvM0Y5YQxh7xxhHAJs8wVV+tb+MkMgrgygQvvMa?=
 =?us-ascii?Q?N/dVdZysy/8PLWuwWgJ8gReNVKPHY92MmN1KCndVLT46ueKRtRnz6gu5OX0B?=
 =?us-ascii?Q?sv5zXHHyfxzp0BY1PQ6XAURpEtT+j4fxAO4KTy+F5qwr8m0pSykBa/qXhgmU?=
 =?us-ascii?Q?oMPn6FcYOAODPHjeOBhpwCFbQT1hQWYo4GogI9Ct0E/Xzn5nBSKA3ZkwIVHY?=
 =?us-ascii?Q?eBA+5Q0xUDfSVKQAQlRBuWuTghp62KT+4FMnPo/K2UITfG9swOsFcK7Lnklb?=
 =?us-ascii?Q?s/lKajMZUkMsrbiQJj3+GMDhBytwTcnwYR8tIS8APgsGD5R30QVqH3DbqjG6?=
 =?us-ascii?Q?O3tTutzaKQD6rOBMcpvV/B0J18feSuzJGmZ8cJxCfx/ZeZ5U5a2PrmIxRkZ3?=
 =?us-ascii?Q?FznbIw8kpufBCdZ6SlxJwdi/UgZuEBQvftZ5olar/ClRexsoqJFCPy7IinPQ?=
 =?us-ascii?Q?K4NJE+oE1qtbnlmiwT94eGIIvWvCdSvQFyHyUvjcN0YskstgkUFgOgCUu9hZ?=
 =?us-ascii?Q?8ULV7gYumos6l9zgTLi7FlwENHpiSe8Ase000MKf+QqmhGexWvOuWjsh5NHf?=
 =?us-ascii?Q?L6bX0DdOy+DNepKmjFkv/1DmrIEOwW1/1dA3mum74dzIyITAMMLs+cA30LFD?=
 =?us-ascii?Q?/iDLKnoDdO855acH5ZylsCvPE4521/sLj+s5+y4/Xjprh+MzdpCXgBVn1phJ?=
 =?us-ascii?Q?gYmDxhk5rRjE/GgJ9x7gdsjZwzCJ06p8mu1B1m3iHxkYpjowDVjn2rKaKoWk?=
 =?us-ascii?Q?LBLpPblnsQX+IGgrTaIllenYoFetHbShoQgVZpT+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167e8baf-9d4d-41db-faab-08db04906ae1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 20:10:51.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtBBSMeob0MMGrTgnIK79WqahMo7udvd7A0NkSDBV+l7myDbvv6hAWTYfDPD0SmD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
Received-SPF: softfail client-ip=2a01:111:f400:7e88::61b;
 envelope-from=jgg@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

On Wed, Feb 01, 2023 at 11:42:46AM -0700, Alex Williamson wrote:

> > 'p2p off' is a valuable option in its own right because this stuff
> > doesn't work reliably and is actively dangerous. Did you know you can
> > hard crash the bare metal from a guest on some platforms with P2P
> > operations? Yikes. If you don't need to use it turn it off and don't
> > take the risk.
> 
> If we're honest, there are a number of cases of non-exceptional faults
> that an assigned device can generate that the platform might escalate
> to fatal errors.

What I understand is that is true on some commodity hardware, but
engineered systems to run as cloud hypervisors have these problems
solved and VFIO is made safe.

Unfortunately there is no way to know if you have a safe or unsafe
system from the OS.

> > Arguably for this reason 'p2p off' should trend toward the default as
> > it is much safer.
> 
> Safety in the hands of the userspace to protect the host though?
> Shouldn't the opt-in be at the kernel level whether to allow p2p
> mappings?  

I haven't seen anyone interested in doing this kind of work. The
expectation seems to be that places seriously concerned about security
either don't include VFIO at all in their environments or have
engineered their platforms to make it safe.

Where this leaves the enterprise space, I don't know. I think they end
up with systems that functionally work but possibly have DOS problems.

So, given this landscape I think a user option in qemu is the best we
can do at the moment.

> I don't have an issue if QEMU were to mirror this by
> creating a RAM-only AddressSpace for devices which would be used when
> p2p is disable (it'd save us some headaches for various unaligned
> devices as well), but we shouldn't pretend that actually protects the
> host.  OTOH, QEMU could feel confident supporting migration of devices
> w/o support of the migration P2P states with that restriction.

It protects the host from a hostile VM, it does not fully protect the
host from a compromised qemu. That is still an improvement.

> > I think multi-device will likely have some use cases, so I'd like to
> > see a path to have support for them. For this series I think it is
> > probably fine since it is already 18 patches.
> 
> It might be fine for this series because it hasn't yet proposed to make
> migration non-experimental, but it's unclear where the goal post is
> that we can actually make that transition.

IMHO non-experimental just means the solution works with whatever
configuration limitations it comes with. It shouldn't mean every
device or every configuration combination works.

So if you want to do single device, or just hard require P2P for now,
those are both reasonable temporary choices IMHO.

But they are temporary and we should come with a remedy to allow
non-P2P migration devices to work as well.

Given we merged a non-P2P kernel driver I prefer the single device
option as it is more logically consistent with the kernel situation.

Jason

