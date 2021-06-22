Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655C3B0BDD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:52:24 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvkZT-0006CK-5a
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvkYQ-0004eV-DT; Tue, 22 Jun 2021 13:51:18 -0400
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:18254 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvkYN-0000p9-B2; Tue, 22 Jun 2021 13:51:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9Cyc0nDrCtWiSHEsmy+n4ms9h1lKSLS3sW+yAJSuQb78b7TfMtkYnj55ySeWVg+GW1JqBEhqC+DBpNPwvRpWHakPhsJuSppCq+sJbQolXCG/NbZ6MmG0PGqD8a91GltvI9PeRcckiaDF8Xqkcyl7C/aNNTPC/atMdc1Yc3HVQvFrAmg2685w5PRDtcrUwD+xKDgzFWJr4SOGUMH0cp8aMcBPeD0kplLxmxpPtcs1U41NW5WslhOXzQus8tnRBmMQ9R25cb2Z6dXSkVL0oqdO+GrKfFDT8vVS49UQLboeVRH3o9v6pBB0NgL4h9IcFcZA3+WaYIHljs89p5jo0Z/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM/JTY4at8fySc52asfDQ1zH9iLil9C9fW/VmZSA/FU=;
 b=NzbYDzf1eer0lHCqnKb1wX4kz0D2q5attb41tWWcSFbGAAJGFr2tyh+583n4nfsMrw41eCXwQHu80tKi5X3rBvtLvILM8Ri6aW4bKED473tMHxwzdXz3kRiRyubjnsc/TBkFTz9kNT4D2z6oTE+du9TTnfo6jWFo1LHHEtNto/xpCOX28JLcx9w9oPEUh3CiYNqULbSJq4ZS0K1PLQSuX1ewdR92b3cGFuqjJpchzfLfhiGIsLTUXhEWijkCTbokQZFdX8gg4UhSGRmPBMiLFtfZqmmPQwqvKZLC9clyDxV8X0DfgHUn5Z+flkG6526kY19tAkpll9qeVwqeMoTvzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM/JTY4at8fySc52asfDQ1zH9iLil9C9fW/VmZSA/FU=;
 b=PBHcOMOIk2aJoZgI+/AZM1neiQ5shNrR/DBfzPxZV6Q44q/ZFD2DRodeYnndYv94UJLfGNwlZ7XD9202gk8SO1VQLT0tfa6TosCw7XJAQ54EJ9aIV3JM48dsWbWEt6ppqpHkUK/W2/t1lmZgu4tX28Xp93N2ZvyhMKK5KEGAzXg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6742.eurprd08.prod.outlook.com (2603:10a6:20b:351::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 22 Jun
 2021 17:51:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 17:51:11 +0000
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, "open list:Block layer core"
 <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 mreitz@redhat.com, nsoffer@redhat.com
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com> <YNID9rbo+RdwklCf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0b897b00-9c52-9841-8a2a-1a1eff09e32c@virtuozzo.com>
Date: Tue, 22 Jun 2021 20:51:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNID9rbo+RdwklCf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM9P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM9P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 17:51:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08c6ecb-2682-4fad-9688-08d935a65272
X-MS-TrafficTypeDiagnostic: AS8PR08MB6742:
X-Microsoft-Antispam-PRVS: <AS8PR08MB674207204840D7A22FBAD821C1099@AS8PR08MB6742.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFwCFdHOyQlqQOUW/wPRf4mEeznxViOFvwjpVcAwu3zJ+5JYp8GobgQwnGV8GLuSmTJkAF7uJjbZ7TJm+z+AIy/2bAJor+Qry2rPETs4VREM1oqaIpuu1EwxCWk06VlB077xpptC1OG+oa5+AKHOrM+6cde690N4+GfUrz3Ml/X4FUJgPcWCx5Pko9+YQLiBMTigV5zrDNy5OkvLV5tFkFPgD4fnCqpmZ+j2FEYkfS6pURWqyzerykjyFYZtsSDkaIhNbUM10n0/miuny5+YHl2B0QfaDbFqAzcp6Q/JlxbaLbj+4zBx1+Lg+eNaPNVgVw4kRUkhYZDkWw4oh53QanHdLvJt7uFup0AnO12Cl4590qG8fsAfYT7zOlwhkeWppqK+Gwr+qdBlxlw0YskEFuqgbgmfjpwWqxYEpHt0hCVhEIhkAMGnBWbfUYi+eZASPMk+bbPbtmN41eMX7UMBYgzzJz8FdhqZy8BC2JTI5x50qguuAcneJkq5kwMxnZoaNPGk9E9VsjYDfDVaFxBwS+tMp7rBbrkT98PvIW8+MIL9YA8942CGQLsyLTQHyVbCeoU8I7sFm8EQGUXYGvZDXkTqzUuH4Q/FHVsByV1e0vVPKV/Y2MpLNA8yjvCykV1RL+Y9aMwIL6r8TwTz9lMCEfmFTvnI9aN9TTSRqllKmdfvPS1mG7/PLSP9VxTr66FJBkixLVgJb0nDbsajxesthYfdygKG7W7Zhp3dWKm/ULs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39840400004)(376002)(396003)(2616005)(38350700002)(478600001)(38100700002)(36756003)(52116002)(956004)(86362001)(2906002)(83380400001)(8676002)(54906003)(8936002)(16526019)(186003)(6486002)(110136005)(16576012)(66946007)(66476007)(5660300002)(26005)(66556008)(4326008)(316002)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TElacWFqNkkveitwdHFjOHQ2WExHSi9qb3E3ZEFzTDVLcFpTWnhWa0I4Vmpk?=
 =?utf-8?B?Rk5hK0ErMVNqL21sb1FkMTRMemp2aEFpNWRJa3pMc2hIRjMreFpyY2w3alBp?=
 =?utf-8?B?blR0N0xLekZHVGNvZkZmQUE3UUNWcUtDRmZvRGRTaEZiMzJDUFYvMmE4RDE1?=
 =?utf-8?B?clB5dm40aC9acWZhd1plbDk0UEpObXhoaVJJazkxN0JpMjZRczdpd09TdXpy?=
 =?utf-8?B?SlRDOWo1amxMWlVLdEVseDRxdUVCZjNpUStWNXBCc0lMTmhPQjhjdVVnaUNn?=
 =?utf-8?B?NGcwem01K1ZqWGFiODhuM1NOck9pSTdqT0RtQUU5bVJmVlp2cm5wdklBVWpI?=
 =?utf-8?B?V2tnQitzY2gyMWlsU0dra2ZJeGo0bzZ6MGtzK3BYR3E4QlViZWVYQVU3OEUr?=
 =?utf-8?B?bVE0L0N6VmtpdzJUaUdadStMc0Nsem9yazRSZU9jTHNaSmtXMFlnZ2lESWs3?=
 =?utf-8?B?TFJiWitDQ1hDeFNaZGRGY3dETFM1aGpYV2RUVUtSNjBhZk1Meiswem1oZThm?=
 =?utf-8?B?elU5N3ExcExhYzZPdlpUbTdRSWNRZUJBZGN5TDBlNDNIclE3R3ZRQzR4T1pV?=
 =?utf-8?B?M2g2VFl1amxSTzFOUVRrTmZXa2x3OEprRDF6eFY1ME56elNucWZKbHpoNTZU?=
 =?utf-8?B?MHVvSjl3SnptUkFtTWloSHlKaHV4WmxNVC9iTlZpRlpwdkdoQU8xUFZlbHRt?=
 =?utf-8?B?dE1ZeXczUmFTc3E1Y0hZTEV3TjVZL1hHQnRWUGRTZ0Z3SHB5QlkzV1RhTDVo?=
 =?utf-8?B?ZUlaK1FJcElac1lPblpycGYwRkcyNEIvM3paRG9wSHNuT3Z4SnhTSk92d09y?=
 =?utf-8?B?Vlp6Q2x4TnhJYnpzWFBIK0lRUld6T0ttNEtvTitTVXNSTXYvT2JDSmhwWTg5?=
 =?utf-8?B?ckI5YStVVTZ6Z0d4czgyQ016Wm90Rk5HTnZkNFZIelNucDVyMS9EZTRXZHpx?=
 =?utf-8?B?ekYwT0VMaDQrT0cvQzY3TmVxb3BRK0FkRFFhM01IUXhJTFhGU0VIdGxUaWZS?=
 =?utf-8?B?YTVXcjVGZVNMbk9iS1N2WmNkMUU3WnQrYmZ1bHNLVGFDUHdJZmk1RGdBSFhP?=
 =?utf-8?B?VmJRdEpBM3RxZDdaNThuN2szRisvN2UraExpdzlRQ0ErWEpHRG9xS1NLZlFw?=
 =?utf-8?B?WE9VbDIrTHVWdlp0ZThHVXB3MzM2WnUvaWtYcnVsekJra21ORTY1Vm5neDNi?=
 =?utf-8?B?NzF0ZEFaanlGYzB0ZnV1YlFNVkQwU1hHSFRISE9GcDlORjhMbE5STHljcDMr?=
 =?utf-8?B?MCtTRHJWcW9mSEh2K2x2c3RhNnE5ZUp3ck9kbFdCUWNBcE5MWWxYQW5CQ1pB?=
 =?utf-8?B?T0lJRFlDa0VFZzZpYTFDdGhqMnNBeUdGMXBTdUcxbVhOZVNoTk0wamtpV0xE?=
 =?utf-8?B?dnJzQ1AxaUc5TzUwREVacVhCYzZhQTIwK3hUNWNpbEs2MkNoQks5RGlWdWlF?=
 =?utf-8?B?RUV5cHhiWWw2bGNFSlpqaldIQlFudEdwQ3Y0cEl3RjJQYkZIcjRPTjNyVlcz?=
 =?utf-8?B?NHFua2VKWmhjMkE4TWorTjRVVUFhK2NZMUpUVEpQaEJWSEhoTU9RSm95K2ds?=
 =?utf-8?B?djNtNnpUWEFPT3JYaVRQTDkvWTJOSGhWV0M5OGNoelh3SUl3ZUpNWitZK2V5?=
 =?utf-8?B?bkRqV0kxZUU0aFFaYlJXdGRobjZ5T0JzSXpvQWtmdUp5eVNPWjF4dmVkcFJa?=
 =?utf-8?B?N1FjSENVNFVmZmtwczl1eWxYTHZ5OEswZTIrLzF3YWVKUUY5RTZMdG1VYlF2?=
 =?utf-8?Q?wpK0HR9kSlGBYSC5KYetskXzOldVXB3FMXx1Rum?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08c6ecb-2682-4fad-9688-08d935a65272
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:51:11.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI+crrxs2oF5eAYB91FqCqFtvbxvGwJObbCbteNQjVx0BmaT+fjOkMY46kmNY/lGTRL8Yal40paNoss8YQrs/xbmlZXDI8Lsh9YbwSBFpJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6742
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

22.06.2021 18:38, Kevin Wolf wrote:
> Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
>> To save the user from having to check 'qemu-img info --backing-chain'
>> or other followup command to determine which "depth":n goes beyond the
>> chain, add a boolean field "backing" that is set only for unallocated
>> portions of the disk.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Touches the same iotest output as 1/1.  If we decide that switching to
>> "depth":n+1 is too risky, and that the mere addition of "backing":true
>> while keeping "depth":n is good enough, then we'd have just one patch,
>> instead of this double churn.  Preferences?
> 
> I think the additional flag is better because it's guaranteed to be
> backwards compatible, and because you don't need to know the number of
> layers to infer whether a cluster was allocated in the whole backing
> chain. And by exposing ALLOCATED we definitely give access to the whole
> information that exists in QEMU.
> 
> However, to continue with the bike shedding: I won't insist on
> "allocated" even if that is what the flag is called internally and
> consistency is usually helpful, but "backing" is misleading, too,
> because intuitively it doesn't cover the top layer or standalone images
> without a backing file. How about something like "present"?
> 

IMHO, it does cover. If we have qcow2 image with unallocated clusters, but unspecified backing file it's good to know that these unallocated clusters are not simply ZERO, but actually point to backing file, which is just absent now (and therefore read returns zeros). User may start qemu and specify backing file by options, or set backing file in the image, etc. So, the information does make sense anyway.

I think it would be good to start saying about backing chains explicitly, and not hide them under "allocated" concept which has different meanings.


-- 
Best regards,
Vladimir

