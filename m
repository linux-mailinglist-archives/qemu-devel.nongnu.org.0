Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD64E4366
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:55:07 +0100 (CET)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgqg-00048x-FN
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:55:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWgp5-0002UL-4a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nWgp2-0002VB-Ce
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647964403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7FeMzmr8txjvkRIglA4vo/3nw1vBoyjxaY7N9JPa9L8=;
 b=LT5W0VLK0hRudUXmgKJOpHGSvf/9OiaAomgkl8I6XBMnjf+1jMmGZ3/pO5k+n5hP5re6tb
 m3zndEAZTnvqigpQa3bEb8yrfBMOsIzqUNT5rjtKzZzSwSTn1rjTJPTpm4UNEF1Q+Vqs5e
 NNC/PJcZ+IkdzEKrvCTaFs3kMX6X7wk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-gM2QDcV_PqarpFglMBpwzQ-1; Tue, 22 Mar 2022 11:53:20 -0400
X-MC-Unique: gM2QDcV_PqarpFglMBpwzQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 a17-20020a5d6cb1000000b00203f85a2ed9so1935197wra.7
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7FeMzmr8txjvkRIglA4vo/3nw1vBoyjxaY7N9JPa9L8=;
 b=dWMsm2eiZ2zbmxrSet+xSaaRjQyuPmHoO7j0OJb2D633sHxmf34jUj2NbmmknkI62R
 MoAIgwVN6Z4MANv6FwswiK/+gjEeAwyOGqaIk5IY/H/z8VYmm4GNHnobF31eHri/rtpr
 xKd9DW9Ti7egh3RzhCzr1c7bTqjNSbAXQu+5Wf0d2P1S6mbcjDfyxIgTUqjst/ruQUqc
 tF0dIeRsc2YBIlbnHckRsnlWFDBhxfAxYABd8HSCq7yIgBpJQylUbbCZzASmZ4uR5n2f
 0UZvxaM0R+Fxf0qINag2j7EpJQ142jLaqbZgGBYa0rKfAgz9ArZDF+UcN5c56ITTKgDS
 eO4w==
X-Gm-Message-State: AOAM531mwgVcInAdsvTtnU2jVmLCZZ6TG7f/Y18uYj7jrE36TsdqZsXx
 XgKg4gKAajqJZRuQhFMhOGCjbUvhB9jbPrGoIMjlcWmJO87dbhdMniah29GXmjtWxznk9IN/Dlo
 yt3wDVgAzEFaPiRo=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr4447659wmc.94.1647964399015; 
 Tue, 22 Mar 2022 08:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVp3YvwhfpdUyF7/cedt5mhDnSO0h49u3Tv98iTlR+RyzDYI/9LGZUAXeqAEfqZ+kUU6bv6Q==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr4447622wmc.94.1647964398651; 
 Tue, 22 Mar 2022 08:53:18 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 g6-20020adfd1e6000000b0020581602ddfsm599944wrd.90.2022.03.22.08.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:53:17 -0700 (PDT)
Date: Tue, 22 Mar 2022 11:53:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v2] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed
 linux systems
Message-ID: <20220322115249-mutt-send-email-mst@kernel.org>
References: <20220322154658.1687620-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220322154658.1687620-1-raj.khem@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>, qemu-mips@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 08:46:58AM -0700, Khem Raj wrote:
> linux only wires MAP_SYNC for architectures which include
> asm-generic/mman-common.h and mips is one such architecture which is not
> including this file via linux/mman.h, therefore as a fall back
> these constants should be defined for such architectures on Linux
> as well.
> 
> This fixes build on mips/musl/linux
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this? mips tree?

> ---
> v2: Improve commit message
> 
>  util/mmap-alloc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 893d864354..86d3cda248 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -10,14 +10,18 @@
>   * later.  See the COPYING file in the top-level directory.
>   */
>  
> +#include "qemu/osdep.h"
>  #ifdef CONFIG_LINUX
>  #include <linux/mman.h>
> -#else  /* !CONFIG_LINUX */
> +#endif  /* CONFIG_LINUX */
> +
> +#ifndef MAP_SYNC
>  #define MAP_SYNC              0x0
> +#endif /* MAP_SYNC */
> +#ifndef MAP_SHARED_VALIDATE
>  #define MAP_SHARED_VALIDATE   0x0
> -#endif /* CONFIG_LINUX */
> +#endif /* MAP_SHARED_VALIDATE */
>  
> -#include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/cutils.h"
> -- 
> 2.35.1


