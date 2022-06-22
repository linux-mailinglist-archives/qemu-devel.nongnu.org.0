Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCC555497
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:35:44 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o468d-0002nY-Sm
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o463i-0007dU-Mk
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:30:38 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o463O-0001PE-Hj
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:30:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id D3D773D3B062
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 21:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655926215;
 bh=6C2BeI41OAkLFVQ4cILetGlA2Y8uqwC1l4mZzQF5Wqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=z4oxpejVl/TMEZ31/KzV4ualviZtIwfUqQRhcQ+yGZ48FHM+kYwfTvmBg7pnrsiWO
 gygE0+juvXgaGLZJPWSRDUyN3cT/G4R1Y/dVXCC46XnVjVsgxfCYy7rypUQjmXxo77
 I+cYeW1piOOyoNuZYT2LCq7OARNOSbJUGztQrYN0=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id 851FB3D3B020; Wed, 22 Jun 2022 21:30:15 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 00F373D3B062; Wed, 22 Jun
 2022 21:30:15 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id DB87F27E04F3; Wed, 22 Jun 2022
 21:30:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id C62C127E04EF; Wed, 22 Jun 2022 21:30:14 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 Pyv6h1yta57D; Wed, 22 Jun 2022 21:30:14 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id A849C27E04CD; Wed, 22 Jun 2022 21:30:14 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <46c0.62b36dc7.3ec.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C62C127E04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655926214;
 bh=xDbhPbYZVTMvJ+pPOYAAkpPiAFCI/iTeaZSk8NPwpFM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=amss+i+4QFqF6VnKl5YeMaBnT+1NNooVreHR4ISr5MryjZC8xQ8alQWqqYt3U4qVx
 HyYsKgOLDQd7BxA19VVuSiYiW7TCosrnYVjm5AcUND31K1wivSyoQAUoip2ma27KnQ
 a/c1qkRpPufwsIHMIHcSy8VYGL0//DRBvTSNv24k=
Date: Wed, 22 Jun 2022 21:30:14 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 31/53] semihosting: Bound length for
 semihost_sys_{read, write}
Message-ID: <20220622193014.GJ28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-32-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-32-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.42; envelope-from=lmichel@kalray.eu;
 helo=mxout.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Fixes a minor bug in which a 64-bit guest on a 32-bit host could
> truncate the length.  This would only ever cause a problem if
> there were no bits set in the low 32, so that it truncates to 0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  semihosting/syscalls.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 5cb12d6adc..eefbae74f1 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -283,6 +283,14 @@ void semihost_sys_close(CPUState *cs, gdb_syscall_complete_cb complete, int fd)
>  void semihost_sys_read_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>                            GuestFD *gf, target_ulong buf, target_ulong len)
>  {
> +    /*
> +     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
> +     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
> +     * idea to do this unconditionally.
> +     */
> +    if (len > INT32_MAX) {
> +        len = INT32_MAX;
> +    }
>      switch (gf->type) {
>      case GuestFDGDB:
>          gdb_read(cs, complete, gf, buf, len);
> @@ -313,6 +321,14 @@ void semihost_sys_read(CPUState *cs, gdb_syscall_complete_cb complete,
>  void semihost_sys_write_gf(CPUState *cs, gdb_syscall_complete_cb complete,
>                             GuestFD *gf, target_ulong buf, target_ulong len)
>  {
> +    /*
> +     * Bound length for 64-bit guests on 32-bit hosts, not overlowing ssize_t.
> +     * Note the Linux kernel does this with MAX_RW_COUNT, so it's not a bad
> +     * idea to do this unconditionally.
> +     */
> +    if (len > INT32_MAX) {
> +        len = INT32_MAX;
> +    }
>      switch (gf->type) {
>      case GuestFDGDB:
>          gdb_write(cs, complete, gf, buf, len);
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=17321.629fcd3b.c73a0.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+31%2F53%5D+semihosting%3A+Bound+length+for+semihost_sys_%7Bread%2C+write%7D&verdict=C&c=7f9ee3dfa94cc38c566bd57258d2a28de21afd3e
> 

-- 





