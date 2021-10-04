Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE33420949
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:24:26 +0200 (CEST)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXL8y-00029z-Ml
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXL0L-0007rt-8o
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXL0G-00055h-Nr
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yDF1c1dqYgH2Cwme9oa02nYdGNUhXjuRR+mKl+EbFaI=;
 b=SuJS+ZUXF3ebZRXrn9KzAkGZZ6JJja6fCJgFJ2x7DtH3byWZcNMyhqeFU3R6jmEqN14lca
 Xwc86DLw5F160QUyeGJStDq0UJYojVqmmUQ1HIQPZEdI7ABAEmNzhb91mPeiG7wulbanLk
 cwbmo/ZUh6YJKitP7AQtj+Yw1ZxBgRc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-1by_EVCBNqWgekhWFB-TXg-1; Mon, 04 Oct 2021 06:15:23 -0400
X-MC-Unique: 1by_EVCBNqWgekhWFB-TXg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e11-20020a5d500b000000b001609d035ea5so1605151wrt.22
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yDF1c1dqYgH2Cwme9oa02nYdGNUhXjuRR+mKl+EbFaI=;
 b=MmOZ/4n9KnKlA4zDsCX7ZUiheOGuSL43/y6v0q6bGVlWSEsHU3Xb7fdd1pBxb09Th0
 /Cw/+p7Q4ZTqbmWas1AcbF3BS1wbqQsemwUAv+AzbmL7vkn1+f7LSkmpeVgH3EFcq1PT
 INOXPVAtY18vHDYPysLm6cFy5H3hSH7ks9MOf6lWinjHnCMpf0tL0CNmMZHP0wTB/5o+
 0XYwjusu9Ep3FBqPFxD8FTZlobdvmBcTmrQpGC10h4JeByjnncSlRVO8mEN5t23oLOKE
 hdwvS/Yf3uvLdWYaNu6s8PSf3eTovub1Q3wI9ZxfGWWME/fxf3qWNViqPodx4S7iQLtK
 L8wA==
X-Gm-Message-State: AOAM533mhwfAG+kOukF/Ci8N2XDvOZwXRGhSVuxkc8G4O2h+IlVsCog3
 LqcGTt6dccH3y84+F0/fDdEJJ4+lj4vPqkWefpEBz7HwryPReyzeVM/tRz1DIXPd5xtQLUslNSq
 z687m0KhV8lXb/6c=
X-Received: by 2002:adf:8b41:: with SMTP id v1mr9713728wra.255.1633342522129; 
 Mon, 04 Oct 2021 03:15:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRStbmwZwWa77a0AnUFnuhdU26j6wRpa9Rnhj7K3iPzyC6wV10RHSZQFJAaQQey6pPDse5KA==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr9713703wra.255.1633342521934; 
 Mon, 04 Oct 2021 03:15:21 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id v23sm13920203wmj.4.2021.10.04.03.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 03:15:21 -0700 (PDT)
Date: Mon, 4 Oct 2021 12:15:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 4/5] hw/arm/virt: Use the PA range to compute the
 memory map
Message-ID: <20211004101520.6sqx2jubmqd6djhb@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-5-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-5-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.055, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:04PM +0100, Marc Zyngier wrote:
...
> @@ -1662,9 +1665,17 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = (vms->highmem ?
> -                        base :
> -                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
> +
> +    /*
> +     * If base fits within pa_bits, all good. If it doesn't, limit it
> +     * to the end of RAM, which is guaranteed to fit within pa_bits.
> +     */
> +    if (base <= BIT_ULL(pa_bits)) {
> +        vms->highest_gpa = base -1;
                                    ^ missing space here

> +    } else {
> +        vms->highest_gpa = memtop - 1;
> +    }
> +
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;

Thanks,
drew


