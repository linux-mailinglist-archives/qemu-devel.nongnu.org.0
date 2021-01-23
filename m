Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3867430161F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 16:00:13 +0100 (CET)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KOa-0005B6-9f
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 10:00:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3KNQ-0004IC-Fd
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:59:00 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:54453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l3KNO-0001BG-Gx
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:59:00 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MhlCg-1lh2qa2TD6-00dlfe; Sat, 23 Jan 2021 15:58:52 +0100
Subject: Re: [PATCH] virtio-mmio: fix guest kernel crash with SHM regions
To: qemu-devel@nongnu.org
References: <20201220163539.2255963-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f524b492-a185-8de8-ea26-ce513fbe98d2@vivier.eu>
Date: Sat, 23 Jan 2021 15:58:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220163539.2255963-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:52vCH5kgPJabmJxoXBqm9J1rSlyxyhjbXNSV/8kYPVbkaA2e90T
 aRdM6DWoTW3QLtAaHOel+qDgxlil3kYK9Ywx4l5WgJ/tVFkMUg8R7nQ8ONHZntwSnDUjFgj
 WgFJs4oKkgrmyXhx4cvNw6eWr4+Bd54o3yYB/wycq/aHHEvjkZ6ae/mb00xiJz1NDBUVXJd
 sm6ZvzUewXVQ2wv17jLTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BzlMLbijCaU=:ePW3FzXYv3QWtTNymt6G9z
 tN5xcVG3BnVadIs0Ow1tkkVBGV13mZq64+4uwbxwwbmHqT16b+P5uQ84/NSN2O03notttupjN
 7sVwV8J5XfQmAKNyphySR7yRniJHjqFew4l/PWdE8yA1yi6BBhd0DnXU1c6mQQxhAqyhIeITm
 Qur+h986OyYY21RlHATjDt2zgm7e/PcCWWTxHzyvkB4zMtX4WxvDrVO3jJwYSS+Z70RIwkM6N
 mdF/TAWO1Z3vSMMTgDr+laI/CDlZhDzi05BchzsMrP2/cnTzkrMzX1ppglhAE9BLvQuhLsIuE
 FNE6aq/gZ5J9DOpBCMnJCm44trO+3w4NdN4AglVrRcHn2AKPjPKhVrMzluhQrGAYxANKrTiMq
 NPkFnGBgZ/TZyrd1yQyOoHREr+hgO5dz/Sv4r9lfOy/TCHkR1cUkJxe/2DIL1
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Anyone to merge this?

Thanks,
Laurent

Le 20/12/2020 à 17:35, Laurent Vivier a écrit :
> In the kernel, virtio_gpu_init() uses virtio_get_shm_region()
> since
> commit 6076a9711dc5 ("drm/virtio: implement blob resources: probe for host visible region")
> but vm_get_shm_region() unconditionally uses VIRTIO_MMIO_SHM_SEL to
> get the address and the length of the region.
> 
> commit 38e895487afc ("virtio: Implement get_shm_region for MMIO transport"
> 
> As this is not implemented in QEMU, address and length are 0 and passed
> as is to devm_request_mem_region() that triggers a crash:
> 
>   [drm:virtio_gpu_init] *ERROR* Could not reserve host visible region
>   Unable to handle kernel NULL pointer dereference at virtual address (ptrval)
> 
> According to the comments in the kernel, a non existent shared region
> has a length of (u64)-1.
> 
> This is what we return now with this patch to disable the region.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/virtio/virtio-mmio.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index e1b5c3b81e37..610661d6a526 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -191,6 +191,14 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>              return 0;
>          }
>          return vdev->generation;
> +   case VIRTIO_MMIO_SHM_LEN_LOW:
> +   case VIRTIO_MMIO_SHM_LEN_HIGH:
> +        /*
> +         * VIRTIO_MMIO_SHM_SEL is unimplemented
> +         * according to the linux driver, if region length is -1
> +         * the shared memory doesn't exist
> +         */
> +        return -1;
>      case VIRTIO_MMIO_DEVICE_FEATURES_SEL:
>      case VIRTIO_MMIO_DRIVER_FEATURES:
>      case VIRTIO_MMIO_DRIVER_FEATURES_SEL:
> 


