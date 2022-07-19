Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A703B5790EB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 04:38:42 +0200 (CEST)
Received: from localhost ([::1]:42788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDd8D-0002bM-71
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 22:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDd6n-0001FY-RL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDd6k-0006JF-3P
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 22:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658198229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNK+P9XCQYu1e6ptrEbO/fEYTNXKTTGhAccFWrkz0bE=;
 b=MN1/30VcyeevMsGam+biqNTbN7LJ2MvMHap+gfesd4cHy5t8qh1MgeRIF6TwHPkPrB0whb
 mdoqcsl+1ygJkP+3RxIMNERjjqwpOEKy6A7VYaufaGS5NS4MnAcpToQ+n0Y2SRLSi1JPg0
 88Pgp1LqufeCKBjM3/yB4XjSPWVDO4Y=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-ez_yMiX5MSWczHNuS3bCiQ-1; Mon, 18 Jul 2022 22:37:08 -0400
X-MC-Unique: ez_yMiX5MSWczHNuS3bCiQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 bt6-20020a056a00438600b0052b41c191a4so1826209pfb.19
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 19:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vNK+P9XCQYu1e6ptrEbO/fEYTNXKTTGhAccFWrkz0bE=;
 b=3vB7v9/J6DmtwKGUs0C+YMRzliLRljxQBWzMU9G2gbZ1MHQqrap/ivPcZlCoN2xZG8
 3szhSrSHcWg9mLeC4ECfm2GDLg26A58xtIeSqYdmPW3UJ/Pbb+Y8dVHSqljWRIn/Dpuj
 /5mUkFQr5UrF+/VlAt3zODrbyAFA3Nw2021NUVBjYO0A5DtQs3+6XUcV/ABfCzc7F+tu
 durZOAL76mYdvVB0T12MW4HNWHOk/FOOPU/kf4ySAiUaEx4Bpp0UPDn3UkgbpG/5xxky
 eaCiXniV4dMPPmgUG4VnwzRlZCLbOC3NQIUFRRLmpph2qdPzPGP4dafvOOpqxiG5Ebk/
 Qrnw==
X-Gm-Message-State: AJIora8y6cDipzU57CUT3P9HNBdun7kVmLWJykcOg1f6moRxI80pu83D
 yQDX4qNiHKkRsnzDAbFIWZ1IjU5MZxMQ5EIYCBPf2RrduQ8rGm/kGD/wBe2TqRQD72U2S9B3+sh
 jqc7QJJPLi3zOCCE=
X-Received: by 2002:a63:87c6:0:b0:41a:3cc2:1f29 with SMTP id
 i189-20020a6387c6000000b0041a3cc21f29mr3950284pge.96.1658198227020; 
 Mon, 18 Jul 2022 19:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1m9NoiIVbiKyqBh9R1Lip/Tq71YjI/go5cxOqMHhFwO2y2XfkO0ObtgsgKeaBATTSSuSMdA==
X-Received: by 2002:a63:87c6:0:b0:41a:3cc2:1f29 with SMTP id
 i189-20020a6387c6000000b0041a3cc21f29mr3950250pge.96.1658198226654; 
 Mon, 18 Jul 2022 19:37:06 -0700 (PDT)
Received: from [10.72.13.162] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 o67-20020a62cd46000000b0051c1b445094sm10009936pfg.7.2022.07.18.19.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 19:37:06 -0700 (PDT)
Message-ID: <2ea4381c-9868-98ab-c644-a93fefa014de@redhat.com>
Date: Tue, 19 Jul 2022 10:36:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 18/19] vdpa: Add device migration blocker
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
 <20220718102949.2868267-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220718102949.2868267-19-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/18 18:29, Eugenio Pérez 写道:
> Since the vhost-vdpa device is exposing _F_LOG, adding a migration blocker if
> it uses CVQ.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/hw/virtio/vhost-vdpa.h |  1 +
>   hw/virtio/vhost-vdpa.c         | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 1111d85643..d10a89303e 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -35,6 +35,7 @@ typedef struct vhost_vdpa {
>       bool shadow_vqs_enabled;
>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
> +    Error *migration_blocker;
>       GPtrArray *shadow_vqs;
>       const VhostShadowVirtqueueOps *shadow_vq_ops;
>       void *shadow_vq_ops_opaque;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index beaaa7049a..795ed5a049 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -20,6 +20,7 @@
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost-vdpa.h"
>   #include "exec/address-spaces.h"
> +#include "migration/blocker.h"
>   #include "qemu/cutils.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
> @@ -1022,6 +1023,13 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
>           return true;
>       }
>   
> +    if (v->migration_blocker) {
> +        int r = migrate_add_blocker(v->migration_blocker, &err);
> +        if (unlikely(r < 0)) {
> +            goto err_migration_blocker;
> +        }
> +    }
> +
>       for (i = 0; i < v->shadow_vqs->len; ++i) {
>           VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> @@ -1064,6 +1072,9 @@ err:
>           vhost_svq_stop(svq);
>       }
>   
> +err_migration_blocker:
> +    error_reportf_err(err, "Cannot setup SVQ %u: ", i);


So I got this:

FAILED: libqemu-x86_64-softmmu.fa.p/hw_virtio_vhost-vdpa.c.o
cc -m64 -mcx16 -Ilibqemu-x86_64-softmmu.fa.p -I. -I.. -Itarget/i386 
-I../target/i386 -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 
-I/usr/include/capstone -I/usr/include/glib-2.0 
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto 
-Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem 
/home/devel/git/qemu/linux-headers -isystem linux-headers -iquote . 
-iquote /home/devel/git/qemu -iquote /home/devel/git/qemu/include 
-iquote /home/devel/git/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE 
-D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common 
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits 
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers 
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs 
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE 
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H 
'-DCONFIG_TARGET="x86_64-softmmu-config-target.h"' 
'-DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"' -MD -MQ 
libqemu-x86_64-softmmu.fa.p/hw_virtio_vhost-vdpa.c.o -MF 
libqemu-x86_64-softmmu.fa.p/hw_virtio_vhost-vdpa.c.o.d -o 
libqemu-x86_64-softmmu.fa.p/hw_virtio_vhost-vdpa.c.o -c 
../hw/virtio/vhost-vdpa.c
../hw/virtio/vhost-vdpa.c: In function ‘vhost_vdpa_dev_start’:
../hw/virtio/vhost-vdpa.c:1076:5: error: ‘i’ may be used uninitialized 
in this function [-Werror=maybe-uninitialized]
  1076 |     error_reportf_err(err, "Cannot setup SVQ %u: ", i);
       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/virtio/vhost-vdpa.c:1020:14: note: ‘i’ was declared here
  1020 |     unsigned i;
       |              ^
cc1: all warnings being treated as errors

And this error is kind of duplicated with the one that is reported in 
label "err" above.

Thanks


> +
>       return false;
>   }
>   
> @@ -1083,6 +1094,9 @@ static bool vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>           }
>       }
>   
> +    if (v->migration_blocker) {
> +        migrate_del_blocker(v->migration_blocker);
> +    }
>       return true;
>   }
>   


