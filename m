Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C33CF628
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:31:34 +0200 (CEST)
Received: from localhost ([::1]:53834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5lA5-0000kJ-AN
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5l8Z-0008Ob-L9
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m5l8Y-0007xJ-3f
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626769796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=47b9Sw5x/Rj6l8lYTWxpfF6uhs9nQkZf8xXSo1tcLVM=;
 b=WJKWoy5pIcWjaQzHiYSAFZQhr8Ka6rbCbQUijAfZ9pD63vOfsiXsX+Y7wxpTUgdJTe7a+U
 x7heT28hy9U1pwMCyIUMcOCPHzljwSlWriFMph38rdJiPwB3RgMK9pbzkRYCX2wkqFJNNM
 8vr82wuw/nJD+8vd1e/MlqzOCGnc0gY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-czQJXbPrOhSl9AS9XK7iuw-1; Tue, 20 Jul 2021 04:29:55 -0400
X-MC-Unique: czQJXbPrOhSl9AS9XK7iuw-1
Received: by mail-ej1-f70.google.com with SMTP id
 de27-20020a1709069bdbb02904dedfc43879so6510460ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 01:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=47b9Sw5x/Rj6l8lYTWxpfF6uhs9nQkZf8xXSo1tcLVM=;
 b=M4UBsbICXVgS5SZ54oSQPyQHH8kDXeZztb7Bplwp9MHhpT1OHLWlv6lFV/rBPtlFpz
 D69pGYaryTd6yGhX4irXjyT/lRR7Uv1EahFpTnIGDj+YHaDrySB3UF5jS9iQx3GpC1b4
 xCTwM1mBRUmT9NDFCsX7iUpRh8ryLA3IM1L7aVJv2OX7/0uCoYl5X9q/GxEk1Eo6FvQF
 OuoK4MzVNOr43WfhooFs49opzB+zmhuF0ZEiO7Z9ZZlrcd8MtGQUURp8y82FYVh2P3UP
 4qwnzU4IxuNrJTW4rvr69CVvTjyPjT18DKx4C0GlBxjAK3QJUzMkSEc/CgkJD4vgxqns
 czfg==
X-Gm-Message-State: AOAM530GFoM0jC0tKD1o8uZOciZkn5B63rRfE71uFAMKpdzp1sTQ20xT
 AK0IE9jYRRIl1gf164Zbe5S31hxC4Uvm/194PHsGV4/pEhgzH4DwND6IVqMaQhhdaXw1+Es17Wp
 UMv7eLrQIgNkg0sE=
X-Received: by 2002:a50:9503:: with SMTP id u3mr33763158eda.135.1626769794200; 
 Tue, 20 Jul 2021 01:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYm0eY/BX9RL4MeruAf21VxuKeNzXWFMkLI/wCZvKbJAq5o+JS7w2emFJ/JqIDldKDlRvWKQ==
X-Received: by 2002:a50:9503:: with SMTP id u3mr33763150eda.135.1626769794039; 
 Tue, 20 Jul 2021 01:29:54 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id qp12sm6866844ejb.90.2021.07.20.01.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 01:29:53 -0700 (PDT)
Date: Tue, 20 Jul 2021 10:29:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] io_uring: move LuringState typedef to block/aio.h
Message-ID: <20210720082951.p2oyy33kh2uevjr2@steredhat>
References: <20210712131030.465621-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210712131030.465621-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 03:10:30PM +0200, Paolo Bonzini wrote:
>The LuringState typedef is defined twice, in include/block/raw-aio.h and
>block/io_uring.c.  Move it in include/block/aio.h, which is included
>everywhere the typedef is needed, since include/block/aio.h already has
>to define the forward reference to the struct.
>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> block/io_uring.c        | 4 ++--
> include/block/aio.h     | 8 ++++----
> include/block/raw-aio.h | 1 -
> 3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


