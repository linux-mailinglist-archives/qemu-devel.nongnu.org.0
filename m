Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34422D0DE9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:22:25 +0100 (CET)
Received: from localhost ([::1]:34278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDey-0006v0-Gb
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmDdZ-0006TY-Bg
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:20:57 -0500
Received: from mail-eopbgr30108.outbound.protection.outlook.com
 ([40.107.3.108]:40430 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmDdV-0002Af-Fd
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:20:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa0ZUBCVDUMvdzyIrOGCH1aDiX6KTZE+oahi+jkLcMSTeDN/oKudKga1kHvSW3rmJtYPsJXO3tHevfNPmnD0KIff4d6Cm42SFBGMgWu2aCqS1uEjY5VKtKdn94sLnW514rBrD7lfiFLnXxnD4c7462gScZVABqdqZ2s6Mr5uelSTMbzPOUfB4oHYbN6wwteevAaF8ls9dMsNnWjJW3CkYz2Am0wv5DEx78bAeWlgIzv0OLE5YDrg57MfxYcJ0g7WEJGDxeSTytbTP05ugcnCfn7qslH8HMqLgNUhuuYiDPZNaXWkQBwRC2N1Ovgu+dUG7++Qo9+VZ3Qjpdc6Xy0BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFuh47Lt7gBag1xci/LlUMhxBZwx/NQA2cQqhz1octc=;
 b=Ib1kKge656UsFtXey9epz7U3FDCUmT8TgWFK7pop5Jr8SbV0c4/d1aYqWvy72UcUC0/FazjtSyqSvgrRg4mBIqutnx0WoQaq9sGt85cXYaXO4HaDwI9vXOozDysTKpvcXtQW96M4CJXnqqsY7agxV/8TZ21oHiZoCJlXJglPxhzCyzM4IOo4/S96OyvZpBjYZe4Ho54ttDETD5c/F6ydRQ+IzGES5O8f4haHdl9RGtNb68w5eLwr0+ZfzaCuNdbL9Q1oaoTuPjLyJMvct4XFwfyNXwFk4gFHaE9moMQs7AgVoZGzl6YtxFnIiFclV6pBlp1e7C4X07h5D3g7z9wPJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFuh47Lt7gBag1xci/LlUMhxBZwx/NQA2cQqhz1octc=;
 b=jaOpeUyU3mJtmjwbGr7DQq1iROpysEjmQo0sSOSby3ZGVkBBCZha4J22Wg2sWMkWyZY1JFvQgmC4plPLsY5iw5cKocdwu7rTdrsFDl420wRIRT0Ut0puQZypLU9ad22pNlxg9beIKh2Xvw5nBMBWYAsa0DdBDuvaYZyE8HetoEA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 10:05:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 10:05:46 +0000
Subject: Re: [PATCH v2] migration: Don't allow migration if vm is in
 POSTMIGRATE state
To: Tuguoyi <tu.guoyi@h3c.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <d13857a6196c4bc8bbc6e3e290fc81fe@h3c.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0657571d-306d-1745-6b05-a5ddc0bc42bd@virtuozzo.com>
Date: Mon, 7 Dec 2020 13:05:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <d13857a6196c4bc8bbc6e3e290fc81fe@h3c.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:208:3e::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 10:05:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620475b2-ddee-4eee-4a0e-08d89a97aa23
X-MS-TrafficTypeDiagnostic: AM6PR08MB4342:
X-Microsoft-Antispam-PRVS: <AM6PR08MB43429687785642D9D3B89D73C1CE0@AM6PR08MB4342.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCJRycF3FU3QTVG22PdMElF28JTJt9EpeXDA2+BtszNDBR1K3Up41kHP8o4JlxRFM+kSLkzCFJfgSQXaNiUwsfFYLCPWiI9yCFQbqPyvjur2WZ3Ar25bzLeTks/6L7cvwfi5JvkGl0Gj5sFGrFQwdPQ4Qa3Y/eK6RJppYcPOC0n9XV7jI9KuBNFxUK8AXMvi2rsX2wlna4NJgMwLMktpDHd40G1T/zo4Kh3Sa2A5JjMm9ZGsGy/JrqhjGV1KSbdHAm2jLuF85b7Ez6C6gQ5xVUklJXhHW0Ufh59CToWfMnZRO/jjYTWKGNfEhVD3/+5+qyKQahh16FDPC5giUAoM94+JbKfMH+PKmVdp0uhYTvpQd+OQqhEuARgAyrTFWf/kboo8XZpvX/cw0X1KXAdKDcqXBAqWuYbKhafjoZrUCXM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(376002)(366004)(396003)(5660300002)(4326008)(83380400001)(956004)(110136005)(26005)(31686004)(86362001)(16576012)(186003)(8676002)(36756003)(66556008)(6486002)(316002)(16526019)(66476007)(2616005)(52116002)(66946007)(8936002)(478600001)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZloxTmYwamFKMFNpK0F3QlA1NU1sK0RVak5hUVQxUWtSeEt5UTh6K3dyYk5T?=
 =?utf-8?B?WlRkVFd6QXZ3SVJGT2VYMjVHQ2p4eWJYV3ZBUUpacnAzQlRMMGExZmFlc3JC?=
 =?utf-8?B?STlGd2VJcWlzRGxmZFlzUGdsSnFtU2R1ZWFVQ1drNEVjNjRVT0c4NzNuWmN0?=
 =?utf-8?B?QzhBdms3WTVwUW9EZVRNTUpUVmp3eHI4UEUwNWd2cVhWRFByTGd1N201M3VN?=
 =?utf-8?B?RC9VaFFleFZFeHFQdWY3TVl5Y2FtTHRIN3pLK2J2cmM1K3hDTUtvSy95SVJy?=
 =?utf-8?B?QVFFb0EyYTVVZk1EdzVLVEJhc1JoS0tUL2Z5Umh4TkQ1TzJGT0ZnWGpoOUIv?=
 =?utf-8?B?R0hoT3ZDZlBDcEFMYk5POURrRFAzcDFERDd1ZklnRWRLNGIzUmp0N2RoejlH?=
 =?utf-8?B?NE8xQ3dFR04vWHRwb3FCMm5Oci9wMnlGTW9rT3A1REMwd2FyUExWcWR1eUZS?=
 =?utf-8?B?VzBMS29EK1o5L092QVlUZHM4WXk3aVJ0RDF4d1luSTlIOVVWci9qbmQ3STNa?=
 =?utf-8?B?YU14T0d5dDY3Q2tvQmc4Y3lUNGxtY2ExY01JdUYyckdxQThHcU1MQk9VV0xX?=
 =?utf-8?B?VklCQ2hHbVBObFlQYWxieGdiTXNaRmNFUGt0WHB5Kzgxd1IrWUdoRzFBVGVp?=
 =?utf-8?B?aTdnTnNtWHVSSTlPdnVaRnR5dFBIRlB5S1lBMFhmbEdDa1lDZ09UYVBhZ1dD?=
 =?utf-8?B?UHZyZUN0eU1tY0lxeERRSHdPK0x6aGpkc3dLYy9FUkdSL2VSdXRLWkRHV1VD?=
 =?utf-8?B?cXdQeTAvaEV0OXd1MDNVdy9UTmtEWW5nVzhJVUVLMFRrQ3ZEcHRvbVZzb2gx?=
 =?utf-8?B?WUF6NWR5VWt5aFRBOU01QnNlNmo1TWxrQXVRaDd0Um9IYVRxWmpIMkVwOEVG?=
 =?utf-8?B?TWJLRmVBaUVLa3M4SzRsR2RqaHgyQ0llRno3VU1VUytxNVEycWNzSzBaM2Nz?=
 =?utf-8?B?QUlRWlRmQTJHVzdjY1lTMThDOUhrM3BtdTlPcW1qbk1VSG5seUhRZTQ3dVFT?=
 =?utf-8?B?blczdzI4Z1FoczROcEFzNjkrRGNPODVQT3cyM3RzSWpPck1tU3lrcVlRTkxQ?=
 =?utf-8?B?Z011V0pyVEViS2d1b0xScUZwTVRVcExMZ1M5b3RFM1ZUUFhqTHNsUFRVZDNu?=
 =?utf-8?B?TXluRVJ2cTUwRzBicUFFZjlxNHpXdmNMdEpRbzhiVmt0RE8xbWJaOGswWlZ3?=
 =?utf-8?B?WmE3K0FjUTBWNHcrWVVMMktLNjhQazN0MW9uNTA2aGVJZzJVQ0l5MldLYWZE?=
 =?utf-8?B?U3N6NCsvbnhtUVlxc000Zzc1U29Gb2hSMlFRQ2ZDVnQrVlFVeDhvaURNNlVC?=
 =?utf-8?Q?puKNvm1tGZHL4wNNLjD8bCxR3KMZdcxyYj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620475b2-ddee-4eee-4a0e-08d89a97aa23
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 10:05:46.0712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc3l6o1abBiaMM689bI+nBBLXDS4Cuek4U5yDHynQGORb05PxXmFSbFuNcITCKDOfN+Wa2G07S/lF9HfeUS1KuzyK+EymQjkBL9WHAe/YCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Received-SPF: pass client-ip=40.107.3.108;
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

07.12.2020 10:44, Tuguoyi wrote:
> The following steps will cause qemu assertion failure:
> - pause vm by executing 'virsh suspend'
> - create external snapshot of memory and disk using 'virsh snapshot-create-as'
> - doing the above operation again will cause qemu crash
> 
> The backtrace looks like:
> #0  0x00007fbf958c5c37 in raise () from /lib/x86_64-linux-gnu/libc.so.6
> #1  0x00007fbf958c9028 in abort () from /lib/x86_64-linux-gnu/libc.so.6
> #2  0x00007fbf958bebf6 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> #3  0x00007fbf958beca2 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
> #4  0x000055ca8decd39d in bdrv_inactivate_recurse (bs=0x55ca90c80400) at /build/qemu-5.0/block.c:5724
> #5  0x000055ca8dece967 in bdrv_inactivate_all () at /build//qemu-5.0/block.c:5792
> #6  0x000055ca8de5539d in qemu_savevm_state_complete_precopy_non_iterable (inactivate_disks=true, in_postcopy=false, f=0x55ca907044b0)
>      at /build/qemu-5.0/migration/savevm.c:1401
> #7  qemu_savevm_state_complete_precopy (f=0x55ca907044b0, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true)
>      at /build/qemu-5.0/migration/savevm.c:1453
> #8  0x000055ca8de4f581 in migration_completion (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:2941
> #9  migration_iteration_run (s=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3295
> #10 migration_thread (opaque=opaque@entry=0x55ca8f64d9f0) at /build/qemu-5.0/migration/migration.c:3459
> #11 0x000055ca8dfc6716 in qemu_thread_start (args=<optimized out>) at /build/qemu-5.0/util/qemu-thread-posix.c:519
> #12 0x00007fbf95c5f184 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
> #13 0x00007fbf9598cbed in clone () from /lib/x86_64-linux-gnu/libc.so.6
> 
> When the first migration completes, bs->open_flags will set BDRV_O_INACTIVE
> flag by bdrv_inactivate_all(), and during the second migration the
> bdrv_inactivate_recurse assert that the bs->open_flags is already
> BDRV_O_INACTIVE enabled which cause crash.
> 
> As Vladimir suggested, this patch just make migration job error-out with a
> message in  migrate_fd_connect() if the vm is in RUN_STATE_POSTMIGRATE state.
> 
> Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
> ---
>   migration/migration.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59..4091678 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3622,6 +3622,13 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>           return;
>       }
>   
> +    if (runstate_check(RUN_STATE_POSTMIGRATE)) {
> +        error_report("Can't migrate the vm that is in POSTMIGRATE state");
> +        migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
> +        migrate_fd_cleanup(s);
> +        return;
> +    }
> +
>       if (resume) {
>           /* This is a resumed migration */
>           rate_limit = s->parameters.max_postcopy_bandwidth /
> 


I think, correct place for the check migrate_prepare, as it is called for any kind of migration, not only fd_. And in it we have already check for wrong state:

       if (runstate_check(RUN_STATE_INMIGRATE)) {
           error_setg(errp, "Guest is waiting for an incoming migration");
           return false;
       }

and no additional state change and cleanup is needed.

-- 
Best regards,
Vladimir

