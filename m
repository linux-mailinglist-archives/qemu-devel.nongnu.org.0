Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B602FAE9F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 03:11:21 +0100 (CET)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1gUL-0001fK-2l
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 21:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gSg-0001Bo-5h; Mon, 18 Jan 2021 21:09:38 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1gSe-00051Q-27; Mon, 18 Jan 2021 21:09:37 -0500
Received: by mail-pj1-x1033.google.com with SMTP id p15so10649339pjv.3;
 Mon, 18 Jan 2021 18:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+hEXZCM/Tj6yTDSLGMyN0av47KWhEC6oBjFVxhm7pgM=;
 b=pxboJYvL32t3u/52ZjVwqu7ukbmXSRgP4uVK+xHwdZYzXTMs4Px8u8ac/4fYtk7PPI
 yuhcG+fADXXd1vwCcAfCKxt4/qzU1Jwksu6s812Q29Pg5pcz063h+K8XtqhJ5YU+QhOq
 9EQ8Jv5ETGFOFhg+h5gDjt3fkgCwV8ffdUPNSU44IrlcQsdT3I/XwXVk/bsGx1Ht3W4P
 nVntI0K6AIyRUwNL2EzxkWdNdXpLRgf9Z0oQRIXQYrFII8AkIEI6KcNs4k4l8SkPSihF
 SBNYKf8xZCeVXPWvHq8Pefb4JrPL2+I7sfkrLN7/L30JlOCnxFk/uoi9yIKtVEEe2S4p
 ikzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+hEXZCM/Tj6yTDSLGMyN0av47KWhEC6oBjFVxhm7pgM=;
 b=Z8JVO6E2MEa0+B3tevUMA2NsYlmMVxpi9WRHIf6ilIWTK27uwooKa3FIlF5hqyYOLA
 4Uxi1q0UeClBjr0IRcuOqkPo205/BSh75pY1FKi6zuY2jaGSphOuvDqIpbE/uzw6aeKX
 NIvyz0Gj2OlbvvNrXbc2IqEr+x1969QSu+GuT2ifLAbuNh6I9Dtsd3Xnai/KKNAG16KV
 20YJDAYjzfbAj+YsIJNJl2HfyqMN1Up/ZLpN3hNzKXbqv6EAZa4+mV7cHFXayAz8w+4W
 fuC4/uY8ukeCOzEHRb/W/zgyVu3p9/urD+53XRnyRMXkFvgIa6YqtMMwhc4KX9hRkZBE
 PiZA==
X-Gm-Message-State: AOAM531EyZFwVEh6dtbLI7idZI/v8GcxLv6ltek5XLqHzi/AsSiqr2uK
 Xa/uIebgT46vqpiaWBLxztM=
X-Google-Smtp-Source: ABdhPJxE9ghxIAosNf9Fa4rpRHkLB/NLyUxsHhfXJQKrTcVpX2IEU3uN6SPi7EhUzI0Gki+S+FL2Ng==
X-Received: by 2002:a17:90a:4a18:: with SMTP id
 e24mr2573825pjh.140.1611022174009; 
 Mon, 18 Jan 2021 18:09:34 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id s65sm5674942pfc.95.2021.01.18.18.09.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 18:09:33 -0800 (PST)
Date: Tue, 19 Jan 2021 11:09:31 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <20210119020931.GA5939@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
 <20210118124100.GB18718@localhost.localdomain>
 <YAWE4cDhwQOoc8NT@apples.localdomain>
 <20210118125945.GI18718@localhost.localdomain>
 <YAXnNAo/Cva7gTQx@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAXnNAo/Cva7gTQx@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-18 20:53:24, Klaus Jensen wrote:
> On Jan 18 21:59, Minwoo Im wrote:
> > > The spec requires aligned 32 bit accesses (or the size of the register),
> > > so maybe it's about time we actually ignore instead of falling through.
> > 
> > Agreed.
> > 
> 
> On the other hand.
> 
> The spec just allows undefined behavior if the alignment or size
> requirement is violated. So falling through is not wrong.

If so, maybe we just can make this MMIO region support under 4bytes
access with error messaging.  I don't think we should not support them
on purpose because spec says it just results in undefined behaviors
which is just undefined how to handle them.

