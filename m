Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DE33B0C8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:16:11 +0100 (CET)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlCk-0003jU-IC
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLlAi-0002P7-3b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLlAf-0003lt-NS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615806840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWaxzoU9Y8x4gcOzMsxh40EXoAIrzjubWT0uHCu2dTk=;
 b=Jgi2gEIvLs1QoRkVFQyOEx1B4YfjByTuC/oSLaJjrsdz/0TguGG7hF18BzPgfzc5PTVSwl
 3nh63mYmtPDbXNGDFx20ph0eArzGCRa8ewHWFRwFnzEk/xeMy3M4ZZ1YvG3ggzySRu2hu6
 gtC/y/5Tmcg64KzwBodHOdSN2Cd3aoM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-xKRRo1ZqMQ-BqhLc1ilb9g-1; Mon, 15 Mar 2021 07:13:56 -0400
X-MC-Unique: xKRRo1ZqMQ-BqhLc1ilb9g-1
Received: by mail-wr1-f72.google.com with SMTP id p15so14799568wre.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWaxzoU9Y8x4gcOzMsxh40EXoAIrzjubWT0uHCu2dTk=;
 b=cSBnsBHmLeO23aoSGmk+XBSWn7rl6fndIwsgBGp8Zicii77BbHGbomi0KXsDnPvmIe
 SuvMIobJxsnGZ7jvtS3PCkVffKSl7t5k4msovtgoKcBru7nNbjT75kwZpAqvkQ9RBZoc
 EEyA1GfUoQS+xuUo2CNYUN+GRMy5pb5DmB7j08H4Ce6dEbzNKchX0Vl62cv5xX9sy7U/
 9J+i0CiB1NV8VOq1DqgieO9m3MqyQBU3uF/c9cl9W8C9RzaSW0seLoYvMVYW/u/G8hnU
 O7Ct1xS6H9xv9i21DwntZpljCtb9712aqzXgWVaXFsY2nqOH01DMaefkmaZ9idm1196S
 OejQ==
X-Gm-Message-State: AOAM530rcRpOGMxkzpQXcnITIQ6qKos7FnPUU4geFxgU7/geC3fXMF4h
 aZLJ3rKcTJXXdmi70LBjQAqKF+DAdMSaZ0ksSlrOsplLCwEBgCIfKSa3LGq0IFGqUpEhXD92xOY
 T6DE1Lupu9G3AfqSvoUCk4blfBMajEx73eaXCCV02HKKcvr+Z0KSF34s3c8eFPSDg
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr28023276wrw.70.1615806835017; 
 Mon, 15 Mar 2021 04:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsY5NNGgrCldcjXqvUDMOZ+uF+vLumvHO0yPFaZ9I9x+SnazI7aWvFzT4DcBPk8F4eXtDjAA==
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr28023260wrw.70.1615806834816; 
 Mon, 15 Mar 2021 04:13:54 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a8sm12059158wmm.46.2021.03.15.04.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:13:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/compatfd.c: Replaced a malloc call with g_malloc.
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-3-ma.mandourr@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <210a44d9-ab4c-5863-1556-d5a7c368adc2@redhat.com>
Date: Mon, 15 Mar 2021 12:13:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315105814.5188-3-ma.mandourr@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mahmoud,

On 3/15/21 11:58 AM, Mahmoud Mandour wrote:
> Replaced a call to malloc() and its respective call to free()
> with g_malloc() and g_free().
> 
> g_malloc() is preferred more than g_try_* functions, which
> return NULL on error, when the size of the requested
> allocation  is small. This is because allocating few
> bytes should not be a problem in a healthy system.
> Otherwise, the system is already in a critical state.
> 
> Subsequently, removed NULL-checking after g_malloc().
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  util/compatfd.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/util/compatfd.c b/util/compatfd.c
> index 174f394533..a8ec525c6c 100644
> --- a/util/compatfd.c
> +++ b/util/compatfd.c
> @@ -72,14 +72,10 @@ static int qemu_signalfd_compat(const sigset_t *mask)
>      QemuThread thread;
>      int fds[2];
>  
> -    info = malloc(sizeof(*info));
> -    if (info == NULL) {
> -        errno = ENOMEM;
> -        return -1;
> -    }
> +    info = g_malloc(sizeof(*info));

Watch out...

https://developer.gnome.org/glib/stable/glib-Memory-Allocation.html

  If any call to allocate memory using functions g_new(), g_new0(),
  g_renew(), g_malloc(), g_malloc0(), g_malloc0_n(), g_realloc(),
  and g_realloc_n() fails, the application is terminated.

So with your change instead of handling ENOMEM the QEMU process is
simply killed.

Don't you want to use g_try_new(struct sigfd_compat_info, 1) here
instead?

>  
>      if (pipe(fds) == -1) {
> -        free(info);
> +        g_free(info);
>          return -1;
>      }
>  
> 


