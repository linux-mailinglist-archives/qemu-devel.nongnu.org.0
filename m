Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8155A0C0F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:59:03 +0200 (CEST)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8ha-0004Nn-Dg
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR84D-0003w9-CK
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR84A-0005yq-Dl
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661415497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dytsvTi6rY2/6bv+VIsjB3/r/O2SpklFImx5cgy+Y/g=;
 b=K2TJKs3n1pPxrsdxcFOOUjJVOpGyDXk6xty6+SP1U23Ocyw+tt0LxEGQYRshWCqFMxlzZ+
 Q1dRB4R4AGBXGEHtgSEDbtznZbYLJqqwpmA3giCjMYE9/sq7IgfWmYdb7QjuaHkHqlA3jn
 v27v0j8Ln9f0Fy6Jml6nH1sCpv6vXyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-wLWtiAqwMEGD76cw1wUTOQ-1; Thu, 25 Aug 2022 04:18:12 -0400
X-MC-Unique: wLWtiAqwMEGD76cw1wUTOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so10607377wma.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 01:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=dytsvTi6rY2/6bv+VIsjB3/r/O2SpklFImx5cgy+Y/g=;
 b=w4ZbQXf84Xi7GOsYwasIZDwEQUt0Tmn0oeEU7QCmavJZPhe+mS3kZnL3eKg/UibtQr
 KnpWF30EF/8oiYTTbYmRbAOBbjSphzHGVO5jd3cULGJrgAAFTsgtLEeXhupMtXSiiVAN
 m2dbg2/YwM5yI2j51Yl/LX9kqDLscsQKABEFc8bLUtXONa7D2HxZ9DmVk4zchaPLzBqq
 N2t2FxGeiNckW10nGJB3MoiPelz1K3i7eg27yEiPECK2tu7hkiI0sTau2k1dXMdTVqca
 F//UzHHyzGaxFIDtltfKudzfEqTFGriPhO9XcjfhSwB9ow58A1fB5lPYDOODAD8Jnhga
 X5Xw==
X-Gm-Message-State: ACgBeo0d+Db00xEsNFJzpUiPL8j/51l+UjRqcBm6hSTKYu2OlvXZ3JgN
 kNhaMPUnmE5xDua7tFGmcobyvhr/Sk5+nWSzhVWlpapmR1xkhVziNFk1yadmf9r+7PCqYiLJ6qf
 V2JpcDcMAXEquLZ0=
X-Received: by 2002:a05:6000:1549:b0:225:652e:45d4 with SMTP id
 9-20020a056000154900b00225652e45d4mr1537861wry.15.1661415488090; 
 Thu, 25 Aug 2022 01:18:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44Y64u9bFIddQ5nCmI76QiqX3js9n/YchODcHib/6i5SSFZcdlShmT3eUYuShAdzwT8um/eg==
X-Received: by 2002:a05:6000:1549:b0:225:652e:45d4 with SMTP id
 9-20020a056000154900b00225652e45d4mr1537842wry.15.1661415487807; 
 Thu, 25 Aug 2022 01:18:07 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 c191-20020a1c35c8000000b003a2cf1ba9e2sm4465070wma.6.2022.08.25.01.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:18:07 -0700 (PDT)
Message-ID: <c04114e2-f7ba-c985-f4ff-955b0f82e716@redhat.com>
Date: Thu, 25 Aug 2022 10:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 50/51] .gitlab-ci.d/windows.yml: Increase the timeout to
 the runner limit
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-51-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-51-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 24/08/2022 11.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> changed to compile QEMU with the --without-default-devices switch for
> the msys2-64bit job, due to the build could not complete within the
> project timeout (1h), and also mentioned that a bigger timeout was
> getting ignored on the shared Gitlab-CI Windows runners.
> 
> However as of today it seems the shared Gitlab-CI Windows runners does
> honor the job timeout, and the runner has the timeout limit of 2h, so
> let's increase the timeout to the runner limit and drop the configure
> switch "--without-default-devices" to get a larger build coverage.
> 
> As a result of this, the check-qtest starts running on Windows in CI.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .gitlab-ci.d/windows.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index c4bde758be..d4fd821b5f 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>         - ${CI_PROJECT_DIR}/msys64/var/cache
>     needs: []
>     stage: build
> -  timeout: 70m
> +  timeout: 2h

IMHO 2 hours are too long ... we're normally trying to limit the time of 
each job to 1h only and only extend it a little bit if we cannot really 
make, but we should not double the amount of time here. The highest timeout 
that we currently have are 90 minutes ... would that still be OK for this 
job, too? If so, please use 90 minutes here. Otherwise, it might still be 
necessary to cut down this job here and there a little bit...
(maybe the tests now also work a little bit faster now that the migration 
test has been speed up in 7.1-rc4 ?)

  Thomas


