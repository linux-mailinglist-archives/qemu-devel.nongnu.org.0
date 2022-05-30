Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5274153746B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 08:38:10 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvZ2W-0008Q2-VX
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 02:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvYwg-0006to-PA
 for qemu-devel@nongnu.org; Mon, 30 May 2022 02:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvYwd-0007bc-Ph
 for qemu-devel@nongnu.org; Mon, 30 May 2022 02:32:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653892322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5Omx2V+6bddO+hJBv2xPzdk2nVcQGyQaVnBtV5CKVw=;
 b=XFR8vPiH33sbHuGp0RqLjtYDmGkbRGWRb8nsoGoR8xdf+o9Qe60u8OP6G+Q38ohMnuPy2a
 GSJC5jYfGPOYkQhu9ophGyJb8KuGnDkzlzNuZCi5Ib6lLqT10LcHfP5slGtA+dlJiMP3SJ
 7YJFNdYq8Zu5Lq9rFivyY/yf1hi366Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-2gixuHTlPle2Moy-V9drSA-1; Mon, 30 May 2022 02:32:00 -0400
X-MC-Unique: 2gixuHTlPle2Moy-V9drSA-1
Received: by mail-qv1-f72.google.com with SMTP id
 da12-20020a05621408cc00b0046448be0e98so1784331qvb.9
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 23:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C5Omx2V+6bddO+hJBv2xPzdk2nVcQGyQaVnBtV5CKVw=;
 b=cj8jdvasaLjZNAfuWJlCyULz50sWrx7+eHBMB2fqW896Mtlwv+tEBhOhoLCWbLmceJ
 r6PD/H8ssAvfK3nLBuHxU6HIJOSi/G3HuOfbo75rDjZtYS0JWd1SnIQOEmzju7Om1rSv
 XxELuPbnrMm04WOW78l+3IrL6KAwy8FYYmP+N7Zhxvk4kO0A8JxGp21YhX36WLJxegM+
 pFfb3RlrMHUorxVo4xykMLY5fM7jqZnj8LDuG7vnDSj69kRIEwbyDfVHrYQ6GtmPeSrj
 5UtSNXmZIggorjvUJyaB4g7izQjSwFp/TfvQbcK63+AfBDIOq5EJbZj1fniW5EZ10UJE
 6Hbw==
X-Gm-Message-State: AOAM530opTcb0zqX8PIHwzGhBueWTGzpvB7zRTkUn8qDX3KR4yHn+Z9e
 n7YgNUxpqdIhpCDXqH+KeRkPH8uCyaVNvLQHuryoua+FXHySnJzsa9rzVHHednevIYMtXkFLQlb
 izGBzHilqxpoljVk=
X-Received: by 2002:ae9:e8cd:0:b0:6a3:6967:4565 with SMTP id
 a196-20020ae9e8cd000000b006a369674565mr28954377qkg.192.1653892320109; 
 Sun, 29 May 2022 23:32:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMGyjH+RQwUlTU1pnDwEPy70Soi64LHoFoKXeYElNavx/TGvcBs2syO/1oKqCMBaUFs/rboA==
X-Received: by 2002:ae9:e8cd:0:b0:6a3:6967:4565 with SMTP id
 a196-20020ae9e8cd000000b006a369674565mr28954369qkg.192.1653892319884; 
 Sun, 29 May 2022 23:31:59 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 22-20020a05620a079600b0069fe1dfbeffsm6871476qka.92.2022.05.29.23.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 23:31:59 -0700 (PDT)
Message-ID: <dd2d12c3-b574-8182-4456-3c5f0196f674@redhat.com>
Date: Mon, 30 May 2022 08:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] gitlab-ci: add meson JUnit test result into report
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, f4bug@amsat.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220525173411.612224-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220525173411.612224-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 25/05/2022 19.34, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>

Could you please provide a patch description? (What's the benefit of this 
patch? Why is testlog.txt not sufficient?)

  Thanks,
   Thomas


> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index dc6d67aacf..b381345dbc 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -44,6 +44,8 @@
>       expire_in: 7 days
>       paths:
>         - build/meson-logs/testlog.txt
> +    reports:
> +      junit: build/meson-logs/testlog.junit.xml
>   
>   .avocado_test_job_template:
>     extends: .common_test_job_template


