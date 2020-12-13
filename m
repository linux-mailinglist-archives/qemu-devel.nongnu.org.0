Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903C52D9100
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 23:53:02 +0100 (CET)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koaEf-0007aM-LP
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 17:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koaCw-0006Bi-9V
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 17:51:14 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koaCt-0001tY-JL
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 17:51:14 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r7so14612119wrc.5
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 14:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qVd9eB2AJneu6xw5DfVUl1zrUcvIwXcoq015Sm6Bgb0=;
 b=Y1V/CNI54soOfQaK/buieU+gyxGQ41l/4m7Y1nTFK7ls/8uNgjIWBgBAMKU7jMKTb0
 ImFzjrg3LdXgDepm9aDMbeOhjLEPxJsFlU+2fC1pzbMKicyZQyJ8COnLVub6ov1o1JRM
 6JPqi3uCg7LABdmaXFxvDlIGXEHTmTQdUue0S6/HSxRTWeiiB6zf0I0D7KXH4KYpAK5a
 K8J6GmwzV3pP207Ko7I4ZBi1XqrZsXhID8L7udqIo1T8pC3BgoYbqgN+pZsvZxwRyUEK
 ftRBNuvV70lHucsRq0g3TcuhsrVdsgBiqZDzGbhhc2NgjSAi4h2bEZZ1lGr+8iYif1d1
 B1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qVd9eB2AJneu6xw5DfVUl1zrUcvIwXcoq015Sm6Bgb0=;
 b=rJwT7YH+inwQ6o/LKUu7QdHgZkORc/wDKdprm0mk/CODLLlJGsWOmmJU8dplyQyqTX
 IZxr/Qyco62QiPuu57rsENJCLBy7pr0TboYu9uCukbAITWAGP8jZCyc5icEaBpJT6NFM
 PZFi1WWvHxbUSoaIpiRgQhmcbZfWf3FwYeFwlv6PaY+t6TuWpuleCX/sus2BWwkRLVTk
 8FManpzkHyRHk/Pz13p08RoEmTGY7BZJ8KH7DnXJI3XO8U6+6M9cbvrZ4LU1M2mdRNUQ
 Xqo7UAtr3/PQyJ5rlgHiec6b56OXK8kyVuOd+SbS/vFuilOWJq/+x0MDutqV0fpDUI8/
 TS8w==
X-Gm-Message-State: AOAM532y2tVPPUKRJ22K0i2Z4e8OOfQUzgvrn14qKrp64gxVgNI8ssmb
 saG3TiPeqx8mvHr5k1UFOJM=
X-Google-Smtp-Source: ABdhPJy8/UunYd4+kDMMJun5bsQ0ScLZEHcoY3xhtjLtv9B3yI0FcVCZKBt+3WhVfsa0dsePXmxkzw==
X-Received: by 2002:adf:e2ca:: with SMTP id d10mr25938591wrj.65.1607899867176; 
 Sun, 13 Dec 2020 14:51:07 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e16sm31852471wra.94.2020.12.13.14.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 14:51:06 -0800 (PST)
Subject: Re: [PULL 1/2] test-char: abort on serial test error
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20200728143108.2192896-1-marcandre.lureau@redhat.com>
 <20200728143108.2192896-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cc2227d3-9e5c-96ba-03f9-54f12a356da8@amsat.org>
Date: Sun, 13 Dec 2020 23:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20200728143108.2192896-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/20 4:31 PM, Marc-André Lureau wrote:
> We are having issues debugging and bisecting this issue that happen
> mostly on patchew. Let's make it abort where it failed to gather some
> new informations.

"good" news, this started to fail on Gitlab (centos7):

Running test test-char
Unexpected error in object_property_try_add() at ../qom/object.c:1220:
attempt to add duplicate property 'serial-id' to object (type 'container')
ERROR test-char - too few tests run (expected 38, got 9)
make: *** [run-test-86] Error 1

https://gitlab.com/philmd/qemu/-/jobs/908114388
https://gitlab.com/philmd/qemu/-/jobs/908114389
https://gitlab.com/philmd/qemu/-/jobs/908114390

> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/test-char.c b/tests/test-char.c
> index 614bdac2df..d35cc839bc 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -1200,7 +1200,7 @@ static void char_serial_test(void)
>  
>      /* test tty alias */
>      qemu_opt_set(opts, "backend", "tty", &error_abort);
> -    chr = qemu_chr_new_from_opts(opts, NULL, NULL);
> +    chr = qemu_chr_new_from_opts(opts, NULL, &error_abort);
>      g_assert_nonnull(chr);
>      object_unparent(OBJECT(chr));
>  
> 


