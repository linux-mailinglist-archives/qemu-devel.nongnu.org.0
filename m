Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3055181F6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:03:53 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpNo-0005h4-7U
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nlpKA-0003rq-Tu
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:00:07 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:48014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org>)
 id 1nlpK8-0006e6-Sk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 06:00:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3999061047;
 Tue,  3 May 2022 10:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202F0C385A4;
 Tue,  3 May 2022 10:00:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NlAHw9iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651572000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N6GpZA6+9xFIYJgpxB8LKvrNC6uerwpxIw13pm9Qp8w=;
 b=NlAHw9iwVZccF6u8VYgzqpfFackaNr368UfxJoMEnDkQ7ImBhQvuJaRxLLiIgnQYkYXvGk
 SZK2OeFxpUhLcaaNwhX8fxEVYFjY4CKpwLwLU/tdQyoamPcZgQPrCsjUYkfN7c6ng+lkHZ
 jNWAKKDDOy6pCc6+Kk+Cmq5jr1c50Eo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dd9b6c02
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 3 May 2022 09:59:59 +0000 (UTC)
Date: Tue, 3 May 2022 11:59:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org
Subject: Re: [PATCH] hw/openrisc: use right OMPIC size variable
Message-ID: <YnD9HZNm0Sph1hLr@zx2c4.com>
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
 <YnDzoWHqpYcCWTVs@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YnDzoWHqpYcCWTVs@antec>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=EuPl=VL=zx2c4.com=Jason@kernel.org;
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

On Tue, May 03, 2022 at 06:19:29PM +0900, Stafford Horne wrote:
> On Mon, May 02, 2022 at 04:59:47PM -0700, Richard Henderson wrote:
> > On 5/2/22 16:28, Jason A. Donenfeld wrote:
> > > This appears to be a copy and paste error. The UART size was used
> > > instead of the much smaller OMPIC size.
> > > 
> > > Signed-off-by: Jason A. Donenfeld<Jason@zx2c4.com>
> > > ---
> > >   hw/openrisc/openrisc_sim.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Thanks,
> 
> I will queue this one.
> 
Please take a look at the v2 I posted instead.

