Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227714ECAC5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:34:52 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcDa-0007ww-Vx
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:34:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZcBA-0005r2-RW
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nZcB8-00046e-SX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648661538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8iJQK37PQ2Y9fUEbfefVWu17bUBqRK8Kuh1TohmJzZQ=;
 b=fkoSrC3aTjLuC9wgNQe+/MoezdI1KtlSDDwL6QZczWrDXHY+JnxdQweZ3gDI2TNEpF23Kj
 On1R/ou9e0wuAupfUbpnmxRcTiuT1aEAvxLcosgqrEVN5o3PDYf/LbMsQ21OY90VrRHvHA
 WNgmtrymWnW7hAVBgb73BOFJ75HXWI8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-Q69RePdiMjmBz8BhYDIkSA-1; Wed, 30 Mar 2022 13:32:16 -0400
X-MC-Unique: Q69RePdiMjmBz8BhYDIkSA-1
Received: by mail-qv1-f71.google.com with SMTP id
 r2-20020a056214068200b00440e24889e6so16541982qvz.23
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 10:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8iJQK37PQ2Y9fUEbfefVWu17bUBqRK8Kuh1TohmJzZQ=;
 b=1WDkEnd/0uVatjlZQphXZiAsj5udCBJuJ1fTVeD9iRmgilA7Zu0uOM60LP0s4x689z
 BDjAkfEnsfXFsRBxz3SlXYxuolZW1Xjb/QmI/6Tm6WzZVhiD0JKucBRDpNrMU0bOr0Dz
 CxqOwHuMl3XLj6aaI+LeWj5IQMTpjOfdngIMazALEUCU08dm3lh2MTXeSdlpPewHC/cj
 fiJXCRoMLpOV3EKhbWMnxgI2IJxR5SmHB5RDviKJ8RTUBDUR+DqKfy6ftTDSRxNjj6ex
 zPwFyd6jhs5l1XQ+DggyIymUCj4MLkJLYBs6J67Nl8tgkyCtOCr7rtatJUv2AyGXg8oE
 u1cA==
X-Gm-Message-State: AOAM531/Qmi9Turi5rs+/eonWGrjfCZYQvxd6V+GwJy+rAkKb1kExJvW
 fvAyL+SgYPxjBhRGzdWL8oE+R1E0IppY8kp+tlZIZ54k3H6CBE9TcQP+yodNsvmjmXqZ8KqB0ni
 Hbc/omS04pq3A40Q=
X-Received: by 2002:ac8:7e84:0:b0:2eb:8ec5:27b6 with SMTP id
 w4-20020ac87e84000000b002eb8ec527b6mr607427qtj.416.1648661536298; 
 Wed, 30 Mar 2022 10:32:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9SaqMAYB1wi4tj/0glEFe0Gxe7OGzGe2prmedqUvMwzP1KBUpBdpImywbupA61LZFPZjqBQ==
X-Received: by 2002:ac8:7e84:0:b0:2eb:8ec5:27b6 with SMTP id
 w4-20020ac87e84000000b002eb8ec527b6mr607398qtj.416.1648661536049; 
 Wed, 30 Mar 2022 10:32:16 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-67.retail.telecomitalia.it.
 [79.46.200.67]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05622a13d000b002e227782e9asm17362450qtk.14.2022.03.30.10.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:32:15 -0700 (PDT)
Date: Wed, 30 Mar 2022 19:32:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Message-ID: <20220330173209.2rj43622nfa46s7p@sgarzare-redhat>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
 <eaac0521-949d-6f8e-63e0-cebecd9a33b9@oracle.com>
MIME-Version: 1.0
In-Reply-To: <eaac0521-949d-6f8e-63e0-cebecd9a33b9@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eperezma@redhat.com, jasowang@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, eli@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 10:12:42AM -0700, Si-Wei Liu wrote:
>
>
>On 3/30/2022 9:24 AM, Stefano Garzarella wrote:
>>On Tue, Mar 29, 2022 at 11:33:17PM -0700, Si-Wei Liu wrote:
>>>The vhost_vdpa_one_time_request() branch in
>>>vhost_vdpa_set_backend_cap() incorrectly sends down
>>>iotls on vhost_dev with non-zero index. This may
>>
>>Little typo s/iotls/ioctls
>Thanks! Will correct it in v2.
>
>>
>>>end up with multiple VHOST_SET_BACKEND_FEATURES
>>>ioctl calls sent down on the vhost-vdpa fd that is
>>>shared between all these vhost_dev's.
>>>
>>>To fix it, send down ioctl only once via the first
>>>vhost_dev with index 0. Toggle the polarity of the
>>>vhost_vdpa_one_time_request() test would do the trick.
>>>
>>>Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>---
>>>hw/virtio/vhost-vdpa.c | 2 +-
>>>1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>index c5ed7a3..27ea706 100644
>>>--- a/hw/virtio/vhost-vdpa.c
>>>+++ b/hw/virtio/vhost-vdpa.c
>>>@@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct 
>>>vhost_dev *dev)
>>>
>>>    features &= f;
>>>
>>>-    if (vhost_vdpa_one_time_request(dev)) {
>>>+    if (!vhost_vdpa_one_time_request(dev)) {
>>>        r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>>        if (r) {
>>>            return -EFAULT;
>>>-- 
>>>1.8.3.1
>>>
>>>
>>
>>With that:
>>
>>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>>
>>
>>Unrelated to this patch, but the name vhost_vdpa_one_time_request() 
>>is confusing IMHO.
>Coincidentally I got the same feeling and wanted to rename it to 
>something else, too.
>
>>
>>Not that I'm good with names, but how about we change it to 
>>vhost_vdpa_skip_one_time_request()?
>How about vhost_vdpa_request_already_applied()? seems to be more 
>readable in the context.

That's fine too, except you can't discern that it's a single request per 
device, so maybe I'd add "dev," but I don't know if it gets too long:

vhost_vdpa_dev_request_already_applied()

And I would also add a comment to the function to explain that we use 
that function for requests that only need to be applied once, regardless 
of the number of queues.

Thanks,
Stefano


