Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B189518089
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:03:38 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloRU-0005PK-Of
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nloJ3-0004dm-6c
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:54:53 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nloJ0-0005nC-SR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:54:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3F756128D;
 Tue,  3 May 2022 08:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF748C385A4;
 Tue,  3 May 2022 08:54:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=zx2c4.com header.i=@zx2c4.com header.b="b4ipqw2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651568084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UadzwdyTPAXDsdMBLEUAPEXbwWfoUKoOfbRoM8Rb0RI=;
 b=b4ipqw2JKXpiCxJlvRmvUQa7M2XfgLsFpXcJ5TLiNXXhyZQOR34nOqPh7KEnYGO74kOLI4
 WNikGPxD/srFw/o+A/PIbtuS9hCzX+WrQYusYQzRS9iQC0gPdzWt2NZXotrJFHlyn4fzcM
 KYAfDcS2i46sHYFsnNv4QMarCjO7u7k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4be660f1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 08:54:44 +0000 (UTC)
Date: Tue, 3 May 2022 10:54:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, openrisc@lists.librecores.org, shorne@gmail.com
Subject: Re: [PATCH] target/openrisc: implement shutdown and reset helpers
Message-ID: <YnDt0YZK3aG3y8Tl@zx2c4.com>
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 02, 2022 at 04:57:43PM -0700, Richard Henderson wrote:
> On 5/2/22 15:52, Jason A. Donenfeld wrote:
> > OpenRISC defines various nop instructions in or1k as meaning shutdown or
> > reset. Implement these in TCG. This has been tested with Linux and
> > confirmed to work.
> 
> No, OpenRISC does not define various nop instructions, etc.
> 
> OpenRISC defines a Power Management Register to handle doze and suspend; there is no 
> specification for shutdown or reset.
> 
> See https://openrisc.io/architecture


Stafford is in the process of documenting/spec'ing the nop stuff.

> 
> 
> r~
> 

