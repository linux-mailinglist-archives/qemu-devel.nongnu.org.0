Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42306FD8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:57:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwegQ-0004EI-3d; Wed, 10 May 2023 03:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwegO-0004Dg-W5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:56:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwegN-00039Z-Et
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:56:20 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso7196605e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683705378; x=1686297378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ln0GzJr/qmUSjR1rY/eCIrEKSKMOjE5voMlBHEqu6zo=;
 b=Sgk0/woeZK9cpvIP/QKgH8keFq73zxwJlnl+a7rIUO2rEd9vC08khvVUVvRW3O0ZcA
 NT86dfzKG+HIASuS1T3x5tfLQJbsUsxfCsm0UzUTh4igmj5QpyJroSlCmfeepNRM+3zy
 HCrt9eElF8N7H6h6cTc6Z4yIexTbHt8cVW6/4biy4bGFyEmr4i/9DCY8/UIynt0mBgmc
 yIWoufAE08c/z4zHgv7ovoareXHJKO32McNoMwxVffEYbwUAxVQOdU9umWVOQVyCzgB9
 OdagPYPyWhTFTxbpq47gY3EtQHwvXQNQtyRLfpkviJ1npUZLzJ3BwX6vSoRmoXVzawab
 b/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683705378; x=1686297378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ln0GzJr/qmUSjR1rY/eCIrEKSKMOjE5voMlBHEqu6zo=;
 b=l8MGn31uaJhpYM4SZ3xi2cBa6LPu/aXRQZezCJoQwZd790bW4GHUxVJRsLqxiGR3z1
 EmYJBOyyW+u1IIc9AqK+N3a3d9yW2wpBI9piq4bklUeLQfBZ+hJCCpsqiZkU8xOy/vLU
 g1D/j0qB7Fzn928h3Mo2C3XiCKt1jB7TB6aY7+h40cvL3egK9KvzW03bFyd3iDIWun/M
 Df0BizDqlUq7OEbY0uCg5+NSTwFtmJ6C4ZTYGRHlhCAkZu4lDZu40yUiVt1oGdpNTimt
 RyAD+rMLf/Z+x4DMhzOtFBxxFu1O0JOgDfihrPr36GKiivuTVLiz/p/DLWiPuSSC9i+O
 jWJQ==
X-Gm-Message-State: AC+VfDxWFCyUZF6i5raX6wcODS/sRECVuGmjdlRDhNmM1gX6ZG+AxITu
 XdWBXw5GTdXQovYom+0eq5okRA==
X-Google-Smtp-Source: ACHHUZ5SNzEABN1yqQl09jmkv3WkM+Hs6z23bDyaOhDrlbcnShx/Ha/ikyGvP0haKlcyhA8SVCdY+g==
X-Received: by 2002:a7b:cd09:0:b0:3f1:80a7:bfb2 with SMTP id
 f9-20020a7bcd09000000b003f180a7bfb2mr11172861wmj.32.1683705377769; 
 Wed, 10 May 2023 00:56:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003f182a10106sm22021688wmj.8.2023.05.10.00.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:56:17 -0700 (PDT)
Message-ID: <cbd2a5b1-49d6-09c3-ee1e-3fbce5ed91b0@linaro.org>
Date: Wed, 10 May 2023 09:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/5] hw/display/virtio-gpu-virgl: define callbacks in
 realize function
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
 <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 30/4/23 23:48, Bernhard Beschow wrote:
> 
> 
> Am 28. April 2023 16:48:21 UTC schrieb Gurchetan Singh <gurchetansingh@chromium.org>:
>> From: Gurchetan Singh <gurchetansingh@chromium.org>
>>
>> This reduces the amount of renderer backend specific needed to
>> be exposed to the GL device.  We only need one realize function
>> per renderer backend.
>>
>> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> v1: - Remove NULL inits (Philippe)
>>     - Use VIRTIO_GPU_BASE where possible (Philippe)
>> v2: - Fix unnecessary line break (Akihiko)
>>
>> hw/display/virtio-gpu-gl.c     | 15 ++++++---------
>> hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++----------
>> include/hw/virtio/virtio-gpu.h |  7 -------
>> 3 files changed, 31 insertions(+), 26 deletions(-)


>> void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>> {
>> -    VirtIOGPU *g = VIRTIO_GPU(qdev);
>> +    VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
>> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
>> +
>> +    VirtIOGPUBase *bdev = VIRTIO_GPU_BASE(qdev);
>> +    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_GET_CLASS(bdev);
>> +
>> +    VirtIOGPU *gpudev = VIRTIO_GPU(qdev);
>> +    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(gpudev);
>> +
>> +    vbc->gl_flushed = virtio_gpu_virgl_flushed;
>> +    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
>> +    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
>> +    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
>> +
>> +    vdc->reset = virtio_gpu_virgl_reset;
> 
> A realize method is supposed to modify a single instance only while we're modifying the behavior of whole classes here, i.e. will affect every instance of these classes. This goes against QOM design principles and will therefore be confusing for people who are familiar with QOM in particular and OOP in general. I think the code should be cleaned up in a different way if really needed.

Doh I was too quick and totally missed this was an instance,
thanks for being careful Bernhard!

