Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375906D0322
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:28:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phqRn-0007HN-Ln; Thu, 30 Mar 2023 07:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqRl-0007GY-LB
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phqRj-0007Le-7V
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680175678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtk4MrZ4TluwZsosI8BsxKdvBUAZevs/nprRxjs2Ws4=;
 b=i0SpS0xikNLspn+TkskTzGFJzf6Ei2wtvRHTKOdhaP9bR/KAjtvMMStLbsvxbvWH2Tj9S4
 N9NvFAQHaw0//lRjpzvsg+TuYDX1jQCUjlZccSl0JjmOB5xy1EXc2+99EMQGtwbL4kggJ+
 WYr1WozN14qeT5ixV752A55dxWV+rPU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-zCJ0r-S1PVm-aBmtSfWIkw-1; Thu, 30 Mar 2023 07:27:57 -0400
X-MC-Unique: zCJ0r-S1PVm-aBmtSfWIkw-1
Received: by mail-qt1-f199.google.com with SMTP id
 f36-20020a05622a1a2400b003deb2fa544bso12276235qtb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680175677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtk4MrZ4TluwZsosI8BsxKdvBUAZevs/nprRxjs2Ws4=;
 b=HiCGB+MqcTTjH02ZK212RcFSecXA+t+MVRbreuJ1QfyIMhY4afvNu0TtkHGb+WvnH3
 mMu2uMsfeNReumsmdwwUv0K+IJGXKGA/mz/WoGfPFU2IUOL4iF/J7bL1ohG/L4h9Lq2M
 RA/iGvzwm48hxrW494zI0SfMnZAqfvh1rXHwVAyWSrDODJawbMLpiRgKjSomBs3PCNOY
 9kKpNZfPgWGQz86d35F3/gaguL2vasnZpVE2jbJI8ZMH4oHRPZ6+Nr4DMGE1dE9s4XuL
 ViAFNDLXveE/eiCK9JKVvc0JZVHVdfpjMGHykkhGj6DR6AdcnfGLoyOf7yb0Dz2KWQqB
 ARfQ==
X-Gm-Message-State: AAQBX9exhyn26c3vyPJZhSGPZolspOCxB+RrN4GHwZqSv2uqoBb7loXw
 QReiSvRt+f3ZcSoloI6XNfCrdNhb6JyGgD568RaOK+qUqmRQJvpESaFFhqRSvdDW4uFEZ88X5sN
 OmAyJ15/9XJFHfrk=
X-Received: by 2002:a05:6214:f2a:b0:56f:6f5:502d with SMTP id
 iw10-20020a0562140f2a00b0056f06f5502dmr42087799qvb.17.1680175676960; 
 Thu, 30 Mar 2023 04:27:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwzI5BM6TUCV6uij6WV/dCcBCq65ei+kytFH2dHPU9Db2xGdSmr9MkPmuQm/VX8NuUVLNDFQ==
X-Received: by 2002:a05:6214:f2a:b0:56f:6f5:502d with SMTP id
 iw10-20020a0562140f2a00b0056f06f5502dmr42087774qvb.17.1680175676792; 
 Thu, 30 Mar 2023 04:27:56 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a378701000000b007456b51ee13sm19360420qkd.16.2023.03.30.04.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 04:27:56 -0700 (PDT)
Message-ID: <e2a96d5d-efca-e47d-5e74-9b4d55aefdaf@redhat.com>
Date: Thu, 30 Mar 2023 13:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 08/11] tests/vm: use the default system python for NetBSD
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230330101141.30199-9-alex.bennee@linaro.org>
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

On 30/03/2023 12.11, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> Currently our NetBSD VM recipe requests instal of the python37 package
> and explicitly tells QEMU to use that version of python. Since the
> NetBSD base ISO was updated to version 9.3 though, the default system
> python version is 3.9 which is sufficiently new for QEMU to rely on.
> Rather than requesting an older python, just test against the default
> system python which is what most users will have.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20230329124601.822209-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/vm/netbsd | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
> index aa54338dfa..0b9536ca17 100755
> --- a/tests/vm/netbsd
> +++ b/tests/vm/netbsd
> @@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
>           "git-base",
>           "pkgconf",
>           "xz",
> -        "python37",
>           "ninja-build",
>   
>           # gnu tools
> @@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
>           mkdir src build; cd src;
>           tar -xf /dev/rld1a;
>           cd ../build
> -        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
> +        ../src/configure --disable-opengl {configure_opts};
>           gmake --output-sync -j{jobs} {target} {verbose};
>       """
>       poweroff = "/sbin/poweroff"

Reviewed-by: Thomas Huth <thuth@redhat.com>


