Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7943E2948
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:12:47 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxmQ-0000xY-S0
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxl2-0007RK-Bf
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxkx-0002vO-Eu
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628248274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy6uAyRBc8GdEcGcT5t45T9Ee1srcnm5DJw6mQb3OQA=;
 b=IjkCM+E5EPJ/uWhgZ2j8KpU/rOx2wwSgBklGXRcjh5Qo9XlaJ2gzL7foiqQ+Dhk5Iyc1IF
 VNXlGOrM0OcX+gpRUimTa4mC4QuvrfmzNwqSOirSPlFn1FiaSDK4DV66aN99p+Bt5AlW1L
 gbG6FMBkWD8MbmqiFDuMBwjhMEP2LGY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-i5FD4R6EPuq2eNZfh7dVDg-1; Fri, 06 Aug 2021 07:11:13 -0400
X-MC-Unique: i5FD4R6EPuq2eNZfh7dVDg-1
Received: by mail-wm1-f69.google.com with SMTP id
 205-20020a1c04d60000b02902e6620dfe4bso538953wme.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 04:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cy6uAyRBc8GdEcGcT5t45T9Ee1srcnm5DJw6mQb3OQA=;
 b=jaAo3uMa+sBT+EI8kSK/8nwTuVRuX8rhQBaznXS6ZVoWRF4MdTaYugXG7mc6jabtqw
 0uFz6aoVvSazBeeN/kET0MfRlyf60LYRvbipP23+oT8N2K4Kw17CpMSVtFOBqM54+PuE
 r3h4ERv/p0T7MTvlKd9bkIuuIY7CYiQWEm8Y/ZerKQC8rGqXyBk0USLOLHQNGS2ECxN/
 rhhVhA30JHo5lMwp6is7W1Phf/RYmWd1vw2oW3/yAMCKLOSPJAZM6e1fbGBIl2ZgqFBF
 3nwC2GsTieuTozjqLJ6Nvtm0bwjYuzQVIELqVo/XkrAuSSVnClikiSA5zkSR8FRubDPL
 n/1w==
X-Gm-Message-State: AOAM530rpTxrLhOmLlA4MBbpaonUFEamOys/hxE9t8UXP7EoQO52qrs6
 aMZg9N0kWa9eIZTdRRKrXNwNoK2orOkoJHzT/52oPQePAb4p2cJBcJ7UXaBasT9rcL6lIF1+oXJ
 +ynqL5131OiBWRMM=
X-Received: by 2002:a1c:9851:: with SMTP id a78mr19801022wme.123.1628248272462; 
 Fri, 06 Aug 2021 04:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGSQ2yXpBBQs07CIGe8zNnEnGrWHMVsv22G55goDF2iCcLH8FvDAM12nMSBzJlOHTTVgW8/w==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr19801000wme.123.1628248272281; 
 Fri, 06 Aug 2021 04:11:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o12sm4817503wrm.84.2021.08.06.04.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 04:11:11 -0700 (PDT)
Date: Fri, 6 Aug 2021 13:11:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210806131110.3add9998@redhat.com>
In-Reply-To: <20210805223002.144855-11-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:02 -0400
Shashi Mallela <shashi.mallela@linaro.org> wrote:

> Updated expected IORT files applicable with latest GICv3
> ITS changes.
> 
> Full diff of new file disassembly:
> 
> /*
>  * Intel ACPI Component Architecture
>  * AML/ASL+ Disassembler version 20180629 (64-bit version)
>  * Copyright (c) 2000 - 2018 Intel Corporation
>  *
>  * Disassembly of tests/data/acpi/virt/IORT.pxb, Tue Jun 29 17:35:38 2021
>  *
>  * ACPI Data Table [IORT]
>  *
>  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>  */
> 
> [000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
> [004h 0004   4]                 Table Length : 0000007C
> [008h 0008   1]                     Revision : 00
> [009h 0009   1]                     Checksum : 07
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
> 
> [024h 0036   4]                   Node Count : 00000002
> [028h 0040   4]                  Node Offset : 00000030
> [02Ch 0044   4]                     Reserved : 00000000
> 
> [030h 0048   1]                         Type : 00
> [031h 0049   2]                       Length : 0018
> [033h 0051   1]                     Revision : 00
> [034h 0052   4]                     Reserved : 00000000
> [038h 0056   4]                Mapping Count : 00000000
> [03Ch 0060   4]               Mapping Offset : 00000000
> 
> [040h 0064   4]                     ItsCount : 00000001
> [044h 0068   4]                  Identifiers : 00000000
> 
> [048h 0072   1]                         Type : 02
> [049h 0073   2]                       Length : 0034
> [04Bh 0075   1]                     Revision : 00
> [04Ch 0076   4]                     Reserved : 00000000
> [050h 0080   4]                Mapping Count : 00000001
> [054h 0084   4]               Mapping Offset : 00000020
> 
> [058h 0088   8]            Memory Properties : [IORT Memory Access Properties]
> [058h 0088   4]              Cache Coherency : 00000001
> [05Ch 0092   1]        Hints (decoded below) : 00
>                                    Transient : 0
>                               Write Allocate : 0
>                                Read Allocate : 0
>                                     Override : 0
> [05Dh 0093   2]                     Reserved : 0000
> [05Fh 0095   1] Memory Flags (decoded below) : 03
>                                    Coherency : 1
>                             Device Attribute : 1
> [060h 0096   4]                ATS Attribute : 00000000
> [064h 0100   4]           PCI Segment Number : 00000000
> [068h 0104   1]            Memory Size Limit : 00
> [069h 0105   3]                     Reserved : 000000
> 
> [068h 0104   4]                   Input base : 00000000
> [06Ch 0108   4]                     ID Count : 0000FFFF
> [070h 0112   4]                  Output Base : 00000000
> [074h 0116   4]             Output Reference : 00000030
> [078h 0120   4]        Flags (decoded below) : 00000000
>                               Single Mapping : 0
> 
> Raw Table Data: Length 124 (0x7C)
> 
>     0000: 49 4F 52 54 7C 00 00 00 00 07 42 4F 43 48 53 20  // IORT|.....BOCHS
>     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>     0020: 01 00 00 00 02 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
>     0030: 00 18 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>     0040: 01 00 00 00 00 00 00 00 02 34 00 00 00 00 00 00  // .........4......
>     0050: 01 00 00 00 20 00 00 00 01 00 00 00 00 00 00 03  // .... ...........
>     0060: 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00  // ................
>     0070: 00 00 00 00 30 00 00 00 00 00 00 00              // ....0.......
> 
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/IORT                   | Bin 0 -> 124 bytes
>  tests/data/acpi/virt/IORT.memhp             | Bin 0 -> 124 bytes
>  tests/data/acpi/virt/IORT.numamem           | Bin 0 -> 124 bytes
>  tests/data/acpi/virt/IORT.pxb               | Bin 0 -> 124 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>  5 files changed, 4 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
> GIT binary patch
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
> GIT binary patch
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
> GIT binary patch
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
> GIT binary patch
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 2ef211df59..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,5 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/IORT",
> -"tests/data/acpi/virt/IORT.memhp",
> -"tests/data/acpi/virt/IORT.numamem",
> -"tests/data/acpi/virt/IORT.pxb",


