Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF617468029
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:06:20 +0100 (CET)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtHdD-0000gX-87
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtHbF-0008EG-EI; Fri, 03 Dec 2021 18:04:17 -0500
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:22400 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtHbB-0006sR-GF; Fri, 03 Dec 2021 18:04:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2pwFb1wASyiagYPgs0ikOGmWVFIuCtxHdumPQsVjrvCdlbJNSk4vqxO1fpt/FRGtwDeFzI2aZlbEyuQjsEThi34k96XlUoAKu6ZBUxuj8iY7K763rXITGZLUld2IaIg3rWGrj+xP3sXBwpYSEEGJeHiu7BzywWo+9wxJCGd1tE3q4vef+jUxhs4srJ9yOf87dAfbyYSKb/++WlEAM2BbkYgEaHsFIObbhC5tK0cpPjuo4pIuI1qgP7572mKp9ZfQHkDY1pOVU5WrK66WvLWlukP75op9ZcvCV4vFOD4SUzBuT0slGv+poC90vGuKsa4CwWw8K4bicFOPKSTxnR9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSS3W5z/1X5OQ8+9apFEyu4F+eaUBaJEvkYEBxStHKI=;
 b=GYDk61P5CLYdtSdAt25Wr8a4VPi/mj55VE9ivgFSgajBbY00sTcZw3T5Fn87OfpeRHiRU+vQUHuGN4gQI30vpX2dDZgJfCBEaZUA2dX7CGPqtsopjg9hjkRlMM6C/K4MlGGnHCI0PnZ2rqTu24ED6MiFYjbemg6PQZUC7UAcdyCyn81qm+4aSPkG0UobprAoKMxbVPuwNyQQCsMML4AACJb/E1mHIs9VA6tyRkV5SANu99AaG3EM2qol52soJbA/ysjtZmtWtCJGWmUh8gTB7bcZdAD2uPWTB37Vx+9bhp6flMDaZ/c7tRpVz2d428iz3inVK5C1EvJVSBYsUmBjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSS3W5z/1X5OQ8+9apFEyu4F+eaUBaJEvkYEBxStHKI=;
 b=gnmpwhglNcTESTNJkHrYHjNxQWtXI1m1ztV8oWXR2Jr+W8h1+2B64CQ+lxDkZKiuq3WJynKDVuRe+f/E6JLWwxpSgRa8NPRbUUIXY8lZJKRm7pTVWQomjoEXGWaSXxLv8cuossRXsDujbgehCAAP08I5ccF5h1PPJ4a0nlay+p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2274.eurprd08.prod.outlook.com (2603:10a6:200:64::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 23:04:09 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 23:04:09 +0000
Message-ID: <ba062f58-36b7-7898-1254-313c7bd1d7b3@virtuozzo.com>
Date: Sat, 4 Dec 2021 02:04:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
Content-Language: en-US
To: Peter Lieven <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com
References: <20210415152214.279844-1-kwolf@redhat.com>
 <20210415152214.279844-3-kwolf@redhat.com>
 <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
 <YH7tah47XxdYs3VW@merkur.fritz.box>
 <f0ba8d30-3380-41d5-e3e7-c1ee52fc46be@virtuozzo.com>
 <dde3af63-994d-4b60-03f7-fc71273e149f@kamp.de>
 <YKVBc4BwX0YuKnrR@merkur.fritz.box>
 <f8ef0127-ea3b-6eb4-a83b-7765c764a024@kamp.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <f8ef0127-ea3b-6eb4-a83b-7765c764a024@kamp.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.15] (185.215.60.226) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 3 Dec 2021 23:04:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddfbb73a-b0c5-4534-b84b-08d9b6b1367c
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2274:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB22742FA541A188FFD8F73DC7C16A9@AM4PR0802MB2274.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zf/5pqW2nzJfVyxpkVL9HKeSTFlBvTdEr63CLx5rGHeLkDRJkhbxEdqr5Q5SNNoxIFLh8Oyc/P0O3kLG+CrjaX9Di6j8GWNpiGgPX2+ClxW6NlzlP1x/NHkU/mJmuJ/eIas+HmFGO0SOfY4Oz9YnuvB/8AwZkfCJ2g1WVL2qzr5pIQsD6MZGR45z2Qt9jR4PE1lLF0FkzFIGC4XHZ1UcDCQPYtTGAqjL8stEIVsp/Prsocm2BzOWVHc6WGYMoLfukrA2sNWLWgmYdMgAl4vROcu9tXDNyd4ZxI5Utr39HVB1/P1yFu+QItH/QZymLSc8KPdQe8pnP6oX46UDdd/2ShLYp8OH9Rv0ElSajt8Yai2SYEMYAiMdtYCbpOXx7Vo+R+C8T+qL1BIq9wBBQ84fp/zclp/LI8siv24waCRuLekXbvaoq0V+cyq3MJabaEl7EqMdtNVPE/i71UqzS5cOIhVLmjt0nYXwqsMXwjjb9zSpjP2Sh6CKMUau8cl1d1mRBKmB5LWeiIk9YGaPAHTMkGXEnA5HO6HpdU35rFUOBJJRKdlw9q5SbS+pquIC64OiPghVwWoBzp1SamSl+s5Trn8KcjZ5r72FewWWfqx8Hf1dx/nRT1adAtmFna2+GM9RkyP8qhsLqzk618dG5KyA3I8yhHTIyWI89q3YJzvA/tkTqudRcHKeZ2j2H3XILeRnY1AirjcErEFI4rFjzR9z2ACBy80BGV9kp0+uWXnPiu9d4BoTQBt+iwdmMk25ehHn8L17ERfrvYADSoePBQquNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(8676002)(31696002)(66476007)(52116002)(66946007)(66556008)(2616005)(26005)(956004)(6486002)(16576012)(186003)(36756003)(316002)(83380400001)(8936002)(110136005)(38350700002)(38100700002)(5660300002)(508600001)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkRzZHhIVGNkYmRkNW1kMG1RcXZXUXdPdk4wRkorUlMrVHkySlRaSk9yUWhS?=
 =?utf-8?B?cHNTaWc2R1JURjJxYnhGcU9kd2tjNjBYM05FOGFud1g3WGpuVGVLakNWamlK?=
 =?utf-8?B?UHRPRDNqR2dJV0ZicTVFVnMxdlpEQTN5dWYySUg2ZG1JdncvcENYOC9qZjBC?=
 =?utf-8?B?THlVM3UwS2MrVm1rbXdNMUVtRmIyc0RPMWVvOHFSZkYvVHUwdUhPV0wvWjJR?=
 =?utf-8?B?U1krVmY4M1pKOGV6cktmazdwZDZrVGlaQi9ZYUROVGFRcUl2cTJjWERtWjNj?=
 =?utf-8?B?a0dRSWtmQ01jdXlBbnd2TEgrdmNkRS9TdDZ1ZnM4ZGt2VVdCNSs2UlRKUmRh?=
 =?utf-8?B?ODcrdUZhN1pMYm5laDNkNk5vMlg0d0lsdzQyai93cCswUnVxcitNeFJmVDRa?=
 =?utf-8?B?ME1xeWgreGV4S2EvQ0xLblR5cENFWFJyQ3RNRm5FWEM0QWdLeXRLdG1vNndB?=
 =?utf-8?B?dS9NcDZ5UnpQOERlYnoyWk9XUXlWZUc3ZXFIWGFIMkhlTk1WYjg3ZS9DWTV2?=
 =?utf-8?B?d1dmWldFa3I5aG81dnRuTC9PUzZVYk13TjJ3SSs4TmgxUjFKQlV4K09XRlFS?=
 =?utf-8?B?TVU1L1M2UDRROVdyQURXdDY2ZDRVSE5MTlhnQjM4UG5SS1lJMTQvREc5d1Nj?=
 =?utf-8?B?VUhDMWJpVmFSWmdwUjZuZzZnY2d3bXA5aUMyUk82N3YwK0tzQVZGeDhXMmox?=
 =?utf-8?B?YnZPM0phamRrSkFOTm1zZHZZYlZDYlMyT0N2SWRsZWtRQ044UStJTlJuU3ZC?=
 =?utf-8?B?UzZCWTVha29VZlZwZEl4UjRXOXNOZWNBMjIrdkNKL00yRDhkcDhmdUpsVTU0?=
 =?utf-8?B?WXY0V0c1WXRrRm5YOWJpOGVySngrYXpNTVY2TlVXS2tCOEVYTjhYZDlLblhy?=
 =?utf-8?B?YUNKdExWYjhETjFtMUZSa0llK3N5anJJVWNJMmpmY2lhaWw1dmFGVEpIZGg3?=
 =?utf-8?B?akd5aTJMUXlabW5hdnFxaURWSmJ5Z0VPMEJmMDhDRitib2xtZWY4eHBhWkxa?=
 =?utf-8?B?dG4yMTBqZUw3NGZwNEx3NkE5UVNLb29ZSXVoc3E0bFgyTHRFVldsVy9Ec1Az?=
 =?utf-8?B?cTNBSHhwRFkvcUhxQVZGbTQ2aVMxOW9sdnBJTlJUV3hiOVUvQXdVQUEzNWFK?=
 =?utf-8?B?Ym43QUxLVGNsV3BwdjJRT24zMHJRNzZ3a3NDclFTekp3bXBTNmFOOXJSQkNi?=
 =?utf-8?B?akE5cFI3S081WnpseW93cGJHNTB4NVRLUGw2YUc1T1BuMkRYWldCYUlCb3Ra?=
 =?utf-8?B?VFduUGw3dTNTRTg0UXNUWjRoakNHWGlESTJIYlBTYjN4bm1sa3N6SG16L05h?=
 =?utf-8?B?UnNxRVRKK09tMk45Zi9pa21QOHBpVTdKYnY2eTRIZ3ZDN2UrSVh5bzZma1Nz?=
 =?utf-8?B?Tkc4U1ViTTkyTHVlMVRNQk9FbTFwdFJ2TWZNNExHRnpOR0RFRWJ3R25xR2dD?=
 =?utf-8?B?QlJuRjNqUnc0Q3RVWTBKS2JuSVpoOEJ5V0FVdURMdDhkZ1pLT2EyWENkNGZ2?=
 =?utf-8?B?WVlCdkhkNVZIZ3o4SVdLem9NektJL3AwTVRKV25jYlNVWGlaOHIvK3V3VWNj?=
 =?utf-8?B?NU42di9vRmZJMmZ3bUVoaGxZbU4vSWtsa0F0U1psQ24rV2o0M0lqeWdMTG10?=
 =?utf-8?B?d2RmZjRtckI0NGZxdHVybTZRN0huT1RUWTY4djRtcFVPL2FycGNCbG1xSG5l?=
 =?utf-8?B?NlhLdi9vL1NEOGJYOEVCVmVhZWxXRjAxK3JEVWhYTXEwTXJySjlYZXpWOTFO?=
 =?utf-8?B?S1VXMFdOWlBsUmFjMlRwSkl1QndQZWxZZm5XQVdsNXBBdC91elNmdkxqamRM?=
 =?utf-8?B?dzdJZW9SNmx3UjdVYWRnc3B2K3BtelJNTnNiWjlqSGZJQ1AyRlYzSnZpdGR5?=
 =?utf-8?B?NHFqUzJOMk5DL0FoUEw0eEZTTC9YZ2dMLy9GT04vQ2hsNGJvREN4bWtadlht?=
 =?utf-8?B?bUlXamJ6YkNMdXpZZzd4Zm5FcERxN0hmQ3lFZzhlU1UxN3FSbnV6eW5BcmZx?=
 =?utf-8?B?NDlvRTFIOXpWVmVpcThpMHFNM3ZLTlo2S0ZpY0Ywekh3SlJnS2dZdEQycENr?=
 =?utf-8?B?d1hGSnlrc2RaWmMyWUZranhUZWFNeUY4TVVvZE9FSWZWVW1QT0N6NU01UVlQ?=
 =?utf-8?B?Wlo4RmIyblc4V0F1VGtGVEt4NzFkc2d2VXE0NGdCNXcvWGZheDl5Q3gzaUVT?=
 =?utf-8?B?OWMyTFcyMmNEM3dBTWtVL2JnUk01UUE2eSsrQzlLZkkwY05jYUQycTg1Ujgv?=
 =?utf-8?Q?Zj7NAPkoucnGBb2m8Lm6MXoPyc2AfWe9b4c6vvck58=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfbb73a-b0c5-4534-b84b-08d9b6b1367c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 23:04:09.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9KKbeaU6oYW3q+eOoPuddIAk5hGkIOf9sqG332QYVXXuhKYAv1ZgvR7mwCibiYvt6fZRgle3foQE99S55dPTQNjfA22c/PjqHQU9LwF/Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2274
Received-SPF: pass client-ip=40.107.21.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.12.2021 14:17, Peter Lieven wrote:
> Am 19.05.21 um 18:48 schrieb Kevin Wolf:
>> Am 19.05.2021 um 15:24 hat Peter Lieven geschrieben:
>>> Am 20.04.21 um 18:52 schrieb Vladimir Sementsov-Ogievskiy:
>>>> 20.04.2021 18:04, Kevin Wolf wrote:
>>>>> Am 20.04.2021 um 16:31 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> 15.04.2021 18:22, Kevin Wolf wrote:
>>>>>>> In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
>>>>>>> like non-zero data if the end of the checked area isn't aligned. This
>>>>>>> can improve the efficiency of the conversion and was introduced in
>>>>>>> commit 8dcd3c9b91a.
>>>>>>>
>>>>>>> However, it comes with a correctness problem: qemu-img convert is
>>>>>>> supposed to sparsify areas that contain only zeros, which it doesn't do
>>>>>>> any more. It turns out that this even happens when not only the
>>>>>>> unaligned area is zeroed, but also the blocks before and after it. In
>>>>>>> the bug report, conversion of a fragmented 10G image containing only
>>>>>>> zeros resulted in an image consuming 2.82 GiB even though the expected
>>>>>>> size is only 4 KiB.
>>>>>>>
>>>>>>> As a tradeoff between both, let's ignore zeroed sectors only after
>>>>>>> non-zero data to fix the alignment, but if we're only looking at zeros,
>>>>>>> keep them as such, even if it may mean additional RMW cycles.
>>>>>>>
>>>>>> Hmm.. If I understand correctly, we are going to do unaligned
>>>>>> write-zero. And that helps.
>>>>> This can happen (mostly raw images on block devices, I think?), but
>>>>> usually it just means skipping the write because we know that the target
>>>>> image is already zeroed.
>>>>>
>>>>> What it does mean is that if the next part is data, we'll have an
>>>>> unaligned data write.
>>>>>
>>>>>> Doesn't that mean that alignment is wrongly detected?
>>>>> The problem is that you can have bdrv_block_status_above() return the
>>>>> same allocation status multiple times in a row, but *pnum can be
>>>>> unaligned for the conversion.
>>>>>
>>>>> We only look at a single range returned by it when detecting the
>>>>> alignment, so it could be that we have zero buffers for both 0-11 and
>>>>> 12-16 and detect two misaligned ranges, when both together are a
>>>>> perfectly aligned zeroed range.
>>>>>
>>>>> In theory we could try to do some lookahead and merge ranges where
>>>>> possible, which should give us the perfect result, but it would make the
>>>>> code considerably more complicated. (Whether we want to merge them
>>>>> doesn't only depend on the block status, but possibly also on the
>>>>> content of a DATA range.)
>>>>>
>>>>> Kevin
>>>>>
>>>> Oh, I understand now the problem, thanks for explanation.
>>>>
>>>> Hmm, yes that means, that if the whole buf is zero, is_allocated_sectors must not align it down, to be possibly "merged" with next chunk if it is zero too.
>>>>
>>>> But it's still good to align zeroes down, if data starts somewhere inside the buf, isn't it?
>>>>
>>>> what about something like this:
>>>>
>>>> diff --git a/qemu-img.c b/qemu-img.c
>>>> index babb5573ab..d1704584a0 100644
>>>> --- a/qemu-img.c
>>>> +++ b/qemu-img.c
>>>> @@ -1167,19 +1167,39 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
>>>>           }
>>>>       }
>>>>   
>>>> +    if (i == n) {
>>>> +        /*
>>>> +         * The whole buf is the same.
>>>> +         *
>>>> +         * if it's data, just return it. It's the old behavior.
>>>> +         *
>>>> +         * if it's zero, just return too. It will work good if target is alredy
>>>> +         * zeroed. And if next chunk is zero too we'll have no RMW and no reason
>>>> +         * to write data.
>>>> +         */
>>>> +        *pnum = i;
>>>> +        return !is_zero;
>>>> +    }
>>>> +
>>>>       tail = (sector_num + i) & (alignment - 1);
>>>>       if (tail) {
>>>>           if (is_zero && i <= tail) {
>>>> -            /* treat unallocated areas which only consist
>>>> -             * of a small tail as allocated. */
>>>> +            /*
>>>> +             * For sure next sector after i is data, and it will rewrite this
>>>> +             * tail anyway due to RMW. So, let's just write data now.
>>>> +             */
>>>>               is_zero = false;
>>>>           }
>>>>           if (!is_zero) {
>>>> -            /* align up end offset of allocated areas. */
>>>> +            /* If possible, align up end offset of allocated areas. */
>>>>               i += alignment - tail;
>>>>               i = MIN(i, n);
>>>>           } else {
>>>> -            /* align down end offset of zero areas. */
>>>> +            /*
>>>> +             * For sure next sector after i is data, and it will rewrite this
>>>> +             * tail anyway due to RMW. Better is avoid RMW and write zeroes up
>>>> +             * to aligned bound.
>>>> +             */
>>>>               i -= tail;
>>>>           }
>>>>       }
>>> I think we forgot to follow up on this. Has anyone tested this
>>> suggestion?
>>>
>>> Otherwise, I would try to rerun the tests I did with the my old and
>>> Kevins suggestion.
>> I noticed earlier this week that these patches are still in my
>> development branch, but didn't actually pick it up again yet. So feel
>> free to try it out.
> 
> 
> It seems this time I forgot to follow up. Is this topic still open?
> 

Most probably yes :) I now checked, that my proposed diff is still applicable to master and don't break compilation. So, if you have some test, you can check if it works better with the change.

-- 
Best regards,
Vladimir

