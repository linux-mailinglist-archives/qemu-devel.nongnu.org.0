Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9068B2D6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 00:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOoN1-0004BO-Ri; Sun, 05 Feb 2023 18:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoN0-0004BE-5r
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:24:26 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoMy-0007B8-NU
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 18:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UHL2XGnl8sblFZqP6vDBmrpDISPEE3GSFTJz5yVr5jI=; b=rrBgbG9rZ5jABjaUWpqmJjajDd
 0Lx1jtLdqjvKxa4/x2e3YlcdCOlc3Fr5u8eaL6ybF2clJcuelgntwWFF8HfD3irwFE8a1K0FKJ61I
 /5p6jSMQ5b+9Tdfr5CfGmTBcxiDTGxGUF8hVDIMXBQvYsMGlERlahjgxIbIFWHKCvm8KEmQX9k31A
 thhCIQuGa6J5IWzujp//p+kMbb6v4qeKoECS/YcIMRZLyB8+KA+XSfUPZ/uELeBz4jR/RHZvUyJZ3
 73U5tVjE7+ovD0JcVW8z5NWVZ0ZYBqXBoiC+yzrfYs6XMwWVym2aDm4uT6uiQrl5uls9PANwQzN2B
 Gy+kCiXy6xWXTC5cIrnzzjDOokVHvZRJt0+AAqovWaQ2TzhlsnCjdOwBor0tQduxZfcJvleiT1YQ3
 0e5RsDGKUMoxid/ZpMH6x2Qp5+zb55NHjbeFyT7vQe1iihXpMiCXfP1nKa0q1lsjfUk//Ey9T+9/W
 /TfEJMOZMwWHpPi9zpPp2H2uNAu+xzjp0gxg3utTmSX1X/ddN8tFJBucM8ndH6WXfnXa+/j9e/mDN
 f4JdAVl0o78aTTHFN9voIwCjbUhLzTCyR3H4EgXWN46jahSYsICHe64ypfgGmLnrfBYy2CLHwo+9G
 7LovPw3F4EPmREMIvsAq0vae3aaICbYK3MIrEoxJM=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoMT-0008Nb-Ll; Sun, 05 Feb 2023 23:23:53 +0000
Message-ID: <11a30f56-b1dc-ea1c-755c-d0c54d50c145@ilande.co.uk>
Date: Sun, 5 Feb 2023 23:24:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/14] linux-user/sparc: Handle missing traps
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/02/2023 00:51, Richard Henderson wrote:

> Lots of missing trap code for cpu_loop().
> 
> r~
> 
> Richard Henderson (14):
>    linux-user/sparc: Raise SIGILL for all unhandled software traps
>    linux-user/sparc: Tidy syscall trap
>    linux-user/sparc: Use TT_TRAP for flush windows
>    linux-user/sparc: Tidy window spill/fill traps
>    linux-user/sparc: Fix sparc64_{get,set}_context traps
>    linux-user/sparc: Handle software breakpoint trap
>    linux-user/sparc: Handle division by zero traps
>    linux-user/sparc: Handle getcc, setcc, getpsr traps
>    linux-user/sparc: Handle priviledged opcode trap
>    linux-user/sparc: Handle privilidged action trap

Minor spelling nit: s/priviledged/privileged/

>    linux-user/sparc: Handle coprocessor disabled trap
>    linux-user/sparc: Handle unimplemented flush trap
>    linux-user/sparc: Handle floating-point exceptions
>    linux-user/sparc: Handle tag overflow traps
> 
>   linux-user/sparc/target_signal.h |   2 +-
>   linux-user/syscall_defs.h        |   5 +
>   target/sparc/cpu.h               |   3 +-
>   linux-user/sparc/cpu_loop.c      | 170 +++++++++++++++++++++++++------
>   linux-user/sparc/signal.c        |  36 +++----
>   5 files changed, 167 insertions(+), 49 deletions(-)

Alas I'm not overly familiar with the Linux syscall implementation on SPARC (all I 
can really do is run a chroot debian ports install for testing), however if all your 
local tests pass then I'm happy for this to go via the tcg or linux-user trees.


ATB,

Mark.

