Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB633DCB0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:39:23 +0100 (CET)
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMEbC-0002mg-Qx
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lME8C-0005lV-Uo; Tue, 16 Mar 2021 14:09:25 -0400
Received: from mail-eopbgr80137.outbound.protection.outlook.com
 ([40.107.8.137]:31400 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lME88-0004Hd-9i; Tue, 16 Mar 2021 14:09:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY6jJcRPkt8rhT0ZIbK9dCDKKutYQtvdINM64rwVRQ0Fcm9AMj9Zyd7k0/9RRKThye7AygS4IxOiT72YHk0WI1yDCtyFNXDTCNp08Fw7zjSjsQQXaZRFWxBKJPXfLIlrJyS0vt3yQEpBp9Jba2l+gM1tBmEtRRKQou0oAEwAz17tPmqfRClwdz2zJtEiEXNgiuGjqFRb4Y0J718Lb/23o7YOgIsYOG+tS/iRDD2sEI5ux0KnLOyt0gorJYNxt7nn80E0n3JAszadA0b1eyzee6GWGFF7xPXQ3NjWMiu/Tsx93FLB2L4rGkArAmT9SQPyG1bMwWVgNbQ3p5F8xW8YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzp8HnTdQY1JKG6NsNYQmVDkkVuew8dgyAfNoVW8IQI=;
 b=KtCPvpXjoMCpEaCPDIFpEPpkH5pkXT/P0SuN83pjpBMGUD8fefipe0mS21uq3UGhM7RXqXEvLFvSfvlsnxnD3tOrdfJ0Hh8s0w53cUIvqBCDaoTT0R79q7tmMd/hMxPy0+l7Tfizgy9R8p0eAFMeD/IEvECv7iuv7ZSlLGCtgjsdBdEbIBrsa6+mzm8fcxrD8njwIp7LWnRtx24pbhSON1f6A70oIIsfjXBeDstaRg2dBTWUvDV3DO/GxAjsQhaxLYx/wQRJUuq2EVKOYE+v95M8xiXZ24YC2gk0hibKxhwg0arT4u60eJo3ChnHjZ9Kw+IFt8/3kWKjrkXXuXMfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qzp8HnTdQY1JKG6NsNYQmVDkkVuew8dgyAfNoVW8IQI=;
 b=c35Zq7ixZlR86POeMM6Dx5p3+KowbCSuK3AQDTIZhWp8E2PURYHVekKESy4aOYr1mC1OjchdS4kocCRN/Q3gsNspuX6pYDCttSvepx1SAtWhk0Any5KP4GmXU94WXI/c9qt1I2P2GlOrcH1wxHZC2ygxXVYlgF561Pvqvy44Jio=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 18:09:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 18:09:15 +0000
Subject: Re: [PATCH 6/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-7-rvkagan@yandex-team.ru>
 <995a9667-b7ae-3e00-caa5-6c80fc0962f3@virtuozzo.com>
 <YFDWuJ48WU3f6feI@rvkaganb.lan>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4fa12179-109e-2f5e-71c4-ff078d59db4d@virtuozzo.com>
Date: Tue, 16 Mar 2021 21:09:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YFDWuJ48WU3f6feI@rvkaganb.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0145.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0145.eurprd02.prod.outlook.com (2603:10a6:20b:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Tue, 16 Mar 2021 18:09:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6bb88e8-aee3-4338-0763-08d8e8a69b71
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-Microsoft-Antispam-PRVS: <AS8PR08MB62933BD32AF493992CD94322C16B9@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5PZ8Ucqmgpg+a8ODN7fUtc1g5NNUMeTNH0ezGe4iU0CGJf1FusLEaZ4GbQ1S73eKM/vp2hjBoFBdqVsaWl59fNs8de92HXr2nyqH4MRlokoUKl9Vn0zjYmv/KKzXmFCf3iAT/Zr5EaKeFQV2j/PqfVHANQu46uZCGA7tUWTklmzWKCFX6YY9ZCg02GZix1sZHGjVuZHEN4pZzFYQbyua5zpr+nd8kPrKXMrgx3ej1ZksEoeovzDvsihBewJdAl+8eDvPJWMJzPBf3dtJMzYVwLTIdlH+m+WOp3s15eOJAnikq461u9BwLPJpGscMzrUfLV2tzow+JAoE2So0IjnaWSoI9veCwFhu8CsMfiNq/D0hxd7I5ivs5PIEURNQHAJPGff3kZT/Jxs+fSXuGzVmF19+Dc9VMVEjakiP+JXM12mR58DhEcGF0oCxLnrAEne4klSsnjsRXYvdS4LOlgambZtEGAu1g0QCelQ47m3eDhU1AwvreeT2DusrkTwdRH8PUKleyxZPsDtkQ4B5AUWBTVpVo81X9vmhPOmh6fGpTElUGWkRrE9Gn8IBAHxMBnf5zT9oT3x8U1suo7sqQkJW33KGeJa4dS3MwMBKruVaaPKAHSD4tq2rcYANbwps5+tSwWEb0xMIpjxq3BPGFLqqNyMSku+zQZUDNeD234/mPGe8MfgTTKAmgpHx4kNmLj+ekrG1g1aBSDXHROSnygZSltoBFr2KA4Pzj5cKlB2DBRo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39840400004)(136003)(346002)(366004)(8936002)(26005)(86362001)(66476007)(66946007)(52116002)(66556008)(2616005)(5660300002)(956004)(31696002)(8676002)(16576012)(36756003)(478600001)(83380400001)(186003)(6486002)(316002)(2906002)(16526019)(110136005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mmc3Y1ZYa1UzdjhiYnRob3dwOW0rMXdmWkhGQVp2bTdjQTU0ZkZSYUMva29j?=
 =?utf-8?B?cEpTUXVhemdybElaWThJTUVoUFhkamZJNDE3cVMzM3pzMXR0Y0paUytwMzdB?=
 =?utf-8?B?YjNUSGxCdm9TaU5mUjFneGJwNG92YUZyVDI0SmhGdW9oSkR2aE9GQURzckRs?=
 =?utf-8?B?bkZrNzViSHRYVXRQV0RFL1FiQnppVjdXb1hvQUFFQkRqdWs5WlAxQVF5Qndj?=
 =?utf-8?B?VCtCM3pjUWgxSHJ3enNIYXJlN3JNOHI2QnhRdWlkeTl1L1F1Z013NkI1VFlE?=
 =?utf-8?B?L2xHbjdwMGRubVgrWmVYMDFHdWM5MFE2RExqbVcvUFYwVGdQK0kvUkplR3M2?=
 =?utf-8?B?TFJFZXNwQTVQTjR6TnV6TVllYlJpc2pxamJobDFZN2V3SWZpeStWU3pxUit0?=
 =?utf-8?B?Z0hRcmZ4VjVSVHZ0UnpiWjNIaUVLeHF4NEVneXN4MUhYa0dXSFZjL0hJd25x?=
 =?utf-8?B?NDZaZzlOZFp3ZjNKcFE1dEtvRzh5LzF0YXQ1ZitqUDc1RWxQRzhlb1RnMllz?=
 =?utf-8?B?NUltdHU0RXUyQWIxNjlSM1hMSTd5cFo1bnVsa3FWdkZLK1ZYS1pHaCtSNUNI?=
 =?utf-8?B?M1ozcUlOaGpLRVQ5UDBlN1pxVUs2MXkweUk4MUVFOVpWbVNpdERRMEJyUzVl?=
 =?utf-8?B?a0w5V1lPOS9VVm8vTnBZSDlrQkxaTW5xM3BxTHZsbDJLSTYrWEw2Z2pRSy9h?=
 =?utf-8?B?SWdJMGpqOVV0a0Jyc3FldXhac2Flamlwckw0SnFGZUFjZ3RaeEZESVJXVGFa?=
 =?utf-8?B?eWVOTVdyMGVzd3IvVEdnWTBLc0h0bkJVL0dDbDlKajFHWXlidHVyNmJPbUhw?=
 =?utf-8?B?NUdkVFZiWDlXZDM2V3RKdWxrUHJLYVU1Z1JLQUpyMEtIbnQzMGhGWnQ4NkRu?=
 =?utf-8?B?bXZNQUl6Z0ZwVUJqbHkwbGZ2dGFyOFZTTGhJWXBRTHpqcFVGdzJ1NEtyTUZ5?=
 =?utf-8?B?MVlCc09LZTZ3UzNlR0NOZXBqazdnbGMraWlPZjJvNUNSL05HMkdwRXg2WTRJ?=
 =?utf-8?B?ejhWVVJwMG9XanR5TFZSNWptcHNRbUcwMytPRmREWDdBREY3blJTek5IdzFh?=
 =?utf-8?B?Z2MvdWE4Qko4TkpyWjRtZXhVVUdTRWdBS3BKYjM1aXJ2dVBuU2VGLzBzdHQx?=
 =?utf-8?B?VHZxdEhmekJ6S0JBS05rWTJhTFZnMDFFYVFYM0VCdlFiK0h3NjBQbUIyK3BQ?=
 =?utf-8?B?cjRTQW5tdTBsV2FuMzNCd2VEamxZTnpZZ0xvZ1YzRlUrSVFWbWFMRTNKcTZY?=
 =?utf-8?B?MEZFUkY3SEcvUlJyTXdrTjM2djREelFCR2taSldJSnA5MmNTS0ZuaE82Qmt5?=
 =?utf-8?B?cHFwZ0VXMVhmRUdFL1pqZVR0U1pVN3lqeHZ4RTBTTGcwOENTOCsvTlpiMG9x?=
 =?utf-8?B?RWphVTlyMXBldWo3NHRJelV6aStCU0dlVzhneGxka2xRR3BDa2dYYUpMUC9H?=
 =?utf-8?B?V1k1ZUhzV1FBWXo4NitlSklybExvamZFYk5WaGRSVFdlVUI1Qll3WjVOc3RX?=
 =?utf-8?B?NEpMa3Z5bUtBNnMwRXI5bDZHSjVraWFRZEZ6ZkpLKzlicktRVWNEd3hFejA5?=
 =?utf-8?B?NHNzTEgzZDhRVEpHUjRtV3VvZFV4MVhFeXBFOWpidlprQ2t0Vnp4Zm5vZFJH?=
 =?utf-8?B?d2htZE9pV0ZsakJuZDI5VjdhbFVRajN2OWFWMGU1YjZjbS9jZk9WeGlSTDFD?=
 =?utf-8?B?eFk4bVpnWndoRG5MU1kvZHgvTjBPZGMwMmwwbFNxelJkWjFMQ29jOGpZZmdE?=
 =?utf-8?Q?I8etFl7uWwtTBi0/OpIJnIn0u3AwCJ8NZljAdct?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bb88e8-aee3-4338-0763-08d8e8a69b71
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 18:09:15.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12A0/61UB+t89NXsXU8FtTKK/KPd8L+HWxM/4iiv7esJNdVqcLPaDvJVenTe86y6QGdzkq7o5tFs9681Vj2jF6M7bf2ICFrDBfKuusKaLVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.8.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

16.03.2021 19:03, Roman Kagan wrote:
> On Mon, Mar 15, 2021 at 11:10:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 15.03.2021 09:06, Roman Kagan wrote:
>>> The reconnection logic doesn't need to stop while in a drained section.
>>> Moreover it has to be active during the drained section, as the requests
>>> that were caught in-flight with the connection to the server broken can
>>> only usefully get drained if the connection is restored.  Otherwise such
>>> requests can only either stall resulting in a deadlock (before
>>> 8c517de24a), or be aborted defeating the purpose of the reconnection
>>> machinery (after 8c517de24a).
>>>
>>> Since the pieces of the reconnection logic are now properly migrated
>>> from one aio_context to another, it appears safe to just stop messing
>>> with the drained section in the reconnection code.
>>>
>>> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
>>
>> I'd not think that it "fixes" it. Behavior changes.. But 5ad81b4946
>> didn't introduce any bugs.
> 
> I guess you're right.
> 
> In fact I did reproduce the situation when the drain made no progress
> exactly becase the only in-flight reference was taken by the
> connection_co, but it may be due to some intermediate stage of the patch
> development so I need to do a more thorough analysis to tell if it was
> triggerable with the original code.
> 
>>> Fixes: 8c517de24a ("block/nbd: fix drain dead-lock because of nbd reconnect-delay")
>>
>> And here..
>>
>> 1. There is an existing problem (unrelated to nbd) in Qemu that long
>> io request which we have to wait for at drained_begin may trigger a
>> dead lock
>> (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html)
>>
>> 2. So, when we have nbd reconnect (and therefore long io requests) we
>> simply trigger this deadlock.. That's why I decided to cancel the
>> requests (assuming they will most probably fail anyway).
>>
>> I agree that nbd driver is wrong place for fixing the problem
>> described in
>> (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html),
>> but if you just revert 8c517de24a, you'll see the deadlock again..
> 
> I may have misunderstood that thread, but isn't that deadlock exactly
> due to the requests being unable to ever drain because the
> reconnection process is suspended while the drain is in progress?
> 


Hmm, I didn't thought about it this way.  What you mean is that reconnection is cancelled on drain_begin, so drain_begin will never finish, because it waits for requests, which will never be reconnected. So, you are right it's a deadlock too.

But as I remember what is described in 8c517de24a is another deadlock, triggered by "just a long request during drain_begin". And it may be triggered again, if the we'll try to reconnect for several seconds during drained_begin() instead of cancelling requests. Didn't you try the scenario described in 8c517de24a on top of your series?



-- 
Best regards,
Vladimir

