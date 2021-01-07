Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431552ECB61
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 09:04:16 +0100 (CET)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxQHH-0004x4-C4
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 03:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kxQFw-00047K-OK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:02:52 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kxQFu-00073O-Gz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 03:02:52 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyKYE-1k39Pb2rs4-00ykye; Thu, 07 Jan 2021 09:02:43 +0100
Subject: Re: [PATCH] virtio-mmio: fix guest kernel crash with SHM regions
To: qemu-devel@nongnu.org
References: <20201220163539.2255963-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ab15d154-8c4d-4a79-9e15-6d3e4c59c5ed@vivier.eu>
Date: Thu, 7 Jan 2021 09:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220163539.2255963-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E9lsu3Un4zgOnBKZEkgJBNjpyfazGYNFb+qU2lkwUaH/RZyO7tJ
 6TRKk/HUBv2p3mwvrbHD9v4S8jfreiMXKwIJngyWliE6IkfZDb3b041olOEVbGZ+yaWZ2Li
 erVmdK3dFFNS9MqljOEp06ELgtcFeXFABL1llveRjsF2fbs6CuhLr97kWYBoB9nxi9CG6Fw
 Pd9KgUKAete7LhBFjcpng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vDsK609K0EI=:+1N+MedTCmuXqSZy9iFg6U
 Kui0JiHvItrmpdaO3zp9knlTQtRDX7g7HEfRhgivaiwAfLk0KRr9lYQWaJ3PaEY8aAXaSQLqN
 6Ybu45KKI6SOcozlAZQmghmNjJQrEQDxb7W0mfoV185oPH3W9dh7UlHvBFShPfcaSH5wwm9L1
 kYJa83OLh6QuxjEJ0/JYWFbDTnYwoh++yzu0J+aVW+OjLFd3+v0wUr3bIMgPzOcXX4wF1WIZf
 Ird0quSp4fq4aDKoxuu8G5gOlPQUPdw1SuUHhDF/rvxtW+hBGhnnWXA3Y0spHEMWJG2u8ncdp
 e3F39Za0yS1CrGUgl+ocO8eLmOWx47Ca3RC043AhGSbeG9LpcnpWvMfbWEJl0hk8unEARRECr
 QkDQv8st7Et5bkcCSM/pVEwnJ3NOmgfHhwTIdQrSrePtZI6zY7t5ZFV3tjpB1
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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

Hi,

any comment?

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


