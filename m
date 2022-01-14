Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C6C48EA45
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:02:43 +0100 (CET)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ME5-0006Uw-Kv
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1n8MAg-0004KP-0W
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:59:10 -0500
Received: from mga05.intel.com ([192.55.52.43]:9335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1n8MAc-0006pM-SR
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:59:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642165146; x=1673701146;
 h=subject:to:cc:references:from:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DFg3REouP9LVhl8I2CFeIw4v3f4I4NFmLVjQ0PB37C0=;
 b=fXT+K1EsImN/LB9zeqYNPyUohtLvPCTZ3lm3/FZYrU8uob9mTkRQQEcA
 +z87pNokphWym+yUPu+qx3AbRwkBRS/sN23Wh8cHHWVhbquenNWw6mn+b
 u3VTKIEge2LPX7Zdb+/zt+iNBeFfBtgJMzPxOmNJI566Mc8wJ3U6q0VKy
 2t11kF9/RmYHLzxXzqr0SU6Fzo+cFc6Re+B7k19wPz97v2FGoCOH7dLch
 l+IrMp6rUKKyTk0LVvyJ/PoPXaFd5voNMGoavJTeq5/l+Gq/DfE1omVd9
 LF45bohxhrQ3DpZW8CcL6NAo4NH6/Z3fT9N7nd01OzoMCUmC3YrWYuzPp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="330588675"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="330588675"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 04:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="624322488"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 14 Jan 2022 04:59:03 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 14 Jan 2022 04:59:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 04:59:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 14 Jan 2022 04:59:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIRejaRpZXlMUQUTv4Gcnu+SyLgep73hp4EHb+effxFTU6f3LAX2Wd8kM+wfbvFD8g+pSkgLaYvZZNmhCupxg0qsiMDNVyYKSFYJC8jkHRMyb+AUjGN/icmpZCTzwRftKp51dS4KxYOc23mP+YxxSQNnMgdpAzauoI/dRg38wJ+ZL11EOLS6BYPzz6GOVFNZLJbVtIsqFSoDZWqBMZGfH7lGT3WOMzLGd9m0T7gnQawagoABCTlcttNVO7WcH4WS7rgQXQuRJ7ohnrA7VRG7HsPyGgPne6GbTHIzNg7CP+oGv4UCzgJmMdSElU5hlspMk3GlNsCK3fzy6KcjKDAqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmMdUhC7RXra8MieQY8h8ILeqAn1/fDBQslsbnbvfkg=;
 b=c1M73vtvgFtmvrMEWzqSkkQvgZ1z3ha6W+kcY4w2fgMS6jCvjcj7bQaRrZPxaDzBEe1qiQfi7x00xEDCiOiYgh5g7+ZI6ieK2eghMn4Hd+ZzNA/0cslLCs9HG7MhvbnFHydHUZH7EPmLFkuRHA3uu3c/iIuDw3hCCZ2LdavzyirFEQcNCtpllzaCHLkaggeAYkg6h/scWsLeYERRnS4T+DAd5KXpzWu6rAwVzFg2SmHXc9y/QGTOo4alWse/nifhczJ5vUb3+iXVtVRsBZ57SQKUeBNIRdUnaj18lgHoAP+P4FfyccOnaYxB4FHx5cITh43VONE5YSw4ga9Gfi0/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM6PR11MB3146.namprd11.prod.outlook.com (2603:10b6:5:67::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 14 Jan
 2022 12:59:02 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::e504:eb88:49e1:fec5]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::e504:eb88:49e1:fec5%7]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 12:59:02 +0000
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
To: Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com> <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
 <YeEifFCR6Rc5ObGg@xz-m1.local>
 <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
From: Liu Yi L <yi.l.liu@intel.com>
Message-ID: <51098548-51f0-04c8-2169-9ce3d43678a6@intel.com>
Date: Fri, 14 Jan 2022 20:58:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR04CA0079.apcprd04.prod.outlook.com
 (2603:1096:202:15::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65625a8d-844d-4074-2651-08d9d75da322
X-MS-TrafficTypeDiagnostic: DM6PR11MB3146:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3146F6D7DE6C154ACECE3C72C3549@DM6PR11MB3146.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uadB8TZr6TCYLZ9N0kY+pEhx6MK15C0OYsPp9l/UiobS177QPC0HyYR0zT8UYYNExK7F8CxnuIAh2x9oMvZ2t2TTvfhhIq6W0gZCHO4fK75oDtunv+maxhGMuhlHjb8fXRy6ijymVsOmhEdGGfL6AJ3XtPyOG1RZjLcMMKmVnJmm/XpoQveXLo7cLmNat6W0r8FmzETnS1NnyHWl0Vn/Gec6zjMwhJV7MshCXAo+f4C754aexBMKatEmDIEiZLYlkI75GxjWrT3wXI1MJwwtXPCmH03mma+TQfnG9AaOn2WcsU0w2iLWDcXeDi5dvGCBbSMRpcAcG3YEuSUesgb0J/eXI1GZWvzPGetlqlRoC9RBk4JBlvU2PIfNaa+qlxsg5alJM+kxtTHDaKGCrAoJV96LJdaZKXBqWctUF+ynGoi0rGNbUANTyebBMb2Zat8xIYJCas45KPDQgYt7EaELLjPEdkOP3qbMiOIgcokfzHYCo6H8GgFV3iZd+shaaCZd3uv8neSOaqtGE64hjWgwuTNnvO0E+lGz9Yt2S0ZpQoTMYlqPbvDo80+2AQc5jAihUd/IdJxOukwFfFcoDKBL73M6bzsa2+iKJ5MM0QMbu//haWfh8FX7FTfJMxwntSoD07nlmq6RcuBno6Ij046plPzLGXqYFOgk2MpIZ/CTm7PsZLLYSQjwGeoBNKgZrzbuaTUolO1xofiSRxcvZFr/YscoQaXycjVaO9cnMMl6TxRBnEJJoYi7dtxlwIuupJ4d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66556008)(66946007)(83380400001)(36756003)(316002)(82960400001)(8676002)(6666004)(2616005)(508600001)(6512007)(26005)(53546011)(6506007)(6486002)(186003)(8936002)(2906002)(5660300002)(31696002)(4326008)(31686004)(38100700002)(86362001)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGg5eitleURDZ2tpMlkxT0cyTitlMG81MTNQdDVkQkxvZTg3SlVCdVlJMkNx?=
 =?utf-8?B?MzlPWUN1L05BTXR5WHhGUlRheHEvRXk3dzZBVy9KR3dUVEZYQXM5SWVjNFNa?=
 =?utf-8?B?NWg3ckV6ZVRKTGdKaktKZUdrcGY0Ym1HRWJHcDNFWUdweEVWSHN0VjlMaThv?=
 =?utf-8?B?NXVNWHVJUTNCQUFmOCtsUVA4UEVEaklHVWlIc2lJbk81a01BczMrRnpJQ1Bx?=
 =?utf-8?B?cExiU2Qvd0hRMmQweDh5dDBDN2pkdnNidmNmN3BiMFNpSnFyWXhYTUIxWkZI?=
 =?utf-8?B?amlmL2tycVg3cGxQZm5nWFgveGMrWTlaWktwTE1pZzNsTjlhUHV2dll2RXFn?=
 =?utf-8?B?QitOSVg0UVJDTC9wRkpPUitEeGVWWHVjVHNURFkxSVl4SGNsazJSbDAwMnRV?=
 =?utf-8?B?cVNlM0s0WE4yQTk5V0NGRkM0WXpzd2hrRVhGaHlESnEzN3M2R0NRajBGM2Zz?=
 =?utf-8?B?U1o3cnJsVW5FMEhDR01jZzBlVm9uSzFKK1RWOXNaMnFpOFcwRlRNUVBEbDRK?=
 =?utf-8?B?c0lDN2RnRXU4NzJTSGFTYVFUenB1emZaeG1Xb0RoZ2Iydm56OGR4OUJPOHBL?=
 =?utf-8?B?LzY0Y2FqWGhBdmdzbHozU0JuellWUUs4RFlFMlV2NkhZSml3cE5SRGNGTFB4?=
 =?utf-8?B?NXlDZmxSQTExNEJsMk1hblZ4d1FYMG03KytDWjJ6UDVOdEoxTmpOYTBTcUU3?=
 =?utf-8?B?cVhjRDZxNndqZjB5V3FlQ2pZOEI0cy9YYmprMmxYS0d3dEhGQVlPWGRJeWJF?=
 =?utf-8?B?aHVwQTYyTy9OSjQrbEIvenlGbDRESlFZYXA4cC93ZHIwL0tSMUNzQ3pPcVd0?=
 =?utf-8?B?OUJsdzF3VE1SQk16ajRUNTN6SWNiZHg4WXBYR0lhR3VIREEvek9MNEhlbUxs?=
 =?utf-8?B?Syt6Q01va2RpRGQ3STFTN0I1Yk1JWkNHbkNtdE5DcWIwR255cmtLNkNRY3RV?=
 =?utf-8?B?WGNlNmJQVjdjWm5ja3ZvSzh6YnV2NFl0YzZ3a0l6eGlXTkVHOVVRd2hMNG8w?=
 =?utf-8?B?VERYK0RSaG45UHFCMnRSbjhLWDd3dC83NWg4UU00UFFHWlF6TkVXWG5RdnIr?=
 =?utf-8?B?Z3lIRGo1anM4Y0llUWxMaWRDRDFleWk0TGJkOE95QlZ6dmpJOEhPYkRWbThr?=
 =?utf-8?B?RXlwY3RhR3VIWUYxc0lVa3ArZkpGRkx6aHhqb0xtM0V3ZmRaeWFFVUxsQlcw?=
 =?utf-8?B?UGg3QURUY1FpU2VGcXJHeUZwbUZxMFcrZGJ4UTdLUTdwQStGMnpobE5Xc1Rs?=
 =?utf-8?B?dXk5TTNhMlBqVElsU2Fwemg3OEZ5VEdDQmY0L3FpcE50UEtiMVJlOWNXQytC?=
 =?utf-8?B?YnV4Zit6MXFBNTFTTU8rTmdxcWZ3MHJSUnJlNU1LRDlnRDVBZnhQd1Y2Y3Rv?=
 =?utf-8?B?bTE3NlR4VUlpdGF0OW9veFhMc1k1akhWVDRHQmUreVlWamNseitrN1E5SlBu?=
 =?utf-8?B?NEhzU1RmbjRSRFZOaHp5ZC9JYWVBL3YwUytOc01uU1M5ZDhVRzhWRW9DRzNm?=
 =?utf-8?B?SE9xQ1VWL1FiS3dyV3IvdDRNcmR3TGg5Ly9KMlQ5TEdnVzZQdXE2dWt0UThT?=
 =?utf-8?B?SDBBdFFkNUNJYlFyWk1ITHdCa09kQ2kwb21PTWFrZ0l0bURlODhDbWh2RnVN?=
 =?utf-8?B?VnhEeDgrajcreStHQjIvV1BRQlNtTW5ucXRYeUpSNmxTWkNvb3FSd005Q2x0?=
 =?utf-8?B?aTJQVjRyMGx6Mm82OWFhdmdOVDRSVStJS0RiM21MZWpONTFkWTcwaFdjVldJ?=
 =?utf-8?B?SXV3Q0doQ2gyOUNpazdvMnhPaDFmckZvT2RCZmJ5ODVIK2srdkxEYTVrUnRX?=
 =?utf-8?B?OHhGRGJxZGFWRCtDdTJNQUViVU45cmxzU2Y2UzVpM2p0enphSHFlY0NmdmlN?=
 =?utf-8?B?bmwxNm1oWXpGd0w0aytjbGFIbFM5SUZZYzY2em1mTE5DampDOE9CUnprc2pO?=
 =?utf-8?B?TFdXQjBHSW1mNHBEcEdKRjBPZkJsM080YlNwc3I0U3lmVG0wUnhycXZhYTFU?=
 =?utf-8?B?MWsxL3BIK0hVdjV1cFhabHc5NkhtdnJpOEVZT0psRkdkT2F0T3p2bTAzUlZv?=
 =?utf-8?B?ekhkTFl6MGVOYVdXOGRHTGcwNTUvbFI3R3lsM2NZV1ViTE5WOHNXazNaenQy?=
 =?utf-8?B?NHc1WW0zK2t2cEJtS2MxNXczZzdlREZEVFNsREI3Qit6M2ZSVFdXeHcwWnVU?=
 =?utf-8?Q?hcNQm8ui8cHgI95wL96OC6o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65625a8d-844d-4074-2651-08d9d75da322
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 12:59:01.9584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsEaapopx8nPq3yzr79bgjawdM3330LZjC3WRy9HF/TnN6CiqkXKcsslNh7SGI12xsVF7v8IVmYnYir4Sf3pxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3146
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yi.l.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: yi.y.sun@linux.intel.com, qemu-devel <qemu-devel@nongnu.org>,
 mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/1/14 15:22, Jason Wang wrote:
> On Fri, Jan 14, 2022 at 3:13 PM Peter Xu <peterx@redhat.com> wrote:
>>
>> On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
>>>>> Right, but I think you meant to do this only when scalable mode is disabled.
>>>>
>>>> Yes IMHO it will definitely suite for !scalable case since that's exactly what
>>>> we did before.  What I'm also wondering is even if scalable is enabled but no
>>>> "real" pasid is used, so if all the translations go through the default pasid
>>>> that stored in the device context entry, then maybe we can ignore checking it.
>>>> The latter is the "hacky" part mentioned above.
>>>
>>> The problem I see is that we can't know what PASID is used as default
>>> without reading the context entry?
>>
>> Can the default NO_PASID being used in mixture of !NO_PASID use case on the
>> same device?  If that's possible, then I agree..
> 
> My understanding is that it is possible.
> 
>>
>> My previous idea should be based on the fact that if NO_PASID is used on one
>> device, then all translations will be based on NO_PASID, but now I'm not sure
>> of it.
> 
> Actually, what I meant is:
> 
> device 1 using transactions without PASID with RID2PASID 1
> device 2 using transactions without PASID with RID2PASID 2

Interesting series, Jason.

haven't read through all your code yet. Just a quick comment. The 
RID2PASID1 and RID2PASID2 may be the same one. Vt-d spec has defined a RPS 
bit in ecap register. If it is reported as 0, that means the RID_PASID 
(previously it is called RID2PASID :-)) field of scalable mode context 
entry is not supported, a PASID value of 0 will be used for transactions 
wihout PASID. So in the code, you may check the RPS bit to see if the 
RID_PASID value are the same for all devices.

Regards,
Yi Liu

> Then we can't assume a default pasid here.
> 
>>
>>>
>>>>
>>>> The other thing to mention is, if we postpone the iotlb lookup to be after
>>>> context entry, then logically we can have per-device iotlb, that means we can
>>>> replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
>>>> which can also be more efficient.
>>>
>>> Right but we still need to limit the total slots and ATS is a better
>>> way to deal with the IOTLB bottleneck actually.
>>
>> I think it depends on how the iotlb ghash is implemented.  Logically I think if
>> we can split the cache to per-device it'll be slightly better because we don't
>> need to iterate over iotlbs of other devices when lookup anymore; meanwhile
>> each iotlb takes less space too (no devfn needed anymore).
> 
> So we've already used sid in the IOTLB hash, I wonder how much we can
> gain form this.
> 
> Thanks
> 
>>
>> Thanks,
>>
>> --
>> Peter Xu
>>
> 

-- 
Regards,
Yi Liu

