Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9093C6DA9A5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 09:58:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkgxo-0006ZE-Ns; Fri, 07 Apr 2023 03:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkgxl-0006Yu-Su
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 03:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pkgxj-00073m-OX
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 03:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680854206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sje0Q+4LXGwH5IAycnvuTRfLXx0J9razPXdJLOsb1mw=;
 b=jJMXOmrBQC3no1BKAC3ZVMennkhZwvfksm0x1WfBT5WMPwdJ4isFcjAeU5X7BreXn8TkRg
 rstz1sjrMiliJOeNDs6uZ7kBW9m82bSwLz94yVTLz7C7YxRBParHAyzSJ4/5AL1fJehRot
 EGuEayIvLJocM/jY1X6kjNCxjUHfwaA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-8Akh3BdIMVOX_gmAZzMF1g-1; Fri, 07 Apr 2023 03:56:44 -0400
X-MC-Unique: 8Akh3BdIMVOX_gmAZzMF1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 gw11-20020a05600c850b00b003ee8db23ef9so356505wmb.8
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 00:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680854203;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sje0Q+4LXGwH5IAycnvuTRfLXx0J9razPXdJLOsb1mw=;
 b=79IRfLDNP+HOXIc4uITEV/0q+7CYiaggFwjrTUy5q1gnR9Y0bFzMGlcGp30IIYaQTo
 wFsN68OsA9N6j3edvhl+Rf4H+5Xru1oChS9ny1y5bO4Gv9P9MRV0eAm38/ILCxx/txAI
 6rKLa7rSg+kP4xc/uq/LyCF7lBYod78S/bsQqst9AczE0NRup1fUbyU+sBDItAGVDc4a
 HnxcM+hQAGQtwzFZjAK4U+uJLnHsudDq5o6QGIuVniO5JQFqAxTJqEMqULYanXvoSaNB
 cNfiIWTz2QDhh461srNp6JEVudUleUYrjUX7jwxIBINbTNDzonLB+UVFqZVwj/lk18Wr
 V9Yg==
X-Gm-Message-State: AAQBX9f0HtArorluBiMhyQ6cexNt6JhVzMI7Qi5CcWnvwaSVIDpWuh1s
 k3YHokKbpXhaJCj+an+xW/CW1ZOcEtnvDQkcHSwnidNJB387pLM0CsJSgT4Yclmp6LJ1VxY0uho
 VikqK2VE3caddmns=
X-Received: by 2002:a5d:5255:0:b0:2ef:a4c5:ed63 with SMTP id
 k21-20020a5d5255000000b002efa4c5ed63mr578916wrc.22.1680854202909; 
 Fri, 07 Apr 2023 00:56:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLAcivQeVLjFdFgpThnD62SeRhU79+o+kATBkRP5gJMUe2Xo69zbf0xq7Rg59NAoyg9lnszw==
X-Received: by 2002:a5d:5255:0:b0:2ef:a4c5:ed63 with SMTP id
 k21-20020a5d5255000000b002efa4c5ed63mr578908wrc.22.1680854202552; 
 Fri, 07 Apr 2023 00:56:42 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056000180d00b002efac42ff35sm1687963wrh.37.2023.04.07.00.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 00:56:41 -0700 (PDT)
Date: Fri, 7 Apr 2023 03:56:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David 'Digit' Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] Fix libvhost-user.c compilation.
Message-ID: <20230407035423-mutt-send-email-mst@kernel.org>
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-2-digit@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405125920.2951721-2-digit@google.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Apr 05, 2023 at 02:59:19PM +0200, David 'Digit' Turner wrote:
> The source file uses VIRTIO_F_VERSION_1 which is
> not defined by <linux/virtio_config.h> on Debian 10.
> 
> The system-provided <linux/virtio_config.h> which
> does not include the macro definition is included
> through <linux/vhost.h>, so fix the issue by including
> the standard-headers version before that.
> 
> Signed-off-by: David 'Digit' Turner <digit@google.com>

I don't get it. ./linux-headers/linux/vhost.h does not seem
to use <linux/virtio_config.h> for me.
In fact nothing does:
$ git grep linux/virtio_config.h
include/hw/virtio/virtio.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/vhost_types.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_9p.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_balloon.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_blk.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_console.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_crypto.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_fs.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_mem.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_net.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_pmem.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_rng.h:#include "standard-headers/linux/virtio_config.h"
include/standard-headers/linux/virtio_vsock.h:#include "standard-headers/linux/virtio_config.h"
linux-headers/linux/virtio_config.h:#include "standard-headers/linux/virtio_config.h"
scripts/update-linux-headers.sh:cat <<EOF >$output/linux-headers/linux/virtio_config.h
scripts/update-linux-headers.sh:#include "standard-headers/linux/virtio_config.h"
subprojects/libvduse/libvduse.c:#include "linux-headers/linux/virtio_config.h"
tests/qtest/fuzz/virtio_net_fuzz.c:#include "standard-headers/linux/virtio_config.h"
tests/qtest/libqos/virtio-gpio.c:#include "standard-headers/linux/virtio_config.h"
tests/qtest/libqos/virtio-pci-modern.c:#include "standard-headers/linux/virtio_config.h"
tests/qtest/libqos/virtio.c:#include "standard-headers/linux/virtio_config.h"




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


