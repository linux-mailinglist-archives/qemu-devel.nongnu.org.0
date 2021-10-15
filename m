Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A642ED30
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:09:01 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJD2-0005cv-Sp
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbIfH-0005xt-RI
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbIfF-0008GC-62
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 04:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634286844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TYrMW4J2GLrUnZ2qu0QF95C2NwS5VrQGpSyTnUJImo0=;
 b=ADzRA4XPALD5a3HhlBvk8rZFHbMCAJuBdw/F8X2CsnVp5ctRptilw0PC99VJxX1n+jhpMK
 fCn3O3ddrGSr1f6Tq3q+uUz0nv28+mjTrmMiNN7luhlpEOYdbALnXyDXZZwaUXbU2zpTCY
 qC/DFzeKmmQbZy5t+/eWSwRmPyCsMAg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-0vkO7LuFPe64jykVXA_5iw-1; Fri, 15 Oct 2021 04:34:03 -0400
X-MC-Unique: 0vkO7LuFPe64jykVXA_5iw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso441313wrf.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 01:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYrMW4J2GLrUnZ2qu0QF95C2NwS5VrQGpSyTnUJImo0=;
 b=uppA7HXOkp3p/XbIB3o+Zh93pe+WQaV2PsXm4Z222JFAPuTw6Ubmc0vMUjvqoLbOx6
 w8OjXaS9sf8fdGF33wK6yzf1+7fceP/duw3Cy309PSGr6a1ym1JqtWQAc4tf+Eo7pmME
 1ArLwC1uN8vT7vfuHq7s4ybMgSF0KdxVuSf5Bg7W9NpPDQ3pvXVbjYalP0Pd2W2wRMef
 uNBCBLVCgXM+8JCCz0u20ghaKLH8HNBHmDyO2v/DRuuzRF6Iy04wNdulIG37q5TPYvVr
 g140UoRthvT5pjIXruIp3h8cLO4RdRgN197x0wPIOyDu+OztjzHzRaMr25M8CNN9c9YL
 M9iA==
X-Gm-Message-State: AOAM532eBsxmEzf8sLBKaPlVYSlM+K8oZ/rVvmOHCiGPse4EnvRhhSzw
 0vxr0V4G7NMOL4qiW8Z3AJWkdMc2/qEV8ahNHH05rqsbZN6BLOzajuWSUQZZpi6m4heYwPl3TSI
 RQTToT+37mxymuXs=
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr11035381wmg.145.1634286842126; 
 Fri, 15 Oct 2021 01:34:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/VYVj65MZ4QsG97incAvV8T0qrQrB8urp0I3FiJ3FcgxINAYcqV0GJFFbmxu1sr/5v9bT7g==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr11035355wmg.145.1634286841896; 
 Fri, 15 Oct 2021 01:34:01 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id p7sm3403504wrm.61.2021.10.15.01.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:34:01 -0700 (PDT)
Date: Fri, 15 Oct 2021 10:33:59 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
Message-ID: <20211015083359.j5t2xt7cfdjqbzlm@gator>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com>
 <20211014153609.pzndx7um3dfdgelo@gator>
 <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: robh@kernel.org, qemu-riscv@nongnu.org, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 07:22:05PM +1100, Gavin Shan wrote:
> It's possible that the empty NUMA nodes aren't referred by any CPUs,
> as the following command line indicate. In this case, the empty NUMA
> node IDs aren't existing in device-tree CPU nodes. So we still need
> the distance-map.

Ah, indeed.

> 
> However, I would like to drop this (PATCH[01/02]) in v4. The memory
> hotplug through device-tree on ARM64 isn't existing. We might have
> alternative ways to present the empty NUMA nodes when it's supported,
> or we needn't it for ever because ACPI is enough to support the
> memory hotplug.

Agreed. Please update the commit message of 2/2 for v4 and also add
a comment above the new code with the rationale for dropping those
memory nodes.

Thanks,
drew


