Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1749CF1A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:03:32 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCkle-0006t8-CO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCkft-0004ll-E2
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCkfq-0006if-3a
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643212649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2ATesYwWpQ9y86hDC4zALhY4gYC1flx3ScoP3ABiH8=;
 b=M7tp5xXS+sUw7FwkPRMjvexJXtQJVe8JYJEqDADfYMN/AXME5nqSkC0NSGC6sSto9lrxkB
 4Gmsv6re8+DXNasTQgUkzVSF5IkvhXQfvIuCctuRn7Tr21j5kjO9qegU/OKJlgqNEHI6Gw
 szaVw86d+N2pG43vGn/dtM52qvQAKQo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-LkckIQItMtKVgb4qCgHC_Q-1; Wed, 26 Jan 2022 10:57:27 -0500
X-MC-Unique: LkckIQItMtKVgb4qCgHC_Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso2983591wrb.15
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 07:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C2ATesYwWpQ9y86hDC4zALhY4gYC1flx3ScoP3ABiH8=;
 b=pa8ChIZweDLop/XGxRliPqnU3rYnPjibZTISaPrgGS5tu8MLGqb9RZ1+rbLcuyOWCG
 egiFABDBOmeMjtVaFdxmCtSlpB4gJRu2j6G6hENE4SS4STJMptwdc9JFByljLQui4aYm
 Eqy6Y+GGv4F4Bn8f9bq7vDZ7SiO4Mf9FeVjHxh5BWJiLmA8LF7Cl9t2tV6Tgj2k2RIKX
 cJl5s+EEb1hxOlX5S/50Se6KluBdVmVfgGjQvVM6/RbPZnnBxplS3FJEpXvXj0WAFeHl
 ALz0BVOuOXBqAZAA7ySx3YjIwOoD1DXlGJrTqC25dNDPTQ2DLk3N1EKyvjj+GOKbGKbG
 WTUw==
X-Gm-Message-State: AOAM532b4A8HeTvUJ/NMgxlHVVPtdg61LCkWw63/w8VPyIoiY5Vkxsto
 UzIHgeRUUDWtDu3e31BTV0nSjCdFqDxSBUgAQG0Rf8Z6qxidAqK8Ehkx5ajfxyIetzErdAd3pg1
 u6yHvQ50XW4f1CHk=
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr7729636wma.129.1643212646771; 
 Wed, 26 Jan 2022 07:57:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjqKjgQezgwV+Kiev1CcJLOG9hXihRJW0HNfznjhtKvpfeiy5fD8rs9Ejkw9xlTJIZzp0hiA==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr7729596wma.129.1643212646444; 
 Wed, 26 Jan 2022 07:57:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s9sm19604105wrr.84.2022.01.26.07.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 07:57:26 -0800 (PST)
Message-ID: <6bcd2c3d-cf8b-fecd-a61d-64ebe248e558@redhat.com>
Date: Wed, 26 Jan 2022 16:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 31/33] include/qemu/job.h: introduce job->pre_run() and
 use it in amend
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-32-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-32-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Introduce .pre_run() job callback. This cb will run in job_start,
> before the coroutine is created and runs run() in the job aiocontext.

I presume this means “before the coroutine is created that will run 
run() in the job aiocontext”?

(The way it’s written here sounds a bit like .pre_run() will run run())

> Therefore, .pre_run() always runs in the main loop.
> We can use this function together with clean() cb to replace
> bdrv_child_refresh_perms in block_crypto_amend_options_generic_luks(),
> since that function can also be called from an iothread via
> .bdrv_co_amend().
>
> In addition, doing so we check for permissions in all bdrv
> in amend, not only crypto.

As I’ve written in my reply to patch 30, I’m not quite sold on this 
part, but disregarding that part (and one typo below), this patch looks 
good to me.

> .pre_run() and .clean() take care of calling bdrv_amend_pre_run()
> and bdrv_amend_clean() respectively, to set up driver-specific flags
> and allow the crypto driver to temporarly provide the WRITE
> perm to qcrypto_block_amend_options().
>
> .pre_run() is not yet invoked by job_start, but .clean() is.
> This is not a problem, since it will just be a redundant check
> and crypto will have the update->keys flag == false anyways.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/amend.c      | 33 +++++++++++++++++++++++++++++++++
>   include/qemu/job.h |  9 +++++++++
>   2 files changed, 42 insertions(+)

[...]

> diff --git a/include/qemu/job.h b/include/qemu/job.h
> index 4ea7a4a0cd..915ceff425 100644
> --- a/include/qemu/job.h
> +++ b/include/qemu/job.h
> @@ -223,6 +223,15 @@ struct JobDriver {
>        * the GS API.
>        */
>   
> +    /**
> +     * Called in the Main Loop context, before the job coroutine
> +     * is started in the job aiocontext. Useful to perform operations
> +     * that needs to be done under BQL (like permissions setup).

s/needs/need/

> +     * On success, it returns 0. Otherwise the job failed to initialize
> +     * and won't start.
> +     */
> +    int (*pre_run)(Job *job, Error **errp);
> +
>       /**
>        * Called when the job is resumed by the user (i.e. user_paused becomes
>        * false). .user_resume is called before .resume.


