Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8675609AC7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:53:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompgy-0001mn-1v; Mon, 24 Oct 2022 01:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgp-0001hC-DB
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgn-0007zi-Qe
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5933187wmb.0
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8+a+bcWYdR8f/cApXR5dbEo9f+O76iYQ7BjWDlYQm5A=;
 b=dYrE+WFwkX9TRsWbZkQAo1nZ5qq62plzcHc8t74zCfbutGz6AGhYVSrjXKrZGCrUEd
 jfZMWX+ZWFqTG16SMGL3C17K9QSWBPqSy24HF8yHzmUyCcpkp+skjAwmrJgu4+H4IDUK
 Xp+rPBwA6orMcy2wJvHVxeph3Wrblk/tH0sN4iXZq1v0mpGDrxZS4xxnjxBZKl2ysNzW
 OX0qxQ3iZsPIL52B9mPb3Fo9735hPe/rOP96AicCkMOdbjxq62h0RS46iT1aEuM+L5yI
 ms6rwlXjzsfmr5UAZwHA5rLUv+CiJaLZ3F+j9aJXJq5ZoPn00XT0sOxXve3i9ZWlKlch
 l19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+a+bcWYdR8f/cApXR5dbEo9f+O76iYQ7BjWDlYQm5A=;
 b=NfZHjo0gwh+LvxV4ugZYWi5XbAH8SQWAGrR9dY+CcYUIN9De4zrPKlGYG+MkaCkfTQ
 lz5zVJ77PwXxYwGsgrFoGG94gJFsTws6fP4l4+eUp4RIL7k9ntH55Mu5LQs0WHJT6W+4
 Lr8jQAGd4KU6Dzo6gwEj+s7wlfF8B0DrWm/2L1a6gm0ryXpiwnRdP27oBrR4S8hWBxzz
 pbnrL9eKvG7ocVBliN/9Jw93CNBK5iHmdXJjZywr01zgUJzEjNPtIo0A+L1EfGGi0uIw
 CCHGnbIqqB1hZti7Vaz/+sPQQJAbGWQgqBrBFUXaegIaXw0IkVUL3jsXNyI05i1tskUP
 X5Gw==
X-Gm-Message-State: ACrzQf101+ziFwJvUYweqsUF0isdAb7d2Lyr6EAhOvmifOOAnYH16Dyi
 5k3MaKtg7vt1QaqrJ7dCaiT08w==
X-Google-Smtp-Source: AMsMyM6U4nrLy7Bsh8Ldta3iFy7c6z1F9ZNOFaCkgsyb02Ol+kgaBqmIBkmxHmec8U55IY7mduMBcg==
X-Received: by 2002:a05:600c:4187:b0:3c6:fe18:b2a with SMTP id
 p7-20020a05600c418700b003c6fe180b2amr21291678wmh.41.1666588070997; 
 Sun, 23 Oct 2022 22:07:50 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfd208000000b00235da296623sm10536217wrh.31.2022.10.23.22.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:07:50 -0700 (PDT)
Message-ID: <3c406876-f0a7-e9b1-15da-2f12a71ff1af@linaro.org>
Date: Mon, 24 Oct 2022 07:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 23/43] hw/isa/piix3: Prefix pci_slot_get_pirq() with
 "piix3_"
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-24-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-24-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> The additional prefix aligns the function name with both other
> piix3-internal functions as well as QEMU conventions. Furthermore, it
> will help to distinguish the function from its PIIX4 counterpart once
> merged.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


