Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE0584634
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 21:30:59 +0200 (CEST)
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH9Dl-00037J-SV
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oH9Ab-00080q-V6; Thu, 28 Jul 2022 15:27:41 -0400
Received: from mail-eopbgr150130.outbound.protection.outlook.com
 ([40.107.15.130]:33504 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oH9AY-0002Fi-3C; Thu, 28 Jul 2022 15:27:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj5c0xfYJppDyFGKSFfE3W6oMHyhmvZGZOij7dDqGaBJFvNcKiePWCCDbNQJqLn/Owjkee+t5iT88hyYvjir6EM+J2XlJEUtLvUduhUrM0B8OBvRaOV0d+KnNb9iPc11Qn6UyyqEpPqwtDZwW3xtdYKRms04EkJyBxpAzmNoFpudwr4DwnhZqTdNYGKXhW30yjKjVNLCayr4iBl+ZJIHe95vOOaU1dCOIWiSA7r5KeGwygQb4jjMhsmmo1WVFmaJ/WujHQfz4WeL54aKVn/B74ATMAvkDLsjc5Jq8kPQku1yuEbFzhvUJz0ji4IPo31q5oXTLMOajlIm1v2fCvvRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc1ZC+X7wK38y227kwPDhUDLut48bEmu0795QQ2TAPo=;
 b=ednu5+zZbYp9N0cyT9J7+WNsONVFNNvhyeMcAkWcoCaIkIhAlvDf2mJcVcy0ganUPSNUhjfqfwfjHjp0MqbdUTgMzQ+rW/BYMU+EocIBU0zlbWbsNvKwFA8wLI6EgjGIAJER/AQlBhFaISKLvyoHmz1/sFPbnl2SdfVP3RxywW8Dy5t0P4BbTL/ay+Ybp2CIVFE8kiOketjWWEsyUgJtjFIa0NfXWLKRnAqUuc8EVGwvfVf9lXB+iZZ7Ht4J39sIf2qX3oI5FGxVmUa/lTtxDSmVx+7RengRmU9IEqKvzjCDLV83UMs7SPdfukH23Bdr+4AtpczS1dInKEwODqXsug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc1ZC+X7wK38y227kwPDhUDLut48bEmu0795QQ2TAPo=;
 b=KXDv8mN8Ecxr2u/3OVspC0A+Blx82OEK5RN9kW8NHrFi3eaoJHwVNiUBWqciHg/k4+aFl/YhswSh+eWGdxre5+l2Fj3mtzjHdUr4ZzP1xyhKLphZUA6W4LxLNUPM1p3/53JI8V4S/6H+WAAzeUZ2VlIX1kz1IOOdakfegGHxl6QFfey3niBveLDClKos5Dy6T1Qenj1yRwS8IPvfGyvbF38BRhzkGBM35Ci+0lkEFmVlBLqUgwjrW7YZb7R7DuvpYutz5hn4/m24QPlE0YtXgLI1xv/ajVEb1dRtgOvSKUeSzRj0tP3SHybHZGWy33zcBVHE29onmRIHuai7LOAH6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DB9PR08MB6427.eurprd08.prod.outlook.com (2603:10a6:10:25a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 19:27:29 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 19:27:29 +0000
Message-ID: <66373021-7dad-953b-b244-75a4756a0b33@virtuozzo.com>
Date: Thu, 28 Jul 2022 21:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] block: add missed block_acct_setup with new block
 device init procedure
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220711110725.425261-1-den@openvz.org>
 <1aa3921a-0e67-d580-9bf2-c098d242e380@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <1aa3921a-0e67-d580-9bf2-c098d242e380@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::32) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb84c245-60b4-49d6-31d3-08da70cf361b
X-MS-TrafficTypeDiagnostic: DB9PR08MB6427:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pm2uW62mKHjssbz9PEdDeME30gAtIVvIn3sRZmA/k/XHYiOHJ/IrukWFArx24IJYZG1YOGsF/e/H9eZFhgrWtSfiU5a8Qdl/Rgg1sfv/rc02+6t/9Xbb/p4zLUJTE5IgFqDqGbptdoce89/8jRNMTVZkhxzCUJC2FdLXGyARzF0cIhUQeXx8+J31+HN97bfl7k9u852ywr6E1G0goWeFKa+cZjX3x5UYYKjaCskQYIcSBM8duQ69vNrnUJ3FimH0XjKB613lQIJvrIXrkTwSK7TxdBY3sUYhooxvec6Fk8OZE7CRi+DbC6x7Du760g8h3Iqwm0l6UyUyhgy6wIxmGlfPjQaLubzxFWlM072fJ/oc+hfhdlfsRnuETrNOGQr/sxluTxbNI+3B/sBh3UBEK+R9XX2aWEsvY8S0SU+dghJqUXnKqoxLwJYIdszZIOEerqUMz/3p7twDp/nzQdnXh3yQHe4by+H+0xwAX+Nli/+txi4MpGp75gxh0KnWTU4kchEgspsIBR2TMqhKV+rGfhZB+D5VKPKcqN49POKC7Yauzrkuq2AtrEwO/wIxRSJSFo3b1Ve+/gY7YITjhNNYqe5C3Hjpu6QrMQugVNz7nZcwzvHGrJ884dLYmJp7M59dxY1UYdIrdsQyGAlMFGAZpV+aGr5j/Rg8jevN+frXRkrUf5wyYBO0H9V68mX4KQU5m+5AeZ3532z9crKXGabinhhgykoFI0Qxtbd2NQ4/pxYcd/uLxi4Lz3V3QMk5ZDlg2zo1E6ElTabMvLgN0eFQ8Fxea7kVbM3wAC9BQmDZofPpkU7i8lcxMOvl3fl15vM6EX5whnfYowQEK88YYKJCbsHBwsPp60lnGWsUZJRL7So=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(39850400004)(376002)(346002)(8676002)(53546011)(4326008)(66556008)(66946007)(66476007)(5660300002)(2616005)(38350700002)(6486002)(2906002)(38100700002)(8936002)(186003)(316002)(31696002)(41300700001)(52116002)(86362001)(6506007)(6512007)(26005)(36756003)(478600001)(54906003)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDN2ZFlMT0NKc3g3VEo5TXFjblNuSVYvWkFJMUkyd2pURXV4OG92Vk9IV3F5?=
 =?utf-8?B?Z04rYlJDUW11d0lYM1VPQVJIWUZDcElWdjh6Tld5Sy9Zc1VYWGhwYmg3ZFli?=
 =?utf-8?B?b2JSWWZ5UEg5S29ieXpDRWZwNGhlM015MVBJZnFjbkNVM3QrS2d1T3QzRzZR?=
 =?utf-8?B?dEF2d1lJVFNuMUNYTllvN2t3eHJ1RXhsTW9LWDNvLy9tY2l3WmJIZHBwaURn?=
 =?utf-8?B?VDc4UXloR21xbE9vNUVHWVBBUWtrY3RPbHh0VGtGVERkTTBQVFEwZ1Vxc0Jy?=
 =?utf-8?B?emE5all5b3l3aUt2UlNac0NuekNRekRMcHlmdXBmbFozcC9uUkRlV0c4S0Nk?=
 =?utf-8?B?WHNLck1sUVY2Y25MU0VVdnJ0V0lLODNkM3VYeDNERWNMU2d0TkVqRWdHZHZZ?=
 =?utf-8?B?M0EvWnp5aldobndueE9KQTR1bnpGcWhLeW1MbTR4WEZjUGNtUmViNGZITmtv?=
 =?utf-8?B?WmVybFNRZGxUSUh1eklDaUtBLzQ5eG1SelBicW5XYWxHb2xTRFJrU1pGb2JL?=
 =?utf-8?B?dzlaaXF0VDdrdVJ4RmRiaWs1bEJWTzZkYXEzZmV1V2RoSDRTdHk3M0hSVlhr?=
 =?utf-8?B?dDNPSVRmMTZFTWhRQnMvYmxLU1Babm5SSkdsN09PZWhGNXFKNkFoaXF2UjVT?=
 =?utf-8?B?Wk4xU05jbnk4Kzk4TkYrVFB0T3JIbCtQT01rZFo0T05IRWQ3d0U2aWxCbzNR?=
 =?utf-8?B?L3I2NHhJTWpEUmhpbEFIMWhuYlhCRTgzdE9BUzNUNXdIMG8vVmxzUmF2RGhK?=
 =?utf-8?B?c0xLUyt2YjhwZlJNcHB2cnpSMXhUSit0ZVFlQ044clcxeC9ncW96SGE0ZXNL?=
 =?utf-8?B?STBSdy9ydk1xeGZXeFRaMmZHN2E1NlJjTm0ybWorSVdEWEJZSER1YUFzTjRQ?=
 =?utf-8?B?MnB3ZkFGTmFQY0tzNTlhNFpqSi9GZmptbU40S0RyTG5vTU1zcklLcWl4ZzNq?=
 =?utf-8?B?a3BmcWUrNEw1T3d3RGpsQ1hrcGNDaTEreU9tZ0tPSjZyTHhHbFRqWUcyVUMv?=
 =?utf-8?B?K2ZqZXFzaGRrdnFMb0M0NFNPcCtxM1JVUFBmdTFNRWxFZ2szT0xJUUpTTlFa?=
 =?utf-8?B?UEJ5QnlKeUJrT3BnblMrNDNvbWtLMURjR28wZ0hXWEUrSWhrcUVUN2dWL1BH?=
 =?utf-8?B?bjhLRlRQV3g2RG5XTU1wd3BNbWVPbFJXQ1NvRlZXNHhZa1VOOVhCc2hPS1hj?=
 =?utf-8?B?b3d5amZCSG1zRzFidVF3aHNJQTI0YWI3djVJT2k0RFd2cVhZSi8zQ1llVmE3?=
 =?utf-8?B?Mk8xclFJNEw4YmQ1c2gzbVRodXgwcFhmSVVVZUo4VmhSTElGMDlITk1kWmJ1?=
 =?utf-8?B?YzJPZ3F3dE9XRkJEbzR5RWt6SVY0M1VaUElpbHNpRE9XdGd5N0ZzSEJPUnRn?=
 =?utf-8?B?MUt2UjhnU2VsSmlUZmVFRUNHbldXV25OcUhxQWVZRkp0SkxtR09MOVFpZXFp?=
 =?utf-8?B?bEdMcXg5MlRlRkxObGtQNlRXZnRmb3YrSVNuTXNBMytMVVFZSE5neGhmbHQ0?=
 =?utf-8?B?VkloblN5SDhQanRxOCtZVWZjUVRwbm9ZN05ud04xRk0rbU53UnIyelhiL2V3?=
 =?utf-8?B?aCtnb1FtT1hySWliNnlNcU1FcDF3RmFwTUNXdlBSbnB3RnpwOEtPUVBzRmo3?=
 =?utf-8?B?NllrdFhPVnQrMjVoRjBvbm5ORjExblhNbWM5WnN1NG92OTN4cm5VRWtOSzhh?=
 =?utf-8?B?cG1Gbm9uM0NSQjJTaVYyc20xOGRxamhxQVRFVU5xZjF5L3hERWVYdEVoTDNU?=
 =?utf-8?B?eFVxSU9KemJubmZ6Rk9YbEZHaTFscEtjSHE1MzFvYzl3RUdzTUxveTFFSVZI?=
 =?utf-8?B?Ty92UVRleW5HakdNUHNUTVpHR2RsS3ZnUzZmckNCNElMNHJnR0xleXFpTVVC?=
 =?utf-8?B?YzZlRXJUaGZHdit1UUdiaWpOSFFhNEx1SmcwK0NicUREL1FJcDFQWXc5ckg3?=
 =?utf-8?B?UjJGZmhranhESkI5NVArV3NqeHlDQytuVUw3YTVaa2ZrMUlNc2x3eUMyUWV2?=
 =?utf-8?B?NDlGVS9mSGROa0pEaytaTmtKZGZPT1B5dFVYdStPcHZtUW1LOXFXSXhUUmlE?=
 =?utf-8?B?b1B0THlBSDJoTnRmbmZFV0hqTWFLOS80OUdKQ1hZNFhEZVNqaE1KeUVKaFpZ?=
 =?utf-8?Q?ryPHhQpYljP/hHa9BlRxVGHnI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb84c245-60b4-49d6-31d3-08da70cf361b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 19:27:29.5733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hf56Ahw43E/aYPyImY3V/k4B9d+j6RlCt7zMrqu1l434IpHb797kG2NvFyIqKH0btgikJfL2wMaEmq0/e6ijTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6427
Received-SPF: pass client-ip=40.107.15.130; envelope-from=den@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28.07.2022 16:42, Vladimir Sementsov-Ogievskiy wrote:
> On 7/11/22 14:07, Denis V. Lunev wrote:
>> Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
>> the first glance, but it has changed things a lot. 'libvirt' uses it to
>> detect that it should follow new initialization way and this changes
>> things considerably. With this procedure followed, blockdev_init() is
>> not called anymore and thus block_acct_setup() helper is not called.
>
> I'm not sure that 5f76a7aac156ca is really the corner stone.. But yes,
> libvirt moved to "blockdev era", which means that we don't use old 
> -drive,
> instead block nodes are created by -blockdev / qmp: blockdev-add, and 
> attached
> to block devices by node-name.
>
git bisected, thus I am sure here


> And if I understand correctly blockdev_init() is called only on -drive 
> path.
>
> I have some questions:
>
> 1. After this patch, don't we call block_acct_setup() twice on old 
> path with -drive? That seems safe as block_acct_setup just assign 
> fields of BlockAcctStats.. But that's doesn't look good.
>
hmmm

> 2. Do we really need these options? Could we instead just enable 
> accounting invalid and failed ops unconditionally? I doubt that 
> someone will learn that these new options appeared and will use them 
> to disable the failed/invalid accounting again.
>
I can move assignment of these fields to true int
block_acct_init() and forget about "configurable"
items in new path. I do not think that somebody
ever has these options set.

The real question in this patch is that this initialization
was a precondition for old good "long IO" report
configuration, which should be "enableable".

But  we could move this option to "tracked request"
layer only and this will solve my puzzle. So, I'll move
"long IO report" to tracked request level only and will
create an option for it on bdrv_ level and will avoid
it on blk_ accounting.

What do you think?

Den



>
>>
>> This means in particular that defaults for block accounting statistics
>> are changed and account_invalid/account_failed are actually initialized
>> as false instead of true originally.
>>
>> This commit changes things to match original world. It adds
>> account_invalid/account_failed properties to BlockConf and setups them
>> accordingly.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Peter Krempa <pkrempa@redhat.com>
>> CC: Markus Armbruster <armbru@redhat.com>
>> CC: John Snow <jsnow@redhat.com>
>> CC: Kevin Wolf <kwolf@redhat.com>
>> CC: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   hw/block/block.c           |  2 +
>>   include/hw/block/block.h   |  7 +++-
>>   tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 84 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/block.c b/hw/block/block.c
>> index 25f45df723..53b100cdc3 100644
>> --- a/hw/block/block.c
>> +++ b/hw/block/block.c
>> @@ -205,6 +205,8 @@ bool blkconf_apply_backend_options(BlockConf 
>> *conf, bool readonly,
>      BlockdevOnError rerror;
>>       blk_set_enable_write_cache(blk, wce);
>>       blk_set_on_error(blk, rerror, werror);
>>   +    block_acct_setup(blk_get_stats(blk), conf->account_invalid,
>> +                     conf->account_failed);
>>       return true;
>>   }
>>   diff --git a/include/hw/block/block.h b/include/hw/block/block.h
>> index 5902c0440a..ffd439fc83 100644
>> --- a/include/hw/block/block.h
>> +++ b/include/hw/block/block.h
>> @@ -31,6 +31,7 @@ typedef struct BlockConf {
>>       uint32_t lcyls, lheads, lsecs;
>>       OnOffAuto wce;
>>       bool share_rw;
>> +    bool account_invalid, account_failed;
>>       BlockdevOnError rerror;
>>       BlockdevOnError werror;
>>   } BlockConf;
>> @@ -61,7 +62,11 @@ static inline unsigned int 
>> get_physical_block_exp(BlockConf *conf)
>>                          _conf.discard_granularity, 
>> -1),                  \
>>       DEFINE_PROP_ON_OFF_AUTO("write-cache", _state, 
>> _conf.wce,           \
>> ON_OFF_AUTO_AUTO),                          \
>> -    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false)
>> +    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, 
>> false),        \
>> +    DEFINE_PROP_BOOL("account-invalid", 
>> _state,                         \
>> +                     _conf.account_invalid, 
>> true),                      \
>> +    DEFINE_PROP_BOOL("account-failed", 
>> _state,                          \
>> +                     _conf.account_failed, true)
>>     #define DEFINE_BLOCK_PROPERTIES(_state, 
>> _conf)                          \
>>       DEFINE_PROP_DRIVE("drive", _state, 
>> _conf.blk),                      \
>> diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
>> index 9479b92185..a6c451e098 100644
>> --- a/tests/qemu-iotests/172.out
>> +++ b/tests/qemu-iotests/172.out
>> @@ -28,6 +28,8 @@ Formatting 'TEST_DIR/t.IMGFMT.3', fmt=IMGFMT 
>> size=737280
>>                   discard_granularity = 4294967295 (4 GiB)
>>                   write-cache = "auto"
>>                   share-rw = false
>> +                account-invalid = true
>> +                account-failed = true
>>                   drive-type = "288"
>>     @@ -55,6 +57,8 @@ Testing: -fda TEST_DIR/t.qcow2
>>                   discard_granularity = 4294967295 (4 GiB)
>>                   write-cache = "auto"
>>                   share-rw = false
>> +                account-invalid = true
>> +                account-failed = true
>>                   drive-type = "144"
>>   floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
>>       Attached to:      /machine/unattached/device[N]
>> @@ -92,6 +96,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>>                   discard_granularity = 4294967295 (4 GiB)
>>                   write-cache = "auto"
>>                   share-rw = false
>> +                account-invalid = true
>> +                account-failed = true
>>                   drive-type = "144"
>>                 dev: floppy, id ""
>>                   unit = 0 (0x0)
>> @@ -104,6 +110,8 @@ Testing: -fdb TEST_DIR/t.qcow2
>>                   discard_granularity = 4294967295 (4 GiB)
>
> [..]
>
>


