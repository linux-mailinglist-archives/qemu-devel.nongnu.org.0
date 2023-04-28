Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7706F1602
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:47:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLcM-00066g-B8; Fri, 28 Apr 2023 06:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1psLcK-00066Y-Hg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:46:20 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1psLcI-0002Yd-P9
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:46:20 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b4dfead1bso7952449b3a.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682678777; x=1685270777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w9z2DSeVp3pyzd9xMMxZN4WkAtjDpoV9I9K5GS/u3iU=;
 b=D8JYy90mWxOyT70o0geFpICSK6iTqR0B5QHP21S40+89ywZBzjgho407iuh9IRc/VO
 9EGFvRU+qvematEm1cQteV34jab8OfdJ00Rw75xtTHSrpLSz7ctLMs4ZB484jB8+MUUQ
 ejrho4APW06MYHhSzhD495+heL/GENowJmpORNvTi7cCMcU2b5NajAGXI62PCXTYa/LY
 T+0kSRLVrXPfFciZ7CUKVOMgo1VTNaOXNOMDEY+SP0X9EqVeW80H6O6f1J/HbUcPA4iN
 9RtKNE32VLxEUhDvf+y7JAdBU3RW+f0LoUF2e4/1+TnQJP2xtL2yMwzFdU9TC6avG7Zm
 zygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682678777; x=1685270777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w9z2DSeVp3pyzd9xMMxZN4WkAtjDpoV9I9K5GS/u3iU=;
 b=ksm47iKGdsXcbR1SW/m9tVBbnhvXdfFTnPMBto5mYBCMKuc4JQS9uJok6FSmLGRg/K
 QfwLQU+TsUxTN50NWEE9t4G1eciJvfyyIJSaO/mdHdvJntWTyIygeOXlJcxB5gj5c68V
 SUa60xVDg/gGc8e4jDOgIOaleXf2aCTa6uBM7XMh1MBFlsACSA1LSuSHodWzifKoLzOU
 78cgoMCbbcDEhv8iWXY+TU4JlQdOoFavALRj4nYd1vYgqjpZb7R7jwYbk4RAVKe3PEYU
 CTiIG5CJgHYQnhpOldeGlat4ctBrebD9KJaKPUlgs+sO1f3hbQRWJggb99LjCbs1He//
 t5PA==
X-Gm-Message-State: AC+VfDx48ILUQ/64QKQHynvEX1sIle8gxcJpUYjAJW0gprtsMqDUSHau
 STg5yr9yrYhjUF8hPoodj0c=
X-Google-Smtp-Source: ACHHUZ6SBzJBXVH3BpmLqhCT2keAv4NTJqeCro5VbUHA/i+3QYr4/pE/ybJsbrltzHdSrNIXzjA/HQ==
X-Received: by 2002:a05:6a00:b51:b0:63b:7ae0:fde9 with SMTP id
 p17-20020a056a000b5100b0063b7ae0fde9mr7645095pfo.20.1682678776775; 
 Fri, 28 Apr 2023 03:46:16 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a627b04000000b0062cf75a9e6bsm14753978pfc.131.2023.04.28.03.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 03:46:15 -0700 (PDT)
Message-ID: <2a8cc388-816b-60d8-5cea-68b850933d65@gmail.com>
Date: Fri, 28 Apr 2023 19:46:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] hw/display/virtio-gpu-virgl: virtio_gpu_gl ->
 virtio_gpu_virgl
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, dmitry.osipenko@collabora.com,
 ray.huang@amd.com, alex.bennee@linaro.org
References: <20230428025251.603-1-gurchetansingh@google.com>
 <20230428025251.603-2-gurchetansingh@google.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230428025251.603-2-gurchetansingh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
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

On 2023/04/28 11:52, Gurchetan Singh wrote:
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
> 
>   hw/display/virtio-gpu-gl.c     | 27 ++++++++++++++-------------
>   hw/display/virtio-gpu-virgl.c  |  2 +-
>   include/hw/virtio/virtio-gpu.h |  2 +-
>   3 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index e06be60dfb..7d69050b8c 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -25,9 +25,10 @@
>   
>   #include <virglrenderer.h>
>   
> -static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
> -                                             struct virtio_gpu_scanout *s,
> -                                             uint32_t resource_id)
> +static void
> +virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
> +                               struct virtio_gpu_scanout *s,
> +                               uint32_t resource_id)

nit: This adds a line break between type and name, but it seems to fit 
in a line even without the new line break.

>   {
>       uint32_t width, height;
>       uint32_t pixels, *data;
> @@ -48,14 +49,14 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
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
> @@ -71,7 +72,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>       }
>       if (gl->renderer_reset) {
>           gl->renderer_reset = false;
> -        virtio_gpu_virgl_reset(g);
> +        virtio_gpu_virgl_reset_renderer(g);
>       }
>   
>       cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
> @@ -87,7 +88,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>       virtio_gpu_virgl_fence_poll(g);
>   }
>   
> -static void virtio_gpu_gl_reset(VirtIODevice *vdev)
> +static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(vdev);
>       VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
> @@ -104,7 +105,7 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
>       }
>   }
>   
> -static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
> +static void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>   {
>       VirtIOGPU *g = VIRTIO_GPU(qdev);
>   
> @@ -143,13 +144,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
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

