Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9838C045
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:03:07 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzBa-0005Bb-1a
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ljz9n-0004Cm-Lz
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ljz9f-0002i3-KZ
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621580461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6JphcM4pmYd1CYNQvcEVszU/hBFdDcYcq+GnyPlxFY=;
 b=PRcBlISCXYhsEONPIWf8g2nw263C3UmGUVyrJEt0nlf1OcrfcNDNS2ebxIwvkIr7ePLih+
 pX8f6cSLgEb0ib3heeSE3VUh/lKlpM7nW97kK3Gvev7Lx8WFkQBQHpqL7fu0HqiDeyo90t
 SJ79DZYlGFeNxe7PQOpfHB0CNp8NLX8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-9MVYbwByPD6-LMhZTlYfdw-1; Fri, 21 May 2021 03:00:58 -0400
X-MC-Unique: 9MVYbwByPD6-LMhZTlYfdw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b8-20020a05640202c8b029038f1782a77eso2378283edx.15
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 00:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a6JphcM4pmYd1CYNQvcEVszU/hBFdDcYcq+GnyPlxFY=;
 b=lGyjkx6Cv7PZ1Ce7gEQlDzeLwmq+y2gxfsdm3XMWYfX3APLngukYxgxRfSFzpc3yko
 JlJUYDJjE0lINXQ/SkXYSw2YU0lGzONg+Vg9ELmR8MJ3AdcGbkBzZrx5DHu80jQci+kU
 XiDxwl9XbqibchCPCGtDRNxFLCC2p2IffpFNX2CTEfSTdbHtawsAgsj1nsYRYF0uCCFi
 j37cg34bqb/3gFXki5+KVdHIN0BHw/UjQmzqftgHfB18OfTUVCh1B4iah+cNfkK0r8YF
 AojDnQ2rIkqT91aAtrxC30yG8fT5akJALM8HS2K1WqF88hZ/OThN7vZdykZuynwOAOpz
 Y8Nw==
X-Gm-Message-State: AOAM531y4hMAxSSRiIdm9M/WPtQ+qkSurb+FV0exLhReSn90cbyQJEwf
 ratKTFIrX2GrnqIWANhRTh+vguCRupsGDysyEhU+beXH7dOVmapx2hesXV1wNq2/l5IRBRVVOQ7
 Y8NUqFrAMSj0CgSE=
X-Received: by 2002:a05:6402:1345:: with SMTP id
 y5mr9266938edw.107.1621580457807; 
 Fri, 21 May 2021 00:00:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfcX+3k4/88gNC1QDi8wkOYCD4B1EiL/GthPczJ9gWuT9cqcjkJFAq1i6R7WXE8bUh32FkHA==
X-Received: by 2002:a05:6402:1345:: with SMTP id
 y5mr9266924edw.107.1621580457663; 
 Fri, 21 May 2021 00:00:57 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id d11sm2828022ejr.58.2021.05.21.00.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:00:57 -0700 (PDT)
Date: Fri, 21 May 2021 09:00:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update block/rbd.c maintainer
Message-ID: <20210521070055.bntp5jvljq34rtmt@steredhat>
References: <20210519112513.19694-1-idryomov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210519112513.19694-1-idryomov@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 01:25:13PM +0200, Ilya Dryomov wrote:
>Jason has moved on from working on RBD and Ceph.  I'm taking over
>his role upstream.
>
>Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
>---
> MAINTAINERS | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index eab178aeee5e..3e77ac9030fa 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -3042,7 +3042,7 @@ S: Supported
> F: block/vmdk.c
>
> RBD
>-M: Jason Dillaman <dillaman@redhat.com>
>+M: Ilya Dryomov <idryomov@gmail.com>
> L: qemu-block@nongnu.org
> S: Supported
> F: block/rbd.c
>-- 
>2.19.2
>
>

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks for taking this!
Stefano


