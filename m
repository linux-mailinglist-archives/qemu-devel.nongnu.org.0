Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB8C6A3D6C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZC2-0000gm-2D; Mon, 27 Feb 2023 03:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZBz-0000gA-Op
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZBy-0007fF-Ar
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677487740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZrUbL2/W00N28CAtosn7/KjD1UIRImQD+Z/FcTgo8c=;
 b=hMc3eZoyvggRq5ZgXdMGfOKb9KlGIokelZgckal51xKVOwAB8e66DgeCB/fOQ9CVKyUcnV
 LSRsqnZ3nnwRzub/NL4v54l0ZXz5JThg5txICeHrIBqfnCMhp/6JDzklI5gNVOR5HPm2w8
 0bavWHLCvtjPkeGGP0F5qS4uAevZpI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141--6jipumyOmiWplBcrWkIWg-1; Mon, 27 Feb 2023 03:48:58 -0500
X-MC-Unique: -6jipumyOmiWplBcrWkIWg-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020a5d47a4000000b002c5699ff08aso609515wrb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IZrUbL2/W00N28CAtosn7/KjD1UIRImQD+Z/FcTgo8c=;
 b=JeNz6Azap4dRQU1e9ineB1KLF4NmDaCJ8J9HZ3dQTkMHKY9IBf7RXCY+fMPWkBoFEg
 52Crg4A08drP5jPGToC8uNGxfxb3Teh7AGoYqC+Qs+Wb5ohZ7sc1mYB00IHm5O+zAFht
 //SjNtPKHUXNjaLYUVacUxpVnh0QhS/2bQAo2S5KEYwNihPCkYnAyBgXg3OetrTMsIBS
 esrdo5+enxDiiJdLGx9XcF/SiopDOHsd3gmBYfLf5vKIvA44TIlj/Coe4h32Gb0Gyt81
 mGNP9Pc+mWABvHiBIdBrWFTNREhmuWmbeGWFlGKnaaNtjZqpHHb0DAW5up5xlIME3hh4
 QQ6w==
X-Gm-Message-State: AO0yUKVwPtzs8XKH6fnJDeyAsCVLTFHX9+Sp4dANnA/0u5fhR4tiDycJ
 jC+oIbaeUXboB9OsxKqpP9oHHW3Yc83SKPj8n6RtVAPHetMWWTicsa8W3AUd1Sk2k1tLamXPOUT
 eJvS5IysSknumCYs=
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr20931253wrs.6.1677487737747; 
 Mon, 27 Feb 2023 00:48:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+GOuc6XqfMA7bmS+WrJRKq8cCQ86YqwPA/d6ckKhN1Q2ppUWL1lppu/wcX3J1f3KELZUq77g==
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr20931235wrs.6.1677487737437; 
 Mon, 27 Feb 2023 00:48:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm6466669wrm.11.2023.02.27.00.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:48:56 -0800 (PST)
Message-ID: <69d38817-8363-58eb-83dc-a1c7db5d4f8a@redhat.com>
Date: Mon, 27 Feb 2023 09:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] gitlab/opensbi: Move to docker:stable
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20230224212543.20462-1-palmer@rivosinc.com>
 <20230224212543.20462-2-palmer@rivosinc.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230224212543.20462-2-palmer@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/02/2023 22.25, Palmer Dabbelt wrote:
> The OpenSBI build has been using docker:19.03.1, which appears to be old
> enough that v2 of the manifest is no longer supported.  Something has
> started serving us those manifests, resulting in errors along the lines
> of
> 
>      $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
>      Step 1/7 : FROM ubuntu:18.04
>      18.04: Pulling from library/ubuntu
>      mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'
> 
> This just moves to docker:stable, as was suggested by the template.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   .gitlab-ci.d/opensbi.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index 04ed5a3ea1..9a651465d8 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -42,9 +42,9 @@
>   docker-opensbi:
>     extends: .opensbi_job_rules
>     stage: containers
> -  image: docker:19.03.1
> +  image: docker:stable
>     services:
> -    - docker:19.03.1-dind
> +    - docker:stable-dind
>     variables:
>       GIT_DEPTH: 3
>       IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build

Reviewed-by: Thomas Huth <thuth@redhat.com>


