Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53A12DBE9B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 11:27:44 +0100 (CET)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpU23-0003x4-Np
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 05:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpU09-0002Qh-DW; Wed, 16 Dec 2020 05:25:46 -0500
Received: from mail-am6eur05on2139.outbound.protection.outlook.com
 ([40.107.22.139]:40171 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpU04-0006Zt-QP; Wed, 16 Dec 2020 05:25:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGtF1QKT0zIGE9Dk/ZWnyDa05pRewYzbVE1eCY5o6ooSjgeyYQQAU2JltdGzbVObWXUzhofYjHOyZJ46hqH4XO0q6h2shA5ByeBmJ6hTFHaeigchURB98ghQ7auE6kjKTJRw2icM//LvVxrYwDQgpm5YSqvCCTqtyhPFhcs7yve5uT5Mexm50ysOqO8vdofNRTjGXggJo3+v3EiehIIwHWWVsTv4+/Ahr4V9nb78kT0nFPHP+dRpVCjaVXB+mGeHGyqXjIC2pQdF6louZBdGDzRqGkTeKc/5bKDf+4ujqWuGEZM4p1AE8UMOnb3XlsQR1GVD6f7rsZRi0rYhW6Zfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v4LfMifOuyghxko0uT/Qnqi7/w6VwDiM6gv0vllxXo=;
 b=ba1bq+RM5zcj1j8RHFKfHnZzcEMNThJcQqiXM6NOUeeOydv62kPZdZf0DDocgfAI/gahzVZkecv+Dt99J7mN3eiZDVArJgRlPCHrHuk3sAn2W9G0qel9nxEA5fJK1a4k4ZTBqlsxcsCqaNs5onwru2DsUf7ycEzdmsaB41/i37lWa9PSCyMBtax/cQNgCu/Qv0NSi3IcOXFir/ZrKcJ7830qgE9vJ5lhIxt2MhrNCHA8sA/SzIdCP8H3mDtQw++iSfpT0lR5Tf5+cjXy4mPKM0TkKNl5mzaZY250DO97fjk6cf2TV9n0R9IMJBHzW8Gw8fl4ZjelH+4N4z43diQ8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v4LfMifOuyghxko0uT/Qnqi7/w6VwDiM6gv0vllxXo=;
 b=ZNucb1CoR4Ca2lunWVqzSo7FwuutexF+XKuubOHjy/EA5rUXUPloxto4mSXJLQ9ebrX8hk6p/5SsBbY0UX+8epc8vsjmLAoQJOQK8OdJaWbH9VYEaAMHONLmNFQGJax/T6pFGWfyhZ0oynC20PAKYCIgaVwmG6NolEamfygDzKk=
Authentication-Results: smartx.com; dkim=none (message not signed)
 header.d=none;smartx.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5031.eurprd08.prod.outlook.com (2603:10a6:20b:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.26; Wed, 16 Dec
 2020 10:25:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 10:25:37 +0000
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
 <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
 <20201216094959.GC189795@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e719c240-a232-c017-73e9-45dbcda619fd@virtuozzo.com>
Date: Wed, 16 Dec 2020 13:25:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201216094959.GC189795@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR01CA0177.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 10:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd7edd75-ae51-4ea1-0cef-08d8a1acee43
X-MS-TrafficTypeDiagnostic: AM6PR08MB5031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5031D5D488093B558BEBBE3CC1C50@AM6PR08MB5031.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGC1XpwKHvK8TgTcfhJLo//q3iEXgZGR8fjWeVxR/hx3qAUsxZSYX6CSE5bDWNdKTvs7mAD3ihNOoXkyY+klf5jqGaCAlCV2nBrnZ6VtRaDnmUM4cs3tkjEUSzK1XPB0bnY+69PA3h6NWtbu6ufsBAyNsbkDYTZvKx0jfjrTKLWLOfqtyVty1SnMdQdfujIh6KvbYsdeneWO6DELX0wAqitrtEc4oxE9DEzH3ZwpUg3ycjjru5V5aUbhdb0Hnc0SXHCAL9axYsdnc+ayQsn++QgVT7ftWnO5PzV43psZCWm1Z4R3GTgmL2GYuf6YKvaAX39a46HCW+Jo4cliJVmtYgL42jL5x40/aZfgeXCYsb78hUMgIfTbNr/ohN6Tamna
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39840400004)(366004)(66556008)(66476007)(478600001)(66946007)(5660300002)(52116002)(2906002)(2616005)(83380400001)(86362001)(956004)(31686004)(16526019)(54906003)(16576012)(6486002)(186003)(8676002)(31696002)(36756003)(6916009)(26005)(316002)(8936002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEt0WmxERzUrUitCUHhYd3JVOFdSY2dwQThVTjZEbjJheWViZzhzRWNadk1p?=
 =?utf-8?B?UE1GdUdzckhEVFEvQUpla0d2TVhjOG1KZDJIaE1MTnM0NFhLOVFyeXdBZk1t?=
 =?utf-8?B?WUYzUVRWd3lGMjhGM3NyRTFqM3RKcWdPQWxpOFFnQ3IxQ0d4OVNQdU5XZ1ZL?=
 =?utf-8?B?YlljUG9HVnBJYnNBK0xwL1lidHNLd2dva2FINyt6dysyVWJtN2VWT3ljVFBH?=
 =?utf-8?B?NFNNSEtQaTl0VkR6Qno1M281RCtiL1FsY3kyK2RzakFxVTk1Rm02Q1ZIblFH?=
 =?utf-8?B?S3ppemVwL1krdU5PcCtrbDdZQTVlNVlOZ2l0SlR0NUVmU0lTaVNNakI2TFhu?=
 =?utf-8?B?YjdCdFU3SitjT05pU0ZoZHhGeGZ2aGhoS3RBN0Qva3puUTJVQlFUQXJZcVNZ?=
 =?utf-8?B?UE15M0lMcXQ5d1FLUTRsUk1QVGZxbjdhdjVwbUNQek5LUWo2b21TekdXQ1cz?=
 =?utf-8?B?Skw2Z2hHcGVPcEpKNStBQlFUM0tOMVM2bU5hdXd1VzJwcFh5d2lHNThOVGdt?=
 =?utf-8?B?ajJFNHFrZGVVMXJUUGxiaFpIaXBaNlBBd1NjQWVOK3BRa3c0Qm9SaExhaXVu?=
 =?utf-8?B?SStIVU9oNGZ4R3Z0TW53cXhpaGFiME41WnNsYlJSbHNFaG9yUmg1eVdVdm1r?=
 =?utf-8?B?TSt1MENWVUNnYzhIaVBJbXA5amNPQ3FHUkJuV0xLR1FJV2FvaFdJc0RSMkFz?=
 =?utf-8?B?QXp1VnV5dkdkZnAzZldjVHpjWFZJc0x1aHpML25wVDZnOXkxWTE3MFV6ak96?=
 =?utf-8?B?cThiKy9rRER1Wm9mWmhSTCt5MmVGdmwyekVyQlFVRGJiOFJVSFJrbE52NGZ5?=
 =?utf-8?B?THlCakF0QUZrVHhVbStDMnNWeXVmY3I4R2JYUDZFbFkzbWxTNTdVS3JCQThw?=
 =?utf-8?B?aFE4R0Fld2M1aFdDYmQ5djNuT1hPdHJjYnJ1eGx1elVzSk9wck0vRVcxMG5K?=
 =?utf-8?B?SnhLZEFVTGtaZ2dXakMvS2l0R0RJOUExUmpaSjI2eWtNOHFETTUzbE8reUtT?=
 =?utf-8?B?NmVsWUFoYXFUTWxwQXFQeG1UZFdpOEFpRjZsMTVtVW9nN1NBY2F4US95N3pq?=
 =?utf-8?B?RjNuZ2VQckRzcnJCZzF4SEQxd2NNUklJdzFwRlJVYXVUSm5GQisvbWladEhW?=
 =?utf-8?B?RW1kMEtGZTU4NWhVU3JnR2xaWXNJNWk4bXF2Nk91VGcxNU5WekZGRm1IM3BH?=
 =?utf-8?B?akllWmJNVFpvTll2cDJ6VmJwSjBML1JrSGcxZGxDajh2cDZkT2FiUElIL2lt?=
 =?utf-8?B?b01lYkRaMzduUEhkU0VoL29ycmh2TWNmYm5WZEFzaHoyZ2VQcWxSajZxQmw1?=
 =?utf-8?Q?BslLudxmfBaJ4cSy8U5RUyaP28H+Whemnn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 10:25:37.6395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7edd75-ae51-4ea1-0cef-08d8a1acee43
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXW8D8P8JSHjCNFGCzprHzbJU/hpzbe71E8RDO2vqVFaTtT/oJbw/R/bEHSze6pPcl5ABNuvA76K6vVHHRcEogKGPJSHccYTi8zxCpaWQyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031
Received-SPF: pass client-ip=40.107.22.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, lifeng1519@gmail.com,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Li Feng <fengli@smartx.com>, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

16.12.2020 12:49, Daniel P. Berrangé wrote:
> On Wed, Dec 16, 2020 at 11:22:38AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 15.12.2020 13:53, Li Feng wrote:
>>> This patch addresses this issue:
>>> When accessing a volume on an NFS filesystem without supporting the file lock,
>>> tools, like qemu-img, will complain "Failed to lock byte 100".
>>>
>>> In the original code, the qemu_has_ofd_lock will test the lock on the
>>> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
>>> which depends on the underlay filesystem.
>>>
>>> In this patch, add a new 'qemu_has_file_lock' to detect whether the
>>> file supports the file lock. And disable the lock when the underlay file
>>> system doesn't support locks.
>>>
>>> Signed-off-by: Li Feng <fengli@smartx.com>
>>> ---
>>> v5: simplify the code.
>>> v4: use the fd as the qemu_has_file_lock argument.
>>> v3: don't call the qemu_has_ofd_lock, use a new function instead.
>>> v2: remove the refactoring.
>>> ---
>>>    block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
>>>    include/qemu/osdep.h |  1 +
>>>    util/osdep.c         | 14 ++++++++++
>>>    3 files changed, 47 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index 806764f7e3..4e00111031 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>        s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
>>>    #endif
>>> +    s->open_flags = open_flags;
>>> +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
>>> +
>>> +    s->fd = -1;
>>> +    fd = qemu_open(filename, s->open_flags, errp);
>>> +    ret = fd < 0 ? -errno : 0;
>>> +
>>> +    if (ret < 0) {
>>> +        if (ret == -EROFS) {
>>> +            ret = -EACCES;
>>> +        }
>>> +        goto fail;
>>> +    }
>>> +    s->fd = fd;
>>> +
>>>        locking = qapi_enum_parse(&OnOffAuto_lookup,
>>>                                  qemu_opt_get(opts, "locking"),
>>>                                  ON_OFF_AUTO_AUTO, &local_err);
>>> @@ -606,7 +621,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>            s->use_lock = false;
>>>            break;
>>
>> In case of ON_OFF_AUTO_ON: we do check qemu_has_ofd_lock() and print a warning.
>>
>> Probably we can also check new qemu_has_file_lock() and just do early fail, not waiting for permissions update..
>>
>>>        case ON_OFF_AUTO_AUTO:
>>> -        s->use_lock = qemu_has_ofd_lock();
>>> +        s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
>>>            break;
>>>        default:
>>>            abort();
>>> @@ -625,22 +640,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>>>        s->drop_cache = qemu_opt_get_bool(opts, "drop-cache", true);
>>>        s->check_cache_dropped = qemu_opt_get_bool(opts, "x-check-cache-dropped",
>>>                                                   false);
>>> -
>>> -    s->open_flags = open_flags;
>>> -    raw_parse_flags(bdrv_flags, &s->open_flags, false);
>>> -
>>> -    s->fd = -1;
>>> -    fd = qemu_open(filename, s->open_flags, errp);
>>> -    ret = fd < 0 ? -errno : 0;
>>> -
>>> -    if (ret < 0) {
>>> -        if (ret == -EROFS) {
>>> -            ret = -EACCES;
>>> -        }
>>> -        goto fail;
>>> -    }
>>> -    s->fd = fd;
>>> -
>>>        /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
>>>        if (s->open_flags & O_RDWR) {
>>>            ret = check_hdev_writable(s->fd);
>>> @@ -2388,6 +2387,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>>>        int fd;
>>>        uint64_t perm, shared;
>>>        int result = 0;
>>> +    bool use_lock;
>>>        /* Validate options and set default values */
>>>        assert(options->driver == BLOCKDEV_DRIVER_FILE);
>>> @@ -2428,19 +2428,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>>>        perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
>>>        shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
>>> -    /* Step one: Take locks */
>>> -    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
>>> -    if (result < 0) {
>>> -        goto out_close;
>>> -    }
>>> +    use_lock = qemu_has_file_lock(fd);
>>> +    if (use_lock) {
>>> +        /* Step one: Take locks */
>>> +        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
>>> +        if (result < 0) {
>>> +            goto out_close;
>>> +        }
>>> -    /* Step two: Check that nobody else has taken conflicting locks */
>>> -    result = raw_check_lock_bytes(fd, perm, shared, errp);
>>> -    if (result < 0) {
>>> -        error_append_hint(errp,
>>> -                          "Is another process using the image [%s]?\n",
>>> -                          file_opts->filename);
>>> -        goto out_unlock;
>>> +        /* Step two: Check that nobody else has taken conflicting locks */
>>> +        result = raw_check_lock_bytes(fd, perm, shared, errp);
>>> +        if (result < 0) {
>>> +            error_append_hint(errp,
>>> +                              "Is another process using the image [%s]?\n",
>>> +                              file_opts->filename);
>>> +            goto out_unlock;
>>> +        }
>>>        }
>>
>> In raw_co_create(), I think you should also update code under "out_unlock:", we shouldn't
>> call raw_apply_lock_bytes(), when use_lock is false.
>>
>>
>> Another thing is call to raw_apply_lock_bytes() in raw_check_perm(). Looks like a preexisting bug. Why don't we check for s->use_lock?
>>
>>>        /* Clear the file by truncating it to 0 */
>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>> index f9ec8c84e9..c7587be99d 100644
>>> --- a/include/qemu/osdep.h
>>> +++ b/include/qemu/osdep.h
>>> @@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>>>    int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>>>    int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
>>>    bool qemu_has_ofd_lock(void);
>>> +bool qemu_has_file_lock(int fd);
>>>    #endif
>>>    #if defined(__HAIKU__) && defined(__i386__)
>>> diff --git a/util/osdep.c b/util/osdep.c
>>> index 66d01b9160..dee1f076da 100644
>>> --- a/util/osdep.c
>>> +++ b/util/osdep.c
>>> @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
>>>        }
>>>    }
>>> +bool qemu_has_file_lock(int fd)
>>> +{
>>> +    int ret;
>>> +    struct flock fl = {
>>> +        .l_whence = SEEK_SET,
>>> +        .l_start  = 0,
>>> +        .l_len    = 0,
>>> +        .l_type   = F_WRLCK,
>>> +    };
>>> +
>>> +    ret = fcntl(fd, F_GETLK, &fl);
>>
>> I think we need
>>
>>      qemu_probe_lock_ops();
>>      ret = fcntl(fd, fcntl_op_getlk, &fl);
>>
>> pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.
> 
> No, we explicitly do *not* want that.  This function is *only*
> about checking whether traditional fcntl locks work or not on
> this specific file handle.

Hmm, than may be name the function qemu_has_posix_lock(), to stress that fact? All other qemu*lock*(fd) API functions do rely on fcnt_op_getlk/fcntl_op_setlk and work with lock type determined by qemu_probe_lock_ops().

> 
> Support for OFD locks is a separate check, and its result
> applies system wide.
> 

Still, I don't follow, why should we check posix lock, when we are going to use ofd locks. What if OFD locks are supported by kernel, but specific file-system supports posix lock, but not ofd? Than we'll fail the same way as described in commit message and the patch doesn't help. Or what I miss?


-- 
Best regards,
Vladimir

