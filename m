Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23052BED1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:43:15 +0200 (CEST)
Received: from localhost ([::1]:42626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLpS-00057u-DF
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nrLoc-0004GT-UQ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nrLoa-0007K6-Pa
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652888539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aL+pDwLuXBhmobSCYyX9Wi8PrWeU334jP1yReq6Rd6E=;
 b=cnaeHothaxRBNW5anuuvt56gBigIC+mJVztwdD1Zz5a5EBwMF75vpK/KUi74JaiQ4Lo2yP
 lgiKl+wFC8QKSoUdbt3LODus6n6W67c7PZ4Wve2KuY05ceOj1FRBLO8cVRvrJc2VxRyPWj
 q23JgiIMi6KzxMDY3xjG4meI58jQ4jk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-VqpD0QviMT-XoTl4NiynPQ-1; Wed, 18 May 2022 11:42:16 -0400
X-MC-Unique: VqpD0QviMT-XoTl4NiynPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso918206wmm.4
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 08:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aL+pDwLuXBhmobSCYyX9Wi8PrWeU334jP1yReq6Rd6E=;
 b=8HZLi27sV/Ox2HEOrV0FHGYJi9d0hmJ5pCU4f/FFqAFQIU1rAtuMLTe9BOa9wGKugu
 G6rMLjA6HRgLJfSGlYqoU8EGyZ1CSpd86S8wM86i63nCjmSIhH752YUUDc+b5J/o000w
 JPGuHgl5cz04b4xG+ISa7uL3RdrCts52tU3Aqhg/cbgqNRLK+SyyZdJ6yz612uhIC1a9
 Dhw0/l1+WDV7XX3/u2sgjOAqYQI/SkNYA2fRHUTu/y8i7l7OUqdt7kEMfFgEvhSYohMK
 6A8REkurAiN5ikiKCZARbktSAKyWlj0n0T4RdfoXVgKrw9hZUXGYeDAtcNtiJB+skkLN
 F/qA==
X-Gm-Message-State: AOAM5330mgxfGgBMDMmKUN3TWTVXuITb4+qvC+0vyvHCx/LnycQbkHPs
 iGYcf4fJSuzj9YTxRm5+dUOiOwwyUhbwkXpowTYT+LqYAz0KC/h2CgHURsB4SQgOIQRmPTQCGZN
 zFDqYTxZBRfFG5C0=
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr276884wrp.228.1652888535532; 
 Wed, 18 May 2022 08:42:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz8/3yZSzQ9jfPnmm4fg/gArwCSrI2sjRKjAmJX4pIJjmvgcf6b50ZqOOjdziw7TFQOthLuA==
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr276853wrp.228.1652888535263; 
 Wed, 18 May 2022 08:42:15 -0700 (PDT)
Received: from gator (cst2-173-79.cust.vodafone.cz. [31.30.173.79])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c089200b00397193aafc7sm1875666wmp.47.2022.05.18.08.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 08:42:14 -0700 (PDT)
Date: Wed, 18 May 2022 17:42:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, wangyanan55@huawei.com,
 Jonathan.Cameron@huawei.com, peter.maydell@linaro.org,
 berrange@redhat.com, thuth@redhat.com, eduardo@habkost.net,
 lvivier@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 0/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs
 in PPTT
Message-ID: <20220518154212.i6usstptkvi2zssk@gator>
References: <20220518092141.1050852-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518092141.1050852-1-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
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

On Wed, May 18, 2022 at 05:21:38PM +0800, Gavin Shan wrote:
> The {socket, cluster, core} IDs detected from Linux guest aren't
> matching with what have been provided in PPTT. The flag used for
> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
> nodes. In this case, Linux guest takes the offset between the
> node and PPTT header as the corresponding IDs, as the following
> logs show.
> 
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>   -accel kvm -machine virt,gic-version=host -cpu host       \
>   -smp 8,sockets=2,clusters=2,cores=2,threads=1
>     :
>     
>   # cd /sys/devices/system/cpu
>   # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>     36  36  36  36  36  36  36  36
>     336 336 336 336 336 336 336 336
>   # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>     56  56  56  56  196 196 196 196
>     356 356 356 356 496 496 496 496
>   # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>     76  76  136 136 216 216 276 276
>     376 376 436 436 516 516 576 576
> 
> This fixes the issue by setting 'ACPI Processor ID valid' flag for
> {socket, cluster, core} nodes. With this applied, the IDs are exactly
> what have been provided in PPTT. I also checked the PPTT table on my
> host, where the 'ACPI Processor ID valid' is set for cluster/core nodes,
> but missed from socket nodes.
> 
>   host# pwd
>   /sys/devices/system/cpu
>   host# cat cpu0/topology/physical_package_id; \
>         cat cpu0/topology/cluster_id;          \
>         cat cpu0/topology/core_id
>   36 0 0
> 
> Gavin Shan (3):
>   tests/acpi/virt: Allow PPTT ACPI table changes
>   hw/acpi/aml-build: Fix {socket, cluster, core} IDs in PPTT
>   tests/acpi/virt: Update PPTT ACPI table
> 
>  hw/acpi/aml-build.c       |   9 ++++++---
>  tests/data/acpi/virt/PPTT | Bin 96 -> 96 bytes
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> -- 
> 2.23.0
>

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>


