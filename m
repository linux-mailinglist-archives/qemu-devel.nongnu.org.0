Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19655945E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:52:55 +0200 (CEST)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4e7a-0000iv-3H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4e6S-0008OZ-Vf
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:51:45 -0400
Received: from smtpout30.security-mail.net ([85.31.212.35]:28977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4e6Q-0007ty-4U
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 03:51:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx305.security-mail.net (Postfix) with ESMTP id F299430FE8E
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 09:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656057099;
 bh=WKz+HxvNfyMoafGwPt74GdwDZmOH/v/P9R4rUglXgJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=u26qJTzsU4NRL3xW5tmRhsXMGNoDAqQMQEyM9f15SROwQzlV+tiZg+mg69Qebt3QU
 BxVUG1yDgsXasiDIfvPd2UPyuPA8TFB9NdrQsEpd0GLmmOKW+cZNd8zipwqf0lRYZv
 6sL1/YO8R2cmzJA40KfQW6tZQ8eqrrAsuJsSUaxI=
Received: from fx305 (localhost [127.0.0.1]) by fx305.security-mail.net
 (Postfix) with ESMTP id 827B730FE71; Fri, 24 Jun 2022 09:51:38 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx305.security-mail.net (Postfix) with ESMTPS id BD4DC30FE61; Fri, 24 Jun
 2022 09:51:37 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 90D2827E04FD; Fri, 24 Jun 2022
 09:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 7ADA127E04FB; Fri, 24 Jun 2022 09:51:37 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 jzVMZ31lP8yp; Fri, 24 Jun 2022 09:51:37 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 6164127E04F8; Fri, 24 Jun 2022 09:51:37 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <b567.62b56d09.b1f39.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7ADA127E04FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656057097;
 bh=URt4sOpVOkAdl0lnewoUgoZVQsaruzCTf6RzUC61WhI=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=C50F3C2DwtHZSnpj4hqgwV6DNuEPGppc8HEr6HeBpg0U9DY+xW1YdK2OlHVeVdREP
 nLQFfLwHWr0ygjxjM4GUA3/qDazXxzRrhYrMddnl22PEg9Tb40yE7FV3dv5Ip8fmvG
 tzxN+kfB8S7z3ziu6sooz+eH3vtLOF00IKfFsFwU=
Date: Fri, 24 Jun 2022 09:51:36 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 37/53] semihosting: Split out semihost_sys_system
Message-ID: <20220624075136.GD25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-38-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-38-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.35; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
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
> Split out the non-ARM specific portions of SYS_SYSTEM to a
> reusable function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/syscalls.h |  3 +++
>  semihosting/arm-compat-semi.c  | 12 +---------
>  semihosting/syscalls.c         | 40 ++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/include/semihosting/syscalls.h b/include/semihosting/syscalls.h
> index 21430aa0ef..c9f9e66be1 100644
> --- a/include/semihosting/syscalls.h
> +++ b/include/semihosting/syscalls.h
> @@ -56,4 +56,7 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
>                           target_ulong oname, target_ulong oname_len,
>                           target_ulong nname, target_ulong nname_len);
>  
> +void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong cmd, target_ulong cmd_len);
> +
>  #endif /* SEMIHOSTING_SYSCALLS_H */
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index da5c80b3d5..8a4e22a20a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -506,17 +506,7 @@ void do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_SYSTEM:
>          GET_ARG(0);
>          GET_ARG(1);
> -        if (use_gdb_syscalls()) {
> -            gdb_do_syscall(common_semi_cb, "system,%s", arg0, (int)arg1 + 1);
> -            break;
> -        }
> -        s = lock_user_string(arg0);
> -        if (!s) {
> -            goto do_fault;
> -        }
> -        ret = system(s);
> -        unlock_user(s, arg0, 0);
> -        common_semi_cb(cs, ret, ret == -1 ? errno : 0);
> +        semihost_sys_system(cs, common_semi_cb, arg0, arg1 + 1);
>          break;
>  
>      case TARGET_SYS_ERRNO:
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 223916b110..de846ced32 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -165,6 +165,18 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
>      gdb_do_syscall(complete, "rename,%s,%s", oname, olen, nname, nlen);
>  }
>  
> +static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
> +                       target_ulong cmd, target_ulong cmd_len)
> +{
> +    int len = validate_strlen(cs, cmd, cmd_len);
> +    if (len < 0) {
> +        complete(cs, -1, -len);
> +        return;
> +    }
> +
> +    gdb_do_syscall(complete, "system,%s", cmd, len);
> +}
> +
>  /*
>   * Host semihosting syscall implementations.
>   */
> @@ -353,6 +365,24 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
>      unlock_user(nstr, nname, 0);
>  }
>  
> +static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
> +                        target_ulong cmd, target_ulong cmd_len)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *p;
> +    int ret;
> +
> +    ret = validate_lock_user_string(&p, cs, cmd, cmd_len);
> +    if (ret < 0) {
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +
> +    ret = system(p);
> +    complete(cs, ret, ret == -1 ? errno : 0);
> +    unlock_user(p, cmd, 0);
> +}
> +
>  /*
>   * Static file semihosting syscall implementations.
>   */
> @@ -619,3 +649,13 @@ void semihost_sys_rename(CPUState *cs, gdb_syscall_complete_cb complete,
>          host_rename(cs, complete, oname, oname_len, nname, nname_len);
>      }
>  }
> +
> +void semihost_sys_system(CPUState *cs, gdb_syscall_complete_cb complete,
> +                         target_ulong cmd, target_ulong cmd_len)
> +{
> +    if (use_gdb_syscalls()) {
> +        gdb_system(cs, complete, cmd, cmd_len);
> +    } else {
> +        host_system(cs, complete, cmd, cmd_len);
> +    }
> +}
> -- 
> 2.34.1
> 





