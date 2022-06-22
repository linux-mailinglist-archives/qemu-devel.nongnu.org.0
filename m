Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A700555469
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:28:13 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o461L-0002sY-TH
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o45zJ-0000iZ-Qw
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:26:08 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:37943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o45zF-0000nu-Ae
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:26:05 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 503863D3B053
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 21:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655925957;
 bh=drWARR3T+Cfo8RQsBEZEhtLwzlJFDElyFdxZ59IGYxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=p4IYVLmb9lUetKYr7fpP9QT6Y106jfw8a3LcQFz6JJnVpAPmyopxfIoNlOxU/gIWe
 h/91n5ErjgFbCWITSEpGs8VRZVWIMyet+YePK2+DeQjw/VDnJokfmjKP9RHcKyjD0b
 mRujkrpcjEND5CnycpS+wG4d8TMVgcfUE7mf4d/I=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id 0039F3D3B04D; Wed, 22 Jun 2022 21:25:57 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 6F5403D3B020; Wed, 22 Jun
 2022 21:25:56 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 54ECB27E04CD; Wed, 22 Jun 2022
 21:25:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 3A58D27E04EF; Wed, 22 Jun 2022 21:25:56 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 qJ6yfRZGrY1D; Wed, 22 Jun 2022 21:25:56 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 1CE9527E04CD; Wed, 22 Jun 2022 21:25:56 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <df7.62b36cc4.6edfd.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 3A58D27E04EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655925956;
 bh=1XGAegQxjo/S1iUivxCzCGLF/3aD9JNjBOEAlw3nGQc=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=E51wUlIA5Uk3eR21DLqINK/UTIzaqAELX/1HDQ5C/lh92NedxQOI54PJ/URnqELwn
 IYVk8tfolE9KrDAgEz0We1Uo+1bflbtKCr9mY4mwkT08UVl0zjbdl2WjnZw1SI/MkG
 CVPj/C9CAK3ZEyY1gzq2Qih0mvUZfxc1btC+O4O0=
Date: Wed, 22 Jun 2022 21:25:55 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 29/53] semihosting: Split out semihost_sys_read
Message-ID: <20220622192555.GH28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-30-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-30-richard.henderson@linaro.org>
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
> Split out the non-ARM specific portions of SYS_READ to a
> reusable function.  This handles all GuestFD.  Isolate the
> curious ARM-specific return value processing to a new
> callback, common_semi_rw_cb.
> 
> Note that gdb_do_syscall %x reads target_ulong, not int.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/semihosting/syscalls.h |  8 ++++
>  semihosting/arm-compat-semi.c  | 85 ++++++++--------------------------
>  semihosting/syscalls.c         | 85 ++++++++++++++++++++++++++++++++++
>  3 files changed, 113 insertions(+), 65 deletions(-)
> 

[...]

> +/*
> + * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
> + * There is no error condition, other than returning the original length.
> + */
> +static void common_semi_rw_cb(CPUState *cs, target_ulong ret, target_ulong err)
> +{
> +    /* Recover the original length from the third argument. */
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    target_ulong args = common_semi_arg(cs, 1);
> +    target_ulong arg2;
> +    GET_ARG(2);
> +
> +    if (err) {
> + do_fault:
Leftover label?

otherwise:

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> +        ret = 0; /* error: no bytes transmitted */
> +    }
> +    common_semi_set_ret(cs, arg2 - ret);
> +}
> +





