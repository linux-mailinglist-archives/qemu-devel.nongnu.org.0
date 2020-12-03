Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4272CD442
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:05:43 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmQg-0007se-79
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmMh-0004GY-In
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkmMf-0004Pj-SX
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TsS01T8NKio4LNQsbKkfvKT8zAeYDXi8ywVKqeKMlcM=;
 b=UdZWR13gKxskbBue8CENQ0/31X2ptChvzIM95HHgacoSah6uqS7Cyy4tYSS+L2AjV2U4W1
 QKTwyGISBhy01QdXtBMABxFtvpr9q8NjcGbjYfV0zRKWz6SyBOOlF6ZvOZLVmbjFtfzg2H
 6PlYYnjWHGCbsLGqKmOVr3dO2ufYnOU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-vqBesju-PuqW382GO26s_w-1; Thu, 03 Dec 2020 06:01:31 -0500
X-MC-Unique: vqBesju-PuqW382GO26s_w-1
Received: by mail-wm1-f69.google.com with SMTP id q17so1307832wmc.1
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 03:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TsS01T8NKio4LNQsbKkfvKT8zAeYDXi8ywVKqeKMlcM=;
 b=P3f+DfZpDWdwQ/p5syBuIW5Qq2ra1J7rYSiDp4G1GwTU2DHKil1XavqLi4kzNRhsC4
 L+1zrll00GnGfiXX1GC50FWOwZKKtMbr8Y9+n90FL3UrsXyLsgVDflFrBoUHtgwgrZBu
 VPlqZB1g4TJc/OpUmzM1RA1KWHC5ezng2+SH1oQIvI83Cu3smNfFRNUJ19m6bq7wEI3D
 ZZtbsw5MYkCu7o6e4yLyzP3HCeeQOxus2Fobq5gDaOGgweoxEXBn4wXr1EvOjyMcDlRn
 GH6NVKxddVcdqSksNFwSl5DEupORtLa+rpU3kL6E9ynL4XhTl8Y8/GZzKjl50d/GgVS8
 AAYw==
X-Gm-Message-State: AOAM533xhN9s08IN5Sy9w/edjf3BNQpz3aRxNq24KFGiflze7v5TchUs
 gK7g8zz5dQe8umdxp8eGZ12fHsEZdoPwqGNExMGJTYkik8tlEx2JCTi8I4ohytlE7RSZxpys92Z
 eMUbvAKbITB3YqjU=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2694188wmi.164.1606993290232; 
 Thu, 03 Dec 2020 03:01:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdJuO0o1ZXJqb7tlmEifm5uD5+dwWf1PMaYanLN83njDPxNsReK66aEz7UyvaJYxwUqOoPQg==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr2694162wmi.164.1606993290035; 
 Thu, 03 Dec 2020 03:01:30 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d13sm1535706wrb.39.2020.12.03.03.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 03:01:29 -0800 (PST)
Date: Thu, 3 Dec 2020 06:01:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 00/12] microvm: add second ioapic
Message-ID: <20201203060103-mutt-send-email-mst@kernel.org>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 11:54:11AM +0100, Gerd Hoffmann wrote:
> Add a second ioapic to microvm.  Gives us more IRQ lines we can
> use for virtio-mmio devices.  Bump number of possible virtio-mmio
> devices from 8 to 24.


acpi things all look ok:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> v3:
>  - pick up some review tags.
>  - replace magic numbers with #defines.
>  - add asl changes to commit messages.
> v2:
>  - reorganize code a bit.
>  - add ioapic2= option to microvm.
> 
> Gerd Hoffmann (12):
>   [testing] disable xhci msix
>   x86: rewrite gsi_handler()
>   x86: add support for second ioapic
>   microvm: make number of virtio transports runtime changeable
>   microvm: make pcie irq base runtime changeable
>   microvm: drop microvm_gsi_handler()
>   microvm: add second ioapic
>   tests/acpi: allow updates for expected data files
>   tests/acpi: add data files for ioapic2 test variant
>   tests/acpi: add ioapic2=on test for microvm
>   tests/acpi: update expected data files
>   tests/acpi: disallow updates for expected data files
> 
>  include/hw/i386/ioapic.h             |   2 +
>  include/hw/i386/ioapic_internal.h    |   2 +-
>  include/hw/i386/microvm.h            |   6 +-
>  include/hw/i386/x86.h                |   3 +
>  hw/i386/acpi-common.c                |  10 ++++
>  hw/i386/microvm.c                    |  82 ++++++++++++++++++++-------
>  hw/i386/x86.c                        |  35 ++++++++++--
>  hw/usb/hcd-xhci-pci.c                |   2 +-
>  tests/qtest/bios-tables-test.c       |  20 +++++--
>  tests/data/acpi/microvm/APIC.ioapic2 | Bin 0 -> 82 bytes
>  tests/data/acpi/microvm/DSDT.ioapic2 | Bin 0 -> 365 bytes
>  11 files changed, 129 insertions(+), 33 deletions(-)
>  create mode 100644 tests/data/acpi/microvm/APIC.ioapic2
>  create mode 100644 tests/data/acpi/microvm/DSDT.ioapic2
> 
> -- 
> 2.27.0
> 


