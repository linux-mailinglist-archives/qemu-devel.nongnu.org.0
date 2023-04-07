Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC36DA9B5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:04:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkh4O-0008JP-Hl; Fri, 07 Apr 2023 04:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkh4M-0008JD-Bm
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 04:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkh4K-0001A8-TF
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 04:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680854615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rc9LvhVLCpw89KlgjB/TqVnHvblzDWEWBxnpZdecADI=;
 b=X8p9FHeo7NJOoN5s5jbOWAFoZthCrLxDTiTg2cS+yVm0CYUzME05dnyl4gDt834yywMIeh
 KrIFAMw1JM38x2+bp33jLnELaGNyCYUOmLC0U6hJFrtNIWEV2stXjtOpYglZ1MlVrXcg9t
 q4GhdGYCvNkDb7/xbewb2/mZKWw8DWo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-AM3NpaYoPgi3thO6T7cdAQ-1; Fri, 07 Apr 2023 04:03:30 -0400
X-MC-Unique: AM3NpaYoPgi3thO6T7cdAQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h22-20020a05600c351600b003ef739416c3so14197767wmq.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 01:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680854608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rc9LvhVLCpw89KlgjB/TqVnHvblzDWEWBxnpZdecADI=;
 b=cDi0MOR2b3Q/r+DY7e8fRWSMM2Sqo+1v+vqxmi8lxR8MqgJ0f4fui4f9iY2WW3QRvu
 u1ozvcAj65uddIvMu4fKKX2zqHCsHu4AQCINjKtgZm+Bd+2fUKCPGcpS/1lJPTd01Vvx
 xto8LjXCcQsBCOr2P2Wql/BvtVi4sHc5zgwtxJKZuESK3psw1WjhiIzlVmIJ6pBtF+Rx
 0DXh4L0g+JLYZ6Xj32vCDv/HG7Mz/gGkxOteT41WBbzXODtfMIEKL5uV+PhYx+QQq452
 nTgQY1WMHPKxKltjXeMGNo0dXeHpS//u/whxMDYfmQ6VUyTT+sC5wwKVu5eX22WXfwv3
 Tiog==
X-Gm-Message-State: AAQBX9eyyeJy2L91NmXomH9ytf/Z7Digscibj07QJnvoq8+sdVOyORyv
 1ivUiTrQUsS0ntrg8HPu9EnXM826495qBTZDzWWnRmBvuGts7VdSzLRT90OpfHOeKneQYgvTHpy
 iv+UviIluPhGyJOtZFvXbxkg=
X-Received: by 2002:adf:db0e:0:b0:2ce:aa2d:c625 with SMTP id
 s14-20020adfdb0e000000b002ceaa2dc625mr581200wri.22.1680854608470; 
 Fri, 07 Apr 2023 01:03:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350arh0qLT2rRr+SvCAYCFU0HawngQvQP1VVYzF9X7JtvafTmdgkY/70m/fToa4xTUWWUOHdODQ==
X-Received: by 2002:adf:db0e:0:b0:2ce:aa2d:c625 with SMTP id
 s14-20020adfdb0e000000b002ceaa2dc625mr581189wri.22.1680854608164; 
 Fri, 07 Apr 2023 01:03:28 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b002c71b4d476asm3826980wrt.106.2023.04.07.01.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:03:27 -0700 (PDT)
Date: Fri, 7 Apr 2023 04:03:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David 'Digit' Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
Message-ID: <20230407035709-mutt-send-email-mst@kernel.org>
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405172109.3081788-2-digit@google.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

If you are reposting, please version patchsets, E.g.
-v2 flag for git format-patch will enerate [PATCH v2] for you.

Repeating what I said on previous version:

On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
> The source file uses VIRTIO_F_VERSION_1 which is
> not defined by <linux/virtio_config.h> on Debian 10.
> 
> The system-provided <linux/virtio_config.h> which
> does not include the macro definition is included
> through <linux/vhost.h>, so fix the issue by including
> the standard-headers version before that.
> 
> Signed-off-by: David 'Digit' Turner <digit@google.com>

This happens to work usually but there's no guarantee
"standard-headers/linux/virtio_config.h"
and <linux/virtio_config.h> are interchangeable or
even do not conflict.

But where is <linux/vhost.h> using <linux/virtio_config.h>?
Everyone should be using "standard-headers/linux/virtio_config.h".


> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 0200b78e8e..0a5768cb55 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -32,6 +32,12 @@
>  #include <sys/mman.h>
>  #include <endian.h>
>  
> +/* Necessary to provide VIRTIO_F_VERSION_1 on system
> + * with older linux headers. Must appear before
> + * <linux/vhost.h> below.
> + */
> +#include "standard-headers/linux/virtio_config.h"
> +
>  #if defined(__linux__)
>  #include <sys/syscall.h>
>  #include <fcntl.h>
> -- 
> 2.40.0.348.gf938b09366-goog


