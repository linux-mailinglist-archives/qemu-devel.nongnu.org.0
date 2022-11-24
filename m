Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC32637325
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy74h-00080U-R0; Thu, 24 Nov 2022 02:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oy74a-0007zZ-Rv
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:55:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oy74Y-0008Em-Kg
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669276501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K7ROUuWF9ylx5tpB6oe/k2xJLBCzQWcUiQ8PZl52+Wk=;
 b=g99v88JaQ8vP0V9LZMy0VAMhH+3qoaRX901oTPzprQ5JM60VfbSjn6X2h45vK1KGiyrlzc
 TwoM9oQX+3ctHV0p0dIwLQJfXU+t0/260NWc7KVnst8fBwUIr8qPtXxTmil/wbgFmDK5qP
 gOecfo8Lz3W5V0sRSkBdxbIMLSTksMo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-l4NndmOOP52A4yT4lLiq5w-1; Thu, 24 Nov 2022 02:54:59 -0500
X-MC-Unique: l4NndmOOP52A4yT4lLiq5w-1
Received: by mail-ed1-f72.google.com with SMTP id
 r12-20020a05640251cc00b00463699c95aeso512225edd.18
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 23:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K7ROUuWF9ylx5tpB6oe/k2xJLBCzQWcUiQ8PZl52+Wk=;
 b=fizGg6oszNOBuZSudCMOW853cePBeGkra2MMHASLUFB0DWJEPJxhai5qTcop2IaWvE
 iuRNLUloNQfKitw5CvTqpd817aK3bJtJFveWnXtLsc88Gd3Hokbx0jfzv1GarmVEIKwC
 aMdG1xFlq3gEvOPsIxeopEBLisyQxPZbQiDxIESzqpjrSdz6YiUUVS0WESnmd/5VnHX9
 wBCDLxx+z3Es9gZCd9Y98qwZq+ey18EMlsb2WvHLiRSWnTScM/uMGaFXIt/StMZKpfHO
 LSMMnqNp3pV4/R+L0OxjDP7Lvos1Zg2lR3OlB4/kbuLkWMjSo4yK+7rL9ytSlffgEzTW
 N9oA==
X-Gm-Message-State: ANoB5pnfn3YFNkNouT4E4DqmU/cil1qWFyaLabtJTSrnzkDpfSLcPvM6
 YmEsLD5eEb9O02U7485Axynacy+UiK99QAcNCiw6Ta5KNGXZTqDqnq8Euw2Bc/kYQGWsl8pmjV0
 XerdRlvBhFBru/NA=
X-Received: by 2002:a05:6402:2b87:b0:45b:c731:b683 with SMTP id
 fj7-20020a0564022b8700b0045bc731b683mr30259831edb.251.1669276498671; 
 Wed, 23 Nov 2022 23:54:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4M3qCINsL6eVAzrQaoBgjtZgzYyddqFIuuvhfdjeCMRz34dfcuVQrKx5p7Tzfskc1sfLBLtA==
X-Received: by 2002:a05:6402:2b87:b0:45b:c731:b683 with SMTP id
 fj7-20020a0564022b8700b0045bc731b683mr30259791edb.251.1669276498298; 
 Wed, 23 Nov 2022 23:54:58 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 b7-20020a17090630c700b0077a11b79b9bsm138256ejb.133.2022.11.23.23.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 23:54:57 -0800 (PST)
Date: Thu, 24 Nov 2022 08:54:52 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Message-ID: <20221124075452.y2slphvuwbjsst36@sgarzare-redhat>
References: <20221123131630.52020-1-sgarzare@redhat.com>
 <4A976F8D-AB6F-4BAD-AD5A-ABF69B8A040C@nutanix.com>
 <20221124014951-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221124014951-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

On Thu, Nov 24, 2022 at 01:50:19AM -0500, Michael S. Tsirkin wrote:
>On Thu, Nov 24, 2022 at 12:19:25AM +0000, Raphael Norwitz wrote:
>>
>> > On Nov 23, 2022, at 8:16 AM, Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >
>> > Commit 02b61f38d3 ("hw/virtio: incorporate backend features in features")
>> > properly negotiates VHOST_USER_F_PROTOCOL_FEATURES with the vhost-user
>> > backend, but we forgot to enable vrings as specified in
>> > docs/interop/vhost-user.rst:
>> >
>> >    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
>> >    ring starts directly in the enabled state.
>> >
>> >    If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
>> >    initialized in a disabled state and is enabled by
>> >    ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
>> >
>> > Some vhost-user front-ends already did this by calling
>> > vhost_ops.vhost_set_vring_enable() directly:
>> > - backends/cryptodev-vhost.c
>> > - hw/net/virtio-net.c
>> > - hw/virtio/vhost-user-gpio.c
>>
>> To simplify why not rather change these devices to use the new 
>> semantics?

Maybe the only one I wouldn't be scared of is vhost-user-gpio, but for 
example vhost-net would require a lot of changes, maybe better after the 
release.

For example, we could do like vhost-vdpa and call SET_VRING_ENABLE in 
the VhostOps.vhost_dev_start callback of vhost-user.c, but I think it's 
too risky to do that now.

>
>Granted this is already scary enough for this release.

Yeah, I tried to touch as little as possible but I'm scared too, I just 
haven't found a better solution for now :-(

>
>> >
>> > But most didn't do that, so we would leave the vrings disabled and some
>> > backends would not work. We observed this issue with the rust version of
>> > virtiofsd [1], which uses the event loop [2] provided by the
>> > vhost-user-backend crate where requests are not processed if vring is
>> > not enabled.
>> >
>> > Let's fix this issue by enabling the vrings in vhost_dev_start() for
>> > vhost-user front-ends that don't already do this directly. Same thing
>> > also in vhost_dev_stop() where we disable vrings.
>> >
>> > [1] https://gitlab.com/virtio-fs/virtiofsd
>> > [2] https://github.com/rust-vmm/vhost/blob/240fc2966/crates/vhost-user-backend/src/event_loop.rs#L217
>> > Fixes: 02b61f38d3 ("hw/virtio: incorporate backend features in features")
>> > Reported-by: German Maglione <gmaglione@redhat.com>
>> > Tested-by: German Maglione <gmaglione@redhat.com>
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Looks good for vhost-user-blk/vhost-user-scsi.
>>
>> Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

Thanks for the review!
Stefano


