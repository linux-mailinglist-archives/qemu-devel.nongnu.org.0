Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DFA6D5BAD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 11:18:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjcmf-0007Yc-25; Tue, 04 Apr 2023 05:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pjcmd-0007Xz-69
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:16:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pjcma-0007Rm-Cf
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 05:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680599811;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BSBmdTbfTkUl7Ea3VQh27DTaOioxkwyVdy28bzui4ZE=;
 b=TgXtDmjtb1ePN/ZgAR2e7E+pVn4W+h7hpNLD9EiuJa8h/dl2UlxrlO4igwoqQicEg6xaEA
 rADGMWgiqj6aTFc5w7+C/zNwrczKbhYi7kKFwbCD+TcVQ4R6JruqbZHqDS7AiPHBU0Scxa
 rYxFZb87WkosFNXv/J8HYHhiwSPm1WQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-N_ZzTqsmOm64FRdq63zpmg-1; Tue, 04 Apr 2023 05:16:50 -0400
X-MC-Unique: N_ZzTqsmOm64FRdq63zpmg-1
Received: by mail-wm1-f69.google.com with SMTP id
 iv18-20020a05600c549200b003ee21220fccso15793456wmb.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 02:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680599809;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSBmdTbfTkUl7Ea3VQh27DTaOioxkwyVdy28bzui4ZE=;
 b=VxGmf9WvjKkWD+JhcRNSmRjlr8WWhVn6Im+IkTTezTfk1F6bZPHH/4TQTXntobcWpY
 Q6fIYV/fbaB8G3FsTbaab6D0+BaIET2gkhOkn6Kh1Nh0gMNvffy7MbaIe/bC8w97EG87
 +ziJb4N/ZpDWL4JjWdOIIDTGuj3727+8pwLW6X7+SlpNc58gJ0aWBAw0kNsMOuDdTXj4
 000Vza402Nn7CP6bKQ4YzoWNdPCbqMpO63qpVWt98Qac+uNZ8eRk+XjVO8/+6jtl6Syd
 +nfgWtcb6bvioraz0QL8Z5oaELvp4tW5m++xQas5lvQ7RxtWl0QvHPaas3KxNqWy7Fze
 P8LA==
X-Gm-Message-State: AAQBX9dEAg/eIJLLCXF82fWMUIb/LrVZ5LFp+H4BRGJQ1zXrDblGJXve
 QgAki6C2XRbgqLRdo405Fhf8xoY9RA7y8Sd1QSopXOI7MgwdDyoTzFE9a6IiiWsK2hm4RROux66
 FYnEzS4Ek52joFb0=
X-Received: by 2002:a05:6000:508:b0:2d7:89ce:8319 with SMTP id
 a8-20020a056000050800b002d789ce8319mr1013747wrf.27.1680599809115; 
 Tue, 04 Apr 2023 02:16:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBjCYY8Gmu90141dU4yV/FMGGIfHstBOuovWY7hslWLD6VBET6tgmgZ4mx0XgXOelUMo6HKg==
X-Received: by 2002:a05:6000:508:b0:2d7:89ce:8319 with SMTP id
 a8-20020a056000050800b002d789ce8319mr1013723wrf.27.1680599808769; 
 Tue, 04 Apr 2023 02:16:48 -0700 (PDT)
Received: from redhat.com ([47.58.164.113]) by smtp.gmail.com with ESMTPSA id
 s17-20020a05600c45d100b003ed51cdb94csm21819628wmo.26.2023.04.04.02.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 02:16:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Julia
 Suvorova <jusual@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Peter
 Lieven <pl@kamp.de>,  Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Stefano Garzarella <sgarzare@redhat.com>,
 <qemu-block@nongnu.org>,  Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paul Durrant
 <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Fam Zheng <fam@euphon.net>,  David Woodhouse
 <dwmw2@infradead.org>,  Stefan Weil <sw@weilnetz.de>,  Xie Yongji
 <xieyongji@bytedance.com>,  Hanna Reitz <hreitz@redhat.com>,  Ronnie
 Sahlberg <ronniesahlberg@gmail.com>,  eesposit@redhat.com,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 13/13] aio: remove aio_disable_external() API
In-Reply-To: <20230403183004.347205-14-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Mon, 3 Apr 2023 14:30:04 -0400")
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-14-stefanha@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 04 Apr 2023 11:16:46 +0200
Message-ID: <877cusroqp.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Stefan Hajnoczi <stefanha@redhat.com> wrote:
> All callers now pass is_external=false to aio_set_fd_handler() and
> aio_set_event_notifier(). The aio_disable_external() API that
> temporarily disables fd handlers that were registered is_external=true
> is therefore dead code.
>
> Remove aio_disable_external(), aio_enable_external(), and the
> is_external arguments to aio_set_fd_handler() and
> aio_set_event_notifier().
>
> The entire test-fdmon-epoll test is removed because its sole purpose was
> testing aio_disable_external().
>
> Parts of this patch were generated using the following coccinelle
> (https://coccinelle.lip6.fr/) semantic patch:
>
>   @@
>   expression ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque;
>   @@
>   - aio_set_fd_handler(ctx, fd, is_external, io_read, io_write, io_poll, io_poll_ready, opaque)
>   + aio_set_fd_handler(ctx, fd, io_read, io_write, io_poll, io_poll_ready, opaque)
>
>   @@
>   expression ctx, notifier, is_external, io_read, io_poll, io_poll_ready;
>   @@
>   - aio_set_event_notifier(ctx, notifier, is_external, io_read, io_poll, io_poll_ready)
>   + aio_set_event_notifier(ctx, notifier, io_read, io_poll, io_poll_ready)
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

[....]

> diff --git a/migration/rdma.c b/migration/rdma.c
> index df646be35e..aee41ca43e 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3104,15 +3104,15 @@ static void qio_channel_rdma_set_aio_fd_handler(QIOChannel *ioc,
>  {
>      QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
>      if (io_read) {
> -        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> -        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->recv_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmain->send_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
>      } else {
> -        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> -        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd,
> -                           false, io_read, io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->recv_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
> +        aio_set_fd_handler(ctx, rioc->rdmaout->send_comp_channel->fd, io_read,
> +                           io_write, NULL, NULL, opaque);
>      }
>  }

Reviewed-by: Juan Quintela <quintela@redhat.com>

For the migration bits.
I don't even want to know why the RDMA code uses a low level block layer API.


