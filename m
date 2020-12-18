Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A62DE1D3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:14:00 +0100 (CET)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDhv-0000qI-CI
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqDY5-0004ji-CO
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqDY2-0003Gy-2U
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608289424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLTFgFs3OerBzthJsTjFt4vgpA163S1QEnngG6k+SYc=;
 b=hv46X9PMBf+vqBGK1WB2BXbLpCP/3AjvN5zoGB8zz9OK8ndEg3x7WlP9iqcemsUqWsFpDE
 yadsgw1N2vTJO9BmYPEt+aCOROKOShL/WSgVJh+4D2pdXM+uk1ewfGFBBw3X2ASJY63Rh9
 GJbyCmBwg71iGqsjIkRt4uu63XDE/IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-ZMAMKXt-NY6yBOB3bF-79A-1; Fri, 18 Dec 2020 06:03:42 -0500
X-MC-Unique: ZMAMKXt-NY6yBOB3bF-79A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2688801B12;
 Fri, 18 Dec 2020 11:03:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9568B722F5;
 Fri, 18 Dec 2020 11:03:32 +0000 (UTC)
Subject: Re: [PATCH v2] fuzz: map all BARs and enable PCI devices
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20201215190811.398331-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8fe49a0f-c732-676c-b1e6-5c9d7eb7ba23@redhat.com>
Date: Fri, 18 Dec 2020 12:03:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201215190811.398331-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2020 20.08, Alexander Bulekov wrote:
> Prior to this patch, the fuzzer found inputs to map PCI device BARs and
> enable the device. While it is nice that the fuzzer can do this, it
> added significant overhead, since the fuzzer needs to map all the
> BARs (regenerating the memory topology), at the start of each input.
> With this patch, we do this once, before fuzzing, mitigating some of
> this overhead.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> ---
> 
> v2: do not mix statements and declarations
> 
>  tests/qtest/fuzz/generic_fuzz.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 07ad690683..92b598dea8 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -16,6 +16,7 @@
>  
>  #include "hw/core/cpu.h"
>  #include "tests/qtest/libqos/libqtest.h"
> +#include "tests/qtest/libqos/pci-pc.h"
>  #include "fuzz.h"
>  #include "fork_fuzz.h"
>  #include "exec/address-spaces.h"
> @@ -762,10 +763,28 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>      return 0;
>  }
>  
> +
> +static void pci_enum(gpointer pcidev, gpointer bus)
> +{
> +    PCIDevice *dev = pcidev;
> +    QPCIDevice *qdev;
> +    int i;
> +
> +    qdev = qpci_device_find(bus, dev->devfn);
> +    g_assert(qdev != NULL);
> +    for (i = 0; i < 6; i++) {
> +        if (dev->io_regions[i].size) {
> +            qpci_iomap(qdev, i, NULL);
> +        }
> +    }
> +    qpci_device_enable(qdev);
> +}

This new code just triggered a leak error in the gitlab-CI for me:

 https://gitlab.com/huth/qemu/-/jobs/920543745#L309

Could you please have a look?

 Thanks,
  Thomas



