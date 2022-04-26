Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDAB510CA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:28:40 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUbn-0000YR-Ie
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njUZr-0007W8-NU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1njUZp-00038v-1u
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651015595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rocaEESmi8m7aOjSORyUEJf8073vW5iYqyFnAbH4GQg=;
 b=D6R51qIPI9nPZuRLl0eBKYJ5DrdW+qgbJ7Hx5JixT3jSBi8A+eweSMXbNkL0CDqbzXD1aE
 qkSrCuRvuKhF0AblGhyZ8u3sqAiaas0tKKxe06rrAI/TOm78xStmI4yTBaNd8DEPiJp3Qh
 nelKy0LxJgpkOVEoYP5QDzf+Q4NbWwo=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-zOiePX5UNzaqQGZxoUamsw-1; Tue, 26 Apr 2022 19:26:34 -0400
X-MC-Unique: zOiePX5UNzaqQGZxoUamsw-1
Received: by mail-io1-f70.google.com with SMTP id
 r17-20020a0566022b9100b00654b99e71dbso442913iov.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rocaEESmi8m7aOjSORyUEJf8073vW5iYqyFnAbH4GQg=;
 b=Fnw9PVJ2nLeiMJxYmpVUV9zJACjPSOo56Ms7N2e+sjSQSznT6BzY0pgpbIkLHf1loC
 3hJUfZ6l/Bco4iaWK9FkQHaW74QLhBIHQHZELTbs5VPr2vSLiXp06ujE137OJ3wzNkPw
 R/gVjQwr9L8FnyaT0+qE+3HZzBmJ4zNvdPicbPLxLi2BhEMDpPBNkFJ8A4lMu4yzpOdR
 RD3JE3FkjOUJIA4uW5cHQLugTm/lKUHr3RF4pUbQ33CL93C+WlWB73O3b709ceCjd8dA
 1BGf7jGeTzFRX0v7BYrUAHGpDm4oQzT52ykYoDi88pFIyW+7zeQ6JjmdIUJ3Z7ImrFwP
 KUZw==
X-Gm-Message-State: AOAM530IB0+tlKdfifpeHtYdsC9bzzai139NkER9I1udZ1VY+3s0Uy8F
 mVYok+cDJRTg0pVXRcM1sPhyBYjnQnwzh9hvQ6rqwaQKqO4bcxz3wg58HEWYQ6Kxs0rBNN670O+
 FXOZAgSYqwZXD53I=
X-Received: by 2002:a05:6e02:219a:b0:2cd:8d4a:bdac with SMTP id
 j26-20020a056e02219a00b002cd8d4abdacmr6147192ila.83.1651015593328; 
 Tue, 26 Apr 2022 16:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuejhw5eDeIJbLzrxXkLW/vmOeGFI05iREzHgrenoBBkLZcM4dFiucUZNClkKhlkssAjWOIQ==
X-Received: by 2002:a05:6e02:219a:b0:2cd:8d4a:bdac with SMTP id
 j26-20020a056e02219a00b002cd8d4abdacmr6147171ila.83.1651015593041; 
 Tue, 26 Apr 2022 16:26:33 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a056e021d9600b002cd79a5cfd4sm8143338ila.23.2022.04.26.16.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:26:32 -0700 (PDT)
Date: Tue, 26 Apr 2022 19:26:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v10 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Message-ID: <Ymh/pjIxBNCCNa9L@xz-m1.local>
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-7-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426230654.637939-7-leobras@redhat.com>
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 08:06:55PM -0300, Leonardo Bras wrote:
> Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> sending the header packet and the memory pages happens in the same
> writev, which can potentially make the migration faster.
> 
> Using channel-socket as example, this works well with the default copying
> mechanism of sendmsg(), but with zero-copy-send=true, it will cause
> the migration to often break.
> 
> This happens because the header packet buffer gets reused quite often,
> and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
> to send the buffer, it has already changed, sending the wrong data and
> causing the migration to abort.
> 
> It means that, as it is, the buffer for the header packet is not suitable
> for sending with MSG_ZEROCOPY.
> 
> In order to enable zero copy for multifd, send the header packet on an
> individual write(), without any flags, and the remanining pages with a
> writev(), as it was happening before. This only changes how a migration
> with zero-copy-send=true works, not changing any current behavior for
> migrations with zero-copy-send=false.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 15fb668e64..07b2e92d8d 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -617,6 +617,7 @@ static void *multifd_send_thread(void *opaque)
>      MultiFDSendParams *p = opaque;
>      Error *local_err = NULL;
>      int ret = 0;
> +    bool use_zero_copy_send = migrate_use_zero_copy_send();
>  
>      trace_multifd_send_thread_start(p->id);
>      rcu_register_thread();
> @@ -639,9 +640,14 @@ static void *multifd_send_thread(void *opaque)
>          if (p->pending_job) {
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
> -            p->iovs_num = 1;
>              p->normal_num = 0;
>  
> +            if (use_zero_copy_send) {
> +                p->iovs_num = 0;
> +            } else {
> +                p->iovs_num = 1;
> +            }
> +
>              for (int i = 0; i < p->pages->num; i++) {
>                  p->normal[p->normal_num] = p->pages->offset[i];
>                  p->normal_num++;
> @@ -665,8 +671,19 @@ static void *multifd_send_thread(void *opaque)
>              trace_multifd_send(p->id, packet_num, p->normal_num, flags,
>                                 p->next_packet_size);
>  
> -            p->iov[0].iov_len = p->packet_len;
> -            p->iov[0].iov_base = p->packet;
> +            if (use_zero_copy_send) {
> +                /* Send header first, without zerocopy */
> +                ret = qio_channel_write_all(p->c, (void *)p->packet,
> +                                            p->packet_len, &local_err);
> +                if (ret != 0) {
> +                    break;
> +                }
> +

Extra but useless newline.. but not worth a repost.  Looks good here:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

> +            } else {
> +                /* Send header using the same writev call */
> +                p->iov[0].iov_len = p->packet_len;
> +                p->iov[0].iov_base = p->packet;
> +            }
>  
>              ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
>                                           &local_err);
> -- 
> 2.36.0
> 

-- 
Peter Xu


