Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FB489451
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 09:53:11 +0100 (CET)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qQQ-00082T-Sk
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 03:53:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qJi-0001rS-Cv
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:46:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n6qJf-0006RT-CL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 03:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641804367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDrAMx9SN8I32p4kIckL0og8U5oDPlzqrmoTUz04/mc=;
 b=GbrlweO7NYiNU8uXR9oGQOrWRUuenyOKizzA9Hd86GcvbMj9/7W2+t1MWfsyMOOMZJL6MZ
 HtHfdjeqEeT+xD0O2IDU0D5HZKyzIjySZUK7LxO30QXIjg6VRxQUzLGkJXI2MD8TL7ZWrd
 aMZVBKF65u/BuI4KbAx/Ap4Lj+kIwG8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-_9xCSXGXN0es4vzvm6P-mg-1; Mon, 10 Jan 2022 03:46:05 -0500
X-MC-Unique: _9xCSXGXN0es4vzvm6P-mg-1
Received: by mail-ed1-f70.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso9552628edb.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 00:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sDrAMx9SN8I32p4kIckL0og8U5oDPlzqrmoTUz04/mc=;
 b=yCSY7cmQz/wSOiLhsHOa5cdOyPDHM55Yn7AOy0I0++Bqt/9sPHD8J85SIUnrG8BuFH
 HQ7jUySq3LLnAqIhbiKOYqDjmF4sKonWnaJPXNAsY2NVC85KiqapB20MYKbI1rTKQiYJ
 VYnep+BmDOqKlxaJ9b0ITmstcmaBEJAgknHUYGsEuEZRDiLTB3HwZgNUpheDNVOwBGjs
 2pNbkTAV81J4KPhgGZQwFsQG4kAHcDtADFlxMMCeyxbjEVv/78Fx7aXjD3jmMrySH6vu
 Z09jGEUVCAOv+VXDX6B5/Hn1MTll9DflEOUrvZwAIdv4UJlnrhtKJwPrfMTxboraKbwT
 gerA==
X-Gm-Message-State: AOAM530fGQEQ7zisfT3dDuytnveLMJ4IP5RymgavtXHKPQ/yXX+jHOsU
 yrx1grztomLXDasxC/7PT+dzzfzMl9Rpbx2zGjlXOq18dU1sc+kHrT2vqasQv/pcbbrjurcEu6U
 qhp6vqBEWTrmZmqc=
X-Received: by 2002:a17:907:1c9c:: with SMTP id
 nb28mr61733620ejc.452.1641804363702; 
 Mon, 10 Jan 2022 00:46:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8gkw1KKGLfobhoI5NMJYyeXFFLwDdmtAao5yZE0E002zQZvQhl4mA4u7twNy6+P/Fgs7Fbw==
X-Received: by 2002:a17:907:1c9c:: with SMTP id
 nb28mr61733610ejc.452.1641804363532; 
 Mon, 10 Jan 2022 00:46:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c701:cf00:ac25:f2e3:db05:65c3?
 (p200300cbc701cf00ac25f2e3db0565c3.dip0.t-ipconnect.de.
 [2003:cb:c701:cf00:ac25:f2e3:db05:65c3])
 by smtp.gmail.com with ESMTPSA id jg3sm2150808ejc.37.2022.01.10.00.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:46:03 -0800 (PST)
Message-ID: <2d167e0c-a6dc-3528-2ede-b6a1e12e9de3@redhat.com>
Date: Mon, 10 Jan 2022 09:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/9] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-6-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220104085431.2122999-6-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.01.22 09:54, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Various APIs use 'pval' naming for 'pointer to val'.
> rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
> 'PCI' is already explicit in the function name, simplify
> and rename the argument 'len'. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/rdma/rdma_utils.h |  2 +-
>  hw/rdma/rdma_utils.c | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
> index 9fd0efd940b..0c6414e7e0a 100644
> --- a/hw/rdma/rdma_utils.h
> +++ b/hw/rdma/rdma_utils.h
> @@ -38,7 +38,7 @@ typedef struct RdmaProtectedGSList {
>      GSList *list;
>  } RdmaProtectedGSList;
>  
> -void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen);
> +void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);
>  void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
>  void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
>  void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index 98df58f6897..61cb8ede0fd 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -17,29 +17,29 @@
>  #include "trace.h"
>  #include "rdma_utils.h"
>  
> -void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
> +void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
>  {
>      void *p;
> -    hwaddr len = plen;
> +    hwaddr pci_len = len;
>  
>      if (!addr) {
>          rdma_error_report("addr is NULL");
>          return NULL;
>      }
>  
> -    p = pci_dma_map(dev, addr, &len, DMA_DIRECTION_TO_DEVICE);
> +    p = pci_dma_map(dev, addr, &pci_len, DMA_DIRECTION_TO_DEVICE);
>      if (!p) {
>          rdma_error_report("pci_dma_map fail, addr=0x%"PRIx64", len=%"PRId64,
> -                          addr, len);
> +                          addr, pci_len);
>          return NULL;
>      }
>  
> -    if (len != plen) {
> -        rdma_pci_dma_unmap(dev, p, len);
> +    if (pci_len != len) {
> +        rdma_pci_dma_unmap(dev, p, pci_len);
>          return NULL;
>      }
>  
> -    trace_rdma_pci_dma_map(addr, p, len);
> +    trace_rdma_pci_dma_map(addr, p, pci_len);
>  
>      return p;
>  }

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


