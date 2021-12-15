Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684F475869
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:08:34 +0100 (CET)
Received: from localhost ([::1]:55588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT5F-0004DO-0a
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:08:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSVe-0002OE-NG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSVa-0000I6-KL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zIWys8/ljtRphHR38m2OBt+VZvG7vWvQ9VYLLj8iTIk=;
 b=iPopnlGhX6LKQ2Z5w3JpTrmdOfAoZ84HTBn3Ut+22dZf/VUJAzfyirdir6Hn5iahxrs5iu
 SzcqheR46z5RutcPlg+Yhi4/XtNvjKOZ5BdlvvLmlKZ6roXUW5AwZDVLZAObdOwbrneJYR
 CoJ+S6PLTBBKWhxB+wHZmG4nBz0qVWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-x_vMyXm7Nm2TEverC-Ll0g-1; Wed, 15 Dec 2021 06:31:36 -0500
X-MC-Unique: x_vMyXm7Nm2TEverC-Ll0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so12461065wmb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zIWys8/ljtRphHR38m2OBt+VZvG7vWvQ9VYLLj8iTIk=;
 b=Pci74oFmQ0Lb7ahKQM2zpWMO8wCBtr1EOfB3O/3mgSzBB0r2Q04i3OwBEDnpEzFLm3
 bjVw04AF5eQCP5zhDhEp7S2bDhyVl+eg0XBTGxWP7dPQhHxgD7FpVY+cSeozQkUDsQEn
 /+A4yzHX+R7D9UQYABDcQFYrN4SsoITxf6qnKvMk/HtklS+7/Wuw8yBSlquy1d5JUmek
 1XU+yxawm94uv0BmhYi5VFziVa5kbg7K3VGxZxXvAKYLjy4VPHTv/4jMrdW4GxrwHR+o
 FNWLmGT8R2ISZ+tfeOWqzdIwVrhJ+7/i31omPv75BX/ZccCn+Q4PDVC5ujyzlGqIpgVq
 p/LA==
X-Gm-Message-State: AOAM531JQopotNTOBZBf9xQ9P5jpkeIOaQKnNyOeGR4jH1VdIkeNRXbM
 EUp4b3ZhGLG9H4yAJP6SNPlXch7cW++JFZElwjulLyAsg83Yjt+o2LpPi1n0aS76mcXtoejwADB
 x/0uDXDEueFybieo=
X-Received: by 2002:a05:600c:22cb:: with SMTP id
 11mr4064353wmg.181.1639567895221; 
 Wed, 15 Dec 2021 03:31:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydN9yl+o9UYqU7K4sJezqFVHrfsxLSlrPlrs+5BsRCZK46HEiexIccRz9LLIYpauSwQkRgsQ==
X-Received: by 2002:a05:600c:22cb:: with SMTP id
 11mr4064324wmg.181.1639567894905; 
 Wed, 15 Dec 2021 03:31:34 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v6sm4820268wmh.8.2021.12.15.03.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:31:34 -0800 (PST)
Message-ID: <a18b26b9-f0a0-5bbc-0ecf-d97480f72030@redhat.com>
Date: Wed, 15 Dec 2021 12:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 15/18] tests/docker: updates to alpine package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-16-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-16-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> Cleanup the package lists by removing some entries that we don't need to
> directly reference
> 
>   binutils: implied by the compiler toolchain
>   coreutils: not required by QEMU build
>   mesa-egl mesa-gbm: implied by mesa-dev
>   ninja: alias for samurai package

I'd rather keep the alias to avoid looking for ninja or
for what samurai is. Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>   shadow: not required by QEMU build
>   util-linux-dev: not directly required by QEMU build
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/alpine.docker | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)


