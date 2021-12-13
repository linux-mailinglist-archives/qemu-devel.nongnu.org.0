Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27CD472215
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 09:06:44 +0100 (CET)
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwgM7-0002pI-7t
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 03:06:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mwgIe-0001Rt-Po; Mon, 13 Dec 2021 03:03:09 -0500
Received: from mga03.intel.com ([134.134.136.65]:8525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1mwgIb-0006fS-1f; Mon, 13 Dec 2021 03:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639382585; x=1670918585;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yJQbqNrdW4xRtQ2Tdb2uqyXt5Wevwkf5aD8fCWAQffw=;
 b=mcKYEn297vQK9haOzDBCfUkHmHES5Of42wzVQ16RCueBMrTfuPWajw0M
 Plhz1i2W7HTmgVqq8Xz5fBdnZFYdcG+EeD9NTC6adSEcBLENEX8LFO7t0
 YvMYZeSSumXftY8s22eMPomGmpJygW2Q6pR7aLcODrgVG2mtZSeE1Zszg
 EbxYso5ZCXXEv6ePNgcVgz7S9hX4pPhNl04vPRf7mLtgEoyXezwwtEPBA
 DHDmIFnFnN6L54hrLi7rIS+XnqFSvpGr81fyrqa44ZggXJSohdzAbLj5A
 5/C9BLHdCiysRH9lHuvq6bs4MO/R3BqLZB4EfhdIMRWSHmIf94U8/T65h A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238625735"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="238625735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 00:02:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="464528668"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 00:02:56 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 00:02:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 13 Dec 2021 00:02:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 13 Dec 2021 00:02:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 13 Dec 2021 00:02:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYhHOQk8kyjIYbZJDb4yKlMFbYI1OfIJxkoqMnySV3RKadcmDLHn9rwe2lcf6oAuITVP5T8dehqYfdE12A4G+pnozMIm+ND6P80s1HM6tyc6ZOkLIy66WV6/m6NbgZ1hCB8OpvuixGfjTlSytDG9RiAmu3AGwV9+y4k3C2X+8lMz2Q9B3YzPLYG2k7Mi2AI1hkrpg23s1Xmkuqxj5Ge48cP4ccE4XX8D1OwwBcxBcPyeoaEPzfdfI38mO5Njs6NoYldKFsOjf2aYkLTs0ky76OmyHYpk2iqGFb4hPzhWUeUxLU+K+aS0Ha6dkQsRVYvhxjFvETotcj7fsRAIVoUF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyWyd1qlDdKZ65Mnc4D+YXoyOzlyZq2vjD2ckYsuW5E=;
 b=IKyThwg5wTp9g9T+WL0IQgMVu/PKPuk9VS2SeFCAm/w5gqDssBD1oj9tm26E1saR2UUqr9ENRi7FiD54PxYv0W0dc1JBasrUC+surrQsaahky/ppKHFmfnZjijGAFVI9VNOxYddB0W4wNJZ/SMsZUhSg6txZPgA+OlFzKCcsVCPqZ/rxLVqzkkX9Mmsz/qudrx3Asp5mTs3OE9mR+csv0nGV3cOwxSksF3lOOmKV14t03mTDwc3gg+CZwJxmxC6vfwMC6a1m34+qEq2XFqWeKPnaYiN3fP6zHTI9TJoyxmnAxJt1LnFbLNLC9q27PuOKCrsXirSOpOPIIxBedJeA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyWyd1qlDdKZ65Mnc4D+YXoyOzlyZq2vjD2ckYsuW5E=;
 b=iQXfWDPSOu6X76DrCVw0g51J/8Jx76ZLKOrRyi7ilGSbHGU604SLqHl/t1C9tQ+h37UfmgwbrjHiX0FWfI+4W69wG1H4Vd7AHnnipqQz6AATa/pnlabR0WzXH4+pipuXJpi7aoOp/lmK3qwxJX7kTm+9uB7s1UtQfzj7iNbZ/FM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5591.namprd11.prod.outlook.com (2603:10b6:8:38::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.11; Mon, 13 Dec 2021 08:02:54 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::385a:cb1d:904b:f18%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 08:02:53 +0000
Message-ID: <3bfce568-8ec4-420e-482d-8af30de19ab6@intel.com>
Date: Mon, 13 Dec 2021 16:02:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Content-Language: en-US
From: "Rao, Lei" <lei.rao@intel.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211201075427.155702-1-lei.rao@intel.com>
 <Yac8B76dAulyx+2T@redhat.com>
 <DM8PR11MB5640D2F156E53A0CD644AC71FD689@DM8PR11MB5640.namprd11.prod.outlook.com>
 <a1706788-2f28-9948-f68f-a6fd51b81fa3@virtuozzo.com>
 <836f8fe3-5262-d179-a66a-325935ec7005@intel.com>
 <YaiJgpEahjc1OyR4@redhat.com>
 <baf86cd2-7b88-7206-a215-a9ed91c16fa2@virtuozzo.com>
 <22da77b0-114a-49b0-9ec5-588556697fa2@intel.com>
In-Reply-To: <22da77b0-114a-49b0-9ec5-588556697fa2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR02CA0176.apcprd02.prod.outlook.com
 (2603:1096:201:21::12) To DM8PR11MB5640.namprd11.prod.outlook.com
 (2603:10b6:8:3f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09e2c713-0222-4483-2538-08d9be0ef73a
X-MS-TrafficTypeDiagnostic: DM8PR11MB5591:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB5591E62F07F3C04F4E94EF58FD749@DM8PR11MB5591.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BscxUT2uYLiGygUpOpO6TeTMfWYtlidEPgCv7RmlFFEidEwbYAOqOz8REv6801TZgBIHAknvtQEPnfebHNrwvQei4pOWk4NfSHL9FS9ADMyG5fxl+i1tM6ZoO15rGYj+fFTguWLhHnQYa5FUric/gqeOa46rVsm2aiZyrVps4PzO0kT9wg0qI4MVx2M/JYpJtkDeiWv3cQZFkW+DBynuRTRmTGYllBa/V4Fx4z96/QdloQybo54IrNqXGOn0t+hGXXeAJl18P7/tDQrtam0qYC9ZQWtI8Gsnfv4t1kjhDPiQpMkB6zIe1o+MBpTV5Kr82Vr0PWJHFYkNCzPoSB5TJFhC69trs9Uka7TckQipDisVKUC5cdk+DRAzdyj/0mvIqvLt/M6DH+3snp6C6Pw1dcyPW+ZfoI4/QZLX+eEex7Xe1q+NBM+3BvzS3Nx1Lzuk6uGRORHf58sCTpTOUqqkQRXzDhzY9cxIRaRr7ABVYWTOHKaS94uKEqTs43WRq1cKXbmH9IGV8T3gkmPM3kI8CqlopsX2hxrWei6owGMZXG8s6ZxpR+nO86BR8q8GN8HnRa798hOIqJdkhBPJpRl6j0sCMIO36kaSaIPTrdaMIAkUTa/AxhEWRdY3FAQkReE25e3YuGNpQ4NTP5hKqMtszKVrUDXsrqo7V0YcIESY96RdVAl4HEkUqJLOE8ZlMyZH4+PpbgzXHTHKsSQHiTppIqfOkjfghwNXn2SEALNvoLjQlCZ8XXHszKP4AsWZp24DAu9TswsOzrZOX00bkSL1EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(36756003)(86362001)(316002)(4326008)(82960400001)(6486002)(38100700002)(8676002)(110136005)(2616005)(26005)(30864003)(31686004)(31696002)(6666004)(53546011)(5660300002)(6506007)(54906003)(66476007)(2906002)(508600001)(83380400001)(8936002)(6512007)(66556008)(66946007)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU9UWUs4SHp0R1Zjb05ESlVuVzMybDhzSU1HeWdHZXcvS1BoOTFFOWt4Vkw0?=
 =?utf-8?B?UEh4MnBVcis5YzZjSzFBSTRzNVErY2NJK3dJNUE1NmM2UXlLZXBqRUNEVEll?=
 =?utf-8?B?ekh4YjEzQ3g5TUhxcEV2SlpaL0lDZ0k5NmNGbEhTMTNSdUo5U1BRR2hGUXph?=
 =?utf-8?B?U1QxK2ZFb3BRL292MXRqcktibTZRVEE2VmVRVDJhVmFUWFZBTmIyZDN1ZEhV?=
 =?utf-8?B?Wjl1K1dYOTg3N0pWS2tiNjBZOUlhTTZTUysxeTdCYkxwY0hxeG9pMlFCNXdu?=
 =?utf-8?B?VHB4aStmU1E3NGtLdWE4SmhKVVA3UWJHQk5PSDcyd2NHZmw0eUNPcERsbTNq?=
 =?utf-8?B?aUlQUXd5MHcxNUdZSDN3WUl3YmhWL3BqRVlLeUcyK1F6WUtrTmN4aDhERUU3?=
 =?utf-8?B?a0lUM1J3NXM5VEprb1dvU2J3R2tJWmZTd0NERUNzMTJjOUlvWWR3czhnUmRZ?=
 =?utf-8?B?Ryt3bWFPYkJxWDZpV0h3WnRSOUNJRGV4VGZMZk95dlFmczlXNzRJaFhhVTRv?=
 =?utf-8?B?ZllQMCtrbDJCYUZ3M0xLTllRaU5NMU14RUpMZ2ZTRWpvMSsrS1BndUNMcnBq?=
 =?utf-8?B?RnlleVozREEwT1NaSmQxZ2FMcUhpUzJwanNSWkdkb2NZUGJLZVpBQWhWVm45?=
 =?utf-8?B?cXljZmM2ZDFOV1pOQWNQVjlwMmp6aU50bEJNZE4xdFZmUEE5eVRYR3gra0Vi?=
 =?utf-8?B?ODFlWXM4Nk9uU0xvMG1WWEhKektyekVIWVVtdTVFbGVSQnAxeFp0OWoyZDRt?=
 =?utf-8?B?aCs4Z2FUODJyUlZvNHRjSlhQZFdUSjAyN0h5NXRtRFIwYnlKZjVobzdCNytt?=
 =?utf-8?B?a3o0dklDelVqMWhWR3Naa0VDbFJkS05NOUdNZXFmYlVqT3llZHEyWm9EaStL?=
 =?utf-8?B?bXhXMStxV1pmL3ZOa3BZT2tjUGUvazY2QkFjSGRFM1ZlYTdqR3hRQzJkRjJ3?=
 =?utf-8?B?Qy8wbWZ0cDRISGI2ejJSZDZzUTMreHVlVXQ5QUI5Wk5LTzJmRVNDdG5GL3J4?=
 =?utf-8?B?MGpCdEMyaU9wbThmdEFjR0tsaUxkUER2bWgyV091TXpjaEhzWTRyckRWd0U1?=
 =?utf-8?B?cjNldWptYkxrS2RDREpZcW01cFcrNWRJTFA5QjZ6eEUzd3ZTbHFNclFWTHc5?=
 =?utf-8?B?akV3ZDFjZjZyWmpMeER1aXZ4eVFSUFBLMng5czdnVlVjWHRyMXp2SHlvbnpQ?=
 =?utf-8?B?STZoTDlQamhHRkFpRHFvQmRwUm5hTFFSTnZ3NE1wTTA3aFVGUThaZFVSVk95?=
 =?utf-8?B?WEFyRG5laGRRdmFXMU9rVnExVHcyWVYyUkYwTVpOU3FjK1hPUmNEelJkeDNn?=
 =?utf-8?B?YlF2Nit2cHU2bDYzUEdWV3VIdDZqL2xoNityS2MrUFZnbGN1ODNzdGVnQU0v?=
 =?utf-8?B?U3Z0dlp3bm5udC9NeDUzdHNUMnlDV3NXN0NHN3dMT3V2WWFsSDczVjRtdGlV?=
 =?utf-8?B?aXhLSDZobmt5aHlXdTl5Yi9uMHNleWp0a0k3NnVJWHUraWgvZHNqMS9HTzVo?=
 =?utf-8?B?VXBKTjFMUThZMGdTTWo4MDVHVHVPa3FhYTAvZjNGTmNLU0YyM1VJcHdJT0Fh?=
 =?utf-8?B?VUZSYVRTNGt6QTUza1hnZVQ4c0gvZm04L05Pc0xhclhObzdRMVlDUlhMUkZJ?=
 =?utf-8?B?d0lxMTVyaW8vSTB0NEpwQjJPQ3FEZGo3Nk03a1lnRXFsaldpNVBKaWNmdzFa?=
 =?utf-8?B?NC8rMDdYUjFQRW42cTZaWG8vWlVKaVNkMGEwSEJOb1dWZzkraWdpRkRJVFNr?=
 =?utf-8?B?bHQxQy8rbE52b08rUXFqbGErN2FrQ3RrQms0Y084aExiMkJWZ2s1SzBmdXlW?=
 =?utf-8?B?dFRCRmhER2Q5ZkdZSDg3dXFIcDA5U0ZLU1RWMSs3U250ZVIydFZMQXAyK1dr?=
 =?utf-8?B?NmhJeG9YYm9OakI4bHlWQVJwcjVUTElMQlkySGtLcWZCdTJ0dDNETTdzbGxx?=
 =?utf-8?B?czNJM1FIbGQrcThJemxXWUZQeldoY1ZOOE41NkdiVlV2UzArK2N0ekN1UmlP?=
 =?utf-8?B?dVJ6SHkwckZtNEIxQlNDYlJJem9qaVhLaklvbm5vR1Z2RmVHamk3R1pYWEMz?=
 =?utf-8?B?TjhPNHNuaERkL1k1TTE3clQ2cHIyZmlwd1dpdTJhSUlOaWNncUV0RkIyc2tm?=
 =?utf-8?B?S0NKdG5TdW11a0xCT2pUS3FzRHhWNE90czJiRCtCOUdqdjNrTHlGd1NNb05I?=
 =?utf-8?Q?jkDLQT1gKCdDACQIrJ838fM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e2c713-0222-4483-2538-08d9be0ef73a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:02:53.9206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/LKDt/Eagij5taefFNuAqQrwGYOd5iJhGNPanmz6uuqDuP8lhIke5DmSMxk9n3xewOJ477srRn9KEpg3y4jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5591
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -84
X-Spam_score: -8.5
X-Spam_bar: --------
X-Spam_report: (-8.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.093,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/3/2021 9:26 AM, Rao, Lei wrote:
> 
> 
> On 12/2/2021 5:54 PM, Vladimir Sementsov-Ogievskiy wrote:
>> 02.12.2021 11:53, Daniel P. Berrangé wrote:
>>> On Thu, Dec 02, 2021 at 01:14:47PM +0800, Rao, Lei wrote:
>>>> Sorry, resending with correct indentation and quoting.
>>>>
>>>> On 12/1/2021 10:27 PM, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 01.12.2021 12:48, Rao, Lei wrote:
>>>>>>
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>>> Sent: Wednesday, December 1, 2021 5:11 PM
>>>>>> To: Rao, Lei <lei.rao@intel.com>
>>>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; eblake@redhat.com; vsementsov@virtuozzo.com; kwolf@redhat.com; hreitz@redhat.com; qemu-block@nongnu.org; qemu-devel@nongnu.org
>>>>>> Subject: Re: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits cleanly in some corner case
>>>>>>
>>>>>> On Wed, Dec 01, 2021 at 03:54:27PM +0800, Rao, Lei wrote:
>>>>>>>       We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
>>>>>>>       The patch fixes as follow:
>>>>>>>           #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
>>>>>>>           #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
>>>>>>>           #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
>>>>>>>           #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
>>>>>>>           #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
>>>>>>>           #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
>>>>>>>           #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
>>>>>>>           #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
>>>>>>>           #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
>>>>>>>           #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
>>>>>>>               at qapi/qmp-dispatch.c:132
>>>>>>>           #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
>>>>>>>           #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
>>>>>>>           #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
>>>>>>>           #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
>>>>>>>           #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
>>>>>>>           #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
>>>>>>>           #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
>>>>>>>           #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>>>>>>           #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
>>>>>>>           #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
>>>>>>>           #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
>>>>>>>           #21 0x00005563d658f5ed in main_loop () at vl.c:1814
>>>>>>>           #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8,
>>>>>>> envp=0x7fff3cf5c2b8) at vl.c:450
>>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Lei Rao <lei.rao@intel.com>
>>>>>>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>>>>>>> ---
>>>>>>>    block/nbd.c          |  5 +++++
>>>>>>>    include/io/channel.h | 19 +++++++++++++++++++
>>>>>>>    io/channel.c         | 22 ++++++++++++++++++++++
>>>>>>>    3 files changed, 46 insertions(+)
>>>>>>>
>>>>>>> diff --git a/block/nbd.c b/block/nbd.c index 5ef462db1b..5ee4eaaf57
>>>>>>> 100644
>>>>>>> --- a/block/nbd.c
>>>>>>> +++ b/block/nbd.c
>>>>>>> @@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
>>>>>>>        assert(!s->in_flight);
>>>>>>>        if (s->ioc) {
>>>>>>> +        qio_channel_set_force_quit(s->ioc, true);
>>>>>>> +        qio_channel_coroutines_wake(s->ioc);
>>>>>>>            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH,
>>>>>>> NULL);
>>>>>>
>>>>>> Calling shutdown here should already be causing the qio_chanel_readv_all to wakeup and break out of its
>>>>>> poll() loop. We shouldn't need to add a second way to break out of the poll().
>>>>>>
>>>>>> Calling shutdown can wake up the coroutines which is polling. But I think it's not enough. I tried to forcibly wake up the NBD coroutine,
>>>>>> It may cause segment fault. The root cause is that it will continue to access ioc->xxx in qio_channel_yield(), but the ioc has been released and set it NULL such as in
>>>>>> nbd_co_do_establish_connection(); I think call shutdown will have the same result. So, I add the force_quit, once set it true, it will immediately exit without accessing IOC.
>>>>>>
>>>>>
>>>>> What do you mean by "the NBD coroutine" and by "forcibly wake up"?
>>>>>
>>>>> In recent Qemu there is no specific NBD coroutine. Only request coroutines should exist.
>>>>>
>>>>> Forcibly waking up any coroutine is generally unsafe in Qemu, most of the code is not prepared for this, crash is normal result for such try.
>>>>>
>>>>> Also, there is good mechanism to debug coroutines in gdb:
>>>>>
>>>>> source scripts/qemu-gdb.py
>>>>> qemu coroutine <coroutine pointer>
>>>>>
>>>>> - it will dump stack trace of a coroutine, it may help.
>>>>>
>>>>> Also, to find coroutines look at bs->tracked_requests list, all requests of bs are in the list with coroutine pointers in .co field.
>>>>
>>>> I am sorry for the unclear description. The NBD coroutine means the request coroutines.
>>>>
>>>> About "the forcibly wake up" I just set the receiving to true before qio_channel_writev_all() in nbd_co_send_request()
>>>> to ensure that the request coroutines can be awakened by nbd_recv_coroutine_wake_one(). But that's just a test.
>>
>> I'm not sure that it's safe. On nbd_channel_error() we call qio_channel_shutdown() - it should wake up everything that sleep in qio_channel code. The .receiving field is only for nbd.c specific internal yield point.
>>
>> Could your change itself lead to the crash I'm not sure too.
>>
>> Still, on normal execution paths, there shouldn't be a situation when some qio_channel_writev_full_all() is still executing during nbd_co_do_establish_connection(). If it is - it's a bug in nbd.c of course.
>>
>> To check it without changing the .receiving field, you should print all stacks of nbd request coroutines at the point of qemu hang. What they all are doing?
>>
>> If one of them is in nbd_co_do_establish_connection() and another is in nbd_co_do_establish_connection()  - that's a bug.
> 
> OK，I will try to reproduce this bug again, but this may take some time. Previously in our stress test, it usually takes two or three days to hit this issue.


The bug can be reproduced in the latest QEMU. But the root cause is different due to QEMU code change.
The gdb stack is as follows:

#0 0x00007fe00c53dbf6 in __ppoll (fds=0x7fdbcc140f40, nfds=2, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
#1 0x000055c67de72a11 in qemu_poll_ns (fds=0x7fdbcc140f40, nfds=2, timeout=-1) at ../util/qemu-timer.c:336
#2 0x000055c67de43fab in fdmon_poll_wait (ctx=0x55c67ea73ca0, ready_list=0x7fdbec9fe730, timeout=-1) at ../util/fdmon-poll.c:80
#3 0x000055c67de4387b in aio_poll (ctx=0x55c67ea73ca0, blocking=true) at ../util/aio-posix.c:607
#4 0x000055c67dd1230a in bdrv_drain_all_begin () at ../block/io.c:675
#5 0x000055c67dd1271a in bdrv_drain_all () at ../block/io.c:726
#6 0x000055c67db3b1a2 in do_vm_stop (state=RUN_STATE_COLO, send_stop=true) at ../softmmu/cpus.c:268
#7 0x000055c67db3bec9 in vm_stop (state=RUN_STATE_COLO) at ../softmmu/cpus.c:658
#8 0x000055c67db3bf9d in vm_stop_force_state (state=RUN_STATE_COLO) at ../softmmu/cpus.c:707
#9 0x000055c67d8159da in colo_incoming_process_checkpoint (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:685
#10 0x000055c67d815e3f in colo_wait_handle_message (mis=0x55c67ed0d550, fb=0x7fdbcc135f40, bioc=0x7fdbcc02d010, errp=0x7fdbec9fe928)at ../migration/colo.c:815
#11 0x000055c67d81604a in colo_process_incoming_thread (opaque=0x55c67ed0d550) at ../migration/colo.c:883
#12 0x000055c67de47e1d in qemu_thread_start (args=0x55c67f1bb380) at ../util/qemu-thread-posix.c:556
#13 0x00007fe00c625609 in start_thread (arg=<optimized out>) at pthread_create.c:477

 From the call trace, we can see the thread of COLO is hung in bdrv_drain_all(). Specifically, it is hung in blk_root_drained_poll().

After analysis, the root cause is that, when the QEMU is draining IO, the nbd_drianed_poll returns true because there are some
IO requests not completed. This causes aio_poll having no chance to return.

The data dump of the NBD client is as follows:

(gdb) p client
$41 = (NBDClient *) 0x5639f19754a0
(gdb) p *client
$42 = {refcount = 3, close_fn = 0x5639ef270bd4 <nbd_blockdev_client_closed>, exp = 0x5639f1d769d0, tlscreds = 0x0, tlsauthz = 0x0, sioc = 0x5639f1d8aa20,
   ioc = 0x5639f1d8aa20, recv_coroutine = 0x5639f183bb10, send_lock = {locked = 0, ctx = 0x0, from_push = {slh_first = 0x0}, to_pop = {slh_first = 0x0},
     handoff = 0, sequence = 0, holder = 0x0}, send_coroutine = 0x0, read_yielding = false, quiescing = true, next = {tqe_next = 0x0, tqe_circ = {
       tql_next = 0x0, tql_prev = 0x5639f1d76a28}}, nb_requests = 1, closing = false, check_align = 1, structured_reply = true, export_meta = {
     exp = 0x5639f1d769d0, count = 1, base_allocation = true, allocation_depth = false, bitmaps = 0x0}, opt = 7, optlen = 0}
	
We can see the nb_requests = 1. That means there is an IO request not completed on the NBD server side.
And the NBD receive coroutine is as follows:

(gdb) qemu coroutine 0x5639f183bb10
#0  0x00005639ef3fe50b in qemu_coroutine_switch (from_=0x5639f183bb10, to_=0x7fd0f5fff5a0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
#1  0x00005639ef40dfc2 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:193
#2  0x00005639ef24e4db in qio_channel_yield (ioc=0x5639f1d8aa20, condition=G_IO_IN) at ../io/channel.c:545
#3  0x00005639ef24d71a in qio_channel_readv_full_all_eof (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
     at ../io/channel.c:138
#4  0x00005639ef24d8df in qio_channel_readv_full_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, fds=0x0, nfds=0x0, errp=0x7fcc20edcf10)
     at ../io/channel.c:202
#5  0x00005639ef24d5ec in qio_channel_readv_all (ioc=0x5639f1d8aa20, iov=0x7fcc20edcde0, niov=1, errp=0x7fcc20edcf10) at ../io/channel.c:103
#6  0x00005639ef24dd1d in qio_channel_read_all (ioc=0x5639f1d8aa20, buf=0x5639f30eb000 "", buflen=19660800, errp=0x7fcc20edcf10) at ../io/channel.c:320
#7  0x00005639ef25ec54 in nbd_read (ioc=0x5639f1d8aa20, buffer=0x5639f30eb000, size=19660800, desc=0x5639ef5ae73a "CMD_WRITE data", errp=0x7fcc20edcf10)
     at /home/workspace/qemu/include/block/nbd.h:361
#8  0x00005639ef264682 in nbd_co_receive_request (req=0x5639f1744a50, request=0x7fcc20edcf30, errp=0x7fcc20edcf10) at ../nbd/server.c:2328
#9  0x00005639ef2652b3 in nbd_trip (opaque=0x5639f19754a0) at ../nbd/server.c:2629
#10 0x00005639ef3fe20a in coroutine_trampoline (i0=-243025136, i1=22073) at ../util/coroutine-ucontext.c:173
#11 0x00007fd52da17660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91

We can see the NBD server is trying to read data from NBD client, while NBD client can't reply data
in time because the QEMU main thread is busy on other tasks. So, the IO request can't be completed
Then it will hang here. The point is we can't assume NBD client behaves like local block driver,
network/NBD client side maybe have delay,etc...

Although this issue happens in COLO stress test, this looks like a generic problem.
if NBD is involved, any usage of bdrv_drain_all() will depend on NBD client to complete all the requests.
However, generally we shouldn't depend on the NBD client side because all bad things can happen on network.

To solve this COLO issue, one option is, we can slightly change COLO operation sequence to drain IO in the
a NBD client before the NBD server drains IO.

But for more generic option, is it possible to prevent NBD server poll IO in this scenarios or add a timeout mechanism in nbd_drained_poll()?

Thanks,
Lei

> 
>>
>>>>
>>>> The issue is, only waking up the request coroutine or shutdown the QIO is not enough because there will be a synchronization issue.
>>>> For example, When the NBD request coroutine is awakened in qio_channel_writev_full_all(), it will continue to access the ioc->xxx,
>>>> but the ioc has been set to NULL in nbd_co_do_establish_connection(); it will cause segment fault.
>>
>> Could you provide a call stack of this segmentation fault? And coroutine stack of coroutine which is in qio_channel_writev_full_all() at the moment. And value of s->in_flight?
>>
>>>
>>> That is a serious bug. Nothing is permitted to free the QIOChannel while a
>>> qio_channel_writev_full_all API call (or any other I/O call is in progress).
>>
>> I understand this.. There are only two paths that calls nbd_co_do_establish_connection():
>>
>> If it's nbd_co_send_request() -> nbd_reconnect_attempt() -> nbd_co_do_establish_connection()
>>
>> Then in nbd_co_send_request() we should have been waiting until s->in_flight becomes 0. And we are under mutex.. So there should not be any parallel qio_channel_writev_full_all() or any other qio_channel requests.
>>
>> Another path is nbd_open() -> nbd_do_establish_connection(). Here for sure can't be any requests yet..
>>
>>>
>>> If multiple threads are involved, then each needs to be holding a reference
>>> the QIOChannel to stop it being freed while in us
>>>
>>
>>
>>

