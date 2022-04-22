Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D350B322
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:43:37 +0200 (CEST)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhot6-00067v-Ea
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhoku-0003WX-U4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:35:08 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhokr-0005bJ-Kv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650616478; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=YegTRT+9eeXYFIPJDtYS6U9w2Jl380PbA6tHYgnLI3s=;
 b=B50FYD2YUfVAzAuGBhfsgZ5aN7u9oNnFFuT0dBSyKW0w2A7CQIaUuHXbPHNeyeBF
 Ldy7FNkhWMDSY2yk6c23o6PmIInSs8gvzS096DgsEWXJxb77ZztU7hrNss2HrPJtFun
 b7Bf7yppkP0wR560GJdpb9hfg7VSf8lu8ddYNmjI=
Received: from localhost (91.110.139.125 [91.110.139.125]) by mx.zoho.com.cn
 with SMTPS id 1650616474942810.0518353638087;
 Fri, 22 Apr 2022 16:34:34 +0800 (CST)
Date: Fri, 22 Apr 2022 09:34:28 +0100
From: Fam Zheng <fam@euphon.net>
To: Sam Li <faithilikerun@gmail.com>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <20220422083428.GA61339@fam-dell>
References: <20220421163648.4205-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421163648.4205-1-faithilikerun@gmail.com>
X-ZohoCNMailClient: External
Received-SPF: pass client-ip=163.53.93.243; envelope-from=fam@euphon.net;
 helo=sender2-op-o12.zoho.com.cn
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-04-22 00:36, Sam Li wrote:
> Linux recently added a new io_uring(7) optimization API that QEMU
> doesn't take advantage of yet. The liburing library that QEMU uses
> has added a corresponding new API calling io_uring_register_ring_fd().
> When this API is called after creating the ring, the io_uring_submit()
> library function passes a flag to the io_uring_enter(2) syscall
> allowing it to skip the ring file descriptor fdget()/fdput()
> operations. This saves some CPU cycles.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/io_uring.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 782afdb433..5247fb79e2 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
>      }
>  
>      ioq_init(&s->io_q);
> -    return s;
> +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> +        /*
> +         * Only warn about this error: we will fallback to the non-optimized
> +         * io_uring operations.
> +         */
> +        error_reportf_err(*errp,
> +                         "failed to register linux io_uring ring file descriptor");

IIUC errp can be NULL, so let's not dereference it without checking. So, just
use error_report?

Fam

> +    }
>  
> +    return s;
>  }
>  
>  void luring_cleanup(LuringState *s)
> -- 
> Use error_reportf_err to avoid memory leak due to not freeing error
> object.
> --
> 2.35.1
> 
> 

