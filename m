Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB241A1DF3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 11:14:30 +0200 (CEST)
Received: from localhost ([::1]:32776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jM6mz-0001AE-Dp
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 05:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1jM6lD-0007Ok-Tj
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 05:12:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1jM6lC-0002tn-HZ
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 05:12:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34466 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1jM6lB-0002q9-WF
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 05:12:38 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4DF4658F5B653A37508C;
 Wed,  8 Apr 2020 17:12:27 +0800 (CST)
Received: from [10.133.205.53] (10.133.205.53) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 8 Apr 2020
 17:12:24 +0800
Subject: Re: [RFC PATCH 0/4] async: fix hangs on weakly-ordered architectures
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <20200407140746.8041-1-pbonzini@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <047d4327-8a79-ffc1-94fe-47355ed955c5@huawei.com>
Date: Wed, 8 Apr 2020 17:12:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200407140746.8041-1-pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/4/7 22:07, Paolo Bonzini wrote:
> ARM machines and other weakly-ordered architectures have been suffering
> for a long time from hangs in qemu-img and qemu-io.  For QEMU binaries
> these are mitigated by the timers that sooner or later fire in the main
> loop, but these will not happen for the tools and probably not with I/O
> threads either.
yes, we occasionally see qemu main thread hangs and VM stuck in in-shutdown
state on aarch64 platform. So this could happen with I/O threads.
> 
> The fix is in patch 5.  Patch 1-3 are docs updates that explain the bug,
> and patch 4 is a bugfix exposed by the new patch.
> 
> Paolo
> 
> Paolo Bonzini (5):
>    atomics: convert to reStructuredText
>    atomics: update documentation
>    rcu: do not mention atomic_mb_read/set in documentation
>    aio-wait: delegate polling of main AioContext if BQL not held
>    async: use explicit memory barriers
> 
>   docs/devel/atomics.rst   | 501 +++++++++++++++++++++++++++++++++++++++
>   docs/devel/atomics.txt   | 403 -------------------------------
>   docs/devel/index.rst     |   1 +
>   docs/devel/rcu.txt       |   4 +-
>   include/block/aio-wait.h |  22 ++
>   include/block/aio.h      |  29 +--
>   util/aio-posix.c         |  16 +-
>   util/aio-win32.c         |  17 +-
>   util/async.c             |  16 +-
>   9 files changed, 576 insertions(+), 433 deletions(-)
>   create mode 100644 docs/devel/atomics.rst
>   delete mode 100644 docs/devel/atomics.txt
> 

