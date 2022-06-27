Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1A55B8EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:24:30 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kyr-0007Da-RK
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kwa-0005sc-Re
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:22:09 -0400
Received: from smtpout30.security-mail.net ([85.31.212.34]:23758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kwY-00029x-Im
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:22:08 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx304.security-mail.net (Postfix) with ESMTP id E69DB627EE
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 11:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656321724;
 bh=2tz6j5LDKysurW04SifrqNNZu8t3RFCakuJ2MxP6En8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZjZ1dR9y99eRq5U4bDXqOrY/aLcIRO1WYEY5Z86ubJBiBTZA214IYH3cXy+modwIQ
 Dl8IjKwCjcIU+P7RYDodK7iosqfsgsyqsicKGZUGg9GgsfBKE0ptygmrvXFNRTwfBe
 s3GAaNzkZD29JUZAcEX5l53DQyArsZhWYNwVdRPc=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id 9A8AE6287C; Mon, 27 Jun 2022 11:22:03 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 12DD76286C; Mon, 27 Jun
 2022 11:22:03 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id EBFD327E04D6; Mon, 27 Jun 2022
 11:22:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id D50F027E04F8; Mon, 27 Jun 2022 11:22:02 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 zLg2gbsl197T; Mon, 27 Jun 2022 11:22:02 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id BB65827E04D6; Mon, 27 Jun 2022 11:22:02 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <16666.62b976bb.1258f.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu D50F027E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656321722;
 bh=pHWVTj49q0687ot8vNGxGXPUB30nJfL2uaT9sUqdz5M=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ZmtDd3FEkbVYVTF//3rIRJkUKQjomPnGwAgGMOXVEAeIvabSUpbk1afaf0hwRhbEz
 cGAv/kzkeKYQLlZWzLZdJryUhco3BSXdsbU3e0egzkGEClSVyou/cpSWTS4oJJC3D4
 s6fwoUAbNDCAl+jt7EI/A9GJVbn5W2LPoZniWLwU=
Date: Mon, 27 Jun 2022 11:22:02 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 27/53] semihosting: Split out semihost_sys_open
Message-ID: <20220627092202.GK1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-28-richard.henderson@linaro.org>
 <20220622093509.GE28991@ws2101.lin.mbt.kalray.eu>
 <b94b96f6-5109-f518-9fa8-1a52f99ae6bf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b94b96f6-5109-f518-9fa8-1a52f99ae6bf@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.34; envelope-from=lmichel@kalray.eu;
 helo=smtpout30.security-mail.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08:05 Wed 22 Jun     , Richard Henderson wrote:
> On 6/22/22 02:35, Luc Michel wrote:
> > On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> > > Split out the non-ARM specific portions of SYS_OPEN to a
> > > reusable function.  This handles gdb and host file i/o.
> > > 
> > > Add helpers to validate the length of the filename string.
> > > Prepare for usage by other semihosting by allowing the
> > > filename length parameter to be 0, and calling strlen.
> > > 
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > >   include/semihosting/syscalls.h |  25 ++++++
> > >   semihosting/arm-compat-semi.c  |  52 ++---------
> > >   semihosting/guestfd.c          |   5 ++
> > >   semihosting/syscalls.c         | 156 +++++++++++++++++++++++++++++++++
> > >   semihosting/meson.build        |   1 +
> > >   5 files changed, 193 insertions(+), 46 deletions(-)
> > >   create mode 100644 include/semihosting/syscalls.h
> > >   create mode 100644 semihosting/syscalls.c
> > > 
> > 
> > [...]
> > 
> > >           } else {
> > > -            hostfd = open(s, open_modeflags[arg1], 0644);
> > > -            if (hostfd < 0) {
> > > -                ret = -1;
> > > -                err = errno;
> > > -            } else {
> > > -                ret = alloc_guestfd();
> > > -                associate_guestfd(ret, hostfd);
> > > -            }
> > > +            semihost_sys_open(cs, common_semi_cb, arg0, arg2 + 1,
> > > +                              gdb_open_modeflags[arg1], 0644);
> > 
> > You're missing a unlock_user(s, arg0, 0); here
> 
> Good catch.  Fixed.

With this fixed:

Reviewed-by: Luc Michel <lmichel@kalray.eu>


> 
> 
> r~
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=3812.62b32fac.79d6c.0&r=lmichel%40kalray.eu&s=richard.henderson%40linaro.org&o=Re%3A+%5BPATCH+v4+27%2F53%5D+semihosting%3A+Split+out+semihost_sys_open&verdict=C&c=588dc0ed7d12e87bd5846dca36ad4d902888f28e
> 

-- 





