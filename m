Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910B142F0B1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 14:24:51 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbMGY-0001Da-6y
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 08:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbMEe-0008Nv-2H
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbMEU-0005Am-Rn
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 08:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634300551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+x9BScqdGty8iclCmqSRltRG2OtvTpe4Lmba3DYdls=;
 b=LZTbraSsDBwN9E6Ue/8xoZp9Y/mtqBnuj3ZxEZu5URUGKoq8Yvv+Yc6eyraLn6BewUAmgr
 I6wVOjSAFtphckR+woIjjO4RRiYwfkOS7B3Aa03YTrBiCxFiiAQ16paoD2C18c50kXiNQx
 F4bP91hS7Vwt2Fgc2gZrQ+uL6XY/J58=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-lHoYillsNt6RW__LL2ZDCA-1; Fri, 15 Oct 2021 08:22:29 -0400
X-MC-Unique: lHoYillsNt6RW__LL2ZDCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l8-20020a5d6d88000000b001611b5de796so5872482wrs.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 05:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X+x9BScqdGty8iclCmqSRltRG2OtvTpe4Lmba3DYdls=;
 b=ppC/ecXoCnm02f+w+SIgzBshJbWMi9H5DGsO1m6TKSdTTDzcuAldqtyCmhtMoRCWUG
 4AcY/Lm2E03GcZWylCkzgrXuyGMEArpxuFnWo78zFfg6YBIvuh3fiTqsukgOWu3Uaxm0
 nVpxTnStTROF78fd0nRp3HhpxkeQp1x4UNvNRTWHNzRcSSigQKiZNry3LLP3TXSUjUHT
 D3O8KnTwH2ZUHfRdf4ynRQMIwaTCWzcixWWOv4WFJpzMebE95UsI6njp1hWcxvBToCpH
 Cc5QbJSGXxRnBcKc6x2R4sZT7wWrmBkxgKqMD26mJ9U2xM331pgr6VG9JBZu1GUDfvx7
 ypdA==
X-Gm-Message-State: AOAM533VZfHd67/b1HIeb1HZVkEMZ1hPDF/uPfaRzB3IqyvQi7nBi8X3
 kNZ9fV8oBBikmcl5aeIVaIGtkdz+k+pztitxjrL0MV5DnQat/RDUa3MIPAi6UnIDul8n8joOTg2
 3plBSbn2p2dKHwTY=
X-Received: by 2002:a7b:c856:: with SMTP id c22mr25723731wml.116.1634300548706; 
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx64OJFXv9IchRxtt9mt+lpQey81+rRAmgdKqoiPQdaz3onxDB2glHbQ42QCtsfEx2Zja8Ukg==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr25723696wml.116.1634300548422; 
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id d24sm4496850wmb.35.2021.10.15.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:22:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Message-ID: <20211015122226.g42zu7hsbc2fey27@gator>
References: <20211015104909.16722-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015104909.16722-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: robh@kernel.org, qemu-riscv@nongnu.org, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 06:49:09PM +0800, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=512M            \
>   -object memory-backend-ram,id=mem1,size=512M            \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>   -numa node,nodeid=2                                     \
>   -numa node,nodeid=3
>     :
>   qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. As the memory hotplug through device-tree on ARM64 isn't existing
> so far, it's pointless to expose the empty NUMA nodes through device-tree.

Instead of "it's pointless to expose the empty NUMA nodes through
device-tree", how about

 it's not necessary to require the user to provide a distance map.
 Furthermore, the default distance map Linux generates may even be
 sufficient.

> So this simply skips populating the device-tree nodes for these empty
> NUMA nodes to avoid the error, so that QEMU can be started successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v4: Drop patch to enforce distance-map as memory hotplug through
>     device-tree is never supported on ARM64. It's pointless to
>     expose these empty NUMA nodes. Besides, comments added to
>     explain the code changes included in this patch as Drew
>     suggested.
> ---
>  hw/arm/boot.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee4..e05c1c149c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -599,10 +599,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>      g_strfreev(node_path);
>  
> +    /*
> +     * According to Linux NUMA binding document, the device tree nodes
> +     * for the empty NUMA nodes shouldn't be generated, but their NUMA
> +     * node IDs should be included in the distance map instead. However,
> +     * it's pointless to expose the empty NUMA nodes as memory hotplug
> +     * through device tree is never supported. We simply skip generating
> +     * their device tree nodes to avoid the unexpected device tree
> +     * generating failure due to the duplicated names of these empty
> +     * NUMA nodes.
> +     */

    /*
     * We drop all the memory nodes which correspond to empty NUMA nodes from
     * the device tree, because the Linux NUMA binding document states they
     * should not be generated.  Linux will get the NUMA node IDs of the empty
     * NUMA nodes from the distance map if they are needed.  This means QEMU
     * users may be obliged to provide command lines which configure distance
     * maps when the empty NUMA node IDs are needed and Linux's default
     * distance map isn't sufficient.
     */



>      if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
>          mem_base = binfo->loader_start;
>          for (i = 0; i < ms->numa_state->num_nodes; i++) {
>              mem_len = ms->numa_state->nodes[i].node_mem;
> +            if (!mem_len) {
> +                continue;
> +            }
> +
>              rc = fdt_add_memory_node(fdt, acells, mem_base,
>                                       scells, mem_len, i);
>              if (rc < 0) {
> -- 
> 2.23.0
>

Thanks,
drew 


