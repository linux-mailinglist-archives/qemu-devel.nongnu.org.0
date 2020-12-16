Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDF2DBCA1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 09:24:57 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpS7E-0005Xc-Ie
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 03:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpS5A-0004b2-4M; Wed, 16 Dec 2020 03:22:48 -0500
Received: from mail-eopbgr20098.outbound.protection.outlook.com
 ([40.107.2.98]:15777 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpS55-00089a-Nm; Wed, 16 Dec 2020 03:22:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FReWvPGzKVsNtwsc5+clCCMI+hg1GJzIQeHMZRyI1yWRuXX4pNF26HSCi3hOQfN7zlRzMCQIBy5LPh7xPcal9+/LbnXNAzwH/OBTE2x4IMRX2adM+RME++yqItFSdXRBdbwy/na/MAAibD9Dfw7MnsjtypJgBA0NCGXDqOfvH0jH18WHtGAQaijPG3//vEIf1Cx7JsQVYu6irXvVO/pi4CClRlj7SCqbkiU3KY2rfNSV8ZNXohD2t8jMKPc/g3JjUszSN0pNYF8Xx3md/QoNCtm+O23AN3xGCPp+Vhz3tdKwadtwMbs70ygXpx6PQ9ICco5cuZtK2235vlbXdy972w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JdQM0inkp3PjxooXqGTrd+YHfKdc1ik2kkHCDiul2c=;
 b=nAvbyHHgMXQzxnceh9l5gW5RALLJSz7qWUUKwn8yb/CYomY3SZ3DxGs33I97TeTfH7NBSt0nJ2ELPV4wjtlwd4m8S8UUXmorJJIZwMTP1cBXjO5muK1drA1kvg0Fjdppq4lwre004PmR0yDbtYIQTDT52OJXalbD+W3WbJGEqjIdbL7QZCVIhsRziqSmnMh0zUiqk6dwJgYVXwVZDeOWFu4BmflPZ3nt9SJzux6SOHnrC+Pv7UroHDUkzNXY1XqQZViRhcLQH++7DUEM31/cbLSTVkjCXBHsoq+Sxly7lb1Tb0u8f6+ISfRl21mjySy1LbUWahJqLK0d2IxYMD5Peg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JdQM0inkp3PjxooXqGTrd+YHfKdc1ik2kkHCDiul2c=;
 b=usy6D8RiXmNzns6e4mIzlYGZN+bY+b1gkEYgcdO2F1zZtoOHzuHMPEOiivcewNPvvQlq4BowNStS1/ImdVAErAbYF+0asM9xHoxGFIx3xrUay3EFvoL1yWQWy+gZqEpeX0Yi+6Q1fwCc2mwgpapSOn+8TWnVWZNeG8ypaCEt+YM=
Authentication-Results: smartx.com; dkim=none (message not signed)
 header.d=none;smartx.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 08:22:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 08:22:40 +0000
Subject: Re: [PATCH v5] file-posix: detect the lock using the real file
To: Li Feng <fengli@smartx.com>, berrange@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <1608029636-31442-1-git-send-email-fengli@smartx.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <05c96a12-b343-fec4-4060-7110bb0850d0@virtuozzo.com>
Date: Wed, 16 Dec 2020 11:22:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <1608029636-31442-1-git-send-email-fengli@smartx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 08:22:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90278ab1-5f2f-4372-e4d9-08d8a19bc0e5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4024:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4024C8722008C6ACF8EC2B74C1C50@AM6PR08MB4024.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAGvgudZVuJwAiNCv5rEDGzMGbCZVyExLkVdseTujM2AKFCJqpuXJ1vt4Di+2uvfKD+GcwOT0Zs/uj04kgsL3IvcWhyflKvzp8K17KS74W8dZHeDyAMEHXonz3ZHEFePNRunDg5cjLe92mhOwVgAhPq6aXmBxE6zAeXrPZ8u4FRymlVPhGSoWgxi/8+GWuBrYqevWiDTwkom7iTzxzN9q/LOl6MmVbs4SZ0CY/Vj1nuv+cwc4KSRggHbq7qIgmTpuIzPHBdk4sNe3A3X4i52ekJrcpvKBpSdspqpzMOCnOZXtxa2fkYYM9bkqxSVM+s3aJm6YEPE+08Zg4DRFM3r0bR+94jQQd6FyqCNxXlPM+O2hdA16eCICkdnV8z1nHR/dEh+ri4rVpoOEhRya4jdNKJiTY8wg7dxW4CA8yZ14Zo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39830400003)(346002)(366004)(4326008)(5660300002)(31686004)(316002)(478600001)(66946007)(16576012)(16526019)(26005)(2906002)(110136005)(2616005)(956004)(31696002)(6486002)(36756003)(8676002)(83380400001)(186003)(8936002)(66476007)(86362001)(52116002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ekhhUFQxb0MyUHhHTWlKWUpJRGVVSi8ra3ArUlI4eVNyaGE3Unp4ekVoOHg5?=
 =?utf-8?B?UjJjUmVFS1hYUSt1REZSRWFwdEZydG0zSldiMERUMVFubkIyNmw4ZEVQVERw?=
 =?utf-8?B?cy8vL2hiYkZyZ2c3alZORUg4ZkVzdFFFekNlUE0wQ3JTc1liVEhPQVBhT093?=
 =?utf-8?B?QUt2MEJWWDllcUVRTGFZZC9HYTRSS0NTSHJTZi9Wd0w5YmJLL2dIOGxySkZI?=
 =?utf-8?B?OWxaK3VQTHI3UjZPS1d0QTVtVlJZNFNNUkNpT2o4SnlBdlhjc1NDU2ZoZnV3?=
 =?utf-8?B?K2ZxdHJuSjNnNFZia0ZGSTA4ZUlyOFpZbDVkOHJVQ1h6TVhXRWF2UWFvcHdE?=
 =?utf-8?B?RzJsQWM4SzRoSCtsNUxwYTVmem81Q0N0eGdLOUpzU1lRU21NWkJEODEyd1dV?=
 =?utf-8?B?Q3hHb1h2RllYcUpXL0tHT29CQlVoMDVtWGZTalZMR0JMNHFLenVaNUFwK29i?=
 =?utf-8?B?WW82eXJHME1meDFDRHN4ajlrKzZMb1NqMU1RcWQ0Mk9sSHVNY2xEMEdFMFVF?=
 =?utf-8?B?QVBmK2xDVE5oVFo1V09jemY5K3BPY2tQTXZJTytIckRQTmxMa2pQWHRwbFVG?=
 =?utf-8?B?OGdHQXMzZGw3aU9FdndCck9BVUlVYk1EL2doeDUvcndoeGJrNVFlREh6dzll?=
 =?utf-8?B?dFJhWG41WlYzR3R5bGVTUDhFbW5GSjNMcjFNZWYyTC9GS1FXaFJ4bGZmaVFB?=
 =?utf-8?B?QUg1VnZLSDQvOFF2Rzl3dm9KbzBvcFlxNXJmSXZKSXZBTzBZclFvZmRRcThN?=
 =?utf-8?B?MWVhalRudWNPTm9kVnpjSGF1WmVEMWFmVlJQMVRPTzluK2NTZmdLYzNKSEw5?=
 =?utf-8?B?UGFpSG1kcjJVVnNDUFhrUFFJK3FJU1ltL2FhWUh6ZW82SHhLaXZtM0QzMVFZ?=
 =?utf-8?B?dFRXdFdQMEdaTkNnU1NYTlpKZUYrd3hicktjOXY2T3lScEc4SEkrMmV0bHhr?=
 =?utf-8?B?QXUxSW52Q3hjUCtybmFJWW9oWkhQS1RrL0Y0RU5Vb2Zqemg2dVNMeUxYSWVT?=
 =?utf-8?B?YVh5L0dmL1VVWStpa3NuV2YwTWNNRW1tUDlnTUVUOUtxUWJpOWRhMitoL2pN?=
 =?utf-8?B?aE9vd2RWZFdiNEFVQ00zQkhobzNvU2xWSVFYdm5pL3dmVC9xV2R5ejhHTDlS?=
 =?utf-8?B?TkJFZExPallFNXpYajkxUmx0bjFkcE1kQm1zWmoyNGlZbkhwSm5ob2JycVE1?=
 =?utf-8?B?ak14T0FOUmJvSmEwMkNpK2VLdTFLU2NrS2U1TXdVNFFJWGpIL2ZUUTlON1VU?=
 =?utf-8?B?VmJZUDFUdUJQSmRGR0hRUkJKMEpIcmFhY1ZiekRnSEEvYkYvWC9ZSDZHZEdP?=
 =?utf-8?Q?G1BZaO2ECVPfYOn7F6CG9zOZe1YMF0DQrg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 08:22:39.9776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 90278ab1-5f2f-4372-e4d9-08d8a19bc0e5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhF0aolEkge9FCZZHWMS8b0wSopuCnluf39UwH0Tu5uz17v2trua3oU6uwoYICoqT8sg0xgyem/5S/AEe1LhxVFdgIlHBSpzZ9cN0WVxUKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Received-SPF: pass client-ip=40.107.2.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: lifeng1519@gmail.com, kyle@smartx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.12.2020 13:53, Li Feng wrote:
> This patch addresses this issue:
> When accessing a volume on an NFS filesystem without supporting the file lock,
> tools, like qemu-img, will complain "Failed to lock byte 100".
> 
> In the original code, the qemu_has_ofd_lock will test the lock on the
> "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> which depends on the underlay filesystem.
> 
> In this patch, add a new 'qemu_has_file_lock' to detect whether the
> file supports the file lock. And disable the lock when the underlay file
> system doesn't support locks.
> 
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
> v5: simplify the code.
> v4: use the fd as the qemu_has_file_lock argument.
> v3: don't call the qemu_has_ofd_lock, use a new function instead.
> v2: remove the refactoring.
> ---
>   block/file-posix.c   | 61 +++++++++++++++++++++++---------------------
>   include/qemu/osdep.h |  1 +
>   util/osdep.c         | 14 ++++++++++
>   3 files changed, 47 insertions(+), 29 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 806764f7e3..4e00111031 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -584,6 +584,21 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>       s->use_linux_io_uring = (aio == BLOCKDEV_AIO_OPTIONS_IO_URING);
>   #endif
>   
> +    s->open_flags = open_flags;
> +    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> +
> +    s->fd = -1;
> +    fd = qemu_open(filename, s->open_flags, errp);
> +    ret = fd < 0 ? -errno : 0;
> +
> +    if (ret < 0) {
> +        if (ret == -EROFS) {
> +            ret = -EACCES;
> +        }
> +        goto fail;
> +    }
> +    s->fd = fd;
> +
>       locking = qapi_enum_parse(&OnOffAuto_lookup,
>                                 qemu_opt_get(opts, "locking"),
>                                 ON_OFF_AUTO_AUTO, &local_err);
> @@ -606,7 +621,7 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>           s->use_lock = false;
>           break;

In case of ON_OFF_AUTO_ON: we do check qemu_has_ofd_lock() and print a warning.

Probably we can also check new qemu_has_file_lock() and just do early fail, not waiting for permissions update..

>       case ON_OFF_AUTO_AUTO:
> -        s->use_lock = qemu_has_ofd_lock();
> +        s->use_lock = qemu_has_file_lock(s->fd) && qemu_has_ofd_lock();
>           break;
>       default:
>           abort();
> @@ -625,22 +640,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
>       s->drop_cache = qemu_opt_get_bool(opts, "drop-cache", true);
>       s->check_cache_dropped = qemu_opt_get_bool(opts, "x-check-cache-dropped",
>                                                  false);
> -
> -    s->open_flags = open_flags;
> -    raw_parse_flags(bdrv_flags, &s->open_flags, false);
> -
> -    s->fd = -1;
> -    fd = qemu_open(filename, s->open_flags, errp);
> -    ret = fd < 0 ? -errno : 0;
> -
> -    if (ret < 0) {
> -        if (ret == -EROFS) {
> -            ret = -EACCES;
> -        }
> -        goto fail;
> -    }
> -    s->fd = fd;
> -
>       /* Check s->open_flags rather than bdrv_flags due to auto-read-only */
>       if (s->open_flags & O_RDWR) {
>           ret = check_hdev_writable(s->fd);
> @@ -2388,6 +2387,7 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>       int fd;
>       uint64_t perm, shared;
>       int result = 0;
> +    bool use_lock;
>   
>       /* Validate options and set default values */
>       assert(options->driver == BLOCKDEV_DRIVER_FILE);
> @@ -2428,19 +2428,22 @@ raw_co_create(BlockdevCreateOptions *options, Error **errp)
>       perm = BLK_PERM_WRITE | BLK_PERM_RESIZE;
>       shared = BLK_PERM_ALL & ~BLK_PERM_RESIZE;
>   
> -    /* Step one: Take locks */
> -    result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> -    if (result < 0) {
> -        goto out_close;
> -    }
> +    use_lock = qemu_has_file_lock(fd);
> +    if (use_lock) {
> +        /* Step one: Take locks */
> +        result = raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, errp);
> +        if (result < 0) {
> +            goto out_close;
> +        }
>   
> -    /* Step two: Check that nobody else has taken conflicting locks */
> -    result = raw_check_lock_bytes(fd, perm, shared, errp);
> -    if (result < 0) {
> -        error_append_hint(errp,
> -                          "Is another process using the image [%s]?\n",
> -                          file_opts->filename);
> -        goto out_unlock;
> +        /* Step two: Check that nobody else has taken conflicting locks */
> +        result = raw_check_lock_bytes(fd, perm, shared, errp);
> +        if (result < 0) {
> +            error_append_hint(errp,
> +                              "Is another process using the image [%s]?\n",
> +                              file_opts->filename);
> +            goto out_unlock;
> +        }
>       }

In raw_co_create(), I think you should also update code under "out_unlock:", we shouldn't
call raw_apply_lock_bytes(), when use_lock is false.


Another thing is call to raw_apply_lock_bytes() in raw_check_perm(). Looks like a preexisting bug. Why don't we check for s->use_lock?

>   
>       /* Clear the file by truncating it to 0 */
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..c7587be99d 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -513,6 +513,7 @@ int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
>   int qemu_unlock_fd(int fd, int64_t start, int64_t len);
>   int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
>   bool qemu_has_ofd_lock(void);
> +bool qemu_has_file_lock(int fd);
>   #endif
>   
>   #if defined(__HAIKU__) && defined(__i386__)
> diff --git a/util/osdep.c b/util/osdep.c
> index 66d01b9160..dee1f076da 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -225,6 +225,20 @@ static void qemu_probe_lock_ops(void)
>       }
>   }
>   
> +bool qemu_has_file_lock(int fd)
> +{
> +    int ret;
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 0,
> +        .l_len    = 0,
> +        .l_type   = F_WRLCK,
> +    };
> +
> +    ret = fcntl(fd, F_GETLK, &fl);

I think we need

     qemu_probe_lock_ops();
     ret = fcntl(fd, fcntl_op_getlk, &fl);

pattern instead, like in qemu_lock_fd_test(). Otherwise, what we check may differ with what we are going to use.

Also, it's  mostly a duplication of qemu_lock_fd_test(), so some refactoring may be done, but it may be done later.

> +    return ret == 0;
> +}
> +
>   bool qemu_has_ofd_lock(void)
>   {
>       qemu_probe_lock_ops();
> 


-- 
Best regards,
Vladimir

