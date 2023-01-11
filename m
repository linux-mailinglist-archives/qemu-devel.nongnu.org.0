Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E90666232
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFf6V-0003r9-J5; Wed, 11 Jan 2023 12:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pFf6T-0003qq-C9
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:41:33 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pFf6R-0003Qm-0c
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673458891; x=1704994891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FzoGB9u6dooWPHUEP5H2LS9mNziIFQGDBzXk/I/eLGM=;
 b=caTDfNgj7AHKlQKDPC2RbsshU4a47ndlyobEkfFisizvmZu5XM4UJqm/
 +Imbz/c6qldoLBtQj7oNPhzdgXCq1ajrTpMC79ogZfFO6OMqQ9BFoQkKA
 RFOQ0AVUn7Y5hTGOalKDjPFBYQqEMjhxlxWTMNvVGpq5ZhogItV4XSWc6
 BCC88z2/MzdpGPqY/VSduWWDADoUboWvAUsq4inf2VyjR8/4k88QJzzRb
 /H292K6GcGYoaKiPOjf+8pRciKoeqbSmT2gcRyoJBlDHeQyFIcPGresOn
 J+SyTFxZdCm/kR0NiACdkeJY8HuJ74DzFYEXPfKb3DdiVWUeTN2CpPreH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323547043"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="323547043"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 09:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650825971"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="650825971"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 11 Jan 2023 09:41:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 09:41:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 09:41:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 09:41:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 09:41:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ashGUCHxVA+qmTDtF1zRHNL1QzYmIyWW/XjQmzP7AFcc7yqYTocwG2HHWFbrILTNPAAmzHyFauoSaJ6mrWQKf/QEq4BdwYwhuDnIY7F9of1p2QWk5587oqXUojPZLaq4Ky2opDx7R17vEoS9YMJtOl3o4Vwtd71HKmv9XVUCqvf4jUf1kG2UXuZgZpnMhZ9OQdTc4amPKWz9plZYjzrsWLu89x3X7fbuNCzSHdNijJo2nujTOhDFqKwshu0hx1w9mjsIiEOaDRwpln95/T76498syHCdwpex28YnhUq9ujgOsKfdUtRl5cilVt7sBMP3HLOfeAwd5M3qmFgU/6pT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF2wSnSMUWFO4h5w5gBl9bc4+f6oez9IsAz0HK+xmZ8=;
 b=LY6NQvRNtdNx88YCzWtYghuu9kJUQ/qO67hGgKTA5x53xYexDK/lNg5ldYV4XH3YFzy6+xNhf3i6EoOvmnqPTntEKDCxeoAIARbrnBUEIGQug5LF/RYHjsuMBHq5SiEcE++6kXp3/uIZtV2sYp9+uhXUdRTy3A+9hkcHfleCt3Dq33qk4DwTMpgwXN7lQ0VIi80IWjp6C28jYtdqXkR+KduE8DTpFPozD/av2Z2gRUkeQQaa/kthCtIhl8TCVHAGerz1oQlsSxg8U9RhLcQ4DYjup2S4W1OOL+FBIGcq9X4Wly5D1dRzZDXwl0SfnnLmYd3lVNYrzHjC4UaptnFvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BN9PR11MB5418.namprd11.prod.outlook.com (2603:10b6:408:11f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 17:41:25 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::288d:5cae:2f30:828b%8]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 17:41:24 +0000
Date: Wed, 11 Jan 2023 09:41:20 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Gregory Price <gourry.memverge@gmail.com>
Subject: Re: [PATCH 3/8] hw/cxl: set cxl-type3 device type to
 PCI_CLASS_MEMORY_CXL
Message-ID: <Y770wMPy/kELIFoW@iweiny-desk3>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-4-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230111142440.24771-4-Jonathan.Cameron@huawei.com>
X-ClientProxiedBy: SJ0PR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:334::8) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BN9PR11MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: fcba00f3-b383-4705-5061-08daf3fb0f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2UL2L8WnZREjnIcXeA73FMxI6CDPfTXupW7u6j6G7I42u3NYGsl3eCEWjqwMTRY4qFF4JbMfAHC6pI6YZmpehWXKzJ83W8cviXa4i5iq4Du5hNVYyOrdBC5/WfzYTWinPTGrIJvRWqnvHJqVR5t/BZnyEw6O1rOOVxb0WeW7rnpEDF33FPIvLR0pLWIFwRtijl0ZJwUDe0ht1HpyspZLr0ezaia0ctUEBWN9O+NzQXus5iAm+GN9jMzTp+Mu/rsnnJyIyh4KIF2GI6I5mlBgvj2ZQkfB1XjCI/9ksKApog+GScWoYI2/fMFqiTtpfCkXEG/GwinPTXVFD9uHnL4fb4ADMVE51qf0YYgu+cnUXvV89kUxgMutI3shg+OmSyvbCnI7jjm1swRbAPv80tPxfagDpJSx7ccTadjvl5ozGC3x4+bWI75yJu5RnGxYvrq4PhFA/HT022uCuFwcvM/RtjU/GuHGX1t9x8SsRJ6zysjrp4mgQlZYAvXrqXzAEJ89TmKdeULQIhn6P0pOwIOHKLoivQg3AcVwgPyDMe6ytqf0LKzdTPLo//RzVzoVdDPeT0Jyv1VOL6SPsY79EtRoRWjiSFq6QB050jGWFAfYhDJz00Ul/DQsdK8ty90V8mM8k1WBainLTH2vLum5ASqZfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2906002)(6506007)(6512007)(26005)(9686003)(6666004)(478600001)(186003)(66476007)(66556008)(41300700001)(4326008)(6916009)(8676002)(316002)(66946007)(5660300002)(44832011)(82960400001)(54906003)(83380400001)(33716001)(8936002)(38100700002)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mY1/WsCSasuX5GwHdc0RCLfPT7MQWsQvsxVh0w8djIe9sZhYKQ+7J3AiqT/w?=
 =?us-ascii?Q?k40/aT70GTHKNDU34KXEK/2++KQ6506bskWOduzS94lDnw85CtZHmF51dJJL?=
 =?us-ascii?Q?WrWQbrYZeFPwKiQtQCG5efHTMVvb8B6wKLuWwd6HgZWzMxvl2YmFP6Y8be1d?=
 =?us-ascii?Q?dTS4qBQ4d+tnP90QkR2CTRBCB9R+VSsOQ7mzQf3p0+LGod4LzAUUsXDUvemn?=
 =?us-ascii?Q?RwXT3efwrb9eSZsiQ2KikMnvFqCtzt2qmftVmELlEVJ+I9M/7geWC4F2Aurl?=
 =?us-ascii?Q?Cx2GXWn4qUriR1PPoqZZvSom46ZHao67V0b+7RrbNrtW/BfCqrbhZfMEAY6E?=
 =?us-ascii?Q?FFQvDOKnJQGZKiNXhfJj5J3SYiZT3s7LXjq5eRslxdXzbg2eeh4lOJ2X397C?=
 =?us-ascii?Q?OX5SSnZR81mGlMolIId0TReInNWCN2HpFGZ0eefz9LO8D/4KOHT5lGMZOgvb?=
 =?us-ascii?Q?f5cOkCQ1NbHjl+CHYOChd5sh/UW6K8E08FfZJrsLRBfNTB51tLpGqUDRpcxT?=
 =?us-ascii?Q?XWCoPJXq/4o+8bnnkrSAgpKuJ6K/y8NWKN+vGe9/0nhU3KFry1nnw9pOT2nz?=
 =?us-ascii?Q?A3/7xi+8N0+XTHdg2+avTr4AXcLRWBdusfWrzCfvbPrxyJkTlEDNZAqJvl/Z?=
 =?us-ascii?Q?IfAxwgQ27q+LzNihOlVAF8wggdZyG+z81bv+EOGA/0kyQOWNrivLdM1l8zTs?=
 =?us-ascii?Q?NtBpCBsgrBN3kEcotMLIKsDeVWv4vTB/e2wh7iC0x640MNcBZVGwScSHIGXN?=
 =?us-ascii?Q?ykzOJxi0xJJH1SxrmCkG94sMIiHbq/RaC/hDJP5OsSBWSfLdVp1IHJpjMshT?=
 =?us-ascii?Q?VWNuPK1QmHW1f1rMjdG35mcVTPXIU7+y8E7Y75sbwcXHraLSQ3OntFWUmvsc?=
 =?us-ascii?Q?4OLpvS1jl0G2p/jup4YR6iKd8sBEEtUz12TkD87jz6VQUqYwTBn6d0iYWjcF?=
 =?us-ascii?Q?y/unSf+d1DDyHVH6/9MlKTqnxVGNs8e5v6+0yjCl60Sz4DmK7ozMZ7TwXQEC?=
 =?us-ascii?Q?Ol5994fPFHrMCoiJ/m/h86eHyfy0hzMtVrusjQyWmGhKX4nJd+/MyfjlFY4j?=
 =?us-ascii?Q?gYNWHeHZdeDa7jI4oqrW1J2XRJ7m6njkRp5OxiOxqntIE+oVzhYXgQxF5Rjo?=
 =?us-ascii?Q?lJqqYj5w1mZydjioiDT1QenOjw0gGyjkzyJ96Ja7MUrUSb8/quxdz3fG32Fe?=
 =?us-ascii?Q?NEx3Rai7LSHBIGW4eExSiHkCeIbm1Acx91GeClaNWyMQbFz5h/XK7EOWnNPf?=
 =?us-ascii?Q?ZsQvD5N9hSQ9YalBKZCff9FngTRFOW3x0KScxHDa1zT4h53tNdaTDfDXrUL0?=
 =?us-ascii?Q?//Ns4h5J/DNivBHH+5fQCHVmb4ir0AfUZnW9pB7y6Y9rqyjOdDjofDR9MeS3?=
 =?us-ascii?Q?HkERGxSweaWyojHEuNmU/0gsDy0rWL5iSOfpvB1gyGqGQJ/Db17zmCBzNvYq?=
 =?us-ascii?Q?KjkyO103uMbkqal/1Q0Vcq2nUHEZzWg5qiI8ognneJZRQaMMp35rvATNyLp7?=
 =?us-ascii?Q?2dUhCX5wBrv4PzYPYKHJG8dRyZv0RYBFnLko9eraxjrVH+IHzxa3W6FI1nNj?=
 =?us-ascii?Q?e+5mPvgAwg4b9ehxf8gmaTwec75YQ1J8cRFOg5Qu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcba00f3-b383-4705-5061-08daf3fb0f6c
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 17:41:24.8224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlnpJ3e8SXLL8wyopASudzNoNxFfzjfBY7ApRxYauLkuU3L77wa/RlnpY6c0pXFjEtrtUywfNq5gWVV3e0dANg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5418
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=ira.weiny@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, Jan 11, 2023 at 02:24:35PM +0000, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> Current code sets to STORAGE_EXPRESS and then overrides it.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/mem/cxl_type3.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 252822bd82..217a5e639b 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -408,7 +408,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
>      }
>  
>      pci_config_set_prog_interface(pci_conf, 0x10);
> -    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
>  
>      pcie_endpoint_cap_init(pci_dev, 0x80);
>      if (ct3d->sn != UI64_NULL) {
> @@ -627,7 +626,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
>  
>      pc->realize = ct3_realize;
>      pc->exit = ct3_exit;
> -    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
> +    pc->class_id = PCI_CLASS_MEMORY_CXL;
>      pc->vendor_id = PCI_VENDOR_ID_INTEL;
>      pc->device_id = 0xd93; /* LVF for now */
>      pc->revision = 1;
> -- 
> 2.37.2
> 

