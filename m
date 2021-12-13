Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C5472C39
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:21:40 +0100 (CET)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkKp-0007yq-7h
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:21:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mwkC7-0008W6-4Q
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 07:12:39 -0500
Received: from mga01.intel.com ([192.55.52.88]:25836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mwkC3-0000KS-QJ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 07:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639397555; x=1670933555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R/l7k1VAJBGzQgVXNTPxIrknLlx4QRO+uOWAMN8yiOU=;
 b=Ng3QLZhm8HPVjorIGNFlDxOlyokisFjFxqqCtoCqIpsxwvMgpY7elQAf
 ZAS2PyytCzxp5OKIQvVa7iB/hf3ytXxUIDafu+zSiFC13ukwnjOwS0oEG
 a4IUq/0noco2tKRggJHGqd+lPsOEb//+FoPT15QfNqB4wZnVd8wjMyjDP
 7KtA9KeKaxj+wodWEWm5dkYSAMsZKpK8EF14wZRLjNRCTw5qGUdZKI/dg
 sNFXPSFDcOlm81i7SFZVq+40W45+c1x2i6X6fPIZ0JYPiis6dLsVF/Nc3
 gs02rfxFIFaKxKTCKP8CWRDcsviU3ZqXoQa33Jp9LQCGLK4XIW2lL/Zwk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="262844358"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="262844358"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 04:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="464611594"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 04:12:22 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 04:12:21 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 04:12:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 04:12:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 04:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHL/kyk1DjYmDUxDhesMY5gMvHHJzDgizsepZZ2mmA1ro1VdXDYJFwDYK+fkULYTjRAxe2c6I+qxLHNLXVhBfXsuc86a66tL9cRwfF3pQwfg2U2NzjXOMezUrjXwT9vWqOKJJGwPJyoeho1P5w0zI2Wa1oSd0QTn032aUTGKPqwFy4XvZ3sXMxmJFeLmbQYkP+naGIFBqicWxoNsQR70B1G2FVM/tMpbJ+7oSBJ+3XRo1gMPQe0rR18PyISC8C9WBKz14Z4dOecxBXnugRooW7hs2jkJ6gIh07c/81jw/uUvbLtxAHSmZWaclx2QgJ0uVmUd9HFKiApAMKsHSszGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evYe2p8nFZS2JypDDGV685LUASpI7Yu3SyrbyF9P1MA=;
 b=j3BLs6uLn6yWASDdAMnFUBRDvrhBMXeH4eG/Z94Tv9QIHoEFR5LvS1zIX2Brw2jo/dyjVFXd5gmLu892JCUee1GulH+riJq/K3Z9i5vlbj2OeoJ4lAmz1mGPVgeOvPjbww8tSxat8+rg/lXzYAleHmjL9stQ26Sv/GM4a1+k3bGuerqwbQN1vsbf+d6BQAsqh5icOgU8qTDHzHqqcyIUOkNZSAEnTFZpok/PU94N2hMG7h3Yuo093d1oh9UhoMf1hPy4PKeg5RQqmArdqdS5/dwKwwfU40/AfCCaxETpqC8NmsqHUSU2maP9gOpBrJoW828srQJ89qd5LI0VYU19NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=evYe2p8nFZS2JypDDGV685LUASpI7Yu3SyrbyF9P1MA=;
 b=oeAh1Pdm2ncU+LEFS8wtzVjNiuKaaKHo+6i+6f/nAEdwyRba+vzqX26+W3P+ZC3DgjAt1MYwWKsVfh2Ru40rI0E07XAVKFnssYCZaqJXKZc2eDx6gLg8oDrGkf/ScM2D7Ftb/VPsSDA6GIClNFLGfuyKFRaQAWEbd6qhSW64I3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5589.namprd11.prod.outlook.com (2603:10b6:8:26::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.11; Mon, 13 Dec 2021 12:12:20 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 12:12:20 +0000
Message-ID: <5390b323-c616-3b86-abea-877d40f91359@intel.com>
Date: Mon, 13 Dec 2021 20:12:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] COLO: Move some trace code behind
 qemu_mutex_unlock_iothread()
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211210221435.142472-1-lei.rao@intel.com>
 <YbcyTCoQkUP19SGa@work-vm>
From: "Rao, Lei" <lei.rao@intel.com>
In-Reply-To: <YbcyTCoQkUP19SGa@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::18) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 480c813d-0c69-48c3-02c7-08d9be31cfcb
X-MS-TrafficTypeDiagnostic: DM8PR11MB5589:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5589A2548C90AC4997E37C3DFD749@DM8PR11MB5589.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkSGMK/Fy1w4Dobrn7SHYiR0rLMSteuqiUr//7/deLQX+whPXmo9q0/iLpygU0U68yqOf1abWqZ4oLTtT21cY8ld9r0BMb7eQgRflxnupkn4+44qDXkjGBimgcW7TZVft8teMSK2wysLXXugecZ86hwhlu+LZ6zbAjJgA6/ccvNiAQfmfitPWlUavAuSWlKVKaHOOUcuGHF65bAWCFj1TysfembJ4PiWSwgccg6019vr/ZSrb6kIAXW2crS8rAFfnEuoqdXU1GtbPmpn834MuWtvZDmC1eDEqcAyVPuwE6Jw2WTv0gd/Com5NfpCBn7mnva/19KH8b+Tn0GEPgcs3SbjgNIFVfHn76AfkcVY6+ieGMBVibrYmF6uE2ibm7o7d5oN+RoGHWpSBur/DAI5A3cPC8Kptd2YbhgEv5/Qd9pPOxuYqczFMfoM335lCyMKcBZn3eXA4ZEpbsjiXUNLQpXxgtt295nP8+2CBnp14sn6/i2jm4wYMX7p69u1Py6xSPX+AheZYetlcBF5084ZNf5WUT+YllLfU5u61/XMw4dALLA1gizchsRv71mPmmIGc93L22irq41N5PszI7o056P8hMkW0i76tGxhRS0UV4biyXSVcfB/YB3Arzyu9Og0r23TSBwr9hdfK81PBdM1kDLfYqR16WZv0tKflaMsJTcHRDoec30yatacwbbLf/eo2UYiF865kkkuosF6zkWTr2RcSB9ajs/sWSYQGLM6dBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(66476007)(2906002)(6506007)(31686004)(316002)(5660300002)(66556008)(508600001)(6486002)(2616005)(38100700002)(6666004)(8676002)(53546011)(82960400001)(6916009)(31696002)(26005)(8936002)(36756003)(4326008)(83380400001)(86362001)(6512007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk9ERDMrTDB4ZEFhRDBKVXFiWWl2Slo2cjNXS2FWN0h1NTBvUGR6aTlxa2Nv?=
 =?utf-8?B?QXduUW5TZ2dBdTkxcE54N2NJa2FDVEovOWNLanlQSzJSVElVSHdMRENTSDFo?=
 =?utf-8?B?cU16OU8yUE14SndvZ3piYWxRbVUyRGJoVjlCSnNwMktWQTQyWHNHY1NJMThE?=
 =?utf-8?B?NTFOWnVRQk8rKzljRE9JUzRVeGJ5TTRDOTd3UHA1S2kyK2VaS2hoZG0zYjI0?=
 =?utf-8?B?bGUxbHpCb1p1K0ZTL29KSFpMclZHUjh2alc4cVhMNjBOLzFxNm5YQy9PM21R?=
 =?utf-8?B?N2RCd09vcmJSWWw1MEw1cjllNk50TExtNldKK2hPYm1adVNabWFjRkxSdVRD?=
 =?utf-8?B?ZkdQcTBDWm5xUHMraGFCbnRrWlhobDhtWG9zQ09XenNFYVJHalFBckdwbmpk?=
 =?utf-8?B?Z0JoRjVKNHdXNkZWV0srNmtYdjVwOERFbmFkTjdqVTBveGNEUFpmVkpkSUU0?=
 =?utf-8?B?aWQ5alpHMnNLTTNuK0k1WkRuSlAxRkNZTkdWVHRHVlNVYXNlMkt5SHBjWlkv?=
 =?utf-8?B?SURuK3o3RjhDR29jejQ0U1hQWEhBYVl3WEVJc1VjbjZDVHcwS0RWeDBJd3J4?=
 =?utf-8?B?cGdHK3hmTEVDdTBuY081RVdGZnByYzdOajI3ZEdsZXZ1bnBpL1ZzTFJlVVhB?=
 =?utf-8?B?b1d1TDh2R09tR1ZKZDBwWUdtaTBJQjBHcjFmRzNnN0ZubExXZ2ZxeklZM1RR?=
 =?utf-8?B?T0ZxUzJ5TVZUTnh1aXMwd0xaNGQzT1BDYXl5Y3FvODFiMFhrbS9uS3NUb1ov?=
 =?utf-8?B?Q1Q1QmY4enhwcllNUjFyaTUyNnBGS2w2WDUwZkNvUTZXZW9mdGdweWRRVUpl?=
 =?utf-8?B?ZUNMVmpqRTA0eDlGNzBhSU56dkJBSWZXa2dpcHZveTFBNjRoV1Y1WS9tYk1r?=
 =?utf-8?B?YnE3VHdRZnpIem5uMHBFbDd6Q3AwRVh3MHhUNnlqUDl2dEVWTkFERVBMS2R0?=
 =?utf-8?B?ZVpmaFhMMWo4YUZGQlVKbjJNN29mZitsN1JCVDZRZjJURHdXTFpWNVlTWGJt?=
 =?utf-8?B?dUlLVGJrU1ZNVWpuc0R1V2krOHlmRURsZ2dPTHk2cUtUZkdqblQ2ampDQWdl?=
 =?utf-8?B?ZlNYSFduZE81NFd3TU1rKzBQcGhrdTRzWFg2Q3NJbjQvVzh4cjVjR1NyN05E?=
 =?utf-8?B?akF5b3FuZVQ1bjZiSUxyc1ZMcENlaGd0ZTFBamhQTzlHQ3lqbjJEeVZoQ3Av?=
 =?utf-8?B?RnFnM0FOcVpCTzhCVlV6U04xMkJ6YktUd0prNjU3bFdiMmVNaWVId1YwbWZ3?=
 =?utf-8?B?RE84RW5MeVlUWXdZcVVPUjVPSFJabG5MM1kxUXdGRnNrbXMzR2ZMVVMyNWEx?=
 =?utf-8?B?TURzSDVteUJNQVc2Z3oyTStvMTU4K0RIK1R2MUlVTkppUkJmTEY1WWR1QnhM?=
 =?utf-8?B?T2Y4c0F4SDBScEkweEVUZ2pEcHd0QSt5WjNmUTNYNTUySGpqR1J0SStPdVRX?=
 =?utf-8?B?L2IwTE1DaWw1cGIrbm93aGkvaG9yRkdoZzZUamRBUmNqYlF1Yis0SWlnamxS?=
 =?utf-8?B?ZzlVejczMnlVb1phTjR6RjRjbTl5R2lSeCtqUlRhQVN3MllFQTBFdWE1OFJG?=
 =?utf-8?B?SzJIa0VGZDFRbklkQjBrclA4SjljZDBsSXhOOXhnZVBBa2RCZjdWaElwaXha?=
 =?utf-8?B?eklkZTlRSWdUckJ1RDd1MU9QOTloNFpEd3NLUXdLUVZIaktYbFk0V2MxS3pw?=
 =?utf-8?B?TmRYZUY5V3lvenFrVmV4VSswTjBabVB6U3oraHJBNHhhQllhK0Q5dmVtQWU0?=
 =?utf-8?B?anNsMXRtZUtjWFJ3MzZDVTdUUnhqbUZkbUZJR2YvUEhlaHErMXY3WVlqc2Z1?=
 =?utf-8?B?TTBlSm5qR3ZCQWxwSERhbzNBYlJHVkZ6WWdnaDEyaTBrM2duZitVeUNudTQv?=
 =?utf-8?B?a0VSZnBHeGl1L3ZtREpjaW1ONjFRdnY0dkYwSE0xMmZiNHRCdndSSjJiSytL?=
 =?utf-8?B?SUdlanhYWms1ZnhHM3JjSTlVbzh5WVZYVTdraXU2MkFmMjRITHdhV0tud1pn?=
 =?utf-8?B?QTNSYzR1UmhIczk4cGhrV2JkOUZiWE5IV3c2Q1pxQUdOdlRHenlXMHpGR0VJ?=
 =?utf-8?B?SjBKK3Znc0tCR1lzZWVDS0JDRG5PeDdFV0NKRXV6V0hNdzVucXFlbnZTZnM3?=
 =?utf-8?B?T2U0a0FZS2JYWVVRSStOcnNhekNuWldkakkyNGEzTjM3WXBSanBqSyszZWUx?=
 =?utf-8?Q?ap5Y+4kR8uINTDVdTwxwm3o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 480c813d-0c69-48c3-02c7-08d9be31cfcb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 12:12:20.1154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo/qgY0h6aQUNaVW6nZnxly2iKiK9ZxoPWOB8CMmnv/eAi1hJgqtdyT7fXeeD3A5Mlsa03MnIZz5F1uEOBF54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5589
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, chen.zhang@intel.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/13/2021 7:45 PM, Dr. David Alan Gilbert wrote:
> * Rao, Lei (lei.rao@intel.com) wrote:
>> Signed-off-by: Lei Rao <lei.rao@intel.com>
> 
> You don't say why you want to move it - it's just a trace, what's the
> advantage?

I think it's not necessary to put trace code in the critical section.
So, moving it behind qemu_mutex_unlock_iothread() may reduce the lock time.
I will send the V2 and add some commit messages to say why.

Thanks,
Lei

> 
> Dave
> 
>> ---
>>   migration/colo.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/migration/colo.c b/migration/colo.c
>> index 2415325262..3ccacb29c8 100644
>> --- a/migration/colo.c
>> +++ b/migration/colo.c
>> @@ -683,8 +683,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>>   
>>       qemu_mutex_lock_iothread();
>>       vm_stop_force_state(RUN_STATE_COLO);
>> -    trace_colo_vm_state_change("run", "stop");
>>       qemu_mutex_unlock_iothread();
>> +    trace_colo_vm_state_change("run", "stop");
>>   
>>       /* FIXME: This is unnecessary for periodic checkpoint mode */
>>       colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_REPLY,
>> @@ -786,8 +786,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
>>   
>>       vmstate_loading = false;
>>       vm_start();
>> -    trace_colo_vm_state_change("stop", "run");
>>       qemu_mutex_unlock_iothread();
>> +    trace_colo_vm_state_change("stop", "run");
>>   
>>       if (failover_get_state() == FAILOVER_STATUS_RELAUNCH) {
>>           return;
>> @@ -870,8 +870,8 @@ void *colo_process_incoming_thread(void *opaque)
>>           abort();
>>   #endif
>>       vm_start();
>> -    trace_colo_vm_state_change("stop", "run");
>>       qemu_mutex_unlock_iothread();
>> +    trace_colo_vm_state_change("stop", "run");
>>   
>>       colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
>>                         &local_err);
>> -- 
>> 2.32.0
>>

