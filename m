Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F6675012
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 10:00:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pInFx-0006fI-Oq; Fri, 20 Jan 2023 04:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInFr-0006eG-FC
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:00:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInFm-0003ml-0B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 04:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674205205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qakjVd27pCWMfxKREO/DwNWWRN9q594Ck2VyJC6l+CU=;
 b=OZlQcnCCbuMRo0fR/RJlJy4BJqOUV6sGVvR/arG8/j3NCV6kjxZgmRRCG3R0pqm8krExJ1
 3/KoTDRMLhnEwOVf1AIHtTAUygpkTO64sopMENpKupB04Tr1sPpPizvi/FnIuxjFKZJ2Xg
 iSFSXEO8i8cYav244YeY16JZ/yt2YTk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-HTq849yFPlGTJJCaNffHJQ-1; Fri, 20 Jan 2023 04:00:03 -0500
X-MC-Unique: HTq849yFPlGTJJCaNffHJQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso3081123qkp.20
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 01:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qakjVd27pCWMfxKREO/DwNWWRN9q594Ck2VyJC6l+CU=;
 b=IQib9e73vncJNngkOdDTq9I7ydTs32SvHBoRnMg9QERgeOSvLlp2beWfk1fNaPZuJ/
 htgNvrfhRn60KJR6PkUE/bEWY+z5mkd8GU6skAkNMgaoX7Xho6TEEzaSFGAtlh/Pe5FC
 y1Ss/Nj2nqfjTQ1oR0m23MAWphBUboT2YiLUvgavBoISBkSmGY59s8AW+7F66ZkkBSAR
 fzAw99GgnkAjAp/v4kfMwjL3IMnhwUagQy08Vq45SdWyHBchNEwucOvaG1tlDnHguC2l
 13TvRnnkJa5dCEqwsaMvhyyvYq0Jq2ESr/SXGYx4F3LTzDtu4djnOiVDL6eFFfvIDKEi
 sBlg==
X-Gm-Message-State: AFqh2kqu4BRewAXXpfR+BMHPMYDwVUiIGcFICfIvxEoHxG+SduklzhV/
 ieQr6KxIlUkaLEaDwu3QWsm1IcU4jSPridLqmq7bp17VMZNXu7Qb9MyIcCpkvL6awFeSlaR74B+
 v0syKvGydaOd001E=
X-Received: by 2002:a0c:fc03:0:b0:537:4b09:670f with SMTP id
 z3-20020a0cfc03000000b005374b09670fmr227273qvo.25.1674205203146; 
 Fri, 20 Jan 2023 01:00:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJYM2dTIkP4wDWSIhzjZBWDNSq5lcffRo/JhUoLEgEem0Z0Z77W5AraAVAlOB8S9ndrEsCbA==
X-Received: by 2002:a0c:fc03:0:b0:537:4b09:670f with SMTP id
 z3-20020a0cfc03000000b005374b09670fmr227255qvo.25.1674205202913; 
 Fri, 20 Jan 2023 01:00:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 ew3-20020a05622a514300b003b440ab16fasm7747515qtb.61.2023.01.20.00.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:00:01 -0800 (PST)
Message-ID: <4b5fbb1a-204b-15a0-8cc1-71c899b9760a@redhat.com>
Date: Fri, 20 Jan 2023 09:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119145838.41835-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3a854b0174..92890b409d 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -226,14 +226,17 @@ static void test_machine(const void *data)
>       const testdef_t *test = data;
>       g_autofree char *serialtmp = NULL;
>       g_autofree char *codetmp = NULL;
> -    const char *codeparam = "";
>       QTestState *qts;
>       int ser_fd;
> +    g_autoptr(GString) cmd = g_string_new("");

You could already start with the "-no-shutdown" here.

>       ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
>       g_assert(ser_fd != -1);
>       close(ser_fd);
>   
> +    g_string_append_printf(cmd, "-M %s ", test->machine);
> +    g_string_append(cmd, "-no-shutdown ");
> +
>       if (test->kernel || test->bios) {
>           ssize_t wlen;
>           int code_fd;
> @@ -243,19 +246,23 @@ static void test_machine(const void *data)
>           wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
>           g_assert(wlen == test->codesize);
>           close(code_fd);
> +        g_string_append_printf(cmd, "%s %s ",
> +                               test->kernel ? "-kernel " : "-bios ", codetmp);
>       }
>   
> +    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
> +                                "-serial chardev:serial0 ", serialtmp);

Why not include this in the initial g_string_append_printf statement already?

>       /*
>        * Make sure that this test uses tcg if available: It is used as a
>        * fast-enough smoketest for that.
>        */
> -    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
> -                      "-chardev file,id=serial0,path=%s "
> -                      "-serial chardev:serial0 -accel tcg -accel kvm %s",
> -                      codeparam,
> -                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
> -                      codetmp ? : "", test->machine,
> -                      serialtmp, test->extra);
> +    g_string_append(cmd, "-accel tcg ");
> +    g_string_append(cmd, "-accel kvm ");
> +    g_string_append(cmd, test->extra);
> +
> +    qts = qtest_init(cmd->str);

... and I have to say that this is already quite a lot of code churn, just 
to get the -accel parameters tweaked in the end.

Why don't you simply do a single small patch that just replaces the "-accel 
tcg -accel" part with "%s %s" and add two parameters like this:

   has_tcg ? "-accel tcg" : "", has_kvm ? "-accel kvm" : ""

?

  Thomas


