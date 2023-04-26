Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885326EF06C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:47:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pramv-0005b4-AV; Wed, 26 Apr 2023 04:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pramh-0005WN-KA
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prame-0006eW-Pm
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682498751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hw/nKYBHQH3hvfAaunfOsUD5sHNwu/V6DaO5dQrd+jo=;
 b=NyYWJIu4KtMqHt+4l5/++ovHMXm/bl5Fl5xqjaIN6IejB5z+5S90lDsy0KGxz08uBTbR2D
 dYMOEOER/o/wkCCO4PLyT5WvMJG+/mGUDyyIuHytdbDJyBpX+HkwXbRhazG93hkjuZ6PDo
 XqHpOZ2L7JlE1BwajRSGRWe6on7cFA0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-zn5DjcOjOHmGE7cbCdO-9A-1; Wed, 26 Apr 2023 04:45:49 -0400
X-MC-Unique: zn5DjcOjOHmGE7cbCdO-9A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a770so3681615f8f.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 01:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682498749; x=1685090749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hw/nKYBHQH3hvfAaunfOsUD5sHNwu/V6DaO5dQrd+jo=;
 b=hOwZgrgCLjGtgg06YeaCvYZ6tFCOdjnAyz8uJzOZTgWgS61eYpdAa2GC88Gyp84eNe
 n3bX0ov22RGl6DDecHKGdJfUuypcBHJpgPbIqghwkDRtyptwt6hIbLeInKpfUI5MYD0y
 0t9/8WCJ7ezD653wFxcYH7liBxxnsGwfv18t/fnYpiEq5izTY/Fz0HLE7eXkq41PV+Kc
 3be9iQ+DfctWEF0FR+iawT0qo1UgiHlSuE7knovk0xK3KzPvLbt8a8nFECxYcvdGXN8h
 +WrIIYjoRuljdmvRXOA1CBzGmG+NnGPyG1Z6y8u4el4ml+Txy9C/I/gkokKugVXr9gI4
 rP1w==
X-Gm-Message-State: AAQBX9eX0uD1/ZBURKu5CvA62kkD3XB3RdA468pGWyy6uE+41L8eWi75
 21IGnalnsgV8oGfLRktcWmq0TxJwNJO1Jj99CEBuiBkdKZcUs/D+VLgBZODIXPCzbuiMTUaoCya
 QQc/2AfGrrdsbIDY=
X-Received: by 2002:adf:f30a:0:b0:2f5:9b1f:da81 with SMTP id
 i10-20020adff30a000000b002f59b1fda81mr13048492wro.54.1682498748910; 
 Wed, 26 Apr 2023 01:45:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3wtwiVpNTjuuC9IPn6gVKwU4euD5b3YlLmmw3bsU+Dm173zeS1XYpsNKntjbiO1yXg6L5gQ==
X-Received: by 2002:adf:f30a:0:b0:2f5:9b1f:da81 with SMTP id
 i10-20020adff30a000000b002f59b1fda81mr13048480wro.54.1682498748624; 
 Wed, 26 Apr 2023 01:45:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-131.web.vodafone.de.
 [109.43.176.131]) by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b002c55521903bsm15105870wrq.51.2023.04.26.01.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 01:45:48 -0700 (PDT)
Message-ID: <a11743c0-5f9b-fa8c-14d9-8e724bf4cee0@redhat.com>
Date: Wed, 26 Apr 2023 10:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tests/unit/test-blockjob: Re-enable complete_in_standby
 test
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Czenczek
 <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230426081601.2567990-1-eesposit@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426081601.2567990-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/04/2023 10.16, Emanuele Giuseppe Esposito wrote:
> Pause the job while draining so that pause_count will be
> increased and bdrv_drain_all_end() won't reset it to 0, so the
> job will not continue.
> 
> With this fix, the test is not flaky anymore.
> 
> Additionally remove useless aiocontext lock around bdrv_drain_all_end()
> in test_complete_in_standby().
> 
> Fixes: b6903cbe3a2 "tests/unit/test-blockjob: Disable
> complete_in_standby test"
> Suggested-by: Hanna Czenczek <hreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/unit/test-blockjob.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
> index a130f6fefb..46d720aeee 100644
> --- a/tests/unit/test-blockjob.c
> +++ b/tests/unit/test-blockjob.c
> @@ -488,11 +488,15 @@ static void test_complete_in_standby(void)
>       bdrv_drain_all_begin();
>       assert_job_status_is(job, JOB_STATUS_STANDBY);
>   
> +    /*
> +     * Increase pause_count so that the counter is
> +     * unbalanced and job won't resume
> +     */
> +    job_pause(job);
> +
>       /* Lock the IO thread to prevent the job from being run */

I guess the above comment should now be removed, too?

> -    aio_context_acquire(ctx);
>       /* This will schedule the job to resume it */
>       bdrv_drain_all_end();
> -    aio_context_release(ctx);

  Thomas


