Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEC3C781F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:40:53 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PD2-0000aU-Di
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3PAt-0005Sd-3K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3PAp-0003fp-61
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626208712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKzRGE8kVri+98jwvNAIFmN2VxKeOd2kQnFAwMOeRBw=;
 b=EjkC2NnvvXjcZY/+1QpB2MmaS06wKn5vZuZrOzJdFSgQhSZk2MQzX4kwy1lmAgmG7aUFb6
 D7hrXEkkZNqQyJzVMmSk/ice1joTaNJY9/QB8ATjdO7b9B5ZHBUxD+8Ab3wJAdLP1ibUb5
 wqoswAzVHHhOHN/pn7ERUehanyZSoDY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-bvQHCRcbNnCqWB0ef4KpFA-1; Tue, 13 Jul 2021 16:38:28 -0400
X-MC-Unique: bvQHCRcbNnCqWB0ef4KpFA-1
Received: by mail-wr1-f71.google.com with SMTP id
 j6-20020adff5460000b029013c7749ad05so130051wrp.8
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 13:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pKzRGE8kVri+98jwvNAIFmN2VxKeOd2kQnFAwMOeRBw=;
 b=RyJ9zbs922iy8TsjKfthLM5gx05wtEz8LAtsTN89ILpkMt9k3aqG44q18A3fOCmQuE
 dS+fepQBCTJ5IdIopDbkDOLSunQARHKuFhV3NhgZyq3BjeLbVbMuvdBHGalipOpwp86O
 H31Gh+AeQ6AFXm4DnfVlTUmtxGYZzIBXVXD0QMgn4r5RPMBgJxMQhabXx0lr2yHEp7nw
 O0ICh5SNS+DotEWrQosWTCibgfWaGdPj1r5bc0xOwg8d76mdaZYsBuliPJbcwUXJAYQN
 vYWOm0NUtSEG0zzjaGQldXIoXDFFG7nCslQHg7R5smnoHcREPUPGuoIu8YjTW9+rzDZ6
 ZbPQ==
X-Gm-Message-State: AOAM530FyoYdTRdXhsXIKEypHnJw/t8l5KXhu76XrgVWw4MfLXt9ouc8
 1PDQCPlpsqgbyzrTA+b/+rY61A3Y50Vu6ulSLKJQ8JWryHi2qPYa+j77yJ3WJRqAjviz1r6byEQ
 3GqbZ77rV27cQx2c=
X-Received: by 2002:a1c:7314:: with SMTP id d20mr6960693wmb.167.1626208707571; 
 Tue, 13 Jul 2021 13:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKocoEKs+C2fEctXTX4vQeYn9jYkXFH7Qaa5pGEniujj0Vp3RRcOTK+hXlrJqUmOh34drSqA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr6960677wmb.167.1626208707316; 
 Tue, 13 Jul 2021 13:38:27 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id n18sm8309189wrt.89.2021.07.13.13.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 13:38:26 -0700 (PDT)
Date: Tue, 13 Jul 2021 16:38:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210713163734-mutt-send-email-mst@kernel.org>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 03:07:11PM -0400, Eric DeVolder wrote:
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
> 
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
> 
> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
> 
> For background and implementation information, please see
> docs/specs/acpi_erst.txt, which is patch 2/10.
> 
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>


../hw/acpi/erst.c: In function ‘build_erst’:
../hw/acpi/erst.c:754:13: error: this statement may fall through [-Werror=implicit-fallthrough=]
  754 |             build_serialization_instruction_entry(table_data, action,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  755 |                 ACPI_ERST_INST_READ_REGISTER       , 0, 64,
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  756 |                 s->bar0 + ERST_CSR_VALUE, 0, MASK64);
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/acpi/erst.c:757:9: note: here
  757 |         default:
      |         ^~~~~~~
cc1: all warnings being treated as errors


Pls correct.
mingw32 build also failed. Pls take a look.


Thanks!


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
> -- 
> 1.8.3.1


