Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8F383AED
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:14:09 +0200 (CEST)
Received: from localhost ([::1]:53166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligoh-00042U-MG
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ligJI-0003if-Rf
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ligJF-00021c-Ih
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HtM2cgi+4/sf0GKkAgqD82PXJwuyoXxZZz5zdpeOE3k=;
 b=Y63NHtonuQH3d5JxVtickvNL/j2gxS2TDbtCGdKmFIiGfuvkFNTTnjHCTHBQruOSjhTMzo
 6rypGy53glyP3vIda35ewuSgdPhapjEQiOsSZ1N13aFRhSajOsNi+zcjW7jevywnw7CT4Z
 TEYSyiyXgZd3r/ZY4aox5wfhsVYSdgs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-BpZRdPjPOxWbcT5t5yQ6CQ-1; Mon, 17 May 2021 12:41:35 -0400
X-MC-Unique: BpZRdPjPOxWbcT5t5yQ6CQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y19-20020a0564022713b029038a9f36060dso4237035edd.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HtM2cgi+4/sf0GKkAgqD82PXJwuyoXxZZz5zdpeOE3k=;
 b=apynngAq2HHO6YqOGhevK+LM8rLL796M4SkiU7Ouyku11dC1tdVaB/VMo5BA/mpRe4
 bos/8Sjx2mptAgPPYAeznpwNjkIGfJFjF8X6FzoHKDFN6T0KDHap/9GxNGOF4swLi/nw
 SDFt5jO954mrEHrZR4zdHRpcMJ6zubGzEw+P1xK8whEQHZbOX0a6rC529kJFKghWW6CX
 fJdrvas7xU1AH3B03xkzXIaU3SxuTksho0jpU/iAoZZaZy+DsByI/hp++HhnNdGTFprA
 vwKzpjpGAFN6fV6r0zC48fT90Yvg5QwwKEmZtGIJ3UpU7gPm+nJwQJjgZOKaGqJx+YCY
 FjdQ==
X-Gm-Message-State: AOAM533KDqkbFOlaat+t0Fn+c7PgXpI0Ek0Q1t96QA+dHy8pEg3qaecE
 xd5rUwAQnhAE8R1ZTFINiEhhKuE8lnlH4VpV7EFRCJFxAs3SV8XQ/rCpO9d5ztc7357YhGVFyKz
 5uKagm5ZuIEqXKNc=
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr1071258edu.359.1621269694053; 
 Mon, 17 May 2021 09:41:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzmcPe+9728LFi+FBjnKBPLYS8fWVKd74yqid463y92ENmtJD79bFIqZVTD4XUo7U+QljtYA==
X-Received: by 2002:aa7:dc17:: with SMTP id b23mr1071239edu.359.1621269693857; 
 Mon, 17 May 2021 09:41:33 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id s11sm11399070edt.27.2021.05.17.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:41:33 -0700 (PDT)
Date: Mon, 17 May 2021 18:41:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2] vhost-vdpa: Remove redundant declaration of
 address_space_memory
Message-ID: <20210517164131.htnq3tlk4nfec5ka@steredhat>
References: <20210517123246.999-1-xieyongji@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210517123246.999-1-xieyongji@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: jasowang@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 08:32:46PM +0800, Xie Yongji wrote:
>The symbol address_space_memory are already declared in
>include/exec/address-spaces.h. So let's add this header file
>and remove the redundant declaration in include/hw/virtio/vhost-vdpa.h.
>
>Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
>Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> hw/virtio/vhost-vdpa.c         | 1 +
> include/hw/virtio/vhost-vdpa.h | 1 -
> 2 files changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 8f2fb9f10b2a..ee51863d280b 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -18,6 +18,7 @@
> #include "hw/virtio/vhost-backend.h"
> #include "hw/virtio/virtio-net.h"
> #include "hw/virtio/vhost-vdpa.h"
>+#include "exec/address-spaces.h"
> #include "qemu/main-loop.h"
> #include "cpu.h"
> #include "trace.h"
>diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>index 28ca65018ed7..ae9ee7adb2d0 100644
>--- a/include/hw/virtio/vhost-vdpa.h
>+++ b/include/hw/virtio/vhost-vdpa.h
>@@ -21,5 +21,4 @@ typedef struct vhost_vdpa {
>     struct vhost_dev *dev;
> } VhostVDPA;
>
>-extern AddressSpace address_space_memory;
> #endif
>-- 
>2.11.0
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


