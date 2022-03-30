Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397804EBB97
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 09:18:11 +0200 (CEST)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZSao-0001e1-B3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 03:18:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZSVr-00076u-2m
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZSVn-0000yb-S2
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 03:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648624379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wagk3aJlOobfsNTjn6UxXIO3u2PY5f9jEjn0TWSBg8s=;
 b=S5cfi2adlr3Jk7+b7SV02VtnE1Y5JTljjKm0mFo5+gZWiMoK7IGJOIiJ1geYROebmnjhSz
 JlgVuh3dkjTuRCj0MdWh1cjGGk+fggqhGUI31tbgDth/ZJ/nf0PeK5Fm8I53lapuCbx6HD
 OfMgqsACCFoI6mp33cfz7vteFdEIdyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Z2bNt1_TMYGzLbfRRnHIGw-1; Wed, 30 Mar 2022 03:12:56 -0400
X-MC-Unique: Z2bNt1_TMYGzLbfRRnHIGw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74CCD185A79C;
 Wed, 30 Mar 2022 07:12:54 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC918400E43D;
 Wed, 30 Mar 2022 07:12:52 +0000 (UTC)
Message-ID: <93ade429-fe40-e6bf-9f46-f5d56e8703a6@redhat.com>
Date: Wed, 30 Mar 2022 09:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/4] virtio-ccw: do not include headers for all virtio
 devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-5-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328143019.682245-5-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 16.30, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/s390x/ipl.c        |  3 +++
>   hw/s390x/virtio-ccw.h | 16 ----------------
>   2 files changed, 3 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index e21776822a..ca56a1b29a 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -27,11 +27,14 @@
>   #include "hw/s390x/css.h"
>   #include "hw/s390x/ebcdic.h"
>   #include "hw/s390x/pv.h"
> +#include "hw/scsi/scsi.h"
> +#include "hw/virtio/virtio-net.h"
>   #include "ipl.h"
>   #include "qemu/error-report.h"
>   #include "qemu/config-file.h"
>   #include "qemu/cutils.h"
>   #include "qemu/option.h"
> +#include "standard-headers/linux/virtio_ids.h"
>   #include "exec/exec-all.h"
>   
>   #define KERN_IMAGE_START                0x010000UL
> diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
> index fc131194bf..fac186c8f6 100644
> --- a/hw/s390x/virtio-ccw.h
> +++ b/hw/s390x/virtio-ccw.h
> @@ -13,24 +13,8 @@
>   #ifndef HW_S390X_VIRTIO_CCW_H
>   #define HW_S390X_VIRTIO_CCW_H
>   
> -#include "hw/virtio/virtio-blk.h"
> -#include "hw/virtio/virtio-net.h"
> -#include "hw/virtio/virtio-serial.h"
> -#include "hw/virtio/virtio-scsi.h"
>   #include "qom/object.h"
> -#ifdef CONFIG_VHOST_SCSI
> -#include "hw/virtio/vhost-scsi.h"
> -#endif
> -#include "hw/virtio/virtio-balloon.h"
> -#include "hw/virtio/virtio-rng.h"
> -#include "hw/virtio/virtio-crypto.h"
>   #include "hw/virtio/virtio-bus.h"
> -#ifdef CONFIG_VHOST_VSOCK
> -#include "hw/virtio/vhost-vsock.h"
> -#endif /* CONFIG_VHOST_VSOCK */
> -#include "hw/virtio/virtio-gpu.h"
> -#include "hw/virtio/virtio-input.h"
> -
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/s390x/css.h"
>   #include "ccw-device.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>



