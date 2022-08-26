Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E475A3067
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:21:40 +0200 (CEST)
Received: from localhost ([::1]:53090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfpj-0001TY-Jk
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRflg-0006qR-L5
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:17:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfld-0005oN-5u
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661545043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnETN5ZMR5XG8rhaHhMqsWzyW7hJurdgzAmddqI4zvs=;
 b=S9KjUGWVka0OrR1SAFwJTiyBfIG+uc7crsMm4NTWcnc4p+2POKjEa3d5gW8PPWdvQGB+dN
 qVTmeT3ijry8oQvRpPsZo9aCUknEe0dQcw5Z+Vz9qXQhJbqU96c403QwY+XHC6iOdnQjMA
 /X1gyMFaazDIpYy8KaSRnvyrcW4IO10=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-gQ_0_2Z4MDaAh8ssInOU0w-1; Fri, 26 Aug 2022 16:17:22 -0400
X-MC-Unique: gQ_0_2Z4MDaAh8ssInOU0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so4526004wma.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FnETN5ZMR5XG8rhaHhMqsWzyW7hJurdgzAmddqI4zvs=;
 b=HW9LH6PSeiMKlkFWh5kVTagW4o1tTs5RHU2dbXDl7mxm30h+q3NpAPgIGmvhbfIIeH
 u9TggspxZqovvvuh+IqHYlaP0naa+aU9rIXl/oeV2ebsrVSXNc5bX7+y/sagbXe3U3po
 l3i6SyTHYkE6cFXeNZQBTCTcxLMRx20McDTUvPLUGXxi2w/b0so2GFZQ2BOk0QfVP2/0
 40uubQ9v0taphnHruFDipnsU18KQxU/NGzSD0QNz23SP4hf5I6Tbt7zStU1TtHEQWs1b
 P2J0qQ2LVFXjz78t3u3dWpPDqZWIQroFayX1SuGuliV5NYZE5Y37BLUdI8EDvVWMeCXc
 coHg==
X-Gm-Message-State: ACgBeo30R3RBdrwJ2dZZEcPyGpRBw69T2Kuy3W0arAdk+lxFTzy+F+8S
 7GbCL9uPHL6D4B0NWvM8pXebrRmHdkNE/9McEkDTMJPTvL9rxHYSW1L/ptbNbqJAwVYhhP2Sua1
 ByhULqUTsw/CvoDM=
X-Received: by 2002:adf:d217:0:b0:225:259e:19e1 with SMTP id
 j23-20020adfd217000000b00225259e19e1mr692012wrh.370.1661545041017; 
 Fri, 26 Aug 2022 13:17:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OAfM8fkOXFCqFhjrn7Sp2quO14K5BKcF7CZYt7g1tJA4dHwm2sv+sxsHf8Ii3YO/RmkdDNQ==
X-Received: by 2002:adf:d217:0:b0:225:259e:19e1 with SMTP id
 j23-20020adfd217000000b00225259e19e1mr691995wrh.370.1661545040841; 
 Fri, 26 Aug 2022 13:17:20 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 a11-20020adfed0b000000b002206236ab3dsm651135wro.3.2022.08.26.13.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:17:20 -0700 (PDT)
Message-ID: <b07fd97b-50be-e44d-7425-8ca35afb5968@redhat.com>
Date: Fri, 26 Aug 2022 22:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 10/25] tests/docker: remove tricore qemu/debian10
 dependency
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Fixes: 39ce923732 (gitlab: enable a very minimal build with the tricore container)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml | 1 -
>   tests/docker/Makefile.include    | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
> index 67bbf19a27..611c6c0b39 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -148,7 +148,6 @@ sparc64-debian-cross-container:
>   tricore-debian-cross-container:
>     extends: .container_job_template
>     stage: containers
> -  needs: ['amd64-debian10-container']
>     variables:
>       NAME: debian-tricore-cross
>   
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index e034eca3af..5c9398bbc9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -132,7 +132,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
>   	$(call debian-toolchain, $@)
>   
>   # Specialist build images, sometimes very limited tools
> -docker-image-debian-tricore-cross: docker-image-debian10
>   docker-image-debian-all-test-cross: docker-image-debian10
>   docker-image-debian-loongarch-cross: docker-image-debian11
>   docker-image-debian-microblaze-cross: docker-image-debian10

Fixes: 39ce923732 ("gitlab: enable a very minimal build with the tricore 
container")

Could this be updated to Bullseye, too?

  Thomas


