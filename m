Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23405782FC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:02:17 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQO5-0006Do-51
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQKb-0004Ix-Fw
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQKZ-0000lo-GT
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658149114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+2MT+ZOvWCuQE44yyHOstvuXuET//e6CBy9yh903hU=;
 b=Ng/BFmdFOUAghHmLjlnKVBcBMXDXEDLiClgLJSJ5Iik9snODfn/M8OyycvRAXdoS1C16Kb
 Dzy6+F3f2igZSRMMRC/DWGc54VbBxguavw6ig+ooOEczY0xR8XMAwu+98hBAoGT6g1Iazt
 L5Qp3VVb8cI0EclhsrahnWlSW67+3lc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-k8FE1xecOL-U8T-rva4yOA-1; Mon, 18 Jul 2022 08:58:33 -0400
X-MC-Unique: k8FE1xecOL-U8T-rva4yOA-1
Received: by mail-ej1-f70.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso2249872ejs.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+2MT+ZOvWCuQE44yyHOstvuXuET//e6CBy9yh903hU=;
 b=NbSB63Oxvv+kinIcK2ADvz2yU3Er+xKb7uScCZIhP/elw5NF8nsAQd19r5/SoU1VbS
 8MaRSV8vQDKCXrWba/RSDGpHZpnwiEYL7JrNORBv/OUNT8aKD/FUHgn3o4tqGgwkkqWc
 lfQV+/Mq1U6MyCy7+1cqiyYhhGlxYm+ph6S0M43iyc3WMMSdmbZ1KTL+dM+mjb4qJk4Y
 vc8LzQV30s22Qts8yCb80hvkc/8YHmdGwubgvLa3u4Z7Fr39WwyI12KxcmWNiMqEXLSs
 OVFEFA4On+4WjElB+9RGazb8wFs5A5oofUYMh+93kll64pYfUBHvj6XLNjYUSLuIQRxK
 a5Pg==
X-Gm-Message-State: AJIora9qtmbySgYg5BAApGIzFakdfyzIc2cjqc3ZPwf0V5d3vKJhw5jx
 Tb9Gpj4LtihQxOnjqkpPHGmecl1HVkWcz/SlKbRigOMSw7yxJbO6md1Ve4TtgY9ViY3RR6gbCXe
 oTnT3UTFhVHji5WY=
X-Received: by 2002:a05:6402:2689:b0:43a:dc35:11bb with SMTP id
 w9-20020a056402268900b0043adc3511bbmr38308055edd.262.1658149112128; 
 Mon, 18 Jul 2022 05:58:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKu0uAw8PVpkKCBFyWGbCopoJDx+nI2KNaHDWv6DPvvKDBafSM74trcBCiQg7G0N0xbwgYWg==
X-Received: by 2002:a05:6402:2689:b0:43a:dc35:11bb with SMTP id
 w9-20020a056402268900b0043adc3511bbmr38308019edd.262.1658149111904; 
 Mon, 18 Jul 2022 05:58:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a170906719b00b0072aeaa1bb5esm5454769ejk.211.2022.07.18.05.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 05:58:31 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:58:29 +0200
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
Subject: Re: [PATCH v8 07/11] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Message-ID: <20220718145829.6a9f2235@redhat.com>
In-Reply-To: <20220715171628.21437-8-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-8-joao.m.martins@oracle.com>
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

On Fri, 15 Jul 2022 18:16:24 +0100
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
                                                     ^^^^^
why it's here?

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

and also this unexplained alignment.

> +        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
> +            CXLFixedWindow *fw = it->data;
> +            start += fw->size;
>          }
>      }
>  


