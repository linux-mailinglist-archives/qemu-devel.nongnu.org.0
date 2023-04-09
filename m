Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67836DC07D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:57:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWT4-00018z-Fb; Sun, 09 Apr 2023 10:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plWT0-00018Z-At
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:56:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1plWSy-0003Me-8J
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:56:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A521F4000C;
 Sun,  9 Apr 2023 17:56:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 97BBCDD;
 Sun,  9 Apr 2023 17:56:23 +0300 (MSK)
Message-ID: <34b08e57-fab3-4008-0a8b-e7079a541756@msgid.tls.msk.ru>
Date: Sun, 9 Apr 2023 17:56:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: qemu-user: avoid allocations to convert stuff when not necessary
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
References: <cd93a0e0-6047-c511-9b96-35bf4e0adce0@msgid.tls.msk.ru>
 <CANCZdfrcKrj3vLpKRjACwiCnNjc1JfCyNNpLP8Lw4zv9Qhxo2w@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CANCZdfrcKrj3vLpKRjACwiCnNjc1JfCyNNpLP8Lw4zv9Qhxo2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -97
X-Spam_score: -9.8
X-Spam_bar: ---------
X-Spam_report: (-9.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.888,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

09.04.2023 17:04, Warner Losh пишет:
> On Sun, Apr 9, 2023 at 2:53 AM Michael Tokarev <mjt@tls.msk.ru <mailto:mjt@tls.msk.ru>> wrote:
> 
>     Hi!
> 
>     In the qemu-user case, we allocate various structures and arrays
>     for conversion of data between host and guest byte orders and sizes.
>     But it is actually not necessary to do such allocation when the
>     *size* is the same, and only byte order is different, because the
>     conversion can be done in-place.  Does it make any sense to avoid'
>     allocations in such cases?
> 
>     There are 2 issues with this though. First is that in some cases,
>     the data being converted is const, and we may end up writing to a
>     data resides in a read-only segment, is it ever possible?  And
>     second - it is not entirely clear what to do in case the syscall
>     returned error.
> 
> 
> I don't think you can reliably do it in place. What if another thread in the
> guest reads the data after you've converted it? It will get the wrong answer.
> I think you have to copy when endian mismatches, just like when alignment,
> data size or layout differences are present. You'd need to convert it back
> after the system call as well, which can cause problems, especially
> if the system call needs multiple steps to emulate for whatever reason.

Han. I thought more about syscalls which accept in-out parameters.
Such as poll(fd, n, pfd) which uses pfd array for both input and
output. Or just for output, like getgroups() - for this one, if
sizeof(gid_t) == sizeof(target_gid_t), there's no need to allocate
anything, the supplied array can be used, and we need just a loop
after syscall returned, to convert each gid_t to target_gid_t.

For pure-input syscalls, like setgroups(), it is better to perform
allocation IMHO. If not only to avoid a case when RO-segment is
used.

/mjt

