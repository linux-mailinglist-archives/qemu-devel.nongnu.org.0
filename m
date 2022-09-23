Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD95E789F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:46:52 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obgCp-00046l-0R
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obg80-0001HX-36
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obg7w-0003MK-Jt
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:41:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663929707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pLx155w8BDoTqc6QRal5/+onAcSfuDPOYdgLujAM65A=;
 b=bYoelj+ztvwAoaXmnU6toJcSwLDXzAIL3AaizW5T8E1PBHtOpm3UTkI7931a2writNNxB1
 TZcVJQIdNC711j+Qw9HoJGog5vYJseDM4hAXV0PXfJfhXUZzFXZxebLv4yxGNnTy2Jsv+1
 qUEwMwe9//ZEk6r7d6zDDXFMoJr11cI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-S8P-pycbOiOU3Zz3KkYDJg-1; Fri, 23 Sep 2022 06:41:46 -0400
X-MC-Unique: S8P-pycbOiOU3Zz3KkYDJg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c128-20020a1c3586000000b003b5152ebeb7so345350wma.0
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=pLx155w8BDoTqc6QRal5/+onAcSfuDPOYdgLujAM65A=;
 b=HUuh27H3a10wDZurm1G0XYBKAboVCZjHLhXtg3y+qDzd25lmML7uTDSl9b6YALmsV8
 +c+jOxyQphlJRHx25FV5cF3itSCRuuwlWAsyFw92+lu1SMNSBHwnAkA62GL4GozQmFsI
 0h4daB289+en6/54ajUteFXm+q/b16Ro8Vm7dgDs19fT8r1bB5nlXjvHRWfH2m+kUNKS
 2aZ7lbj91Ky2kvgxLIuyWNOu2YJWtbbC1AOf9i96W+fQu85lnPp4dLZI7dDnN1Cz+ruE
 UttGRz2Ce8FccV5456mLO48igyd/g7VrdNnSrnc3aM50hrpprfEJbYpH84BULwwHal+O
 kJtA==
X-Gm-Message-State: ACrzQf3XcznkgOy3aAd1vXOL3L9i/FzUqdNrl8o2fVr33xXUEtBDWLtj
 1b+cILxvyl924/M4yBD1jNR5/UoVlK4ZvZOML6L1hveTngl1eTm6iqYgwrgr+gFLo3e7Dmf7p+U
 0PQrBwj8OJHKUlnc=
X-Received: by 2002:a5d:64e8:0:b0:22a:bbb0:fa with SMTP id
 g8-20020a5d64e8000000b0022abbb000famr4945429wri.372.1663929704965; 
 Fri, 23 Sep 2022 03:41:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71iGCiHT1nISlB1kQv525RGZtQuVBJ5zIsrEw0J78y/UbsiUtjxmFhR3TkrCVz30GapLn48w==
X-Received: by 2002:a5d:64e8:0:b0:22a:bbb0:fa with SMTP id
 g8-20020a5d64e8000000b0022abbb000famr4945409wri.372.1663929704699; 
 Fri, 23 Sep 2022 03:41:44 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c1d8800b003a342933727sm2301380wms.3.2022.09.23.03.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:41:44 -0700 (PDT)
Date: Fri, 23 Sep 2022 06:41:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 john.g.johnson@oracle.com, pizhenwei@bytedance.com,
 arei.gonglei@huawei.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, dgilbert@redhat.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] Use g_new() & friends where that makes obvious sense
Message-ID: <20220923064130-mutt-send-email-mst@kernel.org>
References: <20220923084254.4173111-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923084254.4173111-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 10:42:54AM +0200, Markus Armbruster wrote:
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> The previous iteration was commit a95942b50c.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/remote/iommu.c         | 2 +-
>  hw/virtio/virtio-crypto.c | 2 +-
>  migration/dirtyrate.c     | 4 ++--
>  softmmu/dirtylimit.c      | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> index fd723d91f3..1391dd712c 100644
> --- a/hw/remote/iommu.c
> +++ b/hw/remote/iommu.c
> @@ -47,7 +47,7 @@ static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
>      elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
>  
>      if (!elem) {
> -        elem = g_malloc0(sizeof(RemoteIommuElem));
> +        elem = g_new0(RemoteIommuElem, 1);
>          g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
>      }
>  
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index c1243c3f93..df4bde210b 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -710,7 +710,7 @@ virtio_crypto_handle_asym_req(VirtIOCrypto *vcrypto,
>      uint8_t *src = NULL;
>      uint8_t *dst = NULL;
>  
> -    asym_op_info = g_malloc0(sizeof(CryptoDevBackendAsymOpInfo));
> +    asym_op_info = g_new0(CryptoDevBackendAsymOpInfo, 1);
>      src_len = ldl_le_p(&req->para.src_data_len);
>      dst_len = ldl_le_p(&req->para.dst_data_len);
>  
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 795fab5c37..d6f1e01a70 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -119,9 +119,9 @@ static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
>      }
>  
>      stat->nvcpu = nvcpu;
> -    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
> +    stat->rates = g_new0(DirtyRateVcpu, nvcpu);
>  
> -    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
> +    records = g_new0(DirtyPageRecord, nvcpu);
>  
>      return records;
>  }
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 8d98cb7f2c..12668555f2 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -154,7 +154,7 @@ void vcpu_dirty_rate_stat_initialize(void)
>  
>      vcpu_dirty_rate_stat->stat.nvcpu = max_cpus;
>      vcpu_dirty_rate_stat->stat.rates =
> -        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
> +        g_new0(DirtyRateVcpu, max_cpus);
>  
>      vcpu_dirty_rate_stat->running = false;
>  }
> @@ -198,7 +198,7 @@ void dirtylimit_state_initialize(void)
>      dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
>  
>      dirtylimit_state->states =
> -            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
> +            g_new0(VcpuDirtyLimitState, max_cpus);
>  
>      for (i = 0; i < max_cpus; i++) {
>          dirtylimit_state->states[i].cpu_index = i;
> -- 
> 2.37.2


