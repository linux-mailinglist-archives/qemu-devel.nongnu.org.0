Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA81E6695
	for <lists+qemu-devel@lfdr.de>; Thu, 28 May 2020 17:46:32 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeKjn-0005hD-5F
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 11:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeKiC-0003yK-2u
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:44:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jeKi8-0007DC-Mw
 for qemu-devel@nongnu.org; Thu, 28 May 2020 11:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590680686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vBvZTAGxsHj9eMYkBUsAC8Fy4l2ONrVzxiu0OVyZHXg=;
 b=Jr+uOD/jt4Pd401LyVpSGoyRyuIa7fTtaXKoodkpTS+3WskbP3LgQui6MSEVUeTjF5/Fs4
 8V9IxsN04i8HBXtElXbSancKbae+GIVREuqTxOPAhpYmnl791cAuDmgaewvre1FJZQM0GT
 M8WRIYDvE6JRD28d71u/G6tMYdB+FYo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-u04v6QyXNxG3ZUbdMDhPrA-1; Thu, 28 May 2020 11:44:45 -0400
X-MC-Unique: u04v6QyXNxG3ZUbdMDhPrA-1
Received: by mail-wm1-f71.google.com with SMTP id t9so1127187wml.4
 for <qemu-devel@nongnu.org>; Thu, 28 May 2020 08:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vBvZTAGxsHj9eMYkBUsAC8Fy4l2ONrVzxiu0OVyZHXg=;
 b=Cfwv0zqZ5fSpTvdqqKUOXKA3eTvh6bwgCFC/X7AIDZmF66R4LIrfhSl1jtsBT8QhFx
 jXPZvua0oEPevLWD0FjHtXSMOv6+upBI/g/Mz6xYTwJJzPT+DUGhakvt7/X59WX/x6xa
 dY1SV6tIEYcXI9PnXiTNCZWYE/LBo+EFbW34pdgwqGGb9nhmgLPbQvpGjW3kFeT7nNav
 36hiom2NrSDuA+C37tO0Tw51awRkgqBrG9MpQ8TDVJKeW0TwE45Uq4T0EwTpXXozN+x0
 IVX/Q4KRgoT8qHSKA3caieT525BKuHDHG8/FnFkwDI2jrL2miOxnszm2iW5KhEiHH2MM
 K63g==
X-Gm-Message-State: AOAM5328+4JimJiO/VN7cXzbZS4ZdzYpAZWlXhXvMguV8mehxC44KlbD
 BRvf9FpT/WW3H5rRVvYuP5jiYlFxY9do38rPYDY65N1ece/DR6rqwi41abtOn58HGQ2d/3LuStY
 fLBrKNQjsB7mmfEA=
X-Received: by 2002:a1c:9cd4:: with SMTP id f203mr4251418wme.26.1590680683287; 
 Thu, 28 May 2020 08:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsRQsLluOvpmS37WiuGtNjfMApuwgGQj/rMe1UR7nXm4T2orQeOJ+HWN4yr53f0OGaUVo9pA==
X-Received: by 2002:a1c:9cd4:: with SMTP id f203mr4251394wme.26.1590680683066; 
 Thu, 28 May 2020 08:44:43 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id s8sm3252722wrm.96.2020.05.28.08.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 08:44:41 -0700 (PDT)
Subject: Re: [PATCH v6 08/20] hw/block/nvme: allow use of any valid msix vector
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
References: <20200514044611.734782-1-its@irrelevant.dk>
 <20200514044611.734782-9-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <6b607877-a45f-6c44-45ae-180ce0100fed@redhat.com>
Date: Thu, 28 May 2020 17:44:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200514044611.734782-9-its@irrelevant.dk>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 01:51:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/20 6:45 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> If the device uses MSI-X, any of the 2048 MSI-X interrupt vectors are
> valid. If the device is not using MSI-X, vector will and can only be
> zero at this point.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index c9d10df1f763..a2e6734c7a25 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -657,7 +657,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
>          trace_pci_nvme_err_invalid_create_cq_vector(vector);
>          return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
>      }
> -    if (unlikely(vector > n->params.num_queues)) {
> +    if (unlikely(vector > PCI_MSIX_FLAGS_QSIZE)) {
>          trace_pci_nvme_err_invalid_create_cq_vector(vector);
>          return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
>      }
> 

Is it worth adding this?

--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -613,6 +613,8 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeCmd *cmd)
 static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
     uint16_t cqid, uint16_t vector, uint16_t size, uint16_t irq_enabled)
 {
+    int ret;
+
     cq->ctrl = n;
     cq->cqid = cqid;
     cq->size = size;
@@ -623,7 +625,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl
*n, uint64_t dma_addr,
     cq->head = cq->tail = 0;
     QTAILQ_INIT(&cq->req_list);
     QTAILQ_INIT(&cq->sq_list);
-    msix_vector_use(&n->parent_obj, cq->vector);
+    ret = msix_vector_use(&n->parent_obj, cq->vector);
+    assert(ret == 0);
     n->cq[cqid] = cq;
     cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
 }

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


