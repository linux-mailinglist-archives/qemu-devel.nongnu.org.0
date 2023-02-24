Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986BD6A1848
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:52:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTnk-0002eP-VH; Fri, 24 Feb 2023 03:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTnj-0002dx-EF
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:51:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVTni-0001nW-2P
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677228693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bQOsAuVcDD/b8DZZTDINuLFxR5JeR7s9D0N32WBHf4=;
 b=ZGhw4L4/ckI2NUmPJeWRwyryr547Smuoo2CoypSnhnrFqTiE9l9HW78Ogu8S/vw5Kd2Y/f
 h9HwXS77p8LroUzrDa6n9SPaVxIPb2Po1SG0pP2Jih+xynNWwiz79PiuxxnuAxziQ8z2qz
 xt4wFaJTc4rURtM9rOltR+y44xi6o6Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-mVUJIgdsOUC6clA-WBBFDQ-1; Fri, 24 Feb 2023 03:51:25 -0500
X-MC-Unique: mVUJIgdsOUC6clA-WBBFDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so935975wms.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bQOsAuVcDD/b8DZZTDINuLFxR5JeR7s9D0N32WBHf4=;
 b=EYKQCVYyzGYklRWCqWb6hP8OkwO3hKqaREBd5pbYKNrSHDYy1zQAb3qimuiznHc5wx
 cPbIOtAprVd29uxp1xV6RD/wc68bzXSoSWHwRGE+uQjeY1hrcu0MMcQo9MgMaoq/RMjr
 cqKVt+KmtfOVJRTZg6jlGSLrTBKoOfemvvxqt3957QnNjB0GhU+hIhzjDJWp+R/NdYa4
 Lz2r0jS37bfenGIXlVvimch7kOToCFtZmBUpnzjQSe1+7nGT/Nm9L4iakOmDqDlEacb0
 IljEE6CnaIL+Ri0uCTfzurJOn2i0LjTwCWgRPwuYLJYio1VTqziv1WLm8lLwL6r0SZzm
 Si3g==
X-Gm-Message-State: AO0yUKVMHC9B5U3PFvCB0ce++rgvkAjy4R/KLJ9ACFmzqt4mTSemveaT
 0gRa90pBl6dn2kiG5KERgHP46nYuzlZaWwKTpnpgS/exl8j1JPOji1smnbqpP/5vtMwY0+/PffZ
 AIwnIUxtg65TkWx4=
X-Received: by 2002:a5d:6103:0:b0:2c5:5954:cb7b with SMTP id
 v3-20020a5d6103000000b002c55954cb7bmr11062044wrt.34.1677228684716; 
 Fri, 24 Feb 2023 00:51:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8deDn0skOY3rpAcjDlIdl0Yh3+X+hPuO44czg4lVSA3nsFuM7io+zLGZUr+qq5t/rN/G4OxA==
X-Received: by 2002:a5d:6103:0:b0:2c5:5954:cb7b with SMTP id
 v3-20020a5d6103000000b002c55954cb7bmr11062031wrt.34.1677228684471; 
 Fri, 24 Feb 2023 00:51:24 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003daf672a616sm2049893wma.22.2023.02.24.00.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:51:23 -0800 (PST)
Message-ID: <d5653df7-1d34-2951-2051-3a397c60c831@redhat.com>
Date: Fri, 24 Feb 2023 09:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/18] hw: Replace isa_get_irq() by isa_bus_get_irq()
 when ISABus is available
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215161641.32663-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 17.16, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/audio/cs4231a.c       | 5 +++--
>   hw/audio/gus.c           | 5 +++--
>   hw/audio/sb16.c          | 7 ++++---
>   hw/block/fdc-isa.c       | 5 +++--
>   include/hw/timer/i8254.h | 3 ++-
>   5 files changed, 15 insertions(+), 10 deletions(-)

Makes perfectly sense!

Reviewed-by: Thomas Huth <thuth@redhat.com>


