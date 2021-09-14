Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92B40AE86
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:04:21 +0200 (CEST)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ86m-0008Rj-UW
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ80o-00033p-TE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mQ80n-0006QD-0I
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZgWG8QcPX9Cx0l/uzAhbRZaH28eow+SSjomUH2MgBE=;
 b=fKaPLOpXJiRd0jOQ9OFdfo90bnIQXFVUoVzKuVRGG7AaFI/DhA//BYK1oghXi5vgaxLpwH
 jYhF4i5fPvG7l5iD8PN/F9mRM5X24qtCINW5fy3lzJjBlD5gbofImkYv+L8H5Ll7FeG39e
 DklanHPWG42dyJfVi60rqhWl1WGYLFk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-CQ_0dF2yNnKUN9Pxpofnkw-1; Tue, 14 Sep 2021 08:58:06 -0400
X-MC-Unique: CQ_0dF2yNnKUN9Pxpofnkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso3917218wrw.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZgWG8QcPX9Cx0l/uzAhbRZaH28eow+SSjomUH2MgBE=;
 b=JGQQbKEumqJrH266OBkIhpMV+yLH5QSerYd+hMJjwMEwHrq7DHcWE1F1Z9jiTPW2cl
 sLuB4C8RW6J3gpA4EhR1ULyEau92usq22kvgKhAxcfH4E+imznbctCKBEdBEPFxjTNE+
 92rr5pMF1GiqluWFBeyY3lT5WWOUVZCblObk+slZa45OgVwGKOIZkXY5kbgG89nbhk59
 OGo0dXpTd6S02N17JfctXsDs5czaoAiPKMnWtBUBhnFAAjXmAO+xZUjAmYggX67+Gns7
 m7Sax3iVWm/coDFv6kug+xy8dW7HNTUr1V7+fcFBY2/EgxXgU0IRXJ5KJM3aWV/shVtv
 K4Xg==
X-Gm-Message-State: AOAM5320D1eQhIjfqy0JgShahjdSOS4cG4ccXtCho8ZUCvIS6+4JUGWo
 xDhnq+q3FqzvDN6/naQt0JyVNOyYlxu5jdl+1GvgBfIAc4z69IlNwQNFS+ZR9EhFeJ2TqoObG5i
 AS+7eyCIuc/uEc54=
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr19303417wrc.6.1631624285622; 
 Tue, 14 Sep 2021 05:58:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyvpMzMbBg+S+ghf4doi29ouf0iZglmGP0MrPKe53SbnD08AzhytmJZGi/akiv1INWmCDgKg==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr19303398wrc.6.1631624285435; 
 Tue, 14 Sep 2021 05:58:05 -0700 (PDT)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id o10sm11610016wrc.16.2021.09.14.05.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:58:04 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:58:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 2/3] hw/i386/acpi: fix conflicting IO address range for
 acpi pci hotplug in q35
Message-ID: <20210914145803.087d1a41@redhat.com>
In-Reply-To: <20210914045410.3380946-3-ani@anisinha.ca>
References: <20210914045410.3380946-1-ani@anisinha.ca>
 <20210914045410.3380946-3-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jusual@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sep 2021 10:24:09 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> starts at address 0x0cc4 and ends at 0x0cdb. At the time when the patch was
> written but the final version of the patch was not yet pushed upstream, this
> address range was free and did not conflict with any other IO address ranges.
> However, with the following change, this address range was no
> longer conflict free as in this change, the IO address range
> (value of ACPI_PCIHP_SIZE) was incremented by four bytes:
> 
> b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")
> 
> This can be seen from the output of QMP command 'info mtree' :
> 
> 0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
> 0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
> 0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
> 0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
> 0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
> 0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
> 0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug
> 
> It shows that there is a region of conflict between IO regions of acpi
> pci hotplug and acpi cpu hotplug.
> 
> Unfortunately, the change caf108bc58790 did not update the IO address range
> appropriately before it was pushed upstream to accomodate the increased
> length of the IO address space introduced in change b32bd763a1ca92.
> 
> Due to this bug, windows guests complain 'This device cannot find
> enough free resources it can use' in the device manager panel for extended
> IO buses. This issue also breaks the correct functioning of pci hotplug as the
> following shows that the IO space for pci hotplug has been truncated:
> 
> (qemu) info mtree -f
> FlatView #0
>  AS "I/O", root: io
>  Root memory region: io
>   0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
>   0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
> 
> Therefore, in this fix, we adjust the IO address range for the acpi pci
> hotplug so that it does not conflict with cpu hotplug and there is no
> truncation of IO spaces. The starting IO address of PCI hotplug region
> has been decremented by four bytes in order to accomodate four byte
> increment in the IO address space introduced by change
> b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")
> 
> After fixing, the following are the corrected IO ranges:
> 
> 0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
> 0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
> 0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
> 0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
> 0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
> 0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
> 0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug
> 
> This change has been tested using a Windows Server 2019 guest VM. Windows
> no longer complains after this change.
> 
> Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/ich9.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index a329ce43ab..f04f1791bd 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -29,7 +29,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
>  
> -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> +#define ACPI_PCIHP_ADDR_ICH9 0x0cc0
>  
>  typedef struct ICH9LPCPMRegs {
>      /*


