Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5D38E700
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:58:32 +0200 (CEST)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAAB-0007DF-4S
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llA8r-0005yv-EV; Mon, 24 May 2021 08:57:09 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:58158 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llA8o-0004ZL-2g; Mon, 24 May 2021 08:57:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYOvigq3YkOCSAly+UqvlRn9r3lVLfIgv7/VEopMZzIs102lWgBRCuU2rkE6pyknOf4JzE81JS+SKPxTu9P83k7Dx0fcrYkBcZSwEMadDmo+/oStpe3vo+4u8z7ZvsuTuxgdcIYcIZXx1WUt+GkDTsPq7VAPVVgwGNueaXVE23C8WgsONcmYcbJr8Ejf5w7Xg/8b7OfKgI4evo/MfzIeHHbl8WBaDqY0QMegfR3DYk9mRkxUmtqh70JwkWFV/VIrxJnCg8UVdDS8b5OvQy3ETg1kPog1Z9gG6PGZB+cYS2xxA1ioqYHI4Nps/6kQbI49yMVvcyFx7N8dxRqDX5fV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEVtC9rkHvCKCWgRBOrE5x7KFkYEg+1oWup1lYShR00=;
 b=kcTNL47TkN7DHqGvf0ZRyH4GcsC3CcWNRqdeHYmE+pxHJZ2Mrc7SMwUuFSuUKwobOZ7CKw6nXGjSxipl4YA03GbcsC2ul/NusfGEqBwHMEOlqp4nCK02rsijwE3lUlBz0taRnooQPvVOJdlVZ4YU4h+nWdBjJAjx1uEkXUkjRko4gWMnVz/s4CMIVXBHj0PUVzmhvLqDU3fpnSB4t9ZqxOu2lbe/Sz+m99JNq986IHtttjwdA8qOCloxDhRFrY6wo0+RbW2CkwnhEnS3bGZx+xn8U6ItBKKaqLlbKv5VVivL3aO6oLLZ433B3Dv1EcZ6PYD32t/uUtbwo7PtgNpIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEVtC9rkHvCKCWgRBOrE5x7KFkYEg+1oWup1lYShR00=;
 b=nbBGBRYedecB2vHf6sR6gDYFv7/9ICCZtNceFMGTuq8J81CLDaYHrjmP+u7Gt+ogl9415TKZxiIIpHZKOo85dWSBLOUSyzPrOGVHFzJ+2i4a8SrcHzkjOaa2t4LMmO/9u5M+Slm9UuFVhBchjBJykwt6OTZN66Wg8Fef50FJUV8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 12:57:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 12:57:02 +0000
Subject: Re: [PATCH v4 03/11] block: use int64_t instead of uint64_t in driver
 read handlers
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, pl@kamp.de, ronniesahlberg@gmail.com,
 fam@euphon.net, sw@weilnetz.de, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-4-vsementsov@virtuozzo.com>
 <6d6b0719-4a43-7d2a-153f-cd19dfaa00e5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6bad7a4b-5443-d7a4-4d80-9bfd413aa504@virtuozzo.com>
Date: Mon, 24 May 2021 15:57:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <6d6b0719-4a43-7d2a-153f-cd19dfaa00e5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM3PR07CA0053.eurprd07.prod.outlook.com
 (2603:10a6:207:4::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM3PR07CA0053.eurprd07.prod.outlook.com (2603:10a6:207:4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 12:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce2f7b5f-09ba-4a6d-9ae6-08d91eb36ccc
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-Microsoft-Antispam-PRVS: <AS8PR08MB694509277CCFAB23D4C5794EC1269@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vb0levFsLQnbzOfWnElq0sIv9+bc1mBPYF+l+JEwuM+v/S39GA1BL7SRqF9P3bDHk/srCg+KT3COhT4Q5OtPo9LsIAsSYwXEYBrJJL1pE9spynGzfuYtMRhXYDZwtfgEZvq5+BknI7gjrw31UThxrrzGYJk+/s2wEJkYU+ao0VmCL6mkULaPrPddkbjmKFltfVp92f30MBt4uA6ziWb+uqZt40BR4tCe2oDe1Y0anDaRN6qD9+KKXgHNbX8tkXHmn7rAcFVVZVGd41iWWtDtXRPurhyAbWyHz9L84oRMpFoVujcSl84Or1P4+n0n+ScdPa+lH4LAMni8p41g4r1a6PVlNrQiAUmnOEmEfOagP2dEee1IJi3RQNecl+xcv354ZSdhmlAsD6aP0xpMzY5t3eN8kjampcRtr5GAUuszvq0C8ZMJRY330uXJpcjOsK39NXeHdwnzvH7mPxINtz7Yyyzt5ggAwgXrKvGJ2w0nZxW6a8vcmW7YD+mkCykJwV9M53PWVfwPNh46QSTAoewZJgqfgS4bhE59Ta1X0A9IAUust21+JBedC/hurv5cLP2UbnR7gHx8PBRTK19rEyjiL4GIazwR7bLYqK70zsd93H02mHYJYtiHXO5ieklzth2zSZA8Ymejv9zCIMTibT8v3kmO9H3e0EnunmnDe8jdH3CNhtMS3edBlP+mPFiLrHGwDod5aPMs7qRpOFBZ7QyNBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39830400003)(31686004)(956004)(30864003)(6486002)(8936002)(86362001)(2906002)(4326008)(83380400001)(186003)(8676002)(16526019)(2616005)(31696002)(53546011)(66946007)(36756003)(38350700002)(38100700002)(52116002)(26005)(5660300002)(66476007)(16576012)(7416002)(316002)(478600001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Tm5PVllCcTczdGlMTFBOYjF0L0p4Y2NldHRIdmxpckt4cUJHenI3TE1Kd1Nj?=
 =?utf-8?B?TXVaMG9Jemc0c0F3aGNIWnExbVJlMVM3NEkydlZzOWtrYjNsMEFVTk5OYm9j?=
 =?utf-8?B?Si8xQ2FPY205K1BqWHorMXVYVEVNb1BwcW1UNEEyTWN5amduVlIySVYvU1gw?=
 =?utf-8?B?WTlZbmJwNHl5Umg4Unk5aHZ3RXNLREI5QTBqV1FGNlMvcjl0STlENjZiUGZC?=
 =?utf-8?B?cnVwYWN6MmpITXg3MU8vR1BpVENwZkxLbHlzandVMi9RN0RDSU1vdjYveDk4?=
 =?utf-8?B?VU42ZWRGeERBY2NtY0pobVdJZnpQZFVtOTN3dFpScDY3RnExQncrZXV4TWho?=
 =?utf-8?B?Mzc2SjduaHdGSGVTakJka0pkWUZVS1JBVWZROFZPVEY2cGZocWw0dDBSeVNp?=
 =?utf-8?B?MDRORjNXd0dhT2dvOTN0OGlldmVWbDlBcVlCOG0zblgxY09RSTRkRUtuWUla?=
 =?utf-8?B?K3N5bmxqeGtCMkkzQ1VqSjk3RnRKWGpqeTV0VkIyTVlrQURCKzd4bzR6bU4r?=
 =?utf-8?B?emRHLzY2NjF2RE1JNncvL3puNy9QTUNQZEFZQU1TNHhkS3ZuczI4NjBnQXNQ?=
 =?utf-8?B?cWd4SmFBc3ZqSjI2aHNDcTJrV1hab1hxd1RBQ2JENTZwMUZ6SWFiWVRXeHAw?=
 =?utf-8?B?TGRGQVpqMXV5UEpybS9rbTNBOVBnUTJPR3cybjMzRlVIN3ROWTVuQU5qQWRs?=
 =?utf-8?B?cmdscVcxbGo3VFBuZXlSN2Y5eExpQjhnRW4xRSt4dHF4QXdmaVczajM2cmRF?=
 =?utf-8?B?ekFPdTFMeFFDcmNzZHloTUh0RlptaE5vUnZvSTlXVVl4YkJyZkJIeWpVSDQ0?=
 =?utf-8?B?Y1JsS0M2SUd2U3RFamhqTEsxalZDVkMzT29QUzVlb2lUQnhIVi9kQ05yaHlR?=
 =?utf-8?B?ZWhYSnlMYjk3QXhlNjYwUU55RkltWDlta1JkM0RsQjd3VXg4K3RjSmdLbGpU?=
 =?utf-8?B?SjF1YUk4YzVTSU1vMENmQmxSS3ZIUGhXVVdyR2V3aDlHbCtMck5tcG5iUGZK?=
 =?utf-8?B?YWZ6eFFWUk8zNFdJVmRVbTB4ZHRwY2RHUzNWS2FRaEMyMHFRT1VCdmVrTzlt?=
 =?utf-8?B?aFNPa0JNR0tyZUlkTUlkSFp0YkhzSlEvWE1vTjBaV0NnV1NrSnJqL3dCVm8w?=
 =?utf-8?B?OFc4VTNqZEcxaFc2ejlRbjRSSGFpay9wS0dlbW82OU83ejlBYUJQcjlrby91?=
 =?utf-8?B?VVRGeHVkMVNMK1lQamVQVDA1dDVRMUdMbVM1ZUJiMUhxakxUZjVhallCeUpy?=
 =?utf-8?B?TEkxS3lwTm5yUXJHdUQ5ejQvQTl1YmptQlp0MHZvOFEyNDN6c0s2ckpLdVUz?=
 =?utf-8?B?U3V5ek41c2pHdlJaUGQwd1RIRm8zVFNJVEhrUWpXc040L1VSYWdXYldjSHUx?=
 =?utf-8?B?YlRDWm5ET0YyeG1lMWdPa1d6UHhOdzk1SFZpN043NExiRVlFU2tRZlVpTjdZ?=
 =?utf-8?B?T2FqeTRnKzFydUJpdkRQVXdnYjZWZlBWRi9VNkJ6c2VlK2duYmxFUlVaUHdy?=
 =?utf-8?B?bFVKKzVacHo2bHJEZXhpbVkvWjBzNURwbEpnWkw0azA2RHBtN0ZkWDhMQ3Jt?=
 =?utf-8?B?cVBSRVdrU3VHQnVXUjV4aEFvQVpKekxVYXhWdDRlODJSR3dZN3g3M3ZjSmI4?=
 =?utf-8?B?M0tyaHJ3cGU0Y0UzWHlKUlFteDVReThHRzBxekxWT0FsblR4NUhMSzN4eUxL?=
 =?utf-8?B?UXgzYU1XcVNzQTZYYUtHaVQvMjlYM0ZyUyszRFowVEpJSjYwRUVJZnE3UzJ2?=
 =?utf-8?Q?R6PWztayUHOotJqLgRDMHlJNui298FhopbJmlSf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2f7b5f-09ba-4a6d-9ae6-08d91eb36ccc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 12:57:02.6438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn7DLiMtp1gbhtNikjRvpvI2qEgcIDCMQ4zfLPMGR213A+fpCuAjSSzt4xJ6ZJeXNc6VHOUCpO0jqce20KIqM0iwwAqUGSHhyvakY/Ez68Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

11.05.2021 22:22, Eric Blake wrote:
> On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to convert .bdrv_co_preadv_part and .bdrv_co_pwritev_part
>> to int64_t type for offset and bytes parameters (as it's already done
>> for generic block/io.c layer).
>>
>> In qcow2 .bdrv_co_preadv_part is used in some places, so let's add
>> corresponding checks and assertions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> Unusual line, especially since...
> 
>>
>> block: use int64_t instead of uint64_t in driver read handlers
>>
>> We are generally moving to int64_t for both offset and bytes parameters
>> on all io paths.
>>
>> Main motivation is realization of 64-bit write_zeroes operation for
>> fast zeroing large disk chunks, up to the whole disk.
>>
>> We chose signed type, to be consistent with off_t (which is signed) and
>> with possibility for signed return type (where negative value means
>> error).
>>
>> So, convert driver read handlers parameters which are already 64bit to
>> signed type.
>>
>> While being here, convert also flags parameter to be BdrvRequestFlags.
>>
>> Now let's consider all callers. Simple
>>
>>    git grep '\->bdrv_\(aio\|co\)_preadv\(_part\)\?'
>>
>> shows that's there three callers of driver function:
>>
>>   bdrv_driver_preadv() in block/io.c, passes int64_t, checked by
>>     bdrv_check_qiov_request() to be non-negative.
>>
>>   qcow2_load_vmstate() does bdrv_check_qiov_request().
>>
>>   do_perform_cow_read() has uint64_t argument. And a lot of things in
>>   qcow2 driver are uint64_t, so converting it is big job. But we must
>>   not work with requests that doesn't satisfy bdrv_check_qiov_request(),
> 
> s/doesn't/don't/
> 
>>   so let's just assert it here.
>>
>> Still, the functions may be called directly, not only by drv->...
>> Let's check:
>>
>> git grep '\.bdrv_\(aio\|co\)_preadv\(_part\)\?\s*=' | \
>> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
>> while read func; do git grep "$func(" | \
>> grep -v "$func(BlockDriverState"; done
>>
>> The only one such caller:
>>
>>      QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, &data, 1);
>>      ...
>>      ret = bdrv_replace_test_co_preadv(bs, 0, 1, &qiov, 0);
>>
>> in tesTS/unit/test-bdrv-drain.c, and it's OK obviously.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> ...it is repeated here. I'm fine dropping the first.
> 
>> ---
>>   include/block/block_int.h        | 11 ++++++-----
>>   block/backup-top.c               |  4 ++--
> 
>>   35 files changed, 120 insertions(+), 89 deletions(-)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index db7a909ea9..e6bcf74e46 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -234,8 +234,8 @@ struct BlockDriver {
>>   
>>       /* aio */
>>       BlockAIOCB *(*bdrv_aio_preadv)(BlockDriverState *bs,
>> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
>> -        BlockCompletionFunc *cb, void *opaque);
>> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
>> +        BdrvRequestFlags flags, BlockCompletionFunc *cb, void *opaque);
>>       BlockAIOCB *(*bdrv_aio_pwritev)(BlockDriverState *bs,
>>           uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags,
>>           BlockCompletionFunc *cb, void *opaque);
>> @@ -264,10 +264,11 @@ struct BlockDriver {
>>        * The buffer in @qiov may point directly to guest memory.
>>        */
>>       int coroutine_fn (*bdrv_co_preadv)(BlockDriverState *bs,
>> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags);
>> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
>> +        BdrvRequestFlags flags);
>>       int coroutine_fn (*bdrv_co_preadv_part)(BlockDriverState *bs,
>> -        uint64_t offset, uint64_t bytes,
>> -        QEMUIOVector *qiov, size_t qiov_offset, int flags);
>> +        int64_t offset, int64_t bytes,
>> +        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags);
> 
> Lots of fallout, but I'm in favor of this signature change.
> 
> 
>> +++ b/block/blkdebug.c
>> @@ -614,8 +614,8 @@ static int rule_check(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>>   }
>>   
>>   static int coroutine_fn
>> -blkdebug_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>> -                   QEMUIOVector *qiov, int flags)
>> +blkdebug_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>> +                   QEMUIOVector *qiov, BdrvRequestFlags flags)
>>   {
>>       int err;
> 
> Still calls rule_check() with uint64_t parameters, but since we've
> asserted the caller was within range, no behavior change.
> 
>> +++ b/block/blkverify.c
>> @@ -221,8 +221,8 @@ blkverify_co_prwv(BlockDriverState *bs, BlkverifyRequest *r, uint64_t offset,
>>   }
>>   
>>   static int coroutine_fn
>> -blkverify_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>> -                    QEMUIOVector *qiov, int flags)
>> +blkverify_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>> +                    QEMUIOVector *qiov, BdrvRequestFlags flags)
>>   {
> 
> Similarly for the call to blkverify_co_prwv(), and probably elsewhere in
> the patch.
> 
>> +++ b/block/crypto.c
>> @@ -397,8 +397,8 @@ static int block_crypto_reopen_prepare(BDRVReopenState *state,
>>   #define BLOCK_CRYPTO_MAX_IO_SIZE (1024 * 1024)
>>   
>>   static coroutine_fn int
>> -block_crypto_co_preadv(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>> -                       QEMUIOVector *qiov, int flags)
>> +block_crypto_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>> +                       QEMUIOVector *qiov, BdrvRequestFlags flags)
>>   {
>>       BlockCrypto *crypto = bs->opaque;
>>       uint64_t cur_bytes; /* number of bytes in current iteration */
> 
> We could perhaps change the type of local variables like cur_bytes and
> bytes_done; but it doesn't affect semantics.
> 
>> +++ b/block/curl.c
>> @@ -896,7 +896,8 @@ out:
>>   }
>>   
>>   static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
>> -        uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
>> +        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
>> +        BdrvRequestFlags flags)
>>   {
>>       CURLAIOCB acb = {
>>           .co = qemu_coroutine_self(),
> 
> Likewise changing the type of CURLAIOCB.offset and .bytes.  Cleanups
> like that can be followups.
> 
>> +++ b/block/file-posix.c
>> @@ -2033,9 +2033,9 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>>       return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>>   }
>>   
>> -static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
>> -                                      uint64_t bytes, QEMUIOVector *qiov,
>> -                                      int flags)
>> +static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
>> +                                      int64_t bytes, QEMUIOVector *qiov,
>> +                                      BdrvRequestFlags flags)
>>   {
>>       return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_READ);
> 
> Similarly for fixing the signature of raw_co_prw() (after the
> counterpart change to raw_co_pwritev)
> 
>> +++ b/block/nvme.c
>> @@ -1221,8 +1221,9 @@ static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
>>   }
>>   
>>   static coroutine_fn int nvme_co_preadv(BlockDriverState *bs,
>> -                                       uint64_t offset, uint64_t bytes,
>> -                                       QEMUIOVector *qiov, int flags)
>> +                                       int64_t offset, int64_t bytes,
>> +                                       QEMUIOVector *qiov,
>> +                                       BdrvRequestFlags flags)
>>   {
>>       return nvme_co_prw(bs, offset, bytes, qiov, false, flags);
>>   }
> 
> And for nvme_co_prw().
> 
>> +++ b/block/qcow2.c
>> @@ -2281,9 +2281,10 @@ static coroutine_fn int qcow2_co_preadv_task_entry(AioTask *task)
>>   }
>>   
>>   static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
>> -                                             uint64_t offset, uint64_t bytes,
>> +                                             int64_t offset, int64_t bytes,
>>                                                QEMUIOVector *qiov,
>> -                                             size_t qiov_offset, int flags)
>> +                                             size_t qiov_offset,
>> +                                             BdrvRequestFlags flags)
>>   {
>>       BDRVQcow2State *s = bs->opaque;
>>       int ret = 0;
> 
> Unrelated to this patch; the loop sets cur_bytes = MIN(bytes, INT_MAX);
> but it would be smarter to choose a cluster-aligned max instead of
> INT_MAX.  It doesn't matter as long as the block layer has pre-clamped
> requests to be < 32 bit to begin with, and then our later call to
> qcow2_get_host_offset() further clamps it down to actual cluster
> boundaries.  But it does look odd, compared to computing the original
> MIN() to an aligned boundary in the first place, whether or not we ever
> change the block layer to allow individual drivers to opt in to reading
> more than 2G in one transaction.
> 
> qcow2_add_task() is another internal function worth improving in a followup.
> 
>> +++ b/block/quorum.c
>> @@ -663,8 +663,8 @@ static int read_fifo_child(QuorumAIOCB *acb)
>>       return ret;
>>   }
>>   
>> -static int quorum_co_preadv(BlockDriverState *bs, uint64_t offset,
>> -                            uint64_t bytes, QEMUIOVector *qiov, int flags)
>> +static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>> +                            QEMUIOVector *qiov, BdrvRequestFlags flags)
>>   {
>>       BDRVQuorumState *s = bs->opaque;
>>       QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
> 
> and quorum_aio_get().
> 
>> diff --git a/block/raw-format.c b/block/raw-format.c
>> index 7717578ed6..e3f459b2cb 100644
>> --- a/block/raw-format.c
>> +++ b/block/raw-format.c
>> @@ -181,8 +181,8 @@ static void raw_reopen_abort(BDRVReopenState *state)
>>   }
>>   
>>   /* Check and adjust the offset, against 'offset' and 'size' options. */
>> -static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
>> -                                    uint64_t bytes, bool is_write)
>> +static inline int raw_adjust_offset(BlockDriverState *bs, int64_t *offset,
>> +                                    int64_t bytes, bool is_write)
>>   {
>>       BDRVRawState *s = bs->opaque;
>>   
>> @@ -201,9 +201,9 @@ static inline int raw_adjust_offset(BlockDriverState *bs, uint64_t *offset,
>>       return 0;
>>   }
>>   
>> -static int coroutine_fn raw_co_preadv(BlockDriverState *bs, uint64_t offset,
>> -                                      uint64_t bytes, QEMUIOVector *qiov,
>> -                                      int flags)
>> +static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
>> +                                      int64_t bytes, QEMUIOVector *qiov,
>> +                                      BdrvRequestFlags flags)
>>   {
>>       int ret;
>>   
>> @@ -259,7 +259,7 @@ static int coroutine_fn raw_co_pwritev(BlockDriverState *bs, uint64_t offset,
>>           qiov = &local_qiov;
>>       }
>>   
>> -    ret = raw_adjust_offset(bs, &offset, bytes, true);
>> +    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
> 
> Ugly type-punning; thankfully it's transient until the counterpart patch
> to driver write handlers.
> 
>>       if (ret) {
>>           goto fail;
>>       }
>> @@ -294,7 +294,7 @@ static int coroutine_fn raw_co_pwrite_zeroes(BlockDriverState *bs,
>>   {
>>       int ret;
>>   
>> -    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
>> +    ret = raw_adjust_offset(bs, (int64_t *)&offset, bytes, true);
> 
> And now you should lose this cast...
> 
>>       if (ret) {
>>           return ret;
>>       }
>> @@ -306,7 +306,7 @@ static int coroutine_fn raw_co_pdiscard(BlockDriverState *bs,
>>   {
>>       int ret;
>>   
>> -    ret = raw_adjust_offset(bs, (uint64_t *)&offset, bytes, true);
>> +    ret = raw_adjust_offset(bs, &offset, bytes, true);
> 
> ...like you did here.
> 
>>       if (ret) {
>>           return ret;
>>       }
>> @@ -541,7 +541,7 @@ static int coroutine_fn raw_co_copy_range_from(BlockDriverState *bs,
>>   {
>>       int ret;
>>   
>> -    ret = raw_adjust_offset(bs, &src_offset, bytes, false);
>> +    ret = raw_adjust_offset(bs, (int64_t *)&src_offset, bytes, false);
>>       if (ret) {
>>           return ret;
>>       }
>> @@ -560,7 +560,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
>>   {
>>       int ret;
>>   
>> -    ret = raw_adjust_offset(bs, &dst_offset, bytes, true);
>> +    ret = raw_adjust_offset(bs, (int64_t *)&dst_offset, bytes, true);
> 
> Also transient casts.
> 
> Easy enough to fix my nits for qcow2 and the commit message.
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

But you said that qcow2 note is unrelated to that patch. So, as I understand, only commit message
and raw_co_pwrite_zeroes (drop extra case) should be fixed here, yes?


-- 
Best regards,
Vladimir

