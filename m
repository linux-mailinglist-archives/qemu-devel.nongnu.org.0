Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811759D2B4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:55:02 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOkX-0005Cp-MT
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOaY-00055v-4h
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOaW-0006md-2n
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpAmQ26fe2z6tt0/kxWXbj38DxdZScCYOq1KnVHLS+U=;
 b=g1dRIBG2MAIIugzyTuRH6nI3UbehemU6YerHKeaENN1IkUYzGXhyvsMrq4m2Xj9qxriNrj
 qoAj7nuQGlrtAOelZnZGe1zAS4vspQ0OkxBwJ16E6FbsW/5qPANUC2rtsEBq8YYwv0TZR8
 A4vxB9IX0uruCoF+OyeH99F61nJi/ic=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-xqj3Qxr5ORKymCV_8sJldw-1; Tue, 23 Aug 2022 03:44:37 -0400
X-MC-Unique: xqj3Qxr5ORKymCV_8sJldw-1
Received: by mail-pj1-f71.google.com with SMTP id
 92-20020a17090a09e500b001d917022847so5865923pjo.1
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UpAmQ26fe2z6tt0/kxWXbj38DxdZScCYOq1KnVHLS+U=;
 b=MZzOEdwhwcsciTrfLZ0HD9yS83kZ22/eipGKsr4AT5KxpoDbyB4x7BEmvlud/hy/fF
 2SzNwnWjKHxlHUJRtHsl9DHiK+325xbb/mDqx+8HTzT36Z794vy8+x5r1U/1E0rP094s
 prwOFPa68VqYdAG8pWqB9aO06k9XZeyaZlkn86K/IzfUtUNFW98Aq6VMafhYdUAb06Kj
 rTdWr5vy4qTW0fQgpzzjO8LRFp6itwuhVqK7asCsun+oqRQY8OM2cx5hxhB0yuObBN9n
 qHTV27vQdBgnJ11hMHwEz3x+h4I5t5zbySgdf4IYtWyvPX9mgVHBUViEql4IoAljzftC
 LiTw==
X-Gm-Message-State: ACgBeo3ehPnZkZQk+GFToSYqbCdVgn7VUTVitemvZHlThz/E5Qv5qaIE
 x4C7PsUV/Ty9kp+HdGN/vQOBsuHzBAeDD81sS6tS0NL+++2TzaUcXjJqK1+Db6Kjigu9xB0CZwH
 OKxXPW6JYzhncVkU=
X-Received: by 2002:a17:902:ca02:b0:172:ded0:9dcb with SMTP id
 w2-20020a170902ca0200b00172ded09dcbmr10942870pld.4.1661240676146; 
 Tue, 23 Aug 2022 00:44:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5pnLiv0GSrM0T4aNEATfhppL7SNiq+ODv4m4vIjiHqXfyGl30TuRyi11dmLqayGJzs0+iQYQ==
X-Received: by 2002:a17:902:ca02:b0:172:ded0:9dcb with SMTP id
 w2-20020a170902ca0200b00172ded09dcbmr10942845pld.4.1661240675892; 
 Tue, 23 Aug 2022 00:44:35 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170902d38c00b001636d95fe59sm4259875pld.172.2022.08.23.00.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:44:35 -0700 (PDT)
Message-ID: <1824ba40-9460-4c5d-9a27-820a51355ba3@redhat.com>
Date: Tue, 23 Aug 2022 15:44:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 07/24] virtio-pci: support queue enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <6dda660c634b2a35c3dea46a98e63fb2ef3a36c9.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> PCI devices support vq enable.


Nit: it might be "support device specific vq enable"


>
> Based on this function, the driver can re-enable the virtqueue after the
> virtqueue is reset.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/virtio-pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index ec8e92052f..3d560e45ad 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1335,6 +1335,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          proxy->vqs[vdev->queue_sel].avail[0],
>                          ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                          proxy->vqs[vdev->queue_sel].used[0]);
> +            virtio_queue_enable(vdev, vdev->queue_sel);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
>               proxy->vqs[vdev->queue_sel].reset = 0;


Any reason we do it before the assignment of 1? It probably means the 
device specific method can't depend on virtio_queue_enabled()?

Thanks


>           } else {


