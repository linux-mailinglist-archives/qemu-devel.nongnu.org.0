Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E3513F0C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:27:25 +0200 (CEST)
Received: from localhost ([::1]:41354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDXg-0004AT-80
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOG-0006Tm-7I
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDOE-0007lE-HF
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0p4nIL1P1o1MulT2NaDNSeA4wLtRLHWH4hAnYtXrw8=;
 b=BZ95qKO/gHwtF/7eTo+OnI4l+hlrqTjy3jp8LXq1BldvUh7uF4nBB1on0ygTguywg3o5kW
 KMjra/dDRkcv+KEQZX2PSSs8x8DShZVrBWzDWctpBmGjI0g/GxzibuPwOmpdb3uzEzjoaN
 hpdI5BljfW/u6GTGIu8jlqdDOcKcg3Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-mjDvVqt6PeadtdjE2e2WIw-1; Thu, 28 Apr 2022 19:17:33 -0400
X-MC-Unique: mjDvVqt6PeadtdjE2e2WIw-1
Received: by mail-ed1-f69.google.com with SMTP id
 dk9-20020a0564021d8900b00425a9c3d40cso3517881edb.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O0p4nIL1P1o1MulT2NaDNSeA4wLtRLHWH4hAnYtXrw8=;
 b=mOqiG6Y/D0QSFJ3eWVXFDYqTv0K0v7saoYdJuwqsgOBSLT/RqVYPH8UigKrCgrR8j2
 JEWugXczXOsLXUlrBIxzt9A8r/NXxbls10sR+y8nZuaNFgsGJE4ISidyph0WHrK4VkHb
 z78VVPP47q0HeaTgZJaSbYrQZQrpgXNC9NKcrwS2l8PkeJpsTUBddNmXYBn0Q9eKpSB1
 yYe+yhoRdU/7cnmtKQ0sxJzX3Maqqfq5OmKstUoaoKG8phDdsVGAlGxnppxpKegiZslF
 cF/Ji9xqhM2iouQASA3XqoLZor/LmdSm4j7cuywxCDgyNlS5fU9JyXq285b04AXnV/il
 ogZg==
X-Gm-Message-State: AOAM530hcuXx8PRGMTwxg5R/WXEn+nu/2Aut6SU7p+q89Uamlw/EV/D0
 jvFniCf+5pYpPAqCCXyAzKTw9UzyQgPqRz7UKeDEneH1DgewtE9VlcJBZpLrPiBk7GuPoWzqPI9
 fza01sY3VXMnWzxc=
X-Received: by 2002:a17:906:9b87:b0:6f3:a51e:80c9 with SMTP id
 dd7-20020a1709069b8700b006f3a51e80c9mr18817616ejc.362.1651187852430; 
 Thu, 28 Apr 2022 16:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFwq83Hy9bXv4mDXDcfofxLBV4hYqScRteqpxRuJhFN71wVk4sSLhQdMH43J+bts/crLp8Iw==
X-Received: by 2002:a17:906:9b87:b0:6f3:a51e:80c9 with SMTP id
 dd7-20020a1709069b8700b006f3a51e80c9mr18817606ejc.362.1651187852227; 
 Thu, 28 Apr 2022 16:17:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 j19-20020aa7c353000000b0042617ba6390sm2238554edr.26.2022.04.28.16.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:17:31 -0700 (PDT)
Message-ID: <d134dd90-6d10-91a4-0fb6-80c71414e4ab@redhat.com>
Date: Fri, 29 Apr 2022 01:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/6] virtio-scsi: clean up virtio_scsi_handle_cmd_vq()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-6-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:35, Stefan Hajnoczi wrote:
> virtio_scsi_handle_cmd_vq() is only called from hw/scsi/virtio-scsi.c
> now and its return value is no longer used. Remove the function
> prototype from virtio-scsi.h and drop the return value.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/hw/virtio/virtio-scsi.h | 1 -
>   hw/scsi/virtio-scsi.c           | 5 +----
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 44dc3b81ec..2497530064 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -151,7 +151,6 @@ void virtio_scsi_common_realize(DeviceState *dev,
>                                   Error **errp);
>   
>   void virtio_scsi_common_unrealize(DeviceState *dev);
> -bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq);
>   void virtio_scsi_init_req(VirtIOSCSI *s, VirtQueue *vq, VirtIOSCSIReq *req);
>   void virtio_scsi_free_req(VirtIOSCSIReq *req);
>   void virtio_scsi_push_event(VirtIOSCSI *s, SCSIDevice *dev,
> diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> index eefda16e4b..12c6a21202 100644
> --- a/hw/scsi/virtio-scsi.c
> +++ b/hw/scsi/virtio-scsi.c
> @@ -685,12 +685,11 @@ static void virtio_scsi_handle_cmd_req_submit(VirtIOSCSI *s, VirtIOSCSIReq *req)
>       scsi_req_unref(sreq);
>   }
>   
> -bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq)
> +static void virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq)
>   {
>       VirtIOSCSIReq *req, *next;
>       int ret = 0;
>       bool suppress_notifications = virtio_queue_get_notification(vq);
> -    bool progress = false;
>   
>       QTAILQ_HEAD(, VirtIOSCSIReq) reqs = QTAILQ_HEAD_INITIALIZER(reqs);
>   
> @@ -700,7 +699,6 @@ bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq)
>           }
>   
>           while ((req = virtio_scsi_pop_req(s, vq))) {
> -            progress = true;
>               ret = virtio_scsi_handle_cmd_req_prepare(s, req);
>               if (!ret) {
>                   QTAILQ_INSERT_TAIL(&reqs, req, next);
> @@ -725,7 +723,6 @@ bool virtio_scsi_handle_cmd_vq(VirtIOSCSI *s, VirtQueue *vq)
>       QTAILQ_FOREACH_SAFE(req, &reqs, next, next) {
>           virtio_scsi_handle_cmd_req_submit(s, req);
>       }
> -    return progress;
>   }
>   
>   static void virtio_scsi_handle_cmd(VirtIODevice *vdev, VirtQueue *vq)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


