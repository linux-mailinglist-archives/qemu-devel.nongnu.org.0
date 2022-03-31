Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8285D4ED8B3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:50:10 +0200 (CEST)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtJZ-0002qm-AS
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:50:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtDE-0000tc-Dm
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtDC-0004WF-I0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648727013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z86jnmdnHR+FmOx6yycKuO0ugTrL0Ue4ZK6c9Or7QK8=;
 b=KhXZXxQpuFUiiQib3++CKCVjtpHLpc3Fd9L7Tm0gBoNQep7f/H5tG4bJGVMI9FecFmuKyG
 CYhVD6sCCT76u6Veebs9oUAHs6ly/FQaAH0leRojvhiHCnuTgElZIT2Dl1L+bPCq7Jvhby
 K/kox0fwgr30qKBhgxyQuRYAoPRtVZE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-606dd0pDPGal1Rhq1LN3iw-1; Thu, 31 Mar 2022 07:43:32 -0400
X-MC-Unique: 606dd0pDPGal1Rhq1LN3iw-1
Received: by mail-ej1-f69.google.com with SMTP id
 og28-20020a1709071ddc00b006dfb92d8e3fso11357925ejc.14
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 04:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z86jnmdnHR+FmOx6yycKuO0ugTrL0Ue4ZK6c9Or7QK8=;
 b=bYo1kSPjpYC3FWL6E6WMVIKk51Xxsv+rO5Mj+iZojSafy90G8oBpO1UPGFIPTYsHRs
 TtLET1UpknCWWEt6Q78p4/MJCTODat1E4Hg17oaKkT7KCwb/tlzZavdeH6S0omW3cyZj
 AsULMkbIZVEwsZwiPjzPE6W9386RcAQ/rM8SvGrPpS6YtQp8CFHNDwnxb8LtxftCF0Jt
 Ux7rVLMpwzm+UNFl5lJjrrn2K1ghqEbZ4a3Q8wQcADbf0XqoZy/4RNWbWDSl2JH9vHyq
 YtRDndio7Tf3sL9pR8d6uNff6IcyLv8vLv+vULezqyWiZQsCcCoqtwLU3xzDmfYJZiZv
 X4vg==
X-Gm-Message-State: AOAM5329Qho5bbd/0vV7jcYkP3q6Wo2rfpFL3M2s3l6J9BCECxmtLCrm
 K/EidBJ/SHjZzKcq6wGW1pftPvz5UkgG5bYN3olxoDC0kIp16iFNtvInfW5UsdiGz74Ilr+6Z/Y
 3G4ytFQj1LyQoUWQ=
X-Received: by 2002:a17:906:ae0b:b0:6df:c7d6:9235 with SMTP id
 le11-20020a170906ae0b00b006dfc7d69235mr4670421ejb.664.1648727011367; 
 Thu, 31 Mar 2022 04:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1QaodA+a+P0u02CGoqCsIg4vKG5jFHuuirbD2lOFg/MdR2v9w9w6Yi/gQVgaBYVePpXzKBA==
X-Received: by 2002:a17:906:ae0b:b0:6df:c7d6:9235 with SMTP id
 le11-20020a170906ae0b00b006dfc7d69235mr4670391ejb.664.1648727011166; 
 Thu, 31 Mar 2022 04:43:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 dd6-20020a1709069b8600b006df08710d00sm9586584ejc.85.2022.03.31.04.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 04:43:30 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:43:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Maxim Davydov <maxim.davydov@openvz.org>
Subject: Re: [PATCH v1 3/9] mem: appropriate handling getting mem region
Message-ID: <20220331134328.65d15a93@redhat.com>
In-Reply-To: <20220328211539.90170-4-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-4-maxim.davydov@openvz.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, armbru@redhat.com,
 crosa@redhat.com, qemu-devel@nongnu.org, lizhijian@fujitsu.com,
 f4bug@amsat.org, wangyanan55@huawei.com, marcandre.lureau@redhat.com,
 chen.zhang@intel.com, jsnow@redhat.com, pbonzini@redhat.com, ani@anisinha.ca,
 den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 00:15:33 +0300
Maxim Davydov <maxim.davydov@openvz.org> wrote:

> Attempt to get memory region if the device doesn't have hostmem may not be
> an error. This can be happen immediately after initialization (getting
> value without default one).

Above statement begs for expanded explanation
Pls rephrase and explain why it's needed and how it will be used.

> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>  hw/i386/sgx-epc.c | 5 ++++-
>  hw/mem/nvdimm.c   | 6 ++++++
>  hw/mem/pc-dimm.c  | 5 +++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index d664829d35..1a4c8acdcc 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -121,9 +121,12 @@ static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
>  {
>      SGXEPCDevice *epc = SGX_EPC(md);
>      HostMemoryBackend *hostmem;
> +    DeviceState *dev = DEVICE(epc);
>  
>      if (!epc->hostmem) {
> -        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
> +        if (dev->realized) {
> +            error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
> +        }
>          return NULL;
>      }
>  
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7c7d777781..61e77e5476 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -166,9 +166,15 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>                                                   Error **errp)
>  {
>      NVDIMMDevice *nvdimm = NVDIMM(md);
> +    PCDIMMDevice *dimm = PC_DIMM(nvdimm);
>      Error *local_err = NULL;
>  
>      if (!nvdimm->nvdimm_mr) {
> +        /* Not error if we try get memory region after init */
> +        if (!dimm->hostmem) {
> +            return NULL;
> +        }
> +
>          nvdimm_prepare_memory_region(nvdimm, &local_err);
>          if (local_err) {
>              error_propagate(errp, local_err);
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index f27e1a11ba..6fd74de97f 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -240,6 +240,11 @@ static void pc_dimm_md_set_addr(MemoryDeviceState *md, uint64_t addr,
>  static MemoryRegion *pc_dimm_md_get_memory_region(MemoryDeviceState *md,
>                                                    Error **errp)
>  {
> +    PCDIMMDevice *dimm = PC_DIMM(md);
> +    /* Not error if we try get memory region after init */
> +    if (!dimm->hostmem) {
> +        return NULL;
> +    }
>      return pc_dimm_get_memory_region(PC_DIMM(md), errp);
>  }
>  


