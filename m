Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88765396E3F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:52:25 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzCK-0000mN-MJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lnzAt-0008EU-Cg
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lnzAr-0004oa-FY
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 03:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622533852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C64e75GgMTRWfcurqOMRagNaQwEx0C5Uf35Lq9xHlK8=;
 b=BlUwl+Bdw+5p1ZdQZwaxYqFv5O+qI7nwbFF3Sy8C9UnQHZyHLd0NLJ3y6KlKSDNfEZwHGb
 6U+kvHPUxT4HFMBliyS+XNtIl6DqYCwDFog8+AJAoE9Q64czfOvGJrRgEQ1Ua0rZjRCIOO
 N4EKFLPyFJLu/GhA9COxtHGhDxnFmKA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-3Ok82P9RMZ-LyHyMFIzrLw-1; Tue, 01 Jun 2021 03:50:49 -0400
X-MC-Unique: 3Ok82P9RMZ-LyHyMFIzrLw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c24-20020aa7c7580000b029038fd7468047so3996540eds.20
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 00:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C64e75GgMTRWfcurqOMRagNaQwEx0C5Uf35Lq9xHlK8=;
 b=CPBzHKhc9JeH7RHTe+286Cqz4lwCB8ZJ77SWCHkvCLx93BIVh5BzkbS75WTeoNCE4P
 MN1GoLEJPNPj1XATp4nw2Eo6S77uc7UCTTXfvfkxOlA0sqneZz04F3d9xIPFsCj+Z8Sf
 MsyUF+AMQ19OUJuqe4JJXros+pW5JDbnZeljlsOox1CRxSao0Y8nCDqxKV076pekg0n3
 A/kUfrYADBjh98veSXSdnzJG7KDUin4lp6q4HY59xaoQHXCinTfEWC/3TdV1HOovoIgA
 etluaf2SzWq0rJEmnOKFtUbHwiWJrVB3Vn6k2kYR0vLqddExAlGAoWDLgwVh/3up/XpY
 F6Pg==
X-Gm-Message-State: AOAM53397dkjPyFOHLgDljaCkyLcxyr+zp1hMLOb8LT2t4hRA4WgqRJs
 Uw7xM7EzE3KtKh/zOuQEoXc0DaX2VYF/SFOM/w+fjdJ+BsDSl7QTRKTab1BldjOa8xrXBsTPV/W
 y3r1xzGz1R4vHzCg=
X-Received: by 2002:a17:906:27d3:: with SMTP id
 k19mr6628310ejc.368.1622533848249; 
 Tue, 01 Jun 2021 00:50:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfGdEWgOOZuk1qCtNf+qh2HDsHc2wz/lCCw6dgP+ztTtljiJIJW8S1pHvQxfE/r6bgi1ifqA==
X-Received: by 2002:a17:906:27d3:: with SMTP id
 k19mr6628271ejc.368.1622533847904; 
 Tue, 01 Jun 2021 00:50:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id bh3sm6857061ejb.19.2021.06.01.00.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 00:50:47 -0700 (PDT)
Date: Tue, 1 Jun 2021 09:50:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210601075045.ppmceogd5hp5rqcf@gator.home>
References: <20210601073004.106490-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601073004.106490-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> We possibly populate empty nodes where memory isn't included and might
> be hot added at late time. The FDT memory nodes can't be created due
> to conflicts on their names if multiple empty nodes are specified.
> For example, the VM fails to start with the following error messages.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
>   -accel kvm -machine virt,gic-version=host                        \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
>   -object memory-backend-ram,id=mem0,size=512M                     \
>   -object memory-backend-ram,id=mem1,size=512M                     \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
>   -numa node,nodeid=2                                              \
>   -numa node,nodeid=3                                              \
>     :
>   -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> 
>   qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
>                        FDT_ERR_EXISTS
> 
> This fixes the issue by using NUMA node ID or zero in the memory node
> name to avoid the conflicting memory node names. With this applied, the
> VM can boot successfully with above command lines.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/boot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d7b059225e..3169bdf595 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>      char *nodename;
>      int ret;
>  
> -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    if (numa_node_id >= 0) {
> +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> +    } else {
> +        nodename = g_strdup("/memory@0");
> +    }
> +
>      qemu_fdt_add_subnode(fdt, nodename);
>      qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>      ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> -- 
> 2.23.0
>

Hi Gavin,

Is it conventional to use the unit-address like this? If so, can you point
out where that's documented? If it's not conventional, then we shouldn't
do it. And then I'm not sure what we should do in this case. Here's a
couple links I found, but they don't really help...

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#sect-node-names
https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#memory-node

Thanks,
drew


