Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2346E92B3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 13:30:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppSTs-00036Q-7D; Thu, 20 Apr 2023 07:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ppSTi-000368-Jc; Thu, 20 Apr 2023 07:29:30 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ppSTg-0006SO-K6; Thu, 20 Apr 2023 07:29:29 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-54fa9da5e5bso36712957b3.1; 
 Thu, 20 Apr 2023 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681990164; x=1684582164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mjZ/RzcdZKkVa0/zTvijUOjpF3h3Jp+5IB6rgUeEN4w=;
 b=WM/+x+qYreWmVU9adHqM+UxWyC0/dM50XgkM+CW+H+0ve0pPwJnx1QlGcZM0a3l9UW
 76C8ueuGvXkZ7se81BFsKNQJRq2p7ETQbYA2HnjcUrZwmeNPAgR7vBiOlJGk5m1+AvRN
 IBZBeF+XQ4yx2nSk231PpYEPg+kY5jvlmGO+nGt3mUahvja5y2mBRnckgmG5qnC3bKZJ
 56V9fUsSnSDOFyJPKBLuIJLHoPvB+0zo4aTLHYnCqXvE+4VQfEq2vKMmWcmha9cCy1/S
 vJCghyT2lP4p3ZDveLapf+W5D4+eW3fCAlug0gz/URAzGTc85PavbG4pKCs/1OqjQzuk
 8ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681990164; x=1684582164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mjZ/RzcdZKkVa0/zTvijUOjpF3h3Jp+5IB6rgUeEN4w=;
 b=jy6Kekoizlx89pB2j0AxbfKHSQ1YIE6uvmWZCvwBxePiWZ9Xk0jkI3gCaqVvBfrgC1
 SuRZRaCIVHCWLQp4/cSRSoCwEgPhmfF61pln5NBxOwks5FpFSLjKKn9and9AiRK59uGl
 6wsj3phT6ju1IoBhVvMwZHFhwYLPOJFVZfpqTQaBIPU85Q2+/SXyWgLIFO2buhtGPUdm
 x3Uv4AzYza8Qu8h9vfBs1YkpwbNbhGtRblx9T+Sm1UkdlNCwx2zZnZe0NJjjk08mQ0j8
 Wz9FMF5ikNNkf/sos3ZNEzA/6m7ZCR+bRMN89ClM3HVFiK93wQYM2iN5nAQj1fRQTpeo
 FqbA==
X-Gm-Message-State: AAQBX9cB2+b5wimuIkgpy2YrGqmqj9C5b+/7YncwWB66mtfGmxB6D1oD
 4YdeLklqftsvdvWbxN8V1FvR+P+xVsK903sId0Y=
X-Google-Smtp-Source: AKy350YixT78MM+0m6MWX93M4LzsNss7C/9AVyxLfCe7ytGhtrZgR5oTod2XZI+W20XYg1P6Z9PRr+6+RonHjuqDLAo=
X-Received: by 2002:a0d:dd82:0:b0:555:d4ad:8067 with SMTP id
 g124-20020a0ddd82000000b00555d4ad8067mr512290ywe.17.1681990164463; Thu, 20
 Apr 2023 04:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-17-stefanha@redhat.com>
 <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
In-Reply-To: <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 20 Apr 2023 07:29:12 -0400
Message-ID: <CAJSP0QVjFcicweDxVvLyhijmdQqQPTN_uhzP2wU7ZS4ZXxKkEQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host notifier
 from any thread
To: Eric Blake <eblake@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, 
 qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, 
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>, 
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Apr 2023 at 14:52, Eric Blake <eblake@redhat.com> wrote:
>
> On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
> > virtio_queue_aio_detach_host_notifier() does two things:
> > 1. It removes the fd handler from the event loop.
> > 2. It processes the virtqueue one last time.
> >
> > The first step can be peformed by any thread and without taking the
> > AioContext lock.
> >
> > The second step may need the AioContext lock (depending on the device
> > implementation) and runs in the thread where request processing takes
> > place. virtio-blk and virtio-scsi therefore call
> > virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> > AioContext
> >
> > Scheduling a BH is undesirable for .drained_begin() functions. The next
> > patch will introduce a .drained_begin() function that needs to call
> > virtio_queue_aio_detach_host_notifier().
> >
> > Move the virtqueue processing out to the callers of
> > virtio_queue_aio_detach_host_notifier() so that the function can be
> > called from any thread. This is in preparation for the next patch.
> >
>
> This mentions a next patch, but is 16/16 in the series.  Am I missing
> something?

Good thing you caught this. The patch series was truncated because I
was in the middle of git rebase -i :(.

I will send a v3 with the remaining patches.

Thanks,
Stefan

