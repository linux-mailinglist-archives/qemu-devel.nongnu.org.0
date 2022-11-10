Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C333624BFA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEFr-0004Gw-Hq; Thu, 10 Nov 2022 15:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1otEFp-0004Ge-2w; Thu, 10 Nov 2022 15:34:29 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1otEFn-0003Sy-59; Thu, 10 Nov 2022 15:34:28 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1otEFC-0007yw-2b; Thu, 10 Nov 2022 21:33:50 +0100
Message-ID: <79cdedf6-49a3-2899-86a6-555540a17ce6@maciej.szmigiero.name>
Date: Thu, 10 Nov 2022 21:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US, pl-PL
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-7-peter.maydell@linaro.org>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH for-8.0 6/9] hw/hyperv/vmbus: Use device_cold_reset() and
 bus_cold_reset()
In-Reply-To: <20221104161513.2455862-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 4.11.2022 17:15, Peter Maydell wrote:
> In the vmbus code we currently use the legacy functions
> qdev_reset_all() and qbus_reset_all().  These perform a recursive
> reset, starting from either a qbus or a qdev.  However they do not
> permit any of the devices in the tree to use three-phase reset,
> because device reset goes through the device_legacy_reset() function
> that only calls the single DeviceClass::reset method.
> 
> Switch to using the device_cold_reset() and bus_cold_reset()
> functions.  These also perform a recursive reset, where first the
> children are reset and then finally the parent, but they use the new
> (...in 2020...) Resettable mechanism, which supports both the old
> style single-reset method and also the new 3-phase reset handling.
> 
> This should be a no-behaviour-change commit which just reduces the
> use of a deprecated API.
> 
> Commit created with:
>    sed -i -e 's/qdev_reset_all/device_cold_reset/g;s/qbus_reset_all/bus_cold_reset/g' hw/hyperv/*.c
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/hyperv/vmbus.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
> index 30bc04e1c4c..f345f310b0f 100644
> --- a/hw/hyperv/vmbus.c
> +++ b/hw/hyperv/vmbus.c
> @@ -1578,7 +1578,7 @@ static bool vmbus_initialized(VMBus *vmbus)
>   
>   static void vmbus_reset_all(VMBus *vmbus)
>   {
> -    qbus_reset_all(BUS(vmbus));
> +    bus_cold_reset(BUS(vmbus));
>   }
>   
>   static void post_msg(VMBus *vmbus, void *msgdata, uint32_t msglen)
> @@ -2035,7 +2035,7 @@ static void vdev_reset_on_close(VMBusDevice *vdev)
>       }
>   
>       /* all channels closed -- reset device */
> -    qdev_reset_all(DEVICE(vdev));
> +    device_cold_reset(DEVICE(vdev));
>   }
>   
>   static void handle_close_channel(VMBus *vmbus, vmbus_message_close_channel *msg,

Resetting a guest with VMBus still works fine with this patch, so:
Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Thanks,
Maciej


