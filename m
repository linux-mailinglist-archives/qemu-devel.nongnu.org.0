Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B4B3DFB84
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 08:42:06 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBAbM-0002dV-00
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 02:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBAaY-0001sB-PF
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mBAaU-0006s9-7E
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 02:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628059268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+RQJPVFNSdR9WyIQGFO/iMj7Zcejo00HN4rLk5c6rQg=;
 b=K48CFCC+srVpVtl27Cqv1n5pNwAQV4I3IpPSfEjqHICxnkxCRWCnsPX1h+3c0dTcIDmYhn
 KSRoNeLVG2se6XuLXDdrlkTePZlnmGZBGKwrnoJLAhTl7jLpXCnIoM11K2jWK6x6rVLg/D
 D6WC/2IPFl2NDXD2AfFleohPYIHV6WE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-G-ndu9aPOqiYdO_WxSiOnA-1; Wed, 04 Aug 2021 02:41:07 -0400
X-MC-Unique: G-ndu9aPOqiYdO_WxSiOnA-1
Received: by mail-ed1-f69.google.com with SMTP id
 n24-20020aa7c7980000b02903bb4e1d45aaso939554eds.15
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 23:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+RQJPVFNSdR9WyIQGFO/iMj7Zcejo00HN4rLk5c6rQg=;
 b=qX0NgL84TqtuY0uamMGYKvfVjAI/XmVHFzTg1gqL0QohAW6IryAi1NPC7v8+yh8zmC
 KA/Bvp1yfsRWc0jlNyBrSA7EuB9EFp1BKjSHf6PtocLMJMYVRPZtaSnCawoj16mAQjJ2
 E53gjcxk/IiLPyWxnps97rJETysrvCq8LWc/NVbaM6a6s/qR4AAe6br8yrsktH5qeppY
 enmLYwLtIZV2ipZQpwXirvlJl/Ipc/9N233JECXXnZY02dVO8qi3PZltu4NymNeOSUgs
 iNvwJtv+740LMCLCs+RB7WuJSo1+wQdyLR66SOZUB5NLQTiUTN1AwA9KHA49u6sAUuLQ
 YaVg==
X-Gm-Message-State: AOAM531vTWIzwshv9CWWexN5Fm6pLJ5MJNVWvK6EFtUSaRctPe+F8ujA
 fBeTYRcJF/FXXX84MpQ7vOGJSmBh4Of1MT6295FofrodmAfmCqC1Edf9hPO7lKec5MeJ/MhBc30
 6YcF6E2JYaWWcaLg=
X-Received: by 2002:a17:906:585a:: with SMTP id
 h26mr24428796ejs.31.1628059266149; 
 Tue, 03 Aug 2021 23:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUc49zVpGMRIo+wvcqSis8YpylUNcLSGE9UVpsbD/rASH+PXG79Dqp6O3r0Lb76YqCA4HQ3A==
X-Received: by 2002:a17:906:585a:: with SMTP id
 h26mr24428781ejs.31.1628059265990; 
 Tue, 03 Aug 2021 23:41:05 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id k21sm361543ejj.55.2021.08.03.23.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 23:41:05 -0700 (PDT)
Date: Wed, 4 Aug 2021 08:41:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
Message-ID: <20210804064103.gvhz3a7ck6xlwsm6@steredhat>
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
 <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
 <CAP_N_Z8ktMLHSG8J7t4WA9MCC5i0o=CUF+VfPSOBnWrMd21idg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z8ktMLHSG8J7t4WA9MCC5i0o=CUF+VfPSOBnWrMd21idg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 11:58:27AM -0700, Jiang Wang . wrote:
>On Wed, Jul 7, 2021 at 10:27 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
>> >On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:

[...]

>> >> >+
>> >> >+    if (nvqs < 0)
>> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>> >> >+
>> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >> >+                                              vhost_vsock_common_handle_output);
>> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >> >+                                               vhost_vsock_common_handle_output);
>> >> >+    }
>> >> >+
>> >> >     /* The event queue belongs to QEMU */
>> >> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >> >                                        vhost_vsock_common_handle_output);
>> >>
>> >> Did you do a test with a guest that doesn't support datagram with QEMU
>> >> and hosts that do?
>> >>
>> >Yes, and it works.
>> >
>> >> I repost my thoughts that I had on v2:
>> >>
>> >>      What happen if the guest doesn't support dgram?
>> >>
>> >>      I think we should dynamically use the 3rd queue or the 5th queue for
>> >>      the events at runtime after the guest acked the features.
>> >>
>> >>      Maybe better to switch to an array of VirtQueue.
>> >>
>> >I think in current V3, it  already dynamically use 3rd or 5th queue
>> >depending
>> >on the feature bit.
>>
>> I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't
>> know the features acked by the guest, so how can it be dynamic?
>>
>> Here we should know only if the host kernel supports it.
>>
>> Maybe it works, because in QEMU we use the event queue only after a
>> migration to send a reset event, so you can try to migrate a guest to
>> check this path.
>>
>I tried VM migration and didn't see any problems. The migration looks fine
>and vsock dgram still works after migration. Is there any more specific test
>you want to run to check for this code path?
>

I meant a migration of a guest from QEMU without this patch to a QEMU 
with this patch. Of course in that case testing a socket stream.

>btw, I will address the rest of the comments and send a new version 
>soon.
>

Great!

Thanks,
Stefano


