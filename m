Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39D67AB26
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 08:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKaT0-0004xH-HC; Wed, 25 Jan 2023 02:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKaSy-0004wy-MA
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKaSw-0003yH-7j
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 02:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674632704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZXrEOZNrjD0LfHadt43o6PEtuIH7GBerz/Kzc4W35w=;
 b=HkwNUkEVVLLaRIr95uYNyy6Nj8l7U0CLOGQJDDAM1ZWQctNGYgv+eysEMf82kSc9g9XxzL
 DpIo4rnhbPV40ig6Ld6wPat/TDPWZm3K5HLw2leDaDWKAMdxlnuXDAa4M+LJV/57ihhBHI
 rlCz5MezjfFqiMAGSrBD60/PXTyRYpI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-322-MPzHdt8mNW-kYEwNDUwMaA-1; Wed, 25 Jan 2023 02:45:03 -0500
X-MC-Unique: MPzHdt8mNW-kYEwNDUwMaA-1
Received: by mail-qv1-f69.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso8853996qvu.12
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 23:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NZXrEOZNrjD0LfHadt43o6PEtuIH7GBerz/Kzc4W35w=;
 b=cZFV1LrLMr6r3Pi7j/SaCVC+BZIf4MpPlGemzmAv1qIHb6zca4HThSvPFcGhdV36iR
 hZb9Jf3tFQrund/+Dtl8n6aUe9BPSnBj63qim1nBo8lWFjCTxa9DVidvFc2/DuUceL9J
 lb3wHAZvpHYVKv50yWuluezA/ZEcSsj7lFJ+E0ESSUjYNE10ly6b+fbIy4g2y5k46oDF
 pX0GsurEmSD/Hb+jqvvA5VSNjpVYYkJ1ALQr1So/plMX/msLU8K/zkogTiJhjDZ3i0E+
 kgYPsaz1bYcm+1ed1dnPGc1pcy4s5UDrEJ8nnjS8troiHKR5/JU1uxHInB7WAFpwpQrL
 OM9w==
X-Gm-Message-State: AO0yUKXwQ0yCFZVdFnCiDoemiattmuf3gOBdHkn4kYGnpd3J4Hk0Ju4X
 NgUJ1WgLkSuLyIc9NFSTW3LASYIwT0kniWz0W6FcxT7kByfTsEwEgdVSWcuO9QOBL3r+Ct42e3c
 dAj4yd+NKDyZ3jac=
X-Received: by 2002:a05:622a:14e:b0:3b4:d5be:a2e0 with SMTP id
 v14-20020a05622a014e00b003b4d5bea2e0mr2721072qtw.20.1674632702460; 
 Tue, 24 Jan 2023 23:45:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+zJQTfuRWSRMwGumeAY4IPDpYeucYbxNsOvsjpzbtYYg7OTWLiQEIiFUJsWKHZr8PDx8+CRg==
X-Received: by 2002:a05:622a:14e:b0:3b4:d5be:a2e0 with SMTP id
 v14-20020a05622a014e00b003b4d5bea2e0mr2721029qtw.20.1674632702190; 
 Tue, 24 Jan 2023 23:45:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 y18-20020ac87092000000b003ad373d04b6sm2830638qto.59.2023.01.24.23.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 23:45:01 -0800 (PST)
Message-ID: <92d370f1-a06b-75e9-469b-944674d53c79@redhat.com>
Date: Wed, 25 Jan 2023 08:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 09/35] gitlab: add lsan suppression file to workaround
 tcmalloc issues
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230124180127.1881110-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 24/01/2023 19.01, Alex Bennée wrote:
> The up-coming upgrade to Fedora 37 will bring in libtcmalloc as a
> dependency of libglusterfs which confuses our fuzz run. Rather than
> disable the build lets use LSAN's suppression mechanism to prevent the
> job from failing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml             | 1 +
>   scripts/oss-fuzz/lsan_suppressions.txt | 2 ++
>   2 files changed, 3 insertions(+)
>   create mode 100644 scripts/oss-fuzz/lsan_suppressions.txt
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index f09a898c3e..9a6ba1fe3b 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -511,6 +511,7 @@ build-oss-fuzz:
>       IMAGE: fedora
>     script:
>       - mkdir build-oss-fuzz
> +    - export LSAN_OPTIONS=suppressions=scripts/oss-fuzz/lsan_suppressions.txt
>       - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
>         ./scripts/oss-fuzz/build.sh
>       - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
> diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
> new file mode 100644
> index 0000000000..02ec0a6ed5
> --- /dev/null
> +++ b/scripts/oss-fuzz/lsan_suppressions.txt
> @@ -0,0 +1,2 @@
> +# The tcmalloc on Fedora37 confuses things
> +leak:/lib64/libtcmalloc_minimal.so.4

Reviewed-by: Thomas Huth <thuth@redhat.com>


