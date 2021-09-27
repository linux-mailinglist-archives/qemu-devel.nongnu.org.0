Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E039F419685
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:39:50 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrnJ-0004Fc-7Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mUrki-0001QT-2X
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:37:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mUrke-00008c-Fs
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632753422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mBTIub9/4FffL+VN/dlIXxdKafYH/6rWjmv91VS76K0=;
 b=RNXJXrT2sq6SocbrBvuQGiDIrWhos4fHXJ0CWG801DoUauMYTFdEoIVnCrEi33ZEdaBb16
 RM8Xp12Vw0RzoHOHJR1qqM4EW+QdR/Am0NgTvRIsM8XlDwexiNQOPkCtHgPNTEPuf/yhO6
 4Av6mdHUCB4wS/23AzvlVHR2NVMkzcw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-4pQ-PdYBOsWfo24X9g2S7A-1; Mon, 27 Sep 2021 10:37:00 -0400
X-MC-Unique: 4pQ-PdYBOsWfo24X9g2S7A-1
Received: by mail-ed1-f69.google.com with SMTP id
 x26-20020a50f19a000000b003da81cce93bso377929edl.19
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mBTIub9/4FffL+VN/dlIXxdKafYH/6rWjmv91VS76K0=;
 b=lyNEY+pEwrjlmvBxmPK89VY4pL16+FassqnHePpfT2/KE1/VZbpOM9a8njRCkA5Y3+
 TGLmM+MZxGcNLAET2t6zFggSe0bqa7jXfeaWeKObHMorqUxxy1EsuphkIY66kgk/8sz4
 yrP046azy0SRkrk2wvKTKL4smdj733ijn21judShAP8FBa0oa4TBoXnxYrF4Ao3DKxut
 xfIP7ohlQSPspQ60TF2kAxf5cDznERj3c47E6A2yqpGpcGJn9n6O6ys2QPCGv9FDmQ+y
 FFICqz8su1L8zwOBdmUx5pBNmegfBy0qORnHHSInwB0+xm9Ce0Ju0Y/qdCFCJCCCo9DQ
 mG0w==
X-Gm-Message-State: AOAM533El9Cq9tqsATGp80G55cgcahRxRsB4hn2bxwCqOwBueT2po1Z5
 6QpxkljmL1/flSJyGAn8LPDpSxhfozzCegeoDvXXcjiCSf4wYh6H6d9DbHKUtUuB8tDdYvgA8Qo
 Wt152F9wGzNHsDvc=
X-Received: by 2002:a17:907:7e8f:: with SMTP id
 qb15mr381596ejc.249.1632753419576; 
 Mon, 27 Sep 2021 07:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUOnWDhMtzpdpjnmXuO4KOh9XayQExFjrPKERlIdF0BBXofquBIbt5+Gzc+h4soD+Mucuozw==
X-Received: by 2002:a17:907:7e8f:: with SMTP id
 qb15mr381572ejc.249.1632753419369; 
 Mon, 27 Sep 2021 07:36:59 -0700 (PDT)
Received: from steredhat (host-79-34-250-211.business.telecomitalia.it.
 [79.34.250.211])
 by smtp.gmail.com with ESMTPSA id o3sm3241165eji.108.2021.09.27.07.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 07:36:59 -0700 (PDT)
Date: Mon, 27 Sep 2021 16:36:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [External] Re: [RFC v7] virtio/vsock: add two more queues for
 datagram types
Message-ID: <20210927143657.b6ailivumzuiap5u@steredhat>
References: <CAP_N_Z8p+qsOAm15TtUFhCG-bJHM+zOQ4UJkr4XBdUQnm2wtzQ@mail.gmail.com>
 <20210923091828.e2ao3mra6ps5osc2@steredhat>
 <CAP_N_Z-D+TdAzRhJScs+nitz4GW7otY-nOVHDxGf68X1aXQiHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z-D+TdAzRhJScs+nitz4GW7otY-nOVHDxGf68X1aXQiHQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Sep 24, 2021 at 03:27:30PM -0700, Jiang Wang . wrote:
>On Thu, Sep 23, 2021 at 2:18 AM Stefano Garzarella <sgarzare@redhat.com> wrote:

[...]

>> >
>> >To explain it, I think the event queue number does not matter for the
>> >vhost and qemu. The vhost-vsock kernel module does not allocate any
>> >data structure for the event queue.  Qemu also only allocates an array of
>> >size 2 or 4 for the tx, rx queues. The event queue is handled 
>> >separately.
>> >
>> >The event queue number only shows up in the spec, but in real code, I don't
>> >see anywhere that the event queue number is used explicitly or implicitly.
>> >The Event queue looks independent of tx, rx queues.
>>
>> Yep, it is used in the linux driver. Look at
>> virtio_transport_event_work(), it uses VSOCK_VQ_EVENT (2).
>>
>Agree, it is used in virtio driver and QEMU as you mentioned later.
>
>> The main test to do is to migrate a guest with active connections that
>By active connections, do you mean active vsock stream connections?

Yep, e.g using ncat also without exchanging data. After the migration 
the socket should be reset by the driver if the event queue is working.

>The guest should be the server or the client? 

Doesn't matter.

> I have two simple vsock client,
>server tests which only send messages for each direction once. Or I can also
>use something like iperf3.
>
>> doesn't support F_DGRAM on an host that support it and check if, after
>> the migration, the connections are reset and the CID updated.
>
>Not sure about why CID should be updated? Right now, on the destination
>host, I used the same CID as the one on the source host. You mean choose
>another guest CID on the destination host? I will try that.

Yep, because another thing the driver does when it handles the event in 
the event queue is to update the guest CID.
Usually you should use different CIDs if you migrate on the same host.

>
>> I think is not working now.
>>

[...]

>>
>I see. The example code helps a lot.
>
>> Then use `vvc->event_vq_id` in :
>> - vhost_vsock_common_send_transport_reset()
>> - vhost_vsock_common_post_load() (instead of 2 wired in the code)
>I see now vhost_vsock_common_post_load() has a problem. One way
>to fix it is as you mentioned. Another way is to check the acked feature
>bit here too and change the event queue number to 2 or 4 accordingly.
>
>In your example code:
>vvc->vqs[i] = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                         vhost_vsock_common_handle_output);
>We still need to do some assignment as following:
>vvc->recv_vq = vvc->vqs[0];
>vvc->trans_vq = vvc->vqs[1];
>...(skipped other similar assignments)

Why we need this?
QEMU handles only the event queue.
recv_vq, trans_vq pointers are never used (only to deallocate).

>
>I think both ways will work.  Your example adds ordering for those recv and
>trans vqs and makes it similar to virtio and vhost code. I will go that route.

Make sense.

>
>>
>> Maybe in vhost_vsock_common_send_transport_reset() we can skip the
>> message enqueueing if the device is not started
>> (vvc->vhost_dev.started).
>>
>OK. Btw, I can make this a separate change because it looks like a
>standalone bugfix? I.e, not related to dgram?

Yep, sure.

Stefano


