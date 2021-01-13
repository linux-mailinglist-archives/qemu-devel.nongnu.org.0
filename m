Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8892F48A8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:28:07 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdNm-00074P-CS
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzdMi-0006Yg-3S; Wed, 13 Jan 2021 05:27:00 -0500
Received: from mail-eopbgr40119.outbound.protection.outlook.com
 ([40.107.4.119]:44726 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzdMb-00049Z-Gw; Wed, 13 Jan 2021 05:26:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxMoFA1GcV82ODe1rwpnVEVUY3QljbFMF8+gNdf3d1apf6qfSg5YQLlxxUkl1G0b795wSeSAVIU39Mu4LCe7YcUIhlKRXgR3Z4+nvsW8MyCWXq/x+z1rNcKwd6sFSQUPPXMx4oyZicldF9kxHwO1I8VgsKChmuDKXe0r8GoQOirasVMsf8QYZSWMbRvSNRhG1peaoljtFAp5BHDG+5qZCxdnsfDSy+hbmuiYIGsNVRvFbxd4vDAV/975RwBw4oPUufjgdyFpHft4PddKnIHhvSsiS20i2pPyuAeqPq86yg0JD1eXH8Aw6qWkWVebpinGbnREu0NkJyZkwxdnru0iFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4idoWzxB9iDpJ/Rr411vLflbeeaWmbDqNZSqldK5PVE=;
 b=dR2424dfDjVVZps0dFO0hNGXPR1EtmhYdrsIqrtONe+JWGK/w2C2CNZG+B/EhShaaMis3cLnM71BuZTwUUREvZ7SqSRIZJEVNWNATfUodjk/RaH07a0OCgJJVmY86GcObPm1T1k/h2gvyeXxxvP4KiBK+OtfY9Zy5+Zla7d2+3Wfr4DQSeDKcroPEwK+pVkzquWzdHK2HpjHJTQw1DJgfKvaKf/wIMchORxdcpev6VDgemhosiop9tZLrMor5k3QGUBhcwCMJnNvSrwbGuladiYb3XMMm1qiWRN0e8gyHshr5mYSw8Yzf+d2XgVy9+yCiUC+oVAAYTwfCkGaSzhRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4idoWzxB9iDpJ/Rr411vLflbeeaWmbDqNZSqldK5PVE=;
 b=kh3/OUbcyKu//gjV5bHGdYpniA/42o+iUCEhjByndvMzukbex3pVY2dfdIkgCZHQLYP7nXSl0X83w8TH4Iligkc4FFPOQ5Wr+c1BzMZJxHpwWrJr2H33fKGK+62zBK1785CbWz9pr2Emc47TNXkjreHVkKXsH+8berwwII/mH7U=
Authentication-Results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 10:26:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 10:26:50 +0000
Subject: Re: [PATCH v4] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210112152726.2217792-1-david.edmondson@oracle.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ecee2467-1687-1ed5-b3a4-4e31ae39acb8@virtuozzo.com>
Date: Wed, 13 Jan 2021 13:26:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210112152726.2217792-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM3PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:207:5::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM3PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:207:5::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Wed, 13 Jan 2021 10:26:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8c7796-6150-46bb-cc0a-08d8b7adbcff
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-Microsoft-Antispam-PRVS: <AS8PR08MB5912D827603749C1854D8B6EC1A90@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfOtsZauYLs6T/pcebfSYH0oHR/47j8e6vpLcXKOo4NT868epAGkq4xo5rdYpKMTDXb4FICVJuU4vuyC/ceMwI7cIj/6y8LiI8Q9jRCiNnmTX/ydlBkOGnV0NgMbJZjhx4qkqR6R/lpD0Z0EpLWcLVmYk3cZA/ukIOqpztHlT9rb+FvAkwFbEYn2HxtdGfh2YrO3L5HgLzqx1eDigYAufU8gZOgBHSinWjClif137RIw4dUELLIVxSbadS8YgQXK+96bYoIi8oNLNeD/vFPquL1op2ZIBqWOF8ho81Xp5kZP0LUCZ6N7ird2p4zpwJcsWLgr9n8VIOBUWDts4BGD4xK+GmWUXwr3mSZ/t+dbgrH6K6H2XhxTuBA53epyKox8vXUryPKQE4OmR/MkhSG3u8ihx6dE8RCzzh7Im1M90ZkyEFSsnoWqKqRfYPLWHhzbbuuVaWxBNC1QJNVn0VLjzM1Jstvslw7C8iTWDGXmb0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39840400004)(376002)(36756003)(26005)(5660300002)(52116002)(186003)(478600001)(66556008)(16526019)(316002)(66946007)(2616005)(956004)(8676002)(2906002)(66476007)(4326008)(31686004)(54906003)(31696002)(86362001)(6486002)(16576012)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wlh0WXVRVzVzaUw1RytncVhnbUZXZTNnb3p5ckoxLzFpYW50eEtob0hxU2xa?=
 =?utf-8?B?bWhLemhMdUhKUVRWV01ScWZXOUcxRnlKamE4WW1hVEQ1WCt5Q3dTNW9md0NT?=
 =?utf-8?B?dTZHRUV4MHhxZTFDSlgrTk5nN294R25oTkwvWkxNRlRrU1FINjJRU3pTRkU3?=
 =?utf-8?B?eHVTdW1pZkpZWDJWRDFuUEtPVy84MDR2Y3NDRG5SSm45eTRTcWRTSk80cFR5?=
 =?utf-8?B?VFdib3dna0VTWlNDWXJ3L1A4SUFaSHFmWUMraTUrZlR2Y0l1d3BPQ0tBeVph?=
 =?utf-8?B?WC9ueWlRaG5kVzJuOW15c1V1QXgzYkZPU2pOM1lvTDFkYnVtN1VFUjc4RWRn?=
 =?utf-8?B?K0dMNWE2UUdyN3d5OVBGR2xrdjNUZVB2bmhlUVpTVHArMGFZSG4ycFhzbk1H?=
 =?utf-8?B?eHlFZ28zb1JqeFV4T2tSMGRSVWhCcW02aXltWjBQd2M5cmpoUTBzYTBQcnl1?=
 =?utf-8?B?SU1BS05CaWVWUzZBY3NBMU9Oc1M2dklYYWFqc1Z0cTFrZTVZZzlBekh1S1pi?=
 =?utf-8?B?U1IzQXNRYVFLdGxYS2o1Z1BKQlNQS2trQUNBOVFhRzFFN1lhdmhIMS90MmZu?=
 =?utf-8?B?ckpjYXM2SDNkNlpQcVYvWlhDN3VKSkZPdnB2bm9IMDA2ckI5VmpJTUdISVBh?=
 =?utf-8?B?Q1BFbmVOaHRvdGNIZ3ZFWmh2Qjc1d3lnMlp6elBYN3JYTFZFNzJQdVYwcjlO?=
 =?utf-8?B?bjU4NEZiamM5bzVqMkJWcWxyTW5lcGZLdTVGempPRmlJQ0h2ekpSOGc4ZHp0?=
 =?utf-8?B?K1pHcGpaeVVxNTZVOVFJTVlCWXQxY0Vjc1hQOVhRM1BuNWF4SGF2RndBL0VS?=
 =?utf-8?B?dWpsSk1hVHQvWC9scGlqc01IUzJJUnlEUU1DVStWUzVXbTIwa3pTUklOSWUy?=
 =?utf-8?B?S1lGR0VWa3owMlVwNUhhRkk5ODNvaVVaSlQ4SkhDTTRNdm4xYzZvblZKUHdm?=
 =?utf-8?B?UjZPU3p1aENzSUdpeW1mdmw4ZUNxOUcrai8zWFpEeks2ZjZOUGZpc291RjNv?=
 =?utf-8?B?b1k4Vk93bmw5RnBXSzFZNFBLZ05DVEpPZUIwTUJYZGFpYWRpU0pyU1JtczR4?=
 =?utf-8?B?eDN5WmFoQXZ2TlZtMTU0UkNMcUN1Z0ZFODJxYmIvbUd1b3Q2MEhsdFdBaG1Y?=
 =?utf-8?B?d2VweDRaMVNaZjZOQzk0YVRldm9JVml6VWFBVmlySU5CTWJkTjBNMXdLdTV2?=
 =?utf-8?B?RzkxZ1VUU2FKNkl4S3JkZjZRVjlqMFVMQWdjajM0K2Q4VlM5ZnlZWGxRckd4?=
 =?utf-8?B?aHRmMEU3eDBSM2pOZ1pGWWJMMEpneW1FNEZGOHA0NzlDS1JONTRqbDlYSTgr?=
 =?utf-8?Q?dy1WbsXe6i7Uey3oN6mbl5RgmnaWso41jt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 10:26:50.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8c7796-6150-46bb-cc0a-08d8b7adbcff
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDKV9yCSAsRdO2lTTonwz+hDv+Aj+ZlbhLSF9VQ5/Qef93R2/l+8oEi5vHk8nr1FXYr5z0ghwTgxVgmVb9iS36Cgkd/I9PCCc/bujs4lpMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.4.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 18:27, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of manipulating file locks
> fails with an error other than EAGAIN or EACCES, report the error
> returned by fcntl.
> 
> EAGAIN or EACCES are elided as they are considered to be common
> failures, indicating that a conflicting lock is held by another
> process.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
> v3:
> - Remove the now unnecessary updates to the test framework (Max).
> - Elide the error detail for EAGAIN or EACCES when locking (Kevin,
>    sort-of Max).
> - Philippe and Vladimir sent Reviewed-by, but things have changed
>    noticeably, so I didn't add them (dme).
> 
> v4:
> - Really, really remove the unnecessary updates to the test framework.
> 
>   block/file-posix.c | 52 +++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 42 insertions(+), 10 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 00cdaaa2d4..c5142f7ffa 100644

Hmm, not it looks like too much code duplication. Maybe, we can add a helper macro, like

#define raw_lock_error_setg_errno(errp, os_error, fmt, ...) \
   do {
     if (err == EAGAIN || err == EACCES) {
       error_setg((errp), (fmt), ## __VA_ARGS__);
     } else {
       error_setg_errno((errp), (os_error), (fmt), ## __VA_ARGS__);
     }
   } while (0)

We can't make a helper function instead, as error_setg_errno is already a macro and it wants to use __LINE__..

But I think that macro is better than duplication anyway.

> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -836,7 +836,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>           if ((perm_lock_bits & bit) && !(locked_perm & bit)) {
>               ret = qemu_lock_fd(fd, off, 1, false);
>               if (ret) {
> -                error_setg(errp, "Failed to lock byte %d", off);
> +                int err = -ret;
> +
> +                if (err == EAGAIN || err == EACCES) {
> +                    error_setg(errp, "Failed to lock byte %d", off);
> +                } else {
> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
> +                }
>                   return ret;
>               } else if (s) {
>                   s->locked_perm |= bit;
> @@ -844,7 +850,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>           } else if (unlock && (locked_perm & bit) && !(perm_lock_bits & bit)) {
>               ret = qemu_unlock_fd(fd, off, 1);
>               if (ret) {
> -                error_setg(errp, "Failed to unlock byte %d", off);
> +                int err = -ret;
> +
> +                if (err == EAGAIN || err == EACCES) {
> +                    error_setg(errp, "Failed to lock byte %d", off);

s/lock/unlock

> +                } else {
> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);

and here.

Which proves, that code duplication is a bad idea in general :)

> +                }
>                   return ret;
>               } else if (s) {
>                   s->locked_perm &= ~bit;
> @@ -857,7 +869,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>           if ((shared_perm_lock_bits & bit) && !(locked_shared_perm & bit)) {
>               ret = qemu_lock_fd(fd, off, 1, false);
>               if (ret) {
> -                error_setg(errp, "Failed to lock byte %d", off);
> +                int err = -ret;
> +
> +                if (err == EAGAIN || err == EACCES) {
> +                    error_setg(errp, "Failed to lock byte %d", off);
> +                } else {
> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
> +                }
>                   return ret;
>               } else if (s) {
>                   s->locked_shared_perm |= bit;
> @@ -866,7 +884,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>                      !(shared_perm_lock_bits & bit)) {
>               ret = qemu_unlock_fd(fd, off, 1);
>               if (ret) {
> -                error_setg(errp, "Failed to unlock byte %d", off);
> +                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);

Don't know, why same logic is not applied here.. Probably I've missed from the previous discussion. Anyway, if it is intentional exclusion, not bad to mention it in commit message.

>                   return ret;
>               } else if (s) {
>                   s->locked_shared_perm &= ~bit;
> @@ -890,9 +908,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
>               ret = qemu_lock_fd_test(fd, off, 1, true);
>               if (ret) {
>                   char *perm_name = bdrv_perm_names(p);
> -                error_setg(errp,
> -                           "Failed to get \"%s\" lock",
> -                           perm_name);
> +                int err = -ret;
> +
> +                if (err == EAGAIN || err == EACCES) {
> +                    error_setg(errp, "Failed to get \"%s\" lock",
> +                               perm_name);

fit in one line

> +                } else {
> +                    error_setg_errno(errp, err,
> +                                     "Failed to get \"%s\" lock",
> +                                     perm_name);

fit in two lines..

> +                }
>                   g_free(perm_name);
>                   return ret;
>               }
> @@ -905,9 +930,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
>               ret = qemu_lock_fd_test(fd, off, 1, true);
>               if (ret) {
>                   char *perm_name = bdrv_perm_names(p);
> -                error_setg(errp,
> -                           "Failed to get shared \"%s\" lock",
> -                           perm_name);
> +                int err = -ret;
> +
> +                if (err == EAGAIN || err == EACCES) {
> +                    error_setg(errp, "Failed to get shared \"%s\" lock",
> +                               perm_name);
> +                } else {
> +                    error_setg_errno(errp, err,
> +                                     "Failed to get shared \"%s\" lock",
> +                                     perm_name);
> +                }
>                   g_free(perm_name);
>                   return ret;
>               }
> 

also, I don't see much benefit in creating additional "err" variable instead of just use ret, but it's a kind of taste..


-- 
Best regards,
Vladimir

