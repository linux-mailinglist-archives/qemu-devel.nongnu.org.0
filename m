Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84F39F12C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:43:07 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXKE-0001HW-Dq
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqXFy-0001oH-2o; Tue, 08 Jun 2021 04:38:42 -0400
Received: from mail-db8eur05on2114.outbound.protection.outlook.com
 ([40.107.20.114]:48096 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqXFp-0004Ym-B9; Tue, 08 Jun 2021 04:38:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH5BtaygLQO2uXWf7C2TBL1iVvv0acYYdiDqLRs8/Z+VpYBG/VatcylBH4tcLmWDxg2FSGXQHpD1zuxGw9NPpOzCxHNfigT3RmC+s2BtqFZiskAvnaVOo4qwmlYKHEyoiHIE6x5BfqV6pML5i3gYi397+Dq7LFHKeHK2wn2oQfBIk2edIy2UZ1Q9A3eLWXY6JqiJTvXc15ida3JIBlbuO5Q/9ZZYmOrBIXoqYfCKWCN5DUAVjbq7SgMGXlKLgccJndu5QO9xf6bK7P+Io6zEsAtzRLXb8amt1aRTh1QU9es7yd5jzrNq3Jo9WXUyI8SXbyah1QOO3DG6IauHiqx7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii6HlkYDcoTYakIZIr6INAfih+BnYf2Ap8S1Rawqb2w=;
 b=QI8KZ7gAJss6gmTJJJ0DL2HrNsBdsg33F89kOXtwjLgbyqb5cgtMfwgEm+ofUyHKTNkryLzRE7bdtSQGGBsLF80rioTfkVDBkFqzuMI0fZM8h2MB3TCmj5d96PjX0WFDEvP4WSX4ezyLmx8QOSFqevsHJxFld6S43aYKmUtD5rbELRdiAV38cV19BYRrkQOv4tSxf1dFPAuY9pAQtz+gLErF9pwL4nZZNimnB6ai+RS4EAST272cWFgYtQ+mF6a1R5liYLwb/yuqETGwEhWMgVSYTEyNkqMoygAY4gpbHlreQj3DrQpiL94gW3Vbf2/7w1wxN+vFiNZJvXSWA6JvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii6HlkYDcoTYakIZIr6INAfih+BnYf2Ap8S1Rawqb2w=;
 b=AvHOUaWjXgHRKDH9JlH5t6UYdmPmF/8zjSC405tZdf89v37qtdWVRx9ihEXIu0h0+A1oYafzl/AmjgNdpt5/faxSnmaZEuPUlVnXPbkxBZR8m0brtpubHxrn/5s3yRoPHmHZei5hFjhSN7X9yw0Kf5lBgzRepJQ5damy0Q/Bgs4=
Authentication-Results: gluster.org; dkim=none (message not signed)
 header.d=none;gluster.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 08:38:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 08:38:28 +0000
Subject: Re: [PATCH v5 10/11] block: use int64_t instead of int in driver
 discard handlers
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, John Snow <jsnow@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Fam Zheng <fam@euphon.net>, Liu Yuan <namei.unix@gmail.com>,
 "open list:GLUSTER" <integration@gluster.org>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
 <20210505075001.45041-11-vsementsov@virtuozzo.com>
 <20210607181350.2mviefspqqdsm6af@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5b2c399a-284d-053e-f23a-b20cdfbccde6@virtuozzo.com>
Date: Tue, 8 Jun 2021 11:38:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607181350.2mviefspqqdsm6af@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR08CA0023.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:208:d2::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24 via Frontend Transport; Tue, 8 Jun 2021 08:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2840b0b-3ebb-4163-1987-08d92a58c9d5
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3894D7B21D5DDB2785E0FBBFC1379@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Kvi1lRhG4TF0k8yN2VhMQA+XOnB9FDSfMTJEHiqwrVdSNTSQ0HtZBNHDnxOK7MWnqkvSguW83HFVf/0yaGHfts7vZ5ZgAWZQ7jeBgHimhcl4rQKMi5rojVjs8jv9r+0GhDGVSk+wbpu7n6HpRSNLAm/FS+eKU3MrLYSjOLbq7TDWpIPXxlZX7/k/+tUEnLugiXtmH+SuRcJYAinAWGKqGQ0y7i84UkOlZMGbEBvwv+oGK/2jX0OAKeZUII7dGWnDn5Ih+tAa9vg3bSSv+xuoz6u/K3y5xC8ajBnUrPJqTxypjq5DW6INMmtc5G2IqZLRkykhL09VLczmGau8X623F+ATldpUUotHAaChyFAPewvsN7vcskpf4vDZeKelpDQj3C4wnSm8A90i+u+YCHk80y4HlG3+gJUr8iHgWEJuM534qgqY08GSiVLgolS5Ktom+JnSWd9QVvdMQFV5JYm9ZHZpOt5FMSeuXnRJq5bOO51ILkKHDjgIo/ccWTYUAmeZjCfr8kSVRES5d1fjyXu7TDnA/yfq8q2jyT/AxaDHvccHoSyPs8MEFeob6htuYrcqF7QcO+iOt2dO7KbP3T5AjdTqNqPDxgz+Gp//jfnoV1bKL7Y8ChDiWnu1I+XpIHGQyksvH199A/P+ej6PAz+0i7kTxm0T97xHNTjmzZD9FeoMkawsB3fCcUMoJ/vzKOWPxD3Y7agkMahlr6GbBoJbiDEqwzsVRt6E8xH+1Ihhuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(346002)(136003)(396003)(31696002)(186003)(26005)(86362001)(36756003)(83380400001)(52116002)(16526019)(16576012)(54906003)(7416002)(6916009)(956004)(316002)(31686004)(2906002)(5660300002)(38350700002)(38100700002)(478600001)(8936002)(2616005)(4326008)(8676002)(66476007)(66556008)(66946007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K25KN1FSSG5qaU1mNm45K3JIZ01DdlRoaWJxa0d5dnkrenNYV0MydFRnanQ0?=
 =?utf-8?B?WEloSW80UFVNOFBGeVFGaU1hcVlvMThuZHpyQ2JHcW8yUzN1UUF5YzBsV3Vo?=
 =?utf-8?B?WVlTUmdkSzBMcU5mNk5tTGpBSTNjeEV0VUZVdEJoVDhJRDh3MlNTZyt1MnR1?=
 =?utf-8?B?dmo2L2VFVnBPNGczZnlkTWpOS2dNRmZ4bFBnZmcxOWpMdW1wdXNpTkdwckNK?=
 =?utf-8?B?SzFaeWFpSW4weXozWURET0Y0bGkwYytzM3dLQWlKZGlHeENNME13c0NOVTE4?=
 =?utf-8?B?ZGFsTEZhYzhLWHBTMGcvYVVDQ1RRUUZoSWNxcnAwK3VtMllkVnQxVkpBZzdj?=
 =?utf-8?B?ZmNsRVlmMzBjTFNPSzlJSkxyNUJoWjZNUHZGa1dESDIxSEJ6b1ZWc1Z3RVd4?=
 =?utf-8?B?V0QvMlphK1ovb09MWG9jMkdIZXJ5VElHR2IrajFwMXBwNWNKcGU2Yy9lNmYw?=
 =?utf-8?B?M2lWWkpta3NOalNXWTZockVyR2ZFYUJZTHhyV2htcFEzb1lGN0gxemF5ZnpZ?=
 =?utf-8?B?Yzd5Ni9kQ3pTSDcwcnRkcm1lK2VLWTZPd3ZmK21zVU9GcXJpUmIwTHptWG1Z?=
 =?utf-8?B?a3ZISHRtbzhIYWRFNlFFaDVNdjNycS9rWVRmMmFnblNLd3hvWUdyV1JWNElv?=
 =?utf-8?B?UkYxaDJpNUJMVkxyTklYaVVWUjhBbmV4eDd1YTdkWWhvaHQ3QkhaQVo1R1lS?=
 =?utf-8?B?a2VvV29zRnVuNWNIa0lGYmhXcnR2T1loWTRJQVNLdFZteUd5VE5tcUFBQm1T?=
 =?utf-8?B?NlAybldBYVllY0NKZ0p6OE53ODdPMjB5ODQxOFpnckpldUFaczRsT3JpazZB?=
 =?utf-8?B?RVozQThKdHVGTTN6bjRudlY1YjFZNm54SlA4QlUydHFOYU1DazVxRDRNbkJ1?=
 =?utf-8?B?OUhEODJvZi8wOFhCUXVmUXc2djRMb1A4MFhscENyYW1Tb3VhbkR0T2Z0eUhB?=
 =?utf-8?B?OHJyR1hNT1daU0lycGYveVRwRG16aVVUV2tqYk51dnFSWVBkSU1UNjc1THJx?=
 =?utf-8?B?cndsRGc0MTJQL1lqSTVhQlBCYmF4bGNSUVE5Z25zV2dTZ2tscEM4MlVKQWxL?=
 =?utf-8?B?RWlkWExxV1N5TURaYU1JOHFQSWUxbGZFcUh4SGVxMzgvTGV2bkNiVzVId2pk?=
 =?utf-8?B?MjhiT25KVFpzVHlPcmxEUDFHWmhveXNseFg1WnlyNXM4OWtUNHF3MzZPdlF5?=
 =?utf-8?B?ZkpwWExHQUJrR2lSMHVLYlg3bTdSb1ZrREdjaWF3WWM0R1hrck0xdUJhMC8y?=
 =?utf-8?B?MHpZRHBydlFwUWJWaHYzQ0JnSDJoeWh1Z2l5dk1zOGROZm9WdkQxbkNjMVdN?=
 =?utf-8?B?UW5WeU5WT2dIbFNPQUpHbVY2YXpYY1BqNDFpUmdLNTU5UXhRYmEySFh2Ui9n?=
 =?utf-8?B?SEY2ZXFLdy9ZenZDRG5jYUh5Q3o3U0xIalFzbTVncHUrMmdYdE5BakMzM0ha?=
 =?utf-8?B?WkdFN0RwK3RSTkJkNG0xZVVvRFBoTEt4TENOSlg0cG5GQzdtNVZEOFpYNHM5?=
 =?utf-8?B?ajZWKzhYdG42QTlnNTZmeXV6cEdMTGx3UGhlaE1tbGMrOEZwVXlMd3JZczhx?=
 =?utf-8?B?dTlLOFBDTlNiTTZkK2NNbko3cmd6dUFwWDBJTjV0UHpjVFFmZ2ZTN0NPeFE2?=
 =?utf-8?B?OXB3Wkx2dkQrMXVyR09mYnhuYnFndTNwWUFoSVlYSnkvczNlNWNYWlVTNmN0?=
 =?utf-8?B?dStEaURTVjJueXRSTkhIOHN1S1RodHluSWIvcSt0c3BxNTFqUUZJWU9IOGlw?=
 =?utf-8?Q?+1jT8x7YFn0mZt1Wt+kTQCQYh3UiBU6wpBdQvQw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2840b0b-3ebb-4163-1987-08d92a58c9d5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 08:38:28.3630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghXMUcHPodHRZGsqbPACY5j5jWPutg2Nz/IyHBOB/Bc2ZWjL9s389LjXxyY1OVmRJKbP1wv4U9v9JW8yOoPoM8Od82n0TIvMs+W2Y1S/l9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.20.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

07.06.2021 21:13, Eric Blake wrote:
> On Wed, May 05, 2021 at 10:50:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
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
>> So, convert driver discard handlers bytes parameter to int64_t.
>>
>> The only caller of all updated function is bdrv_co_pdiscard in
>> block/io.c. It is already prepared to work with 64bit requests, but
>> pass at most max(bs->bl.max_pdiscard, INT_MAX) to the driver.
>>
>> Let's look at all updated functions:
>>
>> backup-top: pass to bdrv_co_pdiscard which is 64bit
> 
> and to backup_top_cbw, but that is also 64-bit
> 
>>
>> blkdebug: all calculations are still OK, thanks to
>>    bdrv_check_qiov_request().
>>    both rule_check and bdrv_co_pdiscard are 64bit
>>
>> blklogwrites: pass to blk_loc_writes_co_log which is 64bit
>>
>> blkreply, copy-on-read, filter-compress: pass to bdrv_co_pdiscard, OK
> 
> blkreplay
> 
>>
>> file-posix: one handler calls raw_account_discard() is 64bit and both
>>    handlers calls raw_do_pdiscard(). Update raw_do_pdiscard, which pass
>>    to RawPosixAIOData::aio_nbytes, which is 64bit (and calls
>>    raw_account_discard())
>>
>> gluster: somehow, third argument of glfs_discard_async is size_t.
>>    Let's set max_pdiscard accordingly.
>>
>> iscsi: iscsi_allocmap_set_invalid is 64bit,
>>    !is_byte_request_lun_aligned is 64bit.
>>    list.num is uint32_t. Let's clarify max_pdiscard and
>>    pdiscard_alignment.
> 
> The patch tweaks max_pdiscard, but doesn't change pdiscard_alignment.
> 
>>
>> mirror_top, preallocate: pass to bdrv_mirror_top_do_write() which is
>>    64bit
> 
> file is mirror.c, not mirror-top.c.  But it matches the BlockDriver
> bdrv_mirror_top name.  preallocate does not call
> bdrv_mirror_top_do_write, so it's probably worth separating that line
> out.
> 
>>
>> nbd: protocol limitation. max_pdiscard is alredy set strict enough,
>>    keep it as is for now.
>>
>> nvmd: buf.nlb is uint32_t and we do shift. So, add corresponding limits
>>    to nvme_refresh_limits().
> 
> nvme
> 
>>
>> qcow2: calculations are still OK, thanks to bdrv_check_qiov_request(),
>>    qcow2_cluster_discard() is 64bit.
>>
>> raw-format: raw_adjust_offset() is 64bit, bdrv_co_pdiscard too.
>>
>> sheepdog: the format is deprecated. Don't care and just make old
>>    INT_MAX limit to be explicit
>>
>> throttle: pass to bdrv_co_pdiscard() which is 64bit and to
>>    throttle_group_co_io_limits_intercept() which is 64bit as well.
>>
>> test-block-iothread: bytes argument is unused
>>
>> Great! Now all drivers are prepared to 64bit discard requests or has
>> explicit max_pdiscard limit.
> 
> are prepared to handle 64-bit discard requests, or else have explicit
> max_pdiscard limits.
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block_int.h        |  2 +-
>>   block/backup-top.c               |  2 +-
>>   block/blkdebug.c                 |  2 +-
>>   block/blklogwrites.c             |  4 ++--
>>   block/blkreplay.c                |  2 +-
>>   block/copy-on-read.c             |  2 +-
>>   block/file-posix.c               |  7 ++++---
>>   block/filter-compress.c          |  2 +-
>>   block/gluster.c                  |  7 +++++--
>>   block/iscsi.c                    | 10 +++++-----
>>   block/mirror.c                   |  2 +-
>>   block/nbd.c                      |  6 ++++--
>>   block/nvme.c                     | 14 +++++++++++++-
>>   block/preallocate.c              |  2 +-
>>   block/qcow2.c                    |  2 +-
>>   block/raw-format.c               |  2 +-
>>   block/sheepdog.c                 | 15 ++++++++++++++-
>>   block/throttle.c                 |  2 +-
>>   tests/unit/test-block-iothread.c |  2 +-
>>   block/trace-events               |  4 ++--
>>   20 files changed, 61 insertions(+), 30 deletions(-)
>>
> 
>> +++ b/block/gluster.c
>> @@ -891,6 +891,7 @@ out:
>>   static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
>>   {
>>       bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>> +    bs->bl.max_pdiscard = SIZE_MAX;
> 
> We probably want this to be MIN(GLUSTER_MAX_TRANSFER, SIZE_MAX). Also,
> do we want to round it down to alignment boundaries?

I don't think so.. We just call glfs_discard_async() function which is not part of Qemu. So we shouldn't assume any extra restrictions except for argument types I think. byte is size_t, so maximum is SIZE_MAX.

> 
>> +++ b/block/iscsi.c
>> @@ -1141,7 +1141,8 @@ iscsi_getlength(BlockDriverState *bs)
>>   }
>>   
>>   static int
>> -coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
>> +coroutine_fn iscsi_co_pdiscard(BlockDriverState *bs, int64_t offset,
>> +                               int64_t bytes)
>>   {
>>       IscsiLun *iscsilun = bs->opaque;
>>       struct IscsiTask iTask;
> 
> Did you want to add some sort of assert(bytes / iscsilun->block_size
> <= UINT32_MAX), or a comment that we are relying on bl.max_pdiscard?

Yes, will add, we are storing it to list.num which is uint32_t and don't want it to be overflowed

> 
>> +++ b/block/sheepdog.c
> 
>> +static void sd_refresh_limits(BlockDriverState *bs, Error **errp)
>> +{
>> +    bs->bl.max_pdiscard = INT_MAX;
> 
> Do we want to round this down to alignment?
> 

anyway, block/sheepdog.c is absent now :)


-- 
Best regards,
Vladimir

