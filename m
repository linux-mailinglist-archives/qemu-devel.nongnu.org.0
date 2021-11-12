Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5244E9E6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:19:54 +0100 (CET)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYLJ-0006qX-5q
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYJg-0003if-Bb
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYJP-0008CF-7l
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636730273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1id/cMtCVMQQPBq6ZbJfIuotlH1iaZImVNTSOAkDq8=;
 b=jB+3fOMj/z8WNIXOMK+Cf3SsBSfNd5P+xwTxAZUldWs4yTgveXY03cwpncWWq/rh0e2Oti
 gi3XC9o39+kXSty6i2qSTbCdePTdxt04wt791cSKec6kDURDcEUGhxb0TIe6lNgEz4hwp5
 DMG6a6jDKB0gpRIkMkhOuRoSCdewMFc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-GOzc2HBJPuKpq-Zcyh5FYg-1; Fri, 12 Nov 2021 10:17:51 -0500
X-MC-Unique: GOzc2HBJPuKpq-Zcyh5FYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so4425664wmh.6
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l1id/cMtCVMQQPBq6ZbJfIuotlH1iaZImVNTSOAkDq8=;
 b=Wi3R7bIYdu4k8LWaI5QJ1Wll5Kadqq2cXyBu4koO1z/YpRdqisqgLB8wkscXegPgKj
 uwPqiCGeBEvRgnuV4slOdHk7Sh8yP5AO07k/oyFD6IIzAA4u+l9cPqq3bCBVN8inE3UJ
 cQwzmFfzD5sMqnZ+E3QkuFgBhpAQHxF69F8+/idw0RzZynT+wi7PvU3p+fDwMdMOHHam
 YctSNfQK7NtyUBxXZvnjsBh3V95ABhpDq1Dbo0bu8YPUKM5pW0QDkA/Ah9E8IGx8784a
 FAOrxHE+npFVe+AXf2WpvNWmrqIeEbxeoGeKcgrBMQMWpanfwx+Yx/SawEYufTZulQ0a
 zChQ==
X-Gm-Message-State: AOAM53004j+dvzkFOucBPV/Yi552OmPzZLx0jAStcnb3DQQLqFQrUCzR
 xbOUPttLTpogyPL2BcOwLYPvJPbHgeabZH3LGJlH7PcIhnu0VBtIUAd4OyrV91oY6+VKvDWdptk
 iSoKZuctQPvpYQ9k=
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr19353340wrs.26.1636730270526; 
 Fri, 12 Nov 2021 07:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztFoCu0TUNXweUSRSN5vDukVxBPFeTaQI3YHbBuvqEN2Nfkk1ntTZVqoXz+OR/4rGEsi3SPA==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr19353308wrs.26.1636730270343; 
 Fri, 12 Nov 2021 07:17:50 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n184sm11352070wme.2.2021.11.12.07.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:17:50 -0800 (PST)
Message-ID: <ae6f4869-e616-7a70-0769-b62a3b60a492@redhat.com>
Date: Fri, 12 Nov 2021 16:17:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 10/25] assertions for blockjob_int.h
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-11-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-11-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   blockjob.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/blockjob.c b/blockjob.c
> index 4bad1408cb..fbd6c7d873 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -83,6 +83,7 @@ BlockJob *block_job_get(const char *id)
>   
>   void block_job_free(Job *job)
>   {
> +    assert(qemu_in_main_thread());
>       BlockJob *bjob = container_of(job, BlockJob, job);

Our coding style (docs/devel/style.rst) requires all statements to come 
after all declarations in a block, so the assert() may not precede the 
bjob declaration.

>   
>       block_job_remove_all_bdrv(bjob);
> @@ -436,6 +437,8 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>       BlockBackend *blk;
>       BlockJob *job;
>   
> +    assert(qemu_in_main_thread());
> +
>       if (job_id == NULL && !(flags & JOB_INTERNAL)) {
>           job_id = bdrv_get_device_name(bs);
>       }
> @@ -504,6 +507,7 @@ void block_job_iostatus_reset(BlockJob *job)
>   
>   void block_job_user_resume(Job *job)
>   {
> +    assert(qemu_in_main_thread());
>       BlockJob *bjob = container_of(job, BlockJob, job);

Same here.

(And now I see that I’ve missed such instances in the other assertion 
patches, like in bdrv_save_vmstate(), those should be fixed, too)

Hanna

>       block_job_iostatus_reset(bjob);
>   }


