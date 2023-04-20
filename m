Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC06E9425
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:21:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTHr-0001OL-Fp; Thu, 20 Apr 2023 08:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTHL-0001HH-Ex
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTHJ-0007sm-Pz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681993244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tl6voZ2jHwhB9nV9y4cRkZPhJXFytEfPJKXZLTHgxaY=;
 b=e9FMSmItkzUaxRkfA7IZufTuoElvL7FRCm1YMXJIKRd5JH3Va26vhiUyPqd+uqgNdRMzbL
 rIfCvXd/1SOJ8uw0Gf3Iv4FBjs8vDKgdCXSYjnE93rhunmLpLDdZN+IdopmmHv5amx/W8Y
 DqR9rbBqXC1dn/jl7yf6eJzWq0HO3u4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-1cpRVe-pPSKymaQTSbD3dw-1; Thu, 20 Apr 2023 08:20:43 -0400
X-MC-Unique: 1cpRVe-pPSKymaQTSbD3dw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f92bd71f32so217436f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993242; x=1684585242;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tl6voZ2jHwhB9nV9y4cRkZPhJXFytEfPJKXZLTHgxaY=;
 b=eImX5fWdYDzayP/1lBsa7nd+KNz0WecpeRbt4vGAnTj2O5nRt8asuZA7ylA9EyWusb
 VX92vWuOtLw/lfkiId7amqPYEw/0j7xNCgFu/kHLZ4SiGM6k2MOCyR0cdGU7Q2veTTvX
 7A0Ir3+B1sIaugjM3BFr+Q7Cbeqn97YBYej4824Deio6aBrVGYC7noTUH8d9imkqST2L
 HN7wbH5yH2UoZYWeetGaSOxkdUxhDjlY04m7Z3oi7e1S4l7xkYvy0odtwFgJ1SHcepkk
 65RVB9iIWXCOMf+DLWTQFffQfz+IlKNIjvCv+VTgxBebmVqCOFpThMJGI32+D99VF3sg
 utLw==
X-Gm-Message-State: AAQBX9d74z0yj5mUEYSLzO6zXOeIcAGVKsOKKyZRRqPxohYKCaK8V7x/
 +KvzEQ2LyUHMF5JPyxibEAjPR8l2+a0AMiyYnkKkORLeSr32W9y9re8Ft/ucIQiqtWt0YuB55OX
 wWXCbE08NmoOI/LM=
X-Received: by 2002:adf:fe45:0:b0:302:1b72:b951 with SMTP id
 m5-20020adffe45000000b003021b72b951mr963598wrs.26.1681993242614; 
 Thu, 20 Apr 2023 05:20:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDAVOfKI9kohboQVeUsjo0MtZrf//nMbnob2NhGWz6dOPqHPY1GQOzVqmYbUEd0harlhNaRg==
X-Received: by 2002:adf:fe45:0:b0:302:1b72:b951 with SMTP id
 m5-20020adffe45000000b003021b72b951mr963566wrs.26.1681993242210; 
 Thu, 20 Apr 2023 05:20:42 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003f17e37ce60sm5241991wmo.47.2023.04.20.05.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:20:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Eric Blake <eblake@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Fam Zheng
 <fam@euphon.net>,  Julia Suvorova <jusual@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Coiby Xu <Coiby.Xu@gmail.com>,  Paul
 Durrant <paul@xen.org>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Stefano Garzarella <sgarzare@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Lieven
 <pl@kamp.de>,
 eesposit@redhat.com,  Aarushi Mehta <mehta.aaru20@gmail.com>,  Stefan
 Weil <sw@weilnetz.de>,  Xie Yongji <xieyongji@bytedance.com>,  David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host
 notifier from any thread
In-Reply-To: <CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
 (Stefan Hajnoczi's message of "Thu, 20 Apr 2023 07:29:12 -0400")
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-17-stefanha@redhat.com>
 <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
 <CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 14:20:40 +0200
Message-ID: <87edoeycbr.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Wed, 19 Apr 2023 at 14:52, Eric Blake <eblake@redhat.com> wrote:
>>
>> On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
>> > virtio_queue_aio_detach_host_notifier() does two things:
>> > 1. It removes the fd handler from the event loop.
>> > 2. It processes the virtqueue one last time.
>> >
>> > The first step can be peformed by any thread and without taking the
>> > AioContext lock.
>> >
>> > The second step may need the AioContext lock (depending on the device
>> > implementation) and runs in the thread where request processing takes
>> > place. virtio-blk and virtio-scsi therefore call
>> > virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
>> > AioContext
>> >
>> > Scheduling a BH is undesirable for .drained_begin() functions. The next
>> > patch will introduce a .drained_begin() function that needs to call
>> > virtio_queue_aio_detach_host_notifier().
>> >
>> > Move the virtqueue processing out to the callers of
>> > virtio_queue_aio_detach_host_notifier() so that the function can be
>> > called from any thread. This is in preparation for the next patch.
>> >
>>
>> This mentions a next patch, but is 16/16 in the series.  Am I missing
>> something?
>
> Good thing you caught this. The patch series was truncated because I
> was in the middle of git rebase -i :(.
>
> I will send a v3 with the remaining patches.

I saw that it was not migration/* stuff and though that I was done O:-)


