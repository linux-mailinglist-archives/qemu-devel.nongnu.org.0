Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7C674FE6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:55:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInAC-00026P-Ma; Fri, 20 Jan 2023 03:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInA8-000265-BW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInA5-0002eF-WE
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:54:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674204852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uvHHDaKHWJigG1GeKZODgcoUqjIuk/XpIQCCaxfM2g=;
 b=MyM35ZrGMKzrJasGfP2yxnvMa1I3/QvhVmj87tM+7PLVe6ivW+wUBamEk6eTofsA6YOm06
 RS7Sn/ZAfNb1y1LRj1Uav8+f163BogWHGJ4GrMbujiokGVLibVz8HmOzyh2eWwMP8dlZyI
 GW7YxOSGtUIjZwdU6GrfUgqs6jNSooA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-I6CV2CmPMAqWtTAyHYXrmw-1; Fri, 20 Jan 2023 03:54:10 -0500
X-MC-Unique: I6CV2CmPMAqWtTAyHYXrmw-1
Received: by mail-qv1-f70.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso2218428qvb.21
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uvHHDaKHWJigG1GeKZODgcoUqjIuk/XpIQCCaxfM2g=;
 b=piXXSWSx04jt8TDkjOH8srWm1b6wd1262ndqTfLKqXAJ8v5cqDvHV7XiVeuVDZfHbQ
 pa2zgoaKMXIQYP7GyeJiyq5DMeLyxQrpEL237x+OvYMzy866WJgcvXeossXw+RawFl2S
 9vf1S3Of8UFQ2/Abkl2Mc80h3Gf67oHjBNgz/89dWGDiuszVVl3/+fnH89GbglgIKgqQ
 sqAfzuChnrRDkR5hbj32SxJpaWAuf1lSIIB/m14xlzivOyFTsEGIcD3qKa5mim6mIwQ5
 M5QA0oHUAOYdpb6ck6csALGBMRWtbFMmdwlrHMQR5YNIOK8zE5zeL1edQSCHs1QSo0Hx
 LnFw==
X-Gm-Message-State: AFqh2koB+2VJ5ZBwrWoRZ1okNg75gbez+Ib0K8UxqKmxcbtbMFDfxC80
 gow+J5sOxTFsnv0zpp1IKGvMEHl0sT4cUgyJMnUH1EIZ0f+W8O6lMOsdv+LRKeVMxAKe6+OR3FZ
 JVB5VohOr/Gp9DLk=
X-Received: by 2002:a05:6214:57d1:b0:515:5e33:505b with SMTP id
 lw17-20020a05621457d100b005155e33505bmr20997450qvb.20.1674204850419; 
 Fri, 20 Jan 2023 00:54:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJpegEgmWknZAbwUWE3gZqqDNIY5eXlP4VNNijjTrgrXg//+/dtaQ+BwgvgZmUnhJjKFeVZg==
X-Received: by 2002:a05:6214:57d1:b0:515:5e33:505b with SMTP id
 lw17-20020a05621457d100b005155e33505bmr20997435qvb.20.1674204850144; 
 Fri, 20 Jan 2023 00:54:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 bn39-20020a05620a2ae700b00706bc44fda8sm4292790qkb.79.2023.01.20.00.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:54:09 -0800 (PST)
Message-ID: <60ea4601-f342-b865-2ede-9cbcbbdd0230@redhat.com>
Date: Fri, 20 Jan 2023 09:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/01/2023 15.58, Philippe Mathieu-Daudé wrote:
> Slighly modify test_machine() to simplify next commit review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..3a854b0174 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -227,7 +227,6 @@ static void test_machine(const void *data)
>       g_autofree char *serialtmp = NULL;
>       g_autofree char *codetmp = NULL;
>       const char *codeparam = "";
> -    const uint8_t *code = NULL;
>       QTestState *qts;
>       int ser_fd;
>   
> @@ -235,21 +234,13 @@ static void test_machine(const void *data)
>       g_assert(ser_fd != -1);
>       close(ser_fd);
>   
> -    if (test->kernel) {
> -        code = test->kernel;
> -        codeparam = "-kernel";
> -    } else if (test->bios) {
> -        code = test->bios;
> -        codeparam = "-bios";
> -    }
> -
> -    if (code) {
> +    if (test->kernel || test->bios) {
>           ssize_t wlen;
>           int code_fd;
>   
>           code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
>           g_assert(code_fd != -1);
> -        wlen = write(code_fd, code, test->codesize);
> +        wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);

Just a matter of taste, but I prefer the Elvis operator without space in 
between.

>           g_assert(wlen == test->codesize);
>           close(code_fd);
>       }
> @@ -258,12 +249,14 @@ static void test_machine(const void *data)
>        * Make sure that this test uses tcg if available: It is used as a
>        * fast-enough smoketest for that.
>        */
> -    qts = qtest_initf("%s %s -M %s -no-shutdown "
> +    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
>                         "-chardev file,id=serial0,path=%s "
>                         "-serial chardev:serial0 -accel tcg -accel kvm %s",
> -                      codeparam, code ? codetmp : "", test->machine,
> +                      codeparam,

You removed the initialization of codeparam, so this is now always the empty 
string, isn't it? ... please just remove it completely now.

> +                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
> +                      codetmp ? : "", test->machine,
>                         serialtmp, test->extra);
> -    if (code) {
> +    if (codetmp) {
>           unlink(codetmp);
>       }
>   

  Thomas


