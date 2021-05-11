Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D937A85E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:02:10 +0200 (CEST)
Received: from localhost ([::1]:59312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSxd-0006Mj-6V
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSt2-0006xJ-RK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgSsy-00023k-73
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620741438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUOfmFExDnMCh7o/PRszrvpw1Tjj55tL75T+D/Ourdg=;
 b=N5gPTiDkKs1H8URIVMxOnWXSDqCZuyYgDw+CS4kq8FjPt7oTkXbhwivioPud6qticlmjDh
 uJrOUCXVDvDrIGCmyZvGjYfjBdZcUfiyT6s4KbunNyLmdXJwlwQe1Lz5iprE/j6/0ok8z5
 902/RN1CteRdcxx1KiLIeNsu/8S0s/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-M7JEjLa4O4-CPVa53cv7zQ-1; Tue, 11 May 2021 09:57:14 -0400
X-MC-Unique: M7JEjLa4O4-CPVa53cv7zQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so8816267wri.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EUOfmFExDnMCh7o/PRszrvpw1Tjj55tL75T+D/Ourdg=;
 b=NLt1K7VhR0oHlb/o3LzM9Zdq6lwNYdEC+O/849UmdZVMUaVsb2YvfQRkxGGNy5xGs5
 GFUc8BL3g/Ajsj/a1VYZ9a/6IeF5fdpE2ux1qo4z5LqraeHqKNLLNgovLyop50gxCSz1
 NiFb3q6zf5TUn0sCPPziCBK9rlsfLbZqOhWTjbcHhfB5GRx088tgtZvKTq911/6UPMW5
 DIeUoqgH+YjoVHI2orKILzCG9TkTTE+kBc5fWW5ydVsEZvAmt/rprw9d77SltyCbOlt+
 hxSmfTXvWZWjNr8YOoMRg98E54F9R69jJ/U3IO+vpjZfHiAqqN1OeNumSHOd8d4wyFnB
 5jxg==
X-Gm-Message-State: AOAM531WNaA1eVqY4GK2Z9wugTD1GDA/WJ6y3A0wgLvTTT2TcIYlJWMQ
 3knI80Tl0T8NdkyiDsJznA71JpAfiUO9GvixMpcs5HHrW4tol5WCCFRxojGAofPYQ0oPHa5001Z
 9HGTbkW39usGfRhg=
X-Received: by 2002:adf:f251:: with SMTP id b17mr37912729wrp.410.1620741433894; 
 Tue, 11 May 2021 06:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKjGO6Is2VgAB47DU58+CnauRimFPLF2xw8Yss+clVHsIgd/D6S37jvdygrfG58b5c9X7aQQ==
X-Received: by 2002:adf:f251:: with SMTP id b17mr37912716wrp.410.1620741433764; 
 Tue, 11 May 2021 06:57:13 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id v13sm28433282wrt.65.2021.05.11.06.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 06:57:13 -0700 (PDT)
Subject: Re: [PATCH 02/12] patchew: move quick build job from CentOS 7 to
 CentOS 8 container
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <87a706c5-ee81-9f7c-08c6-c6deab725b8e@redhat.com>
Date: Tue, 11 May 2021 15:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .patchew.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.patchew.yml b/.patchew.yml
> index 988c29261f..2638b7f564 100644
> --- a/.patchew.yml
> +++ b/.patchew.yml
> @@ -88,7 +88,7 @@ email:
>           more information:
>   
>           {{ logtext }}
> -        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos7" or test == "asan" %}
> +        {% elif test == "docker-mingw@fedora" or test == "docker-quick@centos8" or test == "asan" %}
>           Hi,
>   
>           This series failed the {{ test }} build test. Please find the testing commands and
> @@ -124,13 +124,13 @@ testing:
>         script: |
>           #!/bin/bash
>           time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
> -    docker-quick@centos7:
> +    docker-quick@centos8:
>         enabled: false
>         requirements: docker,x86_64
>         timeout: 3600
>         script: |
>           #!/bin/bash
> -        time make docker-test-quick@centos7 SHOW_ENV=1 J=14 NETWORK=1
> +        time make docker-test-quick@centos8 SHOW_ENV=1 J=14 NETWORK=1

I think this should preferably go through Paolo's tree (now on CC:) ... and 
by the way, we should maybe add an entry to MAINTAINERS for this file, too...

  Thomas


