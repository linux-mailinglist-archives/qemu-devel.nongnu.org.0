Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3772CC012
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:50:27 +0100 (CET)
Received: from localhost ([::1]:43436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTSc-0006Hz-7f
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkTRP-0005oB-6g
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkTRM-0006oe-OP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606920546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUacJ8VMkP86PHYUob+f27Mt1oVDOzOiMh9LURb8yso=;
 b=Lw+qcc22cCK/lhj4i1ZuG07YExEqa6JpV/rHPn1dZjqqL66Roeigl0P/G+ywLfF6hEwUof
 N9Q5JUNfiQ5cKBqbAlcVfjbvBFotbCo4ZzvgonLi+AbTmYkWJaqgXjGrNcqPw+p+fZsUwQ
 wEL3vico7OmAx1/4SuRPpdwB+ct5Je8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-U2EWRfgUMsuA2OshVAWiGw-1; Wed, 02 Dec 2020 09:49:05 -0500
X-MC-Unique: U2EWRfgUMsuA2OshVAWiGw-1
Received: by mail-wm1-f69.google.com with SMTP id y187so3844090wmy.3
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 06:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IUacJ8VMkP86PHYUob+f27Mt1oVDOzOiMh9LURb8yso=;
 b=LHSK0rufqhJIr95Zm7pWeVrgsJi/r6O4quto3z/XVBHZ8qdpYY+JWk6LAigckGD2qb
 Dqdtd2MHZWmkrkbljO9H+oNYO+36ASE7u4ejJnhAbhvyzi+PZFVALIWzFRJc0iRHdTd8
 432PL1mzn4IZmpvVP6qL7QoDvtrzj34gkemlOg3VqkvRFL5TB9LJBEMltG3MiDCTt+Af
 CycKhKHNdGH5o/vZf+r5zpwN6IcjVRuz48a3PTZ1LvYv5OETKDqVBQRRoFXnU5RB+/7U
 s2nUwOb/nqG3N9ovxO6fW4IzCyzQZDk3j2LJKp4h5Z1ZFhD8K5QSB3DoIQfNe9mucu7j
 Td/g==
X-Gm-Message-State: AOAM5319EHnfwvdAgF+YkdjSnI0cae49fO0NG8WFYJuUmKOYmu+TcM/B
 c3CFgaT7g0XnRQz/d43k+zYeRWs6hpK1DCR+Jt18duXKe32ewihOjwrgOgBZklqzj2GE3QiRlIA
 oor4yg8VTdQyCbAA=
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr3509491wmi.36.1606920543819; 
 Wed, 02 Dec 2020 06:49:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxlg1cUgpQ8wKCHKHeNKU4/vI+9mB0TWfKw5ap5+z9/C2v5tcfm6k2ZC7ltrCc1E4by6IPLQ==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr3509475wmi.36.1606920543595; 
 Wed, 02 Dec 2020 06:49:03 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a14sm2238070wmj.40.2020.12.02.06.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 06:49:03 -0800 (PST)
Subject: Re: [PATCH v2 8/8] .gitlab-ci: add build-libvhost-user
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <80ac60e9-8fce-14c1-05db-9092972c580b@redhat.com>
Date: Wed, 2 Dec 2020 15:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-9-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/20 11:06 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b1..e517506c35 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -455,6 +455,17 @@ check-dco:
>    variables:
>      GIT_DEPTH: 1000
>  
> +build-libvhost-user:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
> +  before_script:
> +    - dnf install -y meson ninja-build
> +  script:
> +    - mkdir subprojects/libvhost-user/build
> +    - cd subprojects/libvhost-user/build
> +    - meson
> +    - ninja
> +

It would be better to have this job in a separate Yaml so
you can cover it in MAINTAINERS.

>  pages:
>    image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
>    stage: test
> 


