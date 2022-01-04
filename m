Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C3484232
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:18:05 +0100 (CET)
Received: from localhost ([::1]:51436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jhU-0005Ts-89
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1n4jeY-0003Mn-1i; Tue, 04 Jan 2022 08:15:02 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48058
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1n4jeU-0000pq-8w; Tue, 04 Jan 2022 08:15:01 -0500
Received: from [100.100.57.236] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id EF45C60106;
 Tue,  4 Jan 2022 21:14:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641302092; bh=R1M7dQvOca5gqz1U2iE/VVkUddkWR3CkiLZSHoUo8JI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kDPtKx3sZWx6iMwPR/4CIh7d2nKDLoSd1RtSeyRxvk8VewXnOIV2o7p0qa6UWOgme
 d02mSmioReN0L3wfNXmP2OPUNdz51mSkKRNOD5vC1TqGXBp9+jppL4rj7XDDbaVaCk
 rwurxXaP2ZSeDXuB6R0WEk3lrIfJaHOhoCnk+UHA=
Message-ID: <f4ef50ec-0804-fdd0-108e-d4584294a29d@xen0n.name>
Date: Tue, 4 Jan 2022 21:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:97.0)
 Gecko/20100101 Thunderbird/97.0a1
Subject: Re: [PATCH] linux-user: Fix trivial build error on loongarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104130217.2144929-1-f4bug@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220104130217.2144929-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/1/4 21:02, Philippe Mathieu-Daudé wrote:

> When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:
>
>   In file included from ../linux-user/signal.c:33:
>   ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
>   ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
>          uint32_t sel = (insn >> 15) & 0b11111111111;
>          ^~~~~~~~
>
> We don't use the 'sel' variable more than once, so drop it.
>
> Meson output for the record:
>
>   Host machine cpu family: loongarch64
>   Host machine cpu: loongarch64
>   C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
>   C linker for the host machine: cc ld.bfd 2.31.1-system
So this issue indeed only happens on the Loongson-provided toolchain
with the ancient 8.3.0 version of gcc, after all... I'd have to admit
that I was initially reluctant to even investigate this, given the
tendency of Loongson people not verifying things on upstream versions of
their own work, but...
>
> Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
> Reported-by: Song Gao <gaosong@loongson.cn>
> Suggested-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/host/loongarch64/host-signal.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
> index 05e2c823717..7effa242515 100644
> --- a/linux-user/host/loongarch64/host-signal.h
> +++ b/linux-user/host/loongarch64/host-signal.h
> @@ -54,9 +54,7 @@ static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>          }
>          break;
>      case 0b001110: /* indexed, atomic, bounds-checking memory operations */
> -        uint32_t sel = (insn >> 15) & 0b11111111111;
> -
> -        switch (sel) {
> +        switch ((insn >> 15) & 0b11111111111) {
>          case 0b00000100000: /* stx.b */
>          case 0b00000101000: /* stx.h */
>          case 0b00000110000: /* stx.w */

the fix is obvious enough, doesn't harm readability, and solves a real
problem for some (their toolchain being outdated is not their fault,
rather Loongson's).

So after fixing the commit message:

Reviewed-by: WANG Xuerui <git@xen0n.name>

(Or do I just collect this patch and fix the commit message myself,
sending a pull request later? I'm new to QEMU maintenance procedure and
I'm still not quite sure if it is too heavyweight to have you send v2
for just a single typo and R-b tag collection.)


