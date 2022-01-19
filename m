Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE8493940
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:09:02 +0100 (CET)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8pp-0000Rq-WE
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8n9-0006wv-C3; Wed, 19 Jan 2022 06:06:15 -0500
Received: from [2a00:1450:4864:20::334] (port=36816
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8n6-0005ry-AN; Wed, 19 Jan 2022 06:06:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso12189381wma.1; 
 Wed, 19 Jan 2022 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rMyYWQwkFUxYlrBPtd4iKHGVhxP/X8FBqU2tSLs2XqE=;
 b=Nnea4GcrVqdy0SOHTCuLYOHzrQJclwTZKlsNy9Ty9QP6s3TjweV26yXUPXJg1qORhc
 jO9LyylBAqWQxWZDzcM5tuKDwXu6GhTF66ubAX6sfCEHONDB2tIwYj81SkHH277MV59+
 TqAI66au83MKyQhLjuuDg2dyhC9yiojwtMVWb8xOz2Gh3BDGFKVy6xCihHSJ+hB9Oc96
 9OUzO04mbJhm+yLWjvCrA5N6B4ocRdmT/VK2oInlUPYHwiEBGxfrYxGXkj/oncS+vIe+
 17zks1Veewl9Z3UagPzAgCCZhIDGLtcqJuMZrH4qpm7YiwQsIy1T/QxAnQKVmAlaDCS0
 ywWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rMyYWQwkFUxYlrBPtd4iKHGVhxP/X8FBqU2tSLs2XqE=;
 b=tMx2F20jsMih6NY3uB2aGrJeu0pmet9bXQNXibxV1d3alYg1qmaZfB3tNgHRmEr8Sf
 i+vz8ocs+Eor7y9O2TcPPZxKbz2Z61B5Uw9CrKVeM+zS+7AzgIaKZokbtwxg3dqolHwo
 gR+kuDUVvRQe0iZJtSa/KSS+6X0D5DYfzBcvqjctS/kL/8KxOrgyCskUgB5iQs39eQ0t
 9mXZ4n3ZyGe+UGAIbPxzL6CoMiCgUdHra1Lh3/qDImFGu3+MqirOMhDjOx8M15Zoc8YE
 XTmuU8x/4DkJcf4NgKVoGxCNJ2D38ojct1lu7ESVE+nTSAp0NyEwnHW9T0k0QR7uQTfG
 kl6w==
X-Gm-Message-State: AOAM530zEO7sDte//4rv8BJpVQXL+bKt3Mg6L5HBRhK4zyapgXwLPEK+
 WmDNJVk/C+psVcMWTJV038w=
X-Google-Smtp-Source: ABdhPJzkLIQFiP43fYRTWavCbUpSRavKIBHEXHfzcb3ih80s3VTgmwkN4zizWzv5WX+9gnuSMV1P9g==
X-Received: by 2002:a05:6000:1866:: with SMTP id
 d6mr10906236wri.265.1642590367926; 
 Wed, 19 Jan 2022 03:06:07 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m17sm4907207wmq.35.2022.01.19.03.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:06:07 -0800 (PST)
Message-ID: <b40d10a8-c973-41e7-931f-fd6db76e8c9c@redhat.com>
Date: Wed, 19 Jan 2022 12:06:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 05/16] block/mirror.c: use of job helpers in drivers to
 avoid TOC/TOU
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-6-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
> 
> +    WITH_JOB_LOCK_GUARD() {
> +        abort = job->ret < 0;
> +    }
> +
>      if (s->prepared) {
>          return 0;
>      }

At this point I think job->ret is stable and can be accessed without 
guard.  The question however is what serializes calls to job_prepare. 
Is it the BQL?  Can we say that job->ret is only written under BQL, just 
like job->aio_context.

> @@ -1161,8 +1165,10 @@ static void mirror_complete(Job *job, Error **errp)
>      s->should_complete = true;
>  
>      /* If the job is paused, it will be re-entered when it is resumed */
> -    if (!job->paused) {
> -        job_enter(job);
> +    WITH_JOB_LOCK_GUARD() {
> +        if (!job->paused) {
> +            job_enter_cond_locked(job, NULL);
> +        }
>      }

I don't want to open a can of worms, but does it ever make sense to call 
job_enter while the job is paused?  Should this condition be moved to 
job_enter_cond_locked?

Paolo

