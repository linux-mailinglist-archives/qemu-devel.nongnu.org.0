Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAF495E46
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:18:11 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArvl-0008Tu-Rq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nArR7-0005UD-RI; Fri, 21 Jan 2022 05:46:29 -0500
Received: from mail-eopbgr80098.outbound.protection.outlook.com
 ([40.107.8.98]:1876 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nArQu-0000fZ-ES; Fri, 21 Jan 2022 05:46:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qh30IHB7efzsrTE2UMtuHPDmt/aizikvvjvBIUjtlw7YRZy3uEnpicxtTfEuU6ko0TbCh2GerpS+GRWCGInwmdGwZwW3TkFEq7h44SQZ+Ek/CcE5gd2M31X0nTAKnv/55vDsf5YsbKGdzTjLqDErlzwI6L7aIb3RidM1oLejHNyevwYK9HZvXxf8PWexTk0XjrugNEahy55ExF1zCl1AzAvs6dLF/oIck09iqs20S46g7nIkNq4kpws6EMtJCSio74M3y3Ln2656CDAxynZEVFV4fYz0GXVz52LruQLbVwyqQFYTMnMTd0ElGUTEqqH7IQSJiQ2JyCKcgJxbWhnAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXiKqaqvaJKMOEKQaKfobbuDh/BDz4lFCbD/gL8p9ME=;
 b=Y7gQddbcJN5OH7DC+fTaxbJuM6pslUQ1lqEjp2wi0LQVWHo7nQ5KK+J4yX+F6uyc85bR39vuYxe9Do/8zkawpOrN59L0CpGMoFeaXk6EMELO++Nptb9NxaUVjB1unJo4jDzehYw4/2FEFXp81jP5kEPylHkfKVyP9YaRv9nsr7Tq/fkmBjGwMujoVaDybIJeMYw5Uqx05L4TgqtoRP8+urJjeJhfDgPsRdoqFZgDeIR9DtyO4IrD2gFqa8HWp3OcPgzkPeqFr34H51rZZsoDMR4JHizHlKu9Usb3YqxYrWWQGX2L34S7Bro8XgMMD8bD5oCIC3opE+iMJUdSObknfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXiKqaqvaJKMOEKQaKfobbuDh/BDz4lFCbD/gL8p9ME=;
 b=Lw5WZwDclLwX9gocixImzhFRNnCfZLTEQPhHLLsRsK0Yrqs0wzc3/mMxG/rt/uKzSoOBbhS/34ShHd/XW7yec60dbfqty1nt61nvoy5vnMZ/PYO5Vh3/mWUgHYl0wWhmuQSyS5njFF8nPy+jxsU5Dswd5aoc8+oAuZZ8pNPRiHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 10:46:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 10:46:10 +0000
Message-ID: <63747c43-93f5-f899-bf8e-4c87467db68b@virtuozzo.com>
Date: Fri, 21 Jan 2022 13:46:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 10/19] block: introduce fleecing block driver
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-11-vsementsov@virtuozzo.com>
 <db264b8a-2c27-eb7c-0c2b-d1fbfe473aa3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <db264b8a-2c27-eb7c-0c2b-d1fbfe473aa3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c1af38-8346-468d-bfc5-08d9dccb3c47
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-Microsoft-Antispam-PRVS: <PA4PR08MB6032FAF387ECB148BA94E3D4C15B9@PA4PR08MB6032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9E0mhtXkV3fFeUlNoZa4fjUIB39Cu6oI52EbYGMnaHcfpnUv+j/OXTMKduZRZ5sGAHAGJZA/e5VRgFm/0Sk5ETdpCercFvfM9LCJzOa/tvU/amX56XM59TGU5RcmNR+Vp5EbJZJ4WrtJ22tFMzrL9MRC6ekiz7Pd24fshFwgvOkVRI3Gqn4U9TFHIumEzb+roR/Q8rWA4XDErxJtfRbA4XNGN8c+EIPBzPGDxQUn2UKherEdx1C5oudBYFGsreSJthU3Q4CzVT6KohX+MR2gLmGVTIIvLqZzP5kKaU6M5Jom7hEFsxIRT6thT5XIWJRNJpXq79akcJeu5OyBAGdxg0uvYsUAoj7g/VQHE9ixXKsZj7AsKuVVBOlxWgqJ5p9V6+AEoWruT1hXzOf4kpz9efxE5ZQtjdhe3lKFyzmg1ng1Xu8QlhJS2l5yhiMR260swGUS9zFdKedETfgH1FwvIEzrDRM+dOQCElWfjf6BKDq0XMIN4F2Oohg1cXABBQkugRliiWa6gyZMiv4VwQ87KeGTuZbp7qqHg44QDy1coEN1u8Eidy5+P5wPyfDMDvlp3YS8+uUfOJx+bscy3Oznvs/bzg7MgoGHweRDB1iCGdWtUCUsgpxH3/O7/Xi/E6M5It7wl2fH3Sscx9MnMLFzS/I3+/xRaJPaZI4Bw0S2fPjfdKi3H3+/9BZgc+MofstRr5oep4WX4nqdCdjGPsAHPUxWNyWrJS1cXDjuK49B/LKNPamOsyxUqe7PdPNvwfe6qxnKbOeDSVlpoJ9V93gqFqVqh2fyyIxMdppvVhjbx2aSDfTrls9jJwBopO3E1KuiO2KrEIKOf+fuBlmjoY1nCQKWz/6LHVo7DEZ7lMmH9yI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(30864003)(66946007)(508600001)(38350700002)(38100700002)(2906002)(4326008)(26005)(66556008)(5660300002)(66476007)(107886003)(6506007)(8676002)(31696002)(36756003)(6486002)(31686004)(83380400001)(2616005)(52116002)(6512007)(6666004)(8936002)(53546011)(86362001)(186003)(2004002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWQva1doZWxoM0xTU3lMb3RzSzJCVjZMZXU3NndTWXRLdzNZcnhXOVNFSWdu?=
 =?utf-8?B?bCt1bVVOZEVqakpVblRkRHYreGx2SGdWWEw1YllwNHgrdU5CN1E1VGJTTzMw?=
 =?utf-8?B?aXN0azhvVWlmUCtiVGJCdmZWQldtMnpnSVBvTmVUL1dtVG50Y00vN1grQi9z?=
 =?utf-8?B?aDY1YnNZakxyYk1FUTFLdjBXeE9nekJWZkJQL1N2eFhCUTV1V1BjZnU5c21v?=
 =?utf-8?B?MFBnOXQvejlyOWVFY0h1Y2lHaEVMUDBZbUtsREJiSzNPRkl3UW5HNUptZkho?=
 =?utf-8?B?OVpNblgvWnQ5WFVPUEt1Tm5LeGEvRFRqT1cxTFBtZzVZWm8zWVpkQzdQNThH?=
 =?utf-8?B?WmMxbzhZYmZldDEzVTN6QUVVbC9kQU5FMHJ6T3dvM3ZKVEFCQ3E0ak9Sd2xR?=
 =?utf-8?B?UHhKMXVvdlg4TkltRTFzc2pSYTlCWDhOS1BQc2QxbWMzQlBUdFFDS0t1eTF1?=
 =?utf-8?B?TmE1d3Zsc2g0WnJDbTZCbTF1ODA2ejFpMnA5aTB0N0N3TlgwRytIWXNaOXFU?=
 =?utf-8?B?MG1sUVEwdGRSNHo2RFNZK2tpUDc2ZVhwRFlEcEdxOGl2SGFWYlFLb1UrSnBm?=
 =?utf-8?B?SFJjNzdPM0tib3J2LzAzTGl1TjZ2T3pCaklaL0tnYlVvZDhWR0JaQ3hWb1J4?=
 =?utf-8?B?bGNhUEdZbFJLKzRUVDBaZDRLUTZkaVJHZk5HalAxQnlUTS9MSFFkaUROb1Zz?=
 =?utf-8?B?a0FEVU9neWFXSWorelRLWDVPOUtEc21YYktIZEpldlVEMCsxd3pIWjc5bVhF?=
 =?utf-8?B?NFZ4UWtzT1Z1QW9DWDJDMnFtQ25wcjF1TDhTdGtrMVM2MnF0ci9PcE4yTk55?=
 =?utf-8?B?b3hYZHU0NER0NWp5eXNUTDY3b0RtYnlWMTFVZmZDNTlzeFVpeEJFTDNtaGtR?=
 =?utf-8?B?L25kMzhqQVBWQkRpZ2llMHA2ZnZZN2VkL0xXeENKWjcwNDNvNmpzbGFBOFNH?=
 =?utf-8?B?Q1hNZnFrL1JnbDdOd1dJYm9YR1QyaHFrblNpaXdGQkJYV0ZObm1uQmJVV0FT?=
 =?utf-8?B?ZkJjTURRTGZiV1UwZFJ0V0pkeTI2eWNqZkVJS1hVZUYxL3Jsb0tpaloxVzNM?=
 =?utf-8?B?KzBxeVNyY0pmZnNIZmdVZnBpcXJiM3NrUnE2cGdrbWZESXltOEVPTUE0eFVx?=
 =?utf-8?B?dWRpVEhFeFJ4VzVwK0U2YUtYbVlSOFNhejh6OHhjSjFMekdxZUYreXFETmhi?=
 =?utf-8?B?TmVwV0RSVmxQZ2F4VVJZUzgzbDc3UG9xK3ZOZWFnZWMwanRVTUNYV1lBTFpu?=
 =?utf-8?B?Z1R5ZS9SVzJkbXNFYTg0cGRrSEd1NW5BY1hwUDlkOG5VRW5YbEl4UHBsa0x4?=
 =?utf-8?B?ZWRLTEhDckhFaVdJeDlYMXZ4OVE0OXZTdWs5SUU3NGcyUVF1OHphb0dzUy9U?=
 =?utf-8?B?cDd6TVJxZDBDZW0wWEczSUt0SmVEaXBEYW5TUW5RMFVWSFZIK1NINitvV2JF?=
 =?utf-8?B?dDVlNHp6MWdVVno4citwbjFCY3ZlVGpNYWx2bEhmYk42eDVFT0RKOUNuMm12?=
 =?utf-8?B?d3NtaHh6QnNXY1Q1RzYzQjZTejJHZy9kSzUrZlR5aUNUWGVXSGFXUzJuLzRv?=
 =?utf-8?B?UTloaEMyZVBSeDYwYzkva2FaTTBDdXl0c0s2Zk5OOVlRcS8vbFZ0WmR3cGRi?=
 =?utf-8?B?WVNJcEtvSVE5Wkp1ZSs4RFY2Z3dSZWtsWHNLTW5JZzk3UDVsWXptV0VKTTlw?=
 =?utf-8?B?MU1WZVlJazBMbHV6elFSSlAvUTdzM1JUa0s2ZS9Sdi9QQWxFZTZsV0t4KzBz?=
 =?utf-8?B?TDVYMmswYS9ROTJiUDRZZGk1OUdDeU4vc3FwTDRXTmJOdXVXR201cGVOM1B2?=
 =?utf-8?B?Ly9LQWExVjlnUVJsRlZtV2VzbDBNMUU4QXAyQmM2NlBEdFJqMHBKSUlKTEM5?=
 =?utf-8?B?UlplS2VsbEJkSFE2dWRsYUo0V1FPV1NKdDBmWVk3T2tyTnMzOXFydm5KQnRT?=
 =?utf-8?B?UFBkNDhFcTVveXZLZlhIMHhaaGtFcFdyc01lM2w5aG1UanNUTVZ3OUM0eXpl?=
 =?utf-8?B?Q1lJYWJDSGcxczB0Umx3NTlQT1MySjMyMkFDTlhXMVVKWXJaRDZ4d09CdnBZ?=
 =?utf-8?B?MVFydDkvcWRid2hyUjVTVXVkMkxGOWJVVGMvb0JNVDVwMVpPd0ZZSFVodG1U?=
 =?utf-8?B?MjZCYzZiV2I0YUZzMWkvOWVpMnlQazNPS1dtZVdKdWR0WE5zVkptT29jSjU3?=
 =?utf-8?B?aGIvajZyNWdERnNRSWdHbStDRFhYa08vVTZOYVlzQjFDK1VHaUxmUURiT2tW?=
 =?utf-8?B?RUVRd05kWUlqL05QaERhYkF4Lzd3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c1af38-8346-468d-bfc5-08d9dccb3c47
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 10:46:10.0098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrECIrSKPTW96QGnndYCihljL+TPlauEG8KxQtzMHTLoTM7T12WsFc1fng7SPD1gDDhhG/FmPZD03lOsMFMs29QYjp1FVx138hp9O+5C/1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.8.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

20.01.2022 19:11, Hanna Reitz wrote:
> On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
>> Introduce a new driver, that works in pair with copy-before-write to
>> improve fleecing.
>>
>> Without fleecing driver, old fleecing scheme looks as follows:
>>
>> [guest]
>>    |
>>    |root
>>    v
>> [copy-before-write] -----> [temp.qcow2] <--- [nbd export]
>>    |                 target  |
>>    |file                     |backing
>>    v                         |
>> [active disk] <-------------+
>>
>> With fleecing driver, new scheme is:
>>
>> [guest]
>>    |
>>    |root
>>    v
>> [copy-before-write] -----> [fleecing] <--- [nbd export]
>>    |                 target  |    |
>>    |file                     |    |file
>>    v                         |    v
>> [active disk]<--source------+  [temp.img]
>>
>> Benefits of new scheme:
>>
>> 1. Access control: if remote client try to read data that not covered
>>     by original dirty bitmap used on copy-before-write open, client gets
>>     -EACCES.
>>
>> 2. Discard support: if remote client do DISCARD, this additionally to
>>     discarding data in temp.img informs block-copy process to not copy
>>     these clusters. Next read from discarded area will return -EACCES.
>>     This is significant thing: when fleecing user reads data that was
>>     not yet copied to temp.img, we can avoid copying it on further guest
>>     write.
>>
>> 3. Synchronisation between client reads and block-copy write is more
>>     efficient: it doesn't block intersecting block-copy write during
>>     client read.
>>
>> 4. We don't rely on backing feature: active disk should not be backing
>>     of temp image, so we avoid some permission-related difficulties and
>>     temp image now is not required to support backing, it may be simple
>>     raw image.
>>
>> Note that now nobody calls fleecing_drv_activate(), so new driver is
>> actually unusable. It's a work for the following patch: support
>> fleecing block driver in copy-before-write filter driver.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json |  37 +++++-
>>   block/fleecing.h     |  16 +++
>>   block/fleecing-drv.c | 261 +++++++++++++++++++++++++++++++++++++++++++
>>   MAINTAINERS          |   1 +
>>   block/meson.build    |   1 +
>>   5 files changed, 315 insertions(+), 1 deletion(-)
>>   create mode 100644 block/fleecing-drv.c
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 6904daeacf..b47351dbac 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -2917,13 +2917,14 @@
>>   # @blkreplay: Since 4.2
>>   # @compress: Since 5.0
>>   # @copy-before-write: Since 6.2
>> +# @fleecing: Since 7.0
>>   #
>>   # Since: 2.9
>>   ##
>>   { 'enum': 'BlockdevDriver',
>>     'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
>>               'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
>> -            'file', 'ftp', 'ftps', 'gluster',
>> +            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
>>               {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>>               {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
>>               'http', 'https', 'iscsi',
>> @@ -4181,6 +4182,39 @@
>>     'base': 'BlockdevOptionsGenericFormat',
>>     'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>> +##
>> +# @BlockdevOptionsFleecing:
>> +#
>> +# Driver that works in pair with copy-before-write filter to make a fleecing
>> +# scheme like this:
>> +#
>> +#    [guest]
>> +#      |
>> +#      |root
>> +#      v
>> +#    [copy-before-write] -----> [fleecing] <--- [nbd export]
>> +#      |                 target  |    |
>> +#      |file                     |    |file
>> +#      v                         |    v
>> +#    [active disk]<--source------+  [temp.img]
> 
> When generating docs, my sphinx doesn’t like this very much.  I don’t know exactly what of it, but it complains with:
> 
> docs/../qapi/block-core.json:4190:Line block ends without a blank line.
> 
> (Line 4190 is the “@BlockdevOptionsFleecing:” line, but there is no warning if I remove this ASCII art.)

I usually disable docs building to not waste the time.. But I should enable it at least once to check that I don't break it.

> 
>> +#
>> +# The scheme works like this: on write, fleecing driver saves data to its
>> +# ``file`` child and remember that this data is in ``file`` child. On read
>> +# fleecing reads from ``file`` child if data is already stored to it and
>> +# otherwise it reads from ``source`` child.
> 
> I.e. it’s basically a COW format with the allocation bitmap stored as a block dirty bitmap.
> 
>> +# In the same time, before each guest write, ``copy-before-write`` copies
>> +# corresponding old data  from ``active disk`` to ``fleecing`` node.
>> +# This way, ``fleecing`` node looks like a kind of snapshot for extenal
>> +# reader like NBD export.
> 
> So this description sounds like the driver is just a COW driver with an in-memory allocation bitmap.  But it’s actually specifically tuned for fleecing, because it interacts with the CBW node to prevent conflicts, and discard requests result in the respective areas become unreadable.
> 
> I find that important to mention, because if we don’t, then I’m wondering why this isn’t a generic “in-memory-cow” driver, and what makes it so useful for fleecing over any other COW driver.
> 
> (In fact, I’m asking myself all the time whether we can’t pull this driver apart into more generic nodes, like one in-memory-cow driver, and another driver managing the discard feature, and so on.  Could be done e.g. like this:
> 
> 
>                  Guest -> copy-before-write --file--> fleecing-lock --file--> disk image
> ^        |                  ^
> |      target               |
> +-- cbw-child --+        |               backing
> |           v                  |
> NBD -> fleecing-discard --file--> in-memory-cow -----------+
>                                          |
>          file
>            |
>            v
>        temp.img

Hmm ASCII art is broken for me.. Me trying to fix:


                                     ┌──────────────────┐
                                     │       NBD        │
                                     └─┬────────────────┘
                                       │
                                       │ root
                                       ▼
    ┌──────────┐                     ┌──────────────────┐
    │  guest   │     ┌───────────────┤ fleecing-discard │
    └─┬────────┘     │ cbw-child     └─┬────────────────┘
      │              │                 │
      │ root         │                 │ file
      ▼              ▼                 ▼
    ┌──────────────────┐  target     ┌──────────────────┐
    │       CBW        ├────────────►│  in-memory-cow   │
    └─┬────────────────┘             └─┬───────────┬────┘
      │                                │           │
      │ file                           │           │ file
      ▼                                │           ▼
    ┌──────────────────┐     backing   │        ┌─────────────┐
    │  fleecing-lock   │◄──────────────┘        │ temp.img    │
    └─┬────────────────┘                        └─────────────┘
      │
      │ file
      ▼
    ┌──────────────────┐
    │   active-disk    │
    └──────────────────┘

> 
> I.e. fleecing-discard would handle discards (telling its cbw-child to drop those areas from the copy-bitmap, and forwarding discards to the in-memory-cow node)

, the in-memory-cow node would just be a generic implementation of COW (could be replaced by any other COW-implementing node, like qcow2),

Hmm, but than in-memory-cow should own the done_bitmap bitmap. But we want to use it for synchronization in upper layers..


> and the fleecing-lock driver would prevent areas that are still being read from from being written to concurrently.

But we want to call fleecing_mark_done_and_wait_readers() exactly after copy-before-write operation, so this call should be done in CBW filter, not in fleecing lock

[*] upd after answering to last comment: or we don't want..

> 
> Problem is, of course, that’s very complicated, I haven’t thought this through, and it’s extremely questionable whether we really need this modularity.  Most likely not.

Yes, I try to go with not-too-many filters.

> 
> I still feel compelled to think about such modularization, because the relationship between the CBW and the fleecing driver as laid out in this series doesn’t feel quite right to me.  They feel bolted together in a way that doesn’t fit in with the general design of the block layer where every node is basically self-contained.  I understand CBW and fleecing will need some communication, but I don’t (yet) like how in the next patch, the CBW driver looks for the fleecing driver and directly communicates with it through the FleecingState instead of going through the block layer, as we’d normally do when communicating between block nodes.
> 
> That’s why I’m trying to pick apart the functionality of the fleecing block driver into self-contained “atomic” nodes that perform its different functionalities, so that perhaps I can eventually put it back together and find out whether we can do better than `is_fleecing_drv(unfiltered_target)`.)

Big part of the problem is that we want somehow bind together two filters. But we can't make both the child of each other, as it would be a loop. May be we should introduce "non-child" relationship on the graph? Which will not participate in permission update but only in aio-context management?

We may add a parameter for CBW filter, that points directly to fleecing filter instead of "is_fleecing_drv(unfiltered_target)".. But it's just and extra argument wchih we can detect automatically.

> 
>> +#
>> +# @source: node name of source node of fleecing scheme
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'struct': 'BlockdevOptionsFleecing',
>> +  'base': 'BlockdevOptionsGenericFormat',
>> +  'data': { 'source': 'str' } }
>> +
>>   ##
>>   # @BlockdevOptions:
>>   #
>> @@ -4237,6 +4271,7 @@
>>         'copy-on-read':'BlockdevOptionsCor',
>>         'dmg':        'BlockdevOptionsGenericFormat',
>>         'file':       'BlockdevOptionsFile',
>> +      'fleecing':   'BlockdevOptionsFleecing',
>>         'ftp':        'BlockdevOptionsCurlFtp',
>>         'ftps':       'BlockdevOptionsCurlFtps',
>>         'gluster':    'BlockdevOptionsGluster',
>> diff --git a/block/fleecing.h b/block/fleecing.h
>> index fb7b2f86c4..75ad2f8b19 100644
>> --- a/block/fleecing.h
>> +++ b/block/fleecing.h
>> @@ -80,6 +80,9 @@
>>   #include "block/block-copy.h"
>>   #include "block/reqlist.h"
>> +
>> +/* fleecing.c */
>> +
>>   typedef struct FleecingState FleecingState;
>>   /*
>> @@ -132,4 +135,17 @@ void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
>>   void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
>>                                            int64_t bytes);
>> +
>> +/* fleecing-drv.c */
>> +
>> +/* Returns true if @bs->drv is fleecing block driver */
>> +bool is_fleecing_drv(BlockDriverState *bs);
>> +
>> +/*
>> + * Normally FleecingState is created by copy-before-write filter. Then
>> + * copy-before-write filter calls fleecing_drv_activate() to share FleecingState
>> + * with fleecing block driver.
>> + */
>> +void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing);
>> +
>>   #endif /* FLEECING_H */
>> diff --git a/block/fleecing-drv.c b/block/fleecing-drv.c
>> new file mode 100644
>> index 0000000000..202208bb03
>> --- /dev/null
>> +++ b/block/fleecing-drv.c
>> @@ -0,0 +1,261 @@
>> +/*
>> + * fleecing block driver
>> + *
>> + * Copyright (c) 2021 Virtuozzo International GmbH.
>> + *
>> + * Author:
>> + *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +
>> +#include "sysemu/block-backend.h"
>> +#include "qemu/cutils.h"
>> +#include "qapi/error.h"
>> +#include "block/block_int.h"
>> +#include "block/coroutines.h"
>> +#include "block/qdict.h"
>> +#include "block/block-copy.h"
>> +#include "block/reqlist.h"
>> +
>> +#include "block/copy-before-write.h"
>> +#include "block/fleecing.h"
>> +
>> +typedef struct BDRVFleecingState {
>> +    FleecingState *fleecing;
>> +    BdrvChild *source;
>> +} BDRVFleecingState;
>> +
>> +static coroutine_fn int fleecing_co_preadv_part(
>> +        BlockDriverState *bs, int64_t offset, int64_t bytes,
>> +        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +    const BlockReq *req;
>> +    int ret;
>> +
>> +    if (!s->fleecing) {
>> +        /* fleecing_drv_activate() was not called */
>> +        return -EINVAL;
> 
> I'd rather treat a missing connection with a CBW driver as if we had an empty copy/access bitmap, and so return -EACCES in these places.

OK for me

> 
>> +    }
>> +
>> +    /* TODO: upgrade to async loop using AioTask */
>> +    while (bytes) {
>> +        int64_t cur_bytes;
>> +
>> +        ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +
>> +        if (req) {
>> +            ret = bdrv_co_preadv_part(s->source, offset, cur_bytes,
>> +                                      qiov, qiov_offset, flags);
>> +            fleecing_read_unlock(s->fleecing, req);
>> +        } else {
>> +            ret = bdrv_co_preadv_part(bs->file, offset, cur_bytes,
>> +                                      qiov, qiov_offset, flags);
>> +        }
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +
>> +        bytes -= cur_bytes;
>> +        offset += cur_bytes;
>> +        qiov_offset += cur_bytes;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int coroutine_fn fleecing_co_block_status(BlockDriverState *bs,
>> +                                                 bool want_zero, int64_t offset,
>> +                                                 int64_t bytes, int64_t *pnum,
>> +                                                 int64_t *map,
>> +                                                 BlockDriverState **file)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +    const BlockReq *req = NULL;
>> +    int ret;
>> +    int64_t cur_bytes;
>> +
>> +    if (!s->fleecing) {
>> +        /* fleecing_drv_activate() was not called */
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +
>> +    *pnum = cur_bytes;
>> +    *map = offset;
>> +
>> +    if (req) {
>> +        *file = s->source->bs;
>> +        fleecing_read_unlock(s->fleecing, req);
>> +    } else {
>> +        *file = bs->file->bs;
>> +    }
>> +
>> +    return ret;
> 
> Is ret == 0 the right return value here?

Hmm yes, looks strange, it should be some combination of flags.

> 
>> +}
>> +
>> +static int coroutine_fn fleecing_co_pdiscard(BlockDriverState *bs,
>> +                                             int64_t offset, int64_t bytes)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +    if (!s->fleecing) {
>> +        /* fleecing_drv_activate() was not called */
>> +        return -EINVAL;
>> +    }
>> +
>> +    fleecing_discard(s->fleecing, offset, bytes);
>> +
>> +    bdrv_co_pdiscard(bs->file, offset, bytes);
>> +
>> +    /*
>> +     * Ignore bdrv_co_pdiscard() result: fleecing_discard() succeeded, that
>> +     * means that next read from this area will fail with -EACCES. More correct
>> +     * to report success now.
>> +     */
> 
> I don’t know.  I’m asking myself why the caller in turn would care about the discard result (usually one doesn’t really care whether discarding succeeded or not), and I feel like if they care, they’d like to know that discard the data from storage did fail.

Returning error is OK too. Will change. Anyway if error is returned, caller shouldn't rely on any assumptions.

> 
>> +    return 0;
>> +}
>> +
>> +static int coroutine_fn fleecing_co_pwrite_zeroes(BlockDriverState *bs,
>> +        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +    if (!s->fleecing) {
>> +        /* fleecing_drv_activate() was not called */
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * TODO: implement cache, to have a chance to fleecing user to read and
>> +     * discard this data before actual writing to temporary image.
>> +     */
> 
> Is there a good reason why a cache shouldn’t be implemented as a separate block driver?

I don't remember. My last idea was just to implement all the features in special fleecing driver. But you are right that if we see things that could be split to separate small filter which make sense by itself, it _probably_ worth doing.. I'll think about it when prepare a new version, as it is hard to imagine the whole picture not trying to implement it.

> 
>> +    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
>> +}
>> +
>> +static coroutine_fn int fleecing_co_pwritev(BlockDriverState *bs,
>> +                                            int64_t offset,
>> +                                            int64_t bytes,
>> +                                            QEMUIOVector *qiov,
>> +                                            BdrvRequestFlags flags)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +    if (!s->fleecing) {
>> +        /* fleecing_drv_activate() was not called */
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * TODO: implement cache, to have a chance to fleecing user to read and
>> +     * discard this data before actual writing to temporary image.
>> +     */
>> +    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
>> +}
>> +
>> +
>> +static void fleecing_refresh_filename(BlockDriverState *bs)
>> +{
>> +    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
>> +            bs->file->bs->filename);
>> +}
>> +
>> +static int fleecing_open(BlockDriverState *bs, QDict *options, int flags,
>> +                         Error **errp)
>> +{
>> +    BDRVFleecingState *s = bs->opaque;
>> +
>> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
>> +                               false, errp);
>> +    if (!bs->file) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    s->source = bdrv_open_child(NULL, options, "source", bs, &child_of_bds,
>> +                               BDRV_CHILD_DATA, false, errp);
>> +    if (!s->source) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    bs->total_sectors = bs->file->bs->total_sectors;
>> +
>> +    return 0;
>> +}
>> +
>> +static void fleecing_child_perm(BlockDriverState *bs, BdrvChild *c,
>> +                                BdrvChildRole role,
>> +                                BlockReopenQueue *reopen_queue,
>> +                                uint64_t perm, uint64_t shared,
>> +                                uint64_t *nperm, uint64_t *nshared)
>> +{
>> +    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
>> +
>> +    if (role & BDRV_CHILD_PRIMARY) {
>> +        *nshared &= BLK_PERM_CONSISTENT_READ;
>> +    } else {
>> +        *nperm &= BLK_PERM_CONSISTENT_READ;
>> +
>> +        /*
>> +         * copy-before-write filter is responsible for source child and need
>> +         * write access to it.
>> +         */
>> +        *nshared |= BLK_PERM_WRITE;
>> +    }
>> +}
>> +
>> +BlockDriver bdrv_fleecing_drv = {
>> +    .format_name = "fleecing",
>> +    .instance_size = sizeof(BDRVFleecingState),
>> +
>> +    .bdrv_open                  = fleecing_open,
>> +
>> +    .bdrv_co_preadv_part        = fleecing_co_preadv_part,
>> +    .bdrv_co_pwritev            = fleecing_co_pwritev,
>> +    .bdrv_co_pwrite_zeroes      = fleecing_co_pwrite_zeroes,
>> +    .bdrv_co_pdiscard           = fleecing_co_pdiscard,
>> +    .bdrv_co_block_status       = fleecing_co_block_status,
>> +
>> +    .bdrv_refresh_filename      = fleecing_refresh_filename,
>> +
>> +    .bdrv_child_perm            = fleecing_child_perm,
>> +};
>> +
>> +bool is_fleecing_drv(BlockDriverState *bs)
>> +{
>> +    return bs && bs->drv == &bdrv_fleecing_drv;
>> +}
> 
> Besides the question whether the FleecingState should be part of CBW or the fleecing driver, I don’t like this very much.  As stated above, normally we go through the block layer to communicate between nodes, and this function for example prevents the possibility of having filters between CBW and the fleecing node.
> 
> Normally, I would expect a new BlockDriver method that the CBW driver would call to communicate with the fleecing driver.  Isn’t fleecing_mark_done_and_wait_readers() the only part where the CBW driver ever needs to tell the fleecing driver something?
> 
> Hm, actually, I wonder why we need fleecing_mark_done_and_wait_readers() to be called from CBW – can we not have the fleecing driver call this in its write implementations?  (It’s my understanding that the fleecing node is to be used read-only from the NBD export, besides discards.)

Interesting idea. That means that we establish the guarantee: successful write to fleecing node is a point after which it will not touch this region in active-disk, and all in-flight reads are awaited. Then we should propagate this guarantee to block_copy() call.. Seems it should work. I'll try.


Thanks a lot for reviewing, I now have enough material to work on v4. Will see, could this all become a bit more beautiful :)


-- 
Best regards,
Vladimir

