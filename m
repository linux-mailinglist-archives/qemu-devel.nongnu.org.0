Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498105180D3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:17:40 +0200 (CEST)
Received: from localhost ([::1]:57316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlof5-0001yy-5m
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlobw-0008LB-Jp
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:14:26 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nlobt-0000Vs-9d
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:14:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d15so14477964plh.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XOjg/7UInhraO/29MWhTEQeRn1OMshOC2gZLr5HQ08U=;
 b=fLg2qIBDKZJyaNhjbQDvTQlBdJMGJj47K66yusGgJ7vE6T8jiA+iqCdn7bEyVHWefB
 fUjEpgVHF7/gRXr1x+/i1RXHu1M/8BaDJLtY1X2wvP1FMIFWU7fx6vBF/YDPtSfasRfe
 B9R8Zdoo4L9EFZ+5HJD7Oltnh96hHaw57YM7D8uO8vDHew/Iqm8vy8LYd2UnEi7kPHZg
 AqTEfF8ZpCSQJ1JFC2RgIve4ICTgHmbaaEr5OGXOilIG0TbMRwrQKNUGZWjmkJK5Ycvp
 +8Q/AIZgqAe342H+9Z7cWGms7zcHnVHuompk2dEA6UPgB/rwiZhWJwEaTHa1UvKgO6tY
 sJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOjg/7UInhraO/29MWhTEQeRn1OMshOC2gZLr5HQ08U=;
 b=bFmwe8ofBhkGXugUDTmYZf7uzbNQwzHxXJOLeQY55i7SVyweBeMRUcjhwhcQOFKy2k
 UPPvEAtSlbSzuHONpZzFuTiyizVk97kvuKWNoF5ehmvJArzn9VXUjfC/XXfBqHHQd5Dx
 2xdrZ8COPFqaRYjwAVf7/5WeJZlndaIBtEeTS4XxCnyaKE/RvL6KBSe0uG/9kgKdAwn7
 aAzWyTrNPSjwjxW/XAebhdyNGThE0JtpsEZqXPFCJ47z9UvXdaGtIHKrzAnOxEoDpgWx
 PK+J4P39cJlJ9eUYzHu5i1NcD60gO0c2XfuGzcEDBklRuJCIFiXeQ/0TQJnVrZjz2OWN
 K9UQ==
X-Gm-Message-State: AOAM533ZWMQbWKu3E2pxmCN/663llZQgB2HG1kUC/WPQQble4FNMUXGW
 HMD3PFtFVT3iXdtzK2emZDs=
X-Google-Smtp-Source: ABdhPJwNZfNUNumR+Z8yxaidlXhFANK0r3mMVquzCn7nKgHlNF43vBUkbLOxWljJuoa54tB7fSGMhg==
X-Received: by 2002:a17:90b:3b42:b0:1dc:5cdf:5649 with SMTP id
 ot2-20020a17090b3b4200b001dc5cdf5649mr3600846pjb.239.1651569258713; 
 Tue, 03 May 2022 02:14:18 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170902aa8d00b0015e8d4eb249sm5892277plr.147.2022.05.03.02.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:14:18 -0700 (PDT)
Date: Tue, 3 May 2022 18:14:16 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org
Subject: Re: [PATCH] target/openrisc: implement shutdown and reset helpers
Message-ID: <YnDyaEW2QiUXTNx8@antec>
References: <20220502225230.237369-1-Jason@zx2c4.com>
 <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
 <YnDt0YZK3aG3y8Tl@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnDt0YZK3aG3y8Tl@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 03, 2022 at 10:54:41AM +0200, Jason A. Donenfeld wrote:
> On Mon, May 02, 2022 at 04:57:43PM -0700, Richard Henderson wrote:
> > On 5/2/22 15:52, Jason A. Donenfeld wrote:
> > > OpenRISC defines various nop instructions in or1k as meaning shutdown or
> > > reset. Implement these in TCG. This has been tested with Linux and
> > > confirmed to work.
> > 
> > No, OpenRISC does not define various nop instructions, etc.
> > 
> > OpenRISC defines a Power Management Register to handle doze and suspend; there is no 
> > specification for shutdown or reset.
> > 
> > See https://openrisc.io/architecture
> 
> 
> Stafford is in the process of documenting/spec'ing the nop stuff.

Hi Richard,

Yes, we had a mail discussion about this with Peter.  This being similar to ARM
semihosting; enabling these special instructions should be behind the semihosting
flag.  Something that needs to be done for this patch.

If you have concern about this let me now.

Mail:
  - https://www.mail-archive.com/qemu-devel@nongnu.org/msg884560.html

Our other simulators implement this, so the compromise is if we document this
officially and only implement it behind semihosting peter was OK with it.

I haven't started on the documentation yet as I haven't has much time in the
last few days though.

Or1ksim:
  - https://github.com/openrisc/or1ksim/blob/79c6f153390127e50259d46a7cc0421aa787d2ed/cpu/or32/insnset.c#L768
sim:
  - https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=sim/or1k/or1k.c;h=bfab35461bee1457fe8f42179ac6d27f5ad46b96;hb=HEAD

-Stafford

