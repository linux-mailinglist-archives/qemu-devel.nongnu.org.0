Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F35EF45E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 13:33:34 +0200 (CEST)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odrnJ-0001Jm-AG
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 07:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odrNB-0001gP-Qa
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odrN9-0002AX-CG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664449590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZ3jOq6vHhppFCtO94pdjVJ5r95/p708zVoXWbWF0Bw=;
 b=SX1jkLgpW6UdRYrG3vETDacTQpX4Zq/SglANA9K5KGYgII3vGmxc1DKhZmi/B2ToTXC3CC
 itoS5Qc3G1NokTVaNtiD1L2dYKMfgpXF7z3DHxtz4Kak3TQjpdlVi9cgJlsoPGillSOPDw
 wQ5JE30SGTJBHh0S1+Y420Un/udMWbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-OuRrPu6YMQaeYkA7InRGxg-1; Thu, 29 Sep 2022 07:06:29 -0400
X-MC-Unique: OuRrPu6YMQaeYkA7InRGxg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v22-20020adf8b56000000b0022af189148bso387206wra.22
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gZ3jOq6vHhppFCtO94pdjVJ5r95/p708zVoXWbWF0Bw=;
 b=omUVWkZl9TPPavJEA9YwlRoucvF8NnJqdSCWD4YGIoLV1aGE9HF7nW/eSHYUeNshYi
 wBRUeI8N3OUJCfpT1ydG/SAnYgEPsG6QlrFhoEtQfV26lZC6U9apeSN0ERsEmgcrfyv9
 fJOXIX6VJdz9xrXDZGeWxvT8QDtoW6MeIugHQiXyMHJfx8F9zTsQkHhwEXnGoXYVC/Hf
 XKTNdr6rJziRCP5EpeuAkPjNHJqWFn2d7zc2GstWGjbhuC+WjYl+G18Sdwcqs3TYWbXQ
 CsvI8+ruQtiSnobzDbENS9EAWEFblZXAgf+i17X4/dyF7KkbWsJ4YquVTCN/TQMnY5rV
 zw6A==
X-Gm-Message-State: ACrzQf3gDzeVt4ZJ/6JmvSPR7nXXsWSW3A4Mk98r2OkqazEOM+YjPbDS
 mkGGOoWbjXCs7Ym/Umk+plt0W+ZnVtOoeFqs9opSawTw834yPfrZNsW8/YRJ4+bYRyIZxH0E8AJ
 0IzH+QV16nZ6OiyQ=
X-Received: by 2002:adf:d4cd:0:b0:22c:dc00:7f99 with SMTP id
 w13-20020adfd4cd000000b0022cdc007f99mr402427wrk.260.1664449588289; 
 Thu, 29 Sep 2022 04:06:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6muIw7TCQxICw+hM9HbHlLLBS3TPnYNpvFpr/h9edPYmJTHidSLHz9kmA+AWrMnVOR9NYzIQ==
X-Received: by 2002:adf:d4cd:0:b0:22c:dc00:7f99 with SMTP id
 w13-20020adfd4cd000000b0022cdc007f99mr402404wrk.260.1664449588046; 
 Thu, 29 Sep 2022 04:06:28 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c020700b003b492753826sm3999102wmi.43.2022.09.29.04.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 04:06:27 -0700 (PDT)
Message-ID: <e3c254d1-ee06-4b05-6521-2bf94dd2e22e@redhat.com>
Date: Thu, 29 Sep 2022 13:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH] tests/docker: move alpine from edge to tagged release
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: berrange@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220929105548.542555-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929105548.542555-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/09/2022 12.55, Alex Bennée wrote:
> Tracking alpine-edge like debian-sid is a moving target. Usually such
> rolling releases are marked as "allow_failure: true" in our CI.
> However as alpine presents a musl based and provides useful extra

"a musl based distro" ?

> coverage lets track a release branch instead to avoid random
> breakages.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker | 4 ++--
>   tests/lcitool/refresh                  | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 7d6e95275a..9b7541261a 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -1,10 +1,10 @@
>   # THIS FILE WAS AUTO-GENERATED
>   #
> -#  $ lcitool dockerfile --layers all alpine-edge qemu
> +#  $ lcitool dockerfile --layers all alpine-316 qemu
>   #
>   # https://gitlab.com/libvirt/libvirt-ci
>   
> -FROM docker.io/library/alpine:edge
> +FROM docker.io/library/alpine:3.16
>   
>   RUN apk update && \
>       apk upgrade && \
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 783497a989..ce0b24c0b1 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -107,7 +107,7 @@ try:
>       #
>       # Standard native builds
>       #
> -    generate_dockerfile("alpine", "alpine-edge")
> +    generate_dockerfile("alpine", "alpine-316")
>       generate_dockerfile("centos8", "centos-stream-8")
>       generate_dockerfile("debian-amd64", "debian-11",
>                           trailer="".join(debian11_extras))

Sounds like a good idea.

Reviewed-by: Thomas Huth <thuth@redhat.com>


