Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B553533970B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:02:37 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKn3U-0004n6-Ny
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKmnG-00018j-Jr; Fri, 12 Mar 2021 13:45:50 -0500
Received: from mail-eopbgr70117.outbound.protection.outlook.com
 ([40.107.7.117]:15775 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKmnE-0005i9-Mp; Fri, 12 Mar 2021 13:45:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2W4/iBrzIDi4Lm51qLoxNQkpaZDIQ3BfvtHKi3DSrzrXFW1qfZ3e220byx4EEamYovOi5Sz6B37TE1P9TV5mgzpC70YrcGExz5Kttq+7xfvxfQjilxGGXOIH0PvTPVFUhsmbfcsaU8jmRva1Aex+QWSNTc/WNQR3sFxIxQof2m5tr4gx4lGRZtf/FFKij0F7AoxgMu/XxQTcp/jAyvuVRlK74CJ+y73AuL4V0MVjw+cWr28wXEBno1xBSVZAfGJB6V0PhlsGuBdbcR8H5N2nRSgfF+MJMDFd2Mt/3p+3JQ+kGmyLH25tf6/xZwMgpwNTwOJFN7OYLDrCOuwB7vckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcNqfwRwvoFYYEZAhcF3reE4zCrP6T13PRkqQmcI9Y8=;
 b=nW6DI1iOYmlqY5vVynb3uUrwEf3/vHeQQ0t6zt4qe4GaNOt9fzCoBYSYgzs3VPDakhTj1VOdqrIdGMUF8BthefFVvlYqg8kUeOQoGDyFpJUglkpTRwLwTb9akOG0oMXL2zRttLj7W+mfjw+zisztPjbA59LyMoFsOOY2GdRra2t1aOHHyA7z2nSkEh5VLO0QU3dEC+OP2sovgRcLPEh/MQgm4OiMh6lcaXLnL8h2dSZDLzwTSrZDyQfV2pAeY4Nfmr/kmbVAi8658b7EITdqzq2cIqgl+1zbp2u/F916nFT1Tni9l7xElP5kM09iTTjBDm6OLTNHpswqpxvmJvNb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcNqfwRwvoFYYEZAhcF3reE4zCrP6T13PRkqQmcI9Y8=;
 b=kmNNzJOgxdWgshHkVElEFv5HZID1HNTle0aD/nSbiSnRyZUpz18+R/HoiNbEGSuLFn9ctclydyxOy1hvGL+HzK+WTbMp2hEA7PZ53+9Efyuqrcr2uxMOuyzVTke7ga3mkabsDr9bAU+MhiVvBEjn+OonQM91zoVA/8XDx9ZMEEc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 18:45:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 18:45:44 +0000
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4b00beca-9925-916f-5140-0bcd05ca4dd3@virtuozzo.com>
Date: Fri, 12 Mar 2021 21:45:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR07CA0100.eurprd07.prod.outlook.com
 (2603:10a6:207:6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR07CA0100.eurprd07.prod.outlook.com (2603:10a6:207:6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 18:45:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3db49f06-d6a4-4423-9ef7-08d8e5870b28
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944AD6D9CF44DEA5B86EA91C16F9@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRqAqwMYLyebdgkGSedierhraoifzISQ3MkKJADEsj/AjYgv2vn4herQKyu80CQ1nQiUmsN82TBXY77+1YoRm069TUGgP6FTjI+oTGcMCeIoJKjVeIzKMRJLsDNU6w9UP8FGeAIt6IW9Xi7g8WdMnHPbzaOvAOjQaRU237REX3mlkmezjAXdE6hSojgy2xQJbEI7ftG0geSMlM0mF0lqDBX2jMYiosHe+rm/ugfSse9hTfmy33TSe/6Ud8d/jvFu0ptzkIueahajmDf7mWSU8lE2t2y5gnGDhX6fG0yfMBXRy9wAfuj5rehsG05ZWW+/JXN9XQNs4mzOlrnaU1bdO31Qq3lHHJdFMNoxP5ll93zpCmrbEvCGodrYDT1EKz4Wovvxvxr/5a+Ae1HluS6sKgBwtZAFiMSlBJLtvvGF143V52TAxlUP3CMTPmcxEv5nWQo97tQXPlG6sSDN8YmyHoIssRITOt/RS4zaPmSwr66n0LiSVHJEkQJzgNVEBzT3ThumlkWUfglQjOPAQSRMpdocqDHLA0XZXbM1VxAnp9+Zb12WAmIjlzyug+BZ2SPFIWlE9ywCBGmjnSC29pauYlrF3+DjPUlYaBliTOpFZlo8ifEx5zF10gNJbc4/0AhSMP96L7tYSV6owGZ1oa9XyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39830400003)(366004)(136003)(956004)(2616005)(26005)(186003)(16526019)(4326008)(478600001)(316002)(4744005)(16576012)(8676002)(6486002)(66946007)(66476007)(66556008)(86362001)(31696002)(5660300002)(52116002)(36756003)(31686004)(83380400001)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wk80Z1ZKRU9VemNGTklpNEg0NExpcWxxT2ZaTnRPV3FRL2Qzb0lDMjhVUG85?=
 =?utf-8?B?ZlNobVY3WkFvUmtyemlTeHA3c0RXQ1BBODRBNExFQnRlL2s0N1BMOEJlMGZK?=
 =?utf-8?B?V1ljUmdGOE45SklLdGF3YnExdy9VZGJ4NTh2Z1ROSllHOE5NdE85d1A2cHVK?=
 =?utf-8?B?VkE0REc4eGZobFpoc1dkbUZkczRXUXpscmkrYlBjVVZ2YXMxNzVaYzBsWEUy?=
 =?utf-8?B?L0ZUbE8zbjZlam52WWl4R21YdUJpOUdIZnF4eTNGRlZQUVVaNnQyV1dvL2Fq?=
 =?utf-8?B?SGpaMFJLSXlSbHNheG9HR1J3bmpkc0lTSlNiaEhZTU9FaTZpSjJxNWZwN1pr?=
 =?utf-8?B?ZGliU05HZHUxME1IZG9BdXIyQ0ZYTGYxcmYvMHd1b2Y0VDlPM0xrVjVuTXUv?=
 =?utf-8?B?UjNFYTRNeUdheEU3MlN2TzdyWFhTV3p2UHRqaGFNckd4MDFKV29NYTVKMnF6?=
 =?utf-8?B?TTJoNzJrSlRvWG0rOTFyMVAxSkRaUVN3QW1Rbit0OTYxQTVaSXU4RkpsNHlw?=
 =?utf-8?B?NkowTmFHOHFZelB5S2prd0RSWjU0Y3pNNjdySVhjUHljenAwdmtOT0ZpM1VG?=
 =?utf-8?B?a1VsWk9scVJsOGRMZ2RRT2dXOFk0aVpTRDY3WmdRTi9PQW9WbmpKcUZWVTVy?=
 =?utf-8?B?cFpIT2N0eFBxNDByczFxY1NqUm1uV2lZK3hSQ0JzMXlzQW45eTB5OUs3OFZJ?=
 =?utf-8?B?TklDWUFJWGNkZW9tZlpGUGI0RzBpTEZaZjFLbDFpZXE1aUdaZWJZcDlxV3hR?=
 =?utf-8?B?dFQwTjNTK1JFNnBMd0JDQWZjZDI2N3RpYUZXVCtFOEZydkFqQlZOSkRXc0ho?=
 =?utf-8?B?UlR0ekFINHhTZEIxM1YyUU4yTXNYbmd6VmQwU0ZDQkZOelVUditreC9iWGEw?=
 =?utf-8?B?aGQyTVI1ZFcyemVpdmc0UjZNd2N0RXdFdFE4RFF2clVXQytKR3ArY1FQOEN2?=
 =?utf-8?B?NWl2UWQxeEVxZ2Foc3J6ZDNyaHROSU9Ha2kzb0dzanYzdmxUTDIwRlk5ZWlQ?=
 =?utf-8?B?Ujc3eE5CeUx2czF2ZHQ2TVdwZE1yUXNQQmlJZDNGOVZqY1ZBRkY2a2xIS0xo?=
 =?utf-8?B?NGhGL1MyZUd4RlZrOTdpQUgvMFdNRzNYb0FEQ0dsdXB3cjVWdm85R3hVbHp4?=
 =?utf-8?B?T2dWaDZLMFdLcnMrZERMbHBkWkQzbEYrbFBpY1dYTUZ4blR3L01IV2x1eW5j?=
 =?utf-8?B?WnRTd1F4cWUyL05QS3pZcWRnVlhwN0Zvc2pKZ1VTeUJZYUN5V1pLS2NRQ3JD?=
 =?utf-8?B?SWNTZ1pvdzkySlBVU3JFR3RQOHBCMk1pVjNVWG1TRDc5WDdIaFg4SDhMU1pR?=
 =?utf-8?B?L3UwVXphaVUydkxmTzl2VFAyUWJJUEg1d05jUm54Wmh1SzJnSWhLOFkwanlv?=
 =?utf-8?B?QzRwdnZ3YXNYUklLNlUrcS9qMkdQNVNEenAxOTZ4cGZEMlFlWEdOQVhVY3FR?=
 =?utf-8?B?Rm9pdCtYRmlWbzFPRWQ2RnA1MG5WbmZjdUZGcmVPaVpycmdXdUYrcWNBWWt2?=
 =?utf-8?B?a1JWNlAzVk5TY08vRkk1N05OQkxtYituUlZvZ3V0RVVIVG41ZkRlUmQvbjB5?=
 =?utf-8?B?akZGSVIzbDhYN2NvMHRvSTB1eXozOVNxSVhnQWppUWh1MjB3eFhsZDNseGRK?=
 =?utf-8?B?ckE3dnc0SXAwWnlVZUZXa2RqN1JHUGE4UFhKeFAvbGx0RSt6R2hsSnJld1FM?=
 =?utf-8?B?N3A4VjNuZ2ZUWjZZQlppaFRtOG9QbmtzYTUxNkdMS2l2cWw1aXEvQXNzb1Bl?=
 =?utf-8?Q?Y0shTsB0XDJe9r/P3BU9dxcIyUhPie571Lr55xf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db49f06-d6a4-4423-9ef7-08d8e5870b28
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:45:44.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LTFsZXld8n16gL/S86SeyAMjWP5FyLjoJDXH1HFEVq2HqeLVjguT78e8uFTn90G3WG5NIzPaaEh8fjZ/tFZ1VCRagWFdHtLbW9KrKSzmmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.7.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

12.03.2021 21:15, Max Reitz wrote:
>> @@ -1834,6 +1835,10 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>>       s->inflight_writes_counters =
>>           g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
>> +    if (!has_data_file(bs) && (bs->file->bs->open_flags & BDRV_O_NOCACHE)) {
> 
> Looks a bit like a layering violation, but I have no better proposal and you gave your reasoning, so, OK.

Probably better is check request_alignment of bs->file->bs. If it > 1 then enable the cache.

-- 
Best regards,
Vladimir

