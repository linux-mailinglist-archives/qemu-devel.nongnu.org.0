Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142855375BA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:44:58 +0200 (CEST)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nva5A-0006Ul-UK
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nva0q-0004vu-IG
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nva0n-0000T9-CW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653896423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8S+TgK9NApaSABEgy8MhLQQUXpl7c9wD9SE9RSr7Ba0=;
 b=OnREL8VapGgGlleyB7bAzHuI/xU/F+F8vsyhpV9b0Jwwrp1U7vGs9Kw92DYpZGTlYqLpYX
 xEjLx0URURMQz43g1HBCEV6pl+J1go9FcctH9NDFqReEStn2BT2IuIOXOQSkvVbIbVA93A
 ZZf33UbNAUZE+ZJUz2WYULa3K6sh/F0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-Q4jBMhRSMACz1u5rFvkxcA-1; Mon, 30 May 2022 03:40:22 -0400
X-MC-Unique: Q4jBMhRSMACz1u5rFvkxcA-1
Received: by mail-qv1-f72.google.com with SMTP id
 ee9-20020a0562140a4900b00464376ffe2aso3807054qvb.18
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8S+TgK9NApaSABEgy8MhLQQUXpl7c9wD9SE9RSr7Ba0=;
 b=uwwS2OAkBANjto5gES6vij0oWfCOW+5tsc+w3h57RIkHHdm8911e4saFFaHKSBxxG5
 M1iTCQYzw4croTIfXYV8x3ZP8J5hJ+r0tWYGce4314TamcMSjfBmKROiCyFaBbbfVtqU
 ukpQi1r7Qoa+7I1nIIQrqVe/D7TA9UAYi7ej/1KePahlT2eTHDZBjxWGibesu7qpA/tt
 +mYcTBdPPOWNNsc6SBqwLoRgD24GZk44cUZQeCxpo74ws2DXdmEFb0927xKI0I3//FeK
 ei8KXg52iJcTrdhZBSV0NwcwKCBo01N5+qhIxgirq482V8/TJdF1rw0ij9Ydd0kWSyNl
 Mm5Q==
X-Gm-Message-State: AOAM532orthVXmpdI3wJuNgT7ierxyfXabraEL0WTXthaPmEOAIydWX3
 apga6KMVa60Q4HaKJQkOeLi9VpURF2IIZssA+F5sqVkF0Dbbcq2lbYXLhtq4EfOupEEhh1nQz+j
 jB9PN1OWEWS3XJxI=
X-Received: by 2002:ac8:7fd1:0:b0:2f3:dddb:4206 with SMTP id
 b17-20020ac87fd1000000b002f3dddb4206mr42604617qtk.11.1653896421843; 
 Mon, 30 May 2022 00:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM8lyi/ff4WxOGXuUIK5Y9Mo65K5h/h+bZATkDK3hvFXsTHRcuYhPtzKL1vAKQTfkhd4RGrw==
X-Received: by 2002:ac8:7fd1:0:b0:2f3:dddb:4206 with SMTP id
 b17-20020ac87fd1000000b002f3dddb4206mr42604601qtk.11.1653896421629; 
 Mon, 30 May 2022 00:40:21 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 o16-20020a05620a0d5000b006a34bdb0c36sm6997876qkl.31.2022.05.30.00.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:40:21 -0700 (PDT)
Message-ID: <4a8f80fc-97fc-78cf-ef0c-7d7537c7f5ba@redhat.com>
Date: Mon, 30 May 2022 09:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 24/33] configure: enable cross-compilation of s390-ccw
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-25-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220527153603.887929-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 27/05/2022 17.35, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> While container-based cross compilers are not supported, this already makes
> it possible to build s390-ccw on any machine that has s390x GCC and binutils
> installed.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220517092616.1272238-14-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure                    | 18 +++++++++++++-----
>   pc-bios/s390-ccw/netboot.mak |  2 +-
>   pc-bios/s390-ccw/Makefile    |  9 +++++----
>   3 files changed, 19 insertions(+), 10 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


