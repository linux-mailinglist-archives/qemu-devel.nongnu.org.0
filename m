Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4D6BCD3D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 11:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclBZ-0002H6-B7; Thu, 16 Mar 2023 06:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pclBW-0002GZ-H1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:50:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pclBS-00024a-F1
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 06:50:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so2844998wmb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678963807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zuzifyNCqNYV1GNXJvyRMiwr9buhZUz4MYSV8dsrfac=;
 b=fwK4OR96a1jMt8Sqx4zF2k+5r3pSpIDsgWMLIHiFDweHJzaQJx74eEV+B+fIjC8MRJ
 2RjsSRYOC7hWuTp6zZ1Gz6kp2AGr0erROtFiDuDiU3eHT+gTQoYHW3RWR5E+S2dt/R4B
 8rOKeD8jUtwB2mtrb3BMLRst9J7AwsBQecsM1xy+WT2loRh3vY/fW7tinT1MLepqoo2N
 8FNKs0f0AjVto00dfFvIt3sXiy79PoAAT9anj6qgPNAuN+xtTB6LxtTCYxRUo0NEZ1YY
 RvChwf4ZdK9wpnWKa2VRlBDhSGhDgOGHATfrAWpVV6v+zAh91XWUrXH90cpLkSD4ZiqY
 ynAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678963807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zuzifyNCqNYV1GNXJvyRMiwr9buhZUz4MYSV8dsrfac=;
 b=UPVF4hyZx/8uTjCSoPy9wE0yxtqZ/jVN7AwVSxWq2ME2HT8wlomb0IG3JqrCPF01Zm
 RlR8ChzvMdHWzFrYPPNiDuHxw2kPJKDxwNM2jRTzD5DBstqMiz8fKcpwZptfy0HUZNU6
 AgJ0P4fIGudZheCukVCuo9cJo9CAPE9SDSRT1BRZbhJeV+FgNz9GaOvlwD8j+EWzxBdq
 S7knrqtyz1Vga0Jq91oWGLRFgRtnzxfADWo0/7dXdk+m7CGnbTGrRh32bR0nO5M8QmJP
 WBP3cLKjx7Jas8nhC5tBZbO7s5ILU1YcVmoiS+9cQVG1HrhqJjYHnVud9+mWpc4Z17Gy
 ia+Q==
X-Gm-Message-State: AO0yUKV8VVgZaqIS7gzrKsb6zAdvZcBJx7Q2eyz0kYaDuHCbz0lJfURE
 meDM3HZHr9IRZHQfZHIL5hJU8g==
X-Google-Smtp-Source: AK7set9iyU7IgIf+uum1u89a+hTnmz8zfHesdv7Ccoh9RTCrQW2h8HgiRLVpjsPbbB3CYEZv27CakA==
X-Received: by 2002:a05:600c:3b16:b0:3ed:2eb5:c2dd with SMTP id
 m22-20020a05600c3b1600b003ed2eb5c2ddmr7829556wms.39.1678963807221; 
 Thu, 16 Mar 2023 03:50:07 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003e209b45f6bsm5016922wms.29.2023.03.16.03.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:50:06 -0700 (PDT)
Message-ID: <05247be0-074c-1238-abe5-c25f3699dbb2@linaro.org>
Date: Thu, 16 Mar 2023 11:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] edk2: update submodule to edk2-stable202302
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
 <20230316095432.1514080-5-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316095432.1514080-5-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/3/23 10:54, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   pc-bios/README | 4 ++--
>   roms/edk2      | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


