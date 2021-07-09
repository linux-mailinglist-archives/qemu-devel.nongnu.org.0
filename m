Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C453C2148
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:12:19 +0200 (CEST)
Received: from localhost ([::1]:45226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mYU-0007xq-E7
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mXL-00071V-0X; Fri, 09 Jul 2021 05:11:07 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:34701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mXI-0004cb-SS; Fri, 09 Jul 2021 05:11:06 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MF3U0-1lvCxQ2mhU-00FWuu; Fri, 09 Jul 2021 11:11:00 +0200
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210523094040.3516968-1-philmd@redhat.com>
 <d3198f6b-3bce-1686-2123-e1c44479bdf9@redhat.com>
 <5711b02d-5cc0-414c-eb5c-4e8a7f191088@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ed8c5bab-8921-c497-acd1-d7ceefd8ca7b@vivier.eu>
Date: Fri, 9 Jul 2021 11:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5711b02d-5cc0-414c-eb5c-4e8a7f191088@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cXH6m8DZ4cEMFtX97neDUlyfL1uEHposv1ryVVWLeCqRFcQQo74
 C+GC42D1eYnbWJ2FmSPPneGjIkC98BxMsnROpGcJr3HUG7vYtZG/jyIcuu5uzlMW2foT0va
 BqjyU+/pwWx+XvdP55JcJh8WgP9uoFheO46n4CXDN5Pnb+7af7/MIX9oxvQ8WLFPqIT6Ezc
 Mc2jmWXhT3/gXbm8nlJjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xl9EDk8rP58=:JnaqghsudpT9XaYcP0y9kv
 tsU5nV1P/0X0NuAXGe092oCQ0ugNvaB7puNqOtrlDGtk2aUkQvAXQtdVKx2UukspUbjRynF8o
 B2TVTqjeTbEq/CmTCTr0bI0Bv73cTJvGgJ0HIl1znP7LJscH4Hc/lkRHDPt7QVHXCPrpChBIA
 3SZVoQ4YRsJS+0IJui+I8RxcLN9NMovU8AVpYNXQzYSn2lyqS5mc0b/SZVTGhSmVh6UFTNVsv
 CqCvXrsk/98fJ19nkianJ4reBfEQLcAojtngAQx1dWRhorcjG98vApjgV3XljOSf4/zcwNq5n
 aOocJMwnSXPU2S8Px7SbvHvbZee5rmNjRP9+/NqRi+YWRZ6FHEANz5p+EivfABylIvI34NqM2
 q7Qp3QMKbGC/3Qfb4R/gp38J6RwqJ1WS/r4VF+NaBlNQgheco1tFsXV0TU0t4PyywRbP6gWFN
 dBjz0Nb1mXRr5FOxDi2MHlMvaaq1e0j7kub78P5JVqKE+tJp1vzNQokElA7GlZtWEs9EaeXVC
 gUvlpSWui7CoZoHxwdyyh78wYsVAyf4cjIz6hyr5vzPBsp+/2i8It1zakMQ+tKE4dIv34gwjc
 xE4F0FfbdVKB+4R2ZfwuVkQzPtkeDWUUciPkh9ayjTeH5OC8SbQkb1uouNmcVGWOVj+LJLVkc
 gJORjr+GN3noVdeZIaGgtwjVEKN3LDS9vY1++IU5rD+U/AXsBexl9kvRkBc12/VaBy/m7xR5H
 7oUPP4Qn1bq5xWrb46pf4EqFE/rDctwM7qr3kt6FlIOG198zfTSw8mZX3gzTUWt7LLO9ge7iQ
 vR8HR4UtV1FlV6Gv60VPt9Rh1aPQI4X8kXmfd+YLJkKOCYDOR8WfHWi1/CI4CEMqvZBHoZp
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/07/2021 à 12:04, Philippe Mathieu-Daudé a écrit :
> Hi Michael, since I asked a modification on v1, I suppose
> this patch is somehow worth in documentation, so I'm
> pinging again. It could go via qemu-trival if you ack it.
> 
> On 6/21/21 12:06 PM, Philippe Mathieu-Daudé wrote:
>> ping?

Applied to my trivial-patches branch.

Thanks,
Laurent


>> On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
>>> Such comments make reviewing this file somehow easier.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> v2: only one space before end of comment (mst)
>>> ---
>>>  hw/virtio/virtio.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>> index e02544b2df7..130e3568409 100644
>>> --- a/hw/virtio/virtio.c
>>> +++ b/hw/virtio/virtio.c
>>> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>>>      }
>>>  }
>>>  
>>> +/* Called within rcu_read_lock(). */
>>>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>>>  {
>>>      uint16_t old, new;
>>> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>>>      return vring_need_event(off, new, old);
>>>  }
>>>  
>>> +/* Called within rcu_read_lock(). */
>>>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>>>  {
>>>      VRingPackedDescEvent e;
>>>
>>
> 
> 


