Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178823CFCC9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:59:19 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rDJ-0003El-TP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5rC3-0002Lr-7C
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5rC1-00008u-64
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07hs95tDxlvV/E0zruAFnODToPCnwQnP3A6g9YxVF1I=;
 b=af1WUrqjVWtZGI2SLSJvLKCYAtrq5klPmbWc3fuNIagyo27b6JxsWuvLJDBGFQsrrfpGiE
 6QzXBRZBucAAVhhyRrK6ZUxouxgwUdCQ4UZRWmt1H3S95D0/JF/m3tnoM141LstBBZg3hi
 cNulpEw14K0+/LhMyWWQh3daWlqiSbU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-5AxlFmMWPzSm3jgv8S9T5w-1; Tue, 20 Jul 2021 10:57:54 -0400
X-MC-Unique: 5AxlFmMWPzSm3jgv8S9T5w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2255618wmj.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 07:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07hs95tDxlvV/E0zruAFnODToPCnwQnP3A6g9YxVF1I=;
 b=CgFC5q2XYuSgQAJx5uooJ2DGYNxZ6sYV10ZwQfkc4SfpIuEqA51Dv872Su2Hvtx+8Q
 kNI/vF7085i0QUL69E9VcpMmVtKZtgdOrp+0lkjQCnufZaV4R/pPua4EmUKbgJwRkK/c
 08JoN9zCPTd872HzYkLntho4Eul0SdtcVhCyEowCoIjdL88yxgDmkVvAc6kulqDp2IEJ
 9EtUekU2ucPdNCdAB0A4KemRtumNTdinI29sS1tYFzKftIFMW3VApR6PWlmghh2Y8QIl
 ndulU8iSIJXowCTFsc2m5xQNClsVDxocg2KW/iV+PO1BlZc9YvfKaoMfU7yQUfbsPwQp
 EJNg==
X-Gm-Message-State: AOAM531CZQN6Am+1T599xSg7E+m3KllxvcTZyKCPVkn9JjNK7WjwvFtz
 tQtWYLKNcTCnwgsVhYJuGXWtp/WyL0PhGt6FmXg9NS5TF6CJzA2bEUHIDz+M2dyfk6m3tWjp6WZ
 vykZGXJRC76uNpZM=
X-Received: by 2002:adf:da43:: with SMTP id r3mr31920226wrl.307.1626793073823; 
 Tue, 20 Jul 2021 07:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmGNqd38nci/Hka0LXlsu2FBOj3yqsFrLUy7nPEimVNz2Q6HmsFkyfpawT99PG63+kgAZ5Dg==
X-Received: by 2002:adf:da43:: with SMTP id r3mr31920201wrl.307.1626793073546; 
 Tue, 20 Jul 2021 07:57:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y197sm2861329wmc.7.2021.07.20.07.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:57:52 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:57:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210720165751.52805aed@redhat.com>
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

On Wed, 30 Jun 2021 15:07:11 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> =============================
> I believe I have corrected for all feedback on v4, but with
> responses to certain feedback below.
> 
> In patch 1/6, Igor asks:
> "you are adding empty template files here
> but the later matching bios-tables-test is nowhere to be found
> Was testcase lost somewhere along the way?
> 
> also it seems you add ERST only to pc/q35,
> so why tests/data/acpi/microvm/ERST is here?"
> 
> I did miss setting up microvm. That has been corrected.
> 
> As for the question about lost test cases, if you are referring
> to the new binary blobs for pc,q35, those were in patch
> 6/6. There is a qtest in patch 5/6. If I don't understand the
> question, please indicate as such.

All I see in this series is
 [PATCH v5 09/10] ACPI ERST: qtest for ERST
which is not related to bios-tables-test and blobs whatsoever.

Blobs are for use with bios-tables-test and I'm referring to
missing test case in bios-tables-test.c

> 
> 
> In patch 3/6, Igor asks:
> "Also spec (ERST) is rather (maybe intentionally) vague on specifics,
> so it would be better that before a patch that implements hw part
> were a doc patch describing concrete implementation. As model
> you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
> I'd start posting/discussing that spec within these thread
> to avoid spamming list until doc is settled up."
> 
> I'm thinking that this cover letter is the bulk of the spec? But as
> you say, to avoid spamming the group, we can use this thread to make
> suggested changes to this cover letter which I will then convert
> into a spec, for v6.
> 
> 
> In patch 3/6, in many places Igor mentions utilizing the hostmem
> mapped directly in the guest in order to avoid need-less copying.
> 
> It is true that the ERST has an "NVRAM" mode that would allow for
> all the simplifications Igor points out, however, Linux does not
> support this mode. This mode puts the burden of managing the NVRAM
> space on the OS. So this implementation, like BIOS, is the non-NVRAM
> mode.
see per patch comments where copying is not necessary regardless of
the implemented mode.


> I did go ahead and separate the registers from the exchange buffer,
> which would facilitate the support of NVRAM mode.
> 
>  linux/drivers/acpi/apei/erst.c:
>  /* NVRAM ERST Error Log Address Range is not supported yet */
>  static void pr_unimpl_nvram(void)
>  {
>     if (printk_ratelimit())
>         pr_warn("NVRAM ERST Log Address Range not implemented yet.\n");
>  }
> 
>  static int __erst_write_to_nvram(const struct cper_record_header *record)
>  {
>     /* do not print message, because printk is not safe for NMI */
>     return -ENOSYS;
>  }
> 
>  static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
>  {
>     pr_unimpl_nvram();
>     return -ENOSYS;
>  }
> 
>  static int __erst_clear_from_nvram(u64 record_id)
>  {
>     pr_unimpl_nvram();
>     return -ENOSYS;
>  }
> 
> =============================
PS:
it's inconvenient when you copy questions/parts of unfinished discussion
from previous revision with a little context.
Usually discussion should continue in the original thread and
once some sort of consensus is reached new series based on it
is posted. Above blob shouldn't be here. (You can look at how others
handle multiple revisions)

The way you do it now, makes reviewer to repeat job done earlier
to point to the the same issues, so it wastes your and reviewer's time.
So please finish discussions in threads they started at and then post
new revision.

> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
> 
> For background and implementation information, please see
> docs/specs/acpi_erst.txt, which is patch 2/10.
> 
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> ---
> v5: 30jun2021
>  - Create docs/specs/acpi_erst.txt, per Igor
>  - Separate PCI BARs for registers and memory, per Igor
>  - Convert debugging to use trace infrastructure, per Igor
>  - Various other fixups, per Igor
> 
> v4: 11jun2021
>  - Converted to a PCI device, per Igor.
>  - Updated qtest.
>  - Rearranged patches, per Igor.
> 
> v3: 28may2021
>  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>    internal array with explicit file operations, per Igor.
>  - Changed the way the qdev and base address are handled, allowing
>    ERST to be disabled at run-time. Also aligns better with other
>    existing code.
> 
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igor Mammedov
>  - Did away with use of ACPI packed structures, per Igor Mammedov
> 
> v1: 26oct2020
>  - initial post
> 
> ---
> 
> Eric DeVolder (10):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: specification for ERST support
>   ACPI ERST: PCI device_id for ERST
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: build the ACPI ERST table
>   ACPI ERST: trace support
>   ACPI ERST: create ACPI ERST table for pc/x86 machines.
>   ACPI ERST: qtest for ERST
>   ACPI ERST: step 6 of bios-tables-test.c
> 
>  docs/specs/acpi_erst.txt     | 152 +++++++
>  hw/acpi/erst.c               | 918 +++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build          |   1 +
>  hw/acpi/trace-events         |  14 +
>  hw/i386/acpi-build.c         |   9 +
>  hw/i386/acpi-microvm.c       |   9 +
>  include/hw/acpi/erst.h       |  84 ++++
>  include/hw/pci/pci.h         |   1 +
>  tests/data/acpi/microvm/ERST | Bin 0 -> 976 bytes
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 129 ++++++
>  tests/qtest/meson.build      |   2 +
>  13 files changed, 1319 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.txt
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
> 


