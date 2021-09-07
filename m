Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFE402A9B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:19:49 +0200 (CEST)
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbwy-0005NJ-AW
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNbvo-0004RD-T9; Tue, 07 Sep 2021 10:18:37 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:52705 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNbvl-0002FA-Qo; Tue, 07 Sep 2021 10:18:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBiZngxSMCwcQMtcwYQyTsUUlw4reLGVU/8oggKlXmXSYTTEqtgqhMPWvll6xVDXbQ3foKz+zKCn6JSZfDVueLIO8TdEstmcfJRO4MLQKcSyPHbi3hlsbFqMz/kRzXDrNiBsTdrWop3P3yDJwis4ojAyYSq2HoWyCQ72/Lp3///O81P6vXa+rjfeMNKSbYWMWDjOpiL0Cgr0ycdqxQ+BPRPuyfWWVtisGQ448omFmfDi3fiDtHQURXzlhNZhL5dry1dNVFbCfsgxU838CgCuEyfEy5uzYjvI7ki0Tlk4salCo4JK9siJ7zgejsW1cLo0sXgWC4c2hcbDidmFw3abqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=g2fi607ccKKFf5g0C8RMdJaeY1ntBjMMvDQQ7xHDhnY=;
 b=bBDo/YKHqTp0L6C4hp9xppB0TvrLdcugOnSsu1avO9eLLYJ7Ihl4ZAua+8eryOZScZWYkguWFP+nnoUNqaZXF9BehfqpdmxOenMOXMUjunpHoBxu5Co+U3YNV4W3Z69u489cNbhs3yoHfvWpv7a8kYRVMYUgK0C6vGzyLqL5g6hUP1TFaCwoEyaeExW/GFgSQ4WSagfJGxvEB2NMmJ/30DwNwjlJdf/d3Z2RVGLObuy/HcXhV9U5zNCgqav2UBC07g1r8PVllb7dqBCxKXPqzNff9cdrrJFuzF9TeaB7fOFZZsjrNgfZeSNPBO4L/KoijoWwwzDXgMgjdyw4r0QHgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2fi607ccKKFf5g0C8RMdJaeY1ntBjMMvDQQ7xHDhnY=;
 b=mGGxp0JHj+CDQaQvTPzIJY4pWtmvAt5yXXoEfOa6cUQhz7pVzXk2gyA7mLF4AZS9glkAgyM7LJKHL0gmYpeDEnmWyZXjLtoy/zHUmKD2MCqJZn8ikgA/GfSMnhEhjZLApo10k/7qtkEgywC8S1SgNx4F/nLGaWbDfh2McxBVdRA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5336.eurprd08.prod.outlook.com (2603:10a6:20b:105::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 14:18:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 14:18:28 +0000
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
 <9cf39acf-38fd-3d2d-1750-439c630f0df5@virtuozzo.com>
 <a577496c-8143-4f78-8537-7633c3018016@redhat.com>
 <fdca4c29-434d-e589-fd00-2388962666ed@virtuozzo.com>
 <d2ca08c1-6602-47c5-8977-79f31df5964e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e2c0f113-1d8c-5925-a386-1ac2fe9d4029@virtuozzo.com>
Date: Tue, 7 Sep 2021 17:18:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d2ca08c1-6602-47c5-8977-79f31df5964e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0071.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 14:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625ac735-2de0-4fbe-aecd-08d9720a5d1a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5336:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5336F096F17447858282D5EDC1D39@AM7PR08MB5336.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VWD8CeiaA+S2Ww0dWLn/MJMVmpc3D80sfHuCgye7AFXuHenaDiUIAK3TNQT8atysr2pNj8gTkXoJbWu3WI2QvTQlQ6YAiHdox7DIdzyHuSJOVwCWhms5dMRUNgbkPqlZKB4OCbz1bPSYRjwLt8mmw04ZUdT3rw8PPFAuHHtBlFkPNEJpVgaxxaIhWqGlPYMRTI8FcAFGcP89lF+m3ZyCVdltIV1DZnTMmNXn5Hpuae1o11gxhtgsej+4LLTRPYnEpuHlV+Ato3y/HaEWA5wYf2rhvrHp3oKEJNuryQhIr6vaEdaG6PTH7KU0X2wmXeB37ifewqocAWBDjzKG49MeNRKNiUPtKKrM7GhHpOh4WPh8tRGKXEaGbwfZiOZYlCyOEgmKvWoFFPMoiQgKuK5sPZWQxu/NkMuDERr0k6WprSO0MjZRxDHgpdvDVs31i6xTU/SL74U9IKcykLGzZuXBGpt9tRqfouzIEiWd9PeoyD+t0ySZiqTzoKJNHR3+Es/5DsU3abVhquzTVziFAHQf2Kuh2RgAGQ/hXaXo3r8nWGd05wqkd87escXP8bVSiAiR159j/w7f6wuPHNiE4oli/p5dAKR/I5uIWowHzz70LWeXN9FxOwf04PEN4ooLi33Qo7zfQ5u9/eG3vuRiy43iHmbbTJbcZgJ8gjKdIES/X6FMWLk4ZYflmqjP9eRgh3Xg69Odxr3zixGoHwnGOArMVCnp8JmEgKWDpUwzmprJLNtBJv8O7KZHWU/16BwlOKHMLJw0alPO96iLqYEBUS+8Nyk1rlwHkBQ+BMvDRm+0JZaZq63qPVQwXu8QTVUWXKKHmV9T/tD2aVxVhUMPJvW9VYUDXYGTG+IWpNhL3hiKfNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39830400003)(366004)(6486002)(66476007)(66946007)(66556008)(478600001)(8676002)(8936002)(16576012)(5660300002)(186003)(26005)(966005)(53546011)(4326008)(52116002)(316002)(83380400001)(36756003)(2906002)(86362001)(956004)(2616005)(31696002)(31686004)(38100700002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDYvdzRVWXNaNFhlWUpPUGJpUkJReGZTUXFmbGJUa1UzakdWVmZYcS9PdEU5?=
 =?utf-8?B?dHMvM2lHT3YybjFoWENzNURUL2owdEZkdUJ4UDRqTEdyUytMZkpEQm9LTmNk?=
 =?utf-8?B?VUJzRjR6QjN2MGxUWnZHK2tLdllXRzJqQXJQVC8xQzVLaGhneDc0SU9aSUUy?=
 =?utf-8?B?MDR5WUFPZWxRN3BJaThCVWdrUGhucmtCNlN0MS8zOXZwZWMrOFBSZUxWZ2tl?=
 =?utf-8?B?VjkwZ3dDTnQ2ckJZdWZZTmJCdXZoRi9ubkF2ZVpDK1RPTDJyb25SSUFuSkFk?=
 =?utf-8?B?cGRTQmNmZDU0dXVMelVhTzR2UlQxenJsSVNSZVFiYmxycjBYZ3drOGtrNis1?=
 =?utf-8?B?QkJYRGYyaVpaQnhVS2pKKzY3NmpyUVo4MkxCMHdudU84bjQ3eFdhM2hQeklE?=
 =?utf-8?B?TzI3V1l3M2lSRHBQMjFQVVVuR0pKWngwSnlDOEJWSmF5Szhyc3B5MWxqTktB?=
 =?utf-8?B?U0Y3N1lqdStBdzI0MnJwZVlmQ1VMcVNWQzZRdHhjUWxuWEI3S05GYUxYL0Vh?=
 =?utf-8?B?RjhiZm5ESHFYbmhQRkFuUmpGWG4rMC80SHgyZ1RIeTY3bW1NNm5YS213TEdt?=
 =?utf-8?B?TE5MUkNnOXZkV21NdmFwcXRGaGMvaFhFOUIvWloxS2lycm5nN1BtbDdIM3A4?=
 =?utf-8?B?S3hURWxadFUvejQyOVZyT2ZsbmF2d09ZZ2tJRmJUelFYLzgyMnJac1NScTF6?=
 =?utf-8?B?eWR2TWF3TmRFNGtZUUl6MGhLQzRLQ0dIZzE0RUhIdG45Vk12UGV1R1VVS2RB?=
 =?utf-8?B?ZDR2bUN3bUl0Z1RZZ3M0VDJGWHpTK0xGMVN0QXcyUW40Rnd5b0lqRmVuM2ZR?=
 =?utf-8?B?NVV4cEZWVjlaR2hML1FkMHRxdVptSXFqaDl2TGQ1ZUpWNlJzUHg4cURWQW0v?=
 =?utf-8?B?cG8xWEkyUG95YVhMRkg1SmJYZjAwVHVxdXJQUUFmQlJtZTBXYnpmUENDUDQz?=
 =?utf-8?B?ZVdYTkNqOTNtamtnTlgvaml0ZjBDOUdSUUQ5TUlmNVA1Vjhydzl4S1RDUFpa?=
 =?utf-8?B?dFRCNWdtUFYwZjZrTXhISE9uVGNYakp4YWhDS01KSHJwWFVyZ2xtZHhxcEl0?=
 =?utf-8?B?RVZBT2ZPUk1ISHFUQlllZVlmR1U2YStqMFkybUplUzJYT2N3TDA1Y2VBQUJh?=
 =?utf-8?B?RVZuYWs3SXRaSWNMOGVKSDlRbmRrM1ZSb2tMNHlVSmZkMWtNQ0RDTVdxVmVG?=
 =?utf-8?B?OVlPZ2pvM1VSdTRNMkZZdUp1K1pPdHNqWHZiSktYdjNJRG9NZWpEK3NYTW9a?=
 =?utf-8?B?U2ZSM2xUZEFiRllJMHBBYVhUVEx3T0ZEYTZhdjFSZWxJaWczQU9EbVhmRzhs?=
 =?utf-8?B?QjdJRFNHdHRUenNBMndHTTg0OWxmTE54ZmYzQjI3ZnJDek1LbEhFSW5wL2ZY?=
 =?utf-8?B?Zko1Y0laRURIV0R2a0dwU0JJR041SzNFdnZtamV5anIzZnJSaWhva1llb0x0?=
 =?utf-8?B?UGl5QTl3R05ZSk9TWVRWS2FVRkxTK0R1a2lIa2hiamhnZkR0VDRvMWgwV0hI?=
 =?utf-8?B?ajh2MGgxaVFRQXVOdnl4QjVwdDk5SWc3YTU3alN4QlNLdWFaMHJoSzlBaDc1?=
 =?utf-8?B?QUp1TmphSU1KeDlBRkQ0azllREJOU1dBK1p2RWEzWkhvUlZUaGtmMmVPUnlN?=
 =?utf-8?B?ZUVHK2RyU29wYlFhZmo2TW94SmNRd1A3MlcvQlowcmtYcHBsVXkzVHRSdEJC?=
 =?utf-8?B?dEF2Ylp1SWNFdlZxRXZSV1YxZ1M4TGhoOU5pbDNDZmY3Zzl6Sk1wbnMrOEFU?=
 =?utf-8?Q?ByCWkqLTyzZrvU6FQumICip6JrWkQwB5n9ys1e+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625ac735-2de0-4fbe-aecd-08d9720a5d1a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 14:18:28.8269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EgrNw9dcHxO3Jw2Z2/3kVv4Pn7JNcVNXGImffCOJKnCR7p9XeAfG/dAsND/lbNrg3KpTUE4/yu6pD4bPQbCgLvkWAHMXOllG7Izfwbp8eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_NONE=-0.0001,
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

07.09.2021 17:00, Hanna Reitz wrote:
> On 07.09.21 15:44, Vladimir Sementsov-Ogievskiy wrote:
>> 07.09.2021 15:48, Hanna Reitz wrote:
>>> On 07.09.21 13:29, Vladimir Sementsov-Ogievskiy wrote:
>>>> 19.08.2021 13:12, Hanna Reitz wrote:
>>>>> We cannot write to images opened with O_DIRECT unless we allow them to
>>>>> be resized so they are aligned to the sector size: Since 9c60a5d1978,
>>>>> bdrv_node_refresh_perm() ensures that for nodes whose length is not
>>>>> aligned to the request alignment and where someone has taken a WRITE
>>>>> permission, the RESIZE permission is taken, too).
>>>>>
>>>>> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
>>>>> blk_new_open() to take the RESIZE permission) when using cache=none for
>>>>> the target, so that when writing to it, it can be aligned to the target
>>>>> sector size.
>>>>>
>>>>> Without this patch, an error is returned:
>>>>>
>>>>> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
>>>>> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
>>>>> permission without 'resize': Image size is not a multiple of request
>>>>> alignment
>>>>>
>>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
>>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>>> ---
>>>>> As I have written in the BZ linked above, I am not sure what behavior we
>>>>> want.  It can be argued that the current behavior is perfectly OK
>>>>> because we want the target to have the same size as the source, so if
>>>>> this cannot be done, we should just print the above error (which I think
>>>>> explains the problem well enough that users can figure out they need to
>>>>> resize the source image).
>>>>>
>>>>> OTOH, it is difficult for me to imagine a case where the user would
>>>>> prefer the above error to just having qemu-img align the target image's
>>>>> length.
>>>>> ---
>>>>>   qemu-img.c | 8 ++++++++
>>>>>   1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/qemu-img.c b/qemu-img.c
>>>>> index 908fd0cce5..d4b29bf73e 100644
>>>>> --- a/qemu-img.c
>>>>> +++ b/qemu-img.c
>>>>> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>>>>>           goto out;
>>>>>       }
>>>>>   +    if (flags & BDRV_O_NOCACHE) {
>>>>> +        /*
>>>>> +         * If we open the target with O_DIRECT, it may be necessary to
>>>>> +         * extend its size to align to the physical sector size.
>>>>> +         */
>>>>> +        flags |= BDRV_O_RESIZE;
>>>>> +    }
>>>>> +
>>>>>       if (skip_create) {
>>>>>           s.target = img_open(tgt_image_opts, out_filename, out_fmt,
>>>>>                               flags, writethrough, s.quiet, false);
>>>>>
>>>>
>>>> Hmm. Strange. I am experimenting now with master branch without that patch and can't reproduce:
>>>>
>>>> [root@kvm master]# dd if=/dev/zero of=a bs=1M count=2
>>>> 2+0 records in
>>>> 2+0 records out
>>>> 2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.00153639 s, 1.4 GB/s
>>>> [root@kvm master]# dd if=/dev/zero of=b bs=1M count=1
>>>> 1+0 records in
>>>> 1+0 records out
>>>> 1048576 bytes (1.0 MB, 1.0 MiB) copied, 0.000939314 s, 1.1 GB/s
>>>> [root@kvm master]# ls -lthr a b
>>>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
>>>> -rw-r--r--. 1 root root 1.0M Sep  7 14:28 b
>>>> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
>>>> [root@kvm master]# ls -lthr a b
>>>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
>>>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 b
>>>> [root@kvm master]# dd if=/dev/zero of=b bs=1 count=2097147
>>>> 2097147+0 records in
>>>> 2097147+0 records out
>>>> 2097147 bytes (2.1 MB, 2.0 MiB) copied, 2.76548 s, 758 kB/s
>>>> [root@kvm master]# ls -ltr a b
>>>> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
>>>> -rw-r--r--. 1 root root 2097147 Sep  7 14:29 b
>>>> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
>>>> [root@kvm master]# ls -ltr a b
>>>> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
>>>> -rw-r--r--. 1 root root 2097152 Sep  7 14:29 b
>>>>
>>>> It just works, and do resize target without any additional BDRV_O_RESIZE...
>>>
>>> bdrv_getlength() invokes bdrv_nb_sectors(), so we always align sizes to 512 anyway.  On volumes with a logical sector size of 512, this error cannot be reproduced.
>>>
>>> You can use loop devices to get volumes with other sector sizes, like so:
>>>
>>> $ cd /tmp
>>> $ truncate fs.img -s 128M
>>> $ sudo losetup -f --show --sector-size 4096 fs.img
>>> /dev/loop0
>>> $ sudo mkfs.ext4 /dev/loop0
>>> mke2fs 1.46.4 (18-Aug-2021)
>>> Discarding device blocks: done
>>> Creating filesystem with 32768 4k blocks and 32768 inodes
>>>
>>> Allocating group tables: done
>>> Writing inode tables: done
>>> Creating journal (4096 blocks): done
>>> Writing superblocks and filesystem accounting information: done
>>>
>>> $ sudo mount /dev/loop0 /mnt/tmp
>>> $ qemu-img create -f raw source.img $((2 * 1048576 + 512))
>>> Formatting 'source.img', fmt=raw size=2097664
>>> $ sudo qemu-img convert -f raw -O raw -t none source.img /mnt/tmp/target.img
>>> qemu-img: Could not open '/mnt/tmp/target.img': Cannot get 'write' permission without 'resize': Image size is not a multiple of request alignment
>>>
>>
>>
>> Does it mean, that when logical sector size is 512, qemu-img do resize target without any 'resize' permission?
> 
> Well, it creates the target with the size of the source, and the size of the source will always be reported to be aligned to 512.  If we didn’t have bdrv_nb_sectors() but used a byte granularity for a BDS’s length internally, then you could see this error with 512-byte-sectored volumes, too.
> 
> So from qemu’s point of view, it doesn’t need a `resize` permission because it doesn’t need resize the target, because it’s always created with a 512-byte-aligned size anyway.
> 

Ah. Sorry. Somehow I thought we are saying about unaligned precreated target. But it's unrelated here. The problem is about unaligned source, so we have to create unaligned target (of the same size) and then we have problems with it.

Then I don't see any problems here. Maybe we could add BDRV_O_RESIZE only when we have unaligned file size, but nothing bad in adding it always for BDRV_O_NOCACHE mode.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

