Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD3A5A3072
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:28:29 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfwJ-0005T7-L4
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfuN-00037z-0b
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfuJ-0007Fs-LP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661545582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoD5KCu5aC3SI+m97Uk0gkSzxs59yPxDQUuA33eiesY=;
 b=V+xEAwl5etpibpwfM8MntUNgWQVlmxrUAeRQw1YxzcgV2VucU0+etqQ6sb3DUMOwc8lyI6
 adVMcm7U/JeNwvxwvvA8NKMF/+dcXXY+/in/akUEbrsJ4lLsqW7NctJERr3cntcNjsw1KI
 OfeyzL8vuaDM40kmI3D1qfDKcpjp8VA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-Kl39-27RP5OkqGDU7RAyAg-1; Fri, 26 Aug 2022 16:26:21 -0400
X-MC-Unique: Kl39-27RP5OkqGDU7RAyAg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l25-20020adfa399000000b002252058bad2so347106wrb.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BoD5KCu5aC3SI+m97Uk0gkSzxs59yPxDQUuA33eiesY=;
 b=qBmkKaoNA1DRtvAVmBX8NWssTlTWtrKVc2tkbSn27ni4TVSv4ObjUq5AuSINdjkKok
 Ngtgk1orDdMf3k1Ln7wpBu5bvowyNvpgSh4iLSTLvbyLnwf6DVEbqSqGPqLPXXJ+ieUy
 Iw/s+vBfhiZysgIfHUi46H/1kDJn9NOMRpbSDFe7E/KOulZ90Nh98+Bp7mj8l9x6kK0U
 wUNxtUJ+eJlL2hh6iZQZhst3asYzSQKCSWjPiu9VYGmJ9CJdeRs9Tifu6LipyKPpyaPk
 PunqXCk0yM61GOZKnoR5a7Nd0eipAMaHELwmVKPcxdHF1YQdY002okLsIU7RXbJomcYy
 Nvsg==
X-Gm-Message-State: ACgBeo1lzXDdDmn0IQCwdmoc4HRmvIhlRRqjIgLV8diX6U5F0vD1dmwB
 u8ruB748H0fuOsg1t3LkQelVeYljRx05x+U2KpKNoUGQOqifwvm1vDsCMkiPlEAVjbQgVkd+Ao5
 I8WVeYm08kD5AdWo=
X-Received: by 2002:a7b:ce10:0:b0:3a5:3f91:e2fb with SMTP id
 m16-20020a7bce10000000b003a53f91e2fbmr725496wmc.138.1661545579850; 
 Fri, 26 Aug 2022 13:26:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4khEncLfm2RISBxB9TCZpJLoNdUhTsRWb3Ee62saPlduJ7w0gIOvYhty6/0QYHRIT0zMXAGA==
X-Received: by 2002:a7b:ce10:0:b0:3a5:3f91:e2fb with SMTP id
 m16-20020a7bce10000000b003a53f91e2fbmr725482wmc.138.1661545579669; 
 Fri, 26 Aug 2022 13:26:19 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 v14-20020a5d43ce000000b00226d1b81b45sm68444wrr.27.2022.08.26.13.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:26:19 -0700 (PDT)
Message-ID: <1c34e1b4-118a-29f1-d3c3-b62343d136f3@redhat.com>
Date: Fri, 26 Aug 2022 22:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 11/25] tests/docker: remove amd64 qemu/debian10
 dependency
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 26/08/2022 19.21, Alex Bennée wrote:
> We missed removing this dependency when we flattened the build.
> 
> Fixes 9e19fd7d4a (tests/docker: update debian-amd64 with lcitool)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 5c9398bbc9..c3375f89c5 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -73,7 +73,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
>   # we don't run tests on intermediate images (used as base by another image)
>   DOCKER_PARTIAL_IMAGES := debian10 debian11
>   ifeq ($(HOST_ARCH),x86_64)
> -docker-image-debian-amd64: docker-image-debian10
>   DOCKER_PARTIAL_IMAGES += debian-amd64-cross
>   else
>   docker-image-debian-amd64-cross: docker-image-debian10

What about the "DOCKER_PARTIAL_IMAGES += debian-amd64" that comes later in 
this file? Do we still need that line?

  Thomas


