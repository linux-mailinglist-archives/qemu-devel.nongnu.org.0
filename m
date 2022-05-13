Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0E526CF1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 00:31:14 +0200 (CEST)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npdoX-00043t-7r
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 18:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zev@bewilderbeest.net>)
 id 1npd0K-0002Cq-4O; Fri, 13 May 2022 17:39:20 -0400
Received: from thorn.bewilderbeest.net ([71.19.156.171]:57271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zev@bewilderbeest.net>)
 id 1npd0I-0004KP-FY; Fri, 13 May 2022 17:39:19 -0400
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EDD5AA21;
 Fri, 13 May 2022 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652477955;
 bh=daeFLf+AhaKwZp2OdaLLNRuVaf0ltxVYDfAY45oXBpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxIqojsYQxbjfbJUKz7Xq9kXWARnitZSWMnfkPlnTXoidPQznkVJ3ruUpQ9mhoWvA
 ysPcYV4aG/xWUnPCmwnLmJiy7Ku+1DbuAmqLny4CDk2n2BAZGpcfAcGSPFL5XLLFsC
 UkZHK4JpAr6PL398IsdPAhnu5758mfa9c8tZV030=
Date: Fri, 13 May 2022 14:39:12 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Peter Delevoryas <pdel@fb.com>
Cc: irischenlj@fb.com, patrick@stwcx.xyz, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au
Subject: Re: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Message-ID: <Yn7QAJK7jnE7kz9T@hatter.bewilderbeest.net>
References: <20220513040220.3657135-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513040220.3657135-1-pdel@fb.com>
Received-SPF: pass client-ip=71.19.156.171; envelope-from=zev@bewilderbeest.net;
 helo=thorn.bewilderbeest.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 May 2022 18:29:10 -0400
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

On Thu, May 12, 2022 at 09:02:18PM PDT, Peter Delevoryas wrote:
> CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:
> 
> https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
> 
> This series adds all the missing UART's in the Aspeed chips, and initializes
> them all with serial devices (even if there is no peer character device provided
> by the QEMU user).
> 
> This allows users to quickly test UART output without any code changes. In fact,
> you could even connect all the UART's to separate sockets and check which one is
> emitting data.
> 

Thanks Peter -- I tried this out with an ahe-50dc u-boot build (ast2400 
with stdio on uart3), and with

  -serial null -serial null -serial null -serial mon:stdio

added to the command-line I get the u-boot stdio and the qemu monitor in 
my terminal as expected.

Tested-by: Zev Weiss <zev@bewilderbeest.net>


