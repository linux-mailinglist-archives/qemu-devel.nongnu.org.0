Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1394891B2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:38:16 +0100 (CET)
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6pFv-0004WS-JM
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6oz8-00034w-AM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:20:54 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6oz6-0002PM-6r
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:20:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8DC61D6A2911;
 Mon, 10 Jan 2022 08:20:49 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 08:20:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004826410ce-7553-4692-b48e-fbb58986fdf0,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b42c3e82-07ca-6eb1-5c71-7d0c9d3608a6@kaod.org>
Date: Mon, 10 Jan 2022 08:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] virtio-pci: fix up config interrupt handling
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>
References: <20220109173136.35848-1-mst@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220109173136.35848-1-mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: af6bae54-165b-4dc7-b7a2-9cc7fc554ef4
X-Ovh-Tracer-Id: 16019585350270290912
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepvhhrpghqvghmuhesthdqohhnlhhinhgvrdguvg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/22 18:49, Michael S. Tsirkin wrote:
> Fixes a couple of issues with irqfd use by config interrupt:
> - Rearrange initialization so cleanup happens in the reverse order
> - Don't use irqfd for config when not in use for data path
> I am not sure this is a complete fix though: I think we
> are better off limiting the effect to vdpa devices
> with config interrupt support. Or even bypass irqfd
> for config completely and inject into KVM using ioctl?
> The advantage would be less FDs used.
> This would mean mostly reverting the patchset though.
> 
> Fixes: d5d24d859c ("virtio-pci: add support for configure interrupt")
> Cc: "Cindy Lu" <lulu@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

On a KVM guest with vhost, I am still seeing at reboot an issue :/

../hw/pci/msix.c:622: msix_unset_vector_notifiers: Assertion `dev->msix_vector_use_notifier && dev->msix_vector_release_notifier'


C.

> ---
>   hw/virtio/virtio-pci.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 98fb5493ae..b77cd69f97 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1130,15 +1130,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
>               proxy->vector_irqfd =
>                   g_malloc0(sizeof(*proxy->vector_irqfd) *
>                             msix_nr_vectors_allocated(&proxy->pci_dev));
> +            r = kvm_virtio_pci_vector_config_use(proxy);
> +            if (r < 0) {
> +                goto config_error;
> +            }
>               r = kvm_virtio_pci_vector_use(proxy, nvqs);
>               if (r < 0) {
>                   goto config_assign_error;
>               }
>           }
> -        r = kvm_virtio_pci_vector_config_use(proxy);
> -        if (r < 0) {
> -            goto config_error;
> -        }
>           r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
>                                         virtio_pci_vector_mask,
>                                         virtio_pci_vector_poll);
> @@ -1155,7 +1155,9 @@ notifiers_error:
>           kvm_virtio_pci_vector_release(proxy, nvqs);
>       }
>   config_error:
> -    kvm_virtio_pci_vector_config_release(proxy);
> +    if (with_irqfd) {
> +        kvm_virtio_pci_vector_config_release(proxy);
> +    }
>   config_assign_error:
>       virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
>                                     with_irqfd);
> 


