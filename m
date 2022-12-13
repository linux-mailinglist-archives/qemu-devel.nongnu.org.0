Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6564B0F8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:23:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50Yx-0002Gd-Qt; Tue, 13 Dec 2022 03:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p50YO-0002Ev-3r
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:22:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p50YI-0000Ww-Fg
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:22:18 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so459249wmb.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+svhhmrQ2JZIwz0HIhMrY9JRUpi8arz9FGzMpWlfe1A=;
 b=vs1XPQ2Rojzh7YqwFt7kO7pS4utx2/EjjBYEEyKjpx/nUzI92Sh0YPcyhi1RTybsck
 jpn8BKxMU7OpFmm31hejUUDsGMyHnGnk3G23YndsHOqn6Ry7Ee4AsewslfbEPm+DYrQh
 YBbaTTPSSG/fAGmX485gI/bWQy2RntWqGJwMhXSvw1Ypmf8OODgE/aVRz1N8ubcDXR69
 wdr4kdj7V9RF3VvrbWcPpO17b77bXqmFA+vaFi5QiqmChDsLLZ9+jimGtFvE2uDLiGQ3
 mg+p/yiW1LMDtNqrWzx84QX1T7LlXqLW3TGSoYsn1Ppw28m6XBjtH+2rvpD3hw3VXx0e
 SP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+svhhmrQ2JZIwz0HIhMrY9JRUpi8arz9FGzMpWlfe1A=;
 b=Cxk00f5zEuLnP/MOE6Vck8otRCgmbJPcJHHNLxgEi2nc9NkdeKpgFn9NZyqvHz8wLS
 ocwLcnzzlPPKnqT9N1Svf2ajsBrzIWfTdkuTlxusdYpkS8zFTmdecqtwKwPb7g/7WK4M
 sKgKsRd9s87w+nvHyZpHOFOxWqq8roKznwox+gS+a/HYv8Y9LQWHS5z7a8aEE+QUy1jP
 zhE6D+gpk7bbK6kaiUyGGVyxXn2oafDH5QW+kJ3424EGJNRoX5yi0umxjMt/tH2GjBGQ
 dLhQChZoIMYmVFYUASG2cnXjvur40V6Zi+ofPpIxSnRnu7ZNLQladNTGZHkM9WgNRaNM
 8m8A==
X-Gm-Message-State: ANoB5pltWJqhM34pI8eypHS7DXXQ5A34BImvpvz4N3tTV7nzNWfY2kTC
 7WdTDpOMmJkRGiz331gPpUPVrQ==
X-Google-Smtp-Source: AA0mqf605OHR3F0uXKZeMzxqP0xGDWwITb4hZb9XYtG6UV/4PPRUE4LRqTs3f5sIX5R3hXyPvSxr2A==
X-Received: by 2002:a05:600c:3508:b0:3c6:e63e:816f with SMTP id
 h8-20020a05600c350800b003c6e63e816fmr13909659wmq.38.1670919732868; 
 Tue, 13 Dec 2022 00:22:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j41-20020a05600c1c2900b003b4ff30e566sm1705084wms.3.2022.12.13.00.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:22:12 -0800 (PST)
Message-ID: <262be425-f94e-e3a4-02ca-3c0b2a555ac9@linaro.org>
Date: Tue, 13 Dec 2022 09:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
 <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
 <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
In-Reply-To: <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 13/12/22 08:30, Philippe Mathieu-Daudé wrote:
> On 13/12/22 01:14, Richard Henderson wrote:
>> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>>> The device endianness doesn't change during runtime.
>>
>> What are you talking about?  Of course it does.
> 
> The host CPU certainly does, but the virtio device doesn't... Does it?
> 
> This check only consider the device, not the CPU:
> 
>      bool virtio_access_is_big_endian(VirtIODevice *vdev)
>      {
>      #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>          return virtio_is_big_endian(vdev);
>      #elif TARGET_BIG_ENDIAN
>          if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>              /*Devices conforming to VIRTIO 1.0 or later are always LE.*/
>              return false;
>          }
>          return true;
>      #else
>          return false;
>      #endif
>      }
> 
>      static inline bool virtio_is_big_endian(VirtIODevice *vdev)
>      {
>          if (!virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>              assert(vdev->device_endian != VIRTIO_DEVICE_ENDIAN_UNKNOWN);
>              return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_BIG;
>          }
>          /* Devices conforming to VIRTIO 1.0 or later are always LE. */
>          return false;
>      }
> 
> and once the features are negotiated it doesn't seem to change.

Per the spec, if the device changes its endianness, it must set the
VIRTIO_CONFIG_S_NEEDS_RESET bit:

   3.2.1 Notification of Device Configuration Changes

   For devices where the device-specific configuration information
   can be changed, a configuration change notification is sent when
   a device-specific configuration change occurs.
   In addition, this notification is triggered by the device setting
   DEVICE_NEEDS_RESET

However QEMU doesn't read this bit, only sets it:

hw/virtio/virtio.c:3551:        vdev->status = vdev->status | 
VIRTIO_CONFIG_S_NEEDS_RESET;
include/standard-headers/linux/virtio_config.h:44:#define 
VIRTIO_CONFIG_S_NEEDS_RESET   0x40

>> I mean, it doesn't often in practice, because the Linux kernel is 
>> compiled for one endianness and doesn't keep toggling state, but the 
>> hooks that you're replacing test for the *current* endianness state of 
>> the cpu.  So this is a behaviour change.
> 
> I agree. Note however currently the CPU endianness is only checked once
> upon virtio device reset (or from a migration stream):
> 
>      void virtio_reset(void *opaque)
>      {
>          VirtIODevice *vdev = opaque;
>          VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>          int i;
> 
>          virtio_set_status(vdev, 0);
>          if (current_cpu) {
>              /* Guest initiated reset */
>              vdev->device_endian = virtio_current_cpu_endian();
>          } else {
>              /* System reset */
>              vdev->device_endian = virtio_default_endian();
>          }
> 
>      bool cpu_virtio_is_big_endian(CPUState *cpu)
>      {
>          CPUClass *cc = CPU_GET_CLASS(cpu);
> 
>          if (cc->sysemu_ops->virtio_is_big_endian) {
>              return cc->sysemu_ops->virtio_is_big_endian(cpu);
>          }
>          return target_words_bigendian();
>      }
> 
> ARM being the single arch implementing a runtime endianness check:
> 
>      static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>      {
>          ARMCPU *cpu = ARM_CPU(cs);
>          CPUARMState *env = &cpu->env;
> 
>          cpu_synchronize_state(cs);
>          return arm_cpu_data_is_big_endian(env);
>      }

virtio_reset() is only called by virtio_bus_reset().

$ git grep -w virtio_bus_reset
hw/s390x/virtio-ccw.c:256:    virtio_bus_reset(&dev->bus);
hw/virtio/virtio-bus.c:102:void virtio_bus_reset(VirtioBusState *bus)
hw/virtio/virtio-mmio.c:75:    virtio_bus_reset(&proxy->bus);
hw/virtio/virtio-pci.c:1998:    virtio_bus_reset(bus);

So the result of virtio_access_is_big_endian() is only updated there,
after a virtio_bus_reset() call, and IIUC  isn't dependent on the CPU
endianness state, thus can be cached in VirtIODevice. But maybe the
current implementation is incomplete and my change is simply making
it worst...

