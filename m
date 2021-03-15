Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C579633C779
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:11:44 +0100 (CET)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtZ1-0007z9-9h
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLtXo-0007Oe-Mx; Mon, 15 Mar 2021 16:10:29 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:59456 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lLtXg-0005Aj-Ex; Mon, 15 Mar 2021 16:10:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cj94YZwH08Q6j9KF0f5nNJ0GG3xOYjSLZ/1tFcvYIuNIbLqOoxv6TbolVuVFcESfW3wOELsrYAJNq+HB/39YCY/7Bh/Bxfk4GxFAEmRUsJa30udut0Wf3mTqCn5Q6A71ZIRpFa0NWbTaIWub9xi689COMtuQuuTDvCNEzVnM4f1Bt2yRsSrLuvxReY+r5nCQeKKH6/dbmUPL5xbBnQFqqCP0R0s4hXGjLt/+3v+nzuWJ/J00JN70G2xQJY9sN6ctvXrKcd95BhspEf+CXc+uS+2VVTRwmP5fthpmhmQTXnSRy1w4igMn/OEpI6UdCS2QDf9c76EPzqf6k4EAnfXEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoU9PQSO4bPqFggTC58dIAo/Uigznx/qDO1TuyawIlg=;
 b=ltqH/gnYJysRTj5RR7MjsV5lPE0LW1m/b7xZsXWTD7052P/isRzGnS7UpuKWGBXaQe02EyLBkWrlVlTyBEYoJk6GjMvgVylJTdrCQCO4fM2Nq6zIM8JQd0RNnSekhjn4zwoiZP8NvHdjJke8g+/6WLHJqxliYBdEPYOwEA/Z2eb8oYvoS1mAxkuFrMgEZ0JcS78SzJ20ZZLwIoEcoS0FV++kViBStZVOw9LW5iHL1WqHLT38k0gV6CNC3Aele/xWskkrTMK80vI7PZ6deXy0xgPpIAeMqqppptrvOPNK0PBheoj46I4RvPDphGdURM4Fw8LFzSviTwksLq/dQWgcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DoU9PQSO4bPqFggTC58dIAo/Uigznx/qDO1TuyawIlg=;
 b=e07/9pEMlkkEGxP0faG3UeYWPzB2mYqR1ABK437svNBT0JlaxZD1OSM3lwGlptVniFrB0oh4il20g2iEQXAyCUkYNwHPZdn6hBa+wGfYY8Jw9k9I8TgQZXa2JXAG2DXuAXZmgBGNWnlwEph4lczHsHIfpNm5oA75KvOMVLiMT80=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3222.eurprd08.prod.outlook.com (2603:10a6:209:43::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 20:10:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 20:10:15 +0000
Subject: Re: [PATCH 6/7] block/nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
 <20210315060611.2989049-7-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <995a9667-b7ae-3e00-caa5-6c80fc0962f3@virtuozzo.com>
Date: Mon, 15 Mar 2021 23:10:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210315060611.2989049-7-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0112.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 20:10:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec18e9cc-7788-4bde-aae0-08d8e7ee591e
X-MS-TrafficTypeDiagnostic: AM6PR08MB3222:
X-Microsoft-Antispam-PRVS: <AM6PR08MB32221B28C433EBB4B43D8F43C16C9@AM6PR08MB3222.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /16fq0Qr6jD/gALD8PIZmgNZmc7Ral/IwpA3xR/1rEYP3zUsDeUyPKJqChD4WV4HD11o3g0pbjjpL0KaOD0PiG1bERuqGBZpDj3/AhjVtauXilTNSlq2yKLfG2/gQ5oJvGZSH3lNev7h9i28ct3NlHF6alEMa+qBuSvRvr9UbvpJDhnjdo/hgpqCXJ3zXVbhSbhVmHaOJr7sUotmt7D3Y2scGzL6eCocIAinZ2JRjaNB2CLWL4ZQLr4AdRfywiVU3IrcHka/nSIa7O4seE7Ux4nJRHd1UrTqhFnqriBN8Q7+DvZUIaJIx8MtsxL0+/gK4ZbCiky2QLuK0D7JPjIlaJHcAedRo9b73PoSD2SK6qgZQLTkWJvWezGX1ohSSUCp488iZwgBfq/1eNiCxZpRgIOn4q7cHFD90yHHpA679kHEhdgR/mnvcxvkB5GkQ7skfCUOviz+r04EuwOhY/Kx7mKs5PAlRtW452EwkjSQsZcpFMqPzz3yZufSyiSmvNYg7fv+1ZvVGuJP5hoRH1H4w2ihbcVg23gNDxFr3ucuJVuue6SL2i4A5aW4cPk6PJaG1qjKDTxjqTgwLFpRI+em8y2GJ1gepPMw/LdFs/PNJC2yaLpt5/OovSQgGSTuEp17hVQHm89CCxCE0eydQ76dRvw4PqTiLziXWyTu4+QsQH5I2W69U6e6ku7TO6aNJEujoxrf7NNKlcInlLPId6k6qIgUslX9QHpMnjyIEr17DE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39840400004)(366004)(136003)(8676002)(8936002)(478600001)(956004)(186003)(16526019)(6486002)(31686004)(2616005)(36756003)(66476007)(83380400001)(4326008)(66556008)(16576012)(2906002)(54906003)(316002)(26005)(52116002)(86362001)(66946007)(5660300002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzVDNituK1pPa1RFbVVjUFFyNzVVWG9YWVVJSXF4YkR2czFCOGVBaGF3aEFR?=
 =?utf-8?B?MWZnVS9DNHhySGYyZlFScUIwVGRYYm04c0I5aU9LRXVlNitSeWdNMi8xWXVY?=
 =?utf-8?B?UVNwU2JaSTJUYW9ibHErbHpuM0FxaTdBaUFhMzN5aVRNQWdtZ1dHMVpRN1BJ?=
 =?utf-8?B?YlhRbUxOMnpmaXU1VklxMitCYUVRVGZRZ3I0eld3OGQvYnhLWEh0b0J1VXp2?=
 =?utf-8?B?Rzg3RFR5V2JNTlFoYlNVZHZVelhtOVhHK3NTUlVQSlZ5WUQxMnpjbVA0em9J?=
 =?utf-8?B?WTl5NWtMZGFQWGIzcVVaTDRQK3pkMDNaUXlDakhwam9vSm9DL2YwR2x3ekkw?=
 =?utf-8?B?UkNGKzI0ZFhZcWVBeXZ2MXIweWF0T3lGV3gyRHJCVnB1Mm5kbkdDaHlFYXJS?=
 =?utf-8?B?TlI0VkJFeEpKMSs3eEE0WnkzUWFBVzBidU0yaWNzMWdPQjMrcWxXd2I4Z0Jv?=
 =?utf-8?B?Q2FzcW9aQ0dWb1RiVy9Ib3FuQjlRUmtoNHVITVB5dDZlNG51MUtFaEhDZGIz?=
 =?utf-8?B?MjhZUkoyUUE1aEdnMC8zaE5WVDUzaVlwbFYvL1dycTU0Vm1lL2UyWWxEWXdF?=
 =?utf-8?B?RVhwYjlUdk5pZEJVYjk1OWdQdktOM2dFUDExVUhua2NwWEM0ZjNYWmpUeHhV?=
 =?utf-8?B?SmdzZVl4VndzL29zRzdaVFZlSldkZEhObXZRZFk5cTNzTEl1M2xidDRRS0VV?=
 =?utf-8?B?T1M1d2tXRkd0RHRkd1RTUCs3M3pDY1BTVmd6RVFUVnZSUWRBMHVzN2ZENm9K?=
 =?utf-8?B?MDlIbUo0bEQ1cThOYVZlRGlvM3lrZUtHb2s3UWZrOXVqTTFqK2V6VHN4cklM?=
 =?utf-8?B?TjFGL25oK0F0SEJlTmZubDhtK3J4QzNBMDIyR1h4bXFIbENpYUs3R3RzaGYr?=
 =?utf-8?B?a2dXMnNuYmR5bm40cGZyUUxWUHU0R1c4MXl0d0YreEVKdXF4Q3llRmFyQVM0?=
 =?utf-8?B?TzNxOEtUNzkrT2IzbElrc2N4YlhMeEM3eitHc3RJak1nQTdtcEhuZzdqTnVt?=
 =?utf-8?B?MUJ0KzZJUy9tVk1STmgxMGtSRkppWmRicVVPM0hyT01HelFocEZGU1NvMml6?=
 =?utf-8?B?RFJxL2FrdkFBdThsVkJaeFAwc0lFS1RJYVo0NGlidWdPYzFNU0MxcFhwN0xK?=
 =?utf-8?B?bGJnSHFvTUFIcXNRR0poYzRnSmtJc1kyaXJGQlJVaGdLb1drR01zWXkxYXNn?=
 =?utf-8?B?REJ2ZUZrTUdmN25nOHZSZXpJRUJWRUIxWnY3d0c5TUMydmNGZmdkeFNJUWs2?=
 =?utf-8?B?dzYwb3Z5djF1Q09GMlpIQ2J1MisyVmlQd2FjMmM2ZzdrOVFZVW1NQmE0R2c4?=
 =?utf-8?B?TzhSOHVmcXh6MEpwM1MyR1NVOUNmcmdnbXF1WWtTZE5odkJtTzZTdnE3WUl0?=
 =?utf-8?B?YkVYK2lMRlZGa3NZL1pzY05lTXQ0WGswQXU5NGdaOGRCRFlNdHVFVTVtQWx3?=
 =?utf-8?B?QWx6eWV1Tm82c0F1cG1uZHRyYlZ4dnp6Y2d5U0p2TE5sMWU3NTV6d1lXMGRM?=
 =?utf-8?B?b0JSSC8vRm56MHZkbWRpdGlNRnVWWkxBWEJDcVB4RGhjN0g1VGxDY2QrNGwx?=
 =?utf-8?B?T08zZ3Z2bEtPc2lTc0U2Q1dXTktGM1NBY2NGTndoVnV0b0JYTlcxdG00MmI1?=
 =?utf-8?B?RU9yaWoyeFE1N3VXOUtDQjdvaHNjSWtJZlF4MUNDRFBuM0UvejhOaG5YMWRF?=
 =?utf-8?B?NjNWZTU0MWRmSGh3dVQvQXpqcWhpeE5pdDJwclYvODBKc1V1V0NPR2Irc3pj?=
 =?utf-8?Q?UuF3dNRKxdn+SKiTHtz75zBxU2C44XK2ajdjspL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec18e9cc-7788-4bde-aae0-08d8e7ee591e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 20:10:15.8331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eug4oUoiUg8iAVew5gxKPsxMEBi8Wfo1r+yvHFiEft0wX7exY+/HCNGW1mbofMO99a8zjo1R6lr2GClPUM+suK80sfWm/atqK6a/vsPQ0bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3222
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

15.03.2021 09:06, Roman Kagan wrote:
> The reconnection logic doesn't need to stop while in a drained section.
> Moreover it has to be active during the drained section, as the requests
> that were caught in-flight with the connection to the server broken can
> only usefully get drained if the connection is restored.  Otherwise such
> requests can only either stall resulting in a deadlock (before
> 8c517de24a), or be aborted defeating the purpose of the reconnection
> machinery (after 8c517de24a).
> 
> Since the pieces of the reconnection logic are now properly migrated
> from one aio_context to another, it appears safe to just stop messing
> with the drained section in the reconnection code.
> 
> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")

I'd not think that it "fixes" it. Behavior changes.. But 5ad81b4946 didn't introduce any bugs.

> Fixes: 8c517de24a ("block/nbd: fix drain dead-lock because of nbd reconnect-delay")

And here..

1. There is an existing problem (unrelated to nbd) in Qemu that long io request which we have to wait for at drained_begin may trigger a dead lock (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html)

2. So, when we have nbd reconnect (and therefore long io requests) we simply trigger this deadlock.. That's why I decided to cancel the requests (assuming they will most probably fail anyway).

I agree that nbd driver is wrong place for fixing the problem described in (https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg01339.html), but if you just revert 8c517de24a, you'll see the deadlock again..



-- 
Best regards,
Vladimir

