Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEE5EC028
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:53:10 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8D7-0004uO-WC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1od857-0002hE-VM
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:44:53 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmitry.osipenko@collabora.com>)
 id 1od855-0008VY-Qt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:44:53 -0400
Received: from [192.168.2.145] (unknown [109.252.124.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 88309660225F;
 Tue, 27 Sep 2022 11:44:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664275488;
 bh=NUjwFfrNUsxukYdLmPl/lMBBFn6OuCAz0zsmZHV91c8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XNHcQhc34eJl6rBTQ8KcvfETTb6iHxSPN1HIVcr4OiQIaZ2YyeFqxISAVH+gVpFBE
 0U0jpO1AfjwkKsCqEbSNjNfoKTIeVx5clbeVhlNXdoz4nUh3IUh5/ZraR/Z2UJMUNz
 hJNFPhuSuqwfp1lcoA0sIqC1WR9lyLhhRmGmlVxhitZqE5aZ3HBvN5TM50a7VejCkS
 UNM45r9yT4CasjIZN2gi0TszgdurgvLsqvh8fTZ9E4ZriDIShuZr2Y8sz8yHqpq0ue
 eEIlCCHk7/D+th7fcKHkV+dzuW4hqL6YCAfW7xZlx8IzQWY8SrdMXGtFCzE8bi2mSU
 Js8ElN7fs+o0Q==
Message-ID: <63cc34e3-5244-e7a2-3605-ab60d159f853@collabora.com>
Date: Tue, 27 Sep 2022 13:44:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 4/4] virtio-gpu: Don't require udmabuf when blob
 support is enabled
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Antonio Caggiano <antonio.caggiano@collabora.com>, qemu-devel@nongnu.org, 
 gert.wollny@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-5-antonio.caggiano@collabora.com>
 <20220923123219.ofn2ygm4knljo6w2@sirius.home.kraxel.org>
 <6fe0d770-1a95-3d8f-6a75-a596f26aad54@collabora.com>
 <20220927083225.gdgo6tkv4ssw73yd@sirius.home.kraxel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220927083225.gdgo6tkv4ssw73yd@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=dmitry.osipenko@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 11:32, Gerd Hoffmann wrote:
> On Mon, Sep 26, 2022 at 09:32:40PM +0300, Dmitry Osipenko wrote:
>> On 9/23/22 15:32, Gerd Hoffmann wrote:
>>> On Tue, Sep 13, 2022 at 12:50:22PM +0200, Antonio Caggiano wrote:
>>>> From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>
>>>> Host blobs don't need udmabuf, it's only needed by guest blobs. The host
>>>> blobs are utilized by the Mesa virgl driver when persistent memory mapping
>>>> is needed by a GL buffer, otherwise virgl driver doesn't use blobs.
>>>> Persistent mapping support bumps GL version from 4.3 to 4.5 in guest.
>>>> Relax the udmabuf requirement.
>>>
>>> What about blob=on,virgl=off?
>>>
>>> In that case qemu manages the resources and continued to require
>>> udmabuf.
>>
>> The udmabuf is used only by the blob resource-creation command in Qemu.
>> I couldn't find when we could hit that udmabuf code path in Qemu because
>> BLOB_MEM_GUEST resource type is used only by crosvm+Venus when crosvm
>> uses a dedicated render-server for virglrenderer.
> 
> Recent enough linux guest driver will use BLOB_MEM_GUEST resources
> with blob=on + virgl=off

I reproduced this case today using "-device
virtio-gpu-device,blob=true". You're right, it doesn't work without udmabuf.

[    8.369306] virtio_gpu_dequeue_ctrl_func: 90 callbacks suppressed
[    8.369311] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1200 (command 0x105)
[    8.371848] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1205 (command 0x104)
[    8.373085] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1200 (command 0x105)
[    8.376273] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1205 (command 0x104)
[    8.416972] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1200 (command 0x105)
[    8.418841] [drm:virtio_gpu_dequeue_ctrl_func] *ERROR* response
0x1205 (command 0x104)

I see now why you're wanting to keep the udmabuf requirement for
blob=on,virgl=off.


>>   - /dev/udmabuf isn't accessible by normal user
>>   - udmabuf driver isn't shipped by all of the popular Linux distros,
>> for example Debian doesn't ship it
> 
> That's why blob resources are off by default.
> 
>> Because of all of the above, I don't think it makes sense to
>> hard-require udmabuf at the start of Qemu. It's much better to fail
>> resource creation dynamically.
> 
> Disagree.  When virgl/venus is enabled, then yes, qemu would let
> virglrenderer manage resources and I'm ok with whatever requirements
> virglrenderer has.  When qemu manages resources by itself udmabuf is
> a hard requirement for blob support though.

Let's try to relax the udmabuf requirement only for blob=on,virgl=on.
I'll update this patch.

Thank you very much for the review!

-- 
Best regards,
Dmitry


