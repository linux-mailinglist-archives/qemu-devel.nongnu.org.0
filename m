Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515133EC0BA
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 07:28:54 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmE0-0000yx-Ta
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 01:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1mEmDA-0008SE-6E; Sat, 14 Aug 2021 01:28:00 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:47690
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1mEmD8-0006To-NR; Sat, 14 Aug 2021 01:27:59 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Gmppl5ZQKz8PbN;
 Sat, 14 Aug 2021 01:27:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=P2v4hX7Is
 ofpK5s/HyQ1A9YMtj8=; b=eYDAd6SuR2oNjfyJvbgCBdxcMVAwueJX6BMogaZrd
 armj+JfyWcDir+FVNLBELWmc5H1RLkF4bbMGRhWLs64zKvmi1l8j4pCFT0v4Jngt
 IWLCX4WN59tBHSxmGRVSr20CL7wEj8agHO0RYxfHpRWJbirWxhIohRbErEwlHysn
 jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Fv1
 uo5t8nbW72GixiPYq3LWXhMNAPPa6RbcLvftcdySxsRbchlMs3U6CegBrfftZ2gB
 fAurl2yAyjqDSBbWILdcrNy+DZSEN1o8pHZEByu08kKSXf5+uVP4ZoPl2W1r96W7
 cb2Kr7QeD4ZD0lIN80vugNfyygDK7a4yFCLSQNlM=
Received: from [IPV6:2001:470:b050:6:a99d:8475:6cbb:a6b4] (unknown
 [IPv6:2001:470:b050:6:a99d:8475:6cbb:a6b4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Gmppl28CHz8PbK;
 Sat, 14 Aug 2021 01:27:43 -0400 (EDT)
Message-ID: <6ac76093-f760-9d41-d924-bc07cca07a3f@comstyle.com>
Date: Sat, 14 Aug 2021 01:27:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Subject: Re: [PATCH 00/11] Fixes for clang-13 plus tcg/ppc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/12/2021 5:55 PM, Richard Henderson wrote:
> The goal here was to address Brad's report for clang vs ppc32.
>
> Somewhere in between here and there I forgot about the ppc32 part,
> needed a newer clang for gcc135, accidentally built master instead
> of the clang-12 release branch, fixed a bunch of buggy looking
> things, and only then remembered I was building ppc64 and wasn't
> going to test what I thought I would.
>
> So: Brad, could you double-check this fixes your problem?

Yes, this does. Thank you.

> Others: Only patch 7 obviously should have been using the
> variable indicated as unused.  But please double-check.
>
>
> r~
>
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Brad Smith <brad@comstyle.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: qemu-block@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>
> Richard Henderson (11):
>    nbd/server: Remove unused variable
>    accel/tcg: Remove unused variable in cpu_exec
>    util/selfmap: Discard mapping on error
>    net/checksum: Remove unused variable in net_checksum_add_iov
>    hw/audio/adlib: Remove unused variable in adlib_callback
>    hw/ppc/spapr_events: Remove unused variable from check_exception
>    hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
>    linux-user/syscall: Remove unused variable from execve
>    tests/unit: Remove unused variable from test_io
>    tcg/ppc: Replace TCG_TARGET_CALL_DARWIN with _CALL_DARWIN
>    tcg/ppc: Ensure _CALL_SYSV is set for 32-bit ELF
>
>   accel/tcg/cpu-exec.c     |  3 ---
>   hw/audio/adlib.c         |  3 +--
>   hw/pci-host/pnv_phb4.c   |  2 +-
>   hw/ppc/spapr_events.c    |  5 -----
>   linux-user/syscall.c     |  3 ---
>   nbd/server.c             |  4 ----
>   net/checksum.c           |  4 +---
>   tests/unit/test-iov.c    |  5 +----
>   util/selfmap.c           | 28 ++++++++++++++++------------
>   tcg/ppc/tcg-target.c.inc | 25 ++++++++++++++++++++-----
>   10 files changed, 40 insertions(+), 42 deletions(-)
>

