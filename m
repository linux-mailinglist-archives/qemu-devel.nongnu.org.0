Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23441ACC8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 12:18:52 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVACJ-0003sF-Qa
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 06:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVA9p-0002Ze-QJ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:16:17 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:44422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVA9n-0006YF-KQ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 06:16:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 930311F438F3
Subject: Re: [PATCH 1/1] virtio-gpu: CONTEXT_INIT feature
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
 <20210927144840.3661593-2-antonio.caggiano@collabora.com>
 <20210928051358.qlyssfoyrslm7544@sirius.home.kraxel.org>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
Message-ID: <fd389acb-1055-acf0-5d9c-1ab3857fe906@collabora.com>
Date: Tue, 28 Sep 2021 12:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928051358.qlyssfoyrslm7544@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/21 07:13, Gerd Hoffmann wrote:
>> @@ -212,6 +212,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
>>           features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>>       }
>>   
>> +    features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> 
> This needs a config option, simliar to the other features.  It is a
> guest-visible change so we must be able to turn it off for live
> migration compatibility reasons.  We also need a compat property to
> turn it off by default for 6.1 + older machine types.

Could you give me a hint on how to add this compat property?



>> +    if (cc.context_init) {
>> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
>> +                                                 cc.context_init,
>> +                                                 cc.nlen,
>> +                                                 cc.debug_name);
> 
> This requires a minimum virglrenderer version I guess?


Definitely, that is going to be >= 0.9.0



>> --- a/include/standard-headers/linux/virtio_gpu.h
>> +++ b/include/standard-headers/linux/virtio_gpu.h
> 
> Separate patch please.
> Also use scripts/update-linux-headers.sh for this.
Well, then I believe we will need to wait for this patch series:

https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg367531.html





Cheers,

Antonio

