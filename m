Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128EC69DE40
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQHz-0006su-D8; Tue, 21 Feb 2023 05:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQHx-0006qv-0m
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUQHv-0003Hj-4C
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676976862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3YpjBhhQT4ScmvOdNKZrTwBto6NUHRu6NxozrhSlQk=;
 b=FiUz6t2Z8Pj8j/kRuaNcGhUZqNBQiWFMEgC7GqnkIH73FAERPVbRDNiWIBvHgmw+hqHmAi
 2ISE9O7SOChVv4ZDebaT7KeT1kpU8eyie0P0f89Qs9GoDcsO+Gj/Nt3jTh8AIHuFZgl26H
 Yw3ZxBHA5yNMTmjHlcwMDS57mTmPB7Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-zWuNkztLPZSfBpIYvnhOlQ-1; Tue, 21 Feb 2023 05:54:19 -0500
X-MC-Unique: zWuNkztLPZSfBpIYvnhOlQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg26-20020a05600c3c9a00b003e21a3f4e84so1513198wmb.8
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R3YpjBhhQT4ScmvOdNKZrTwBto6NUHRu6NxozrhSlQk=;
 b=bA5nGZgjdH8Fr3KoiwIcjKnu6iVyi7aI4ef5lYPahfSOAtK5z8XEmUQP5KgHjiiOle
 B7/Wdd7h2OI3QTiCVAWTAcfFr0/lJB1jA4fdCX3puTvVssdafPsjQx8BGmE4P1xPBLVU
 9MSxn7m2CgNbNiuR1Zvyi1jrgdlbeile3Nl+4gGmsfvbM4S47jqZLXfWb7jRzh37FJDa
 2pgPEb3KjXgdDNPqBc0toJl5bqvYZCGpIlU0VPqp9gfcirdoWWE4DSN56QSW72pryH+3
 d6cxej6pxJrESvG2KXkpEKxNxIDDpj6WazdOXvRNjaFKAmx8ZA2egHoeQ22x5K/J+0YE
 wC8w==
X-Gm-Message-State: AO0yUKUcbkS0YwoAKUb9p3p1Pu2Lq+g555U5/uK0sDMZNHICSgA9KW/h
 mGdV83gI0WyDo6jTAiF/ImQPvZNcIq0fgDDNGqkBDS7+O3otkFLGIm8WBiNnWnHjsIggp2WRz68
 HQK5VIIOxZUegE58=
X-Received: by 2002:adf:e689:0:b0:2c5:5da4:a3b1 with SMTP id
 r9-20020adfe689000000b002c55da4a3b1mr4648641wrm.69.1676976858715; 
 Tue, 21 Feb 2023 02:54:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9hzyY19swHBbgkmYSAnWQGHNgqRydVSZVqm43+Ke+4vQE9WBN7JFRCl6c47Z+NLzDaVtVfsA==
X-Received: by 2002:adf:e689:0:b0:2c5:5da4:a3b1 with SMTP id
 r9-20020adfe689000000b002c55da4a3b1mr4648627wrm.69.1676976858454; 
 Tue, 21 Feb 2023 02:54:18 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c550eb062fsm2901414wrt.14.2023.02.21.02.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:54:17 -0800 (PST)
Message-ID: <d7ab036c-9a0b-5217-32cd-292ca1e55b5d@redhat.com>
Date: Tue, 21 Feb 2023 11:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 08/14] tests: don't run benchmarks for the tsan build
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
 <20230221094558.2864616-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221094558.2864616-9-alex.bennee@linaro.org>
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
> All we are really doing here is checking that TSAN builds compile and are
> therefor a tool available to developers. The benchmarks are not
> representative of QEMU's actual threading behaviour and they burn
> precious CI time. Indeed switching to check-unit reveals many
> unaddressed issues which have been logged at:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/1496
> 
> So for now disable the make check and make this a build only
> test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 8f332fc36f..e9a67e0191 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -465,7 +465,6 @@ tsan-build:
>       CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
>             --enable-trace-backends=ust --enable-fdt=system --disable-slirp
>       TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
> -    MAKE_CHECK_ARGS: bench V=1
>   
>   # gcov is a GCC features
>   gcov:

Reviewed-by: Thomas Huth <thuth@redhat.com>


