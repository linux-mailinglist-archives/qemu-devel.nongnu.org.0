Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D3625FD3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:51:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otXEW-00056I-FP; Fri, 11 Nov 2022 11:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otXEU-00054Y-6v
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:50:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otXES-0007K6-DZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 11:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668185417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8z6ji12p73IvLpNZLW7mjmxFKDRB+MOqO5Lwvt7+N8=;
 b=Ifr57tALJtKF1l3HJM7P1eUrPeJRz8PaalOT+NsdUWlMiMO3K3zW7HS6Xq+6AK+TGNT5ej
 /LmCFtxGa1clFWSpcl9lFM//9eYZ2rDOVhymw1iAynSkXITUNIfqMS7It8DtzMqAzxdhnq
 oU0550+BpVz7yEsdSHGf411xcrdRQjs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-nUzCCzQMMniXrsOXOVP8gA-1; Fri, 11 Nov 2022 11:50:16 -0500
X-MC-Unique: nUzCCzQMMniXrsOXOVP8gA-1
Received: by mail-qk1-f200.google.com with SMTP id
 w4-20020a05620a444400b006fa24b2f394so5130252qkp.15
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 08:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8z6ji12p73IvLpNZLW7mjmxFKDRB+MOqO5Lwvt7+N8=;
 b=rgrzwoz74IqQG8o4e5CFxw6PdDNQNdWYT01FroWItq5nyCg32YxfKp9WAqGbPkEvcu
 TRILxAtZlHA8n1ws8/sm+2M4jDnh5uTHCjRaJofhgrBkLr9RVy78eWOfF2prs0EduWe4
 RElTvQkgyrK5lD11N9hMVVQ04Jb5do5VSLi/5uPmdGT6sXUI9iLg4feaL36KN8uDWp4j
 VeL+6Kudsy89Hbfxw3Z0Vb+OSczg0+74zdOyPYbkzhVa7ojQtRYylZlE+HJ4O3MrlOyK
 z2zEc2diokZGnBoiGqYomjnWP2m/dYpOz1sHFK5bAzU3/7zi6DrPUcg14cshdiQxsK2u
 meCA==
X-Gm-Message-State: ANoB5pmS3uMLFKDoHwpG5Ui5NDtoveJy3EchrfK/thXXcQUG0ZGFlwPI
 W1QrXQBVzA5F/jNTaiaP1ntKYGeEo5P67Gax7IvwWU21+ouD/6nXu3tMSwBaUVuldto8u+2GfpE
 dNmPDpt4MVxbLBv4=
X-Received: by 2002:a05:620a:16b7:b0:6f8:a0a5:8248 with SMTP id
 s23-20020a05620a16b700b006f8a0a58248mr1797620qkj.287.1668185416173; 
 Fri, 11 Nov 2022 08:50:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5oWesjig6UkO0nNDUes6YK1ieac3r+vysoBFm0IaK/yHqOjYE23MFQg3WMSPiaU2y2ppb9MQ==
X-Received: by 2002:a05:620a:16b7:b0:6f8:a0a5:8248 with SMTP id
 s23-20020a05620a16b700b006f8a0a58248mr1797594qkj.287.1668185415931; 
 Fri, 11 Nov 2022 08:50:15 -0800 (PST)
Received: from [192.168.8.102] (tmo-102-67.customers.d1-online.com.
 [80.187.102.67]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a288300b006eea461177csm1706385qkp.29.2022.11.11.08.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 08:50:15 -0800 (PST)
Message-ID: <f510752c-814c-7b0e-d19b-a8940514a4ac@redhat.com>
Date: Fri, 11 Nov 2022 17:50:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Stefan Weil <sw@weilnetz.de>
References: <20221111145529.4020801-1-alex.bennee@linaro.org>
 <20221111145529.4020801-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 01/12] Run docker probe only if docker or podman are
 available
In-Reply-To: <20221111145529.4020801-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 11/11/2022 15.55, Alex Bennée wrote:
> From: Stefan Weil <sw@weilnetz.de>
> 
> The docker probe uses "sudo -n" which can cause an e-mail with a security warning
> each time when configure is run. Therefore run docker probe only if either docker
> or podman are available.
> 
> That avoids the problematic "sudo -n" on build environments which have neither
> docker nor podman installed.
> 
> Fixes: c4575b59155e2e00 ("configure: store container engine in config-host.mak")
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Message-Id: <20221030083510.310584-1-sw@weilnetz.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 66928692b0..26c7bc5154 100755
> --- a/configure
> +++ b/configure
> @@ -1780,7 +1780,7 @@ fi
>   # functions to probe cross compilers
>   
>   container="no"
> -if test $use_containers = "yes"; then
> +if test $use_containers = "yes" && (has "docker" || has "podman"); then
>       case $($python "$source_path"/tests/docker/docker.py probe) in
>           *docker) container=docker ;;
>           podman) container=podman ;;

Maybe the probe should better be done in the docker.py script instead? ... 
but doing it here likely does not hurt either, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


