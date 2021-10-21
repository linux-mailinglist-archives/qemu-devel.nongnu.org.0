Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FDC435B58
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:08:02 +0200 (CEST)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSBF-0007H6-H3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mdS8P-0005SG-Nt
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:05:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mdS8K-00047V-Cu
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634799899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9YpSdYxf3P2tkIkIEmjZ3WdiOSpPd+qFr1X7IG36n4=;
 b=XnHgmNlC3wv8wQyJ6g4ZJ5WJPrJwGUkxUD7Ai7GqcSUOPaTCuU9wGEwwiVpn8gjYEH+/QH
 g8q2lvVkpr2MGVxJE+SJh6WuiU14tTG7WF3kERMeY19SO3DOzsoruSvGM/Yl95T08kTIzx
 Uwap046+BKGXaaIKryrIpPgC1QiNUhY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-8BhTeEQfMPu512WGYHXEqA-1; Thu, 21 Oct 2021 03:04:58 -0400
X-MC-Unique: 8BhTeEQfMPu512WGYHXEqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so4805201wmj.8
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9YpSdYxf3P2tkIkIEmjZ3WdiOSpPd+qFr1X7IG36n4=;
 b=HynXXQdYEHSeINmYTBqqxACSfFN2BjTyK6xWCIEPZCxrLIegSWTOwPTPwRiAKcGzHD
 Tr6MZtieVkMgAKrZ7A0bB4y6PqXOHxHacRyCURAt8Wtb7foFD1lJcg89ppBoglaFDDhp
 n51myuZNeVb3DWiWspn84t+0lSfBWfTZQLzZbhipIlDCD6nfOjcbIRnBDEK9wvNlslXL
 iU5uZ6zAWon7GcT4fbQjGJQGweH5M3EgpvGDTDC381ubQt/7/+ofcuisxUYSLQXmQfsn
 4eOt0ymYOfm2wL7PQi6a9ZKWoaTQ6O2ZtM08PbKWzrWLim0fsiiWFJT/6gFic54E6YHi
 GZHw==
X-Gm-Message-State: AOAM5326Uwm+oqIionPHtyHPanKl4f/TI/pyguqCDT+gUlKeAP2sixtW
 YvAEaKqfBtchKrLLjU1d2e36zH943tuX6KtnS4kbm75cMXmzactsB34rCFXHGSCe3KsNAaM5zdO
 A+iuN1Lvvs82Hsnk=
X-Received: by 2002:a7b:c30c:: with SMTP id k12mr19250134wmj.38.1634799897257; 
 Thu, 21 Oct 2021 00:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNPEykpXipxzWdk7VptZE3DD3YAhax1c00G97xOZ87QKVbYkQPs+oCVdvv+EF9GwoeqbLnQg==
X-Received: by 2002:a7b:c30c:: with SMTP id k12mr19250118wmj.38.1634799897097; 
 Thu, 21 Oct 2021 00:04:57 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e9sm4046422wme.37.2021.10.21.00.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 00:04:56 -0700 (PDT)
Subject: Re: [PATCH v9 8/8] tests/data/acpi/virt: Update the empty expected
 file for PPTT
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
 <20211020142125.7516-9-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <b23e91b7-e484-6f96-83c0-57fd27c7fc7e@redhat.com>
Date: Thu, 21 Oct 2021 09:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020142125.7516-9-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 10/20/21 4:21 PM, Yanan Wang wrote:
> Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
> to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
> 
> Disassembled output of the updated new file:
> 
> /*
>  * Intel ACPI Component Architecture
>  * AML/ASL+ Disassembler version 20180810 (64-bit version)
>  * Copyright (c) 2000 - 2018 Intel Corporation
>  *
>  * Disassembly of tests/data/acpi/virt/PPTT, Fri Oct  8 10:12:32 2021
>  *
>  * ACPI Data Table [PPTT]
>  *
>  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>  */
> 
> [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
> [004h 0004   4]                 Table Length : 0000004C
> [008h 0008   1]                     Revision : 02
> [009h 0009   1]                     Checksum : A8
> [00Ah 0010   6]                       Oem ID : "BOCHS "
> [010h 0016   8]                 Oem Table ID : "BXPC    "
> [018h 0024   4]                 Oem Revision : 00000001
> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> [020h 0032   4]        Asl Compiler Revision : 00000001
> 
> [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
> [025h 0037   1]                       Length : 14
> [026h 0038   2]                     Reserved : 0000
> [028h 0040   4]        Flags (decoded below) : 00000001
>                             Physical package : 1
>                      ACPI Processor ID valid : 0
> [02Ch 0044   4]                       Parent : 00000000
> [030h 0048   4]            ACPI Processor ID : 00000000
> [034h 0052   4]      Private Resource Number : 00000000
> 
> [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
> [039h 0057   1]                       Length : 14
> [03Ah 0058   2]                     Reserved : 0000
> [03Ch 0060   4]        Flags (decoded below) : 0000000A
>                             Physical package : 0
>                      ACPI Processor ID valid : 1
> [040h 0064   4]                       Parent : 00000024
> [044h 0068   4]            ACPI Processor ID : 00000000
> [048h 0072   4]      Private Resource Number : 00000000
> 
> Raw Table Data: Length 76 (0x4C)
> 
>     0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
>     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>     0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
>     0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
>     0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/data/acpi/virt/PPTT                   | Bin 0 -> 76 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
> GIT binary patch
> literal 76
> zcmV-S0JHy4P*hY*00002s6tOeNK+s}SWrVCARr(C0000&SWrU&000006aWAL00000
> i0000000000000006aWAU0000a00000000000001^0tW#A
> 
> literal 0
> KcmV+b0RR6000031
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index cb143a55a6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/PPTT",
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


