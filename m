Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1D30A92D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:59:25 +0100 (CET)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Zjg-0005sS-CK
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l6Zic-0005GR-TI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:58:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l6Zia-0008GZ-B2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612187893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dY3cnIFz4rDo4iEsIquynSEIqkgb2qf25tlo9xdgdYo=;
 b=DpV0128Wwzlp1PhJ40kzg6SO7NQ5Z5/fovk+nW9JwijNwRF9a+TU4QnAzQxxYOwKrzNuUy
 pr8B/e6e/nLWswlxUKk7MtAWfNDzhXmNfOk8+KxiFrHfVMuHo5702ThGLHHFNEPzyIVeze
 21thwgoS+EPuBRajERcPbb+3tHaYZgc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ZQ1kFxmHO0mOHZ_idNKZ_A-1; Mon, 01 Feb 2021 08:58:12 -0500
X-MC-Unique: ZQ1kFxmHO0mOHZ_idNKZ_A-1
Received: by mail-wm1-f70.google.com with SMTP id y9so377107wmj.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dY3cnIFz4rDo4iEsIquynSEIqkgb2qf25tlo9xdgdYo=;
 b=XAvuj1O9URqvoxCk6dpBWqxTCt5moF3kb7t6WyU/UyRQrFjZKZgk05cbCQwO4p43xP
 fzdkhPCmW5Q3QwZl9vtoX7+da0/fYg0gasl/xeLZY21sM0UnQ/gAx2mCZHLQqWBQMqlo
 gshHSPsg1FS9Z9loEB/AUvdjSTW8wqqr2y9uwuOonZd+/69PJWvAgWF9BwRYTsGUnajR
 /JX6KvyTwj1ILORjbwEzZ9Ml9QY3oorilfXnOa0kgYMlvD2eCE6paqZmIIqp14cZOCtf
 u0/bD/uMFizh4Lb9djkOqAYW57hQ3tNK3WAmAQfuuRcgLi31eXb4lk7A4yMOBHqtQMk7
 otHQ==
X-Gm-Message-State: AOAM533FKe2afGr4bGB2lS0m0zBMF8poyYDpIL5vDU1OJ6u7VMqQIhCS
 wlFwORGqxQUN0dVgAs5HeGMyMING/l7KJ3pa+/rG6j/YuTWpPpWRxuT81p7DQBv560Okjz1Ppdk
 uIGu5kcRZz2flSrk=
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr18264052wrq.309.1612187890862; 
 Mon, 01 Feb 2021 05:58:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiaG0ngjM+/7Nn4S+hz+8ylihMfv7aSlYHVD232KbLzG2fy9zPmKFZkQAWNH5Fop/RA7jpkg==
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr18264036wrq.309.1612187890684; 
 Mon, 01 Feb 2021 05:58:10 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id q18sm27132293wrr.55.2021.02.01.05.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:58:10 -0800 (PST)
Date: Mon, 1 Feb 2021 14:58:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH] vhost: Check for valid vdev in
 vhost_backend_handle_iotlb_msg
Message-ID: <20210201135807.uqp5ehez4ojwvidl@steredhat>
References: <20210129090728.831208-1-eperezma@redhat.com>
 <20210201115954.6v6ga7ledlumeby4@steredhat>
 <CAJaqyWferxXcOXftXz8Oz0VunZ7oSh6zc1QdrM8VOnNbFqN1Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWferxXcOXftXz8Oz0VunZ7oSh6zc1QdrM8VOnNbFqN1Pw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 02:06:53PM +0100, Eugenio Perez Martin wrote:
>On Mon, Feb 1, 2021 at 1:00 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Fri, Jan 29, 2021 at 10:07:28AM +0100, Eugenio Pérez wrote:
>> >Not checking this can lead to invalid dev->vdev member access in
>> >vhost_device_iotlb_miss if backend issue an iotlb message in a bad
>> >timing, either maliciously or by a bug.
>> >
>> >Reproduced rebooting a guest with testpmd in txonly forward mode.
>> > #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
>> >     dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
>> >     at ../hw/virtio/vhost.c:1013
>> > #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
>> >     imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
>> >     at ../hw/virtio/vhost-backend.c:411
>> > #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
>> >     imsg=imsg@entry=0x7ffddcfd32c0)
>> >     at ../hw/virtio/vhost-backend.c:404
>> > #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
>> >     at ../hw/virtio/vhost-user.c:1464
>> > #4  0x000055a0000c541b in aio_dispatch_handler (
>> >     ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
>> >     at ../util/aio-posix.c:329
>> >
>> >Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
>>
>> I'm not sure but IIUC vhost_backend_handle_iotlb_msg() was introduced by
>> commit 020e571b8b, so maybe is better this 'Fixes' line:
>>
>> Fixes: 020e571b8b ("vhost: rework IOTLB messaging")
>>
>
>Hi Stefano.
>
>Thanks for reviewing it :). Actually yes, you are right, I carried the
>previous Fixes line by mistake.
>
>Should I send a new patch?

Maybe Michael can fix it while applying, but I'm not sure, let's see 
what he says :-)

Stefano

>
>Thanks!
>
>
>> >Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> >---
>> > hw/virtio/vhost-backend.c | 5 +++++
>> > 1 file changed, 5 insertions(+)
>> >
>> >diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>> >index 222bbcc62d..31b33bde37 100644
>> >--- a/hw/virtio/vhost-backend.c
>> >+++ b/hw/virtio/vhost-backend.c
>> >@@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
>> > {
>> >     int ret = 0;
>> >
>> >+    if (unlikely(!dev->vdev)) {
>> >+        error_report("Unexpected IOTLB message when virtio device is stopped");
>> >+        return -EINVAL;
>> >+    }
>> >+
>> >     switch (imsg->type) {
>> >     case VHOST_IOTLB_MISS:
>> >         ret = vhost_device_iotlb_miss(dev, imsg->iova,
>> >--
>> >2.27.0
>> >
>> >
>>
>> The patch LGTM:
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>


