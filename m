Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F386E2638
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKlA-0003Uu-7g; Fri, 14 Apr 2023 10:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKl0-0003UJ-VV
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnKky-00008K-NK
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681483829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZNlS/WXH20/jwwYgBFVxyFtUeltaVB9np0Y6LTcEe8=;
 b=bB4Jnz7/ER3iDn7iR3rLN1PKrEFVDNvTISbYdiyN9EpcAr/RnGXn0YhGOffoodF+5V6RAk
 ZaTZU1CmtLgqGwjotzn25WiaAUZcJDKsP69M0cgkQAAP5R5oPuD5pMVS4q0x49SUbzSksL
 PpHtG4r9U1pGOYkf1N+D7rd/I/KyNHQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-BfEkrrlwPxen9GwC2aRTLg-1; Fri, 14 Apr 2023 10:50:25 -0400
X-MC-Unique: BfEkrrlwPxen9GwC2aRTLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w16-20020a05600c475000b003f082eecdcaso7280255wmo.6
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681483824; x=1684075824;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nZNlS/WXH20/jwwYgBFVxyFtUeltaVB9np0Y6LTcEe8=;
 b=imLoMwJ61r2oTz+qPPvyGNsUgV6wi8nToHSvb/tXFDuk5hjRvg7+iZY1oVHQMARVcg
 kWI8R8udGp7MPvb1bbJPQqXENVA7+4kR6n/Bad+TyTlWrN9WKTp1gbmg998ttSKeSg14
 8t21IKi7syXeLjSm9pgM2Qeo0G8PXtgi0h/FDyVztQ2j6N+umxv8t75srD+P7VVlanz7
 HRybl24NAfZtVM4K3k3KFOgJY0GPzeNadxqxq/q13NKv/ewssoCANwGDt90pDZihHeuU
 W2zAFbFs3+g4bGSvIqxMRjbgqYtgCR8kFkxIbDZYCRrN6LMVOWQuuqP4lSPY4Q1Sg2b7
 oyEQ==
X-Gm-Message-State: AAQBX9fJnLs7HVqbeFfbKRPP4eKfyy8BG8xIVvJAjTv/wde2CkFdqGQw
 9IbOiUJp4nQqcuqUxvo4my9++nDBz2XLNMV4WncbRHbexAuuMCuoTBS/TA7hAMGLO2MoMq0hzyk
 ODNLjvAnB+TE8WFc=
X-Received: by 2002:a5d:4042:0:b0:2ef:b4ac:8e5 with SMTP id
 w2-20020a5d4042000000b002efb4ac08e5mr4119162wrp.28.1681483824774; 
 Fri, 14 Apr 2023 07:50:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZzQiNwV+VqNWMr07/uYN4dbPXOXzmE1bp/k1UcOf8tY1cWHU5HsElO6m9i7s8pPH2MHhkzkA==
X-Received: by 2002:a5d:4042:0:b0:2ef:b4ac:8e5 with SMTP id
 w2-20020a5d4042000000b002efb4ac08e5mr4119150wrp.28.1681483824420; 
 Fri, 14 Apr 2023 07:50:24 -0700 (PDT)
Received: from [192.168.8.105] (tmo-096-44.customers.d1-online.com.
 [80.187.96.44]) by smtp.gmail.com with ESMTPSA id
 r4-20020adfda44000000b002f598008d50sm3700417wrl.34.2023.04.14.07.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:50:23 -0700 (PDT)
Message-ID: <bd3a3306-d254-7118-028a-fd84bd84576f@redhat.com>
Date: Fri, 14 Apr 2023 16:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] qtest: Don't assert on "-qtest chardev:myid"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230413150724.404304-1-peter.maydell@linaro.org>
 <20230413150724.404304-2-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230413150724.404304-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.282, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/04/2023 17.07, Peter Maydell wrote:
> If the -qtest command line argument is passed a string that says
> "use this chardev for I/O", then it will assert:
> 
> $ ./build/clang/qemu-system-i386 -chardev file,path=/dev/null,id=myid -qtest chardev:myid
> Unexpected error in qtest_set_chardev() at ../../softmmu/qtest.c:1011:
> qemu-system-i386: Cannot find character device 'qtest'
> Aborted (core dumped)
> 
> This is because in qtest_server_init() we assume that when we create
> the chardev with qemu_chr_new() it will always have the name "qtest".
> This is true if qemu_chr_new() had to create a new chardev, but not
> true if one already existed and is being referred to with
> "chardev:myid".
> 
> Use the name of the chardev we get back from qemu_chr_new() as the
> string to set the qtest 'chardev' property to, instead of hardcoding
> it to "qtest".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   softmmu/qtest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 34bd2a33a76..26852996b5b 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -867,7 +867,7 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
>       }
>   
>       qtest = object_new(TYPE_QTEST);
> -    object_property_set_str(qtest, "chardev", "qtest", &error_abort);
> +    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
>       if (qtest_log) {
>           object_property_set_str(qtest, "log", qtest_log, &error_abort);
>       }

Reviewed-by: Thomas Huth <thuth@redhat.com>


