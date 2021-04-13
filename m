Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71635D83A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 08:49:07 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWCr7-0007PN-3h
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 02:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWCpv-0006uS-03; Tue, 13 Apr 2021 02:47:47 -0400
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:29957 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWCps-0006Sj-62; Tue, 13 Apr 2021 02:47:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czYjAKi9PlKVc0WLTtFmNjfsfNaQnPmYtzu+wGqTjX7iZ97iX0O2p4yia5oU9f79iQEk3g0vaLQOLPMs3MdYVrSDu3Qn7Vwq908rBe3POGcLJcMi1qEbyvL6olQ0xcRBhTvRz53aPdKrxVf+5Q5zST9VrpCFw2yViyZ3Q3299k3xSQ5R/kTWQ84ZwzDhjIgrqtJHAj5IhLj34EoTVcTSDCtQXfG3rbyxeJ+eZvDtojS1UE/4G++HSf7cP8vFqhH7fQg59n8f9KypJoBlBTqvORBVqNbnANzZ/pq72K2kN36gbAMsv+mGFyUmiXX3MAMZEQz1ILf87uMeSXKjyO64qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vdB36Xf/qkQkCmr/Li0eb11scwQMstjOz7QVfy6g9o=;
 b=ijG/BLWVpPUToAMPf+zmUhY/lGkP5/scd6FBlXyKolzW4rdc6PQyuN8SdvqQUiqkzUVBc5gSH7YZtS3TmlAdXAhPVAWGlAsMUw/MY203R43wdPhl9LH7ikAMHmobqHsc1sLRB8mACuQvJIIefDqpTdcL69tkqoIJ3+zY5GJy0EnFQxADIePugITfDLC4uTfV/xZmkmftWoaW+Wd/U/iATnG2CoLUd9NJSGTXj0OCc+U8kKiM7s37TQiqJQSGYSrJnJpkx4cjGvRmvKX6OCRxMbzHJg3QVxCAV/yN/dWzE4srHfA0gniccJ+FXC7nzq1fpXjdOxkwLDMrI+ybvHwBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vdB36Xf/qkQkCmr/Li0eb11scwQMstjOz7QVfy6g9o=;
 b=D+HIBJSeOsC2/Y9wsD9OC5+E38TvJIx13EY/qUvs7gZlPpG32eEPJRhUluaKfe2XGUjFYrhjqEGE76nIJjARiKpFD5nhTO2a1+2TzfRPF7hXm7Fls8lPFFjmw+QpmeEA/9EP+0e9DQuB9UGqiFq18HsaAOyPCGIcPJmyZlWJJXI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Tue, 13 Apr
 2021 06:47:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 06:47:40 +0000
Subject: Re: [PULL 0/1] NBD fix for 6.0-rc3
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 rvkagan@yandex-team.ru, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210412121846.144565-1-vsementsov@virtuozzo.com>
 <CAFEAcA-damn2CQDe2OMpEj=5Lo=ZTcsBOMoaHJqsX4ktL3qyCw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <bda0a2e0-c596-0959-89e3-0c9980d2c3ec@virtuozzo.com>
Date: Tue, 13 Apr 2021 09:47:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <CAFEAcA-damn2CQDe2OMpEj=5Lo=ZTcsBOMoaHJqsX4ktL3qyCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Tue, 13 Apr 2021 06:47:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feabd75b-234b-4665-a302-08d8fe4807fc
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB209832BD553EBFB6A1B8CCC0C14F9@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UlMWJxs5oTlRg6/1jxgQlf+ZtTj6YeSP3uVpCfn8r4BqkZavplQcxVFFRo/i9Yh1Ek+c2cEt2I1BOHG/YVUzbvKZPq051Zh54u74Y+CTMTzizH9q69vZ4HXBX7s8t/C9E23nMe5jColOWk0ZrQdDVtNXLqtHGXRiTbRFkKc80rqcFrO4qB+VMXnYfEYONbAvv0rAoFDKZEsOK4czSvwlsM1XM3z5wBaNFDpFlygG1rDc72aL6C9lYOvdsT3cRPOQfwv6o8u52CEKct8UQyPzPZJrl7WfOn8dsayryrmljnXXVZFCMSR2zqSh9pQ22nEw0CtV/+jmEgAgvhtJqPgcCkfwVFj76IExB7ADhOQ59eIJglI2XcWGR3iG2FpI4fGBhaoZAbW5/Td0txtBwd+9OPGXHK7m46BR/WH7f3p2xP2OjWi4zHVESruo5or1iDtcb/d6ZXdUg6I1LDzq4BQfl4YY9ZJR5sPKwM4stwfGwvnsOlAR8uuLWwUjc4ybxpmbuU2OaaZ7SjOdt6jXDSsloX7GQLmcGTcz+FjfqR3SYfbP2xbllwKLFXyLZ43p3zT2Fd2DqRlMTT+r5yjVG9FCk1htH2UEfQd1SEI3jsGKjlmoVeneWovFDnHjmeIMZ39+ZyxnY8EBwYtbN/fNN+TiYDnEWm0fDbd7W+vaAEgMAlGC4GvKONv6z+IAIBGn+mZqpBH7NebPMfrlsL5rAoeKQPQUBHusdTtRWQIY7BAPyYWeJxUvUX0LgBm1r2/E2E7mcHLtICqx/5OaBCfF++JWUbQR0Ft5kNffGuYZrAg2M9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(366004)(396003)(376002)(136003)(4326008)(26005)(6916009)(66556008)(52116002)(38350700002)(86362001)(54906003)(478600001)(8676002)(5660300002)(966005)(31686004)(38100700002)(66476007)(83380400001)(6486002)(16576012)(36756003)(316002)(31696002)(2906002)(8936002)(16526019)(66946007)(186003)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2JZcGQ0OE55TmlseWUyYzVRNUN3WTBwTUlFOExyeXdHV21hMWg3RXk2YkJV?=
 =?utf-8?B?b3A0SFQwaVlyNjg2VXRtQ3YrYnpkNHZ4dVREbU93cFpXU01ONDBmRU1Mb2RM?=
 =?utf-8?B?T1RsM1c5TVpkekNPcW5JSHR1VCt5VUM4U2V5SjhKZkpJTzVOSEZpdXAzYURN?=
 =?utf-8?B?TjlFWGRsV3FsMlkvd1AxdXZKWFVqMzlFd3U4c2diQ04yZjJiTytYckdmVnh4?=
 =?utf-8?B?dzU1UEhWSS9JTGx5UXRJV1dqSzB6SXp2aStsYmpVMk12dHA5WXBIZm9EU3VG?=
 =?utf-8?B?RzY2a1FuZWFBTmJ2ejNSeHU1eStsck1xTFp1TkxvRlhzQ1FFSVlML0tWaWxI?=
 =?utf-8?B?bzIyb1orWmNiUlFGK0p0S0pZTGk0Rm4wU2Jid3hIbmxIYldHYjRGRFFPdmFx?=
 =?utf-8?B?VjlaN3l5b3BQQi85ditDQ2EvUEFLK2U2QXgvVGN0a25BWEs3MWRBNmlGWENx?=
 =?utf-8?B?L1FoT3ZXZFlaSGJscUczdEtxWmlCUDVMTnJ2eTYvUzdiWHpQMmpUSllWUjZn?=
 =?utf-8?B?emFrUG5zMUdDSExqQ2krdDNrRFhTRkhRdWdnTGk4bFQ2MUV3ZDlyWlgxQm8x?=
 =?utf-8?B?L1d2WFdaSFd1aU5lRkw3SXNxTStQNktXeHpmUC83U0tMYWI5NGkxeVRWWndx?=
 =?utf-8?B?MUFGVUgyTkNndHNtaVhobnF5cE40LzlLVkQ4UWFucVZvMm1WeTRoRGxyaFF1?=
 =?utf-8?B?SG1OSTBubERMNDJDN0J0czNwSCs1YklYdXZ6RHhYanpqVGlLdGl0SEhDNlBS?=
 =?utf-8?B?OUxxODAvaGZZWDBlb0JvOGRCR0tJTUhJWDRDbUhsTllUWk9wRFFOU2JpZ2Nq?=
 =?utf-8?B?czhSM2dkNjNXWjl0ODJYUVd3RmVXNWRYV2RiN0lHN1V6aWV5ODNIa09pQ3hS?=
 =?utf-8?B?WVJsYkFwSzBpREo1OEpWYnZEbnUwWlJDWmp5YmZYd0k0MVlpdHR0SlZaTVYz?=
 =?utf-8?B?Q0tIT3hQR09XVEZobmJwWmR1S0Q1UFRySFQ4Y0U0R3BOY3A1cWErREMxbGFx?=
 =?utf-8?B?dHdWcTVMNVRReW1VYXRrTXdWWTRnVTdpZ2hveE9IZEh5djhNZE0zZ2R0UDRI?=
 =?utf-8?B?ci9XNUZNZ2tuZ2Y5K09QTXo4UXZ0T1lOWEJpenJTY00zeGdGMkM5Z1Q2QzMz?=
 =?utf-8?B?V0gwd29QZTdJeDhYSW9rRFhYL0hnc0lQYnN2U3NZelN3aERucGl3MytTekw4?=
 =?utf-8?B?cmFYdkZUSkxVTUZtN1d3Skkzck9UZ3N3WThLYmNBTTZKY29QU1B5VTlxSUd4?=
 =?utf-8?B?VUZkRlNoeVFQYTFwTCtaWVpJdm5qaHpCRjRoVldCOEJqSGRpVGdmeGpxdnRY?=
 =?utf-8?B?bzIzeUxNQXZTRWplMmpydzBPSTI5UVo5REl1cEZkYklOUFNFeXVMb1RMVW44?=
 =?utf-8?B?VHMyM043bjNWeVJxZnF0SU5SK0IrcmEvd3B3RXE4OWIrWWs4UnVZTTE5b09w?=
 =?utf-8?B?K2JzSUtwU2RTZjcvNTFrNkxCRFhncHVONjZGNEhkc2lYV3Q4THVuMnB5MFdp?=
 =?utf-8?B?eEwxM0NjRzBjQWhLb3AvWHFxenZlcEE4VjIvSk9XZUYvRzVLMWdkRSt4VGdG?=
 =?utf-8?B?TDlRblFhMGdqUnhvNFBLRkUvSmZuUzBXZldlWmwxaWk0T0ErVGk1YkdGU2E2?=
 =?utf-8?B?OFdZa1FIWXR3ZFdYUklHbWp0WDhpNVV4azN0MHZBRGpJL0lpTlNRcHpEb0di?=
 =?utf-8?B?MUdEeU4xRGIyS0dTbTBCWGlGaVF4RzBpM0hzZWtxMmNNUmJqTDVITmlFdFg5?=
 =?utf-8?Q?pAYc/OLJylWklz/W1jL8SOsYtlVJMfdjtb4WCLS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feabd75b-234b-4665-a302-08d8fe4807fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 06:47:40.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P9yWpZ1dgAMk4eLoa+LmGT1QkPRWnkIBZetlqXn6DdlhnxBnGDE/3bqZSCuOyMCe4jm25DRoI5bvvyDdG6lzUJH62bIlWJj8aR715fhO4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.7.107;
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

12.04.2021 18:48, Peter Maydell wrote:
> On Mon, 12 Apr 2021 at 13:19, Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:
>>
>>    Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-nbd-2021-04-12
>>
>> for you to fetch changes up to d3c278b689845558cd9811940436b28ae6afc5d7:
>>
>>    block/nbd: fix possible use after free of s->connect_thread (2021-04-12 11:56:03 +0300)
>>
>> ----------------------------------------------------------------
>> One fix of possible use-after-free in NBD block-driver for 6.0-rc3
>>
>> ----------------------------------------------------------------
>>
>> Note: the tag is signed by a new key, as I've lost the old one. So,
>> now there are two keys with my name on http://keys.gnupg.net, the elder
>> is lost. I feel stupid about that :(. Anyway, both keys are not signed by
>> anybody except for myself. And this is my first pull-request to Qemu,
>> so, I think some kind of TOFU still applies.
> 
> I'd really rather not deal with trying to add a new source of pull
> requests the day before rc3, please. Eric, could you do a pull
> or something?
> 
> thanks
> -- PMM
> 

Hmm. Ok, that's not a degradation of 6.0 and there is no existing bug somewhere, so we can just not care for 6.0.

-- 
Best regards,
Vladimir

