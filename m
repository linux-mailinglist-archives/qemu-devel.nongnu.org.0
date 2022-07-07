Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837A56A30A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:00:27 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9R7J-0007jb-9q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9R54-0005f8-36
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9R4y-0006XA-WD
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657198679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pnyq8h+Je5HCxvu87pio9mNVUBbXiUkr0hENGD812Ng=;
 b=HVqTOVNTIW9RiKltzlC0SvxpDRh1MB107tNsY17+GjEYTXbdCppSeIYzg/he74gbCLEQCm
 4+KSwt+d4t/w4KHg558f7xe69ldYtn1s7RiwMYanyq+GTETPhLBM2+6KZ857lVW6odTrJT
 6ZY8lCqZP80dVVt2L4P2fqZnDmP6pEQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-SJZOYmedOiW6Pv4SS9Xcyg-1; Thu, 07 Jul 2022 08:57:58 -0400
X-MC-Unique: SJZOYmedOiW6Pv4SS9Xcyg-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk8-20020a1709077f8800b00722fcbfdcf7so4679394ejc.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pnyq8h+Je5HCxvu87pio9mNVUBbXiUkr0hENGD812Ng=;
 b=0XXCWR3tlpCwtd3VI7KGVUr/bxH6fndRFEzOqMd651aDoF3cLbSfZHBG89ht5w7bci
 Aii1+dGj6rb8DGCCcSOOmSS95c7dJmNf9KJ6PxKpqYL0q/xmO97QFdX31s5TLzEkXzVW
 dzWyjH/Se8LvIg5PMBr/05JNKTfGu/DZgumeCv93vAOzO9mBgv/ZNzoVRYhIhPNkYs/O
 Wl2grT9giACv1c3Nk7/MmFJ9KEq0ZvFPPGNW1Bp0/m2m7CReiIzdf908u3Yoay4a45p9
 wdoLJaeOU6PAS9kqLAgdoR7mKNfcDdMlGUK/itaiCM36f+efOu3ZEkSlShzGLRQIanSq
 lR3A==
X-Gm-Message-State: AJIora+UL+m5N171XiK68nTJwJgNRYoTTsdE52NNfGFAGbtE4XcWqnud
 eZJ2AxQ1XDSJavVUT8gX+6sbU8uTyk7yK1aqmi1j1+AD8e39mZ6h4oJfTBd/lS4/vBIS0dPBs0P
 3R9KQ1LEd1l1rmhc=
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id
 q13-20020a056402248d00b00437dd4ce70emr59723576eda.75.1657198677468; 
 Thu, 07 Jul 2022 05:57:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sOTutUPRcgxdHtWVL6qgbe3u+E8RN6X2a2PT2BCWcHJZquigcj4q/R8VZXKpXdMy8ZMd74cQ==
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id
 q13-20020a056402248d00b00437dd4ce70emr59723543eda.75.1657198677243; 
 Thu, 07 Jul 2022 05:57:57 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a1709063cb100b0072b1c21ce65sm59669ejh.150.2022.07.07.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:57:56 -0700 (PDT)
Date: Thu, 7 Jul 2022 14:57:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 05/10] i386/pc: factor out cxl range end to helper
Message-ID: <20220707145755.280abc54@redhat.com>
In-Reply-To: <20220701161014.3850-6-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-6-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Jul 2022 17:10:09 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Move calculation of CXL memory region end to separate helper in
> preparation to allow pc_pci_hole64_start() to be called before
> any mrs are initialized.
s/mrs/memory regions/



> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 6c7c49ca5a32..0abbf81841a9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> +static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
> +{
> +    uint64_t start = 0;
> +
> +    if (pcms->cxl_devices_state.host_mr.addr) {
> +        start = pcms->cxl_devices_state.host_mr.addr +
> +            memory_region_size(&pcms->cxl_devices_state.host_mr);
> +        if (pcms->cxl_devices_state.fixed_windows) {
> +            GList *it;
> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +                CXLFixedWindow *fw = it->data;
> +                start = fw->mr.addr + memory_region_size(&fw->mr);
> +            }

this block deals with 'initialized' memory regions,
so claim 'before any mrs are initialized' in commit message is
confusing at least or outright wrong.

> +        }
> +    }
> +
> +    return start;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -1022,16 +1041,8 @@ uint64_t pc_pci_hole64_start(void)
>      MachineState *ms = MACHINE(pcms);
>      uint64_t hole64_start = 0;
>  
> -    if (pcms->cxl_devices_state.host_mr.addr) {
> -        hole64_start = pcms->cxl_devices_state.host_mr.addr +
> -            memory_region_size(&pcms->cxl_devices_state.host_mr);
> -        if (pcms->cxl_devices_state.fixed_windows) {
> -            GList *it;
> -            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> -                CXLFixedWindow *fw = it->data;
> -                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
> -            }
> -        }
> +    if (pcms->cxl_devices_state.is_enabled) {
> +        hole64_start = pc_get_cxl_range_end(pcms);
>      } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
>          hole64_start = ms->device_memory->base;
>          if (!pcmc->broken_reserved_end) {


