Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD40646971
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:52:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3AkJ-0001TQ-Qo; Thu, 08 Dec 2022 01:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3AkH-0001Sm-K6
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:51:01 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3AkF-0004gG-Vv
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:51:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so2706087wma.1
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 22:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJc2E/2WonAqrf/0llogHkwkzXbxgHJSUklysOs1+T4=;
 b=OZYGASe7Tkx+UF3zCtBrpDQteXXjIlaX0hMzUCiCuDcOnsj5ZxGArKQSeQxv4JZBfM
 16cyazf+Wgawklc7pUwt28v8tev1wPUGPAyzZySPy56O6JZ8psgDSUJdMj4jSFcrYUJt
 GZ9Jkh3R4nihRRH3U8ln45PYVEWI7eYI7m2LXt+QrPhuEyD5k5oTXquNPiWcBoZyTgg/
 FwK8QWtvMaGfKpCH5Q1ZMgtbftT3VbXhYCK+4VbCK5+ukgzehLbZugBLsDuNLhTcJqpE
 dFEohlOgQxQESl2Jq23KJqe+if6Tw/h0Yt4KKnKnYLNW/hDY9i1ohrQhkLunfMf+OTzi
 vTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJc2E/2WonAqrf/0llogHkwkzXbxgHJSUklysOs1+T4=;
 b=viZNT6m4NY7CsjfDqO8AH+LHHqThMVe2jMntidkb+cwZBT22nlOP4zxtjtWteU6X6Y
 PraHQlTD6z6h5F6j/OBjm6NMyvepFRQBFhBd8Mxlt8gj2JNXWtwrD+jEVMzjC57ORnxT
 rkJsLzEg0cHBCnj1F7qf102p1esTeUyXZZ4K725QUZ27tJJTGWnqMctPyUNm8qLF2KO1
 ec9d5dXXADpid+XnGktbFWKhZf454vZBQDvWDyqrcWBt18JGhAg3A2uX15d45pRsDhtB
 UODqh9X4XlEjd7kOvo2bXJy5OYQZT5ChYcecvkcF6UsSRnZx8jBU+SIZikli50bYm8SG
 ughg==
X-Gm-Message-State: ANoB5plwjOqzciqFgLMqYIxtgytbLKZprWnedWXe86nivTSmmhLklVO9
 4v/ZgRULbWAzjCj879gUJB1Xog==
X-Google-Smtp-Source: AA0mqf49EJcPkWjIAQ7urCP3nnABpcpIOfyZvviqo48UP4V/GMDu/zmQKqi3+rlW2IlNIl9cps3hTw==
X-Received: by 2002:a7b:cb8c:0:b0:3d1:c4fa:4a69 with SMTP id
 m12-20020a7bcb8c000000b003d1c4fa4a69mr12050889wmi.9.1670482257100; 
 Wed, 07 Dec 2022 22:50:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003d1e34bcbb2sm3079540wmb.13.2022.12.07.22.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 22:50:56 -0800 (PST)
Message-ID: <ec5e3166-c183-c73d-5b42-6bb024e65592@linaro.org>
Date: Thu, 8 Dec 2022 07:50:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/5] hw/acpi/Kconfig: Rename ACPI_X86_ICH to ACPI_ICH9
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>
References: <20221207231205.1106381-1-shentey@gmail.com>
 <20221207231205.1106381-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207231205.1106381-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/12/22 00:12, Bernhard Beschow wrote:
> Although the ICH9 ACPI controller may currently be tied to x86 it
> doesn't have to. Furthermore, the source files this configuration switch
> manages contain a '9', so this name fits more.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/Kconfig     | 2 +-
>   hw/acpi/meson.build | 2 +-
>   hw/i2c/meson.build  | 2 +-
>   hw/isa/Kconfig      | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


