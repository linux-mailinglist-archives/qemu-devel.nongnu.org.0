Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89580490496
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 10:07:51 +0100 (CET)
Received: from localhost ([::1]:39180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NzS-0006PK-CQ
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 04:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Nwg-0004Hy-2i
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:04:58 -0500
Received: from mail-eopbgr70102.outbound.protection.outlook.com
 ([40.107.7.102]:48691 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9Nwc-0000vd-6I
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 04:04:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8at+ocTEdrimSXnb49K8/JqkxQoUPgr7QeNglE3/GP8c7gTbLYqNg2XD/yJpIOLz0ILak4jZHLAuE4xK5SVTRP+9NDPxcnItJ00/YF04PMB4UrxpD3teh5Rix0Vilp6uMbIyJJghFHxhOnzvUx9hATbzeH2hT4qYvHylnacKONr8XQWmLHT5AaevnMq/A8jMMXEGuBxkdQgbKoTFgKTZx2v+/klTxgMnQhDtniRg12T9gUj55mnPFsGDj2f9kjTmRewsJNdCZTQBaELAdtbX18WQ6TK9mEqBLeuQ383CQEig/UYCmTxp7bxNhpXyxlVV56ONr+BcgBxX3zEX5qFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmwHnpyxtwoGOXbXYmEZac5SUTHV6QJC/Lkw/OvrS/4=;
 b=YWoFYrMoeIaVbqrEs1PpodXdsTijiKiiKuhJZGd2hQ0998L9pCWuMOpKHQTLqswpmHiii9Dn5TGI0CsvhvB1J4zwiXbbsZAhuH34QBO2ABVB8MPg6w939j3PEDzgoubjuJN0sY76rBrEAbfH7sCfuDDj71OyFaaYIU7z8bvkhMcFZii7px1jvNPtNZB9y7FpDkj9v+2BOXdsZmZzFyiVjnCs6LUDV+cpToe5PPPvg7ius8GNNylrqdKn6z83/RqazHIDcHHdH7absrsNHJUS/66dHXHtoyhBZuwFOJfKEkLd2kLOlnwGAHymRn63sqz0NFn55z/+kvUeNG4XKZnbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmwHnpyxtwoGOXbXYmEZac5SUTHV6QJC/Lkw/OvrS/4=;
 b=JAegcHZTWbYwPX0KZMnDYbr42T7QDThC5L8i3h6e9lnmPSgRLt96M4uABewyOXCZsqiF4LGmfALMsfO6fuLVlK+kBqI1Lnu/TrksTrFQsquy+5e3z6/GHyJsIsa+qrftTQl7++wHbjNCre5OFkWDEOrfVJXlFZGNcSPnZp47mFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2815.eurprd08.prod.outlook.com (2603:10a6:802:19::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 09:04:27 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 09:04:27 +0000
Message-ID: <394ff436-4527-ad09-4561-742a70fc0055@virtuozzo.com>
Date: Mon, 17 Jan 2022 12:04:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, eduardo@habkost.net,
 kwolf@redhat.com, den@virtuozzo.com, quintela@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, hreitz@redhat.com,
 crosa@redhat.com, eblake@redhat.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
 <87v8ym36l6.fsf@dusky.pond.sub.org> <YeFgwNZ497nhNRF7@redhat.com>
 <87sftqz50g.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87sftqz50g.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da0455a-ea41-4099-a978-08d9d9985d0d
X-MS-TrafficTypeDiagnostic: VI1PR08MB2815:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB281513793D6828F4449A867FC1579@VI1PR08MB2815.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ck8psN7Ye7KMclCdRHGGMoj+oRgI0fqRn9szvpcbk3ncvQCdeBUrCZFCWoddjfEA23ky3CraRNMkjrG6j6rgBDvTSEWilrbKxyTsg58Voh1OGBWjpBdzJDwIflGtt6iOAIt5hasmPUGyYUvQxEe7HxLXHn8gKSf8zKApswah54IvZXsAiWfwftmDyBTHahVheIhkZSChIzc7NEYcyxk5lvda38L3FO860XdiA/cX+MNtM+D+URCg2JxG6Pgq4NdgWRcq04MhK6n1kncG+kpJdtVnKD9pp75g4LFlg4GWy9GtqUA+Q1MXsQDQKopQtYNrFwUPKJzkrERH6qW17FNTeBrY2PaFMV3SsuENghOmPtPQGo2i5nVH+KQpkJ5dhuSrO4PIRHkkJVHVF3WvjVosNOnXK2mh/lBeZNRHHr09tCef4RHyr0SXwANKBchIG2DGAim2VAyA/k488UNGtY7jsRxH6Pd/PUUn/tF2NRdsPV2dtCiQxeQqWuWAQCXdv/N6cwkdgR/72jPcjMy+tPr/qapbT6rzXGmpR9fn/krKQncE0mJD26qgu/0LFHnhVLqo75C94IdmA8F7DEOqddKRsAKYBdhn4niZu2jfCzv/LuUdwgng2WFznTFsEufNwrtQRhE0UoWnAljpWMsmcCGCksQmXEqRHDYDf+A9DQjD5MfOr43xQxGIa7roZtswrBkaOcSC59w/oeuEKn4dDjMeGV/ZXQScgyxucnDFPp0N/zZbGGLxoL4xm8Dte7R0PNajB+lOkiMgJJimjSa5q8apjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(2616005)(7416002)(66556008)(36756003)(4326008)(6486002)(38350700002)(316002)(38100700002)(110136005)(2906002)(6512007)(5660300002)(31686004)(66476007)(6506007)(52116002)(26005)(6666004)(508600001)(8936002)(83380400001)(66946007)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkY2ZXNkaG5yVFZQdHlyUDZ3eXA3QjcxdlpMWUpRYmJpMHRsUlVMYThOTkM1?=
 =?utf-8?B?MUFlc2ZsdEZIWlN6Mld6ZEkxWEZOWHlzUnhlMUY3ZTBGUEVaQno5dlJPQndC?=
 =?utf-8?B?NnVla2J5cHduRmlTMlpKR0MzbVFSbGs4bEQrR1l6Y0pBZEo2cnBjZXdLVzk5?=
 =?utf-8?B?Qit1WklXZFRXWXVNL1Y2ajJwK1Y1MmZCeXp2c3dnclJvbmFBOXhqNHFCZVF2?=
 =?utf-8?B?aXQ4MUZ0dEZkbitKQktnTDdHUTB5M1R5cTcyTW0wekpHNXBXeXJPMW5IWU16?=
 =?utf-8?B?L2FtZE1BNzVQaHA5bmp1aXc2eThYVDRxd3NVdjkweExqRURvTEdmK0hCSmtV?=
 =?utf-8?B?dTFYOVdKcktwbGNXQ0Z5d1ZtRFFvOGpvRlF0QW1rN2VpRVdoU3g2c0pibGtS?=
 =?utf-8?B?UE1scVhyVzdtYmlYMklzTWtNSXhBMHdsLy9NUXZOeitNMjYxQ0ZrRlc1UzVC?=
 =?utf-8?B?RlBycTFFVU9jckplR05vR1VTbHR2clk5d2tVVkVUNTI5b2xpRXZzWFdQQ3ls?=
 =?utf-8?B?S1JabHpueTVNY2d6RkgxMjI1cXJhUzdPVkJlVnk4K2lEK3VDOTlBOFJNZU43?=
 =?utf-8?B?YTIwRWhSNWhiNUdCL3ZnZWRKbDlndGRlV2FDSFhnN2tWWlRRL3UvS2tGRjlv?=
 =?utf-8?B?cGxlc3NwYzZNZFdEZ29nVkRlbTVuejZSUWdqYmVPWkNsN2ZQUjh1UjF2KzFI?=
 =?utf-8?B?b2MzWVFGOUhxSUlpc1FDcjlLOUtGZnRSeFJrdFRTdWtlU1hPbkc5SFNVMUw2?=
 =?utf-8?B?T2NUaHA0ekdzWmFrWjNSWEpDVXM1OHdJYlcwUGJZRm1id0hSTFRibHJPWTY0?=
 =?utf-8?B?VnR6ekVaU3AzMksvYXZVZ3I2RU1OWFI2YWJ1ZHFtTnlsYmJHZVo0SVJDOCtD?=
 =?utf-8?B?TEZ6WFJyYmtseUxvVDlFb0NCRS85Z2t5aFFSSDFBaHpTMzdYcHY3RDV6YkZl?=
 =?utf-8?B?cGNsQTZSTGdMdlpDMTEvM2RhSkJ3c1FOL3dacCtOVm8zZHQxU2xBSWVVT2ZP?=
 =?utf-8?B?aDFUVzlXVitYeitXZVlnZFVXQXZmc3U2eENSa2owMDdUYkZ6ZGJYVGROaDFF?=
 =?utf-8?B?RTlPck13TlM1b2Rzdm80R0FkaXR5SDc2QjNiYTNEUGF6M1pYOHNGVnpvRENQ?=
 =?utf-8?B?RFF0K2N2c0ZKeGxWWTlNa1QvcXQ0cDcyUjdLVE9OUnRTeDVxZTlwLzJVbmpC?=
 =?utf-8?B?T0FFNS9lemluM0Z1R3I1MlhiajdNK1R3RDA3cy9lTTBvb2tWTDh3MEN4YzRr?=
 =?utf-8?B?T1dZc2pDaFdERm85bUJFQkF1YU5XL2FOM0o0aDA2VC82bExQL2d2ZlUzVVBK?=
 =?utf-8?B?YlBDMHpURGViVDBvaHdBa1RDM3poNVkzTGNMSlZhZlJjaXhtanVnbTg4dHdw?=
 =?utf-8?B?Q0ZJVlhrYzNYRVVoRFA0WmtTdE9uS1R6ekhlWnFNejJhbkJSeGRMdks5dzNv?=
 =?utf-8?B?c0YxK3BxaDV4Y3B5cWRUb1FzVFluZTZjVHh4WUFtQnlORXpsenI1RkxpSGIz?=
 =?utf-8?B?b3NnOUFpZnFoSURlaHd5K3R6bzVaQ3pGSHltM2F4ZTMvbWdxRXZaVVFteVFh?=
 =?utf-8?B?dWVKdnVDaEhMQktoQXA2Z3BQeHUzY3lrNjN1ZzBTMFg5UGVJU2JnWDZoL2Jv?=
 =?utf-8?B?SWtweGpGT3lBVFJYVUZBMWh4WDBuejI0RTVBVWxnYzN4c0J1cTB2c0dqekJi?=
 =?utf-8?B?bGxlKytlS3FKdm82dEE2SzBSYmNjQzBkU1VXeHJCZ1dwZVN2RTZVcUVSRTJ6?=
 =?utf-8?B?WkNNSG1BZmRJbUpyRUtOZUdPWnRyc3pmczRBT0V1UGczSnV3c2l0d2NvYmQ1?=
 =?utf-8?B?a3RvVkVuRGg1OC9BTEpNOFY2eG5RVWdDdnRpR3VQL0pwUThLQ1dLUnpjbWpC?=
 =?utf-8?B?R3VmTzdkTlRoU0xqVkxEckJ5UGZSRjl4RkplNHY1RUxyUVM5a1d3bCszWWtL?=
 =?utf-8?B?K1A5MWp2cHZ6S0xtU294bzBZSzc5UUxhSCtnVmVubmxoRk5uSDNqYTIraXR4?=
 =?utf-8?B?QWp3Q0d5eWtxZGJCU0FZckNBT2dITmg3cXZONEJKb3BrY1dCV1JlN1VsMWZR?=
 =?utf-8?B?Sy9KUG1ZZ1lvUE4rQ1pyUEsyb3piL0V4enhtcmFVV285WmxRamtscEZkYWRh?=
 =?utf-8?B?SHJWK3FScUUvNUlEZ2ZwZXQ1TFFJTGFkQXJwczNqTTVycUM5OUxmdGhyaUM0?=
 =?utf-8?B?RUhrZmJEaEtnSjFNRW5wMzRHZnBFK3YzSm9PcEpkdlJVeU5SMmxCanNWa2Vw?=
 =?utf-8?Q?d5Bi4ivcb9EggX/1cNGjN3GY9FVog2WSJ9gnLuVwIc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0455a-ea41-4099-a978-08d9d9985d0d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:04:27.1568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPpLcVm2TAw79DGAfS3m9TZFjznaFl3sHuz6fTVFVQFNxPKBR1H1T3pzzNFCVAA+KVhbnL7AzKM+tU5nl28W3Np5BcnAhxqZSZYgZYxB1RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2815
Received-SPF: pass client-ip=40.107.7.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2022 18:55, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Fri, Jan 14, 2022 at 12:22:13PM +0100, Markus Armbruster wrote:
>>> Nikita Lapshin <nikita.lapshin@virtuozzo.com> writes:
>>>
>>>> If this capability is enabled migration stream
>>>> will have RAM section only.
>>>>
>>>> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
>>>
>>> [...]
>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index d53956852c..626fc59d14 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -454,6 +454,8 @@
>>>>   #
>>>>   # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
>>>>   #
>>>> +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
>>>> +#
>>>
>>> What happens when I ask for 'no-ram': true, 'ram-only': true?
>>
>> So IIUC
>>
>>    no-ram=false, ram-only=false =>  RAM + vmstate
>>    no-ram=true, ram-only=false => vmstate
>>    no-ram=false, ram-only=true =>  RAM
>>    no-ram=true, ram-only=true => nothing to send ?
>>
>> I find that the fact that one flag is a negative request and
>> the other flag is a positive request to be confusing.
> 
> Me too.
> 
>> If we must have two flags then could we at least use the same
>> style for both. ie either
>>
>>    @no-ram
>>    @no-vmstate
>>
>> Or
>>
>>    @ram-only
>>    @vmstate-only
> 
> I strongly prefer "positive" names for booleans, avoiding double
> negation.
> 
>> Since the code enforces these flags are mutually exclusive
>> though, it might point towards being handled by a enum
>>
>>    { 'enum': 'MigrationStreamContent',
>>      'data': ['both', 'ram', 'vmstate'] }
> 
> Enumerating the combinations that are actually valid is often nicer than
> a set of flags that look independent, but aren't.
> 
> MigrationCapability can only do flags.  For an enum, we'd have to use
> MigrationParameters & friends.  For an example, check out
> @multifd-compression there.
> 

Remember, that we also have block-dirty-bitmaps in migration stream. And we also may have block devices data (should it be deprecated?).

So, what about an optional migration parameter stream-content, which would be a *list* of MigrationStreamContent enum values?

Than we can deprecate dirty-bitmaps and block capabilities in favor of new migration parameter.

{ 'enum': 'MigrationStreamContent', 'data': ['block-dirty-bitmpas', 'block', 'ram', 'vmstate'] }

...

Migration parameters:

...
'stream-content': ['MigrationStreamContent']


-- 
Best regards,
Vladimir

