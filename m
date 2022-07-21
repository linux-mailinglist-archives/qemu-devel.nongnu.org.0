Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BF57C512
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:12:24 +0200 (CEST)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEQM7-0000z6-BX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oEQK4-0007ah-1g
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:10:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oEQK2-0002bM-Gw
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658387409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3jvonCtMEDPWldBTmnCvzhReEG0E0EKWWBxgbi+g9U=;
 b=P+80ViWiRh8ht0jKHYhaFDL6DpmeGXii9O4qT+rEmiZRE8TK9eg0y+ewCHezyAndt5dzTH
 TwqVCVZOrIziz+lh0t4hNTP53qMBYQQpAKtioXmiUiyAYeNX+KHTNgwRjVK0+hkGiID5uP
 av/sAyejITMXUIxP1V/2PessbLZTmhY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-lnIOKJfeOrW5vPQ9Ng3d7g-1; Thu, 21 Jul 2022 03:10:02 -0400
X-MC-Unique: lnIOKJfeOrW5vPQ9Ng3d7g-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso439887ejc.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 00:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n3jvonCtMEDPWldBTmnCvzhReEG0E0EKWWBxgbi+g9U=;
 b=RbSPFuPTfFcrpNbvDDComTEEzDdRR5Rtar+uyo4j9LacFSXjg19nckyNEIxz6GpJzO
 czdtP9lrrd7/XRHWEH+naOq/WfmF1/re8Ip5X4ndX65C+x8FTtnlyScCGJRY2Z6dhmk7
 gatN4nemftctAvNNW/4wXi9OE6ehcp3XyqwmBdbnI9U1mYmLBB1Poa92iBS3GBmCkVC0
 m7sj1hgGNIAht+45x0l8NCtcx2cOwON4qK0TQlsfWP+Vh/Jp3xoTz43s8mWjsCEx9F/D
 aj+oynbWYo4ZPaHQU36lew35c32eXLcA32mfpGnBjS9CnvwedJBxjXZqzTcubru3vEP5
 NUIA==
X-Gm-Message-State: AJIora/dHg/c7IUQxMpr7F1PHLxivcGnx8Of96iwxUbbDqpx7qRyJkd+
 tQXcTaGvBQ+KwKdzLAdYKJnxZthZvo0P5O+rRjbsWVijIrVWrEtAfdKZxQtJ5+Nb9PjuCm2w4nj
 xFO2FH/BAOGgY/7c=
X-Received: by 2002:a17:907:a076:b0:72b:4ad1:53ba with SMTP id
 ia22-20020a170907a07600b0072b4ad153bamr37361697ejc.685.1658387401615; 
 Thu, 21 Jul 2022 00:10:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufPMUrKt0laVrhlaXDDKLHcSOMZ0R5ywdcdy6g+xcMJ/bXPIBBBL0kzXfwx2BqMwv27gYGxA==
X-Received: by 2002:a17:907:a076:b0:72b:4ad1:53ba with SMTP id
 ia22-20020a170907a07600b0072b4ad153bamr37361677ejc.685.1658387401408; 
 Thu, 21 Jul 2022 00:10:01 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 pg13-20020a170907204d00b00722e1bca239sm479006ejb.204.2022.07.21.00.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 00:10:00 -0700 (PDT)
Date: Thu, 21 Jul 2022 09:09:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, its@irrelevant.dk, kbusch@kernel.org,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Linux io_uring" <qemu-block@nongnu.org>
Subject: Re: [PATCH] block/io_uring: add missing include file
Message-ID: <20220721070956.js5rqulrpjx4i5ab@sgarzare-redhat>
References: <20220721065645.577404-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721065645.577404-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 21, 2022 at 02:56:45PM +0800, Jinhao Fan wrote:
>The commit "Use io_uring_register_ring_fd() to skip fd operations" uses
>warn_report but did not include the header file "qemu/error-report.h".
>This causes "error: implicit declaration of function ‘warn_report’".
>Include this header file.
>

We could add:

Fixes: e2848bc574 ("Use io_uring_register_ring_fd() to skip fd operations")

>Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>---
> block/io_uring.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/block/io_uring.c b/block/io_uring.c
>index f8a19fd97f..a1760152e0 100644
>--- a/block/io_uring.c
>+++ b/block/io_uring.c
>@@ -11,6 +11,7 @@
> #include "qemu/osdep.h"
> #include <liburing.h>
> #include "block/aio.h"
>+#include "qemu/error-report.h"
> #include "qemu/queue.h"
> #include "block/block.h"
> #include "block/raw-aio.h"
>-- 
>2.25.1
>
>

Thanks for the fix:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



