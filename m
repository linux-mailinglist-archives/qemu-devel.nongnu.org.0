Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ECF37B6BC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:18:09 +0200 (CEST)
Received: from localhost ([::1]:34398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgj8C-0000vi-EZ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgj5k-0008FB-DN; Wed, 12 May 2021 03:15:36 -0400
Received: from mail-eopbgr30104.outbound.protection.outlook.com
 ([40.107.3.104]:6634 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lgj5i-0000EW-L7; Wed, 12 May 2021 03:15:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdHuqnqDA9fsOXHBDdnpPWBKLdBc8NksJrqlT5OMk0iAd5BPS7ieGrVAct/sSQ6Bhw0Czf8lOIaQjSMchRtvXWcgbsEIiWE0Ww9GsvdFTLg8Gbsv4Grrst8Kkg7bXrg4PYOtnwXL3n0UEzmmRNlsrazYeBSFdIGaGwBwNY51DyMV8SxUHQK7xbOOKPiybD/Lm/GmIEMEdaTLqg3hK3hr9RuVb/j/BxvjEIz+Sxm9rdBbJtBpp3uJWJ9AZrH+QosXUl4qWnASvdKAboi6NRDnKErleBroI65UZKNwCQF77Y3p8L25hXiXQ9KzxqRVgYJ2v+whUCzvrzGCfmv/CErXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/xVO9vzqIOJaaVttbAORIfYKba6nc2/4lpWXymNUSc=;
 b=kSaDePt9sT9MD+hirVoj/4ODV98Dr1aGyw2x6vzABQ0ChfXzwDmkOg1NAlmQ6/qlV8IycjEQKfZmXKZzC773eJmGqnhu8TlkunAGycfbphWXlTvPa0x+wEB9ek/cXVOLxgzOYqXy2fjyZLUnNXKhQDFTpz3ZD4qxhJBo0+ligNBSfifCgWF+pOZYYna5gdmEA1zKNtl78vIdTlMUaVwGREh83Y6MxpJLPLvQ41AlpjT7CnWthC6008SiPsdGDwQEdcadkpnVKveEkYiEui/c6H3yzmLHyRtw3QNTL10YpKCW8VdJmlbAlqL6Z4oJcIjWJValGQU1P1aelNKvc4jIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/xVO9vzqIOJaaVttbAORIfYKba6nc2/4lpWXymNUSc=;
 b=ZGtOB8Sf1WoKrdqKUuzckEVRSZfrBz/W7vJmHW/2ivg5PrZ5Ea5FuR971tSinY51ep0DbUTVIFWA0JQaxoPeCYyEZGv58BAsIq0pJ3bKyJBjsLzMB3TCY1IAt0rQTzrzuvbGz1k0w1A/yYK6974vGNCD5+o6lhlba6afrMjWQo8=
Authentication-Results: euphon.net; dkim=none (message not signed)
 header.d=none;euphon.net; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 07:15:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 07:15:30 +0000
Subject: Re: [PATCH v3 06/33] util/async: aio_co_schedule(): support
 reschedule in same ctx
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-7-vsementsov@virtuozzo.com>
 <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19ff6e67-e548-14df-ac7e-8b0a3bf7a798@virtuozzo.com>
Date: Wed, 12 May 2021 10:15:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <32f2b6f0-2c31-942d-cbe2-81eda2a43fc0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM4P190CA0020.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM4P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 07:15:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3bb2fc6-d61e-43c7-8d84-08d91515b9ca
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206D3C9CE27F706687C6AFFC1529@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eUf9FLbz74eaedZixBwwxbSYDptFKBN/prFWcwJyn7rWhBNi/f6fhY6nxnwYujdlDm+9MkPkMer/qhhRhlODc6BM/HAzDqfzIcX8SGSaaJcjD73vu2MSZ2FkSEvaltv73ykERvM3jGxcfxZRmkbDnFv3tqahiis/LpIok10OkDSHzRCoTWd0Li3yf3exlZExeYfWkSVVSJuSiNichYw/GcT3IBfbAx0NVMHMgzAtVwzZUsgv/J86nDvP7HRhx+O+tSyq68W18jrdAoCokgAKtPX7O+kzeXO9biO4hX1RrjApheZnKY957+2ZiUc9SxHTqnWjESwqw6ZKkH+X/V/dPBakFDKoGLFRRhGCWSHo7MZ3+TcdNrgXlEaAE0d9qqul2K0iRF6b/qDRIZvIGEXOdu6asLMkgtbcMvJ4z1kKwLR80GTCa2ilXwgigJ1RVvEqRLePKPnJgif0xmeob+KUGl2Y7XSXJsgjcDg7/ATfHbCxKsk12u18YXjIouaTu+RVQOTBwfw522hFgk5pfPzTagwXwsrvEFhqzucpFRHu9F1mWvr06lJlDCMR34vnZJfRxpoD6yh++swp7BMTW4w80/Yp9sb/3KxgaJRA4GjPkFnvxQjDt44AGtH2kB3+NKhDA9NT4lA6TLx7KXJV86qsdWXHcT1wCze++zddnG9qCzlougVLnMR9quSHQ1xlwmeowZMi/mDKeY69LfG58taKXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(136003)(346002)(396003)(376002)(366004)(52116002)(31686004)(8936002)(38100700002)(26005)(16576012)(36756003)(2906002)(54906003)(6486002)(38350700002)(478600001)(5660300002)(31696002)(83380400001)(8676002)(66946007)(956004)(66476007)(2616005)(53546011)(186003)(16526019)(316002)(4326008)(66556008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZDJ5ejlLQU02ekhOckt0akdrOElzdVpSMHFPSEhFWlRHaEFzdUVQVHgxU29v?=
 =?utf-8?B?NDZaZ01JN3ZtQjVxZk55dG5hdGdjVnA3ZEZNVjArWVRXaUVyeVlkQVZ1OUFs?=
 =?utf-8?B?WUdhOC9mZ2I3S09RM0dvMXllTzBOV3pFWXF5RFBKaHFYdjVBZnlTRm12RGVi?=
 =?utf-8?B?OE5UbXIxMnNwQ055Sk0vcjA1V3BieE5lTU82TllnL1djMW1TeXRNWm1YSmln?=
 =?utf-8?B?dlJIR21USWJYWVlXOFU5WEJPRGw4b0I3cDBzNlJPbitjWmpGQnBuTm0xVUJh?=
 =?utf-8?B?bm8rVkJWZTBwb2tNakd5UlVXV2VCc0pXOFZWQTZyK3J6bXBXVmxlaldydDY0?=
 =?utf-8?B?em5sc1lkcW1GK3NkWmNZc1AzdFNHeVpUTG9BMEJFWDFxRXlSVHRqeDlhMzdz?=
 =?utf-8?B?VzN6c2pnQzJVeXpkNG4yN3krRGUyMmdhWG1aaUNtWDZwMzlSUFVRYURjcVp0?=
 =?utf-8?B?WU5EZm9QU2FZOUxTYk9OL2Rxc3o0RFNnS0FPOEVJU2FLaGFkaUdyVWpsWkxi?=
 =?utf-8?B?ZFh4Tng5aVNjdnBTcXZ0dEh3ZmlZNjJGRmlXQ1hzUVdaVStWZDBJNWVkaUp1?=
 =?utf-8?B?K3hTb1p1SUNZQmYvMTVlUE9UZjRzQVdzTDNqM2RremVWMjdIcEhFeG0vZUhp?=
 =?utf-8?B?SjJ3ZHo4Vi9Va0plSTJsMW5tbXkrM1pqR1pMRVo3TjZ2RUZnSTV1djNmRHNV?=
 =?utf-8?B?MjRRWjFvRERab2NEdC8raDR0Z005VnlrU0lMQm9wMTlyWThYWFRmNGlIY0dE?=
 =?utf-8?B?RDQxbEw0NkhlMW5KaGhRYmhHNEtuMDJ6L3BwZGVQKy9XUWVKdWYvRCtxc1F0?=
 =?utf-8?B?NlRvL3FqZzJ4a2x2ZUt6NHNNV1hsSUFaQ2pSeUIxRHdsZlFwWGxwREwrektK?=
 =?utf-8?B?cXNDRFRWeHBHd3VLd2tha2VQb3BQbEtjL3ZPclMzeWs4QWhkL2h6aFRaR2pq?=
 =?utf-8?B?N1lzMWdGVkhGcmFXUmtBRWhXSVFuNWtycmN0SjNwUXF4YWRYL0gyQW5oZU9R?=
 =?utf-8?B?NnNtMlZBcks3S3Q2MDJVRDlKMUY4bHI0ZUp6eHNmYlpIZ3g1dTNnVjEyanhD?=
 =?utf-8?B?SktXb0hibDV2OUZSc2ZabEpnZE01bTdxQW9INzEyY1d2NnJNTDBISFlGQmZK?=
 =?utf-8?B?ZDV0YUVXQ0tGczlJVGUyN3h3aXo0d0xJZlc1T0FKZG9LRWF1dlRKcnpLL2l5?=
 =?utf-8?B?OEE1d1krcGt5aDdxNDk5ZDhWczQ1K3dxamk1RzJDendyMHM4ckpTdjFIRkI0?=
 =?utf-8?B?ck1PWHRuT1NYc3FYUWlab2ZyRCtGU1lDcEFhWFdCTEhvTVZsVHNScHp1dEV6?=
 =?utf-8?B?Tm5SVVFldEx2UERDTFFrWTQvSnphc2hsZGY0bkEvdXhsd0dCZWFxTkFnbnZq?=
 =?utf-8?B?QVh1K3BwRlRBWE1BWUgwUzZuNlJGNDFDWXlrdGVXbWtOZUNHaXllZWcyc0Nw?=
 =?utf-8?B?UVorSzZuQ0pLWXA3eUdPYmllSWZMNmNFQ3JMMzZibVMwS2lZQytKVjczbjRV?=
 =?utf-8?B?VFNJQis4dEFyWG5BbGZ5YVNydDVrTzdkcmNlVWszbTdNM1Zhc0tPZXc3K1k0?=
 =?utf-8?B?UDltVVRGM3JRNk8rVXRlSG8vSGlVV0ZTVXhFR3Fxd0FoZ2pUZGhWQ1FxQ1NP?=
 =?utf-8?B?RHBmcWRZY3hrL042NkV3ZTdlZWFWVDFVZG0vcVZ5em04bjYwMEtxOG5TVkY1?=
 =?utf-8?B?S2ZPQ3F3SnRGTENkRGFxRmZwU1NYQ0haZ3VydXZJZ0IycmdtWERtcXZnbGpa?=
 =?utf-8?Q?JN5lnl/hO/lbueJT5M3B4LSwk35JKKJOJptncJb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bb2fc6-d61e-43c7-8d84-08d91515b9ca
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 07:15:30.5938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: do+dIH3qNSIgYq6jCSaOdoe+/fc22jYpW7TZ8bwDGg+C0/vCJ4mz/hiuELjw2y9Qtnc982kpb5j/oderXiih9Kmd5qQN01EBO6CvhrXfvUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.3.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

12.05.2021 09:56, Paolo Bonzini wrote:
> On 16/04/21 10:08, Vladimir Sementsov-Ogievskiy wrote:
>> With the following patch we want to call wake coroutine from thread.
>> And it doesn't work with aio_co_wake:
>> Assume we have no iothreads.
>> Assume we have a coroutine A, which waits in the yield point for
>> external aio_co_wake(), and no progress can be done until it happen.
>> Main thread is in blocking aio_poll() (for example, in blk_read()).
>>
>> Now, in a separate thread we do aio_co_wake(). It calls  aio_co_enter(),
>> which goes through last "else" branch and do aio_context_acquire(ctx).
> 
> I don't understand.  Why doesn't aio_co_enter go through the ctx != qemu_get_current_aio_context() branch and just do aio_co_schedule?  That was at least the idea behind aio_co_wake and aio_co_enter.
> 

Because ctx is exactly qemu_get_current_aio_context(), as we are not in iothread but in nbd connection thread. So, qemu_get_current_aio_context() returns qemu_aio_context.


-- 
Best regards,
Vladimir

