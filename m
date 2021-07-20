Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900843CFA3E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:13:26 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pYq-0004cn-MP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pKk-0007DG-Gd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pKi-0000ZX-Oa
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebraFZndjhyx3AiyXaz19MNlB2FT3/4t9D2MetN76B8=;
 b=hpYYn+TXV3RgMJ9D0iAuIEFF/vBheNvw155TCfOCa43Rwjwjcfa3LbQW9AXwVLYHxXhnCo
 71PMB9/5EO377KCyDt1nsV2FtFEDF3y+E5XFeMebNZwz0NjgKo6l9bNv8+lCYpBlEVefkJ
 l48yU4lvo0ihbtmm9eMNz0nGxamCHZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-NhD9n26IPgCIwh7U0rAfsg-1; Tue, 20 Jul 2021 08:58:46 -0400
X-MC-Unique: NhD9n26IPgCIwh7U0rAfsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n5-20020a05600c3b85b02902152e9caa1dso466267wms.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 05:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebraFZndjhyx3AiyXaz19MNlB2FT3/4t9D2MetN76B8=;
 b=uVxHuxG63eBqN0AW2avULUC75KwapnCnunVdcJZg5CoTD8ANWT+OSedHKIQd1UTkJX
 f/HGcTH0TZPdCL3nhAtGX4gKkc7w/x+CpyvBaJCFPD+W/vvhYvBuwEDoiZazpmEdd3TY
 oF1plrMG8z99ed5aJXvpYyc5G92Km3L+jsJWp8uwQFoBrzeG3T9yG4mhvs6cwnD4ciVG
 dRcha3pIqxRVhvg3PXJ2G+VvJBilt5VQG1BsfhXvl4gtUVZHdjakXt8ds044ck5a+lRl
 dtO++SCA+369cDIThR9UHv/4NQG7dhW635ibm/gaYmsTjasY1ufQERqgddtipfipWFYU
 +wnQ==
X-Gm-Message-State: AOAM532QbOxoJAq5LFmdqlRlYrRNSXHkLYTDsS54qrH26BSKmKkNgg6Y
 ZYueF2MlTLdaVQijjw2gm2fzgdgK00KuB3sIAbNkBCMEjTAkQgrjkXNLe4C3VlSJEg/i2b4xQoK
 DGLvL+dWtzTYF/ww=
X-Received: by 2002:adf:f50e:: with SMTP id q14mr35610848wro.183.1626785924983; 
 Tue, 20 Jul 2021 05:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzte4fPe8gosrgmlhiwGbIqGWCR5HnxlDLjrlFwQcltyVwSTOLjcBl7hVdxhpW4ocpihTlhSA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr35610808wro.183.1626785924640; 
 Tue, 20 Jul 2021 05:58:44 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n11sm2720597wms.0.2021.07.20.05.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 05:58:43 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>, Peter Maydell <peter.maydell@linaro.org>
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-5-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccc55fb4-2488-83e1-589c-53b3f31b6719@redhat.com>
Date: Tue, 20 Jul 2021 14:58:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719224647.68559-5-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 12:46 AM, Klaus Jensen wrote:
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
>  hw/nvme/ctrl.c | 290 +++++++++++++++++++++++++++----------------------
>  1 file changed, 162 insertions(+), 128 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 0449cc4dee9b..43dfaeac9f54 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -439,10 +439,12 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
>  
>  static void nvme_irq_check(NvmeCtrl *n)
>  {
> +    uint32_t intms = ldl_le_p(&n->bar.intms);
> +
>      if (msix_enabled(&(n->parent_obj))) {
>          return;
>      }
> -    if (~n->bar.intms & n->irq_status) {

Why not use an inline call like the rest of this file?

       if (~ldl_le_p(&n->bar.intms) & n->irq_status) {

Anyway, not an issue.

> +    if (~intms & n->irq_status) {
>          pci_irq_assert(&n->parent_obj);
>      } else {
>          pci_irq_deassert(&n->parent_obj);
> @@ -1289,7 +1291,7 @@ static void nvme_post_cqes(void *opaque)
>          if (ret) {
>              trace_pci_nvme_err_addr_write(addr);
>              trace_pci_nvme_err_cfs();
> -            n->bar.csts = NVME_CSTS_FAILED;
> +            stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>              break;
>          }
>          QTAILQ_REMOVE(&cq->req_list, req, entry);
> @@ -4022,7 +4024,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
>          trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))) {
>          trace_pci_nvme_err_invalid_create_sq_size(qsize);
>          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
>      }
> @@ -4208,7 +4210,7 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
>  
> -    switch (NVME_CC_CSS(n->bar.cc)) {
> +    switch (NVME_CC_CSS(ldl_le_p(&n->bar.cc))) {
>      case NVME_CC_CSS_NVM:
>          src_iocs = nvme_cse_iocs_nvm;
>          /* fall through */
> @@ -4370,7 +4372,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
>          trace_pci_nvme_err_invalid_create_cq_cqid(cqid);
>          return NVME_INVALID_QID | NVME_DNR;
>      }
> -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))) {
>          trace_pci_nvme_err_invalid_create_cq_size(qsize);
>          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
>      }
> @@ -5163,17 +5165,19 @@ static void nvme_update_dmrsl(NvmeCtrl *n)
>  
>  static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
>  {
> +    uint32_t cc = ldl_le_p(&n->bar.cc);

This one is understandable.

>      ns->iocs = nvme_cse_iocs_none;
>      switch (ns->csi) {
>      case NVME_CSI_NVM:
> -        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
> +        if (NVME_CC_CSS(cc) != NVME_CC_CSS_ADMIN_ONLY) {
>              ns->iocs = nvme_cse_iocs_nvm;
>          }
>          break;
>      case NVME_CSI_ZONED:
> -        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
> +        if (NVME_CC_CSS(cc) == NVME_CC_CSS_CSI) {
>              ns->iocs = nvme_cse_iocs_zoned;
> -        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
> +        } else if (NVME_CC_CSS(cc) == NVME_CC_CSS_NVM) {
>              ns->iocs = nvme_cse_iocs_nvm;
>          }
>          break;
> @@ -5510,7 +5514,7 @@ static void nvme_process_sq(void *opaque)
>          if (nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd))) {
>              trace_pci_nvme_err_addr_read(addr);
>              trace_pci_nvme_err_cfs();
> -            n->bar.csts = NVME_CSTS_FAILED;
> +            stl_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>              break;
>          }
>          nvme_inc_sq_head(sq);
> @@ -5565,8 +5569,6 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      n->aer_queued = 0;
>      n->outstanding_aers = 0;
>      n->qs_created = false;
> -
> -    n->bar.cc = 0;

This change is not documented, is it related to the fix?

>  }
>  
>  static void nvme_ctrl_shutdown(NvmeCtrl *n)
> @@ -5605,7 +5607,12 @@ static void nvme_select_iocs(NvmeCtrl *n)
>  
>  static int nvme_start_ctrl(NvmeCtrl *n)
>  {
> -    uint32_t page_bits = NVME_CC_MPS(n->bar.cc) + 12;
> +    uint64_t cap = ldq_le_p(&n->bar.cap);
> +    uint32_t cc = ldl_le_p(&n->bar.cc);
> +    uint32_t aqa = ldl_le_p(&n->bar.aqa);
> +    uint64_t asq = ldq_le_p(&n->bar.asq);
> +    uint64_t acq = ldq_le_p(&n->bar.acq);
> +    uint32_t page_bits = NVME_CC_MPS(cc) + 12;
>      uint32_t page_size = 1 << page_bits;

My brain overflowed at this point, too many changes to track :/

Would it make sense to split it? (per big function body maybe?)


Note, using so many manual endian accesses seems fragile. Maybe we
could find a way to write a pair of macros taking 'n' + bar 'fieldname'
as input, using the correct size swapping using sizeof_field(fieldname)?

Something like (untested):

  #define ld_bar(fieldname) \
          ldn_le_p(&n->bar.fieldname, \
                   sizeof_field(NvmeBar, fieldname));

  #define st_bar(fieldname, val) \
          stn_le_p(&n->bar.fieldname, \
                   sizeof_field(NvmeBar, fieldname), val);

Using as:

  uint64_t cap = ld_bar(cap);

Or if you prefer:

  #define BAR_LD(bar, fieldname) \
          ldn_le_p(pbar.fieldname, \
                   sizeof_field(NvmeBar, fieldname));

as:

  uint64_t cap = BAR_LD(&n->bar, cap);

Regards,

Phil.


