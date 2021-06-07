Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921739DCF4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 14:51:41 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqEjB-0003fj-K1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 08:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEhv-00031U-JG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lqEhs-0003bb-I5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 08:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623070215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GL2vJgX773tQd6g0KqCD5k0ZSmNyBxtr3+2ZrrNh614=;
 b=aKvVQ2rm0BzIMWtFJswd129ZTqTmHb8bx0/5VSMkoNS1+eGI/lI6auOV8B+TnoFcv0PNaJ
 f+n1VKc59jk76CK7LW+mFYm+YNkNv/5+nahn6gyGvNB45Joju6NT+R0hI1PWruNH+ei5lg
 czHPoH7kBy/UWjNqyaXdgJrOMxIhq6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-VXixVInDOAan1_hJsrMIMQ-1; Mon, 07 Jun 2021 08:50:08 -0400
X-MC-Unique: VXixVInDOAan1_hJsrMIMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11AD91009464;
 Mon,  7 Jun 2021 12:50:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2634719C66;
 Mon,  7 Jun 2021 12:49:59 +0000 (UTC)
Date: Mon, 7 Jun 2021 14:49:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210607144959.65b4c5a6@redhat.com>
In-Reply-To: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 May 2021 14:14:12 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> NOTE: Also, I wanted to push this v3 for review while alerting
> that I will be on holiday through June 8 (possibly a few days
> later).
this version addressed only the way the host storage is accessed
(and even that is only partially and needs more work to put into it)
The rest of the comments on v2 are still not addressed.

> NOTE: The patches are arranged such that each can be applied
> in order and not break the build (except the 0001 patch). Igor
> has hinted at changing this, but I'm unsure how else to
> re-arrange these patches accordingly.
as minimum, see suggestion for splitting #4 in 5/7

> NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live
> migration to a completely different host does not behave 
> properly (it loses the ERST contents because the file is not
> present on the new host). This still needs to be worked out.
> Other than live migration, this patchset fully works.

see: vmstate_register_ram_global()

> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
> 
> Linux uses the persistent storage filesystem, pstore, to record
> information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> independent of, and runs before, kdump.  In certain scenarios (ie.
> hosts/guests with root filesystems on NFS/iSCSI where networking
> software and/or hardware fails), pstore may contain the only
> information available for post-mortem debugging.
> 
> Two common storage backends for the pstore filesystem are ACPI ERST
> and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
> currently supported in QEMU, and UEFI is not utilized in all guests.
> By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
> viable pstore storage backend for virtual machines (as it is now for
> bare metal machines).
> 
> Enabling support for ACPI ERST facilitates a consistent method to
> capture kernel panic information in a wide range of guests: from
> resource-constrained microvms to very large guests, and in
> particular, in direct-boot environments (which would lack UEFI
> run-time services).
> 
> Note that Microsoft Windows also utilizes the ACPI ERST for certain
> crash information, if available.
> 
> The ACPI ERST persistent storage is contained within a single backing
> file, with a default size of 64KiB. The size and filename of the
> backing file can be obtained from QEMU parameters.
> 
> The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> (APEI)", and specifically subsection "Error Serialization", outlines
> a method for storing error records into persistent storage.
> 
> [1] "Advanced Configuration and Power Interface Specification",
>     version 6.2, May 2017.
>     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> 
> [2] "Unified Extensible Firmware Interface Specification",
>     version 2.8, March 2019.
>     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf
> 
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> ---
> v3: 28may2021
>  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>    internal array with explicit file operations, per Igor.
good start but it's not complete yet.

>  - Changed the way the qdev and base address are handled, allowing
>    ERST to be disabled at run-time. Also aligns better with other
>    existing code.
it aligns with ancient code template and the way it used to plumb
into board (it's fine for pre-existing devices but not for new ones
(unless there is no other way )).
v2 had suggestions how to proceed (you asked some questions back then,
but result is not reflected in this series, which still has the old
code as it was in v2).

 
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
> 
> v1: 26oct2020
>  - initial post
> 
> ---
>  hw/acpi/erst.c         | 909 +++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build    |   1 +
>  hw/i386/acpi-build.c   |   4 +
>  include/hw/acpi/erst.h |  97 ++++++
>  4 files changed, 1011 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
> 
> 
> Eric DeVolder (7):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: include ERST feature in build of ACPI support
>   ACPI ERST: create ERST device for pc/x86 machines.
>   ACPI ERST: qtest for ERST
>   ACPI ERST: step 6 of bios-tables-test.c
> 
>  hw/acpi/erst.c               | 902 +++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   7 +
>  hw/i386/pc.c                 |  31 ++
>  include/hw/acpi/erst.h       |  82 ++++
>  include/hw/i386/pc.h         |   1 +
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 106 +++++
>  tests/qtest/meson.build      |   2 +
>  11 files changed, 1132 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
> 


