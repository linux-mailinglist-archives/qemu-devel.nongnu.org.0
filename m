Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64E36821E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:07:43 +0200 (CEST)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZZza-0000bX-4R
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZZrU-0005Jv-Uw; Thu, 22 Apr 2021 09:59:20 -0400
Received: from mail-eopbgr60118.outbound.protection.outlook.com
 ([40.107.6.118]:32078 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZZrQ-0007qg-Jf; Thu, 22 Apr 2021 09:59:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHidEpp3xsxsFxRHG4Oat29M2nSqiOkftlRMVgr09PHIE3jk2VVG5gwtJViGW/cQNV8ju6CwBZDzeTX0gAci8ONJB4Q0EXcXCYaTqMq7rzwKSyptB0uyrpZukh/dhG/Cnyc44atdemMCgDSbE0BkFgGUOT1vmLx314scl47BC7+Mw7pcB7rDUEQMUfvUUvhP7MyxvUIE33e82txDBiuNI6xdeOQeX961afcTtjepqVXajv29fXRt+RoahjGs8WxqcyMIGLajzw8McnYNkh7/3BtMVaA2WSja1XFu7M6aW3en3DekfdUEDDvgFRANuF82GqMKeJcs7Gb/YMKieOWUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/09A7rJSfIfPMkYMlMEJDYTI1eGn+dMmcam6Ith6xbQ=;
 b=CMrVuSL2Exvll3cVgdzYv8IeCmvdvd6w+x4nimWUGYzGFt5Gm03XPu5DfBp/MFIxomcj40VSZaT7yg+BG4TieDr+8s+eCDTbv/ZGZfdyxp8jsfdu8ordYCmaag7eYRDjrY/hliVJNHwI6k5WGSM0M1qrmM5D7zsTGiWYPpMqdH/qzmzpN15jjTrEouCEDsmBsdGl5WuZuhUm+MujG3JemFBjdg5jLKYhujgsm/1iS4m6/jYLjdwoVgt9XgMmo1czIzJmPpd8Ljth89JGAfNyhdXnsKU2YlHxCwUu3PYVR3H2875c++2TvxgoaGG2//DeavQHRmvk2tjuj7cn1jkL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/09A7rJSfIfPMkYMlMEJDYTI1eGn+dMmcam6Ith6xbQ=;
 b=dn8lFOijSlpC8W6Mh1hRaImz9b/zClZO4ipUFC8ytO/x/K1k8P5OGxCwzbXcuDZaGLOc6vL6jgbzaFreR2vpOG0BdaV27FD9zg6CdtG2nBwqOmI3uzElZvXJu3jIaQus9FqhztMk9U7Pn/dWruxewVGZCvtZIJevC6zhLbtOmGg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 13:59:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 13:59:12 +0000
Subject: Re: [PATCH] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com
References: <20210421083222.72600-1-vsementsov@virtuozzo.com>
 <adae2572-a168-886b-d139-6ee8bd11ecd5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <312139f8-c315-8099-a1c0-1e0bee3ca9ca@virtuozzo.com>
Date: Thu, 22 Apr 2021 16:59:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <adae2572-a168-886b-d139-6ee8bd11ecd5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0083.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 13:59:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c4b25d6-c3dc-4e6a-6369-08d90596ce84
X-MS-TrafficTypeDiagnostic: AS8PR08MB6534:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6534D32C8C49CC17C32B441EC1469@AS8PR08MB6534.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jK4q2W4iHbPi1kokExigajUDmf5R0u6bbscveXGLIeCYbKDbcPy+gFyIH9ETh1WDk8gRcTZ5gJaNEbKzK+JbJTlYV0igFq+xJoymzjYAPUvGHLiO485kjiHkBbBOEhtM+PyMJLBqkVVYMN53UEjVZ+T9YmholISGAKhAkAfIZ3uo/8kMGOugWiOjPSj5KmxD/CIQuM1XagtPZKKDY78j4UbppjU1R+1JXQobHILqhiNeCMl2ftGMvdKdEavQLUMzrj7rFVUYB72uZ3lWQ4nFdyGmbX1bRUtMO1HosdKf57HNpBnokRIszffL7HWmibcMv+cfEfg9DP70B+SGMX5ey0v/MrJW0PAHxGrIlNpVFEQmWjdbzjwlo950/Pc9cxpp1IzxNuca/Tvjs4/fh5KiSrDKCNYRDfM3h+nXxnt1aGSXC89YKwFApjBc5VwtVB5GaYC+VQx4QsINSTvNGjn8bCQ/3XLOFUlOk225U2+WqBLy7RUWDwAeFv1FmkHBAUc7EHdWsodL9W/SLENRYNk7XHOaaMWBLlbP0f54i6+AWFikDxCs+DoqbRcedGOGAendNuRO+olQERPkLoQZTCVsRbmTb2cZlfT+4DzhAXFzIeHGnT8k0xXFBQisTHUjUTL8KSNLyVXaBQrcXcge0W9xjLDwVlWXGCoygzEeVE7PHche73YFP+c5g7y/tP9A73aj2D5fxJdvuCMVQAzpptG+hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39830400003)(366004)(86362001)(2906002)(53546011)(316002)(38100700002)(31686004)(8676002)(2616005)(36756003)(31696002)(186003)(38350700002)(83380400001)(16526019)(8936002)(478600001)(26005)(16576012)(6486002)(5660300002)(66556008)(956004)(66946007)(66476007)(4326008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0ZIVnFxRFpNeTV2ODd0WUdLVjVQTUx1dnlPakFGSHNjTGRyOWFOeW5obEVB?=
 =?utf-8?B?djZIMUZmajlHWURGRFBaWDdoSDVDdEtBQUhsME9zNVVOWnMzQ2thN3h2RHRL?=
 =?utf-8?B?cE8vZmtobUxDbURQa3kzbytra0dRaFpEdW9iQXFZRUNyUUM5cVF4eE95MXhx?=
 =?utf-8?B?KytnN3BuVzg1SEE5dXdSczhKbTNSaUY5aEE5eTc4WDlFQnp4UXNVTG9OVFBM?=
 =?utf-8?B?cktIOUE5MFFuZEl0MEpZWU5VU3hWMHBoWnFlYXRnR0l6bWQxZmZzS0trZWU1?=
 =?utf-8?B?ZWVvU0J6V3R2ZW00eVY3aThnN1pNSENmRHMyZFozMHRZbXQ3WlFHbTMrVDkz?=
 =?utf-8?B?aTlwQnhZNjAwUEpNdVNaVkdpNUF6VWF5U1FGSGIxVHR5Z0pRYjk0UHBKNllR?=
 =?utf-8?B?WVJSUFBBa1V1VHFnOXBGMEFDbWdUNXpqWGpoWkVJTDcwQlo3OGlKL2NjNmlj?=
 =?utf-8?B?S00rZVRIZFhvUEtydFc5UVA1VDgxUEJqekVYT1h6QUVhUkkzQzNwTHlzc2tD?=
 =?utf-8?B?U3ZxUlUxK0FRd3p2bXd0Y2o4ZmRiaVVCbko4UHJhVFFyOXZQcUhldUlTczRl?=
 =?utf-8?B?eUhCSE9vWnV0cUJLSzYrRk03NVVYUTdBUjdpSVpXNlNkK2NYbjZWVjRHUmVp?=
 =?utf-8?B?MVNNTHFjZmliN2JPUWtYSFJSbEJ4Y3VrVE13eUFhVlZFZVFFbW10Ykp2VGUr?=
 =?utf-8?B?UFpZNzM2SWJnM1dnL1lOalJRYm5XRmRESGlkQVpMdzFIRmlJYm83QUpNR1hq?=
 =?utf-8?B?ZHF2c0U5YjFaOUZEZGNVc24yV2FNSHNFa1Nsem12Q1oyazE3akFPUjJ1bytV?=
 =?utf-8?B?U3FDR2MxdmF3SkRud2d2b3Z4M1JqUWZiM3VwVlFaWEthQ2Y2SkxlMzl3eGlB?=
 =?utf-8?B?YWNpMG15L2VURnNWYnYxOXhSN3d1bW5XR1ZaaGw1ditvMEw4ZjZNeW84d0Nw?=
 =?utf-8?B?eFhFbjRBSUNRTzhUcXlQMUpRaEt0eTNnUTBRbnNmd1YyRHJ6a2VZMFpZUDdC?=
 =?utf-8?B?ZW5CZmk4U0VCbHVXY3N6dU9xam1YQjM5NG00QVZQc09paWVOZy80Qk9UY3hW?=
 =?utf-8?B?RjVaU2hhclV5KzEwcFpBRDMwZlJtNkVldmRseHpzSzRGT3ZtUC9Wc2pQenJr?=
 =?utf-8?B?RTI3cDRoZU9TQkR6RFRYYVJ3c0ZKNTZFS1JvNVNTYWE0UDh2VkNnL3IxNWxm?=
 =?utf-8?B?YjhhamRDWmwraHYxSFAvMjRNUXc3ME1RUkhDTGVFY3pqTmhYYVlFK00xM2NV?=
 =?utf-8?B?aEcwQkM0am9GYWFXSDRjSEZQeElLQy9mbXpETkZvZGdjcTJ1Qk0rZ0pzL25V?=
 =?utf-8?B?OU9zaFRUL205Uzd2OWNUK2RuaWxRaHMzVVVadDlaVnEyUGFQdE5LaVg5Q0Iz?=
 =?utf-8?B?UFhuWjBPQUVsZ3JIMVRvdlVuOU9QNWUraTBMRk96bldBRkZ1TCt5aFlmNjFu?=
 =?utf-8?B?OVllWkJ6ZTNsOGcyRldYTnpEemp5R0tORHVpbWRzNGhEdFg2STV2ejRLVW8r?=
 =?utf-8?B?V3RqYlZ1YTdJYVhSM2ZZTktvdkJBNHA5SG81NEJQOHRWZnNOVkJRTzh3eXBu?=
 =?utf-8?B?dE44U1ZFb0I3bzhxZ3NBaXVrQzVGaTNTWTZhcXhTOE9Xc2ZTVlVZS3o4S0Ru?=
 =?utf-8?B?Nk9OajJsaG1lODFqd21DdHRIOXBQSGpBelhqQndKcmhqaml4K3h0dWlSdk9O?=
 =?utf-8?B?THhYNVpUMkZ4YUJQR1VSdmxnWndCZ3V6cjBZNjVVZ2Y4d0I2TkZJd3lBV1A2?=
 =?utf-8?Q?jvzmpQ4MhDiT1ef7TZWnQhoSgCnrEdx0bA8Q+v9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4b25d6-c3dc-4e6a-6369-08d90596ce84
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 13:59:11.9364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaEd33nUtoOFzNFeEVyu1VmglkTRagw+GXmVn0USsO4+kesGkr1avTjWJPDfz88f1ewqVBnNbpk1GXoKv4cnVMlYCSXtAnK7DcdDMRq66MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=40.107.6.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

22.04.2021 16:01, Max Reitz wrote:
> On 21.04.21 10:32, Vladimir Sementsov-Ogievskiy wrote:
>> Max reported the following bug:
>>
>> $ ./qemu-img create -f raw src.img 1G
>> $ ./qemu-img create -f raw dst.img 1G
>>
>> $ (echo '
>>     {"execute":"qmp_capabilities"}
>>     {"execute":"blockdev-mirror",
>>      "arguments":{"job-id":"mirror",
>>                   "device":"source",
>>                   "target":"target",
>>                   "sync":"full",
>>                   "filter-node-name":"mirror-top"}}
>> '; sleep 3; echo'
>>     {"execute":"human-monitor-command",
>>      "arguments":{"command-line":
>>                   "qemu-io mirror-top \"write 0 1G\""}}') \
>> | x86_64-softmmu/qemu-system-x86_64 \
>>     -qmp stdio \
>>     -blockdev file,node-name=source,filename=src.img \
>>     -blockdev file,node-name=target,filename=dst.img \
>>     -object iothread,id=iothr0 \
>>     -device virtio-blk,drive=source,iothread=iothr0
>>
>> crashes:
>>
>> 0  raise () at /usr/lib/libc.so.6
>> 1  abort () at /usr/lib/libc.so.6
>> 2  error_exit
>>     (err=<optimized out>,
>>     msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>>     at ../util/qemu-thread-posix.c:37
>> 3  qemu_mutex_unlock_impl
>>     (mutex=mutex@entry=0x55fbb25ab6e0,
>>     file=file@entry=0x55fbb1636957 "../util/async.c",
>>     line=line@entry=650)
>>     at ../util/qemu-thread-posix.c:109
>> 4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
>> 5  bdrv_do_drained_begin
>>     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
>>     parent=parent@entry=0x0,
>>     ignore_bds_parents=ignore_bds_parents@entry=false,
>>     poll=poll@entry=true) at ../block/io.c:441
>> 6  bdrv_do_drained_begin
>>     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
>>     bs=0x55fbb3a87000) at ../block/io.c:448
>> 7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
>> 8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
>> 9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
>> 10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>>     at ../block/monitor/block-hmp-cmds.c:628
>>
>> man pthread_mutex_unlock
>> ...
>>      EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
>>      PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
>>      current thread does not own the mutex.
>>
>> So, thread doesn't own the mutex. And we have iothread here.
>>
>> Next, note that AIO_WAIT_WHILE() documents that ctx must be acquired
>> exactly once by caller. But where is it acquired in the call stack?
>> Seems nowhere.
>>
>> qemuio_command do acquire aio context.. But we need context acquired
>> around blk_unref as well. Let's do it.
>>
>> Reported-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/monitor/block-hmp-cmds.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
>> index ebf1033f31..934100d0eb 100644
>> --- a/block/monitor/block-hmp-cmds.c
>> +++ b/block/monitor/block-hmp-cmds.c
>> @@ -559,6 +559,7 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>>   {
>>       BlockBackend *blk;
>>       BlockBackend *local_blk = NULL;
>> +    AioContext *ctx;
>>       bool qdev = qdict_get_try_bool(qdict, "qdev", false);
>>       const char *device = qdict_get_str(qdict, "device");
>>       const char *command = qdict_get_str(qdict, "command");
>> @@ -615,7 +616,13 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>>       qemuio_command(blk, command);
>>   fail:
>> +    ctx = blk_get_aio_context(blk);
>> +    aio_context_acquire(ctx);
>> +
>>       blk_unref(local_blk);
>> +
>> +    aio_context_release(ctx);
>> +
>>       hmp_handle_error(mon, err);
>>   }
> 
> Looks good.  Now I wonder about the rest of this function, though. qemuio_command() acquires the context on its own.  So the only thing left that looks a bit like it may want to have the context locked is blk_insert_bs().  Most of its callers seem to run in the BB’s native context, so they don’t have to acquire it; but blk_exp_add() has the context held around it, so... should this place, too?

Seems you are right. blk_insert_bs() calls bdrv_root_attach_child(), and bdrv_root_attach_child() is documented so "The caller must hold the AioContext lock @child_bs".

I'll see, what could be done here. adding one more section looks bad. Creating nested aio-context acquire when Paolo is working on removing aio context lock doesn't seem good too..

-- 
Best regards,
Vladimir

