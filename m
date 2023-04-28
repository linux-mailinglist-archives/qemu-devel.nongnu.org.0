Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29C6F20C7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:28:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWYJ-0006FK-5y; Fri, 28 Apr 2023 18:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWYH-0006Ew-K4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:26:53 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWYG-000528-19
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:26:53 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso1288595e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682720810; x=1685312810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9aXlHiSzuHZuxcHDHaynEz+z8FIFGb9+9d/DZdtI5w=;
 b=w3LIV9+5lN9B/klNftYkBEAhsUk8/5vyOu5tcoH5NEa9dFlxXOCVBlGnKVtf54ZMdv
 cFqrnnNr/SbVwfIENsdV0+6aG1YLVkJkromgyjLp3XbXAnD5nP2dnR11knNltmPw9Qiy
 5C5K8FIhg4jXfmUCHDUIiRxE4RMBTHdOeH7hOTRVIlZHguqyTkN2c2YD75L5NTXR+JNN
 GMyafafGKGbMIobh4rqNExFJpBCJJvaRY6weUlzR4KjmG8IYSBCo9pHZuiAGeGTeSCzu
 bTSe297gR9Bd+mgG6oI98r0ZdDPbAfixfao0wu06ITQw+SDUwYheaibfl9qrW8XgfxSg
 tfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682720810; x=1685312810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9aXlHiSzuHZuxcHDHaynEz+z8FIFGb9+9d/DZdtI5w=;
 b=Qhzp5qYXyUUObf5o3di03URb/Q+7YjXQ0B8WhVeEjKsgtVulXGAEVBRqPCiN+eh2Vo
 1iwm2uSlhrC/Aej6ZZH54fAF/uckHB0AGI7AnL+obxbEkGJKarsDef1TfOkztgkwLuC8
 R9qSHUcC1sNfl0XWzzsDQYX/xE4iyKBeVfLXTlcm2XoshdcirXjgZXSbNFWuenMeu/gc
 ZS+0Sv5d5bLKrTbQsyoqXYOAQ49+6F+RnUpT6iD8eAXbW11QoZHbQ3w1jB2ADs/zNcVt
 3raSKW22AG9IscndPXsv418qS8iW/j/PIA+QoSu1Fkj8E2NEmgfyiaiVCKISiryG8tfR
 D3tQ==
X-Gm-Message-State: AC+VfDzudA9IQu+kaLAEtk3p7QI+P3dKppxciteIWsC8xidfqKo5/LQ9
 aOE3rQ9JAxeDyO+nHDp+VA5I8w==
X-Google-Smtp-Source: ACHHUZ5ipB5Ecrzf2Ea4TfwOW8PgaE+y+M8OFt4ZjIJiFgYOo3sCWHnulfgyzmi0r5dxRYqK8X408Q==
X-Received: by 2002:a1c:7317:0:b0:3f1:73c8:3a6d with SMTP id
 d23-20020a1c7317000000b003f173c83a6dmr5017423wmb.12.1682720810473; 
 Fri, 28 Apr 2023 15:26:50 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f24f245f57sm16708528wmi.42.2023.04.28.15.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:26:49 -0700 (PDT)
Message-ID: <889ca022-d497-d3a0-f712-e57866c51492@linaro.org>
Date: Fri, 28 Apr 2023 23:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/5] hw/display/virtio-gpu-virgl: make GL device more
 library agnostic
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-2-gurchetansingh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230428164823.789-2-gurchetansingh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/4/23 18:48, Gurchetan Singh wrote:
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> 
> Rather than create a virtio-gpu-gfxstream device and it's
> associated variants (vga, pci), let's just extend the GL device.
> 
> We need to:
>      - Move all virgl functions to their own file
>      - Only all needed class callbacks in the generic GL device
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
> v2:
>      - (Akihiko) Fix unnecessary line break
> 
>   hw/display/virtio-gpu-gl.c     | 109 ------------------------------
>   hw/display/virtio-gpu-virgl.c  | 118 +++++++++++++++++++++++++++++++--
>   include/hw/virtio/virtio-gpu.h |  11 +--
>   3 files changed, 119 insertions(+), 119 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


