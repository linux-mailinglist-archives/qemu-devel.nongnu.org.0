Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C12612C3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 16:33:15 +0200 (CEST)
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFegM-00080Z-9u
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 10:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kFeci-0002yy-PR
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:29:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28646
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kFecg-0007S5-Am
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599575365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VY5FszTDtThjgq4x+5UN0VyTVSXKlknNwLCW3WXBosQ=;
 b=Uci/ZIHI80prS6nJ+RkiKWs2NBttuwnnrzkMZ9bAv2UePf8kWCrtXqejK6hJBmpEatra3W
 1DhBQG4TRvOGero6M1/cp3Sj3F3WpMt/8a8Sxsct1GZrFF9MqY2GDGtAEFBrI3CWr42Ys/
 Tacb77VjNZ4GALGiqbkdvPSAQuaEjOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-zowWn8uMM_GR8rpyvvOUVQ-1; Tue, 08 Sep 2020 10:29:23 -0400
X-MC-Unique: zowWn8uMM_GR8rpyvvOUVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A90118BE160;
 Tue,  8 Sep 2020 14:29:22 +0000 (UTC)
Received: from imammedo-mac (unknown [10.40.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91BF8838AC;
 Tue,  8 Sep 2020 14:29:17 +0000 (UTC)
Date: Tue, 8 Sep 2020 16:29:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 00/10] x86: fix cpu hotplug with secure boot
Message-ID: <20200908162914.73d5d229@imammedo-mac>
In-Reply-To: <20200907112348.530921-1-imammedo@redhat.com>
References: <20200907112348.530921-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 00:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com, aaron.young@oracle.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  7 Sep 2020 07:23:38 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> v5:
>   - fix hotplug on Windows when there is more than 256 possible CPUs
>     (Windows isn't able to handle VarPackage over 255 elements
>      so process CPUs in batches)
>   - fix off-by-one in package length (Laszlo)
>   - fix not selecting CPU before clearing insert event (Laszlo)
>   - use aml_lgreater() instead of aml_lnot(aml_equal(num_added_cpus, zero) (Laszlo)
>   - split 'x68: acpi: trigger SMI before sending hotplug Notify event to OSPM'
>     in samller chunks (Laszlo)
>   - fix comment to match spec (Laszlo)
>   - reorder aml_lor() and aml_land() in header (Laszlo)
> v4:
>   - fix 5.2 machine types so they won't apply pc_compat_5_1 (Laszlo)
> v3:
>   - rebase on top of "[PATCH v2] hw: add compat machines for 5.2"
>     so apply that before this patch
> v2:
>   - AML: clean is_inserted flag only after SMI callback
>   - make x-smi-cpu-hotunplug false by default
>   - massage error hint on not supported unplug
> v1:
>   - fix typos and some phrases (Laszlo)
>   - add unplug check (Laszlo)
>   - redo AML scan logic to avoid race when adding multiple CPUs
> 
> CPU hotplug with Secure Boot was not really supported and firmware wasn't aware
> of hotplugged CPUs (which might lead to guest crashes). During 4.2 we introduced
> locked SMI handler RAM arrea to make sure that guest OS wasn't able to inject
> its own SMI handler and OVMF added initial CPU hotplug support.
> 
> This series is QEMU part of that support which lets QMVF tell QEMU that
> CPU hotplug with SMI broadcast enabled is supported so that QEMU would be able
> to prevent hotplug in case it's not supported and trigger SMI on hotplug when
> it's necessary.

Michael,

Can you merge this along with Laszlo's
  [PATCH 00/10] edk2: adopt the edk2-stable202008 release
via PCI tree, preferably in the same pull req.


> 
> Igor Mammedov (10):
>   x86: lpc9: let firmware negotiate 'CPU hotplug with SMI' features
>   x86: cpuhp: prevent guest crash on CPU hotplug when broadcast SMI is
>     in use
>   x86: cpuhp: refuse cpu hot-unplug request earlier if not supported
>   acpi: add aml_land() and aml_break() primitives
>   tests: acpi: mark to be changed tables in
>     bios-tables-test-allowed-diff
>   x86: ich9: expose "smi_negotiated_features" as a QOM property
>   x86: acpi: introduce AcpiPmInfo::smi_on_cpuhp
>   x86: acpi: introduce the PCI0.SMI0 ACPI device
>   x68: acpi: trigger SMI before sending hotplug Notify event to OSPM
>   tests: acpi: update acpi blobs with new AML
> 
>  include/hw/acpi/aml-build.h       |   2 +
>  include/hw/acpi/cpu.h             |   1 +
>  include/hw/i386/ich9.h            |   4 +
>  hw/acpi/aml-build.c               |  16 +++
>  hw/acpi/cpu.c                     | 156 ++++++++++++++++++++++++------
>  hw/acpi/ich9.c                    |  24 ++++-
>  hw/i386/acpi-build.c              |  35 ++++++-
>  hw/i386/pc.c                      |  15 ++-
>  hw/isa/lpc_ich9.c                 |  16 +++
>  tests/data/acpi/pc/DSDT           | Bin 4934 -> 5060 bytes
>  tests/data/acpi/pc/DSDT.acpihmat  | Bin 6258 -> 6385 bytes
>  tests/data/acpi/pc/DSDT.bridge    | Bin 6793 -> 6919 bytes
>  tests/data/acpi/pc/DSDT.cphp      | Bin 5397 -> 5524 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm   | Bin 6587 -> 6714 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs   | Bin 5006 -> 5132 bytes
>  tests/data/acpi/pc/DSDT.memhp     | Bin 6293 -> 6419 bytes
>  tests/data/acpi/pc/DSDT.numamem   | Bin 4940 -> 5066 bytes
>  tests/data/acpi/q35/DSDT          | Bin 7678 -> 7804 bytes
>  tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 9129 bytes
>  tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 7821 bytes
>  tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8268 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9458 bytes
>  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 7879 bytes
>  tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9163 bytes
>  tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 8934 bytes
>  tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7810 bytes
>  tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8409 bytes
>  27 files changed, 239 insertions(+), 30 deletions(-)
> 


