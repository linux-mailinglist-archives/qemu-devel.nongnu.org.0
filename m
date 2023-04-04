Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02F6D637A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:40:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgtF-00013V-5T; Tue, 04 Apr 2023 09:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgss-0000wv-B2
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjgsq-0001sm-RA
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fw7/8SirqBr4X2qtQdxLuMPR3GvOcViyBmOU340OWg=;
 b=abfSQhgaYtzYpsQ6Rnh+lCpLuRkHbswRSzvuRSvhDXXxvi4ca8/57IokU611F8OvMTEHdt
 ndEIEJLfAVib4Zc2VIjRYQZ3COnR830XjvAxZVYqEegXHTr7CxqWXkAGOImlaaZGUx7ofy
 XtDFVsigw4y8zV2Jpnsw38pU7snn5yk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-XSmya7fCPN-YJvR-s3g9eQ-1; Tue, 04 Apr 2023 09:39:34 -0400
X-MC-Unique: XSmya7fCPN-YJvR-s3g9eQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 r19-20020a50aad3000000b005002e950cd3so46693479edc.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 06:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680615574; x=1683207574;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fw7/8SirqBr4X2qtQdxLuMPR3GvOcViyBmOU340OWg=;
 b=0UGxC4nA1S/z5Vt2tEeVIclzqMJ0EO35ZnBOnC1JyytlQdmX2bPqHJJVFoO3d/5ois
 J0W/+M3+Xh0E25Njxo1ZqwQ0IGr7Z61iW4xTXtVHjCE3vKBcZtpvT2KHE+/y8lW3Syvu
 0aBR3VS1h7d1pUrl3VPeOPYwSK5e7X8G7319yHUDYpSywJPjQBWaG6nIYdp7MtUHnh0H
 1/4JCAhfhGkfABlSq19qB7I+K6e8tEHwC+NIx9kLMRbr9jQ5ngJ2c0clO3N0vYSWm1VW
 WN1SRHLHi8C+y3lDKJYLSCJegTSvEPPXdH3C9f1q0sgw23NAZ+Dkhj60dl/l4OEzAv63
 iqSg==
X-Gm-Message-State: AAQBX9eLRH60j/Ka7/a8Puhs7TCCgBXLiBj7yQulu8vpMorU4Z1vc/hY
 b1Xdy6XD5yMG5FVpHtbh+GCLbnTBQW2vMf2OiLSvEuj09hNQ6I1nGTVZUPOtXRT84FhWODoHZED
 IVFZeE04K3q22PK0=
X-Received: by 2002:a17:906:aad3:b0:921:5cce:6599 with SMTP id
 kt19-20020a170906aad300b009215cce6599mr2419086ejb.41.1680615573821; 
 Tue, 04 Apr 2023 06:39:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350aaCkFAzW7d1iA6E5boAcJaqOBPLxKcd5Wvt9uXai5VAMRolWR6H8rwuM6Bp4D7FgjG04Wj5g==
X-Received: by 2002:a17:906:aad3:b0:921:5cce:6599 with SMTP id
 kt19-20020a170906aad300b009215cce6599mr2419071ejb.41.1680615573528; 
 Tue, 04 Apr 2023 06:39:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 gv19-20020a1709072bd300b00931db712768sm5987531ejc.4.2023.04.04.06.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 06:39:32 -0700 (PDT)
Message-ID: <c6ba263d-25e5-fde4-e46d-12929b2cd080@redhat.com>
Date: Tue, 4 Apr 2023 15:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/13] util/vhost-user-server: rename refcount to
 in_flight counter
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, Coiby Xu <Coiby.Xu@gmail.com>,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paul Durrant <paul@xen.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <fam@euphon.net>,
 David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 Hanna Reitz <hreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 eesposit@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230403183004.347205-1-stefanha@redhat.com>
 <20230403183004.347205-5-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230403183004.347205-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/3/23 20:29, Stefan Hajnoczi wrote:
> The VuServer object has a refcount field and ref/unref APIs. The name is
> confusing because it's actually an in-flight request counter instead of
> a refcount.
> 
> Normally a refcount destroys the object upon reaching zero. The VuServer
> counter is used to wake up the vhost-user coroutine when there are no
> more requests.
> 
> Avoid confusing by renaming refcount and ref/unref to in_flight and
> inc/dec.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/qemu/vhost-user-server.h     |  6 +++---
>   block/export/vhost-user-blk-server.c | 11 +++++++----
>   util/vhost-user-server.c             | 14 +++++++-------
>   3 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/include/qemu/vhost-user-server.h b/include/qemu/vhost-user-server.h
> index 25c72433ca..bc0ac9ddb6 100644
> --- a/include/qemu/vhost-user-server.h
> +++ b/include/qemu/vhost-user-server.h
> @@ -41,7 +41,7 @@ typedef struct {
>       const VuDevIface *vu_iface;
>   
>       /* Protected by ctx lock */
> -    unsigned int refcount;
> +    unsigned int in_flight;
>       bool wait_idle;
>       VuDev vu_dev;
>       QIOChannel *ioc; /* The I/O channel with the client */
> @@ -60,8 +60,8 @@ bool vhost_user_server_start(VuServer *server,
>   
>   void vhost_user_server_stop(VuServer *server);
>   
> -void vhost_user_server_ref(VuServer *server);
> -void vhost_user_server_unref(VuServer *server);
> +void vhost_user_server_inc_in_flight(VuServer *server);
> +void vhost_user_server_dec_in_flight(VuServer *server);
>   
>   void vhost_user_server_attach_aio_context(VuServer *server, AioContext *ctx);
>   void vhost_user_server_detach_aio_context(VuServer *server);
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3409d9e02e..e93f2ed6b4 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -49,7 +49,10 @@ static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
>       free(req);
>   }
>   
> -/* Called with server refcount increased, must decrease before returning */
> +/*
> + * Called with server in_flight counter increased, must decrease before
> + * returning.
> + */
>   static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>   {
>       VuBlkReq *req = opaque;
> @@ -67,12 +70,12 @@ static void coroutine_fn vu_blk_virtio_process_req(void *opaque)
>                                       in_num, out_num);
>       if (in_len < 0) {
>           free(req);
> -        vhost_user_server_unref(server);
> +        vhost_user_server_dec_in_flight(server);
>           return;
>       }
>   
>       vu_blk_req_complete(req, in_len);
> -    vhost_user_server_unref(server);
> +    vhost_user_server_dec_in_flight(server);
>   }
>   
>   static void vu_blk_process_vq(VuDev *vu_dev, int idx)
> @@ -94,7 +97,7 @@ static void vu_blk_process_vq(VuDev *vu_dev, int idx)
>           Coroutine *co =
>               qemu_coroutine_create(vu_blk_virtio_process_req, req);
>   
> -        vhost_user_server_ref(server);
> +        vhost_user_server_inc_in_flight(server);
>           qemu_coroutine_enter(co);
>       }
>   }
> diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
> index 5b6216069c..1622f8cfb3 100644
> --- a/util/vhost-user-server.c
> +++ b/util/vhost-user-server.c
> @@ -75,16 +75,16 @@ static void panic_cb(VuDev *vu_dev, const char *buf)
>       error_report("vu_panic: %s", buf);
>   }
>   
> -void vhost_user_server_ref(VuServer *server)
> +void vhost_user_server_inc_in_flight(VuServer *server)
>   {
>       assert(!server->wait_idle);
> -    server->refcount++;
> +    server->in_flight++;
>   }
>   
> -void vhost_user_server_unref(VuServer *server)
> +void vhost_user_server_dec_in_flight(VuServer *server)
>   {
> -    server->refcount--;
> -    if (server->wait_idle && !server->refcount) {
> +    server->in_flight--;
> +    if (server->wait_idle && !server->in_flight) {
>           aio_co_wake(server->co_trip);
>       }
>   }
> @@ -192,13 +192,13 @@ static coroutine_fn void vu_client_trip(void *opaque)
>           /* Keep running */
>       }
>   
> -    if (server->refcount) {
> +    if (server->in_flight) {
>           /* Wait for requests to complete before we can unmap the memory */
>           server->wait_idle = true;
>           qemu_coroutine_yield();
>           server->wait_idle = false;
>       }
> -    assert(server->refcount == 0);
> +    assert(server->in_flight == 0);
>   
>       vu_deinit(vu_dev);
>   

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


