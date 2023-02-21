Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14769DE66
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:04:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQR7-0005Tf-42; Tue, 21 Feb 2023 06:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQR5-0005TU-A4
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQR3-00060E-NF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676977428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmH9fjc+TVpyZ7heCaZBbr2wTKXfWcIssCu2tEDRATU=;
 b=EppR9FVnt4xhow+82U+6QI6yD9BEpx1UfZgjEVLLzfjsqMfwRSLFYLvj6Xqk6XxF1up0hr
 FTSsM9ctd4y0VN/r/P96PXAscMjI1wSlUX20UZoXWF3qb9UnU5MCzIGvIpgo6nyAY+PPd/
 0KFlHvkpJy1NfDRd7tnCAjcmMowDrEE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-wRcb_YuJNqqBQcAZlHOu4A-1; Tue, 21 Feb 2023 06:03:47 -0500
X-MC-Unique: wRcb_YuJNqqBQcAZlHOu4A-1
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so5586396edh.14
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HmH9fjc+TVpyZ7heCaZBbr2wTKXfWcIssCu2tEDRATU=;
 b=JeoZgSFOdZnbivSuf2cCvS4oASki2A0OPSMKwEXWXc6I3PapurvW1aslgryJHzzcaN
 1PvnCq9AOlhc/Qrxj+zmkJ5QUSjbT2uOZMCg1h5zfH+rtJg456JHJqW77I8jjqcAfNRc
 TmiYYw1gxwsp/dcztFuEp7m5wlTnq8abtWo4aVvEEr4C6VkFjIPcfFV8680FAFmr4VZ/
 i5WkyXKOyqveoDC6RThIscZWBXJd0jUpFDNPYketfdNiHOXf+09FJyfcmLpz3x/okx2a
 Oael3vqug8AU9A6/oage48tPlS2nED7ZqHAD9/uVDE5x7FcegOdvARNZrBmKmZGYlnBM
 lz8A==
X-Gm-Message-State: AO0yUKUvXUhVrMCMSQtmBpRZtW+deSAHDxqeWVbU7CGo2g6Sg1cM5LsR
 PezbVS5PmaU/DtX8h1eOH2G/ZLYKJ1tap9nO0Q7zj4C2bnZdOo6EgQTB0bvpBGOvhVm84sVSVbO
 xZxXFRxRlq2ybxcY=
X-Received: by 2002:a17:906:a396:b0:8b1:7e1a:ef22 with SMTP id
 k22-20020a170906a39600b008b17e1aef22mr13493924ejz.45.1676977426181; 
 Tue, 21 Feb 2023 03:03:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9sL4ngS8wdz8VEzmmwANYZ2p8Gm+G/FaNsdZzRGC5U0wMuYrrYhMrKk0KA1nOyDnhPaPmCFg==
X-Received: by 2002:a17:906:a396:b0:8b1:7e1a:ef22 with SMTP id
 k22-20020a170906a39600b008b17e1aef22mr13493914ejz.45.1676977425871; 
 Tue, 21 Feb 2023 03:03:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 gj18-20020a170906e11200b008d47cd2edfbsm2364789ejb.60.2023.02.21.03.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:03:45 -0800 (PST)
Message-ID: <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
Date: Tue, 21 Feb 2023 12:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/6] configure: Look for auxiliary Python installations
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-2-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221012456.2607692-2-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/21/23 02:24, John Snow wrote:
> At the moment, we look for just "python3" and "python", which is good
> enough almost all of the time. But ... if you are on a platform that
> uses an older Python by default and only offers a newer Python as an
> option, you'll have to specify --python=/usr/bin/foo every time.
> 
> As a courtesy, we can make a cursory attempt to locate a suitable Python
> binary ourselves, looking for the remaining well-known binaries. This
> also has the added benefit of making configure "just work" more often
> on various BSD distributions that do not have the concept of a
> "platform default python".
> 
> This configure loop will prefer, in order:
> 
> 1. Whatever is specified in $PYTHON
> 2. python3
> 3. python (Which is usually 2.x, but might be 3.x on some platforms.)
> 4. python3.11 down through python3.6
> 
> Notes:
> 
> - Python virtual environments provide binaries for "python3", "python",
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
>   configure | 34 ++++++++++++++++++++++++++--------
>   1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index cf6db3d5518..6abf5a72078 100755
> --- a/configure
> +++ b/configure
> @@ -592,20 +592,40 @@ esac
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
> +# Check for $PYTHON, python3, python, then explicitly-versioned interpreters.
> +for binary in "${PYTHON-python3}" ${PYTHON:+python3} python \
> +                                  python3.11 python3.10 python3.9 \
> +                                  python3.8 python3.7 python3.6

I think if PYTHON is set we shouldn't look at anything else.

Paolo

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
>   
>   # Check for ancillary tools used in testing
>   genisoimage=
> @@ -1037,9 +1057,7 @@ then
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


