Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9CA380A6D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:34:00 +0200 (CEST)
Received: from localhost ([::1]:45870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXx1-0000OV-N9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhXvu-0007KU-CA
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhXvj-0000yk-AT
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620999155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5+J4e2Ho0LEYkUP417s94bEPmjiV55bE+5H6wd13YRo=;
 b=V4WkD0oNTIUHFrT+32QutQhE9yqeeraf0yiYTnEcYgAhWjF90AXVUJUEIu89pKQfoS0/xq
 3JYNdD1nT3iG6UdDUiSa8OFbR7IFQIdLcPiK7sJ5TYIA26e4TMAg3wk+4co62qZHFXHO7e
 52g2ryyoAQ1gBe2CGslmEuMQBxj39GA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-F321bFRIM2axdLIn1Bk12g-1; Fri, 14 May 2021 09:32:32 -0400
X-MC-Unique: F321bFRIM2axdLIn1Bk12g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so1095349wmb.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:32:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5+J4e2Ho0LEYkUP417s94bEPmjiV55bE+5H6wd13YRo=;
 b=tuxepSqaC1vD7MvlEFeVfEeD2Cw3gSvmT4byKZV0Sex7/f8/bDcUsURh5z7WS439sf
 Pdo2EfFifjH7z2HnKvEpn2bU7Xpveq8GBFKT3djVNQGKwHCljxoBfcvhnrzU9ID5Qiyr
 PorjJjYfZgmG1wap+QdQLTNnFb+STpRNKKSovKJI/lPkwDEiWUKTTWWzjOES7S2YDQ/E
 esNgAA9K2Y0mIfj9kerh55CUz1B+OHf/kxkA/JplYmEpXBZiOi+pd9fAClNAg4u0+Oqr
 vlFoHP5mp8FF4V2y7hCzIZoUWPxR4PkuGeAGlMeqkg5CL6+98gn1rvOkoUJRMMJp3ff6
 DmYg==
X-Gm-Message-State: AOAM533WYxUdISPVwgTXWb5C1tB3RljOv/gDS63ul0uRVOnLfkFc3uPM
 UROB3kkFmX0WlJnp6XMqLwHim5u5zjScMxKYG0qnReL6BCU3T5L8hhLehLuCuhZUM3Bgf5NZ2Ct
 kgurJPXkIeu0uFNo=
X-Received: by 2002:a5d:698f:: with SMTP id g15mr57994335wru.316.1620999151215; 
 Fri, 14 May 2021 06:32:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr05LUXwWv1iT94r3ZIkStYFkyf+r5RQQwc+xJiOZjjub3Evzy2sXI1tsJRF+V32pylT6b/Q==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr57994316wru.316.1620999151028; 
 Fri, 14 May 2021 06:32:31 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id y2sm13219420wmq.45.2021.05.14.06.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 06:32:30 -0700 (PDT)
Date: Fri, 14 May 2021 09:32:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/6] pc: support user provided NIC naming/indexing
Message-ID: <20210514093116-mutt-send-email-mst@kernel.org>
References: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 02:00:56PM -0400, Igor Mammedov wrote:
> 
> Changes since rfc:
>   * make sure that acpi-index unique
>   * use dedicated MMIO register for it
>   * drop syntetic acpi-label field in _DSM
>   * add more comments


Could you rebase and repost please?
Some comments in commit log about use for non-NIC devices
would be helpful (even if it's just that "currently does not seem to be useful for
non-NICs").

> Series implements support for 'onboard' naming scheme for network
> interfaces (1), which is based on PCI firmware spec and lets user
> to explicitly specify index that will be used by guest to name
> network interface, ex:
>     -device e1000,acpi-index=33
> should make guest rename NIC name to 'eno33' where 'eno' is default
> prefix for this scheme.
> 
> Hope is that it will allow to simplify launching VMs from
> template disk images with different set VM configurations
> without need to reconfigure guest network intrfaces or
> risk of loosing network connectivity.
> 
> For more detailed description/examples see patches [3-4/5]
> 
> 1)
>  https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/ 
> 
> Git repo for testing:
>    https://github.com/imammedo/qemu/branches acpi-index-v1
> 
> 
> CC: laine@redhat.com
> CC: mst@redhat.com
> CC: jusual@redhat.com
> 
> Igor Mammedov (6):
>   tests: acpi: temporary whitelist DSDT changes
>   pci: introduce apci-index property for PCI device
>   pci: acpi: ensure that acpi-index is unique
>   acpi: add aml_to_decimalstring() and aml_call6() helpers
>   pci: acpi: add _DSM method to PCI devices
>   tests: acpi: update expected blobs
> 
>  include/hw/acpi/aml-build.h      |   3 +
>  include/hw/acpi/pci.h            |   1 +
>  include/hw/acpi/pcihp.h          |   9 ++-
>  include/hw/pci/pci.h             |   1 +
>  hw/acpi/aml-build.c              |  28 ++++++++
>  hw/acpi/pci.c                    |   1 -
>  hw/acpi/pcihp.c                  | 104 ++++++++++++++++++++++++++-
>  hw/acpi/piix4.c                  |   3 +-
>  hw/acpi/trace-events             |   2 +
>  hw/i386/acpi-build.c             | 118 +++++++++++++++++++++++++++++--
>  hw/pci/pci.c                     |   1 +
>  tests/data/acpi/pc/DSDT          | Bin 5065 -> 6002 bytes
>  tests/data/acpi/pc/DSDT.acpihmat | Bin 6390 -> 7327 bytes
>  tests/data/acpi/pc/DSDT.bridge   | Bin 6924 -> 8668 bytes
>  tests/data/acpi/pc/DSDT.cphp     | Bin 5529 -> 6466 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm  | Bin 6719 -> 7656 bytes
>  tests/data/acpi/pc/DSDT.hpbridge | Bin 5026 -> 5969 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs  | Bin 5137 -> 6074 bytes
>  tests/data/acpi/pc/DSDT.memhp    | Bin 6424 -> 7361 bytes
>  tests/data/acpi/pc/DSDT.nohpet   | Bin 4923 -> 5860 bytes
>  tests/data/acpi/pc/DSDT.numamem  | Bin 5071 -> 6008 bytes
>  tests/data/acpi/pc/DSDT.roothp   | Bin 5261 -> 6210 bytes
>  22 files changed, 261 insertions(+), 10 deletions(-)
> 
> -- 
> 2.27.0


