Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60631555499
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:36:43 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o469a-0004zN-7S
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o467y-0002zs-Su
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o467v-00022o-7h
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 15:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655926498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uIXm4bR0G7bFCJeDbI/dc1qyWiSugjqhOh1Kk44/b/8=;
 b=KR3fAxuXLKCUpUHMr5LZyfApWwb7MnxAQWo2/tUDFmm/mYkA8IC6Sss0vGmJzb0J9sGSW0
 hR3lNdbZInDgwi8tejd4pXaxvFn46Vdd+V4fR/eWHj25jDAhSw3CRMZyPdkRjiZJpkXwFK
 eSeqRELIu2VAcP4zboKbNW3W1AEdEkg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-lNnpcET5MmOrVmooWepSiQ-1; Wed, 22 Jun 2022 15:34:56 -0400
X-MC-Unique: lNnpcET5MmOrVmooWepSiQ-1
Received: by mail-io1-f71.google.com with SMTP id
 199-20020a6b01d0000000b00669bf42cd4cso9696040iob.4
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 12:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uIXm4bR0G7bFCJeDbI/dc1qyWiSugjqhOh1Kk44/b/8=;
 b=cUw9KVf5bMvJ8+uqqYf35MVG5F3Lh0/ML751zm7Y9oUrKluKkIh+QZjgH2JYmbYcM5
 ZkNl6luCjp7NQs3bO0IN0s8QHykjeWIAy1CDENiCP7DEhBYRgcUbd32oCiv+FsuzGsKT
 k9niVgW0J1PFpGiDJm58GWcJTWs2aJDsVnAbLBdXEfo7gpJMmeVabnd4HLSh1Pzqq08V
 fbF39v8x3duF3JvS9eL9R0RBDm1Ob3S1F5OzNNYhmf3L0mmKGR5cyziCI1hRidqc1lRY
 SR1aG34y0GfRB3gOYCam1nkLMNzVBHm7dM3gEhYcWc6v7LXiV8flixKP6lnCnItmywKR
 d+og==
X-Gm-Message-State: AJIora+ZT120ooJSh0FLl8Hi9Q6f9ts7LhHgSuoayVeGzZwN9lzFDbT7
 +XLtbYNdCZ3vFUzBDkeDRuclEP4ST/xxVjiXBxqqKba1h8kpdRwBhmPddwpNeyHvDIjsW9w7Df5
 kuRxoX9HXhlOn4/4=
X-Received: by 2002:a05:6e02:1e08:b0:2d9:1e04:87bc with SMTP id
 g8-20020a056e021e0800b002d91e0487bcmr2892775ila.171.1655926496038; 
 Wed, 22 Jun 2022 12:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSgXcjswKxvB0aofwzixDmQ9ZmqaYzSlp7YuUp0M4ToP+xX57qpHVLQAgCTPydm+ZfnJIX4A==
X-Received: by 2002:a05:6e02:1e08:b0:2d9:1e04:87bc with SMTP id
 g8-20020a056e021e0800b002d91e0487bcmr2892766ila.171.1655926495819; 
 Wed, 22 Jun 2022 12:34:55 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 p67-20020a022946000000b00339d0617be1sm1914875jap.35.2022.06.22.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 12:34:55 -0700 (PDT)
Date: Wed, 22 Jun 2022 15:34:52 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrNu3KesFVVvoWVb@xz-m1.local>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220622183917.155308-23-dgilbert@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 74f919de67..e206b05550 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>          return 0;
>      }
>  
> -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> -                             IO_BUF_SIZE - pending, &local_error);
> +    do {
> +        len = qio_channel_read(f->ioc,
> +                               (char *)f->buf + pending,
> +                               IO_BUF_SIZE - pending,
> +                               &local_error);
> +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> +            if (qemu_in_coroutine()) {
> +                qio_channel_yield(f->ioc, G_IO_IN);
> +            } else {
> +                qio_channel_wait(f->ioc, G_IO_IN);
> +            }
> +        } else if (len < 0) {
> +            len = EIO;

This should be -EIO.

> +        }
> +    } while (len == QIO_CHANNEL_ERR_BLOCK);

It's failing only with the new TLS test I added for postcopy somehow (at
least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
change it'll work again.

-- 
Peter Xu


