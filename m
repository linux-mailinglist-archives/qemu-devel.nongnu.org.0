Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEF36751B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 00:22:35 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZLEw-0006zP-Es
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 18:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZLDS-00066p-2K; Wed, 21 Apr 2021 18:21:02 -0400
Received: from mail-eopbgr60135.outbound.protection.outlook.com
 ([40.107.6.135]:34278 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZLDQ-00087e-6S; Wed, 21 Apr 2021 18:21:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/MYv4zIrffphSLN0WaqNvpyW0IrNsGqKpI+25iTEx1T6lyGI0riGMDi8vJlsE+rUotI44oF2Ytupfqo66GTtqyYqL40giTVKWUUq5L+95TH+5oQsCI/hkZe0y5xMwVJ3GC3kj841VU5YNwxLHvoPtpoMH6X9xP+tF4xDmPdyC8cYO25JrrmKhH5wKc9Bd/j33ggC8aJmIOrD1CV0oINFZ6A31/TWOR7KH/XwhR32p+1dy2F/0ImPlK9GJ2CsXUWvYrfVMLQlrAdXO18yVjR5xS/LRcfcggqQDeXVMpNfbrzmiSgIVk1dwc+bdLJ5cCq3NqB4jOpr9DlhmiyRZy9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDyluemJsrSOUv45Ug92MhmU5oAgq274/sN8eTTZgFo=;
 b=a7PjWBHp6qNufZolH8lc8Y5UstbBsiCo9RFH8DetJCS7OqiQ72RWaB5TX0hMFM10WnwMVHHuCFfomyD9qStDcpq9nmgUVoJYnIbdzypD1gGqleSJtlqE4H/FZ4mnWMkt3BmXr+lDgZ1dErNmTfjcYSPgs9kQcs9LBgldJAudQ72Ashb6pfgicx0HNyZNbSHtjPZ0zZK/J5bazf2cuUeAuJkWB4naLWhotAA+d+sbo1OPtQicmfFfSBNzdB4AMS3YzcLIXduW+dz+Draq4rH3pQilE5QyTg71Z287JA20hlA3ziO87nQ3ja5UMk1KLnhPufYm8XiWyUBRLJ2v70v/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDyluemJsrSOUv45Ug92MhmU5oAgq274/sN8eTTZgFo=;
 b=nA0gaaIX0ZN1/oDaPIJR0nRh9cKehY17XPyt25HS6qch4rlz0q5KneFZLdN/xSbCjToCphF8AfPnSH2WMQ9aLK/oJ8DeRaxmsdex705oFbj5vLhREdWmSTugDSGQN3f0ie9uQE8PKfdwM68U4NKgUPz4JR8PFK4FB52gO2y1pt4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3160.eurprd08.prod.outlook.com (2603:10a6:209:45::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 22:20:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 22:20:56 +0000
Subject: Re: [PATCH] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com
References: <20210421083222.72600-1-vsementsov@virtuozzo.com>
 <ede4a3b9-95f2-f8ae-6587-87542325efe5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <98a0188b-2147-b53e-38de-a88df8113c48@virtuozzo.com>
Date: Thu, 22 Apr 2021 01:20:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <ede4a3b9-95f2-f8ae-6587-87542325efe5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0073.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0073.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 22:20:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 279a5c10-8577-426e-8dab-08d90513bbee
X-MS-TrafficTypeDiagnostic: AM6PR08MB3160:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3160DF16B1B4EA33BB9C73F0C1479@AM6PR08MB3160.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7uj3vt5x0pbkdsXadd5e9OhIswNCTAbZilka6Y8S4OBGzjqZe6+6fDHlWAP2KyNtqlblwxYeHc4obRxbnarNdnjisAY95MobEc7metINyP7I35acq7Z2AC+B8kO+KKmOEYyITYORBp8IsHGK7jnWv1Ams2RhsKGtMpBISsB9P7LYDkPlphw2uSaXkry286Qm2h3KLfLPgM8jTvElLVyVEjeS/i7cie8OJBvVPHRb3Boo5XDEXLEiMZdnpwIcHmfdS1wCGdm2rg3n2zIIwrsWHuh3wc6AMap5FiZccOZjolneNy5vSJwpkyjlPx6/n226UPKLyP0ewQxT76sLhZ2grJNdYle4SlTWBuXJb7w6RxJDiSF1x9eky0twviHxJ2XKI2N8TymMo0SxB+w7ZTr7kwYPT0SEUMSVPdIZkLDR8gO5UIRYxsIRiqtUKlKuMBE/ftdNmbY/5pgoBSOLXkWJ+A2qSramDs5siKtIDV7qgTIT99DMoU4L/IPdhx93CM9yZ7BiD0WrdHBP1sxyyOI8/tFN5rdC7Pzmog53d7vtM+ORuu0u8urfFMOYGdwsrewoaggL3BrWe5987yZKfOL1JNi/P5IbSrd+CikcTgD5D9sPZSuXQEj1BsnUb5wcyaP2V1wKpdyAOPQbYEXvK5v8pUqjeYo/AwT6Df+mCgWzFD6sIauJHnzp4FZBL5hOk6cYMA+ZgTdtN3DjWN0w3ClThx0NmuFtZbH5JgE8GrMlN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(2906002)(8936002)(31686004)(38100700002)(36756003)(66556008)(66476007)(66946007)(5660300002)(31696002)(86362001)(956004)(53546011)(52116002)(16526019)(26005)(186003)(38350700002)(83380400001)(478600001)(6486002)(8676002)(2616005)(16576012)(316002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qi9nTStMeWZLUTN3YTVBdW9kQ0JXc052QUo1MmtTdzNJTjNCTnBZemRVQVUr?=
 =?utf-8?B?ZU83bk9kdDZzS2xGTVVZSlBQVTZyUUlnUHdKV3o4ZW9uRllJc09RSW1QNkhO?=
 =?utf-8?B?ZkV1ODZFbVc4ZUZ4Q2NkZWx5SllTdiswVDF3TmtDdXhuUWQ0aWVwN0xtcTNm?=
 =?utf-8?B?eDljZ3dVUFhCNDdyaGZJd2U2d0lmZ3paRENHaGRSV3F2TkxnNnNWS1VXU0Fi?=
 =?utf-8?B?N2IrMVgrRWZpUnVuN05JeVdhSGZGZ2VrVm9rVi9hUTBxYkovRVdQRXkxTTNl?=
 =?utf-8?B?ZEp3U0lrdU5nSHduNlN6cGx5c3F5K2hxSFo1TTRHR2ZBeHNmNFI1MGQrREI5?=
 =?utf-8?B?NFk2WVMvZnErVGpqQ2NiZFpZSzZEV3JLQkNwakxIeHpmUEJBaVZqdXI5SVVV?=
 =?utf-8?B?L25sdlpUVG9mM3F4ajhtTDZZWHZzemtjOGw5N1REMzhPV0NaODZhODZsTTNh?=
 =?utf-8?B?MW9VUkFESWtaako0Z2ZNVHFQVjVoNHNaTVRnemRCUEhGUkNTRHRwdXA2Z2Iy?=
 =?utf-8?B?dTJVSGF4WmpGQmJxdU5rb3UyaGdsbFl6aExiL1loMTFZQUdYS29iY2hpdGZ1?=
 =?utf-8?B?QnBDcDNoeG9WakVGd09qMmhWN2NpdUFqSWJhOVhONEk1eHJiNGZVMGs1Y1NW?=
 =?utf-8?B?Znp0bTBoaHhPbXRxOC84bWtqbENnWDRCaGxEbmdicmlOSlRtSkgrQi9jbkZH?=
 =?utf-8?B?TGhRUkVEWExxdnJ0VHZkbzdNeW02VDM2R1ZsazM0Wnl5MGNHMnprY2k4SzN5?=
 =?utf-8?B?dmR2cHlQZTI0Y0x6RTJmbWU4NERkY1h4L2p4OUc3cVBQU0pobldVTldlYVFQ?=
 =?utf-8?B?NWlicU0vajFkWUoyWmRtblY2bVdGeHRJRi9pdFFOeXJjdGREa2pnOWtqa2hI?=
 =?utf-8?B?aXNPaitCejFkVWhqTnVOQko0ZlNaaS9ialdOUFhIU3FkS2NiSm5tamJ4c1Uy?=
 =?utf-8?B?Z3dYQ2M5QXRwUis0ZFBrcHkzczFLYTU2U01NY3VKYS82dWpXeXpFZ05KYjBK?=
 =?utf-8?B?SnlLUXZzckNOTThGNVYraERSRTZvQVRPNXJhWmVyMUI4SjE0VGFjSENvUUc2?=
 =?utf-8?B?TFhRM2tvalJWOFBLYmRWTnZ5citveVVldWNKTGZ6Zm9XU3dmYjRWcHlOSTN6?=
 =?utf-8?B?R3Vmdnp6d2RrQlJuWXgyWjJ5M2dqSFRPYmUwWHdOZXFCZ01Zd2JCZ2VoOTNB?=
 =?utf-8?B?ZXJQUWwzaGZKamhOS09CdDd0Q1MxZHBSNVRXQlNVSU1sUm9YVmVua0Z0aGJV?=
 =?utf-8?B?U3BEeVlPeFU2ZzMzTFJPNzdiRWtsVzBKTjZ0bUZ0UkVwTHAvc2RuTmhVQnpn?=
 =?utf-8?B?bnNlWklQdy9EQy9sclUrQm51UzFEMDM2K1VpcDVScms0MlpTaDBEa01BUFV6?=
 =?utf-8?B?cVZIOXdBQlk1SkpaRml0c3E5K3J4TFByM1NoWGNZZzNVVzM4Q1RudVhISWJm?=
 =?utf-8?B?R0dvU1dhaXVBNTBic1lvUDBqSnZnY0xXbTdDLzlvam14TTRNVllSc3ZZcDR1?=
 =?utf-8?B?WmJqNDE5eVZrQUtxM3VjUUxiQjNmWDZHSVFtRnViTkZrVW95YUYyL3BPaXZ4?=
 =?utf-8?B?ajdIVXFQRXZpM1k4aUVXMDVZZS9hSG5ac2RJTVNrZU1FSjdxRlRPWGF0bTQ5?=
 =?utf-8?B?cXk2RGRjcWppV2plemVDN2Z1aFVJS1pZUEliOTB1VmhQTHppWm0rMFN0NCto?=
 =?utf-8?B?V3g1TTN0ei93Z0lkVWlTSGE3eHdiUVpodVl0SW5DVEg1b3M2TEtnSUYyVzRs?=
 =?utf-8?Q?NdeE+v9cdfF7MoTQaZXyuLP7ae1JnGgegJ+Dt55?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a5c10-8577-426e-8dab-08d90513bbee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 22:20:56.6171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MabnkkrHrrZVBY4kl5PUQ3kS0gCoRxBMLst++latgl7FSKHGtnqRZvx0Qj3/zwZs9yEXJn1s6CJB6AQijB9a4Sby4xVhix9kEq5sEy51GaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3160
Received-SPF: pass client-ip=40.107.6.135;
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

21.04.2021 22:47, Philippe Mathieu-Daudé wrote:
> On 4/21/21 10:32 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Max reported the following bug:
>>
>> $ ./qemu-img create -f raw src.img 1G
>> $ ./qemu-img create -f raw dst.img 1G
>>
>> $ (echo '
>>     {"execute":"qmp_capabilities"}
>>     {"execute":"blockdev-mirror",
>>      "arguments":{"job-id":"mirror",
>>                   "device":"source",
>>                   "target":"target",
>>                   "sync":"full",
>>                   "filter-node-name":"mirror-top"}}
>> '; sleep 3; echo'
>>     {"execute":"human-monitor-command",
>>      "arguments":{"command-line":
>>                   "qemu-io mirror-top \"write 0 1G\""}}') \
>> | x86_64-softmmu/qemu-system-x86_64 \
>>     -qmp stdio \
>>     -blockdev file,node-name=source,filename=src.img \
>>     -blockdev file,node-name=target,filename=dst.img \
>>     -object iothread,id=iothr0 \
>>     -device virtio-blk,drive=source,iothread=iothr0
>>
>> crashes:
>>
>> 0  raise () at /usr/lib/libc.so.6
>> 1  abort () at /usr/lib/libc.so.6
>> 2  error_exit
>>     (err=<optimized out>,
>>     msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>>     at ../util/qemu-thread-posix.c:37
>> 3  qemu_mutex_unlock_impl
>>     (mutex=mutex@entry=0x55fbb25ab6e0,
>>     file=file@entry=0x55fbb1636957 "../util/async.c",
>>     line=line@entry=650)
>>     at ../util/qemu-thread-posix.c:109
>> 4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
>> 5  bdrv_do_drained_begin
>>     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
>>     parent=parent@entry=0x0,
>>     ignore_bds_parents=ignore_bds_parents@entry=false,
>>     poll=poll@entry=true) at ../block/io.c:441
>> 6  bdrv_do_drained_begin
>>     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
>>     bs=0x55fbb3a87000) at ../block/io.c:448
>> 7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
>> 8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
>> 9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
>> 10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>>     at ../block/monitor/block-hmp-cmds.c:628
>>
>> man pthread_mutex_unlock
>> ...
>>      EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
>>      PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
>>      current thread does not own the mutex.
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
>>   block/monitor/block-hmp-cmds.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
>> index ebf1033f31..934100d0eb 100644
>> --- a/block/monitor/block-hmp-cmds.c
>> +++ b/block/monitor/block-hmp-cmds.c
>> @@ -559,6 +559,7 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>>   {
>>       BlockBackend *blk;
>>       BlockBackend *local_blk = NULL;
>> +    AioContext *ctx;
>>       bool qdev = qdict_get_try_bool(qdict, "qdev", false);
>>       const char *device = qdict_get_str(qdict, "device");
>>       const char *command = qdict_get_str(qdict, "command");
>> @@ -615,7 +616,13 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
>>       qemuio_command(blk, command);
>>   
>>   fail:
>> +    ctx = blk_get_aio_context(blk);
>> +    aio_context_acquire(ctx);
>> +
>>       blk_unref(local_blk);
>> +
>> +    aio_context_release(ctx);
> 
> I dare to mention "code smell" here... Not to your fix, but to
> the API. Can't we simplify it somehow? Maybe we can't, I don't
> understand it well. But it seems bug prone, and expensive in
> human brain resources (either develop, debug or review).

Better is move hmp_qemu_io to coroutine together with all called functions and qemu-io commands.. But it's a lot more work.


-- 
Best regards,
Vladimir

