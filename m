Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A2650613
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 02:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p74qR-000847-2A; Sun, 18 Dec 2022 20:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1p74qP-00083v-LW
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 20:21:29 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1p74qN-0000gN-O6
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 20:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671412887; x=1702948887;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cp3QmvhwkdzdEqs3CgEoHlvPoWPO1MfjhBlubywRXeg=;
 b=K36yKjLHvpQUnbzM+qKc9giGFbNFX5VFTYf5eMzClAdo8nPR/6Xbr7CC
 YYc4vFNzN/8x5im8gPhDSNke4KPLzDoBsYzfAiEx8/zxpjgg2LulLpRPU
 w0ZpHUAJL+DHIJZHePp/mO4OUPIvPyT1vB0DlUJFTG2eCJTqPjGyzSAlg
 PvW0u8tWAEZz7ptpr+Zzd/hE20vyx1T0Q0PTmtDBLu5RvCvFOpPT8bB5a
 hc2mzx23Ra7ueJrDSswlzEel/2TqBZ9U5CRrJLJRm01EaxfEhfIsFx27O
 4N8n4/pWvXPkz08WDB1zzzlS6zF4o+1su8mVtned5a7lPfwQIXF3kNAHW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="321139363"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; d="scan'208";a="321139363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 17:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="718942621"
X-IronPort-AV: E=Sophos;i="5.96,254,1665471600"; d="scan'208";a="718942621"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2022 17:21:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 18 Dec 2022 17:21:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 18 Dec 2022 17:21:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 18 Dec 2022 17:21:17 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 18 Dec 2022 17:21:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2SVX8wGoYgUSaUis9ybmXcZPRL9Lt6Vza63GXZ7UJqn/ux0m1JHcjeALMTnWxpqhXh2rtBqnuvoxs3gzNAl1POk0gs+RUUjg4fox8gNaMrb7O0wXiBZJrCPrgHYu9dFuSIMw8oGZCBbIldOo5mgXk3dp7VxZj73w+MAUAhhNtxpn4R3ksJax4GIqCzL7DZuEyISND090dTntAA+uGuqJqEEY1ZIJh9iIytkLF7v2DBS5FjOY9hwCnGeCs5UCLw91YDKJMzkzJhHB+SXF6CnWFYFaD9GEb+G6a1kGbX2/fZhv0TazQ+y2HWzutRUfoNkoVPYgdGYB4sqKtgk30rjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqbLnn/s9g4E5T08LAtV5ju/9pjCozF0b2K2hCihvPQ=;
 b=Xd2v0+bkpo3WoW6qegDI+dqn+vHWAJC7WMyB0m4oeVjsZkBB4JWcVEy+bGfqoJKG5dvmZvl0o/tZbzs7N9qcvR3M15WeTFV6EQWpSa4wk8DYBeg3Qu2ZBmZH+j2L5o0E9StxJt8lAPmslxbzOKfgiPV4ozi9O4Wl7Hl5tlF/coBkwqnChvIkCeHWKBr8z74yPTIK9qs01uq9SIZoEBos2KkBtmn0v9DAxQaIMyDdJA8BG5/dKX9F+g3OwanMJow9rxitRqG9QvQSWvPG6H6pAF3sn+ptvld+SIIA2qtUr7+/uVF8FFZt0LjSEAOKKcL/my3cIYGlToImZpTYZDsshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15)
 by CO1PR11MB4881.namprd11.prod.outlook.com (2603:10b6:303:91::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 01:21:10 +0000
Received: from SA2PR11MB5052.namprd11.prod.outlook.com
 ([fe80::d95b:a6f1:ed4d:5327]) by SA2PR11MB5052.namprd11.prod.outlook.com
 ([fe80::d95b:a6f1:ed4d:5327%8]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 01:21:09 +0000
Message-ID: <f030b3cb-71a9-a8e1-89b1-5fa2846afb8b@intel.com>
Date: Mon, 19 Dec 2022 09:21:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] virtio-mem: Fix the bitmap index of the section offset
To: David Hildenbrand <david@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>
References: <20221216062231.11181-1-chenyi.qiang@intel.com>
 <b661461d-fb24-c974-2d8e-d3e760e00033@redhat.com>
 <13e3d3fb-bfa7-26e3-2e21-1bb21cf577c3@redhat.com>
Content-Language: en-US
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <13e3d3fb-bfa7-26e3-2e21-1bb21cf577c3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To SA2PR11MB5052.namprd11.prod.outlook.com
 (2603:10b6:806:fa::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB5052:EE_|CO1PR11MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: d305f509-4cc8-4d56-d71e-08dae15f4f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3niNJCgfhIqjy7KxYM5n5GSvA9+iUPZs4isidp61Yvwdrjtdzv0cW0v+rTGPAghwrbapkURoa9t69PYv09ZVdcfjoRG34d96XLoIPlts/11AYCC/yQTPQldyeo2o83H6T1UdCbAKaKHBeSbiMin61idbRMcLR1jRRFMB4MXRjmJKzZ3QiIGhc05MI6tlrMgOBSTTPK2TeLSSyKvOKEkVx4VqH5Nh3dPd/5GUcst8UTZJUFpTgaXrpnsJNe0KSQgJBI8ZUXMX5LnlmH/jshc9Fxmmr1IlJnDgUntW8EdWUslBGHw/qiLhUTmNciR/ZWvrdFRp9wDDyeC67G6fW1zv9UP8FlDB1WQRpWiAPQwGheQLjIl3fWOgJE+F1RaRnNOXy2jIpKw/mxtZ4wB8Pqs4w+YaGqJIakQQwqS9X2gsfVXTL2qepQ8XSWRaU9fdK1Jq/XQmy8hECK6x1Cwiw282yg9eeOk5fKqfhjVilzXrlO9DkXaDZmQB6TTRQrbjsZhPj3u7o9Yr05gZOo9wjkxH+Mug36ORIRLGBdzb3I48B6ertyEwlAmumklNHQ5eXu8oBZ9wHnL2O3OcSWrKb53iAEnZDCn4ddWWy8UHU8yaPJkdsKlGd0MWnpil1g0jVTY53T2LFTsWL4pB2sZD5TgqYYdk8ZkBJHciakEpxZy1ySq2B+o+6YHwBaT71qt8iuP5moj8gbDIMBldIy/A7Je8XlSvY3IClU1wnFVZI1EMJOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5052.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(478600001)(6506007)(6486002)(36756003)(6512007)(2906002)(26005)(186003)(44832011)(41300700001)(66946007)(4326008)(66556008)(66476007)(31696002)(8676002)(5660300002)(83380400001)(8936002)(6916009)(316002)(53546011)(82960400001)(86362001)(38100700002)(2616005)(31686004)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1ZXVlZNbGtVQ0VndmdEN2YzSjliSGErV2lwcVBCMEhjMGozaW82bGVrUnB2?=
 =?utf-8?B?Vzg0RDZTMkNpc29DVTFnMXFUQnB5dUdaS0FKU0VqNG1rNVh2d3cyMk42NGJR?=
 =?utf-8?B?M3NwYUtuZW1ZcmZjREhjak15REFFTit2TFJSM0djR3B4V05BWmRMb0hZdm1R?=
 =?utf-8?B?WWI4V3JLbnovM1pVcS9tMmtKUllVSHlXTHhnZ0xWTE1QaXo0REE4TkVsZDE2?=
 =?utf-8?B?aGRwUVd6SXl0TWhpZCtuTCtvazd2WmdMb2E0UzljKzFOVlBjLzFaMWRwZ21i?=
 =?utf-8?B?N2t1aVFjd0ViTDk5SVRBaHRJWVZJNk91SGpWV2twSVkzcEFERWZYOFN4NW0r?=
 =?utf-8?B?enVMOUtxQklrbEdUZlhzWElSakkrMGMrWG9ISTVuS1JOSmVQQzBsVXJEM0tx?=
 =?utf-8?B?aWNaVnhrT1ltTTFWWWh6MlgwOWFwOVBtNk1WT055ajYrM2ZaQ2piV1RYOVo3?=
 =?utf-8?B?NnBhcGJabDJzdkdTbi9KZFhWMmIvSXkra0wrZnV1aGR3bkJETytCbWVudWp5?=
 =?utf-8?B?QXU4UXY4bHBRZ0xxZk1lSk5rS2FHOEc0UGYvQUZsOWwvbUxSSlV1bDZjd0pN?=
 =?utf-8?B?eCswUkNDZWc5SnJzQXlSVG1KdVdKRFpPU24zUVdwUWVBZzJsSWtTV2toSGxy?=
 =?utf-8?B?RWFSTTNxRmF3dDJlYzd4cHZkK1JNTEJVUnVJdGNtaHBBaXBDMjFuWm16QVZZ?=
 =?utf-8?B?cGx6amtjSmhlVzVVTStzSnE2bjlpTDZwQ1JmY0ZqeHp3NXcxRVlyaWtHV0tW?=
 =?utf-8?B?ZlhSYUd3VWhlaTlvQXZiWDlGSEk0VjB1eXhDUUdYRVJTVjFDODZDZFkxcVQ5?=
 =?utf-8?B?TzNjVnZHVTU3S3JNTEFsNnplWEIxNDhySEhJRXkvbkFjU0dUbWY1OEgzT0NQ?=
 =?utf-8?B?OVZEZEs2aUpZQzFtTk5nZ0RmSmJSOVV3RW9DWXoxTUFobk9FN2RDWVplNFcz?=
 =?utf-8?B?ZHJqQ1lJeXdDMi9FU1U2eFFtQldBcllTR3hlTlFwUHFEV2VGdXYveVlSUnNw?=
 =?utf-8?B?RUxxaThWd2M1bnlNSEJOL0VCeEEvRzFDV2xBRCsvTzQxRXlUMjU3Wi9ucEZF?=
 =?utf-8?B?V0N3TG5ES0psRWl1MkpuYmtJT2k5Qkd5SkJxTXhHa3M2SGJjWVREK3Aza2dC?=
 =?utf-8?B?WEVQNzN6MkF5Z0tQb2hPTzhtalFXVE13aTgxTURpUFA4SE5uSTBmZE4zNmp1?=
 =?utf-8?B?ZUxGdmV1cGI2bnd6RGg1SDF6WEtISVJYQjhJOEZEa1E4ZzJ0T05iV21pU3o3?=
 =?utf-8?B?MTM0bk9SU1NDc3B1cDlub1pmSVJGaW4wNkdMK0szTFNjTGV4a2tLVlY3U1lO?=
 =?utf-8?B?ZCs0VE80dktBTGE1aGlOYmpjTFlHNXJhZEF0dUpGVTlqVm9XekxZaVdiY1Rw?=
 =?utf-8?B?Tjk3K3hZUzIzTFQxa3ZWdEhuV1JLTnhKc1JuYUxWNzdqaVpkMXE3aWlETkhP?=
 =?utf-8?B?THRSUmNxTWp2WEt5SlRjeEtOSy9hNnpnc3RWVXdXRkdIU0EyU043ZFE1KzUr?=
 =?utf-8?B?bGU1U0JLc2FGVFFQcmJiMHRBNFYvVU1nRUY4cHpBYjNGc0ROTS9mNUo4Z1NK?=
 =?utf-8?B?Y1FwK3k5aDdzUE9JbDFvS05rd3pmMSs4V2c4ZlM2bXZSWmU0U1U5K0l4aWY4?=
 =?utf-8?B?aHJGSlk3TXljbXlya0hwTysxR1JNUmZRZnR3NnhwUnpQM3pqNVdhZ3NnbTVO?=
 =?utf-8?B?U3V0ekN4NURyVFNCbmEyOXpkUGVETFJZaHAxaWdqc3QxNUUyZVNXWjZIV2Zy?=
 =?utf-8?B?Qlh1OHlXU1ZDNWUyZlpsQmo1dlZzQnQxS01JdHVMU1FpWHhFQUsrQXpUaVRu?=
 =?utf-8?B?RGVpZ0cvWWd2MEc2KzZ1WUJrZUFnLzBxV1Q0a2hMaEhLTWhCYWo2MXhVQS9I?=
 =?utf-8?B?UUN6ZGZTTGlES0pQK21rcU9IdXZhRXdzMWRHQkMrM0JzTWdpMXlMNStYQmN1?=
 =?utf-8?B?T0hhR3U0TEZBVUhBSjJzcGpOM2ZFaFk2a0h5LzAwV2pMaWEvM2hGN1kwb091?=
 =?utf-8?B?d0RzOC9MbjVhYkQyUHpRZXB1OFExODN2ZFcvaTliZjJ3RlRDTDR0RHpxNU5P?=
 =?utf-8?B?TnRRKzFVcjVZVmtrbXJydHBzTE05M2ltT1psanBCNldYQkxVY0tMWWN0c09h?=
 =?utf-8?B?UDhucmNGOTVMdDVmVXdPWjdSZFBtTXZqVTdQaFVIVUhnYTNKbGZQb2x6bnUw?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d305f509-4cc8-4d56-d71e-08dae15f4f49
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5052.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 01:21:09.8335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T155pSWOeyrUDHOYvwh0abqu7Ley7AVpdM9OnyaBx8Wp/X+dbvWtpvYU8odvgriM1QIn1QywGCubJXbT4L+Z/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4881
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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



On 12/16/2022 6:30 PM, David Hildenbrand wrote:
> On 16.12.22 09:52, David Hildenbrand wrote:
>> On 16.12.22 07:22, Chenyi Qiang wrote:
>>> vmem->bitmap indexes the memory region of the virtio-mem backend at a
>>> granularity of block_size. To calculate the index of target section
>>> offset,
>>> the block_size should be divided instead of the bitmap_size.
>>
>> I'm curious, what's the user-visible effect and how did you identify
>> this issue?
>>
>> IIUC, we could end up our search for a plugged/unplugged block "too
>> late", such that we miss to process blocks.
>>
>> That would be the case if the bitmap_size < block_size, which should
>> effectively always happen ...
>>
>>
>> unplug_all and migration would be affected, which is why a simple test
>> case without a guest reboot/migration wouldn't run into it.
> 
> I just realized that unplug_all is fine because only vfio implements the
> ram_discard_listener so far and always sets
> double_discard_supported=true. So migration should be the issue (and
> IIRC migration with VFIO is still shaky).

Yes, actually, no obvious visible effect on my side. I was just learning
the RamDiscardManager interface and found this issue. :)

> 

