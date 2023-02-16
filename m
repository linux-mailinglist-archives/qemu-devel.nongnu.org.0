Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B66997E1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfbl-0000ne-BU; Thu, 16 Feb 2023 09:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSfbi-0000i7-8C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:51:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSfbg-0004Je-GH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:51:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h16so2071651wrz.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EE4lOAI9Dc47W0RgbZ8bUcRPMoizcRW+OzOGqhC2ulk=;
 b=g+tzig7GDfz1bpc7FFQUvIbj7CZYAD4tsKgy+If6OQB8DaEjDLKhVCJODjlK6v6Vey
 xGLaiP7viGrXTpihiIWsQZj8e7VVZe4y0rl5Lf10c7aN286IJw5jv9mJBTLomj+7zKTj
 x539af5CuCT8YpBqWpphSkBvYTAM6NPOw/8tw4tt5Z6vuet+D+R6bCWb/VrD9whE22rC
 2ityyXunzlvch5uka0hOpTeAIB0vc7Lb/7RzWwm4cEEQzBB9/1TGVBG6HAy8LTB4vCFt
 PZhX21bpAH6y5b6ZUB2i2ZqbQouqTWSMXXQcNbGbKsYuwHlMacb3I11jVRuzkCoXykpy
 DBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EE4lOAI9Dc47W0RgbZ8bUcRPMoizcRW+OzOGqhC2ulk=;
 b=RBXpCqsOQLTqksbcNp59G7khRqa9XEv3cn5QHGQVr/VqHh5AmlYZbU6aCXIfhd+VHY
 IRRgWGlZ1OUH7W2moBGvxdm++Zl7OSvvHNxTZOZcfxtVAK0aHDpEJgG6ZOTDApkO1dP+
 jiAWZQ7YP8NaaypWPMlA+R5r9Ujnvr73qy/cU+cnds/0zFVBQg4xuqUY44vpweQJbUBa
 VwqQlsDBWC+a8m78/5UW6R0qUaKNIh8C5J7KDdevbF24LS0xpqjrqfyDb+evat+7Bib4
 cwOfyBBJsesJ6p9f63Q8QeQUj6sCSZ2zJv3gzmKnr3+xd3CZ23KHPU+inUhuA4ZqSIhX
 oD2Q==
X-Gm-Message-State: AO0yUKXrLOyAcdxsCM2iRmZpaMrWmqlNq/1I5eCr/tZJVBJvBUCrg2Pi
 qmcLVAmRjKv2tvz2VTLVJ40Uhg==
X-Google-Smtp-Source: AK7set9561O/kBJJ7QUdM3DGdQUvG0U70Po/hvucD3nLPY3O4+2Nqk1u7MFHoD48twFWOnJ2JVY4cg==
X-Received: by 2002:adf:e391:0:b0:2c5:9e2e:28c1 with SMTP id
 e17-20020adfe391000000b002c59e2e28c1mr617023wrm.8.1676559089392; 
 Thu, 16 Feb 2023 06:51:29 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 l14-20020adffe8e000000b002c561805a4csm1691857wrr.45.2023.02.16.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:51:28 -0800 (PST)
Date: Thu, 16 Feb 2023 15:51:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v4 01/10] target/riscv: turn write_misa() into an
 official no-op
Message-ID: <20230216145122.bghf552qsi52c23o@orel>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
 <20230216130444.795997-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216130444.795997-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 10:04:35AM -0300, Daniel Henrique Barboza wrote:
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to write this CSR, has always been a
> no-op as well because write_misa() will always exit earlier.
> 
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
> 
> It is important to mention that the spec says that MISA is a WARL (Write
> Any Read Legal) CSR, and having the write operations as a no-op is a
> valid spec implementation.

This sort of reads like all WARL CSRs can ignore their writes. That's not
generally true, but this CSR can, because the spec says an implementation
may/can make its bits modifiable.

> Allowing the dormant code to write MISA can
> cause tricky bugs to solve later on. Given that we don't have a
> particularly interesting case of writing MISA to support today, the
> risks outweights the benefits.
> 
> Let's make it official and erase all the body of write_misa(), making it
> an official no-op.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/csr.c | 55 ----------------------------------------------
>  1 file changed, 55 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

