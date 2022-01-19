Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953964939BC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:41:08 +0100 (CET)
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA9Kt-0002rD-MI
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA9G9-0007tc-EC
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nA9G5-0000hH-Fo
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642592167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kW+3VxxYRUeyw/tav6eUmZFRRTo/LbhzZJolwIk+coc=;
 b=X7OQHFwOhEUSQZaolFUussuDStBesrzQlVAksjNDFzQcHUXvjAepk6qbxF7rfwL2O6A43s
 BMePp5uw8ic+8woKyCWYqnAWzK1IqQg18BPJED7Q9pgJwn1SBdN5GS4F7iKSP4QNbgW+mN
 wWaTlos/F2CVxTDa8kC6rr4/vzg2fY8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-fIIhP73RMKC2-0kWS5kpEw-1; Wed, 19 Jan 2022 06:36:06 -0500
X-MC-Unique: fIIhP73RMKC2-0kWS5kpEw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f187-20020a1c38c4000000b0034d5c66d8f5so1814586wma.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 03:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kW+3VxxYRUeyw/tav6eUmZFRRTo/LbhzZJolwIk+coc=;
 b=0/qMYB/ob7I0Ca3Wa9WJ8NJfQnehjW8Aj7Yl7lqj+26cFDS5wZD9rS0n0+ZKdaiViC
 ipr4ppb2FJLjO0y/1bC39gmXn/Jk1jINs2lhr122aOmlJ8O6Jg62pGkGciITTdVldqIy
 +FLQMvJwiiuKy4BFYd6nBt36V2WDeExIt9ZxPPzmAXmv71ccql5REFO2BeF7NkPd/8k/
 HGeUSXe3tXOoeHx01QU11pwpSneslvnzxZEbeuZ+q5C3Jc+g+0JjKrsAkJp6I781yolR
 XOt00GRwgfiqmMP9CTzn0aDultfYVQe4LEMMo3S8Nxr8IP8rQeFDBTfFQfSQzdIsY26f
 p2kQ==
X-Gm-Message-State: AOAM533oQFUuMKJyTIbwvLvg5gEQvAVyoFNwTQRI1xK6fRXZ5ZKSQiIW
 dakganMe9z0LUkPyOxaLNmlhic7K63r37u1nIVR9RGftNiyMsWJx3dXO3PAbXwKylsboPgtSnko
 9q64Vt+bq3uetAAY=
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr3002418wmh.118.1642592165562; 
 Wed, 19 Jan 2022 03:36:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIRBV0rZ/s+VzTqdkoqa2EylfIPqUEijAgouo55B+yn9DuPbKgG1Xakg4PkUz5sZspAZx+eg==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr3002397wmh.118.1642592165327; 
 Wed, 19 Jan 2022 03:36:05 -0800 (PST)
Received: from steredhat (host-95-238-125-214.retail.telecomitalia.it.
 [95.238.125.214])
 by smtp.gmail.com with ESMTPSA id t8sm5090474wmq.43.2022.01.19.03.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 03:36:04 -0800 (PST)
Date: Wed, 19 Jan 2022 12:36:01 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 06/10] vdpa-dev: implement the unrealize interface
Message-ID: <20220119113601.rrd3fhr7lkyvu6lb@steredhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-7-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220117124331.1642-7-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 yechuan@huawei.com, arei.gonglei@huawei.com, huangzhichao@huawei.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 08:43:27PM +0800, Longpeng(Mike) via wrote:
>From: Longpeng <longpeng2@huawei.com>
>
>Implements the .unrealize interface.
>
>Signed-off-by: Longpeng <longpeng2@huawei.com>
>---
> hw/virtio/vdpa-dev.c | 24 +++++++++++++++++++++++-
> 1 file changed, 23 insertions(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>index bd28cf7a15..e5691d02bb 100644
>--- a/hw/virtio/vdpa-dev.c
>+++ b/hw/virtio/vdpa-dev.c
>@@ -132,9 +132,31 @@ out:
>     s->vdpa_dev_fd = -1;
> }
>
>+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
>+{
>+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
>+    int i;
>+
>+    for (i = 0; i < s->num_queues; i++) {
>+        virtio_delete_queue(s->virtqs[i]);
>+    }
>+    g_free(s->virtqs);
>+    virtio_cleanup(vdev);
>+
>+    g_free(s->config);

Is there a particular reason for these steps in a separate function?

>+}
>+
> static void vhost_vdpa_device_unrealize(DeviceState *dev)
> {
>-    return;
>+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>+
>+    virtio_set_status(vdev, 0);
>+    vhost_vdpa_vdev_unrealize(s);
>+    g_free(s->dev.vqs);
>+    vhost_dev_cleanup(&s->dev);
>+    qemu_close(s->vdpa_dev_fd);
>+    s->vdpa_dev_fd = -1;
> }

Maybe we can have all steps (in the reverse order of 
vhost_vdpa_device_realize) in vhost_vdpa_device_unrealize().

Stefano


