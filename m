Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3FC4445FC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:34:16 +0100 (CET)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJDL-00038c-LW
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miJBZ-0001er-1H
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miJBW-0000MJ-A9
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635957141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cjZ1nYf4FVR6rza5qysRx79ORdc2rrFnV+37jRCM+4A=;
 b=I++9q6aYQXh2Xo4LIi5oz5KcX+npK8djAVdmQpmZu04hZm0YQ9P4qEVA83NDHWSvE0X9eQ
 UXBYYZjd5xBrdT3ExMZY6lGLS5iS3fUtsbf6NrTGnodG+hEyKo4dKncy7lTPFnlYPGP7gd
 kOlTumVf/Cw0cJmMcPuFn8VVguExMnE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-llQUvf9NMzSGGV_MH1vuYw-1; Wed, 03 Nov 2021 12:32:18 -0400
X-MC-Unique: llQUvf9NMzSGGV_MH1vuYw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso1289365wmc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 09:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cjZ1nYf4FVR6rza5qysRx79ORdc2rrFnV+37jRCM+4A=;
 b=zbuh4/xVeCEgFeNITy9Vy4pS46/uUTDqrMcZIR4h24vlitZQr6j406+Fx4ECI5fLS0
 QwOiw39vh372W7rPYhKog3FNsIWEaXxmE8MSMWJlTDu/cEhWjbxtwuSwFFnXQDP1Wp+b
 NOZTgdXQRGCZydhR42J0mpWeYVb76GlRScT/AkFHjvVTdEBtmoana/pL+P4BFp24IkyM
 Va9WvSLX2YNUmkN5oqhVVJJWssJ01IJ0BgVxJGCh7/84zYQztkPg7TzaplZNOcstlnMf
 y61lhTwM+GhrN0lS3z7p4smvCJ32d+F6r0Fi83hORt1W1Ngn5YY7bswplgTXNBH/C/1r
 Lp9A==
X-Gm-Message-State: AOAM5302hMUcAOEZ+AqPlgepicAy9VsStOQ6qQfK+lNGMDJIQo3IryUB
 tY9X8IqzmPmHgLtP27+srO9oQIX1SbCTdywjfEzJsNe2ip6ceNIEgY1zTVGUNozUGyLR6YJC/ke
 771+2rcDR8AvRAAg=
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr56892808wrg.339.1635957137561; 
 Wed, 03 Nov 2021 09:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaYucyXlMxwFAHFt2cOLfmbjS+wF14CQdA1zPcZYKb606xW3AUS7J5na5v6ku4oZUnxME3Jg==
X-Received: by 2002:adf:ba0d:: with SMTP id o13mr56892766wrg.339.1635957137341; 
 Wed, 03 Nov 2021 09:32:17 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t6sm6418118wmq.31.2021.11.03.09.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 09:32:16 -0700 (PDT)
Message-ID: <a513fe14-5fa7-ac8e-8ef8-b165055e73d5@redhat.com>
Date: Wed, 3 Nov 2021 17:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] job.c: add missing notifier initialization
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211103162155.791482-1-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211103162155.791482-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 17:21, Emanuele Giuseppe Esposito wrote:
> It seems that on_idle list is not properly initialized like
> the other notifiers.
> 

Cc: qemu-stable@nongnu.org
Fixes: 34dc97b9a0e ("blockjob: Wake up BDS when job becomes idle")

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  job.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/job.c b/job.c
> index dbfa67bb0a..54db80df66 100644
> --- a/job.c
> +++ b/job.c
> @@ -352,6 +352,7 @@ void *job_create(const char *job_id, const JobDriver *driver, JobTxn *txn,
>      notifier_list_init(&job->on_finalize_completed);
>      notifier_list_init(&job->on_pending);
>      notifier_list_init(&job->on_ready);
> +    notifier_list_init(&job->on_idle);
>  
>      job_state_transition(job, JOB_STATUS_CREATED);
>      aio_timer_init(qemu_get_aio_context(), &job->sleep_timer,
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


