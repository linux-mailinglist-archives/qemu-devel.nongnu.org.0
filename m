Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D7691D24
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 11:47:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQQv1-0001r1-2x; Fri, 10 Feb 2023 05:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQQuw-0001pB-II
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQQur-0001Lh-Mv
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 05:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676025965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4etviLD1fWGyLk5zx8zBi1X/ROwY1fOCC4dI5t9A2A=;
 b=B+ZskwCg5DkKPK4w8L5sKhTSeejX9BJHdTdv4MaGnFs3MhQfQinHALE/+PiyXaK0o4VssR
 uMyxey/aunfWWvcnpS82kqtQjvY+/p4nYLVQPEKgdNDmbetIsKpR8VYAzfsCwvocDz9Tjd
 eSPtv6oV9S+3lNoqewvCRJFIKKqqrdE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-6eLj9J0JO6ueOYhme-G6ZQ-1; Fri, 10 Feb 2023 05:46:03 -0500
X-MC-Unique: 6eLj9J0JO6ueOYhme-G6ZQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 21-20020a170906225500b0088b953a6df6so3399432ejr.20
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 02:46:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v4etviLD1fWGyLk5zx8zBi1X/ROwY1fOCC4dI5t9A2A=;
 b=Gp9I27AoKnav3aQUfNBLCOXF27A9aUEHnnyxWfBfSjIFjRmxDIRqC+Gl5Qj+LS6pE+
 6GzptlUFcvg2/8ujhMiT9suT6p2/kuUMckT3NE60EwUOripuGU4SettlZjJnh6g+XazM
 ZAmJ1uTbI7R4FGJL6ej3kQN3FnIo/g27mklcs2+3aweH3JZUVVDMEeNGSVc33uKHTjZS
 lZaQ2U36S8RBENiqE+Kteiny9Fzp7SpWHTPTSadVpApMVESzjuox26mJM9zeBP9pqVIj
 Mhk9VsvXcINV5mBcRsSgJ8j6pvtdR88RHP/owDdAM43e6hmiHT3g3hnDCgA9sIvEGED7
 cgvg==
X-Gm-Message-State: AO0yUKUaRtrVKFzZ2y3Nn0+F4CAaA50Xp0y68gT6EeNcLe2Hur/uD+kH
 Pue7661Ih9CveSV5iignWF0gj+vSkGKaA8XYSG5QbxPSGjR1wTcJEE3lDBNLkM5tcUjaisWTzSD
 gkyqBDvLf1S4Jm2Q=
X-Received: by 2002:a17:907:c586:b0:8af:4418:8700 with SMTP id
 tr6-20020a170907c58600b008af44188700mr4476203ejc.47.1676025962338; 
 Fri, 10 Feb 2023 02:46:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9Oxg1/Ws6+Tu7si6JAf9hibqbVtgibFPbyqi40IjbWLbyklea+VQa7Thpl1D2XTXsd/0CcMQ==
X-Received: by 2002:a17:907:c586:b0:8af:4418:8700 with SMTP id
 tr6-20020a170907c58600b008af44188700mr4476185ejc.47.1676025962137; 
 Fri, 10 Feb 2023 02:46:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a17090674cc00b008aac25d8f7fsm2246234ejl.97.2023.02.10.02.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 02:46:01 -0800 (PST)
Message-ID: <3bb14d43-4dbe-62f3-679f-4b7823b29d41@redhat.com>
Date: Fri, 10 Feb 2023 11:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 3/7] configure: Look for auxiliary Python installations
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-4-jsnow@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230210003147.1309376-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/10/23 01:31, John Snow wrote:
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

This is not available in e.g. dash, so we need to use {11,10,9,8,7,6}.
Just a nit, I can fix it myself.

Paolo


