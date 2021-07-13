Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E193C79AD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:31:50 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QwP-0008Vp-II
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3QjS-0008Ar-J6
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3QjR-0004rA-2W
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hj6OpAcXjn5Xf3YPHfYV2oqtFpdzJWD/UnjKsVqGlOM=;
 b=isLnwPGAT3/tbNGm0vMRD+iPx3Dz4KZ48w8Dff1k1dZakcir+qD0eEOpCsPK3Bm5mopJ+9
 z+91lInNenAaCcj7miBBpCv3CmbnYKQIyqK1+C6JIwbQAHYXtF0IueriACLhBgW7ELrRXi
 HQ2jzv1Xg4PJEQuaxcfOyp2J2AYe4Xk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-AKiP6tx6OhmycYtCaYTAiQ-1; Tue, 13 Jul 2021 18:18:21 -0400
X-MC-Unique: AKiP6tx6OhmycYtCaYTAiQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so305937wrs.22
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hj6OpAcXjn5Xf3YPHfYV2oqtFpdzJWD/UnjKsVqGlOM=;
 b=sIh0gBjv9wNR2smCSdZD0ZYWNMRu3oUfrMV0LvfkH6icfnezHBmtjbKC/Y5u3xKOEY
 +ZSN9G7RRosnvsvR40pO7EOB7HDv/DoKIFSV4k14afynKvupLULSIW0vRZezlmgyZjCi
 8nuddfqiLyfjX5PmlhN4RvodC/lNCzK2PFjGQneK+q0lDsfbn7ERuzC8xOXmPMhMQM0d
 zK132NOZEsI5o29JltKX/PXTLuRu/AhBRpBlWCKG+viSlOxO9Ynl9GKrKJaIEz6NW2je
 ngWTF9SKIbjAxj4VUFlgC16yyNKfnimqguVM80BTUVMoJoJGdPBFmCS04rNdMchw9A6p
 8b0w==
X-Gm-Message-State: AOAM532ffLRSVT8NXm+7wkwya6JnqQHq5pVwANN5YvZ7cMGaRwOBwzWR
 4ZuZVJpdZp5u9G71bwDkJgdmSAs8xSirzzccMs03TlB5no9I20q6cQEx9Ci7vNSIQI62Oo3b9De
 LG87UA0DFWMxPdnE=
X-Received: by 2002:adf:ef05:: with SMTP id e5mr8518747wro.232.1626214700174; 
 Tue, 13 Jul 2021 15:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgGg9WU8VNIztg3nTESeqyuxeVWOa7uSrW4Y/34V3wB8jrScIvhwtbIzx4zjU0ITYFnm6+og==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr8518714wro.232.1626214699930; 
 Tue, 13 Jul 2021 15:18:19 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id t15sm159295wrx.17.2021.07.13.15.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 15:18:19 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210713192428.950160-1-its@irrelevant.dk>
 <20210713192428.950160-5-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <30506100-68db-1fa2-ab32-f9f446c7193a@redhat.com>
Date: Wed, 14 Jul 2021 00:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713192428.950160-5-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 9:24 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The new PMR test unearthed a long-standing issue with MMIO reads on
> big-endian hosts.
> 
> Fix this by unconditionally storing all controller registers in little
> endian.
> 
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 304 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 174 insertions(+), 130 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 0449cc4dee9b..ddac9344a74e 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -439,10 +439,12 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
>  
>  static void nvme_irq_check(NvmeCtrl *n)
>  {
> +    uint32_t intms = le32_to_cpu(n->bar.intms);
> +
>      if (msix_enabled(&(n->parent_obj))) {
>          return;
>      }
> -    if (~n->bar.intms & n->irq_status) {
> +    if (~intms & n->irq_status) {
>          pci_irq_assert(&n->parent_obj);
>      } else {
>          pci_irq_deassert(&n->parent_obj);
> @@ -1289,7 +1291,7 @@ static void nvme_post_cqes(void *opaque)
>          if (ret) {
>              trace_pci_nvme_err_addr_write(addr);
>              trace_pci_nvme_err_cfs();
> -            n->bar.csts = NVME_CSTS_FAILED;
> +            n->bar.csts = cpu_to_le64(NVME_CSTS_FAILED);

The load/store API is safer than the cpu_to_X() one because
it removes alignment problems. Here it becomes:

               stq_le_p(&n->bar.csts, NVME_CSTS_FAILED);

>              break;
>          }
>          QTAILQ_REMOVE(&cq->req_list, req, entry);
> @@ -4022,7 +4024,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
>          trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(le64_to_cpu(n->bar.cap)))) {

And here:

 if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))) {

>          trace_pci_nvme_err_invalid_create_sq_size(qsize);
>          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
>      }

However for the BAR is likely aligned, so using the cpu_to() API
shouldn't be a problem until we try to deprecate/remove it.


