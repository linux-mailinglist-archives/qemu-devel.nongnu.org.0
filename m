Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11641372623
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 09:02:43 +0200 (CEST)
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldp4s-0002GA-4S
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 03:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldozZ-0005ff-TL; Tue, 04 May 2021 02:57:14 -0400
Received: from mail-eopbgr70099.outbound.protection.outlook.com
 ([40.107.7.99]:62175 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldozV-0005Fp-Tj; Tue, 04 May 2021 02:57:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf8TRpugbwu4Ni5pp05mb2vmaOBUMCL3D7HKgIKMwSYDeRDgoZEWcO8iyI2WGl37ULOVBGExjqTQ5F/iAqSOAz2z/hJ8j1ijko8wUwO7ArQWbSx6sCbD/u/gSczVJrAySdKFJmgyH3qDb5nbOasX3CFkdSmyyqvkmDBl6aduCzs18QwRwDELP8Br9Qmdknc6wVyAR2ckNGKfggeHjoCzQGXzpHm8X+XldmC2J4SPsAUzOgw6iuDyNGmvzGXIO8So3jw+Y64KZl+UMeq46FlUDpB3iY/HpiqdjSJibJ4CfcQIEmnCBu0y539hLYaw80LoB9fBxTNGHFr6/2Dag5cg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRQC40UuueESnDWlpRn47TOgWaUI4e+DI+y6uu6M84c=;
 b=knqv77h9HfYaDUKDkDWxJC1P5foXRmbQIjSyZH6llmHWCCzIuziv9f2gncc5ivXROdWe70+aKrlbX2VUVky0ivxjB4gqAhN/8UjzVbNjD8ERUIMSNv6K3Hq4czYajqkQlOHm7St1MKvfLmRIe1l3OgxWvtpnNNx9frBgN21r2tHSLV2AV3efm7gvq4IVA/RQTigAf/wC9cDUbNkqf6OMpDlmB6TYLbWPI/iJSt4BX8u73PCT8XdcK/3DcApUXGRige05SknuUSmDmpDendDZynW6im2+ILy8A4uFH77kSaHP/VEhDO9jCfGm5XwaVuEOL75slfU+y+hnb8O4AsJ/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRQC40UuueESnDWlpRn47TOgWaUI4e+DI+y6uu6M84c=;
 b=giiIkHu4edIPk2n0VscIWlDQPEVhfzT+ticXr9cy3MhitUQlZS5vRnPvxPDE9G70HIBeIMVTzZYD3P7cNndrsfAyPp6hmws6cZg7Xy7kHeMtWtaMo1TvDQQAna4loOThByJemxPQhP1KWp+9ojaPsqxGpuX+nlKOp2qP2ldpLs0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Tue, 4 May
 2021 06:57:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 06:57:06 +0000
Subject: Re: [PATCH 2/6] block: bdrv_reopen_multiple(): fix leak of tran object
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-3-vsementsov@virtuozzo.com>
 <w51tunjhl0z.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97981c7d-e2dd-2849-47d7-ebcb128ef28e@virtuozzo.com>
Date: Tue, 4 May 2021 09:57:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <w51tunjhl0z.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.251) by
 PR3P189CA0070.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Tue, 4 May 2021 06:57:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 643a79bb-38e5-488a-1bb0-08d90ec9d481
X-MS-TrafficTypeDiagnostic: AS8PR08MB6709:
X-Microsoft-Antispam-PRVS: <AS8PR08MB67092395DCF022BA0E71BC8CC15A9@AS8PR08MB6709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l752C/FSzZQyi4FAPzuniteoH20Ex3D3MAhSsViJoiI85cPQBRCAI4rrvf1Dsvf8r7rIBCmYpKPccxDUOmsthZlicBubU6uVwcZVrbD0oHbUdnGaCzejPY8pwXYLqBY6ZtpP4fZnr7TqaEUPXv5DlN8rjMzCCSNTDEGe7ilZtK9ZmqHW6epskfuPSTKscIIC7rgNiq7BULwRrSIGESGRV2oBwIwhcI6cMkcKBBIoflTmqu/A7Hy+i/4qOYBul9zbAQZEf5a+WYEaIbSdAVIq7mIRKHUClX4jmBM3adLAW8/10CrDzQ16sAfha7j8BxGLA/2yQvujiqODJWauYWBmc+jhJykuxsCLd0MWA8zi/i/n8mvSkRyzQSXGeGxaJux56TSSmlTYZi1mrJUUhWjt3eJ0crViK7TiCjGHcTmzzDtzaVMaAws7MwqK3zP7nMgTSDMQJaDTagnoblPFwKCPCLKAJ8/QijcZW/vXMpvBY8A+iLxXwkZmM6rrrGBdQyB3kAHk22vFvlQ8zTOfmZR6tiCVlmd8db/20CZY80X7fsp4TIztPi4NjRaWvfqOHU24ZfAq1eONF4GLcZ6Q0TsbtOfu5j9J1kk7mnZMYWg2OoZYmoRofWzVXHcVodvJWyRnRm8XJmh9JXLPVxkz5sdGUO/VGQUgjKbdKNQrJw9CCWy7O1KwCwm1hhgkujLfq3NB4HJS/s1vMZQGC34LC7edTqa6DA4ga357dQ1D4pP41lQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39840400004)(346002)(26005)(316002)(4744005)(66556008)(38350700002)(6666004)(38100700002)(8936002)(31686004)(86362001)(6486002)(31696002)(83380400001)(8676002)(36756003)(16526019)(956004)(2906002)(5660300002)(52116002)(4326008)(478600001)(16576012)(66476007)(2616005)(66946007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S2tPM2MyY3p2UC9DVGo3TzZuZWR5ekRkOVI4eEJpZ09UWTdxTnNmZ0V2TDgw?=
 =?utf-8?B?MExEdkJOeGFvRnZkcGU2MVRMdlAwV216UWplSDRwMHJHMUdtemJRMDcrb05N?=
 =?utf-8?B?b1VBTTJmZ25adGRKa3dRRmFPVUtWSUUyeDRoM0dnbWVhM2F4S3g2T0FFUURG?=
 =?utf-8?B?d0dtZDEwT1ZVeDU2NXNsZzhjOHo5bkRkai9jbTV2NXVsY3BUdGZINEZuTkF3?=
 =?utf-8?B?SW1sMEc3TTdWRXpjbkowQXhpV3VWMHRYOTkrWGdLa2l4T3laNitHSnowMy80?=
 =?utf-8?B?dVk0RGNhZGZFTDk5VmxFL2xBV2FzdjRVR0VIRC83VzFhUFphejJuRzY1Tkx0?=
 =?utf-8?B?VWFuOENpQ3dIUmZDNktSZGVndWo2Z2FFa0lvNUhFRDFOMy9YelJKUUpnUEZI?=
 =?utf-8?B?N2JGYTRJOVh0QmE4VlF0d2xDQjhqQmhjZXZEWUIyRzVZMzdhNk9OVUVRN1Zm?=
 =?utf-8?B?OWRZYXFFb3ZZMUIyTUI3RlFBN2VYaGc5amRaSkFuY2ZJa3ZMaTRiODNWZ1Bz?=
 =?utf-8?B?bUJKakZDUTk3cDFDRDk3aGN5ZDlFTnJlOUlPTEwvUWUwby9KZzdvaEdYY0Nv?=
 =?utf-8?B?dWpOSXJLak5VenF6QlVEanEvQWcvbEVMZkZETmlOazlWbTl5ZFZOUWtUeU5U?=
 =?utf-8?B?VFIwSWhtTkc3NXA1b0FWZEh6QkIxSFF3b2hhbjVrdG9UMUpqaVM3Yk9Ja3RJ?=
 =?utf-8?B?WEVhUUZjMUlHdVN2YkVLQnFjVHJnbFdJZW0zSThYM3VNbG4yUmZHaEE0QmlN?=
 =?utf-8?B?Z2swWFlPWlNVMHpMN29iaVNMT2JGOGpYUkRiM1hMcVBJb0ZxRWUxYnkxWkRP?=
 =?utf-8?B?amJlOGNycU9mNmxOd245YmU0QVV2K0VQaWhuZXpiYzhKQ1NYaExoeUZGY2N1?=
 =?utf-8?B?YjYvWkpkOExrak9ndG4xSkdNb2ovSkE1NFhDSXJSRjQrc2cxRkVDNzBETzg2?=
 =?utf-8?B?V2oyMTFZQk5ObUpCMTlvS0FHbTdWUnZCRis0bWVCWTZidXF5UndwSjJJc3Vy?=
 =?utf-8?B?dXVyZkE0b0pTcXMrSDNGSzQ0dll3TVNzOWYzcVlvMmdydjE5ZUVKb0Y1NEto?=
 =?utf-8?B?a0MycDZmVmkzTXNjalVMWmhKS0pCRzhLdCtNd2JLZlhhK1JZR1hKMUJ5MXZn?=
 =?utf-8?B?Sy80ZlgxcnlsQVFseFQ1NTF5T2p2MTQyYVFxL09WOXhHY1FHQUtOcFM1TEJv?=
 =?utf-8?B?OEwzTU50OWZvYTdjRUtmaUpFZmtMaWpjSmJBNjhvVi9TdlM5VmhWTnBzVHl1?=
 =?utf-8?B?M2JCSkhmMXVlREIzVHdFejhlMlU2cExqUzN0Y0pZMmwzTWhramtaQ3Zsam1E?=
 =?utf-8?B?QVVFTGhRKzRrSDZPcElIc053MWUyWmc1L3VsS0VtaUhyWXR1RFRUQlVYNllj?=
 =?utf-8?B?cWlHOWR4ZUVYL3RCK0hPelZKZGhWNVRKUmxDZkNvdzZaSGNML25vRDBTS0d5?=
 =?utf-8?B?UHVMU3JRQlErZERNL3ExNnFxSno4UmtIZ0txWlFCaU9UQXNzU0MzMWhFY3hF?=
 =?utf-8?B?dlpxRWlPdGE1MG9TNlZWRytuejBHbyttZTErT3pKZEttOXZCOUNrd2lHYTFU?=
 =?utf-8?B?aUJaR3lWcWlUMFNHVWRtbXRSK3ZnYWx4SVpzZGFmbzJBWmpmeTZ5WDZxcWMx?=
 =?utf-8?B?S0JNZlRCM2ErMU41cEF6OG1ORjU4bkhDVTBpUk1rQlloYWxMZW4ranJXdExx?=
 =?utf-8?B?eTV4em5VS1NyVTlMR28zck0wMXV4aWcvWnVqQW5MZWVnSUZTa1ZpOGJPOVdL?=
 =?utf-8?Q?bpKXVBNszPQ7c+paZgrE5JkHVZBk7GEdrsqE2A8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643a79bb-38e5-488a-1bb0-08d90ec9d481
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 06:57:06.6998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6BsGKIy8TNwU/ziawqg307A5Q9VOL1nbYFk1sibt8tk7564sXlHBYi9cvgcoYD9ysaFP8GDOvSA5Qa/Sr9G8kaXljX9apnJxa/KOhu46/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709
Received-SPF: pass client-ip=40.107.7.99;
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

03.05.2021 18:52, Alberto Garcia wrote:
> On Mon 03 May 2021 01:33:58 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> We have one path, where tran object is created, but we don't touch and
>> don't free it in any way: "goto cleanup" in first loop with calls to
>> bdrv_flush().
>>
>> Fix it simply moving tran_new() call below that loop.
>>
>> Reported-by: Coverity (CID 1452772)
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Fixes: 72373e40fbc7e4218061a8211384db362d3e7348
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 

Thanks!  Still, now I see that Kevin's patch is better ([PATCH 2/2] block: Fix Transaction leak in bdrv_reopen_multiple())


-- 
Best regards,
Vladimir

