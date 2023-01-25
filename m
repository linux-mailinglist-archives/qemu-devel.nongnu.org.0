Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1D67C08C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:01:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKokI-00022X-BY; Wed, 25 Jan 2023 17:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKokF-00022N-DY
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:59:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKokD-0002HP-FA
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 17:59:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso56542wms.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dTJiZGN7IM1TGcu2FzqrQUW/4q0B2eS/x/LwLTuMGg=;
 b=Hu9WboM70U+ng5jm2wA8zD0O+GTSbl9c72Ae7mmteSGlLw6gFrbN+syN0gDbQq9jjK
 5CdlZjpkDj0EHnMvTRUdAn/FUDuOEfsovLxu0PTwwqLN79d9mDUjb2bkPmiRVp7SMHhU
 1/hPBk06aXrFR4phSkYIFTzAW3s05OtW94+tqLHUlU7U0dQIBr6S6Nxo59JF6VNWPrcR
 ZMNnjptfGAL3WuRxRLue5oTrR6ppRGOIrYvolxEp0ZHgvZK7hO42IW/V+he8gtLJPS0u
 9gdfdfNRAjkFgi58GK+Y7o65jWo+MnwavkHmJBhtHGpzD3LlH5zQfvSEnJ7Iqlmjgj2J
 2+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dTJiZGN7IM1TGcu2FzqrQUW/4q0B2eS/x/LwLTuMGg=;
 b=SxFKKoMAXvdmBHaqba/gm+8iGzDBDqEvnBX+UoYHkkVGtuQ3Lli4Zyalb7wOL2OEuV
 P1QP48aje6jQbSKJmrtAXrVkjj9X+BawoPfQDhTKnEVa1C1T++TFk2gESyD49qdmVZdp
 FMwlvt5z0wJwpcQaRVBnBF7JRV/tUi1tiw9B/5jq4vO7XxOgMqqTkCQj5Qk1pwqfqXYk
 OsCnvfXgjEG8WXDtREA7CnLEW7vEEbIY8gRxVXRz4DuyYwitk48QN2z3jsJaXDkfZICM
 nY9TFy/4JCPvU8K/uPignwSPr7an7dDLIp+SYtYJfgO6drE6SYPyJi9OALb/YiSWKIZn
 0LVQ==
X-Gm-Message-State: AFqh2krksE0u8+fMRzT/TeBGMiphm+rbLukojWrjqema/0xq9uLLi9e2
 m8ENIqHGMARXIP7Roa6/MpSGZw==
X-Google-Smtp-Source: AMrXdXt5kkKnXWiu24bHOo+rgY1Pyx44R8PAHSh/XuuJxEVm1eXCdcuQXLw1FQMnqxp1y2dliMd/9A==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id
 c18-20020a05600c171200b003d9a145091amr33196886wmn.28.1674687590639; 
 Wed, 25 Jan 2023 14:59:50 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a05600c499800b003dc1a525f22sm2918005wmp.25.2023.01.25.14.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 14:59:50 -0800 (PST)
Message-ID: <1294362f-4359-949e-3673-6198a78310be@linaro.org>
Date: Wed, 25 Jan 2023 23:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v4 01/10] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-2-vikram.garhwal@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125085407.7144-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 25/1/23 09:53, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 
> diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> index 213e2e82b3..cfdbfdcbcb 100644
> --- a/hw/i386/meson.build
> +++ b/hw/i386/meson.build
> @@ -33,5 +33,6 @@ subdir('kvm')
>   subdir('xen')
>   
>   i386_ss.add_all(xenpv_ss)
> +i386_ss.add_all(xen_ss)
>   
>   hw_arch += {'i386': i386_ss}
> diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
> index be84130300..2fcc46e6ca 100644
> --- a/hw/i386/xen/meson.build
> +++ b/hw/i386/xen/meson.build
> @@ -1,6 +1,5 @@
>   i386_ss.add(when: 'CONFIG_XEN', if_true: files(
>     'xen-hvm.c',
> -  'xen-mapcache.c',
>     'xen_apic.c',
>     'xen_platform.c',
>     'xen_pvdevice.c',
> diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
> index 5d6be61090..a0c89d91c4 100644
> --- a/hw/i386/xen/trace-events
> +++ b/hw/i386/xen/trace-events
> @@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
>   cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
>   
> -# xen-mapcache.c
> -xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> -xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> -xen_map_cache_return(void* ptr) "%p"
> -
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index ae0ace3046..19d0637c46 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -22,3 +22,7 @@ else
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> +
> +xen_ss = ss.source_set()
> +
> +xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))

Can't we add it to softmmu_ss directly?

> diff --git a/hw/xen/trace-events b/hw/xen/trace-events
> index 3da3fd8348..2c8f238f42 100644
> --- a/hw/xen/trace-events
> +++ b/hw/xen/trace-events
> @@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
>   xs_node_vscanf(char *path, char *value) "%s %s"
>   xs_node_watch(char *path) "%s"
>   xs_node_unwatch(char *path) "%s"
> +
> +# xen-mapcache.c
> +xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
> +xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
> +xen_map_cache_return(void* ptr) "%p"
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> similarity index 100%
> rename from hw/i386/xen/xen-mapcache.c
> rename to hw/xen/xen-mapcache.c


