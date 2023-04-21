Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB06EA798
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:54:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnS5-0003BH-Mv; Fri, 21 Apr 2023 05:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnS4-0003B9-2o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:53:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppnS2-0006Xz-Cv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:53:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso2737475e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682070788; x=1684662788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MRzaB/9JEU7gD82yJb3v7gSuc7hfGUAnXkrkCplfiLc=;
 b=Ii07iAWYquwJPUxy/tN3Zlu+fMO0tEzTDnWcU7HyLDmQA3+7ZhbdS/THzp4piPil01
 WgV49CQirNZ87z52AOiXSDbtRrMrrlBpYgS9jdKWLwiWZVqbxjUtjVYPv77QdouggwST
 YSgCwaV9GGb0cXFxvIRjqpQIdVWfEmGcpdbW0ENNmXQkI0qAKPzQCDSPCRqjH36re6kQ
 Db2PuFACduOtGVmtHHR/raWtl3oyxSBhLv0xRklkiSE+yUrWgSR9mx+i6v4yPNNjSdiw
 XEd5AmTSZGH3J40+qE/ldnjHbrX0srXusWX1NJPSLhG2RTqI46CO07DH5rbTibcHCTPE
 VWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682070788; x=1684662788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRzaB/9JEU7gD82yJb3v7gSuc7hfGUAnXkrkCplfiLc=;
 b=a6Tw517iEyWwqt0EzhWr7Dm43VHBe2a0oKyfNBGr4+8ubo9KxmN0lVlQO/9QpKc1h7
 rVkPAmYnFEWju1Qc9KSw1tEA+jh6+Gk/m498aXaaLlHfIN8mOjBnkikAvDQ1H0nBwRRi
 MaUtLYORgvMsWza1fFE6HuS1fry6M5Uvxti1bAZJNS8xEWPENAf+qmyq4ENFl/+SB97T
 nsxQcfuWp1md3xFevhc+JCDoyR4IO4VEe0HsmlEVEIwfKayrnjNtIlmCePviEbGOVRy9
 RBWzlmVb8Td+13IZ2X4nKqamK8kIGLbuMPp/s70V/ftSAnupmw19Nw9t9Gx6Awxll8Ks
 jcsA==
X-Gm-Message-State: AAQBX9e06isl2edKKkwARFKJMaHzrf2Nvn0qhXVA7a/pMZkLYn0FK9Bj
 jqW9OUpTP490/2E+d+1mkV9Itg==
X-Google-Smtp-Source: AKy350b0LbJIr42ts1iKRjPgKCFDfWC5IGkl9R518Cqy1MkKNEZpNSulvcBdowgeWvGtv7BwE+91GQ==
X-Received: by 2002:a7b:cb50:0:b0:3f0:683d:224d with SMTP id
 v16-20020a7bcb50000000b003f0683d224dmr1435341wmj.9.1682070788717; 
 Fri, 21 Apr 2023 02:53:08 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm7658591wmp.36.2023.04.21.02.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 02:53:08 -0700 (PDT)
Message-ID: <d3021e02-5c47-b6f3-2eba-ae9808585b8f@linaro.org>
Date: Fri, 21 Apr 2023 11:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 07/13] gfxstream + rutabaga prep: define callbacks in
 realize function
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, david@redhat.com, stefanha@redhat.com,
 kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-8-gurchetansingh@chromium.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230421011223.718-8-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
> This reduces the amount of renderer backend specific needed to
> be exposed to the GL device.  We only need one realize function
> per renderer backend.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>   hw/display/virtio-gpu-gl.c     | 17 +++++++++++------
>   hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++----------
>   include/hw/virtio/virtio-gpu.h |  7 -------
>   3 files changed, 36 insertions(+), 23 deletions(-)


> @@ -34,13 +39,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
>       VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
>       VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
>   
> -    vbc->gl_flushed = virtio_gpu_virgl_flushed;
> -    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
> -    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
> -    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
> +    vbc->gl_flushed = NULL;
> +    vgc->handle_ctrl = NULL;
> +    vgc->process_cmd = NULL;
> +    vgc->update_cursor_data = NULL;

If we don't check pointers are unset before assigning it in
virtio_gpu_virgl_device_realize(), then NULL-initializing here
is not really helpful.

> -    vdc->realize = virtio_gpu_virgl_device_realize;
> -    vdc->reset = virtio_gpu_virgl_reset;
> +    vdc->realize = virtio_gpu_gl_device_realize;
> +    vdc->reset = NULL;
>       device_class_set_props(dc, virtio_gpu_gl_properties);
>   }


> @@ -737,9 +752,9 @@ void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>           return;
>       }
>   
> -    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
> -    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
> -        virtio_gpu_virgl_get_num_capsets(g);
> +    gpudev->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);

Or:

        VIRTIO_DEVICE(gpudev)->conf.flags |= (1 << 
VIRTIO_GPU_FLAG_VIRGL_ENABLED);

> +    VIRTIO_GPU_BASE(gpudev)->virtio_config.num_capsets =
> +        virtio_gpu_virgl_get_num_capsets(gpudev);
>   
>       virtio_gpu_device_realize(qdev, errp);
>   }

Removing the NULL-inits:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

PD: I'd use "hw/display/virtio-gpu-virgl" patch prefix instead
of "gfxstream + rutabaga prep". You only start mentioning rutabaga
in the next patch. And the patches up to here could be applied
as virtio-gpu cleanup patches.

