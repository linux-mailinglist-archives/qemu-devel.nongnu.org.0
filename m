Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADE689604
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtJg-0000Oy-IY; Fri, 03 Feb 2023 05:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pNtJe-0000Of-Ii
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:29:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pNtJd-0006ST-2u
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675420148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuviIwLduw2hlkaiA7mcZfrbfe9Lt26NLVahWCh/g1M=;
 b=TvD4lzgrgcJT6x6ckoHF/gUCanO+0vsWPAhfKfDBnPX63Xj4Gnay+tQHIaLgHYyDJ4zww7
 x9Dq3FXao7RE5L0lW507lcOwcxKmO6p3FHi0A4Ku/X/feAkw2je2P+8ucrgbzDl4VmzfJT
 dIFb3J4ExMk1zgKSLXeXIJL/UQ++SDU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-Tv4wdLzjNJaEy7VUjsLaFg-1; Fri, 03 Feb 2023 05:29:05 -0500
X-MC-Unique: Tv4wdLzjNJaEy7VUjsLaFg-1
Received: by mail-qt1-f200.google.com with SMTP id
 g2-20020ac870c2000000b003b9c8ab53e9so2374886qtp.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cuviIwLduw2hlkaiA7mcZfrbfe9Lt26NLVahWCh/g1M=;
 b=IlA7K933dzAyTRKP/DQ4+J54xuT6uZHQuH1SlxnFS/18qt6eXW7WNKSImDSO+jRNbA
 dFMsn4QkqjE8COY5BIK3h9WAX8y8pb+nc+ugTVU/ZDjU8BsBGZxBEXt5mPU4NMtOr0uN
 aUw4prC0v6o50vMGeQlQn+Y1u9K6imrLSMvIqgvte8N7+AqgkTrL+4oVR48VTEhH2vAA
 caduhwlv3SzMIm1NJ9pNMw0G1mO5ofXNVGL4ByrbZ+q7C6N1jp0o8kAGE65hF6BYCha7
 cEu4GsfJj4gr5qy6Fya2b0Y6JX1dni4YlUpfFkqwI3vy0X23nSu6RDIQV6mtR/RQTDoq
 sZfA==
X-Gm-Message-State: AO0yUKVuZAhAS/fLwUl9UeC21LOG3y3fp9FdZqnk7yq6S8v7zkG79bVW
 VfU1pu9IHBXkDB3DpmlrkpSOR6E59QMN1h8EMuv0FiVMGd1c90QR7TiySSjwPnwtCBaFFr8w5M3
 mHv6k+dsrp7Mlidw=
X-Received: by 2002:a05:622a:1998:b0:3b8:2baa:6aef with SMTP id
 u24-20020a05622a199800b003b82baa6aefmr8096061qtc.43.1675420145419; 
 Fri, 03 Feb 2023 02:29:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9dqs5c8OWNIKOOHc4l+mxvq8iXLlyYzkS53/o1jGfqH8QYgRHS8QxSJdR6rLTx42va3moM9Q==
X-Received: by 2002:a05:622a:1998:b0:3b8:2baa:6aef with SMTP id
 u24-20020a05622a199800b003b82baa6aefmr8096038qtc.43.1675420145172; 
 Fri, 03 Feb 2023 02:29:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 b13-20020ac85bcd000000b003b68d445654sm1302151qtb.91.2023.02.03.02.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:29:04 -0800 (PST)
Message-ID: <d07245ed-5df9-f477-9f71-fc71cde368bd@redhat.com>
Date: Fri, 3 Feb 2023 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 1/9] hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
References: <20230201042615.34706-1-akihiko.odaki@daynix.com>
 <20230201042615.34706-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230201042615.34706-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/1/23 05:26, Akihiko Odaki wrote:
> Expose the ethernet header so that igb can utilize it to perform the
> internal routing among its SR-IOV functions.
> 
> Signed-off-by: Gal Hammer <gal.hammer@sap.com>
> Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

I don't see where it is used ? Am I missing something ?

Thanks,

C.


> ---
>   hw/net/net_tx_pkt.c | 6 ++++++
>   hw/net/net_tx_pkt.h | 8 ++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
> index 986a3adfe9..be5b65f0e9 100644
> --- a/hw/net/net_tx_pkt.c
> +++ b/hw/net/net_tx_pkt.c
> @@ -273,6 +273,12 @@ bool net_tx_pkt_parse(struct NetTxPkt *pkt)
>       }
>   }
>   
> +struct eth_header *net_tx_pkt_get_eth_hdr(struct NetTxPkt *pkt)
> +{
> +    assert(pkt);
> +    return (struct eth_header *)&pkt->l2_hdr;
> +}
> +
>   struct virtio_net_hdr *net_tx_pkt_get_vhdr(struct NetTxPkt *pkt)
>   {
>       assert(pkt);
> diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
> index f57b4e034b..2e51b73b6c 100644
> --- a/hw/net/net_tx_pkt.h
> +++ b/hw/net/net_tx_pkt.h
> @@ -45,6 +45,14 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
>    */
>   void net_tx_pkt_uninit(struct NetTxPkt *pkt);
>   
> +/**
> + * get ethernet header
> + *
> + * @pkt:            packet
> + * @ret:            ethernet header
> + */
> +struct eth_header *net_tx_pkt_get_eth_hdr(struct NetTxPkt *pkt);
> +
>   /**
>    * get virtio header
>    *


