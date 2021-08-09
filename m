Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119E3E4439
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:53:28 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2uH-0000sq-UI
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mD2qk-0001uo-JG
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mD2qi-0003Ui-0d
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628506179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N/N1V8Jy0TV2+kuvNgE+TH5LOK5g6kxd1mdlro1rMrQ=;
 b=iz3Nm6j7dZYtx5AdZR23n5uU16SOCAfcd6b4GCHuR54wh71YndssTzq4MaDu6G9G/5P+/x
 tEMEHvJUxgJDKii5hOxNpgp16hHKEa2uVECDkE4Q1Ilg4Aue/T8bFrVbHmrxTAc5lsOfsO
 7CXnvFmSh7l0NcAFHyaQ9DDq4L5XPoQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-ZrlfF3AjNl2xYHdiGo7SKg-1; Mon, 09 Aug 2021 06:49:38 -0400
X-MC-Unique: ZrlfF3AjNl2xYHdiGo7SKg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g3-20020a0564024243b02903be33db5ae6so4553914edb.18
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 03:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N/N1V8Jy0TV2+kuvNgE+TH5LOK5g6kxd1mdlro1rMrQ=;
 b=qOZjPsnJ9LZYCq7uZ12zHd9dBW6BzIJpcZGh+GH+dFqxatFaumCyWPn8+s2eCK+FmI
 tQKx0lCrYKTcMITlzFBpq/XOIXPNpDOGOJi3fRkk8fQTSWINCxcB180K+UypSxGFmlQi
 tGlaQ/fwkF46Y21PhUDS0odDK5lwK9mFXaw5Ny+hBhEupy+R1K7eHtvRqFIHYUHy1qfu
 spXnhiREs4OW5JVfmFhtSxrGvz1Y/bzv/+KXKDrae5t5+ubfF6ZpcsvE5IePxXmEPTm2
 49uQiUxpLt7/rpFlMNGLiW51Om4DjCgN3+jLtAL6mly+v72jY4KYBeVvBmGBakxGwPAU
 wdbA==
X-Gm-Message-State: AOAM531HDpfqcIJ2RJsZmPs0Tt//V5bDsPpwii3aCbJnbCC34rlDA/YN
 jqh5g0WBDYdxiKpUFf085Tar0kPfPJ6IzwzQCU/z/Ur4+bu98rupud+gDMpeahg1XCut4VdP2ZC
 y51A63LFoWnl+MU8=
X-Received: by 2002:a05:6402:516f:: with SMTP id
 d15mr29705548ede.210.1628506176903; 
 Mon, 09 Aug 2021 03:49:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx86QGK8EnhqvzrZaUoDgKNMeBNdxgYmsqYsl484QzgjOTbj1t2KBWrgPVQsHZJItWXu5tTww==
X-Received: by 2002:a05:6402:516f:: with SMTP id
 d15mr29705528ede.210.1628506176747; 
 Mon, 09 Aug 2021 03:49:36 -0700 (PDT)
Received: from steredhat (a-nu5-14.tin.it. [212.216.181.13])
 by smtp.gmail.com with ESMTPSA id c6sm5740945eje.105.2021.08.09.03.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 03:49:36 -0700 (PDT)
Date: Mon, 9 Aug 2021 12:49:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v3] virtio/vsock: add two more queues for datagram types
Message-ID: <20210809104934.xuzyqhqsshmixwhq@steredhat>
References: <20210706222607.1058040-1-jiang.wang@bytedance.com>
 <20210707083312.algmreafmfofg7el@steredhat>
 <CAP_N_Z-NbofkoDbWby9Pe=VH1CjYQL6-gSbrwWDBZBNDwcnmuA@mail.gmail.com>
 <20210707172737.j2xpyd45wmufdqc5@steredhat.lan>
 <CAP_N_Z8ktMLHSG8J7t4WA9MCC5i0o=CUF+VfPSOBnWrMd21idg@mail.gmail.com>
 <20210804064103.gvhz3a7ck6xlwsm6@steredhat>
 <CAGxU2F4b0evZfKhZ62S7RmDMWG1jq72q5tii_WuKbNeBuveLsg@mail.gmail.com>
 <CAP_N_Z_aJ62bMA6kR-e-FnPh-uNhJsQSf67RKPS67bq6=jO-2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z_aJ62bMA6kR-e-FnPh-uNhJsQSf67RKPS67bq6=jO-2Q@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 12:00:05PM -0700, Jiang Wang . wrote:
>On Tue, Aug 3, 2021 at 11:49 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Wed, Aug 4, 2021 at 8:41 AM Stefano Garzarella <sgarzare@redhat.com>
>> wrote:
>> >
>> > On Tue, Aug 03, 2021 at 11:58:27AM -0700, Jiang Wang . wrote:
>> > >On Wed, Jul 7, 2021 at 10:27 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > >> On Wed, Jul 07, 2021 at 09:52:46AM -0700, Jiang Wang . wrote:
>> > >> >On Wed, Jul 7, 2021 at 1:33 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > >> >> On Tue, Jul 06, 2021 at 10:26:07PM +0000, Jiang Wang wrote:
>> >
>> > [...]
>> >
>> > >> >> >+
>> > >> >> >+    if (nvqs < 0)
>> > >> >> >+        nvqs = MAX_VQS_WITHOUT_DGRAM;
>> > >> >> >+
>> > >> >> >+    if (nvqs == MAX_VQS_WITH_DGRAM) {
>> > >> >> >+        vvc->dgram_recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> > >> >> >+                                              vhost_vsock_common_handle_output);
>> > >> >> >+        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> > >> >> >+                                               vhost_vsock_common_handle_output);
>> > >> >> >+    }
>> > >> >> >+
>> > >> >> >     /* The event queue belongs to QEMU */
>> > >> >> >     vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> > >> >> >                                        vhost_vsock_common_handle_output);
>> > >> >>
>> > >> >> Did you do a test with a guest that doesn't support datagram with QEMU
>> > >> >> and hosts that do?
>> > >> >>
>> > >> >Yes, and it works.
>> > >> >
>> > >> >> I repost my thoughts that I had on v2:
>> > >> >>
>> > >> >>      What happen if the guest doesn't support dgram?
>> > >> >>
>> > >> >>      I think we should dynamically use the 3rd queue or the 5th queue for
>> > >> >>      the events at runtime after the guest acked the features.
>> > >> >>
>> > >> >>      Maybe better to switch to an array of VirtQueue.
>> > >> >>
>> > >> >I think in current V3, it  already dynamically use 3rd or 5th queue
>> > >> >depending
>> > >> >on the feature bit.
>> > >>
>> > >> I'm not sure. IIUC when vhost_vsock_common_realize() is called, we don't
>> > >> know the features acked by the guest, so how can it be dynamic?
>> > >>
>> > >> Here we should know only if the host kernel supports it.
>> > >>
>> > >> Maybe it works, because in QEMU we use the event queue only after a
>> > >> migration to send a reset event, so you can try to migrate a guest to
>> > >> check this path.
>> > >>
>> > >I tried VM migration and didn't see any problems. The migration looks fine
>> > >and vsock dgram still works after migration. Is there any more specific test
>> > >you want to run to check for this code path?
>> > >
>> >
>> > I meant a migration of a guest from QEMU without this patch to a QEMU
>> > with this patch. Of course in that case testing a socket stream.
>> >
>>
>> Sorry, I meant the opposite.
>>
>> You should try to migrate a guest that does not support dgrams starting
>> from a QEMU with this patch (and kernel that supports dgram, so qemu
>> uses the 5th queue for event), to a QEMU without this patch.
>>
>Got it. I tried what you said and saw errors on the destination qemu. Then
>I moved event queue up to be number 3 (before adding dgram vqs),
>as the following:
>
>+    /* The event queue belongs to QEMU */
>+    vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>+                                       vhost_vsock_common_handle_output);
>+
>
>     nvqs = vhost_vsock_get_max_qps(enable_dgram);
>
>@@ -253,10 +257,6 @@ void vhost_vsock_common_realize(VirtIODevice
>*vdev, const char *name, bool enabl
>
>vhost_vsock_common_handle_output);
>     }
>
>-    /* The event queue belongs to QEMU */
>-    vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>-                                       vhost_vsock_common_handle_output);
>-
>
>But I still see following errors on the destination qemu:
>qemu-system-x86_64: Error starting vhost vsock: 14
>
>Any idea if my above code change is wrong or missing something?

No, sorry.
Do you have some kernel messages in the host?

>
>Take one step back, what should be the host kernel version? With or
>without dgram support? I tried both.  The new dest kernel shows the above error.
>The old dest kernel shows a msr error probably not related to vsock.

I think the best is to try the host kernel with DGRAM support, so QEMU 
will allocate all the queues.

>
>To explain the above qemu 14 error, I think the issue is that the
>source host kernel
>supports dgram by always setting the DGRAM feature bit(in my
>implementation). Then the source
>qemu query the source host kernel, and use 5 for event vq. Even if the source
>guest kernel does not support dgram, it currently has no way to tell the source
>host or the source qemu.

Initially I think is better to try the migration on the same host, so we 
can exclude other issues. When it works properly, you can try to migrate 
to a different host kernel.

>
>On the source machine, when we start qemu process,  and the guest VM
>is still in BIOS or early boot process ( before vsock is initialized), I think
>at this time, the qemu vhost_vsock_common_realize() is already called.
>So qemu can only check if the host kernel supports dgram or not, but has
>no knowledge about the guest kernel. After the guest kernel is fully boot up,
>it can tell qemu or the host if it supports dgram or not ( or the host or qemu
>detect for that). But I don't think we will change the vq numbers at that time.
>
>Maybe we should fix that too and change vq numbers ( delete vq and add
>back?) at a later
>time after the guest kernel is fully boot-up?

IIRC vhost-net allocates the maximum number of queues, and then it uses 
only the queues supported/requested, so I think we can do something 
similar.

Allocates 5 queues and, at runtime, we can decide which queue to use.

Thanks,
Stefano


