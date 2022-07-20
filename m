Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F057B1F0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:42:01 +0200 (CEST)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4LI-0002T9-Tn
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oE4JV-0000wl-NI
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:40:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oE4JQ-0004hc-Tv
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658302802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmdsvrein+a/zHUj5qF5NAW5L24ZAblN/tvoCAuEuFQ=;
 b=KRIblr3dzuQEePXh7jhydfaLSGcqr60jl48Jz/tpnClFVwCfRg+XVg06k++73fIcKW3wYl
 8I02f1fMqqEwjsno9luCtbGCVAsM7PPE4r5mNjjrEk+90/Ut4PgvKOwB08AZdhruYPI0US
 UU7hYwyVylbDAkR0wPC9PiCFdxY2P28=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-8FxW3No5P9yQN7ct_O9aFA-1; Wed, 20 Jul 2022 03:40:00 -0400
X-MC-Unique: 8FxW3No5P9yQN7ct_O9aFA-1
Received: by mail-ej1-f69.google.com with SMTP id
 qk18-20020a1709077f9200b0072b95d9eea3so3690645ejc.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 00:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vmdsvrein+a/zHUj5qF5NAW5L24ZAblN/tvoCAuEuFQ=;
 b=dU9rFEPDLjyPFtGMVlGcSaCuPULoCDsBom/y5mpyTgMoZDNR0RKvgvDbyL/iYCNZjN
 36ejTIJltr5TZeGUXwTJjtr/YtfzbZcLu5Ud/M1RyagMxuKDhFbbLZqh5lJxL4atsKP9
 Dr0xkxDXa9YyospCbApa7SylBdGOVCWtLHSBt3yKJlJq+wqxTO8s7Y6PMvro7OWl0xwL
 UJDqjMAVzKcp4yor3pYzWCR3pFj7P43x5aES2gmQ+W2AxkwtMmXx1IGlkQVbzbhJ8X44
 YW5xQVQNMfj4/qDHHbVtwR5f1eN7f21uMvVyW7/G3kRHD+JEcG17CN5mgORTHK9IwpHa
 eFAw==
X-Gm-Message-State: AJIora9HDgcAMknPa5mKNL+JmzbvvMU2ghGqh7r3cyJIJUVOmiezPIQL
 N0/1jvtx+8wVdf7O1AXLLD/amiAzilaRKUxxvcqM4ANyYCS6fBmm+QsohKmAX4QfEYfoSl6NON1
 NUs6gFiOWl8HoU14=
X-Received: by 2002:a17:906:8a63:b0:72b:3796:9d0b with SMTP id
 hy3-20020a1709068a6300b0072b37969d0bmr33493951ejc.573.1658302799060; 
 Wed, 20 Jul 2022 00:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZJoOGGVjPP1y9IkjOsHz6R3YDWedDL91ki/dNyD/z5/0MPXq25jIocWuh0WWQH4x/2/fVgA==
X-Received: by 2002:a17:906:8a63:b0:72b:3796:9d0b with SMTP id
 hy3-20020a1709068a6300b0072b37969d0bmr33493929ejc.573.1658302798827; 
 Wed, 20 Jul 2022 00:39:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 zk8-20020a17090733c800b00705cd37fd5asm7561405ejb.72.2022.07.20.00.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 00:39:58 -0700 (PDT)
Date: Wed, 20 Jul 2022 09:39:57 +0200
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
Subject: Re: [PATCH v9 07/11] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Message-ID: <20220720093957.34d9c701@redhat.com>
In-Reply-To: <20220719170014.27028-8-joao.m.martins@oracle.com>
References: <20220719170014.27028-1-joao.m.martins@oracle.com>
 <20220719170014.27028-8-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 19 Jul 2022 18:00:10 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Remove pc_get_cxl_range_end() dependency on the CXL memory region,
> and replace with one that does not require the CXL host_mr to determine
> the start of CXL start.
> 
> This in preparation to allow pc_pci_hole64_start() to be called early
> in pc_memory_init(), handle CXL memory region end when its underlying
> memory region isn't yet initialized.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 3fdcab4bb4f3..c654be6cf0bd 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -843,17 +843,15 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>  
>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>  {
> -    uint64_t start = 0;
> +    uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
>  
> -    if (pcms->cxl_devices_state.host_mr.addr) {
> -        start = pcms->cxl_devices_state.host_mr.addr +
> -            memory_region_size(&pcms->cxl_devices_state.host_mr);
> -        if (pcms->cxl_devices_state.fixed_windows) {
> -            GList *it;
> -            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> -                CXLFixedWindow *fw = it->data;
> -                start = fw->mr.addr + memory_region_size(&fw->mr);
> -            }
> +    if (pcms->cxl_devices_state.fixed_windows) {
> +        GList *it;
> +
> +        start = ROUND_UP(start, 256 * MiB);
> +        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +            start += fw->size;
>          }
>      }
>  


