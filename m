Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B994E66247A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:43:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqY6-0008UQ-JD; Mon, 09 Jan 2023 06:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEqY2-0008QL-7m
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEqY0-00021T-QS
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673264556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3FaMVk5b/TYXRBc1IkiFUyLIBCBB32V1L721cL9j3g=;
 b=eVjG93Zywswpi7zA38hPWMJkhqXbH4Iy35GrYOewQG7LhwAqUJS1lmx2ep1CQjI2to/KSz
 1THO3w6FP6xk7wAxGKJj9Hhsvt8j/ZRBm/b8OA4krpeZs2dyRfceaNQ7igBZHgDdiL/dI9
 XB9bIWKWNJMZGTcoeyE4Z+t5/mdjXxQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-MlkwRVndNiyRI69RGaik3g-1; Mon, 09 Jan 2023 06:42:34 -0500
X-MC-Unique: MlkwRVndNiyRI69RGaik3g-1
Received: by mail-qk1-f199.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so6312373qkl.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3FaMVk5b/TYXRBc1IkiFUyLIBCBB32V1L721cL9j3g=;
 b=w/1QNlkHv0GNlWjRF3obagA/jKPtm8iTsor4r1qWVdVgmmrznWFp9d65p0UZaYQCq9
 2lF8gGtzk8GeQeAFJruBiu9cnqtQ4pkVeNs4r4yglXGFO/aQQHYcP0PhsMDUVW1JtYeH
 PUmjsMlOw7Dt6J8/yd22FQbx0myuXcEN1Y2QJ1b06/2LYXKx/zhrzzTera4y4Ser9efI
 ivefZjF765aFF1TM1YIlbLrfLpYKsm/JetTXrX2h3AI+4nYgHWqUnjD8Jaex33tqp7OO
 KbHI31bcKEdZVQlRPuSPZRlTs/wUZZlA+Ycv9i0icjnQ0XgxzB8DnBfCw99BUH4k7z9W
 /qdQ==
X-Gm-Message-State: AFqh2krHealigTQD1+EeCArUP4uAq9tQ4HipN9G5h+AWzuEZ7aowPij9
 dlheGJ1FNUZglksUBukXLUIAtbeeVDURnemb8ZclHpdHlvprPbgGzW6EyXJwOx08bY6hdzVcMlc
 A2S09U8WWitaaVRE=
X-Received: by 2002:a05:622a:1aa5:b0:3ad:202f:8797 with SMTP id
 s37-20020a05622a1aa500b003ad202f8797mr6603117qtc.9.1673264554510; 
 Mon, 09 Jan 2023 03:42:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtqJt/3nNXIhu7fDwiu4ap4FkE/plD/hm5ntHR0Cd9bpFHnAIGyuqH/O3yFdwwVwSMVsFtbhA==
X-Received: by 2002:a05:622a:1aa5:b0:3ad:202f:8797 with SMTP id
 s37-20020a05622a1aa500b003ad202f8797mr6603094qtc.9.1673264554276; 
 Mon, 09 Jan 2023 03:42:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-179-204.web.vodafone.de.
 [109.43.179.204]) by smtp.gmail.com with ESMTPSA id
 19-20020a05620a071300b006f474e6a715sm5093980qkc.131.2023.01.09.03.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 03:42:33 -0800 (PST)
Message-ID: <85c9ea58-a261-e629-de71-48fdb3ba1ea4@redhat.com>
Date: Mon, 9 Jan 2023 12:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] .gitlab-ci.d/windows: do not disable opengl
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, pbonzini@redhat.com,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230109112110.128967-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/01/2023 12.21, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The previous patch should fix shader compilation.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   .gitlab-ci.d/windows.yml | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 22f794e537..5e59a7cc96 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -71,7 +71,7 @@ msys2-64bit:
>     # for the msys2 64-bit job, due to the build could not complete within
>     # the project timeout.
>     - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
> -      --without-default-devices --disable-opengl'
> +      --without-default-devices'
>     - ..\msys64\usr\bin\bash -lc 'make'
>     # qTests don't run successfully with "--without-default-devices",
>     # so let's exclude the qtests from CI for now.
> @@ -113,7 +113,6 @@ msys2-32bit:
>     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
>     - mkdir output
>     - cd output
> -  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
> -        --disable-opengl'
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
>     - ..\msys64\usr\bin\bash -lc 'make'
>     - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'

Reviewed-by: Thomas Huth <thuth@redhat.com>


