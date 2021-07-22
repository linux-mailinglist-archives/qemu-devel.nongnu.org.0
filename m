Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB93D20FF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 11:37:17 +0200 (CEST)
Received: from localhost ([::1]:41922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6V8m-0008Fa-Ft
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6V77-00079q-Pe
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m6V76-00047b-Cn
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 05:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626946531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZmrZzalSGrt3CnfaRrsN5R8Ax6Cvg9BRIdoHLyMQss=;
 b=bb3ILDj7nylh9/j4w+8GRj693Xio7U4rqrLmn2A3LsZgfmGjcvS9Io2nXEp5XGKoM/uAkC
 jsk+dEXua8s8lnzFbgCFdghb7sJ4x7f37xQIJL+qp64tQFxV3ZET4rO/jv+rT5nXtYlq+Z
 ymlPMnKuG8+t62b+Am+oqDweZMoWu8Y=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ZYBICQZaNFGqBS-8Gi1aHw-1; Thu, 22 Jul 2021 05:35:28 -0400
X-MC-Unique: ZYBICQZaNFGqBS-8Gi1aHw-1
Received: by mail-pj1-f71.google.com with SMTP id
 nh12-20020a17090b364cb029017382031497so4077205pjb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 02:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pZmrZzalSGrt3CnfaRrsN5R8Ax6Cvg9BRIdoHLyMQss=;
 b=BaYJRQs4JR/C79nC4ILTS6Di41ZxKpHlbktXX6WB69qQrHtd34K7G5YmgSfDn9c53x
 xdYGD7u4ncdQ79zgI50BuBokXxOpYDNwLwrdeAjWK0WN48NxQipwciqXBHuYRu8EPeaP
 4T/D8YAb6jhlhzd+Q0iEW6tjgglYP8Lr1ZT7PvKbtYbC/hvt6frbeDIPsrZZS+/7yCfC
 t+L/gpShe244XIqC7BZV1qikvBxfH2ozkRBiAiTcGwc2CGf68TPxlDrafoushjdNr5Mc
 vOR+vsI4eAbzl9YrSc9ZDoAeaL6ljJX7sxnv/zpYs1gAs+REH9RI6emtmPUsK3RjCfyu
 Fe+g==
X-Gm-Message-State: AOAM532puJ3X/+ATw34qbCDoNhSRnYOnOP3kc6HEnALIWDFeNes7uGXI
 t99GTh+/yJ2FxEIBHSr1b44cQRK+FDnMCgVAA10HHJmrSYI9YO0En4vQOGStrtZBMey0qIp2NN5
 QjYasMBIwPu0R2HE=
X-Received: by 2002:a17:90a:55c8:: with SMTP id
 o8mr8022984pjm.223.1626946527467; 
 Thu, 22 Jul 2021 02:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt8nl7UAduLjj3tfi75A3qFSDybHRPr5gLFAItftLE9lWkg8qQOs4Jrv17ECKiLkRDb8urHw==
X-Received: by 2002:a17:90a:55c8:: with SMTP id
 o8mr8022972pjm.223.1626946527215; 
 Thu, 22 Jul 2021 02:35:27 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a13sm31099672pfl.92.2021.07.22.02.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 02:35:26 -0700 (PDT)
Subject: Re: [PATCH] hw/net/net_tx_pkt: Fix crash detected by fuzzer
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20210715193219.1132571-1-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4b6e4dc8-8eae-7965-f133-c7a0a88f733e@redhat.com>
Date: Thu, 22 Jul 2021 17:35:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715193219.1132571-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/7/16 ÉÏÎç3:32, Thomas Huth Ð´µÀ:
> QEMU currently crashes when it's started like this:
>
> cat << EOF | ./qemu-system-i386 -device vmxnet3 -nodefaults -qtest stdio
> outl 0xcf8 0x80001014
> outl 0xcfc 0xe0001000
> outl 0xcf8 0x80001018
> outl 0xcf8 0x80001004
> outw 0xcfc 0x7
> outl 0xcf8 0x80001083
> write 0x0 0x1 0xe1
> write 0x1 0x1 0xfe
> write 0x2 0x1 0xbe
> write 0x3 0x1 0xba
> writeq 0xe0001020 0xefefff5ecafe0000
> writeq 0xe0001020 0xffff5e5ccafe0002
> EOF
>
> It hits this assertion:
>
> qemu-system-i386: ../qemu/hw/net/net_tx_pkt.c:453: net_tx_pkt_reset:
>   Assertion `pkt->raw' failed.
>
> This happens because net_tx_pkt_init() is called with max_frags == 0 and
> thus the allocation
>
>      p->raw = g_new(struct iovec, max_frags);
>
> results in a NULL pointer that cause the
>
>      assert(pkt->raw);
>
> in net_tx_pkt_reset() to fail later. To fix this issue we can check
> that max_raw_frags was not zero before asserting that pkt->raw is
> a non-NULL pointer.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1890157
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/net/net_tx_pkt.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 1f9aa59eca..1cb1125d9f 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -450,11 +450,13 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
>       pkt->payload_len = 0;
>       pkt->payload_frags = 0;
>   
> -    assert(pkt->raw);
> -    for (i = 0; i < pkt->raw_frags; i++) {
> -        assert(pkt->raw[i].iov_base);
> -        pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base, pkt->raw[i].iov_len,
> -                      DMA_DIRECTION_TO_DEVICE, 0);
> +    if (pkt->max_raw_frags > 0) {
> +        assert(pkt->raw);
> +        for (i = 0; i < pkt->raw_frags; i++) {
> +            assert(pkt->raw[i].iov_base);
> +            pci_dma_unmap(pkt->pci_dev, pkt->raw[i].iov_base,
> +                          pkt->raw[i].iov_len, DMA_DIRECTION_TO_DEVICE, 0);
> +        }
>       }
>       pkt->raw_frags = 0;


Applied.

Thanks


>   


