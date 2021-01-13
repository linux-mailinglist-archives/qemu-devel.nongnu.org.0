Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8D82F48D8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:43:28 +0100 (CET)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdcd-0005rb-3X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kzdao-0005LU-DN
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:41:34 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kzdam-0002ph-ES
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:41:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id a12so1553912wrv.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=tu35VzUQWr+f+uN8h5LfxWhgJYuXy5EKa1lYD7bLwdw=;
 b=OT/r76GvB8EOwEhf+BNAJO0DUOKZDVwkunsdMgQZs61cygRLPNs26cjmZvbCObXEKN
 du1gYtCXYmrliAN5SzWNOHK8FQ2cV4eEcsAUgTCRwTV5rTxVbpe6YD8UpAKdCxgKI3LA
 UidQF0bpgXmKBmfQZ+q1aaj4LllnlYncZV46PGti5KEkrMIg24/9fVBFFSzL8ocIwvDZ
 e4xAdBHZw7vihtNvNuCsnNyIncvb0kIQ68xdS3ojlfRA16vWa73TLxkKRhLJUvpRy8wu
 m1v8wGXQm80e9fAQsXJrTZhe6FujuFr6rh1P0fr5rCg2uD0Y7Fa+pwVCiTP+/nbHtBxg
 akVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=tu35VzUQWr+f+uN8h5LfxWhgJYuXy5EKa1lYD7bLwdw=;
 b=kculrhMHpYvs8Oeg4r68WtVaT+xnM3I9twDBbUlQCrCYCBxELPV2TMmBlkpLT2lhv0
 4Esl5ZH26UT9ILuikTrwvqeBepEnu1iNfxDIAeH/09gGa0bXsj9RqcR+H0+Ta8UGxGo9
 eNFRz1R2ZB3+ZYY2msgbR2AdkTOKpAAhLuXNMivQZfGUtk+m/3/iAVQK9Fcuf374py6M
 cIwpCGwRCkNaSobyiar1GmU85bZj00zXFQaVi/zQjwTcdLiJhYWW0mDFSPiQ2XYQqvxi
 rv8SnFo9ib67fOKrpmbgsmLtbmBhig3v1v/x85uFj6CzRDLo01/G8FW73Z3cnJ8Nbfda
 uQJQ==
X-Gm-Message-State: AOAM532lFL3w8UEWIh0hWrt/n5URa6MQeAcGkpor2pGP0LnEe8oaps4A
 J6qO7I0O7HZNW6ZsxGb/Y5Q3Ow==
X-Google-Smtp-Source: ABdhPJzqAcRqvSnwwkNfKc1xxG0W6/rB1xKtM1QGtT4zq3IooYm0qlBTUm1Lppm8dp4bwlqNsyfuaA==
X-Received: by 2002:a5d:60c1:: with SMTP id x1mr1867831wrt.271.1610534490249; 
 Wed, 13 Jan 2021 02:41:30 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id l11sm2448515wrt.23.2021.01.13.02.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 02:41:29 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 348c33b9;
 Wed, 13 Jan 2021 10:41:29 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4] block: report errno when flock fcntl fails
In-Reply-To: <ecee2467-1687-1ed5-b3a4-4e31ae39acb8@virtuozzo.com>
References: <20210112152726.2217792-1-david.edmondson@oracle.com>
 <ecee2467-1687-1ed5-b3a4-4e31ae39acb8@virtuozzo.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Nils Frahm - Spaces: For - Peter - Toilet Brushes - More
Date: Wed, 13 Jan 2021 10:41:28 +0000
Message-ID: <cunr1mpm84n.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::430;
 envelope-from=dme@dme.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-13 at 13:26:48 +03, Vladimir Sementsov-Ogievskiy wrote:

> 12.01.2021 18:27, David Edmondson wrote:
>> When a call to fcntl(2) for the purpose of manipulating file locks
>> fails with an error other than EAGAIN or EACCES, report the error
>> returned by fcntl.
>> 
>> EAGAIN or EACCES are elided as they are considered to be common
>> failures, indicating that a conflicting lock is held by another
>> process.
>> 
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>> v3:
>> - Remove the now unnecessary updates to the test framework (Max).
>> - Elide the error detail for EAGAIN or EACCES when locking (Kevin,
>>    sort-of Max).
>> - Philippe and Vladimir sent Reviewed-by, but things have changed
>>    noticeably, so I didn't add them (dme).
>> 
>> v4:
>> - Really, really remove the unnecessary updates to the test framework.
>> 
>>   block/file-posix.c | 52 +++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 42 insertions(+), 10 deletions(-)
>> 
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 00cdaaa2d4..c5142f7ffa 100644
>
> Hmm, not it looks like too much code duplication. Maybe, we can add a helper macro, like
>
> #define raw_lock_error_setg_errno(errp, os_error, fmt, ...) \
>    do {
>      if (err == EAGAIN || err == EACCES) {
>        error_setg((errp), (fmt), ## __VA_ARGS__);
>      } else {
>        error_setg_errno((errp), (os_error), (fmt), ## __VA_ARGS__);
>      }
>    } while (0)
>
> We can't make a helper function instead, as error_setg_errno is already a macro and it wants to use __LINE__..
>
> But I think that macro is better than duplication anyway.

Okay.

>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -836,7 +836,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>>           if ((perm_lock_bits & bit) && !(locked_perm & bit)) {
>>               ret = qemu_lock_fd(fd, off, 1, false);
>>               if (ret) {
>> -                error_setg(errp, "Failed to lock byte %d", off);
>> +                int err = -ret;
>> +
>> +                if (err == EAGAIN || err == EACCES) {
>> +                    error_setg(errp, "Failed to lock byte %d", off);
>> +                } else {
>> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
>> +                }
>>                   return ret;
>>               } else if (s) {
>>                   s->locked_perm |= bit;
>> @@ -844,7 +850,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>>           } else if (unlock && (locked_perm & bit) && !(perm_lock_bits & bit)) {
>>               ret = qemu_unlock_fd(fd, off, 1);
>>               if (ret) {
>> -                error_setg(errp, "Failed to unlock byte %d", off);
>> +                int err = -ret;
>> +
>> +                if (err == EAGAIN || err == EACCES) {
>> +                    error_setg(errp, "Failed to lock byte %d", off);
>
> s/lock/unlock
>
>> +                } else {
>> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
>
> and here.
>
> Which proves, that code duplication is a bad idea in general :)

Ouch. Will fix.

>
>> +                }
>>                   return ret;
>>               } else if (s) {
>>                   s->locked_perm &= ~bit;
>> @@ -857,7 +869,13 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>>           if ((shared_perm_lock_bits & bit) && !(locked_shared_perm & bit)) {
>>               ret = qemu_lock_fd(fd, off, 1, false);
>>               if (ret) {
>> -                error_setg(errp, "Failed to lock byte %d", off);
>> +                int err = -ret;
>> +
>> +                if (err == EAGAIN || err == EACCES) {
>> +                    error_setg(errp, "Failed to lock byte %d", off);
>> +                } else {
>> +                    error_setg_errno(errp, err, "Failed to lock byte %d", off);
>> +                }
>>                   return ret;
>>               } else if (s) {
>>                   s->locked_shared_perm |= bit;
>> @@ -866,7 +884,7 @@ static int raw_apply_lock_bytes(BDRVRawState *s, int fd,
>>                      !(shared_perm_lock_bits & bit)) {
>>               ret = qemu_unlock_fd(fd, off, 1);
>>               if (ret) {
>> -                error_setg(errp, "Failed to unlock byte %d", off);
>> +                error_setg_errno(errp, -ret, "Failed to unlock byte %d", off);
>
> Don't know, why same logic is not applied here.. Probably I've missed from the previous discussion. Anyway, if it is intentional exclusion, not bad to mention it in commit message.

From the documentation, it didn't seem to make sense that the unlock
case would generate EAGAIN or EACCES for "someone is already holding the
lock", so neither should be elided.

I can add a note in the commit message.

>>                   return ret;
>>               } else if (s) {
>>                   s->locked_shared_perm &= ~bit;
>> @@ -890,9 +908,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
>>               ret = qemu_lock_fd_test(fd, off, 1, true);
>>               if (ret) {
>>                   char *perm_name = bdrv_perm_names(p);
>> -                error_setg(errp,
>> -                           "Failed to get \"%s\" lock",
>> -                           perm_name);
>> +                int err = -ret;
>> +
>> +                if (err == EAGAIN || err == EACCES) {
>> +                    error_setg(errp, "Failed to get \"%s\" lock",
>> +                               perm_name);
>
> fit in one line
>
>> +                } else {
>> +                    error_setg_errno(errp, err,
>> +                                     "Failed to get \"%s\" lock",
>> +                                     perm_name);
>
> fit in two lines..
>
>> +                }
>>                   g_free(perm_name);
>>                   return ret;
>>               }
>> @@ -905,9 +930,16 @@ static int raw_check_lock_bytes(int fd, uint64_t perm, uint64_t shared_perm,
>>               ret = qemu_lock_fd_test(fd, off, 1, true);
>>               if (ret) {
>>                   char *perm_name = bdrv_perm_names(p);
>> -                error_setg(errp,
>> -                           "Failed to get shared \"%s\" lock",
>> -                           perm_name);
>> +                int err = -ret;
>> +
>> +                if (err == EAGAIN || err == EACCES) {
>> +                    error_setg(errp, "Failed to get shared \"%s\" lock",
>> +                               perm_name);
>> +                } else {
>> +                    error_setg_errno(errp, err,
>> +                                     "Failed to get shared \"%s\" lock",
>> +                                     perm_name);
>> +                }
>>                   g_free(perm_name);
>>                   return ret;
>>               }
>> 
>
> also, I don't see much benefit in creating additional "err" variable instead of just use ret, but it's a kind of taste..

Okay.

dme.
-- 
Tonight I'm gonna bury that horse in the ground.

