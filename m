Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0FD677623
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrwW-0008Ln-SI; Mon, 23 Jan 2023 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJrwQ-0008L1-Lx
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:12:34 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJrwN-0006X1-51
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674461545; bh=p8ulmXgZ9RBE/jexZblwA84yjbUSTxQ/r26a0DmSiXc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xgWtM/suxpSc5s2FOlwDrqVYZtGZ3A/gpsV+8cZvdFhwedONrrehiHu3IqEtzM86d
 UVI5uLYC4dP8TRy6TlTueO2Qo6ZurJLIIEZ1P///ubkzhNCNnIrFcXtSByKApdiNkx
 fq4JJv14w/GA6f/J/ZckMj+V/n0ov3/EoOopY4hY=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C88D260199;
 Mon, 23 Jan 2023 16:12:25 +0800 (CST)
Message-ID: <518f2eb9-161f-eeee-3666-d822bb0bd376@xen0n.name>
Date: Mon, 23 Jan 2023 16:12:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 10/10] tcg/loongarch64: Reorg goto_tb implementation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-11-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
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

On 1/18/23 09:11, Richard Henderson wrote:
> The old implementation replaces two insns, swapping between
>
>          b       <dest>
>          nop
> and
>          pcaddu18i tmp, <dest>
>          jirl      zero, tmp, <dest> & 0xffff
>
> There is a race condition in which a thread could be stopped at
> the jirl, i.e. with the top of the address loaded, and when
> restarted we have re-linked to a different TB, so that the top
> half no longer matches the bottom half.
>
> Note that while we never directly re-link to a different TB, we
> can link, unlink, and link again all while the stopped thread
> remains stopped.
>
> The new implementation replaces only one insn, swapping between
>
>          b       <dest>
> and
>          pcadd   tmp, <jmp_addr>
>
> falling through to load the address from tmp, and branch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.h     |  7 +---
>   tcg/loongarch64/tcg-target.c.inc | 72 ++++++++++++++------------------
>   2 files changed, 33 insertions(+), 46 deletions(-)

I've tested this on my 3A5000 box and things seem to work, thanks.

Reviewed-by: WANG Xuerui <git@xen0n.name>


