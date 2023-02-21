Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BA69DD8E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:08:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPYg-00006p-P3; Tue, 21 Feb 2023 05:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPYe-00006Q-IL
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:07:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUPYc-0001Or-Qc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676974051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kemu3tO5gYETTSD14GppNL8mfvdfn+An8mCMM6uYLPM=;
 b=M3FaYXgtyWLgjr7NuZjhpcq+Y5/+eD6coAisNDUX9CUp9jV/ZjvMk3l+Yp9kR05RtB+VV3
 V895kIxVEiMox8/265CkGFtLuvWQb6lliZ77l0WXP+qkvvrVFNG5lJK4ny/2C5i/42X9Bw
 sJkbX3t7ySrA3o0q2KqJCoEe1q9hldw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-AcP4nOh5MC6L2tVTxldDEg-1; Tue, 21 Feb 2023 05:07:29 -0500
X-MC-Unique: AcP4nOh5MC6L2tVTxldDEg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l4-20020a5d6d84000000b002c54aaa28dcso592922wrs.16
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kemu3tO5gYETTSD14GppNL8mfvdfn+An8mCMM6uYLPM=;
 b=yUnr4QVHkeUVxNZRv9HiQ0hiyPv+OhAR+TDW5G66ediI7tCun0O4PR2RR+wS3KUZXA
 gMlhwsf9UJe65QHwwAjDAlnTonvw+6ord2ceZdv2zKToPHobImLwpUM8Xz2ftyE4H2iX
 chK0RX/qIbTYEHlBhFFnXwdvjNDUvc30hcRfaf2PqcfiRCQCYYfc//IqdVbyse7IVWLB
 76WIbu/WhbiLdV6kwxaX5E1M2yyQvzFPjJ8hibVZ4J2PcuRi6KSE+8uYmjB9bJtF+a2M
 XYSqC5dGEeUNwzJW8KJ21Wf9zYrhUdE9PlNV5KwWaeB2s41OUXblu5M1SgWf/pDXVDWV
 fRlg==
X-Gm-Message-State: AO0yUKWXN8bvD6bh5GV37OxvAAu0XylMs52M41y8sRLNuJkXYgvqi7wB
 KzOkA1mJ+bEEUnh0fH0XetHU4dmaIthQtkiW/LBFGxnQlLsLY0wzjn2yhEdujEEeXXmMCJ+s0c5
 /faUS6e+Q545SrfQ=
X-Received: by 2002:a05:600c:244e:b0:3db:1200:996e with SMTP id
 14-20020a05600c244e00b003db1200996emr3368765wmr.16.1676974048034; 
 Tue, 21 Feb 2023 02:07:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+jZ03bT/PffnySi9ZBv9uuW7outpBS0Zsdt3MAsD/LuRwPskrUKA8shY9yZh05aVxU+yigIQ==
X-Received: by 2002:a05:600c:244e:b0:3db:1200:996e with SMTP id
 14-20020a05600c244e00b003db1200996emr3368732wmr.16.1676974047784; 
 Tue, 21 Feb 2023 02:07:27 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b003dc1d668866sm4586253wmb.10.2023.02.21.02.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:07:27 -0800 (PST)
Message-ID: <47357c02-bc71-c6b3-db94-2c52402f362d@redhat.com>
Date: Tue, 21 Feb 2023 11:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/14] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Bandan Das <bsd@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 21/02/2023 10.45, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 04b75ab3b4..c6e66a8c33 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
>       g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
> +    int err;
>   
>       if (mkfifo(fifo, 0600)) {
>           g_error("mkfifo: %s", strerror(errno));
> @@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
>       object_unref(OBJECT(src));
>       object_unref(OBJECT(dst));
>   
> -    g_rmdir(tmpdir);
> +    err = g_unlink(fifo);
> +    g_assert(err == 0);
> +    err = g_rmdir(tmpdir);
> +    g_assert(err == 0);
>   }
>   
>   static void test_io_channel_command_fifo_async(void)

Reviewed-by: Thomas Huth <thuth@redhat.com>


