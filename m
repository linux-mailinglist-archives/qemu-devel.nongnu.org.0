Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEF6EA748
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:40:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnFS-0008If-Fx; Fri, 21 Apr 2023 05:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnFO-0008IR-TU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:40:06 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnFN-0004Mo-C3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:40:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso15399165e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682070004; x=1684662004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IJJcrkrs6Lhr57yvH9tGSyvY0ddAQOdQTki5bZvOgd8=;
 b=dwjGUqRcYkCmIP6bpghC7/f0MWIBH1JPUJLu4YAdnwxKzDDIgH3goNQGIf6pW4Bizq
 GHjM1p4RnIsT+9UYa17xbZQj0Vf6drMrvwF2CNYJKzuRU974JaZIMWUNPb9Y4GrLnBnG
 vRENLpXLJC0sNvyQoPGJTyXBswXMewHbLHRPBTzlO7uWp6v9PnEdhyxPrkm5Wqm2SwRC
 8GO0z/MO1aZFv8naXjlA6e+gmEAm236+3rkuEEr1IqvJxmFU1VVmRi+lu0cE9IQUtRwS
 M98gk+QTSGNcJ9OXWwr9G4xEOhzs4P0GD53d831Q3P54jwREXyqwx2tjCgPM5mVVfpxX
 AIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682070004; x=1684662004;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IJJcrkrs6Lhr57yvH9tGSyvY0ddAQOdQTki5bZvOgd8=;
 b=a5S5QQVItOeWM/QIQR3i6MZyHcyZD3hEH48ldMzo9+87rrsm7N1trUFr8qInYblEHu
 ho1MV6PnQ/ao2CQiBQ9uJSy3+u1MkOaxzQEWHa8alfMUjfTu59OngoSYm6Ez7B/fgqAB
 x2OjCMXpEuJacJuP/35NMabjQfkZLpreskbeWgr5WjBKpR03pe+R76nrYKmfRMqU7FKJ
 QQo4FG2wToxm5kGHYZZ2m+NSgPHQzCRUuWtEwwocboBlM+8PVG8DVI47R2hJOnudrTm0
 pGRID8P+su46e+w+VcdjBfY9i7+y8BkGrSfBYrKAqEEilHOLSC6PCfA1gifHcv4qtBZ6
 s/YA==
X-Gm-Message-State: AAQBX9cMqxPUafYTM0Ml8a9aBuE/SkM8KGwS5hgqWKOE44Z2I7P9pBKX
 o/7RONnhPpo+3do0Vzx8MmF9Ug==
X-Google-Smtp-Source: AKy350ay1AezmjQJPrNW5mSTYtRz7L+q6ksrjF62ySFdbydFuPzSTxPMrHrNjCDORNZFr+muIj7nZQ==
X-Received: by 2002:a05:600c:2208:b0:3f1:75a9:5c0d with SMTP id
 z8-20020a05600c220800b003f175a95c0dmr1517873wml.26.1682070003726; 
 Fri, 21 Apr 2023 02:40:03 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm7776517wmo.46.2023.04.21.02.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 02:40:03 -0700 (PDT)
Message-ID: <42fbea54-1e77-69d1-8e5e-05a14de692c3@linaro.org>
Date: Fri, 21 Apr 2023 11:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 05/13] gfxstream + rutabaga prep: virtio_gpu_gl ->
 virtio_gpu_virgl
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, david@redhat.com, stefanha@redhat.com,
 kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-6-gurchetansingh@chromium.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230421011223.718-6-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 21/4/23 03:12, Gurchetan Singh wrote:
> The virtio-gpu GL device has a heavy dependence on virgl.
> Acknowledge this by naming functions accurately.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>   hw/display/virtio-gpu-gl.c     | 27 ++++++++++++++-------------
>   hw/display/virtio-gpu-virgl.c  |  2 +-
>   include/hw/virtio/virtio-gpu.h |  2 +-
>   3 files changed, 16 insertions(+), 15 deletions(-)


> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index adee17968d..e256e44172 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -297,7 +297,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                     struct virtio_gpu_ctrl_command *cmd);
>   void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
>   void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
> -void virtio_gpu_virgl_reset(VirtIOGPU *g);
> +void virtio_gpu_virglrenderer_reset(VirtIOGPU *g);

Or virtio_gpu_virgl_reset_renderer() similar to scanout?

Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   int virtio_gpu_virgl_init(VirtIOGPU *g);
>   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);


