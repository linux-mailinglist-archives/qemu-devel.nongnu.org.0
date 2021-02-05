Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8626310DB9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:18:29 +0100 (CET)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83oR-0001CJ-7z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l83n1-0008OR-U0; Fri, 05 Feb 2021 11:16:59 -0500
Received: from mail-eopbgr00120.outbound.protection.outlook.com
 ([40.107.0.120]:45185 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l83mu-0002Ef-Tc; Fri, 05 Feb 2021 11:16:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9RX0iIzy+UzFIUkeMpiE8QO5sIGPxI3MJDY/jRoZQGAqAYrmafMp5PjIR75u9G4XKfT5925AwwN6t0ucEXGJmdEJmhjz0ftWRdOalM/34Qa2z6AC5UEKBUW0pXp4/GyLvIvPVM/I5EYx2lD+xI/UGmfyzTx+we6d7BvVfo7OXRCl7nNKXnItAOzffAUNNYNOWSHq0RmzOmU9/RXHpXvqyYiPpPXg0N/kedMU0Xz9YTnLPmTFu104DuXE3sIpABka6s7nZ/3ngm0xW5emJxtyKsFGcgh6UcCFR0UOPJ2+MjdjG1Rszm/BvQgULPzkX1e0kiCkHZgGFrgU3shxuOx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nJ5OoF7rDB3Zyh+MP6wuZ/2J6vqv+c0b2y+mNXaPag=;
 b=beOQpMM4sfPvt6TW39oDWZG30IZFTbUp663mFawD6hNFZrg1ZTVt3qF6s45JPFZPlufH5/0dHcAm7qlgLF7TwSJXiucmdSgDvdtQvyf9iYklwUYBCmJXq84ztOody5Q/XVunI1sygepuKrWuy3rbHqAsh0OO9EceHChU1vwkwzBKk3SggRDw3WfIVFgEvyI7aW+wkpSSN1NcL7WKObR6jQrLtiECj3jALRi/i6FDXbT4ZZ5Wef4dRH4RAe5VlGCmb2WswOEAwraUayiSaU/h+CekfjTFbYiuceDpjMGKpVogJ76blCZ/w0Nlxrppa00DCy+8M3izSwgGpcdOlG+JMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nJ5OoF7rDB3Zyh+MP6wuZ/2J6vqv+c0b2y+mNXaPag=;
 b=LT+LOxBuEmejhi24E7mjyRb9BHJ+KgNVAjOkpKD5HbM5BuQKiqd2104gsD2fsvFa8DQLb7XRzt0lQL6W/+MaXmOt1ktU8JyxaLz7zUAHe8VTn7lX0qcw4w9hPY2f+ggbQL+9SNLU2voYx09glnWnGQiv9hlZ9QqqchnXbLJGYt0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3543.eurprd08.prod.outlook.com (2603:10a6:20b:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 5 Feb
 2021 16:16:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:16:48 +0000
Subject: Re: [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all
 contexts
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-30-vsementsov@virtuozzo.com>
 <20210205160158.GE7072@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b9af714d-3a3a-af8d-fb96-7807553bd55e@virtuozzo.com>
Date: Fri, 5 Feb 2021 19:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205160158.GE7072@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM0PR07CA0006.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 16:16:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c07e125-7ae9-4232-0012-08d8c9f1706a
X-MS-TrafficTypeDiagnostic: AM6PR08MB3543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3543144B0F0AE8080072EB34C1B29@AM6PR08MB3543.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cEamm/PrBhVA4hmbKvOhT6DOEmN2Bj5ySXEIw8ODei3uWjS5o8Bj7ti9fsJY1N2uRtirzllFNz7EBhweht/xOT2qRZwdcm3J9kMca2ioqyMMEWnV9SRVp1+KwGtOPaRNEL0ZPnGR6BTrfN3Aagq3jSczZQLJEEgrABMCWOKEutGFmw6yS+Hj6Nm6TX8V41KEhCPnuUlWtF+B4CKs+ZreWTloPAoYZ2dFNbSDk642qaB2IwDFuThTV5TSR0UMQQVA9oq3kP28ZHnln0RnH9AzM8MUC8swWqJ8OMyb8RgUEpBRxguTj3Szpz+rMNd807JzFEENPj7WBMHdqG4R9+5PmgNLNqEp2HG+48LMGWo5i91WqjrlOuDeIRq7bgoYMegdQ/68NyobS5X9lVGQTIjKWKFxWrVcSNim/NiF4eaEh4BFYJQ7C8mtInHp/tkQ7qVpivrkdT0syaLPRsPnqsOMr8XamQPLS4FitOSo0cNbaZELKch7tcDYTdBWfd8/btbdPtaUnZWPJRK4AUtU3aQOHqxh4UdCB1kaYgIXnWM0Rg5/7Di0c9bCLtDLCSQUF2NbsgVvhiImTAM04Z8GW/XlljW4TXs+7esUIaI/23YoCVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(366004)(136003)(346002)(4326008)(66556008)(66946007)(6916009)(31696002)(86362001)(107886003)(31686004)(2906002)(6486002)(16526019)(52116002)(8936002)(5660300002)(8676002)(478600001)(186003)(66476007)(2616005)(316002)(956004)(16576012)(36756003)(6666004)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?emhKeWtPbHZqeFB0RmhQcDVPWk1TVFdEeFNlN1RQd2dhNE1JamdFU2xNdlNJ?=
 =?utf-8?B?QUVqeTNISGpnb0tYRlJHWkV4akdzaXN3aG8vbGdTekc0bVBrdVpuZi9NenJr?=
 =?utf-8?B?ekRDYnhZbHRubjNSenlOR1VjY3hEQ3Q5bjJiN2h5Mmx1MThGY3pHSkNKS3VO?=
 =?utf-8?B?Q3dyakhKcWd2azBQNnl4ZnE2NTU5eU5vM1NJMDlsM2dFZ3dzeTk4NGpIK082?=
 =?utf-8?B?L055aUgwR2wzdnFvWXUrMGNURlFiY2U4dkp4RmZ3ZU04dzgyZVMyREt6eVcy?=
 =?utf-8?B?NUFsUXVvSjg1Y202RndWZGFvWjQyemNKU0grQmRqVHBvRktra2Z0bHhhQ3dL?=
 =?utf-8?B?VERlanVNaTU0d2ZXQjhQY0xwVWN4Sktic2FjM2hqSjJOdHllYkJVdnZjU3BX?=
 =?utf-8?B?MnZWTVAxcHdjNTJ4KzJ1TjJhK0NUcE1rNjd5Rk1NWW1hbWoza3NIeEZqV280?=
 =?utf-8?B?SlNMcU9sSHRnU0ptelJKTEt6SUZjVW9oOEMxaUNvQVc3QVRBV2ZDVFpsazVG?=
 =?utf-8?B?c2FjZFYwU3VJZE85MVRoLzVsZFp2UnR6MU9sdjBZNmhwaG0wdWp4SHpyRStz?=
 =?utf-8?B?ME43NGRpMklHWm9CeFR1Y2kzMDFpRzlSQnNBZTlhWSt1WjlaOUV3bTRyNDBt?=
 =?utf-8?B?SW44dm9lK2hlTWFHRjlHWGZCTSsvWlhJTkF3aXk3SWloUDFyZHdrYUdTamdz?=
 =?utf-8?B?SlVVcjNuM0lzMEE5d3k4ZFN3VE81blhlVXlDWGpuZHNOMU91Z0NXS1VVN2k3?=
 =?utf-8?B?VmR0aXdreE11U0QyOEdmVUI5OGFUd0tkdE5nZ084ZFdObHdIWFp5TDJQZ0d6?=
 =?utf-8?B?TEQvbnJPMWJBN3JTKzJ6L2xNK0grWDJqeDl5MlZQYVZvUXQ3Uk54OHdrMVcr?=
 =?utf-8?B?a0M0WTN2ampXYnJOUVZ2eWlSVEFha25mT3g0Skgwb2FVYlI5bkdiOHloYkd6?=
 =?utf-8?B?TlVRTjFxbDczU0o2cWZoc09YZHlsd29GTkhtcFJQYW50NzVRL3FLN3hOeUtK?=
 =?utf-8?B?eUJ4L25FTHBOVmh6UG5Ub1ZNK25xd2l6a050VmVlTXhMYXlkTzdrMnA3bjZp?=
 =?utf-8?B?Qk1wMmZ4eDh6V1c0WjUvQzN5c2lhNnRialZ6OTJrOFV6MWFTS0NPQlhLcUNG?=
 =?utf-8?B?Um0rTm1mWnduNUpJemorMTNCY0xCUHM1UWRDTEw4TWNRQjVMN1VMOGtwNGhU?=
 =?utf-8?B?UUZyODNQSG9zT0dHRG1LaEkxZDM4S1pGWTJWb3Y4S0pVc05yOVhHdTY2eVA2?=
 =?utf-8?B?bFR6NmF2RzgrcnptNnhyVWJER1labVdOWDB0WWlXQTdaWm9TUU9lR2diTTl0?=
 =?utf-8?B?YThKd3VwUHdyRmRFa1dUQitvSEJaOTlia0pqc2Q3UnowZlBIbnJuY2lmeUls?=
 =?utf-8?B?czFoWTk5ZlhNblpLRlRCSlIyaVYvNldFV3lud2V3bStYNjhMV2UrVVpYVFZu?=
 =?utf-8?B?TFFNTlp4MGxlU0xUbEcrTG1OV0xIOHo3YVpQeHNZNHQ4N3JJK2RkTUlWTmRO?=
 =?utf-8?B?V3JSUTZ4c0o4RlVKK3E4MWlHT3VETkNnR0hEa1RjMHlQQzJUYXA0cW5oMUxk?=
 =?utf-8?B?MEhkTlJ5bmY4dmFJWG14dWJWQk1WaE5GN21ldm9wZ0hndWFwZThSU1UvZXRP?=
 =?utf-8?B?Zm5KQmxsN0tUODJ0K2t5Tm1pZ3Bta3FZSFRVcmhDRXc2WVJwWUFOajRDZnp6?=
 =?utf-8?B?QThEam5kUWlad3JyaldGYXg2eXdWWkQ1NURFRXVTM0RscU9KSDlhRVhyN1lU?=
 =?utf-8?Q?st24Yc6EJ0L0JCD3ZzkqeeLCHqxe1lF5QcfAOxi?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c07e125-7ae9-4232-0012-08d8c9f1706a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:16:48.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9SJVPp59Ktp4llTEq4SEoucRalsCuZwvKA92SmSy7+qJvnJLAjLUwvf8qfVaA91bn2V/AR/RSNxvk5XRvQrdUctAqk6EnfzwC3VJJ9N4nE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3543
Received-SPF: pass client-ip=40.107.0.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7,
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

05.02.2021 19:01, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> During reopen we may add backing bs from other aio context, which may
>> lead to changing original context of top bs.
>>
>> We are going to move graph modification to prepare stage. So, it will
>> be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
>> non-original aio context, which we didn't aquire which leads to crash.
>>
>> More correct would be to acquire all aio context we are going to work
>> with. And the simplest ways is to just acquire all of them. It may be
>> optimized later if needed.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> I'm afraid it's not as easy. Holding the lock of more than one
> AioContext is always a bit risky with respect to deadlocks.
> 
> For example, changing the AioContext of a node with
> bdrv_set_aio_context_ignore() has explicit rules that are now violated:
> 
>   * The caller must own the AioContext lock for the old AioContext of bs, but it
>   * must not own the AioContext lock for new_context (unless new_context is the
>   * same as the current context of bs).
> 
> Draining while holding all AioContext locks is suspicious, too. I think
> I have seen deadlocks before, which is why bdrv_drain_all_*() are
> careful to only ever lock a single AioContext at a time.
> 
> Kevin
> 

That's not good :\ Hmm, probably we just should flush everything before all graph modifications.

-- 
Best regards,
Vladimir

