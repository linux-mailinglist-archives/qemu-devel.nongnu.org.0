Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB666BC0B5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:16:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcaKj-00057s-NJ; Wed, 15 Mar 2023 19:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pcaKg-00057M-CS
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:14:58 -0400
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pcaKd-0003HD-OA
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:14:57 -0400
Received: from [192.168.2.157] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C7566602097;
 Wed, 15 Mar 2023 23:14:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678922091;
 bh=kfbQvx/fSEJBURTbw+/HXV8hkAheOenZMDFc7GsHgaA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TAsmnXa90YaFQQOG4k9koeZ3LR5Ie8vvLmANBMhpXuM5wFSm6KGVPa9zHNsMQio5n
 2LEwXOACKu0vD0XTtAQO6eoQtlNKJRfhDF55FomfLvig1hogjFctUD6zx2C2uFTZB2
 gvbJx0psCt0B90Hc3ndt3flaGdSuArzw3zHap1uh68BuOi1hv6sQNaF1B/a3liZlJN
 EBgG2wI2C0XhYJF6Yru7DMurnjQGGyk6lwrFAMXEZhbI0euGu4GCdTOHrlT65p7ODh
 FMk1ayFUiLtKkwepYML19bsKMB3qJM+qGMYBSJITCA+LrFvkaJYecxmBC3fJ/sHjdp
 0IaLGcZuFqWmg==
Message-ID: <53c25304-bc30-b5af-846e-b247aab67be9@collabora.com>
Date: Thu, 16 Mar 2023 02:14:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
 <ZA9HWRYxPUk1OeGe@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZA9HWRYxPUk1OeGe@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/13/23 18:55, Huang Rui wrote:
> On Mon, Mar 13, 2023 at 01:51:03AM +0800, Dmitry Osipenko wrote:
>> On 3/12/23 12:22, Huang Rui wrote:
>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>
>>> Request Venus when initializing VirGL.
>>>
>>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>>> ---
>>>  hw/display/virtio-gpu-virgl.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>>> index fe03dc916f..f5ce206b93 100644
>>> --- a/hw/display/virtio-gpu-virgl.c
>>> +++ b/hw/display/virtio-gpu-virgl.c
>>> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>>  {
>>>      int ret;
>>>  
>>> +#ifdef VIRGL_RENDERER_VENUS
>>> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
>>> +#else
>>>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
>>> +#endif
>>
>> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
>> set. Please test the patches with the latest virglrenderer and etc.
>>
>> The #ifdef also doesn't allow adding new flags, it should look like:
>>
>> #ifdef VIRGL_RENDERER_VENUS
>>     flags |= VIRGL_RENDERER_RENDER_SERVER;
>> #endif
>>
>>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> 
> In fact, we have rebased to the latest virglrenderer:
> 
> We check both VIRGL_RENDERER_RENDER_SERVER or VIRGL_RENDERER_VENUS in
> virglrenderer, alternative of them works.
> 
> https://gitlab.freedesktop.org/rui/virglrenderer/-/commit/c1322a8a84379b1ef7939f56c6761b0114716f45

All the extra changes you made to virglrenderer that Qemu depends on
need to go upstream. Please open all the relevant merge requests. Thanks!

-- 
Best regards,
Dmitry


