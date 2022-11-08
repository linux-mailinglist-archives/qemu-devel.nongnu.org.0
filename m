Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB8E620B7C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:48:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKGK-0000l2-LW; Tue, 08 Nov 2022 03:47:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osKGD-0000im-Fs
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osKGB-0006sn-NE
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667897227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9hAOETTV5XRrmqiOw+lkKmlT51B+UZIobe/uvZ2Z8A=;
 b=N0/3BN1RLGZElUb9tqJvy3iVzZ2XIqY+zaOuIlhjibWqRZCnvbpGn7kGYMhLFp1WY1Ps6X
 MvJ+9fwUhvsisV6+DenjJttuQZOj28h8lBgWICbFW/tPaGaUfP6i2ffiqgR4381pAp948d
 eSK6uhMasQImSDn9rjIKPIFcSgvtILM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-ovDPqYRFPOu8ZS7pvm--Cg-1; Tue, 08 Nov 2022 03:47:05 -0500
X-MC-Unique: ovDPqYRFPOu8ZS7pvm--Cg-1
Received: by mail-qk1-f198.google.com with SMTP id
 u6-20020a05620a430600b006e47fa02576so12386611qko.22
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 00:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9hAOETTV5XRrmqiOw+lkKmlT51B+UZIobe/uvZ2Z8A=;
 b=gfRQFe/AdKOgb+9rhkQESSSp28KMOpl8VI81U41T6MMm9Yx/VL6Hylw/ocUF0TyrTr
 A0j03t/9Z9fHeYkK8GKgnOG3QSPz3jl+tPBw23ld95K+CJ5exWvJ3LwqEP85j54XZeck
 S+7BF+DnTygGDEH/x46QQ6zFJRCm5plss4n0bk76PySlj1UE61fzfoxj/beIDb8HCcKG
 9Y+u7jZxaajRKUIgBr3f1eO1SKnljLEnoR6JgRvakGKImUEUWMBHtcGqMshmFbjpyYVv
 wdPSv4ExgLAZ+B+LO1p693j7j9ZzGRqMV8rV1NerBMSKlzRGzMgJprpBSzhQu3OiVVpT
 V1aw==
X-Gm-Message-State: ACrzQf2sBzLyvbbhySi4zHrWmijJniW7fOptFLRhYW70frphazHAVstk
 35LMzdZkUY7hnv788t7GOG/4QUefDo8AyoiFA/NVp1tX9DlgRoNlwCujgNFrkkHdD43OdG5UulI
 8LxaKwei+sjVcK10=
X-Received: by 2002:a05:620a:2408:b0:6fa:a0f5:7e03 with SMTP id
 d8-20020a05620a240800b006faa0f57e03mr13215671qkn.271.1667897224986; 
 Tue, 08 Nov 2022 00:47:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6g6Z9L8QfUFwK/choSVLGHv0lVEinqpnefx1n+scUP0V6T6NJpkNDp+QhDtcPafC6XKjeNIg==
X-Received: by 2002:a05:620a:2408:b0:6fa:a0f5:7e03 with SMTP id
 d8-20020a05620a240800b006faa0f57e03mr13215658qkn.271.1667897224763; 
 Tue, 08 Nov 2022 00:47:04 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 q21-20020a37f715000000b006ed61f18651sm8612824qkj.16.2022.11.08.00.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 00:47:04 -0800 (PST)
Date: Tue, 8 Nov 2022 09:46:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org,
 xiehong@huawei.com
Subject: Re: [PATCH v8 4/5] vdpa-dev: mark the device as unmigratable
Message-ID: <20221108084658.nurokqjcc3lmieet@sgarzare-redhat>
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-5-longpeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221108004157.1112-5-longpeng2@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Tue, Nov 08, 2022 at 08:41:56AM +0800, Longpeng(Mike) wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>The generic vDPA device doesn't support migration currently, so
>mark it as unmigratable temporarily.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev.c | 1 +
> 1 file changed, 1 insertion(+)

Is there a particular reason why we don't squash this change in the 
second patch of this series where we add the hw/virtio/vdpa-dev.c file?

Anyway, this change LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index 2885d06cbe..62d83d3423 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -327,6 +327,7 @@ static Property vhost_vdpa_device_properties[] = {
>
> static const VMStateDescription vmstate_vhost_vdpa_device = {
>     .name = "vhost-vdpa-device",
>+    .unmigratable = 1,
>     .minimum_version_id = 1,
>     .version_id = 1,
>     .fields = (VMStateField[]) {
>-- 
>2.23.0
>


