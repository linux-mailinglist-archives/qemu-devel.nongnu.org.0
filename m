Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EA483AE4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 04:15:00 +0100 (CET)
Received: from localhost ([::1]:36936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4aHr-00042H-Jf
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 22:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n4aGq-0003Lz-4T
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 22:13:56 -0500
Received: from mail.xen0n.name ([115.28.160.31]:42616
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n4aGn-0001Ba-0A
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 22:13:55 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BB72460106;
 Tue,  4 Jan 2022 11:13:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641266020; bh=+pTygHvSQsDgTljLBJnKu99i/37wMhu0mrVnWv6Wc7Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nTPT+8vcwbvRBfzl4Eq5KiOYNUZlU9b6McXvZB+ArGwaBUN0HrCofmGWjYS5yl1v7
 oNE81JHPuxy1ZXFLsHhJ4ElSJf2RVcrv5AwQTS3z3hMvGkBtr+FfDWw2tNpBA3oYw5
 DItt/p89iaralqz+W8oz1PLkK2qGGycm4DSAmXEA=
Message-ID: <5fbc94b8-070c-9d5d-add7-c55943d9b043@xen0n.name>
Date: Tue, 4 Jan 2022 11:13:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v4 0/7] Unaligned access for user only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104021543.396571-1-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220104021543.396571-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 1/4/22 10:15, Richard Henderson wrote:
> Version 3 was way back in August:
>
> https://lore.kernel.org/qemu-devel/20210818191920.390759-1-richard.henderson@linaro.org/
>
> Quite a few of the patches in there have been merged, but not all.
>
> Based-on: <20211227150127.2659293-1-richard.henderson@linaro.org>
>
> There are follow-on patch sets for arm, mips, and sparc, which I
> will be refreshing soon.  Xuerui, I believe that tcg/loongarch
> should be as simple as one of these five.
Thanks for the heads-up; I'll take care of implementing the loongarch64 
part in this week (or maybe next week in case of $DAY_JOB).
>
>
> r~
>
>
> Richard Henderson (7):
>    tcg/i386: Support raising sigbus for user-only
>    tcg/aarch64: Support raising sigbus for user-only
>    tcg/ppc: Support raising sigbus for user-only
>    tcg/riscv: Support raising sigbus for user-only
>    tcg/s390x: Support raising sigbus for user-only
>    tcg/tci: Support raising sigbus for user-only
>    tests/tcg/multiarch: Add sigbus.c
>
>   tcg/aarch64/tcg-target.h     |   2 -
>   tcg/i386/tcg-target.h        |   2 -
>   tcg/ppc/tcg-target.h         |   2 -
>   tcg/riscv/tcg-target.h       |   2 -
>   tcg/s390x/tcg-target.h       |   2 -
>   tcg/tci.c                    |  20 +++++--
>   tests/tcg/multiarch/sigbus.c |  68 +++++++++++++++++++++++
>   tcg/aarch64/tcg-target.c.inc |  91 +++++++++++++++++++++++++------
>   tcg/i386/tcg-target.c.inc    | 103 +++++++++++++++++++++++++++++++++--
>   tcg/ppc/tcg-target.c.inc     |  98 ++++++++++++++++++++++++++++++---
>   tcg/riscv/tcg-target.c.inc   |  63 ++++++++++++++++++++-
>   tcg/s390x/tcg-target.c.inc   |  59 +++++++++++++++++++-
>   12 files changed, 462 insertions(+), 50 deletions(-)
>   create mode 100644 tests/tcg/multiarch/sigbus.c
>

