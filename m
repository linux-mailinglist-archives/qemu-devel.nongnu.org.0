Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF933A8A4
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:46:52 +0100 (CET)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZVb-0000gd-DS
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLZT8-0008W9-6O
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLZT5-00087z-Pl
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615761850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6xOmNrHT2lXoCJzciFZObQbLkcRl/YH2B9yNfXVfww=;
 b=NUUbEE2nd/L4afcEIq0lopdCLnm/V167afe4Ocj7tJb7TP9BMmQxAj8SKvMillnKqxL80m
 ymLmzr8OBYF6SzKE6MJlAz8/Ch0bBJjCMP4mzrBOvTbQMSVGyzYNgZydj65I6BpymzvESu
 i7kXXsFteIoDNn85c17iw6Mbhgygtjw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-q2qyttXBNFePvEkfBbarVA-1; Sun, 14 Mar 2021 18:44:08 -0400
X-MC-Unique: q2qyttXBNFePvEkfBbarVA-1
Received: by mail-wr1-f70.google.com with SMTP id s10so14229082wre.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 15:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6xOmNrHT2lXoCJzciFZObQbLkcRl/YH2B9yNfXVfww=;
 b=gsEVZxfoPYG/AOg7KgArPC8bhRMTzSGCzg+YjhWiABq/GiIQxku4qi6UKPMeEZBEZS
 oVbt7cS3m35UIKAoff/kXZcgonRD8yvSWIVJerHK+lvls4vtUT0QXbHh1XAAYt3JA7L5
 3ZhXFVFTamBWXrEL5uSalZBYsjBMA2YhfDGKLPJA+RTQ6GtXKpLlJEjz6Apz4q0WeSUt
 gY3LUXkd4PNd3c2HtTSSSl+wY412+Yc7h1Pfqq4yKucsMu4xxAvjfJ8/E9sQdAC0waW5
 c6+U9DXyk6pm7gsrWdgH5rTdogsPqtWrvo05M/h87s6ZNKL+SMQI8zlowIIpoz+wOeTg
 ovfw==
X-Gm-Message-State: AOAM5329BkKUgxsX7aTVeY4b5k6OHYTGyCsrrhp7TAsAv5g6iHGiSMfe
 vf+kYIb1bXZykPmF0ujKyifqUZRV90W+fcwyplysCBNzCmdy1QZ1sPZZrY5m+0RXBA9tn8ZWFZA
 prRtNP/ixVuEGkXs=
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr23107822wmc.88.1615761847579; 
 Sun, 14 Mar 2021 15:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbA5VzhhZt7EaHAskOfx+kHHlbIsQ6FoPtsSfhjRG5rIwpMkasg/AwQuMCi2Xcxg/QzYp4+A==
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr23107807wmc.88.1615761847412; 
 Sun, 14 Mar 2021 15:44:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j123sm11043021wmb.1.2021.03.14.15.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 15:44:06 -0700 (PDT)
Subject: Re: [PATCH v3] fuzz: map all BARs and enable PCI devices
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20201221181203.1853-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3be69623-f767-05e6-2587-6818b1df7413@redhat.com>
Date: Sun, 14 Mar 2021 23:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20201221181203.1853-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 7:12 PM, Alexander Bulekov wrote:
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
> v3: Plug the memory-leak pointed out by Thomas:
>     https://gitlab.com/huth/qemu/-/jobs/920543745#L309
> 
>  tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 07ad690683..be76d47d2d 100644
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
> @@ -762,10 +763,29 @@ static int locate_fuzz_objects(Object *child, void *opaque)
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
> +    g_free(qdev);
> +}
> +
>  static void generic_pre_fuzz(QTestState *s)
>  {
>      GHashTableIter iter;
>      MemoryRegion *mr;
> +    QPCIBus *pcibus;
>      char **result;
>  
>      if (!getenv("QEMU_FUZZ_OBJECTS")) {
> @@ -810,6 +830,10 @@ static void generic_pre_fuzz(QTestState *s)
>          exit(1);
>      }
>  
> +    pcibus = qpci_new_pc(s, NULL);

FYI this patch restricted the "generic" fuzzer to the x86 arch.

> +    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> +    qpci_free_pc(pcibus);
> +
>      counter_shm_init();
>  }
>  
> 


