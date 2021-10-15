Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0442F1F3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:13:25 +0200 (CEST)
Received: from localhost ([::1]:45326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbN1X-0006uQ-Ug
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0G-0005jZ-Ex
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0D-0006jv-5K
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=Ut5yHHFvW0U/vkQtuLfL7Lnzp+c/xq/CwyTBSQwuhpS+KQyuYIvjFYfgWEzSx1CafEmxl3
 HM/Odf9XoaYpzbMOf87h7FoOmR4bopL9mpuFtcgf81IZC5TsJsDn7bftzmByXjjZNdrxaG
 B7Eo7A8Js8ZHHisxvlb86cT3MhmOzqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-_GMwpvjxPVu2Ziv5KzEwiQ-1; Fri, 15 Oct 2021 09:11:58 -0400
X-MC-Unique: _GMwpvjxPVu2Ziv5KzEwiQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p12-20020adfc38c000000b00160d6a7e293so5876752wrf.18
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 06:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=EmBo+36SJccq+3+Wo4as7ZDr3W/oAISeZmeDkT9OZX4k+iX79Yk2aThoIFrS4mm6cj
 fRLsb6YYIIv6BTZTS9Odn3xMsMsUcPYvQS9EYL9iYIlvioaB+x+HvmC0nN8YSc81yP2U
 psa4NV7dgyCN3kn93drNW/wsU+7G4jt8LJAQw6agoa3cDuHKakQGA6X4pcnWkVvOmVB9
 ZfZWK9rPKwkmux1cJm2W4UNkCoioDLpiuqWhp0SRLFRUuoLyU4SVgUCC0X0ket5rh2lD
 UR38SWaH525iKSTed0RHzxdXNDthBH4PLcZiU5cKQimlS3KKDMGndawqb3tmgYbbMTsv
 Nzpw==
X-Gm-Message-State: AOAM5327+Y00sdUi+t1WD2zRrvQNlqaTTvCqwVmyIhVSyYe9qEDh4fWU
 8mVd3cw+Hy2nRFdBPMdXT+nfZLh1XplZDiLfQlrkTHOLNP2yQczP8aHOPD4WIgvhFK3eIfQVVHw
 DF9/vchNKzXdSByc=
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520953wmo.62.1634303517618; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH/RPkL0k/On5M8a5PrYVwxDtVsHMvBBQwj8qKqU+ySK9grorAZioCN5F694iVRK8Txf7rNg==
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520899wmo.62.1634303517258; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id j16sm4955421wms.16.2021.10.15.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:11:56 -0700 (PDT)
Date: Fri, 15 Oct 2021 15:11:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Message-ID: <20211015131155.jkxapvfvrlteo4k7@gator>
References: <20211015124246.23073-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Oct 15, 2021 at 08:42:46PM +0800, Gavin Shan wrote:
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
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.
> ---
>  hw/arm/boot.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee4..74ad397b1f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -599,10 +599,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>      g_strfreev(node_path);
>  
> +    /*
> +     * We drop all the memory nodes which correspond to empty NUMA nodes
> +     * from the device tree, because the Linux NUMA binding document
> +     * states they should not be generated. Linux will get the NUMA node
> +     * IDs of the empty NUMA nodes from the distance map if they are needed.
> +     * This means QEMU users may be obliged to provide command lines which
> +     * configure distance maps when the empty NUMA node IDs are needed and
> +     * Linux's default distance map isn't sufficient.
> +     */
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

Reviewed-by: Andrew Jones <drjones@redhat.com>


