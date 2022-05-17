Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90452A374
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:32:57 +0200 (CEST)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxJo-0002m9-3k
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqwb4-0002oq-63
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqwb2-00063Z-Id
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652791599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XT93t9O1rdbicOR5/6285KfW620rvepBYHA+ofKxRdQ=;
 b=UnyiOIE5Rr1TdyGSslStul274ZCO9C9KNeiVlpb54GE7wxC74Eln0RQWLg3jH5VwMOGU1g
 /cp1KnIKy17NBnJNdbXXJdIjzGPD+fZF/U5lyxHtFvQdV9QOExJ6uWJhxFK3mG3r6lEYC4
 rn6AqcftwXIIoy8miQWi/abk41cduqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-qTmmlolKMSaUGJZ8XR5VUA-1; Tue, 17 May 2022 08:46:32 -0400
X-MC-Unique: qTmmlolKMSaUGJZ8XR5VUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so8135306wma.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 05:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=XT93t9O1rdbicOR5/6285KfW620rvepBYHA+ofKxRdQ=;
 b=5y/fUntTHpkZ72gQCY+vfQBOxiRXNXqcXbZJTwJKOvMV0usTwbOvreKMWJSbar7U/s
 K0g9NiXBIoc8Y+2yj+hYlyy1uG7jwoiV7q44K3k0IheoE4O1lNJOSmBPJ68AJ/txNy3O
 1IdQ516Cjijfy1wEmPfah2efpnDQfQTyqHnbRuOmbuG6ggCNV5dJLl8hAjzEBb1wfTzw
 Hglef352+50wnirUQROqiX75rBq14aZFElSQa8cYkThiDHqis+HfPVBROonfcLTx1uKo
 SyIvjYLcRGqpl19CY7Co1W7xbm587NmChJyq0cyMB8NCBtu2t9bdpH2pG2LoDiIxw+0h
 cwPg==
X-Gm-Message-State: AOAM531ZriEvE7qGxKkVd78WfvGj6Em+Ub9Zheh5YgycMe5xOarnYsM6
 F0vWcsbz0v+8rr7NW0RAx08/2eHlxWejx2zd9XagXgWX3hSjjfYExvct7AvhfcX2OuNBlsQX4Gv
 FMguT+7T6LfbUQ+g=
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr18252609wrg.511.1652791591484; 
 Tue, 17 May 2022 05:46:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTRuQJDBJOzb/DD+ra/I4xjjrcHH1d9cGfwOLjq9R7QFdH8IR15IbgmrwdpSZ2dnXbY2yNFg==
X-Received: by 2002:a05:6000:1788:b0:20c:a43c:10fa with SMTP id
 e8-20020a056000178800b0020ca43c10famr18252584wrg.511.1652791591156; 
 Tue, 17 May 2022 05:46:31 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf?
 ([2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12250120wrc.57.2022.05.17.05.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 05:46:30 -0700 (PDT)
Message-ID: <c5fcbce258e2671f1ee22b3f4fdddea361cb2509.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] thread-pool: replace semaphore with condition
 variable
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Luk=C3=A1=C5=A1?= Doktor
 <ldoktor@redhat.com>
Date: Tue, 17 May 2022 14:46:29 +0200
In-Reply-To: <20220514065012.1149539-3-pbonzini@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-3-pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
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

Hi Paolo,

On Sat, 2022-05-14 at 08:50 +0200, Paolo Bonzini wrote:

[...]

>  static void *worker_thread(void *opaque)
>  {
>      ThreadPool *pool =3D opaque;
> @@ -99,20 +82,25 @@ static void *worker_thread(void *opaque)
>      pool->pending_threads--;
>      do_spawn_thread(pool);
> =20
> -    while (!pool->stopping) {
> +    while (!pool->stopping && pool->cur_threads <=3D pool->max_threads) =
{
>          ThreadPoolElement *req;
>          int ret;
> =20
> -        do {
> +        if (QTAILQ_EMPTY(&pool->request_list)) {
>              pool->idle_threads++;
> -            qemu_mutex_unlock(&pool->lock);
> -            ret =3D qemu_sem_timedwait(&pool->sem, 10000);
> -            qemu_mutex_lock(&pool->lock);
> +            ret =3D qemu_cond_timedwait(&pool->request_cond, &pool->lock=
, 10000);
>              pool->idle_threads--;
> -        } while (back_to_sleep(pool, ret));
> -        if (ret =3D=3D -1 || pool->stopping ||
> -            pool->cur_threads > pool->max_threads) {
> -            break;
> +            if (ret =3D=3D 0 &&
> +                QTAILQ_EMPTY(&pool->request_list) &&
> +                pool->cur_threads > pool->min_threads) {
> +                /* Timed out + no work to do + no need for warm threads =
=3D exit.  */
> +                break;
> +            }

 Some comments:

- A completely idle pool will now never be able to lose its threads, as the
  'pool->cur_threads <=3D pool->max_threads' condition is only checked afte=
r a
  non-timeout wakeup.

- You don't take into account the possibility of being woken up with an emp=
ty
  queue. Which I belive possible:

	CPU0:					      CPU1:
						   // in worker_thread(), queue empty
						   qemu_cond_timedwait();

	acb =3D thread_pool_submit_aio();
		    ...
	    qemu_cond_signal();
	thread_pool_cancel(acb);
						   // wakes-up, ret =3D=3D 1
					           req =3D QTAILQ_FIRST(&pool->request_list);
					           QTAILQ_REMOVE(&pool->request_list, req, reqs);
						   // segmentation fault....

		------------------------------------------------------

	CPU0:					      CPU1:
						   // in worker_thread(), queue empty
						   qemu_cond_timedwait();
	thread_pool_free()
		...
            qemu_cond_broadcast();
						   // wakes-up, ret =3D=3D 1
					           req =3D QTAILQ_FIRST(&pool->request_list);
					           QTAILQ_REMOVE(&pool->request_list, req, reqs);
						   // segmentation fault....

Regards,

--=20
Nicol=C3=A1s S=C3=A1enz


