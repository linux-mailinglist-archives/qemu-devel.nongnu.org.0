Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037CB6B6D6E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 03:23:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbXpa-00006l-Vq; Sun, 12 Mar 2023 22:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbXpZ-00006b-IQ
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:22:33 -0400
Received: from madras.collabora.co.uk ([46.235.227.172])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1pbXpX-0004pD-Ld
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 22:22:33 -0400
Received: from [192.168.2.203] (109-252-120-116.nat.spd-mgts.ru
 [109.252.120.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F1AD6602FE3;
 Mon, 13 Mar 2023 02:22:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678674148;
 bh=8FllFrdYrwtSMdW711zen6F0H+nS+oSqdNhmJeRaVxU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=RMtEFfZuecbn5B+NLJhj9dOAHxXw/7wgY6w0ef4WzWmvHIICTxPxDzJdHh60qLpKA
 pJ1WmO4eXb9NW6OJkl97njHBvAyUsrWJu3Sod2wDIsCJaG22Ejk8/FqmbGUKaATgye
 jRqfgLnjfWz9iesYv3RLSKa1I/fgvTD2Cn7cd0eME6x8dYhAUwFNAwnkgPixP/RtSv
 Da/zPW8Iz8+4F0hqS3Zbvc0DtL0tqQoaaARZZ2ZcjrBAYpbKgL2Z04jRnBPbfgcvkD
 EGYwyVwE0yc2hBzqo+xPZgl7NaLnvP3s/nOLjByTjcq2cNzMNhCmKz0c0e++DE8wYr
 Eoz3BqCYIW04g==
Message-ID: <d6f31fd0-bc04-79a5-266b-5e6ba7bf2a03@collabora.com>
Date: Mon, 13 Mar 2023 05:22:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC QEMU PATCH 08/18] virtio-gpu: Initialize Venus
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230312092244.451465-1-ray.huang@amd.com>
 <20230312092244.451465-9-ray.huang@amd.com>
 <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
In-Reply-To: <68195782-0309-2f81-7f1f-84a7fe7bb05c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.235.227.172;
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

On 3/12/23 20:51, Dmitry Osipenko wrote:
> On 3/12/23 12:22, Huang Rui wrote:
>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>
>> Request Venus when initializing VirGL.
>>
>> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
>> ---
>>  hw/display/virtio-gpu-virgl.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
>> index fe03dc916f..f5ce206b93 100644
>> --- a/hw/display/virtio-gpu-virgl.c
>> +++ b/hw/display/virtio-gpu-virgl.c
>> @@ -803,7 +803,11 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
>>  {
>>      int ret;
>>  
>> +#ifdef VIRGL_RENDERER_VENUS
>> +    ret = virgl_renderer_init(g, VIRGL_RENDERER_VENUS, &virtio_gpu_3d_cbs);
>> +#else
>>      ret = virgl_renderer_init(g, 0, &virtio_gpu_3d_cbs);
>> +#endif
> 
> Note that Venus now requires VIRGL_RENDERER_RENDER_SERVER flag to be
> set. Please test the patches with the latest virglrenderer and etc.
> 
> The #ifdef also doesn't allow adding new flags, it should look like:
> 
> #ifdef VIRGL_RENDERER_VENUS
>     flags |= VIRGL_RENDERER_RENDER_SERVER;
> #endif
> 
>     ret = virgl_renderer_init(g, flags, &virtio_gpu_3d_cbs);
> 

BTW, Alex reviewed the Venus v3 patches a month ago [1] and the review
comments need to be addressed. AFAICS, you're actually using the very
old Venus patches here that stopped working about a year ago, so again
you're using a very outdated virglrenderer version.

Please take it all into account if you'll beat me to posting the next
version of Venus patches ;)

[1]
https://lore.kernel.org/qemu-devel/20220926142422.22325-1-antonio.caggiano@collabora.com/

-- 
Best regards,
Dmitry


