Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9747667203
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwaP-0006Ih-0k; Thu, 12 Jan 2023 07:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFwaG-0006FV-Fb
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:21:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFwaD-0007Rk-Bp
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673526084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xf+u8UrrR5wyb6z3Bp8h+7PAV2k8WeM26RI1bM/5cyc=;
 b=D6rM6f/82TBzStzaUqwb2hrf/Ic7tbSpLsvhxM34HrR9CxR7ZH7rlUt0gRGT1OJDonaRUR
 iORFiVpPlrsONaL1C5O/QeNvTXja/EFYpI86dlLDDaZNE2lWJb8/2kmDs+hJIdSgLNKPLA
 JbElMJQDTnRqb+/1V3vQsq1MhJOeRb0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-FPB0PwI5NW-xuWJejkBmmw-1; Thu, 12 Jan 2023 07:21:22 -0500
X-MC-Unique: FPB0PwI5NW-xuWJejkBmmw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d27-20020adfa35b000000b002bc813ba677so2310913wrb.6
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xf+u8UrrR5wyb6z3Bp8h+7PAV2k8WeM26RI1bM/5cyc=;
 b=kxxUz2PD1onicyp2VNi5AaYQtUAna9qnBDgGlpbwF/5C8c1D9TM7MFqy7o3o5IyHD7
 kAGWv0eEtqZCvXYQBnSaR1e9x3wz3k9zuBwhIBWqUcXqT5iO93zxhTPc6WsykprVYmIf
 Q5hQvQjy7L1AJ7On9Tzd759LogqEAw2ljIJihhauudt2lOvj1DG8i6VUJ6bLC98O5vY5
 yE1tAODK+jwtihpB8HqyDgxCO//zF3jgCRpn+H5SMuvOWC33ubnbonFmSyVrSsWuQzM/
 m9Z7k17VfZJY8AAJ9vUetpLabez1vE3YkPtK6c6WKa52CNMO8mR/+5gtNz5qN8j0keQi
 IbvQ==
X-Gm-Message-State: AFqh2kovCVf9xgtyZopPHWOxW4PAAo5EGQlbXjdBBMkTt6pK0rdhpw00
 DG1qU/AN7nrUSRbOVKrGjDK8kBWvRi1XsH4ndgej0j5CC0qMoROSFeVNGqDocBST+IP4d/9x6AD
 JRG53LetPgJIlRXo=
X-Received: by 2002:a05:6000:170f:b0:24a:9a21:c9e with SMTP id
 n15-20020a056000170f00b0024a9a210c9emr46640215wrc.59.1673526081821; 
 Thu, 12 Jan 2023 04:21:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsffQxVsqbQgrXf8id2QWSMkdM5Q1ilau2hG9k6l0FpGgCQ9zgUUnvEZ644i45QNmH5LjTmdg==
X-Received: by 2002:a05:6000:170f:b0:24a:9a21:c9e with SMTP id
 n15-20020a056000170f00b0024a9a210c9emr46640186wrc.59.1673526081582; 
 Thu, 12 Jan 2023 04:21:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5d6402000000b00297dcfdc90fsm16162209wru.24.2023.01.12.04.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:21:20 -0800 (PST)
Message-ID: <a7d2c722-e66e-25ef-6294-1e23f8fe285b@redhat.com>
Date: Thu, 12 Jan 2023 13:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/26] tests/unit: drop hacky race avoidance in
 test-io-channel-command
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110173922.265055-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 18.39, Alex Bennée wrote:
> We don't need to play timing games to ensure one socat wins over the
> other, just create the fifo they both can use before spawning the
> processes. However in the process we need to disable two tests for
> Windows platforms as we don't have an abstraction for mkfifo().
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 19f72eab96..425e2f5594 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -20,6 +20,8 @@
>   
>   #include "qemu/osdep.h"
>   #include <glib/gstdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>   #include "io/channel-command.h"
>   #include "io-channel-helpers.h"
>   #include "qapi/error.h"
> @@ -29,6 +31,7 @@
>   
>   static char *socat = NULL;
>   
> +#ifndef _WIN32
>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
>   
> +    if (mkfifo(fifo, 0600)) {
> +        g_error("mkfifo: %s", strerror(errno));
> +    }
> +
>       src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>                                                       O_WRONLY,
>                                                       &error_abort));
> -    /* try to avoid a race to create the socket */
> -    g_usleep(1000);
> -
>       dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
>                                                       O_RDONLY,
>                                                       &error_abort));
> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>       g_rmdir(tmpdir);
>   }
>   
> -
>   static void test_io_channel_command_fifo_async(void)
>   {
>       if (!socat) {
> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>   
>       test_io_channel_command_fifo(false);
>   }
> +#endif
>   
>   
>   static void test_io_channel_command_echo(bool async)
> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>   
>       socat = g_find_program_in_path("socat");
>   
> +#ifndef _WIN32
>       g_test_add_func("/io/channel/command/fifo/sync",
>                       test_io_channel_command_fifo_sync);
>       g_test_add_func("/io/channel/command/fifo/async",
>                       test_io_channel_command_fifo_async);
> +#endif
>       g_test_add_func("/io/channel/command/echo/sync",
>                       test_io_channel_command_echo_sync);
>       g_test_add_func("/io/channel/command/echo/async",

Reviewed-by: Thomas Huth <thuth@redhat.com>


