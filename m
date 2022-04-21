Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9B50A0FA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:40:03 +0200 (CEST)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhX2Q-0001cI-G4
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhWzK-0006TF-W2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:36:52 -0400
Received: from sender2-op-o12.zoho.com.cn ([163.53.93.243]:17725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fam@euphon.net>) id 1nhWzH-0003es-Q8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650548168; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=qpSlRyrQD52yM3UwwXE79qJuMf9p+4O//LfhPpnFTPk=;
 b=LCQOjI29QIrYSo5l3uTD0YQnh/3NG3vbPUSGi9jtFoiQzQkB1CGjT62Emayh8lUL
 SnHWfnLRsryCh61OToVUqO/FlRp/B2mLSaJqvDc7D7/AmhTmOKozg6cghO1t/5lvIUM
 zuMWUGG70W5QF4MSli5KGvDanp0Q+YKC6tJQk4sc=
Received: from localhost (91.110.139.125 [91.110.139.125]) by mx.zoho.com.cn
 with SMTPS id 1650548166815944.1736398875925;
 Thu, 21 Apr 2022 21:36:06 +0800 (CST)
Date: Thu, 21 Apr 2022 14:36:00 +0100
From: Fam Zheng <fam@euphon.net>
To: Sam Li <faithilikerun@gmail.com>
Subject: Re: [PATCH v3] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <20220421133600.GB1500162@fam-dell>
References: <20220418233331.7528-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418233331.7528-1-faithilikerun@gmail.com>
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

On 2022-04-19 07:33, Sam Li wrote:
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
> index 782afdb433..51f4834b69 100644
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
> +        error_setg_errno(errp, errno,
> +                         "failed to register linux io_uring ring file descriptor");
> +    }
>  
> +    return s;

As a general convention, I don't think the errp is going to get proper handling
by the callers, if non-NULL is returned like here. IOW a matching error_free is
never called and this is memory leak?

I guess error_report is better?

Fam

>  }
>  
>  void luring_cleanup(LuringState *s)
> -- 
> 2.35.1
> 
> 

