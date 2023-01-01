Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232565AA2E
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Jan 2023 15:38:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBzSE-0003QJ-55; Sun, 01 Jan 2023 09:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mika.penttila@mbosol.com>)
 id 1pBqSw-0005Os-Nz
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 00:00:58 -0500
Received: from mail-am6eur05on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::70e]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mika.penttila@mbosol.com>)
 id 1pBqSt-0005rC-2p
 for qemu-devel@nongnu.org; Sun, 01 Jan 2023 00:00:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9mmBizMSCvcTZ0ihxnPEQ3IpEER6jKK6UKaq6a4a0wfWfu3Yex2FwWG0Qq2pr/AEdcnc/MQ0kCgNZhvsAuJljJu18hblwHyfw6QqFlDtqWdXQZY3Ow5xqkjR4ywldsg9/2VGJfrLdVDZcIZSO9zQ/yBZL1r/scMtUD6TM7yUe6zizA/vGYieHRZ/8q/cTbVI9IKmPuE0dUtxjr2ylYSsC0owIkegNcaKDnJDudHJjTi08qMQNc2616iQahCtsW+g6UUIJGOmenTM3mdu2T/idSqdRjXH7G+lS0fezuNuxtZcOQBGTTDtpvUa+S7GVCAi+rsfmRqiyJCYLtz6E6x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za3zCwatGXHdLJVHd6Y+Gp0NXBqGChqCgF3Kevty5lM=;
 b=YjIFYmJ9GhQRzP/JF/POOVYZvB0wVedsQF4L2hrOqPu+e0u/XJoJAF9kawfdY0k5P/2wGeGzYvWxa74jhdm/iNLfecfDvfAeQyV/OdFiNmdwQ6shatjC7xCWwSXsfXdfeleZDGF2P4FCFYZY+SrrD9GLI6i1CqbtUF2wHA6KqD++m7epiHaWYlkn991Lyq3TpMuQpaMj1xRn+kQ472Bn58wIi2ror7PdCNO8uVUsvIUbq5pLi8d9T33bQkMwfoXleUK3Gy+e3KsJLtRiAyLl7mBNLjzASJNNWjGJCIX5t7BXwni7hUknpilT7dBtQF3PPgD08HRbGlXtzSqot6YLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbosol.com; dmarc=pass action=none header.from=mbosol.com;
 dkim=pass header.d=mbosol.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbosol.com;
Received: from DB8P192MB0533.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:16b::17)
 by AM9P192MB0871.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Sun, 1 Jan
 2023 04:55:46 +0000
Received: from DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a90:124:1e94:7b09]) by DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 ([fe80::8a90:124:1e94:7b09%5]) with mapi id 15.20.5944.018; Sun, 1 Jan 2023
 04:55:45 +0000
Message-ID: <e8008fda-4347-41dc-d2d5-b24ad483ad32@mbosol.com>
Date: Sun, 1 Jan 2023 06:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Borislav Petkov <bp@alien8.de>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, philmd@linaro.org
References: <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic> <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com> <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
 <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic> <Y7B993P1+jYB/etX@zx2c4.com>
 <24908710-09f6-da2a-d821-58a81c572f6c@zytor.com>
From: =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@mbosol.com>
In-Reply-To: <24908710-09f6-da2a-d821-58a81c572f6c@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HE1PR0401CA0066.eurprd04.prod.outlook.com
 (2603:10a6:3:19::34) To DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P192MB0533:EE_|AM9P192MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a0e93b-0c56-4901-ab5a-08daebb47162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXbi/sBMQ81BoJZPD5q7OKq6Bfq879IhkInxwxfv09rTWp9eClnOubu16FP3MAQRTghx++A1tO19+EZikG3GHcUGdHMHlLBSIp0eCD4YhCA5wUiPb9vcrmkk+VTGsd0FQ0X3N/dcIIvuqMm+fc0nYbISqH9P1xmD0ZDJCFiwu7m2BMM0ONCrapTWsLU0EAqt8qRGcMhCOs8HKM+sybTT1+Nji+/XNLRltjny6tcAt+7QuKqnDqVb6zKWUHE38At8ciUAadXp9hlvD0/63jnx5ZWb/UjECUvEDydRpAY14A95l8XWyTMrlykdzPFV78FULrKeCf9ph1UtGgNKiprIIXgG9aoK4Md3Kr17/iqnN8/PbUw+Cb8ZoILK11KlzqNgZEMjAaguVCG1i7eMWM80RNncWhuBiLLI2I9FVo/xGQpc1E1E8paLCor8yxP3JqNXQX8gV/NjCleDBjqJdIm0qCl4Roc5O5UfQsB25pSlFy7qR+xOHttmW2OJnIrbiaTTUkkqJdzWMUw6j/iHyupRgqb4npYJpZbNz4xduZy/paXSctC/LTMqODjRCGlQZK4PgQDMiwbtUARrpcIVKxDEet9jD8ghUQr+OI1MKsc8xL6C6a2cCRGdg6oEUkqSr+51seBZajYrjoo3Szz5yOHG2+9lsqqrvDNYjIDbO9qc6H5jiWW5tno4zYVBpRtoWxXPswtqZvoJ2rYQWIjKlEmp6/fW1C+h4ElzPd1kcAH8mf0bltKE2eX94wZxd2AqHB9x7YkQSkw2osV1US2XArCRrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8P192MB0533.EURP192.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(396003)(366004)(136003)(346002)(376002)(451199015)(4326008)(8936002)(8676002)(5660300002)(66946007)(66476007)(66556008)(186003)(6512007)(26005)(7416002)(41300700001)(31686004)(83380400001)(36756003)(110136005)(2906002)(6486002)(478600001)(52116002)(316002)(86362001)(31696002)(6666004)(6506007)(53546011)(2616005)(38100700002)(38350700002)(22166003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNTbTdEWm84UzZvdVdjZWRvVWJaRFZ4OUZqWVNkVzc0L0NrLzlRSlUyR1d1?=
 =?utf-8?B?KzFQSGxZSkNPVVZ5RHQwRTlVQUxSbWk2SXlZMFg4YUV2ak1zMm5sb3RYNTFH?=
 =?utf-8?B?M2ZsQmNTZFZGeXM4dlpHZVJzV29hbUNxU3gzRzJWVlViSFVYMlRnekZkTnY1?=
 =?utf-8?B?dlpxbDhYdzkrUitlOXZkZGc1Q2NPdmNYODV6T0hzY2QxeG51ODhjNjRHSXp0?=
 =?utf-8?B?cW5qcUVpSFRjTk1JSW1tOEtYcCt5OFVTdnFuWUwweDZxOW9RbFJ3RmxzTkhO?=
 =?utf-8?B?YVhqSWIzdWg0L0tLTHJFNllYUDN0YVlHYjBlOVJFS29vYmxDcmRNNmxRc3BU?=
 =?utf-8?B?VnIvakppVitSTWdBSk9JMkdsVGQzcklmenNVY0Y0NnBGOEcxaG1qcHFRREdv?=
 =?utf-8?B?MmIvRzlWczhCYmlYaS9maVU0N2dXZE1zdnJRQTJ5cEprREVTaDU1NFRldys1?=
 =?utf-8?B?VndlN0NpQ1IydGhsUEVkKzQzOHV1Ky9NbnJ1RjlWQmJ4V0Z1R2M1U3VsUTZY?=
 =?utf-8?B?L3hlMmtoUFJOWHp2WVBjaGRrUmh6WUN3L1cyZGNMOFNDc2M1YW9tTStXUUFI?=
 =?utf-8?B?eFllZWt0THRuVk5OY3gzTkIrYmRoMUpqcitWeUJaUGtSNjhMdjJGWDNSWU10?=
 =?utf-8?B?NFZ1MUdNSHA1ME5OZ3BtbGp2d3FpNElMcEhlNmdtb3cyUHNBaUxNcS9OR1VI?=
 =?utf-8?B?MzdGdHJjdWN5eG9yNlo5K0szZXhCTmZkVFhRekpmOFMrZzNscUZYd3Q5dUFT?=
 =?utf-8?B?NkcyaU9RanBzMnNQMUh2Rm5yZXZvalRibTZXRk0rdTFCM0VRV1d6NUVXclI2?=
 =?utf-8?B?YVpnUHJVbmkwKzVMdFJXSE5mTy82dGg3d292c0NUZWNiUW5wRUlRSjlyS0hJ?=
 =?utf-8?B?ZTR6c21OVWpMWS94a25xMjV5eUNtSHQ0SUVqWHFoQ29icnFOeTMzVDJDQ3NW?=
 =?utf-8?B?Y1lCWTRXM0xoelhFY051cEIwRktkTmtmY1lYeDNRWHdEdzB1Y2orbnB1RmhH?=
 =?utf-8?B?MnpLb0RLbm05aUJXdjUrSXh3VXpaOFljQWhVc083WkkzY1dtb2draENNVTRi?=
 =?utf-8?B?dGJkcUZ6TlY0TDJOVTdoMkt0RFIyVkptWkV6Uy9RWnQ0dmV1enlPWmh3Y2N6?=
 =?utf-8?B?Tys3RFlncmpzZDZJZUlVQ2NQSGJpcVpodkpRRE0vMjA3dEZHQklUOGZ6VlFq?=
 =?utf-8?B?b0ZZYlJQWVdlU0lTc0JRVFpKR0tTVzhNZXBRZVlURXpyREFVcU5ZOUNxaUJB?=
 =?utf-8?B?bXZGYXRVSUg0Z2ZXWUpueUlCYWpUUy80ek5HcjhSZ2VsVDZkSmNocElGZWdR?=
 =?utf-8?B?UUFodWw3UzFVa1V2THYwVHpMMFJodkVETEtkQzBHMTFFWjlvcnRQU1MwdmUv?=
 =?utf-8?B?K1NJMkxqK3FUam10M2RwaTkvUjFqQzJDaDNmczh5Zzd6VU1WaXNPSzJ6anpD?=
 =?utf-8?B?K2RFd0RRa21zTHhZRUtRQ01OMDQrT213YzAxVnB4QmFRQ2k2OFBub01kTXBW?=
 =?utf-8?B?WXYxV2RjalYyL0dCd2FkU0dMcHlJa256eXFlcERTbjlXR1J3Sk00cEc0SEp4?=
 =?utf-8?B?S2k2ZDRPMEppMTc2Vis3K2ZmeE40cjEwWGZZQ2YrYmxzZTR0RkFQM1d0WVo2?=
 =?utf-8?B?ckFqK1RBd0NtemNvMmdOaXgrZWF1M3ZyYU1hbFFrak1HcnpVQkxSMVNFWnVE?=
 =?utf-8?B?RjJjZlJBd2FSd0N2NzNReWpUUUFhcStBTk91RnZhYStTUnBCMUtkQXFEdzJP?=
 =?utf-8?B?WTFQVUpLSldEaFBiYUExTjVka3piTXAxSmlraFBIVjlPTW0reHRBekhnNlh0?=
 =?utf-8?B?ZGtqN3FxV2JwcEpjdjdrUGplVDk2TmREUVZMdWtQb1NpRjlyK0dOTDZkVXlD?=
 =?utf-8?B?K2VFM2RyaElFYlptRzc0NHF2YVFZUVJQMXR1N05Bd1dJdjMvdXp2WHhvV1VU?=
 =?utf-8?B?cEFwQ08yL2ZrRUEwTUlsQ0xmSmw0dzZTTCtBRk5LRGh0aXdsejBYcTFyaHJ0?=
 =?utf-8?B?M2F3OStibDM1RVM0UnN2V3VreEdzK2pWUDZQMndobnNjSFFnRWZHT1dJaGhs?=
 =?utf-8?B?YmR5ekk2eS9qQWRhNFVuVXN3MEZoNVhmMGhiRDJPWHk3dlA5ZmdJL2JrOUk5?=
 =?utf-8?B?a0Q5MkxOZ0xXQm9SdEdHUlppYlNlUzhscG0yVDZnM0JaMTc3VlR3Q21HMlJP?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: mbosol.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a0e93b-0c56-4901-ab5a-08daebb47162
X-MS-Exchange-CrossTenant-AuthSource: DB8P192MB0533.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2023 04:55:45.7152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 571b6760-44e0-4aae-b783-84984ac780c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gIi99T4a8q9EG7VAUIzZtya6Mq1JjFFH7DWWKTQWg7JF3mpx3zTInoQhFNi5+YgB087naZ6KzlVvrFeCa9N9TNPpdE1jFTlPfXhwqqAa44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P192MB0871
Received-SPF: pass client-ip=2a01:111:f400:7e1b::70e;
 envelope-from=mika.penttila@mbosol.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 01 Jan 2023 09:36:35 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1.1.2023 6.33, H. Peter Anvin wrote:
> 
> 
> On 12/31/22 10:22, Jason A. Donenfeld wrote:
>> On Sat, Dec 31, 2022 at 03:24:32PM +0100, Borislav Petkov wrote:
>>> On Sat, Dec 31, 2022 at 02:51:28PM +0100, Jason A. Donenfeld wrote:
>>>> That failure is unrelated to the ident mapping issue Peter and
>>>> I discussed. The original failure is described in the commit message:
>>>> decompression clobbers the data, so sd->next points to garbage.
>>>
>>> Right
>>
>> So with that understanding confirmed, I'm confused at your surprise that
>> hpa's unrelated fix to the different issue didn't fix this issue.
>>
> 
> If decompression does clobber the data, then we *also* need to figure 
> out why that is. There are basically three possibilities:
> 
> 1. If physical KASLR is NOT used:
> 
>      a. The boot loader doesn't honor the kernel safe area properly;
>      b. Somewhere in the process a bug in the calculation of the
>         kernel safe area has crept in.
> 
> 2. If physical KASLR IS used:
> 
>      The decompressor doesn't correctly keep track of nor relocate
>      all the keep-out zones before picking a target address.

Seems setup_data is not included in those mem_avoid regions.

> 
> One is a bootloader bug, two is a kernel bug. My guess is (2) is the 
> culprit, but (1b) should be checked, too.
> 
>      -hpa
> 


--Mika

