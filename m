Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC065B95CC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 09:57:12 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYjkF-0002xY-29
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 03:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjVC-0003WF-Lm
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oYjV6-0001el-Na
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 03:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663227692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqr0sZWEhMwxXafgK7sJ7pivjnhUhSCL6n43o9jJg/I=;
 b=XKXD0tS6gfUxASDmeJHZAth6ch/g2acHLVuD3ANC6J9MtprpD2+5+qb2wc7r3SFNWtAWFj
 lVHODp7WYIvg9cGXNWNLe5wvUdtbnBMCgSn8M1QEzdpont0HQ5o2OrbiZBPHtc6fDsWrmK
 mmlU7mBCZrLWBnx/3CS3+9piQo66dlQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-2uIa8dQCPm2I_Ct7raZr2A-1; Thu, 15 Sep 2022 03:41:31 -0400
X-MC-Unique: 2uIa8dQCPm2I_Ct7raZr2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so3522660wms.5
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 00:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oqr0sZWEhMwxXafgK7sJ7pivjnhUhSCL6n43o9jJg/I=;
 b=Ih7yTfVFHastLFT65xOVdF85ttstpZW3JRUWMctI+0Iw+RpV5djEg4wEpphXY+utws
 39viye6V9NWx7SvrMz0r9vJPFDI41t8uBTEm6/MEQqyLV9WepNGheDCFDsi884aiUHi6
 abAMt+PAsdfh/DDErD/ThIQKbAIw3aakyv++ZRToLii87H33DaGaivoZLZMTRGhhEeOV
 OUloqG1QNTX5qQ/QmCTdLVSLr0HQfrLmbIIq/RDcf65eNlS3HoVabJT9Xt+Y+aRo3Msx
 RA2OSgotiTutZKKq35iHwtxCKqoDfWNfyoxfXNjVL7C6nCTuiVtX+BoWPXpk9aFkL907
 LPZw==
X-Gm-Message-State: ACgBeo2QAEit35O77jWm6/rDg4POclw8+Z2KbyB5nh1XNCySuPR4tSRH
 tmtC9dpCZeoUzrqhA+absYxPT2Y+oDjnHuZm9XWQP8FkHLgoCNJpBa7Wfdv31MbzOXkDmjrO+9X
 gcrIc61Z38SFsITo=
X-Received: by 2002:a05:6000:10d2:b0:228:d60b:6d5a with SMTP id
 b18-20020a05600010d200b00228d60b6d5amr22526920wrx.146.1663227689946; 
 Thu, 15 Sep 2022 00:41:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4npA8OsWTp8AJilvI5B6z/qt50TtoKLTpiRO36SmAFZtX+JmUouan7a6HqZalQPgf17HuhNA==
X-Received: by 2002:a05:6000:10d2:b0:228:d60b:6d5a with SMTP id
 b18-20020a05600010d200b00228d60b6d5amr22526905wrx.146.1663227689715; 
 Thu, 15 Sep 2022 00:41:29 -0700 (PDT)
Received: from [172.20.194.41] ([79.140.208.123])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003a3442f1229sm1861482wms.29.2022.09.15.00.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 00:41:29 -0700 (PDT)
Message-ID: <1bc8a538-d9e5-810f-83f4-c255fbf26f96@redhat.com>
Date: Thu, 15 Sep 2022 08:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 19/30] gitlab-ci/custom-runners: Disable -static-pie
 for ubuntu-20.04-aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220914155950.804707-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 14/09/2022 16.59, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> The project has reached the magic size at which we see
> 
> /usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init_first':
> (.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 against \
> symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/libc.a(environ.o)
> /usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, please recompile with -fPIC
> 
> The bug has been reported upstream, but in the meantime there is
> nothing we can do except build a non-pie executable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220823210329.1969895-1-richard.henderson@linaro.org>
> Message-Id: <20220826172128.353798-14-alex.bennee@linaro.org>
> 
> ---
> v2
>    - rm --extra-cflags workaround (now in configure)
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> index 3d878914e7..3f4dee4f86 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
>    # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
>    - mkdir build
>    - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + # Disable -static-pie due to build error with system libc:
> + # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie
>      || { cat config.log meson-logs/meson-log.txt; exit 1; }
>    - make --output-sync -j`nproc --ignore=40`
>    - make --output-sync -j`nproc --ignore=40` check V=1

Reviewed-by: Thomas Huth <thuth@redhat.com>


