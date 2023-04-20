Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F86E8E11
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:29:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQbR-0005w3-On; Thu, 20 Apr 2023 05:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQbP-0005vv-Rj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:29:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQbO-0000hJ-ER
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OaHt6vlahyHKBqr2IIc9kKlpuFMPo/c6t2yVwlwsNgc=; b=SZvnWMVD6IO2bTRzUgZ/4zvIdW
 vfHTO0tfwgYP6aVw7BdoUI77VIacUjQj/tR6CTsRwJdEWHi2RT+K5p4Q+dlao9+x4Rby7CcLvhXTu
 vf4BCcXPljs8rNeTvYz5Ku/FrFM5Ql+ka8cMJfWuXf7afMEy5HcYkipyygnfy8Ks8fiTpn5lPVhAy
 hbVASBvFrxrwRblaJGCLSw41sy+2D/glm2aCVq3lwNz425EhnoBwYPKRNFb1EDbraeN4vwG3YKsOo
 ryIZdqeBaBUpCP5K+PKKBtiefqKEBAA6k1QJKmJ8jkpsI08+inqV+piny/dr/zrV4R1fnacI0AK3v
 S/V5d70F2oWXRkAm52zLH2J6a2fSP41gIbebtBly2sE1xPvK1oMvbrHTIaWRTZ8EybwiWXeBDDfrE
 UR1QP3BBu6PW+v0XW8pcx3NTqdBT/ehHgcZeq8jPnQUnUdtS2g07ps1lsk1HCVTKq8mxORPdWyY1R
 Uz03EtJqxKgQ1SXxucRvq+0O4yazHs0amaT5dFTquygLiEChfXba4U6Gh05qtLRBJnkze4KInqj+y
 V2XKzejK8YCVBS1FNRKpj/9BIN8IuBejDytAzkzce9fzG14G0k0PoTE5dBim2LZNfSfX5d1jthBZG
 9Rk22Bh5K/4GR+QU5rGkuqm/zH2o+ufWLwyLog4HY=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQaS-0009tu-Vf; Thu, 20 Apr 2023 10:28:25 +0100
Message-ID: <c17da9d6-2f47-cd7a-be9b-fa582429b59a@ilande.co.uk>
Date: Thu, 20 Apr 2023 10:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtio-fs@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
 <20230418162140.373219-6-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230418162140.373219-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 05/13] include/hw/virtio: add kerneldoc for virtio_init
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 18/04/2023 17:21, Alex Bennée wrote:

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/virtio/virtio.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 22ec098462..1ba7a9dd74 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -217,6 +217,12 @@ struct VirtioDeviceClass {
>   void virtio_instance_init_common(Object *proxy_obj, void *data,
>                                    size_t vdev_size, const char *vdev_name);
>   
> +/**
> + * virtio_init() - initialise the common VirtIODevice structure
> + * @vdev: pointer to VirtIODevice
> + * @device_id: the VirtIO device ID (see virtio_ids.h)
> + * @config_size: size of the config space
> + */
>   void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
>   
>   void virtio_cleanup(VirtIODevice *vdev);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

