Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47D381674
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 09:12:51 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhoTi-0006dB-Cr
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 03:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhoSh-0005o6-Hp; Sat, 15 May 2021 03:11:47 -0400
Received: from mail-eopbgr80097.outbound.protection.outlook.com
 ([40.107.8.97]:13440 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhoSe-0004y5-WB; Sat, 15 May 2021 03:11:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZllHO6a69QWFCOX6TNyvtieljDiDw2WEhHAPezZNuG8HlQkmpS/fwTiAKcLoG/W21nv7OYilHuFfUPdOI0IDjF+58UbqpuoEGrHV7vAUIsLm12Mhs2rQcI5LF9k9zzNb5r2WD10XHaE0FoPo3SBRQtRuEcfTxQk9CrsxdjytdeCGPR6Ej8UYs1iMBvn7ja8vk/v/8/CyOGo0im/fuj4CgzP0HN88cxmLabwuePyOoxjzVLUOt2mxAsWgBdzdTFHbwwZb9JJmy824qhFQTKQDBnaGvDlkDhsjfJNvwadbL3weADdlGPwGnyWl8E8Ny7B2JdjHc6TcPVDWJ6T+0wJuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4bCN+B3uymZi5jgELrVYTCJKGtCKkY+3wYihVS7yHI=;
 b=I2O1Ehcm0GRy16OywcsNX0/Xf56+7sihfYJ3IPBVkCdMPp7OgvH0bzVHmHoY79+5jq1V31jiAf8Xzq9VekmAZHrpGqRsGnHrPFZPj9cUNaOq6uvKLSoO7RCqlZ+RFFEIxWF1JsOUsravFBGsqv+R43IZ8U7nYIISg+FMju2h2JhoGPxxne3SDxPkSUUB6zlm9iuSoFQWIbf0ic3TQYEve5Ynmcl2HjlkTdp7aPYUAo8ZPQzNXjW9ZkRbvRUMVMi8XuRvT8AA93Uw6TvUypb9GtIr9v4oGFgOHfa7bgKGDPs3cgw8LsDeeKHjNokrfzefWi7+1cA6qpviaVBl7r3MeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4bCN+B3uymZi5jgELrVYTCJKGtCKkY+3wYihVS7yHI=;
 b=ojIcyw4xHHKqO0LWESTljZOTx9a3rC4EXr7or0vZqkuUgG6Im06PG/PIvoQK/msiGWVCcDcLnsYQUF4VMdpj7meSiEMI8MFwHnyBySqdF+VCeVEKElSjzE1UEnSZxQXugAnGFa8DKV6mrQxr+knNzkSjRYVhq3cWOPqh93wl1gM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 07:11:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 07:11:40 +0000
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
 <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
 <6b9d7c37-aaf7-1745-260b-4cce8f0891ee@virtuozzo.com>
 <8008b39d-905c-3858-a96f-8609801a4ae0@redhat.com>
 <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
 <ce9c970e-d7f2-fef9-8b07-b1fc5f634cc6@redhat.com>
 <dfb58ab5-a7ea-edf8-5278-6b666aa6097b@virtuozzo.com>
 <dc635abd-6beb-863a-6560-1531a0cd5dc6@redhat.com>
Message-ID: <3db7b2d0-1030-a449-3e4a-4ac9c0ec48eb@virtuozzo.com>
Date: Sat, 15 May 2021 10:11:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <dc635abd-6beb-863a-6560-1531a0cd5dc6@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.249) by
 PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Sat, 15 May 2021 07:11:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df044834-fc3f-45fd-97fd-08d91770afdf
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-Microsoft-Antispam-PRVS: <AM6PR08MB52063D379BEF0458BD36013AC12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rsauFrkWYeYP/OkcNzMQ3xQ0G0spHhhitcLKdSGbX0fioVbRphlJmTtefjfaquZtM6meiibgKNIWg9qxL/xXBJZydwuSi9DwLC0FLng5Xr8WHJOvPxgKB7tNUA2BvAwTXAfXS7PAOmezHgmVI2a6wcnvsHCsCetCLZIQh+otmJuv9kOvP4Uq9hKYCdRM4DHg26PfHHemYV3XQAqkfIIFNLgNk+gXGXj2rzHdVPmhyCRkiT/1MO4sUBichgb0Nue/KLqgyH6bw3LdvNTWtB/OW0PpgytVku2opOZp2LBfZyK8Qxa/hkW1ig4R4llny/RLIudddpBIy7RmjID+HLoR8VeysQ2EiOEy3kyBqyKamiPDx9aDHpubhoQa5B7E995YV6WBTOVpAhLY0Qk45ElzX8blaNgHyte1Jm42Z4xzKE507j0Gb7Prx+DNTYWuzSJadI7lJb0ZWqpOknGxDJa4hR3uvDVXqhb5AkGnl1KUXM6GYl7ceqRo+toWqL/GrMxmOTRuc8C93FNY5MDYjzDphMC2Rg88Fg9f3cKVtSg2K5lWfusoSYPBIA4D+MFir6hbe6VRXT9rvwN8MydqTJJhRGuS0GOZwX9AFmQU7jDezmeWB4HOIgnLXrxLGQSwfIxav/rRer5skua2718hdN0ExnRr4DxxpwDkyN0VAb89eKBppMsq1DEiMbQVbGAkH34tVAQ4JXKBlAfWBj6K7vIC/oDPSchL2OgdK1+NGrGlp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39840400004)(366004)(376002)(26005)(54906003)(316002)(110136005)(38100700002)(2906002)(16576012)(186003)(66556008)(66946007)(66476007)(16526019)(478600001)(38350700002)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(8676002)(956004)(6486002)(31696002)(4326008)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?WF3df/+hQCf3lXvuPKZ6Tt2yM7quoz7e8KE5l1TquVwVnNQoxXeG7xhf?=
 =?Windows-1252?Q?z9YcovfsD1QzahOTtF/PN87k5E5CWkiesDAtbhw0A47clkTyoMHLsc9G?=
 =?Windows-1252?Q?qOZ3v89mAjLhpD866GFErDld/M7eEbz1o29FkNePyFLN0j6Mfbgp9noS?=
 =?Windows-1252?Q?Kyd+uaxT73J8Iuf56RzRYfWdiJ2KwU6zGVQtx83dIC94Ng9+LNHC2bKZ?=
 =?Windows-1252?Q?ZPzYZUqhrHKvc86kSRP00GCoO6shTu4Y5LLNhRk3iuEXryMxm7xtqo8q?=
 =?Windows-1252?Q?8mszp9YZnCYd8Omd+HNznELFRZ1B/ynY/0IlXrSSRhl/JPzCfIAy+l8M?=
 =?Windows-1252?Q?x8zBHY6OFVJuwb0ScTazqp20YhUJiWQEFCiDAHtQS6bNZg5KlqTnhKZw?=
 =?Windows-1252?Q?5tiv7U66FQ8HFrGP/DPyZBgf8C5P1BikPG+MstCG+wX7J3+7tzYmBAGj?=
 =?Windows-1252?Q?HzE1B+Kx7Zk7pTB5nkiGvrUN+ovTKGZTs1Kff59VTzHDNO30oIJXyN9p?=
 =?Windows-1252?Q?u9MGRgP6eajS86BtVRq83MyHUbyVg1NwEmpWDWcIN6wqWLoBzh6xxBWa?=
 =?Windows-1252?Q?Eb6TV88UArMOhuzHffEnQM3gGFMXgNQNIefhXT2MRtwQOBhi9uE4+6x9?=
 =?Windows-1252?Q?XkMVeZ+qGWhcET0YVwg55UcnnLcv1XOhsNUO1ic8i4DfWsl26zEkfQQH?=
 =?Windows-1252?Q?vgHuuanMA18fqJTVY1DSlkLMmw0WabajxaRODivCu6n2opxvQbY0fBPD?=
 =?Windows-1252?Q?vBTRrQyus/RdsUm+Idb80Xkl7eAy7S9g6kglXVbNTjhdnKo1W2+HEtfV?=
 =?Windows-1252?Q?507IZ15xdVVHKVc4VdqNrvG0ctVo94fEkJEO+UHpjCHcRYBfHJ9NIUEV?=
 =?Windows-1252?Q?saGB8TlKt8wuJ6jHZEGp4xjcDNe4O4WBmwEFIjgf31bwTXNutIS6tlQP?=
 =?Windows-1252?Q?Q98xPKBVB3tJOQc8uCggkSexnOxoTF+T9AZrdEs4XPqO+DuVwlg+l5wd?=
 =?Windows-1252?Q?QbZioXLhnb/9Neqs61zqz4Z21leM5spq7nIXwLIglKplQxvkD/cvhvMk?=
 =?Windows-1252?Q?MK8I8zWTQICHZ7yBPnOXHhCXbE+6FQhdJWh5rPBMu647KtxjXgquDA2C?=
 =?Windows-1252?Q?QocLXUsDiXAz3CS2NNAGXjipER4M7oWRCq04ydqcA1FXiAzBS3J9j1ah?=
 =?Windows-1252?Q?UMi6P+T4jhMToC9N9horNwJq8WL6k5QQzsg3k+O7ZX+cavqIQfS+KTF3?=
 =?Windows-1252?Q?OKYDLpWDf+jk63GqLjwjBgz5cDnQNJjzjxUrlWxShNhrhOjs52CtkGX+?=
 =?Windows-1252?Q?PBDSsYFue4mfsh5oNng862NJj4v/ay8BWlMcCXasdPXz/OgqERDbSkWs?=
 =?Windows-1252?Q?tGN8ZOedckzVrlpNxLBBj/xqxBKYYfUBzhJbg55c9Jo8X4C8ALd1nrGl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df044834-fc3f-45fd-97fd-08d91770afdf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 07:11:40.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnR8V1Y6mwUfC+3E0NqQhqCuCWPPEkNyj6Ku5wI9qxvpL8zrvxoJJ3zElTfC5COERHuAcbg4l/QhMYDAIzzZCuChS5pm29QnQPMBEi7gcS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.8.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

15.05.2021 00:53, Emanuele Giuseppe Esposito wrote:
> 
>>>>>> we want to get from shres here, after possible call to block_copy_task_shrink(), as task->bytes may be reduced.
>>>>>
>>>>> Ah right, I missed that. So I guess if we want the caller to protect co-shared-resource, get_from_shres stays where it is, and put_ instead can still go into task_end (with a boolean enabling it).
>>>>
>>>> honestly, I don't follow how it helps thread-safety
>>>
>>>  From my understanding, the whole point here is to have no lock in co-shared-resource but let the caller take care of it (block-copy).
>>>
>>> The above was just an idea on how to do it.
>>
>> But how moving co_put_to_shres() make it thread-safe? Nothing in block-copy is thread-safe yet..
>>
> Sorry this is my bad, I did not explain it properly. If you look closely at the diff I sent, there are locks in a similar way of my block-copy initial patch. So I am essentially assuming that block-copy has already locks, and moving co_put_to_shres in block_copy_task_end has the purpose of moving shres "in a function that has a critical section".


Hm. Understand now. If you go this way, I'd better add a critical section and keep shres operations where they are now. We don't have shres operation in task creation, so should not have in task finalization. Shres operations are kept in seperate. It probably not bad to refactor it to make shres operations as a part of task manipulation functions, but it would require more accurate refactoring, simpler is to keep it as is.


-- 
Best regards,
Vladimir

