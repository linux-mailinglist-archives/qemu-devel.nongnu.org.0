Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434323CC55
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 18:38:42 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3MR7-000335-JN
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 12:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3MQM-0002XN-P7
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 12:37:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25451
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3MQK-0003F6-5d
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 12:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596645471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RJ0dvC85dV1yS4u5jajJXyBksh2pnCkNTYK/LipD60=;
 b=TdAIVxxsCovY50r3zP0RTAZfA1tTt2VqEkm7zpRW31k7WBLXPYvZv8N4h1JnmUKTkaTk+P
 BHL70fnzTtuB/3XV5DH/UfL9LOj40Ka+h3lYF6c1o3LlBQHEEJdlEE8tKiwSMPpEFIft81
 NHJdp/GxdPtxQCmRrChoEPQRQ+xl1JA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-7ld9s7SbMIOgQBCKOV91dQ-1; Wed, 05 Aug 2020 12:37:49 -0400
X-MC-Unique: 7ld9s7SbMIOgQBCKOV91dQ-1
Received: by mail-wr1-f71.google.com with SMTP id f7so13750659wrs.8
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 09:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RJ0dvC85dV1yS4u5jajJXyBksh2pnCkNTYK/LipD60=;
 b=GpxdFIrtOJg6T2UgSHtGkWDG7YYaz3z4rncf8pZqlLvnL6QgWDxpXRI1etZc3xkr71
 SSTgNhElkuS5zLojuWFZMLo5yZunXg0KDYluX5oZorqp7cYYHug2or/NYBSRUxSrBjvw
 xUare57h+C45bDCW82P2FHE6cye4Mb/c9T9LjWAszHiKe0K/efCNDdmpTmzBwVIMkI97
 eE0qLN71WuWli2lu2Vf5HZBLZbAN+O0RKWO20Fra1ycROG8F1YshkzpQj8fUDG7/43Si
 aWV+itykMxyBDa1ZdEUf+Y37ZThvlvlems0N3MubWymKxrB6PGjzmdY8Ay/OEjK0Efu3
 2NDw==
X-Gm-Message-State: AOAM5332V35khau9y8m4hC58y1uOiMs0ebM/sfjOm0XQm+mZK7vPd8jh
 r2oXaAKLEpHPDcY/EE9phIjCFarsFgeqtiINnDvbLuVel4EyaKOfdkpDtmctr1e3UxIKBeMbGVo
 MnsjIn23JMYWkOtQ=
X-Received: by 2002:adf:e9cd:: with SMTP id l13mr3887505wrn.340.1596645467654; 
 Wed, 05 Aug 2020 09:37:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT/yl+lizFbXJHDoKqS/ouzQHU4Xoio4JnXtPd051ykYtcXe31tQmBiIjKBBpuYFx1lhyvvw==
X-Received: by 2002:adf:e9cd:: with SMTP id l13mr3887485wrn.340.1596645467360; 
 Wed, 05 Aug 2020 09:37:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7841:78cc:18c6:1e20?
 ([2001:b07:6468:f312:7841:78cc:18c6:1e20])
 by smtp.gmail.com with ESMTPSA id m20sm13915163wmc.1.2020.08.05.09.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 09:37:46 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] aio-posix: keep aio_notify_me disabled during
 polling
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200805100051.361547-1-stefanha@redhat.com>
 <20200805100051.361547-4-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8e066cf0-e5f9-283c-eedd-47974bf4bbac@redhat.com>
Date: Wed, 5 Aug 2020 18:37:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200805100051.361547-4-stefanha@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 04:10:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/20 12:00, Stefan Hajnoczi wrote:
> +
> +        /*
> +         * aio_notify can avoid the expensive event_notifier_set if
> +         * everything (file descriptors, bottom halves, timers) will
> +         * be re-evaluated before the next blocking poll().  This is
> +         * already true when aio_poll is called with blocking == false;
> +         * if blocking == true, it is only true after poll() returns,
> +         * so disable the optimization now.
> +         */
> +        if (use_notify_me) {
> +            atomic_set(&ctx->notify_me, atomic_read(&ctx->notify_me) + 2);
> +            /*
> +             * Write ctx->notify_me before reading ctx->notified.  Pairs with
> +             * smp_mb in aio_notify().
> +             */
> +            smp_mb();
> +
> +            /* Don't block if aio_notify() was called */
> +            if (atomic_read(&ctx->notified)) {
> +                timeout = 0;
> +            }

Aha, this is the trick: "timeout = 0" also applies if a timer was moved 
early.  In this case you uselessly keep notify_me set for a bit, but 
it's okay. Nice!

The code can be simplified a bit more, since the use_notify_me variable 
is just "timeout":

    use_notify_me = (timeout != 0);
    if (use_notify_me) {
         /*
          * aio_notify can avoid the expensive event_notifier_set if
          * everything (file descriptors, bottom halves, timers) will
          * be re-evaluated before the next blocking poll().  This is
          * already true when aio_poll is called with blocking == false;
          * if blocking == true, it is only true after poll() returns,
          * so disable the optimization now.
          */
         atomic_set(&ctx->notify_me, atomic_read(&ctx->notify_me) + 2);
         /*
          * Write ctx->notify_me before reading ctx->notified.  Pairs with
          * smp_mb in aio_notify().
          */
         smp_mb();
 
         /* Don't block if aio_notify() was called */
         if (atomic_read(&ctx->notified)) {
             timeout = 0;
         }
     }
     if (timeout || ctx->fdmon_ops->need_wait(ctx)) {
         ret = ctx->fdmon_ops->wait(ctx, &ready_list, timeout);
     }
     if (use_notify_me) {
         /* Finish the poll before clearing the flag.  */
         atomic_store_release(&ctx->notify_me,
                              atomic_read(&ctx->notify_me) - 2);
     }

Paolo


