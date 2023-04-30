Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4386F27C9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 08:10:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt0Fi-0007ml-Ag; Sun, 30 Apr 2023 02:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pt0Fd-0007mW-Lv
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 02:09:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pt0Fa-0007oy-VT
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 02:09:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b35789313so997152b3a.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682834973; x=1685426973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgsJgymNz3M5eXdmxp9UJkJ9y/X4YE1Vy8lR9rjLoBQ=;
 b=OaM0DXRsOuIQlCQwkD42ud9tL5FFlrfAJ8iDXSygOsrb7rNsiTdtlOkFrVylpPIdon
 r8P1ImFgyw2dqFKdGD/kxY4bO86p81CyquscwwMZaqm3pk1e+nPJjQ2xU1NLESlim/VY
 EfqqxJ0WOkbVMeMqxVFXO4MCkGs3Qogk6xk6oEVrK/D6Kwu9cM3Cg7LAbm/XslCif+V/
 QQ5Solx+4sGHvGkjARVp+XWUFrMbOA3sOrMU2s5ROPj5BMxbIw/VBFkIraeNUzpF6FMi
 3yLVxWHqIAlgPig3cRzfJEVsyI6Hc7X15NRfmJYAyAKe++4kPuOrtSDZg2jrlG93hDrJ
 isYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682834973; x=1685426973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgsJgymNz3M5eXdmxp9UJkJ9y/X4YE1Vy8lR9rjLoBQ=;
 b=KKYKkRuuvabu6bAxMDWlqxPKVGJVz+6d7u9eXatzqyUQ+HWreN0kdw1IS7ryxnTPsW
 +XKD9ka1Zh1DE2uY7v6PfVGSF1pJawImwwtzxjVjIxwAKxX83vgAdA6HQpeZZFAlC42u
 DpzFwP8sTaLj30faBrnV1jYk/0aU+YSu0qnSTutEjxqhKKD3lvbjLZYnm/0E1JTunZGR
 yidvdiK9YC1ocuyZMUhYOOFHhaQvuegfT6ETYZXpkuGv1MMi2Ks9xr/Oy8oY4pwIl9qI
 bRUlPqBkkoEivUkOfLpN6n64P360YAATmCmzs3rRaXWDKv/C6S3swOxEaNF2qaB6vWnx
 P3KQ==
X-Gm-Message-State: AC+VfDwnAIMU6Mo76nxl7t9zMSKrGYUR23bsWvvqeYdZoSTKHqCAdsLr
 bvTu1PCka3lutgbOZ8/xZVo=
X-Google-Smtp-Source: ACHHUZ6FkO5HALDWGU8KKsypqtahdGuSWiIF0KkdmG06BZKaeft0EMtAZDEbQRqQNYhvGyBdJffDTA==
X-Received: by 2002:a05:6a00:2e91:b0:63a:8f4c:8be1 with SMTP id
 fd17-20020a056a002e9100b0063a8f4c8be1mr16106044pfb.10.1682834972873; 
 Sat, 29 Apr 2023 23:09:32 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b0062dba4e4706sm17580341pfb.191.2023.04.29.23.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 23:09:32 -0700 (PDT)
Message-ID: <3d85338e-a2c5-a8d5-9218-99d260b057e5@gmail.com>
Date: Sun, 30 Apr 2023 15:09:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] hw/display/virtio-gpu-virgl: virtio_gpu_gl ->
 virtio_gpu_virgl
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230428164823.789-1-gurchetansingh@google.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230428164823.789-1-gurchetansingh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/04/29 1:48, Gurchetan Singh wrote:
> From: Gurchetan Singh <gurchetansingh@chromium.org>
> 
> The virtio-gpu GL device has a heavy dependence on virgl.
> Acknowledge this by naming functions accurately.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v1:
>   - (Philippe) virtio_gpu_virglrenderer_reset --> virtio_gpu_virgl_reset_renderer
> v2:
>   - (Akihiko) Fix unnecessary line break
> 
>   hw/display/virtio-gpu-gl.c     | 26 +++++++++++++-------------
>   hw/display/virtio-gpu-virgl.c  |  2 +-
>   include/hw/virtio/virtio-gpu.h |  2 +-
>   3 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index e06be60dfb..8573043b85 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -25,9 +25,9 @@
>   
>   #include <virglrenderer.h>
>   
> -static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
> -                                             struct virtio_gpu_scanout *s,
> -                                             uint32_t resource_id)
> +static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> +                               struct virtio_gpu_scanout *s,
> +                               uint32_t resource_id)

Now the last two parameters are misaligned.

>   {
>       uint32_t width, height;
>       uint32_t pixels, *data;
> @@ -48,14 +48,14 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
>       free(data);
>   }
>   
> -static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
> +static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(b);
>   
>       virtio_gpu_process_cmdq(g);
>   }
>   
> -static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
> +static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(vdev);
>       VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
> @@ -71,7 +71,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>       }
>       if (gl->renderer_reset) {
>           gl->renderer_reset = false;
> -        virtio_gpu_virgl_reset(g);
> +        virtio_gpu_virgl_reset_renderer(g);
>       }
>   
>       cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
> @@ -87,7 +87,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>       virtio_gpu_virgl_fence_poll(g);
>   }
>   
> -static void virtio_gpu_gl_reset(VirtIODevice *vdev)
> +static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(vdev);
>       VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
> @@ -104,7 +104,7 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
>       }
>   }
>   
> -static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
> +static void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(qdev);
>   
> @@ -143,13 +143,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
>       VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
>       VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
>   
> -    vbc->gl_flushed = virtio_gpu_gl_flushed;
> -    vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
> +    vbc->gl_flushed = virtio_gpu_virgl_flushed;
> +    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
>       vgc->process_cmd = virtio_gpu_virgl_process_cmd;
> -    vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
> +    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
>   
> -    vdc->realize = virtio_gpu_gl_device_realize;
> -    vdc->reset = virtio_gpu_gl_reset;
> +    vdc->realize = virtio_gpu_virgl_device_realize;
> +    vdc->reset = virtio_gpu_virgl_reset;
>       device_class_set_props(dc, virtio_gpu_gl_properties);
>   }
>   
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 1c47603d40..ffe4ec7f3d 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -599,7 +599,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
>       }
>   }
>   
> -void virtio_gpu_virgl_reset(VirtIOGPU *g)
> +void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g)
>   {
>       virgl_renderer_reset();
>   }
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 2e28507efe..21b0f55bc8 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -281,7 +281,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>                                     struct virtio_gpu_ctrl_command *cmd);
>   void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
>   void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
> -void virtio_gpu_virgl_reset(VirtIOGPU *g);
> +void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g);
>   int virtio_gpu_virgl_init(VirtIOGPU *g);
>   int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
>   

