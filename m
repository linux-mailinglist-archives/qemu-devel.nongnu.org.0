Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9154DE99
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:06:10 +0200 (CEST)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mO9-0005oi-9n
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YYNU=WX=zx2c4.com=Jason@kernel.org>)
 id 1o1mKJ-0004nU-Vb
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:02:11 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YYNU=WX=zx2c4.com=Jason@kernel.org>)
 id 1o1mKE-0002uT-0d
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:02:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5200E61337;
 Thu, 16 Jun 2022 10:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2694AC34114;
 Thu, 16 Jun 2022 10:01:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="nIN1S1Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655373710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irEf8zLQFqTqnGqywin6jMqX4Hfw5jo58NWvT2Kt9IQ=;
 b=nIN1S1Vi2DTXZTl0AMiRJohM6Au3LC4NZ8N8V1c8YjNvTYtSyQUN7xkdzvz4z9WppbxBUW
 TT5ptRGnL1d+BF52HWNRpZTb/9L0P2wDqkjK2Ap+s51P6C0dsxNts9adxDuXkZlF+aNCqL
 g2/AzP5omCHz59rwFtol2CBYw//NqBg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2087ac11
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 16 Jun 2022 10:01:50 +0000 (UTC)
Date: Thu, 16 Jun 2022 12:01:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] hw/riscv: virt: pass random seed to fdt
Message-ID: <Yqr/jN1bnEmDVIKm@zx2c4.com>
References: <20220613115810.178210-1-Jason@zx2c4.com>
 <CAEUhbmX8hOuhHrT1xx3HrgUt5jZvO_jUN+64RPWfZADKCbGvKg@mail.gmail.com>
 <CAKmqyKOO1o9BX66pNd3fevkK5URnHqefkbnuJqBrqYt4=4VXdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKmqyKOO1o9BX66pNd3fevkK5URnHqefkbnuJqBrqYt4=4VXdA@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=YYNU=WX=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Alistair,

On Thu, Jun 16, 2022 at 12:32:36PM +1000, Alistair Francis wrote:
> Applied to riscv-to-apply.next with the full stop removed

Great, thanks. Just wondering: am I looking in the right repo? I don't
see it here: https://github.com/alistair23/qemu/commits/riscv-to-apply.next

Jason

