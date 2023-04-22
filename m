Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7653E6EB9CC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 16:55:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEd7-0006sJ-3e; Sat, 22 Apr 2023 10:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqEd4-0006s8-Ls
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 10:54:22 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqEd2-0002ut-Hf
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 10:54:22 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b4960b015so2590507b3a.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682175258; x=1684767258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kupaHKNw2ZetCjR3GUfGipz76hFplnPWKHQzdqPvENY=;
 b=oTnEh4rUPg3xevHgV9gD1foIcHJcBhD8YZXkQUYC+dxrOG7VBhM9/nxIOUH3BWt1pW
 e5zEOWisrHNA6jIBYOyM/9vVA4bZsF2dwrek5cTLhlRMhZJTqcfVpaKTPNKCfewiKzXG
 cq/3iutDFTg0mvFH968FmQSt0tYbKcHVWdcgfHij0WNBqYZfG7ndtndmn/RfdD+yX0/n
 U8jE+TnE9d0XTas3FK/so4E0+bzL+uMZf2EtFg58OjIwbSqit6I69AzrToR2mfxdRdf7
 Kd52GlSGh3STVekm4zgg2nB4ZSRHmSFeC89Gd6JxFzzMJWPjrFDTmAYHyvJDIyFZOrst
 IM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682175258; x=1684767258;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kupaHKNw2ZetCjR3GUfGipz76hFplnPWKHQzdqPvENY=;
 b=eiOi0gy0sV9q+EPbPncLCORxcNaZSK0BV/HgLS9bc9r+3G2crJcXgblexs3KSmZUG5
 OKgfgE3pSRXKCBW4YSbaY/mNPmXjYLKK12rw3IiZtQfFY82ODWjeMyZGw0PPloh3aJV5
 sEikV12d8ZUghlv4YspnMArGqCBbs4Fuf8G4dLR/OZN6NUW0abqAg6OrzHbokD4afUFR
 h7WsGS2CaPWbZjdyIgHteZ6Vir/QIhK+ed0GMlex7ZjON7zQnP1qE4Lh2tpERZJ3yFUm
 28DpzU2pX5xwTH9Cw/gqdifxbToAPiBB9x0mFW1u2AyQwd+PYMU+udtIFiWVjAUT5gs6
 PGdQ==
X-Gm-Message-State: AAQBX9dcGodwrQwb8F93KBbIoBLSfxstVjEd14Dfe1HdPuUZu8b8Vg6c
 TNAjgcjfwFvdYQswWWGMhEs=
X-Google-Smtp-Source: AKy350Y35nzl7WlFKRC8UoIh6IOPTc9VknEJddKnV2E0CxNf/rszIOoyyRRHnrCfRetd6oXDSo5XlA==
X-Received: by 2002:a05:6a00:1411:b0:63f:1292:8a6b with SMTP id
 l17-20020a056a00141100b0063f12928a6bmr9227522pfu.5.1682175258364; 
 Sat, 22 Apr 2023 07:54:18 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a056a00212b00b0063f167b41bdsm3088869pfj.38.2023.04.22.07.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 07:54:17 -0700 (PDT)
Message-ID: <7c7b18d6-3fc1-0855-08a8-d28e1d47f037@gmail.com>
Date: Sat, 22 Apr 2023 23:54:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 08/13] gfxstream + rutabaga prep: added need
 defintions, fields, and options
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-9-gurchetansingh@chromium.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230421011223.718-9-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.047, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2023/04/21 10:12, Gurchetan Singh wrote:
> This modifies the common virtio-gpu.h file have the fields and
> defintions needed by gfxstream/rutabaga.  It also modifies VirtioGPUGL
> to have the runtime options needed by rutabaga.  They are:
> 
> - a colon separated list of capset names, defined in the virtio spec
> - a wayland socket path to enable guest Wayland passthrough
> 
> The command to run these would be:
> 
> -device virtio-vga-gl,capset_names=gfxstream:cross-domain, \
>          wayland_socket_path=/run/user/1000/wayland-0,hostmem=8G  \

It will be nice if it automatically determines the socket path according to:
https://wayland.freedesktop.org/docs/html/apb.html#Client-classwl__display_1af048371dfef7577bd39a3c04b78d0374

A documentation to set up cross-domain just like what you can find in 
the crosvm book* will also be helpful.
https://crosvm.dev/book/devices/wayland.html

> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>   hw/display/virtio-gpu-gl.c     | 2 ++
>   include/hw/virtio/virtio-gpu.h | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index 547e697333..15270b0c8a 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -29,6 +29,8 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
>   static Property virtio_gpu_gl_properties[] = {
>       DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_STATS_ENABLED, false),
> +    DEFINE_PROP_STRING("capset_names", VirtIOGPUGL, capset_names),
> +    DEFINE_PROP_STRING("wayland_socket_path", VirtIOGPUGL, wayland_socket_path),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 421733d751..a35ade3608 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -94,6 +94,7 @@ enum virtio_gpu_base_conf_flags {
>       VIRTIO_GPU_FLAG_DMABUF_ENABLED,
>       VIRTIO_GPU_FLAG_BLOB_ENABLED,
>       VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
> +    VIRTIO_GPU_FLAG_RUTABAGA_ENABLED,
>   };
>   
>   #define virtio_gpu_virgl_enabled(_cfg) \
> @@ -106,6 +107,8 @@ enum virtio_gpu_base_conf_flags {
>       (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>   #define virtio_gpu_blob_enabled(_cfg) \
>       (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_rutabaga_enabled(_cfg) \
> +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_RUTABAGA_ENABLED))
>   #define virtio_gpu_hostmem_enabled(_cfg) \
>       (_cfg.hostmem > 0)
>   #define virtio_gpu_context_init_enabled(_cfg) \
> @@ -217,6 +220,11 @@ struct VirtIOGPUGL {
>   
>       bool renderer_inited;
>       bool renderer_reset;
> +
> +    char *capset_names;
> +    char *wayland_socket_path;
> +    uint32_t num_capsets;
> +    void *rutabaga;

I prefer to have a line:
struct rutabaga;

In virtio-gpu.h and use it here. Perhaps it may be a bit weird to have 
such a declaration in a renderer-independent file, but it's practically 
harmless, can prevent something rouge from being assigned to the member, 
and allows to use the variable without annoying casts.

>   };
>   
>   struct VhostUserGPU {

