Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F569194D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 08:41:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQO0o-0007fJ-Cv; Fri, 10 Feb 2023 02:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO0l-0007f3-B6
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQO0i-0002xq-CQ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 02:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676014795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90ZE15CLMEDjs6q6i1DNCciDfHm7ILZGRlHbsAdccjk=;
 b=K6QOFVH69iMX/7QLJt4DgMTBoyRPOtPlK3U0vONW0R2sW/smAuMEmx+HGBggxxvADcz7/o
 JNwdWa7QllSt+aUNLg6/vgDvF3JkYNxtNOsLybUzp2Y397H96caOz98vwdXRzriUgD3Lwa
 H6VUxcuMPlOhIUbYcVAETCETjfUl/Hs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-6QKBftYXNGGebPeQSfkAqw-1; Fri, 10 Feb 2023 02:39:51 -0500
X-MC-Unique: 6QKBftYXNGGebPeQSfkAqw-1
Received: by mail-qk1-f199.google.com with SMTP id
 op32-20020a05620a536000b0072e2c4dea65so2792180qkn.12
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 23:39:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90ZE15CLMEDjs6q6i1DNCciDfHm7ILZGRlHbsAdccjk=;
 b=dvy5KerWZdVjbNzArxj+WgllL7jBHhIdbhpsAHPoo7LX1hY8OaGQIct8BbS+cONjH1
 lwwx9gazvZJZmYpxhQqQZf24PIOui7N+E/9UThTCpW8BrV+vS3aWZlbWoFtOpNKxBbWw
 1keTMGXR7L7Q5OjTACNMXR+yK/y0aQ/tNAMmIUkD1IDZJqqCHX7kv7XNlUGXMHmLG4nq
 btLNWxuAMELdQIs4wQ3qsxiKqaMkBo2/+4jY7hmLRCPGJhhTPWP3XckbpTVtBDiF8O+G
 nzCVLiGyzGGtuEmwzsyQIdw5Cqa60u1FN3UZ9WLpToaq6fP454q5h17+trAbyKpmraAW
 nZOw==
X-Gm-Message-State: AO0yUKUPuaIf0UjSr96I/udP6p4yFaiNn/zeCvAvxsoCQqXRYrfLn3D5
 soyKtUsecTqPNpoblvK6qrMNMRrw7izh3YmpOQdEM9RKfgaX8raiix/y6s44sZ1l6kOt1Kfg+N9
 S5rU5Su9+madS740=
X-Received: by 2002:a05:622a:452:b0:3b9:bd28:bb80 with SMTP id
 o18-20020a05622a045200b003b9bd28bb80mr24525150qtx.15.1676014790943; 
 Thu, 09 Feb 2023 23:39:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9WrDktUcIZxhS4I8bAvt+ZPkhqAN5/zDPJjIzOJnMli9Z0j4Es6q6Pmm4gTBMT7GNZ7/+tMQ==
X-Received: by 2002:a05:622a:452:b0:3b9:bd28:bb80 with SMTP id
 o18-20020a05622a045200b003b9bd28bb80mr24525130qtx.15.1676014790663; 
 Thu, 09 Feb 2023 23:39:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-85.web.vodafone.de.
 [109.43.178.85]) by smtp.gmail.com with ESMTPSA id
 fd10-20020a05622a4d0a00b003bb50a9f9bbsm2883748qtb.7.2023.02.09.23.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 23:39:50 -0800 (PST)
Message-ID: <c8c7d712-effe-ec41-583a-becd148e009c@redhat.com>
Date: Fri, 10 Feb 2023 08:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230210003147.1309376-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/02/2023 01.31, John Snow wrote:
> At the moment, we look for just "python3" and "python", which is good
> enough almost all of the time. But ... if you are on a platform that
> uses an older Python by default and only offers a newer Python as an
> option, you'll have to specify --python=/usr/bin/foo every time.
> 
> We can be kind and instead make a cursory attempt to locate a suitable
> Python binary ourselves, looking for the remaining well-known binaries.
> 
> This configure loop will prefer, in order:
> 
> 1. Whatever is specified in $PYTHON
> 2. python3
> 3. python
> 4. python3.11 down through python3.6
> 
> Notes:
> 
> - Python virtual environment provides binaries for "python3", "python",
>    and whichever version you used to create the venv,
>    e.g. "python3.8". If configure is invoked from inside of a venv, this
>    configure loop will not "break out" of that venv unless that venv is
>    created using an explicitly non-suitable version of Python that we
>    cannot use.
> 
> - In the event that no suitable python is found, the first python found
>    is the version used to generate the human-readable error message.
> 
> - The error message isn't printed right away to allow later
>    configuration code to pick up an explicitly configured python.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   configure | 33 +++++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index 64960c6000f..ea8c973d13b 100755
> --- a/configure
> +++ b/configure
> @@ -592,20 +592,39 @@ esac
>   
>   : ${make=${MAKE-make}}
>   
> -# We prefer python 3.x. A bare 'python' is traditionally
> -# python 2.x, but some distros have it as python 3.x, so
> -# we check that too
> +
> +check_py_version() {
> +    # We require python >= 3.6.
> +    # NB: a True python conditional creates a non-zero return code (Failure)
> +    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
> +}
> +
>   python=
> +first_python=
>   explicit_python=no
> -for binary in "${PYTHON-python3}" python
> +# A bare 'python' is traditionally python 2.x, but some distros
> +# have it as python 3.x, so check in both places.
> +for binary in "${PYTHON-python3}" python python3.{11..6}
>   do
>       if has "$binary"
>       then
>           python=$(command -v "$binary")
> -        break
> +        if test -z "$first_python"; then
> +           first_python=$python
> +        fi
> +        if check_py_version "$python"; then
> +            # This one is good.
> +            first_python=
> +            break
> +        fi
>       fi
>   done
>   
> +# If first_python is set, we didn't find a suitable binary.
> +# Use this one for possible future error messages.
> +if test -n "$first_python"; then
> +    python="$first_python"
> +fi

>   # Check for ancillary tools used in testing
>   genisoimage=
> @@ -1037,9 +1056,7 @@ then
>       error_exit "GNU make ($make) not found"
>   fi
>   
> -# Note that if the Python conditional here evaluates True we will exit
> -# with status 1 which is a shell 'false' value.
> -if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
> +if ! check_py_version "$python"; then
>     error_exit "Cannot use '$python', Python >= 3.6 is required." \
>         "Use --python=/path/to/python to specify a supported Python."
>   fi

I like the idea!

Reviewed-by: Thomas Huth <thuth@redhat.com>


