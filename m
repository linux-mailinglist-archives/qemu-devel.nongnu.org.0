Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B495F66733C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:33:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxgl-0003Zg-7X; Thu, 12 Jan 2023 08:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFxgg-0003Yh-2G
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:32:11 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFxgd-0007PW-2f
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:32:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so15043486wms.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lf672JGuE5LfjbjLhPsVl5juPyWOol8uPASx/Qb32Nk=;
 b=dPdXcAFOU54xspgLRec0wdLiIc9hrYnb7HCV21gIdiaZ98dF2PuKIUUcI2GAqfzPxX
 Sm+XHlk9Q97U3e7sYKN2jiqDoEcPZEnyaGUYgfI3eUYzLbkkb/WO2ylCF/YnlHKZJdfv
 p+hxVHy+e2/o6/MOhgTWLmccqPRmET2CvybBcD6H+qjiQvF875pwguyrHfZo2moF/Fm8
 NJxuH8WH7qqp9ZFjEAVzLDz/7ho548fZyG+rKB7EPLb3afkvnCZZChrBchGl2Rcxk8vI
 SdJKh751g8oXxwtNbW5pHD7zHRf10qjBf4pXrz0CHEIve2DGaQPBmsb0lf+TBOoQNmLH
 NW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lf672JGuE5LfjbjLhPsVl5juPyWOol8uPASx/Qb32Nk=;
 b=boHAAmVbEdVMZmjz/fuInirAdiSibllS25TCLRO60XnEovrT9RBMUIJPjfb3X72YCE
 loodBoQ/OywcvvxxaIzSrJxmXh5B9j6O90c1k5z02XUCq/dpW0wui2hvS1bk3C60eYWs
 L0anSjaKSzp25YGE6gxD+OjwFdpzCNlBCyKGVpgYMKz3rOx89FYxD5LF98R0tkb+CFNm
 z7OJE3BpDs2J/EI7zScXI8Y55WB18YVr5Gd2UDfabt8GK9R6jV1ByMsMD/6OHnwYPQ2E
 jJ4bGUS0uXgDcjVhOq5vsLRvLTJrXwbTa0FUi5Pw20zAI8jtX+Dsa6JT9YqYTHtxX/Cu
 gb1w==
X-Gm-Message-State: AFqh2koCEGOjD1pXvgAICWlFjWoiVz/H0ZGCOYrzHBnl1Eh54/sKSrpx
 MK/lCy/wS8j9haRhwCiSm4SV2Q==
X-Google-Smtp-Source: AMrXdXuetfh/oT6RPVEDH+zTY2zMvopp6rGl0vB8vRN/WgZvm68l7yF/3TWwkMZVu0s3i3r1DrpLtw==
X-Received: by 2002:a05:600c:4fcb:b0:3da:1bb0:4d71 with SMTP id
 o11-20020a05600c4fcb00b003da1bb04d71mr1183351wmq.11.1673530324655; 
 Thu, 12 Jan 2023 05:32:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm28597261wmo.39.2023.01.12.05.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 05:32:04 -0800 (PST)
Message-ID: <0c49ff50-72ee-18c8-6f3b-db5f50c88297@linaro.org>
Date: Thu, 12 Jan 2023 14:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 28/33] hw/isa/piix3: Merge hw/isa/piix4.c
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-29-shentey@gmail.com>
 <f4c3ec2b-6005-6b7c-9f66-a942e9e0a384@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f4c3ec2b-6005-6b7c-9f66-a942e9e0a384@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/1/23 13:50, Philippe Mathieu-Daudé wrote:
> On 9/1/23 18:23, Bernhard Beschow wrote:
>> Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
>> their implementations can be merged into one file for further
>> consolidation.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Message-Id: <20221022150508.26830-37-shentey@gmail.com>
>> ---
>>   hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
>>   hw/isa/piix4.c             | 285 -------------------------------------
>>   MAINTAINERS                |   6 +-
>>   hw/i386/Kconfig            |   2 +-
>>   hw/isa/Kconfig             |  12 +-
>>   hw/isa/meson.build         |   3 +-
>>   hw/mips/Kconfig            |   2 +-
>>   7 files changed, 165 insertions(+), 303 deletions(-)
>>   rename hw/isa/{piix3.c => piix.c} (75%)
>>   delete mode 100644 hw/isa/piix4.c
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

BTW I wonder why PIIX4 isn't calling pci_bus_set_route_irq_fn()...
Any clue?


