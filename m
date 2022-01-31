Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F934A3FDC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 11:08:00 +0100 (CET)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nETbL-0003xE-IU
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 05:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nETXY-0002fw-Rs
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nETXV-0003bz-ME
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 05:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643623438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMPT0fef8h8xU+wJrBuPvngJpboHG1UssK5Ekk6F1LE=;
 b=PCNZ0vedgv8Q8VzlnqFatNS+z3Wj8etn65cV5725SI6w7n63h1mXKvegwDtkrJqoy/hBTc
 uCh3J04in0oAZzPV8uvaVDiO8Ktu0BNklopf4HRbDIo2qGMUyDV+ekmLnz084ZqGFQH7Ju
 dKDOvXX0EZUnTrsOWW/o263c3IwmC1s=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-ApdC9UZbO2C8XgKSFwHD5w-1; Mon, 31 Jan 2022 05:03:56 -0500
X-MC-Unique: ApdC9UZbO2C8XgKSFwHD5w-1
Received: by mail-qt1-f199.google.com with SMTP id
 br10-20020a05622a1e0a00b002d37e07e79aso9945733qtb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 02:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=iMPT0fef8h8xU+wJrBuPvngJpboHG1UssK5Ekk6F1LE=;
 b=8HGWMWy5SCArY8f2htbpQIy2gy46bB1zcqEDSBoqydzqyiyW4Zebu5NSXUFhPFpj9K
 y2D55gASiY/CTEl94ywxinBo3quAd4B3nTHWpMoXxNzNzFY90BDDy149OY20XWKcz3Al
 nv1ogajwXFTv0lMN8GsN793vkOGkqRER05zVbrhVS9+2tmS4yZGnnXBz8/plO4AbMYi9
 zHUzFrL+Lknk9LU6VkKze0G2/fSvsN8WWmzyqJzGioG/A26VLpb64hFOYBHXYwBaT7s+
 m88/PhdESQWTA6arQDABp8zdsIrCWYdkkQM50KUgZH9aukiQPmKY0krLjw+ib6vGA+QO
 UkRw==
X-Gm-Message-State: AOAM5328TXXz3zyCCyi136rB/77/Yyj6Bsy9/xaCSH3oW51dg2ykFzPy
 /oLgqb2q0MGw2Xdkqro/DTXds2OvLquTojP0zMHyyUmseaZUQJHUGzZDhXfqOkdvzKEAJnpSw63
 HcRyZglYB2hFqguw=
X-Received: by 2002:ac8:5f12:: with SMTP id x18mr13809740qta.497.1643623436493; 
 Mon, 31 Jan 2022 02:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+MvlMy8UF3DCqx7n6FDP+ktUHo6JLuLlmJeVBhAQE6I+C1KWQMfJfExiMt++rTPCajmrCaw==
X-Received: by 2002:ac8:5f12:: with SMTP id x18mr13809725qta.497.1643623436270; 
 Mon, 31 Jan 2022 02:03:56 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id a141sm8244548qkc.73.2022.01.31.02.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 02:03:55 -0800 (PST)
Message-ID: <92f4eef5-9b47-1900-0b15-d7bbf175ab55@redhat.com>
Date: Mon, 31 Jan 2022 11:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 16/19] job: detect change of aiocontext within job
 coroutine
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
References: <20220128115031.4061565-1-eesposit@redhat.com>
 <20220128115031.4061565-17-eesposit@redhat.com>
In-Reply-To: <20220128115031.4061565-17-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> As a small improvement, we don't need aio_co_enter() in job_start(),
> we can simplify it with qemu_coroutine_enter(). If the aio_context
> where it is running is wrong, job_do_yield_locked() will automatically
> reschedule the coroutine where it belongs, once the first
> job_pause_point is triggered in job_co_entry.
> 

> @@ -1145,7 +1161,7 @@ void job_start(Job *job)
>          job->paused = false;
>          job_state_transition_locked(job, JOB_STATUS_RUNNING);
>      }
> -    aio_co_enter(job->aio_context, job->co);
> +    qemu_coroutine_enter(job->co);

This is actually wrong. If the job is not under drain, job_pause_point
in job_co_enter is not going to yield() job->co, so it won't change the
aiocontext automatically, running part if not all of job->driver->run()
in the wrong AioContext.

I will drop it in v5.

Emanuele


