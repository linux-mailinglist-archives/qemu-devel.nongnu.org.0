Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43151554381
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 09:13:28 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3uYI-0008TY-PK
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 03:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3uWx-0007nl-BG
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:12:03 -0400
Received: from smtpout140.security-mail.net ([85.31.212.145]:32716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o3uWv-0004iv-0m
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 03:12:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id AC3A3323844
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 09:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1655881916;
 bh=7LGdE63FRm/4kyDYCrcIgJawV0IBsuUOPDJiPPZa7fY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=u+oz7MxwcFkzyxkhqngb13OehZKj+ryAOL0cUXPngUpjH9bDPunDYjL99IPgDF5vK
 WFmpz+0JhmXm5rIahoA/ARhHbas8V2OLFe+fm2QmwkcvjEA+2pmjmVxGCrnF+j22E/
 US9cOo/05OcPNtfcBDaiAQKyWNy0HuPjUkTyEA0c=
Received: from fx405 (localhost [127.0.0.1]) by fx405.security-mail.net
 (Postfix) with ESMTP id E2FC1323841; Wed, 22 Jun 2022 09:11:55 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx405.security-mail.net (Postfix) with ESMTPS id 2FAEC323821; Wed, 22 Jun
 2022 09:11:55 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0EE6527E04CD; Wed, 22 Jun 2022
 09:11:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id ECA9227E04DD; Wed, 22 Jun 2022 09:11:54 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 Btsyti1KtWUZ; Wed, 22 Jun 2022 09:11:54 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id D354B27E04CD; Wed, 22 Jun 2022 09:11:54 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <10661.62b2c0bb.2dd24.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu ECA9227E04DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1655881915;
 bh=WCWnpNJTMrl+xn9kUgen8wjrO26vBO6+dDKEkyQ4QX8=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=RrCMrVOmgZynsFeLfPYdIG5xAr8UaBwFzWficTz6+DBdAJbslvwWeOouC1mbuB/Ez
 PHkXwHerXmutjCmwwRqQpN/KIj9vqgbcerUAf/8ZJ7J3rAxePAr+hYVEi+MJsJb15Y
 sH4ZDNGb6peDn2Knx9QCOzsg4HjUz8xXinxHgSL4=
Date: Wed, 22 Jun 2022 09:11:54 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/7] semihosting: proper QEMU exit on semihosted exit
 syscall
Message-ID: <20220622071154.GA28991@ws2101.lin.mbt.kalray.eu>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <3ead4d24-8d14-5862-b9db-268139a83bec@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ead4d24-8d14-5862-b9db-268139a83bec@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.145; envelope-from=lmichel@kalray.eu;
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

On 07:37 Tue 21 Jun     , Richard Henderson wrote:
> On 6/21/22 05:59, Luc Michel wrote:
> > v2:
> >    - fix linux-user compilation. Declare semihosting_exit_request "static
> >      inline G_NORETURN" on CONFIG_USER_ONLY side. Use
> >      g_assert_not_reached() to enforce the G_NORETURN since this function
> >      is unused in linux-user mode.
> 
> Not true.  It *is* used with semihosting linux-user.
> 
> Anyway, before you go too far down this road, see
> 
> https://patchew.org/QEMU/20220607204557.658541-1-richard.henderson@linaro.org/

aww OK. Let's have your series merged first then.

> 
> 
> r~
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=16699.62b1d79b.16c49.0&r=lmichel%40kalray.eu&s=richard.henderson%40linaro.org&o=Re%3A+%5BPATCH+v2+0%2F7%5D+semihosting%3A+proper+QEMU+exit+on+semihosted+exit+syscall&verdict=C&c=71759fc2b76b8b9bc7813e449355fa174c40ee7b
> 

-- 





