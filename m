Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56EB3A79A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:56:30 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4s0-0000GP-9W
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt4pn-0006vB-RX; Tue, 15 Jun 2021 04:54:11 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:47904 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lt4pk-0007I8-7n; Tue, 15 Jun 2021 04:54:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C86l/Arh+hv08YdfaSXIa10gxF98zspgXvsU1dFR3WewkTEvXZDMqdwM1Bl8SBOpNG+vQGEru68UH05npcatzX4H/6Vz3gBqSHEqgJp1Xhh9xcNFwwMiI1tcnuA19CtgN3dNExvzg4FWP++r2zayz+1XM+SO+l+AFGUbcXmyERS9SyTOEME//w/k4RHWk2Oo5dVP973QFl4IedAt6B+3cFOpvfs+emccaJmcFhbi8WiEFPF7VnMlT6JI+JIPJeaA2HUIkp22NjssTz5NlvrMfup/pR9FsMxbEJ3XvkU3fmLHm2CRmtOv4f2Wef+2Hltk3zxr7oYNJ11alIFifClpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKeLTj8pH0pTs0NY+qxPqb1nNLYUUDr/VigMX1ZwZyI=;
 b=YqyvSv5IBXRSXWHD68xeWjtqk5mwb5GDpufx6+6a37y7PirSUhLIs0cFirHvAvkVrqkRRWyoF2/DdocT442oLpUHSyPp1oOzy5hMSxQu444lombZqjPULoxLHPy0k/3vPsyqbzmNRTRvDWvhupEATbQuV7ZzmgyWBH1+C06zl6vgRigVIRzjw82KqKODDMNZnbuyv9iILMo2MXCxN2X9EveqYoBXvmgY5f04nHyvu35Rt9AxQ2uP9RFMarPNXBnXVkArAEBxvOvsqZtTzDurlz+6ydsNue7csV5OFQCha0a5uML6GJ7wrCGKvssNL5RFEcwKzDenGnOMHWPwPA9q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKeLTj8pH0pTs0NY+qxPqb1nNLYUUDr/VigMX1ZwZyI=;
 b=Jd07pt6BjACi8ZP95u8HnnNHjUbFT4sy2+ejUfjktD2mkgxFjlTm19D0IJcmHd/REDQlHGQNmGmrmF0sAn+JJot5ecWjTtmP9kbt/3IHnuQGycnDO+by1PWFHZPgvGJ2BS0nJHC2/cffgiyQR6IvRN1EUjY/HVaW/YHzVPE0e+g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5382.eurprd08.prod.outlook.com (2603:10a6:20b:108::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 15 Jun
 2021 08:54:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 08:54:04 +0000
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, nsoffer@redhat.com, mreitz@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6e5ca689-cc2d-067a-7299-dd2813c1db2b@virtuozzo.com>
Date: Tue, 15 Jun 2021 11:54:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210611190316.1424729-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.224]
X-ClientProxiedBy: PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.224) by
 PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 08:54:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6070b026-13ec-4687-d96c-08d92fdb20fc
X-MS-TrafficTypeDiagnostic: AM7PR08MB5382:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5382571B33E0F0430558D7FCC1309@AM7PR08MB5382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xz1UhPnNwRDk5vTJIf61ssd/uN6Mb984pvKIhq9zeM7xcYb0LhTF+kntoxOHWYMrdkU6JQu3sw4uK5U4LFVZuUnWqqfaQJeJu2ZJEGXYWeiKL5HpIXdSsqMcD82k9NByuPuCGnCxFpJK+BmMPAefgQ/CK0MXQUX/cJzwqinST4WK7PWsg3a7aXG1Y89LpD+0jXijHqRX8ywK7XFd3eJVEAU5mmLQ6GZ1o8y/PN06ak4T3iVcXn0+hpPPpt1lGY1/B6vxGB0MCOZJjxQOoR0ua7ylZ9ryVME072qo/H+V17Rf3PRrpc07I+AoOZpvypJttZnyphw2uDuHSmydb2O4PLziIa+qLV85DePHwYDB15wbch9PjSypQ5HkpKTw3PMhTjEcDag+H8sTz1ZnX2Id8mqcMlIFiDPbnp8FPHgfLeZwW8aUvbk5zsZc/6utD6QdsrbYtvuCBkv3CrhFtXaOjRPpkI1vCdBSX2ZF275VO36NlBj6SeXTbNoykp4ESAeqPm0W45W7k9vKXgUiPrFpa73X3S/W+HsUpAHXmJy/4nbTuv4xt6deS4nwaeTcw4ND1oLdAnIkc0euc/DtGbmKABJQzyPQqAjINZoNUwmnJkz17s1q285iW/az97b5qW0B5EsomoQ2nUC5wJu/DOQXVGA+bQ4mbyVLp9C0pistX/KG/VcIpghyqUInqwvUlOs00zFNDBwXgMIXbeycF3I88Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(186003)(2906002)(8676002)(8936002)(26005)(316002)(16526019)(36756003)(83380400001)(5660300002)(6486002)(86362001)(54906003)(2616005)(4326008)(66946007)(956004)(16576012)(38100700002)(66476007)(66556008)(38350700002)(478600001)(31686004)(31696002)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpvTVU2aTUxZUtLUzRNUUVnSUR4UzNTbjFZQUQ0SVVyc0RtSG5QK3hoK2tm?=
 =?utf-8?B?VEdWVnhHZkRKd3h2RWtFRVpaV0hTa1FMOEtPMHZ2QUJRT0l6MnpMUlZuUDQ1?=
 =?utf-8?B?eUlSVjY5Z05Kbk15UFI4djdMR2IrNGNpNUJ0a1NhdnNIUFVZRXB0SFl2TDRp?=
 =?utf-8?B?d1JCWGljR0hmVGE4ZGZjbnYyc1YvYk82YiswUUgwQS9rMEVmRDhwbHpQcEpL?=
 =?utf-8?B?ZmZNR21IWHdHVGtJS3pKQ01LVmVmNlNyN1d5MmZyeGV1QXdiYWhvVlBaQzQ2?=
 =?utf-8?B?UEwvejlmZVpTQVhSNzJJTlpSb2daYnd1ZnNZRDNZN0M4QzVqQ2pjT3JxUzAz?=
 =?utf-8?B?QnNURDhoelNuM1pNWnNhZnRqcVB5RUg4RFMzRExqUHBXbUhIeFQzNWxna0xi?=
 =?utf-8?B?M3lUaS85dTN0RFlUUHBGMnVXMXp6Y3BEdTJmcmoxMHlLVXlqZDNMQVJFT21l?=
 =?utf-8?B?SWpGWUhLWUl2K2tSQitkUFkyZWdicHhSRUNsTkxHakJ3UjhqSktEbHZ6eHNX?=
 =?utf-8?B?VldoTEl2a0tlT092Q3ExY0JpQ1Ywb29nSDZ6eVp4d2FMVlc1dHBLaUVmSUdJ?=
 =?utf-8?B?eEJ1ZlZUVWZtQmVkazZBOE81MkMwR2VFOU1rSzRuWkp1aDAyZTAzZXhPU0hY?=
 =?utf-8?B?a1llMDdwYVdnVUZFRjdqUzhGKzdsekZkd3FmTkpsbU1mNDhLZVJEeERVeTJ6?=
 =?utf-8?B?Ym5TQTFJZjFzMXB3eThSYmV5a2Z5TCthMUFaNWdBY3gvK0kvS3JwK2JacEcw?=
 =?utf-8?B?Q2E1elNnalBxMGUzL1ZydFcxaFJEZFpBdDllUXhkQnk3SmlmRUVUbUFmeVVT?=
 =?utf-8?B?U3E3K2VUczBReGppb012eHYrTFNzRlZ0dmdjdVRNc2ZjdG4rT2NncHJHL1Vw?=
 =?utf-8?B?cnNCQ3lTSi94Vkk0T0U2QWNENEF6RGx5TXkya2M5cVFxVFRMQ09nM2R1RFV0?=
 =?utf-8?B?U2piNFlQbnVkM1NlN1k4RWRheXQ1VVhJTml6T3MzaXV5UHRtUmZEQ20rQ3Nz?=
 =?utf-8?B?d3ZkaU1BYzVNYnVXNDZKalVHZFpTbVRPbGZyWW50eTZsTVdrS3VXUFRKbGZR?=
 =?utf-8?B?NG1ncVcxSFRFVndkci9CNThPREVIWWRFYUlaTGgwUVMra0xDZHcwSHloL1RS?=
 =?utf-8?B?cHhSckdzQWNaMndnSW5KekRJcmJFU3VaKzhGZ2xjelE5SEwyUHNxUTJOZHd1?=
 =?utf-8?B?UndHajAzOFhZb2Jic29ndkZWaWVTK3lNVEtISVdLeGJRMlpEVHUvcllnMW4w?=
 =?utf-8?B?Z2pwajZ5b2FMNVB3R0YwRFAyekVwaytlK2l2RkxIeStITEFvaE8wOStXenQ4?=
 =?utf-8?B?UnZjQUxpSWQvVFRZK2VSS1lQL1RlQ0ZURkhPbktWdTdYYUx5T2J1SUg1a28z?=
 =?utf-8?B?bnlzUDl5ZTBwaXZseGFWUTU5dVUweFJSWWtlRkh2aWtxaCtjeW5Oam42RElo?=
 =?utf-8?B?UFhiKzJLOUd1NFBieURoeUhuZzl0M2dad3RiU2ZuMHNPVDJKQlBmRWRJUXJo?=
 =?utf-8?B?Q2ZwMmI3TGh6NkFKTXZ6UmErM3NCNkw1SEdyaktvS0sxNWMyVkhLZkFQWGYv?=
 =?utf-8?B?d3YvQmg2NDJqNjl0ZnZWVW1CeWRKT3VXb3dsTFdDYjh5WmQ5ZGh1RzJGdUhz?=
 =?utf-8?B?WjhPbTVVSXdwZkhxakpjUWc5R3EzaENheXA4RmVGc3VKRGNqT2JWQWlQY1Fn?=
 =?utf-8?B?TGNvMzBpMW9WdnYrWmtXSXFKMW5zNFlLek83WThPWDRZWGJxK1N6VnFPRjYw?=
 =?utf-8?Q?vMleZmKOJaBNfKiGQgVNX9hFBGl9hlcpoL8BCHv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6070b026-13ec-4687-d96c-08d92fdb20fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 08:54:04.8207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qdlbg5AU9c6gW7AEOnfohHb1ZkICVP18wDS7Rgrx/TazLEH5in5gucY3jbUxqpNATOH92p/+XS4yYRWDOi5/KWzjfTB6OxSZWW7vFDVL404=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5382
Received-SPF: pass client-ip=40.107.20.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7,
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

11.06.2021 22:03, Eric Blake wrote:
> To save the user from having to check 'qemu-img info --backing-chain'
> or other followup command to determine which "depth":n goes beyond the
> chain, add a boolean field "backing" that is set only for unallocated
> portions of the disk.
> 
> Signed-off-by: Eric Blake<eblake@redhat.com>
> ---
> 
> Touches the same iotest output as 1/1.  If we decide that switching to
> "depth":n+1 is too risky, and that the mere addition of "backing":true
> while keeping "depth":n is good enough, then we'd have just one patch,
> instead of this double churn.  Preferences?

If change something, this one patch seems safer. Still, Nir said he don't use qemu-img map, so probably we don't need to modify qemu-img at all? Even our iotests change shows that this change may be incompatible with at least tests..

I'm not against the patch and don't have strict opinion.

And what I really think, is that qemu-img is outdated thing and we'd better develop QMP interface, which can be used with qemu binary or with qemu-storage-daemon.

-- 
Best regards,
Vladimir

