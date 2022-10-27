Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0308460FCAF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:11:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5LJ-000898-NS; Thu, 27 Oct 2022 12:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Kr-0004zJ-DL
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5Kl-0003qC-50
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666886535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZWylB9rgVaEkbiqHrWmaK/3ReRkOrAceot9hqmcjCU=;
 b=CNlRaJ906kZB88FNouOI62ptg8af/WePZpFcJ/YyS+t9NNd5QNUPhcn+BzdKckEfEjxbmh
 5mNpyIIXtO+MYshng+27R89DPiAOBqZ+lUWIALK5+4h1uazPrxlhG/AuNfIfARvoizsXB5
 Ikaz0gff/xLI+ySXuDcBBLn/F9F/FNE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-PD73OiP3PPqAOomBL2FElA-1; Thu, 27 Oct 2022 12:02:12 -0400
X-MC-Unique: PD73OiP3PPqAOomBL2FElA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso584347wra.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ZWylB9rgVaEkbiqHrWmaK/3ReRkOrAceot9hqmcjCU=;
 b=kta8Tyg7Q6iZEaxP2S3pMOgsoFBjcLmFcpf7mIp9fWF3ixdtNzHS9GrnjuWv4D6EoX
 HccGywnyXoxhD7gdzhQEvivoXVIBc70ELZ8BOjyP2tHGnmKQLAiuP8aJEIkgzm1qFXe0
 msrFsVBCHa7FV9tH4hVfWUKG6PEFx4o+edA5u54hsFNaAbXT0Zofme+C1GZH/IPcQx4r
 Z7E6vcBr3pNX3Q5VXtO/O86LA6HYMz/1v0hiXnLerOcC6/kXdFd5Jf7O5tIrqD2zpGYu
 X6hJNGrWxpWCdLjpqxByiBmk7NxY1AyyDrwGG+WQJsV6I0CXYyORaL6GE6VGrwmCOm8F
 vZpA==
X-Gm-Message-State: ACrzQf02h3vjECQJNXzu6+mEINqT1c94NL9ovv5fCRl6RDlSXqyf7ZhZ
 t66D6PFWkCKHDijg3jtB2rCamghg/gigYWoE/1+s0OPQV0tDRgFRRLSpKhKKSC0j0z8Tes2RrhY
 WWnsU5e948i5RX40=
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr15981887wrm.557.1666886530947; 
 Thu, 27 Oct 2022 09:02:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EUUs58TrHQi0BXXADR72Sg/U8MxFeecAgTNscIOj8AyBtskxnl6qjuVagFqZYTPNboA0WjA==
X-Received: by 2002:adf:e3c1:0:b0:236:6d5d:ffa2 with SMTP id
 k1-20020adfe3c1000000b002366d5dffa2mr15981858wrm.557.1666886530666; 
 Thu, 27 Oct 2022 09:02:10 -0700 (PDT)
Received: from [192.168.8.100] (tmo-066-116.customers.d1-online.com.
 [80.187.66.116]) by smtp.gmail.com with ESMTPSA id
 i6-20020adfdec6000000b002366ded5864sm1514041wrn.116.2022.10.27.09.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 09:02:10 -0700 (PDT)
Message-ID: <4698959a-1c26-c846-5b4c-5b690294d650@redhat.com>
Date: Thu, 27 Oct 2022 18:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Stefan Weil <sw@weilnetz.de>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-16-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 15/26] MAINTAINERS: add entries for the key build bits
In-Reply-To: <20221020115209.1761864-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/10/2022 13.51, Alex Bennée wrote:
> Changes to the build files are a bit special in that they usually go
> through other maintainer trees. However considering the build system
> is the root of everything a developer is likely to do we should at
> least set it out in MAINTAINERS.
> 
> I'm going to nominate Paolo for meson stuff given the conversion was
> his passion project. I'm happy to cast an eye over configure stuff
> considering a lot of the cross compile logic is in there anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> 
> ---
> v2
>    - s/Odd Fixes/Maintained/
>    - nominate more reviewers
> ---
>   MAINTAINERS | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c..6a6f4d62bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3764,6 +3764,30 @@ F: docs/about/deprecated.rst
>   
>   Build System
>   ------------
> +Meson
> +M: Paolo Bonzini <pbonzini@redhat.com>
> +R: Marc-André Lureau <marcandre.lureau@redhat.com>
> +R: Daniel P. Berrange <berrange@redhat.com>
> +R: Thomas Huth <thuth@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@linaro.org>
> +S: Maintained
> +F: meson.build
> +F: meson_options.txt
> +F: scripts/meson-buildoptions.*
> +F: scripts/check_sparse.py
> +F: scripts/entitlement.sh

Shouldn't entitlement.sh rather be part of the Darwin/macOS section?

> +F: scripts/symlink-install-tree.py
> +F: scripts/nsis.py

Shouldn't nsis.py rather be part of the W32/W64 section?

> +
> +TL Makefile and configure

TL = Top Level? ... I'd maybe rather would not abbreviate it...

> +M: Paolo Bonzini <pbonzini@redhat.com>
> +R: Alex Bennée <alex.bennee@linaro.org>
> +S: Maintained
> +F: Makefile
> +F: configure
> +F: scripts/mtest2make.py
> +F: tests/Makefile.include

Feel free to add a R: line for me here, too.

Anyway,
Acked-by: Thomas Huth <thuth@redhat.com>


