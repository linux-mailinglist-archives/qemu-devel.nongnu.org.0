Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E37B38DA83
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 10:27:18 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkjS8-0003GF-8t
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 04:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkjR5-0002Zg-2e
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkjR2-0002e6-1k
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621758366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9LljMfQ//VMtrSI95ymNAtqZo6NvkKxvq8+f8vo/Z+k=;
 b=bDqjy/NVaUDduP0P294rwG5okEyEjaqlG0quQ8n/Wl6BA9f+B9WEV0PkhQWMUykDiixsB3
 J8qj+Mp+ugvpv4DQq2g1BviKtLrE5mSpL+qn6QoV9JqGzO59tbmEAGaulQCba2G1hyHZ6b
 rf5ajxMA67J9Pl0UkO585y6FU06aPc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-cwYfjwNHOYWC0mefuIpjoA-1; Sun, 23 May 2021 04:26:04 -0400
X-MC-Unique: cwYfjwNHOYWC0mefuIpjoA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so11167428wrb.3
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 01:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9LljMfQ//VMtrSI95ymNAtqZo6NvkKxvq8+f8vo/Z+k=;
 b=jNMoLH3qPDYeskm47O8JW8jp9WJU2BQtcW38IIeREIocZvM+V6B0A1Zk6uCrghzVX2
 GQlRdEKyeQxS4BenooN/9RbGmt9TAcR2OqhYaTZ+mXyPFZPQgTNoZhysxTMAacKrV0SH
 tcYTxA83j2Ulwl8E0g9GZxerbGmpENr9m7eNL+YQu4Pbj8a0QDK9XtviYz8q8JSI2z46
 ae4gsXEfo9AffoyDZncIux35pRBnEPnY+PtGhOqWGHbhIV9LAJ67OLDR7mVBKTYmVjQD
 iH3oizoga0CygGSZcH511hhc4P+bbAyUJEu7p0iXo4nnWw8uLEvLASM7ABaY8NmmG6El
 TpRg==
X-Gm-Message-State: AOAM532HweiycsjKhXfLr50Qy+bxeFsgTcdT4dpbjbM8S7fVUatKD7/7
 WDyvzqShkDe2pgsbrXCmlK3iYnLiDhop8JWv6bTwpea1c8rprgm+HkvNhXpQ0mxAR0NndtpJEZK
 8g3m/BKRE8A7bGYM=
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr17237387wrz.309.1621758363304; 
 Sun, 23 May 2021 01:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFEe5zXur9nL/1zhyI5iFU72TQxnH5D25GO8BFTbf+fMWsXh11DIgMRuunGngrjDKLb/AxdQ==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr17237365wrz.309.1621758363035; 
 Sun, 23 May 2021 01:26:03 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id m11sm4324431wmq.33.2021.05.23.01.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 01:26:02 -0700 (PDT)
Date: Sun, 23 May 2021 04:25:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v4 0/7] Use ACPI PCI hot-plug for Q35
Message-ID: <20210523042415-mutt-send-email-mst@kernel.org>
References: <20210513062642.3027987-1-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210513062642.3027987-1-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 08:26:35AM +0200, Julia Suvorova wrote:
> The patch set consists of two parts:
> patches 1-4: introduce new feature
>              'acpi-pci-hotplug-with-bridge-support' on Q35
> patches 5-7: make the feature default along with changes in ACPI tables
> 
> This way maintainers can decide which way to choose without breaking
> the patch set.
> 
> With the feature disabled Q35 falls back to the native hot-plug.

Overall I think this version has addressed my concerns, good job!
I see Igor has some suggestions on how to structure the code,
they seem easy to address.
Question: what makes this an RFC? Any known bugs/missing functionality?
I don't see anything obvious - what did I miss?


> Pros
>     * no racy behavior during boot (see 110c477c2ed)
>     * eject is possible - according to PCIe spec, attention button
>       press should lead to power off, and then the adapter should be
>       removed manually. As there is no power down state exists in QEMU,
>       we cannot distinguish between an eject and a power down
>       request.
>     * no delay during deleting - after the actual power off software
>       must wait at least 1 second before indicating about it. This case
>       is quite important for users, it even has its own bug:
>           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
>     * no timer-based behavior - in addition to the previous example,
>       the attention button has a 5-second waiting period, during which
>       the operation can be canceled with a second press. While this
>       looks fine for manual button control, automation will result in
>       the need to queue or drop events, and the software receiving
>       events in all sort of unspecified combinations of attention/power
>       indicator states, which is racy and uppredictable.
>     * fixes or reduces the likelihood of the bugs:
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
>         * https://bugzilla.redhat.com/show_bug.cgi?id=1678290
> 
> Cons:
>     * no access to possible features presented in slot capabilities
>       (this is only surprise removal AFAIK)
> 
> v4:
>     * regain per-port control over hot-plug
>     * rebased over acpi-index changes
>     * set property on machine type to
>       make pci code more generic [Igor, Michael]
> 
> v3:
>     * drop change of _OSC to allow SHPC on hotplugged bridges
>     * use 'acpi-root-pci-hotplug'
>     * add migration states [Igor]
>     * minor style changes
> 
> v2:
>     * new ioport range for acpiphp [Gerd]
>     * drop find_pci_host() [Igor]
>     * explain magic numbers in _OSC [Igor]
>     * drop build_q35_pci_hotplug() wrapper [Igor]
> 
> Julia Suvorova (7):
>   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
>   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
>   hw/acpi/ich9: Enable ACPI PCI hot-plug
>   hw/pci/pcie: Do not set HPC flag if acpihp is used
>   bios-tables-test: Allow changes in DSDT ACPI tables
>   hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35
>   bios-tables-test: Update golden binaries
> 
>  hw/i386/acpi-build.h              |   5 +++
>  include/hw/acpi/ich9.h            |   5 +++
>  include/hw/acpi/pcihp.h           |   3 +-
>  include/hw/boards.h               |   1 +
>  hw/acpi/ich9.c                    |  68 ++++++++++++++++++++++++++++++
>  hw/acpi/pcihp.c                   |  22 +++++++---
>  hw/acpi/piix4.c                   |   4 +-
>  hw/core/machine.c                 |  19 +++++++++
>  hw/i386/acpi-build.c              |  32 ++++++++------
>  hw/i386/pc.c                      |   4 +-
>  hw/i386/pc_q35.c                  |   8 ++++
>  hw/pci/pcie.c                     |  11 ++++-
>  tests/data/acpi/q35/DSDT          | Bin 7859 -> 8289 bytes
>  tests/data/acpi/q35/DSDT.acpihmat | Bin 9184 -> 9614 bytes
>  tests/data/acpi/q35/DSDT.bridge   | Bin 7877 -> 11003 bytes
>  tests/data/acpi/q35/DSDT.cphp     | Bin 8323 -> 8753 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9513 -> 9943 bytes
>  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7934 -> 8364 bytes
>  tests/data/acpi/q35/DSDT.memhp    | Bin 9218 -> 9648 bytes
>  tests/data/acpi/q35/DSDT.mmio64   | Bin 8990 -> 9419 bytes
>  tests/data/acpi/q35/DSDT.nohpet   | Bin 7717 -> 8147 bytes
>  tests/data/acpi/q35/DSDT.numamem  | Bin 7865 -> 8295 bytes
>  tests/data/acpi/q35/DSDT.tis      | Bin 8465 -> 8894 bytes
>  23 files changed, 161 insertions(+), 21 deletions(-)
> 
> -- 
> 2.30.2


