Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826D5544E5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:38:08 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3woI-0006MI-5T
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3wlh-0004nO-2g
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:35:26 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:12354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3wle-0001f5-Qd
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:35:24 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 2E907323B63
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 11:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655890519;
 bh=Bw9ZzucD7lTYk7D86WPg7by15wFuYYhZq0Cyg7E0wVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=yYdfJMflX0/IwyPenFIO/x3JQwca9A7p+YcuN6mWxL3gCr922cfidwYMhmpDIQHxq
 rhTh9etBpyNVaifixaxPoAOuceAawpIALsC/zleFg496ZnBA5d4qTkWc6j6QV6Zjdd
 cxjkROuVbBrbRMkmLCa5W0C/D6BwMlXew1olfruU=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id D4CF3323B0C; Wed, 22 Jun 2022 11:35:18 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id 18968323B53; Wed, 22 Jun
 2022 11:35:10 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id BFBEE27E04CD; Wed, 22 Jun 2022
 11:35:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id A958027E04ED; Wed, 22 Jun 2022 11:35:10 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 LO_K4PPnuX9Q; Wed, 22 Jun 2022 11:35:10 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 90DF727E04CD; Wed, 22 Jun 2022 11:35:10 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <2550.62b2e24e.dcb01.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A958027E04ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655890510;
 bh=pN3xg156KnqT7mFJSf3B2WuoLJyre81QyCstb0vh10Q=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=TZ+GjvjiK8vbUL9b2nVrbdSDGSR9dpPOLpLNXq32/93lYUNcN1lK5PZywRG/yZlkg
 t/g750/HdqFEpheKDL9taUh2ejM7rswJPz0+p41SrzQc/uXufUSSni/hFbE6uLZ4Cf
 8QuvXD/c1NqSSKGLmw6/pdgPnge0V5sh8K4QFGMI=
Date: Wed, 22 Jun 2022 11:35:10 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 27/53] semihosting: Split out semihost_sys_open
Message-ID: <20220622093509.GE28991@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-28-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-28-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
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
> Split out the non-ARM specific portions of SYS_OPEN to a
> reusable function.  This handles gdb and host file i/o.
> 
> Add helpers to validate the length of the filename string.
> Prepare for usage by other semihosting by allowing the
> filename length parameter to be 0, and calling strlen.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/semihosting/syscalls.h |  25 ++++++
>  semihosting/arm-compat-semi.c  |  52 ++---------
>  semihosting/guestfd.c          |   5 ++
>  semihosting/syscalls.c         | 156 +++++++++++++++++++++++++++++++++
>  semihosting/meson.build        |   1 +
>  5 files changed, 193 insertions(+), 46 deletions(-)
>  create mode 100644 include/semihosting/syscalls.h
>  create mode 100644 semihosting/syscalls.c
> 

[...]

>          } else {
> -            hostfd = open(s, open_modeflags[arg1], 0644);
> -            if (hostfd < 0) {
> -                ret = -1;
> -                err = errno;
> -            } else {
> -                ret = alloc_guestfd();
> -                associate_guestfd(ret, hostfd);
> -            }
> +            semihost_sys_open(cs, common_semi_cb, arg0, arg2 + 1,
> +                              gdb_open_modeflags[arg1], 0644);

You're missing a unlock_user(s, arg0, 0); here





