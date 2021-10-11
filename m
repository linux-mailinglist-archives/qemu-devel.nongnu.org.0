Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DBC428F67
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:57:44 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvoE-0007Om-S6
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZvlk-0005af-ON
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZvle-00071u-NE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:55:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633960501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyPtlM9W+qC+cvpWUQrzu4eSqycBZpMMblUqC7wt4w8=;
 b=CDSyxhDwB8YDsSnwHdq7Dd8UsZIQsTDKSqOw9GlwnbcxSqIr32T9pzDL5dIWTXfzN8/J1I
 hv9wSSJ3ihOnrp7bjyfecdH1OSsco3U+hPy3Un7lZ1XogT7n3qZD6jbxqmOevfAdbdsyfw
 o9gIxQFqfmaLPtrwb747Nmksv06lCFo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-0hZnd-QMNaqbEn0bAKuRlA-1; Mon, 11 Oct 2021 09:55:00 -0400
X-MC-Unique: 0hZnd-QMNaqbEn0bAKuRlA-1
Received: by mail-ed1-f70.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so15985974edi.19
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyPtlM9W+qC+cvpWUQrzu4eSqycBZpMMblUqC7wt4w8=;
 b=xDN5nbmG2RikRfRpcmwzIckGGKN4ADgBIJePpgubdeNZ5b6HqHERZiWkeYwNYQBKQp
 4JiCo7gpewOe2oTYWuQWGM8nA32dxmccgeesusCx6wsuktoL9yjVVq6ehZKZofj08TcT
 6svYUyAD+ql9W2Hf3brwvtt32KZvd7ofMjpuS1beLHA/Cf9xqaLqk4E8ikcQSChSPuXi
 Bi6EvIUUGu0uczAB4hdueCfy60vpFE5Z2bPErjeiPrhDdNs7LRz1hhdn+kdab0Oouz3p
 kxRDUcwyTU6tPEkqmRN7ZBUfmmhkAkYWidPrcW08L3uGU0reeKOOKQ358iIFa73CEREg
 9LVg==
X-Gm-Message-State: AOAM530vkVRxeskiYZ+4aM3bZtQSLV00997549OrepcUzUO/DnMW+K6K
 5SMPhAzr63vkIaAyInWyooasP9bQxFySXH0eNYjuIGd1DC493GaPwCrUpWaRfUMC5EXPvSDKRuT
 eCvCNxe7NmeGF3lM=
X-Received: by 2002:a17:906:3fc8:: with SMTP id
 k8mr24917819ejj.217.1633960498484; 
 Mon, 11 Oct 2021 06:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1SJYOS3F+1QPXGoh+0kEHDjBPg0+RGTu8G8lpz4k7fb8zpHFZtq1WWl3JmtVjz0RZCLhwoA==
X-Received: by 2002:a17:906:3fc8:: with SMTP id
 k8mr24917791ejj.217.1633960498192; 
 Mon, 11 Oct 2021 06:54:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id t4sm4342719edc.2.2021.10.11.06.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:54:57 -0700 (PDT)
Date: Mon, 11 Oct 2021 15:54:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 3/3] tests/acpi/bios-tables-test: update DSDT blob
 for multifunction bridge test
Message-ID: <20211011155456.2e38867e@redhat.com>
In-Reply-To: <20211007135750.1277213-4-ani@anisinha.ca>
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211007135750.1277213-4-ani@anisinha.ca>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  7 Oct 2021 19:27:50 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> We added a new unit test for testing acpi hotplug on multifunction bridges in
> q35 machines. Here, we update the DSDT table gloden master blob for this unit
> test.
> 
> The test adds the following devices to qemu and then checks the changes
> introduced in the DSDT table due to the addition of the following devices:
> 
> (a) a multifunction bridge device
> (b) a bridge device with function 1
> (c) a non-bridge device with function 2
> 
> In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
> For (a) we should find a hotplug AML description for function 0.
> 
> Following is the ASL diff between the original DSDT table and the modified DSDT
> table due to the unit test. We see that multifunction bridge on bus 2 and single
> function bridge on bus 3 function 1 are described, not the non-bridge balloon
> device on bus 4, function 2.
> 
> @@ -1,30 +1,30 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20190509 (64-bit version)
>   * Copyright (c) 2000 - 2019 Intel Corporation
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of tests/data/acpi/q35/DSDT, Thu Oct  7 18:29:19 2021
> + * Disassembly of /tmp/aml-C7JCA1, Thu Oct  7 18:29:19 2021
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00002061 (8289)
> + *     Length           0x00002187 (8583)
>   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> - *     Checksum         0xF9
> + *     Checksum         0x8D
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
>   *     Compiler ID      "BXPC"
>   *     Compiler Version 0x00000001 (1)
>   */
>  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
>  {
>      Scope (\)
>      {
>          OperationRegion (DBG, SystemIO, 0x0402, One)
>          Field (DBG, ByteAcc, NoLock, Preserve)
>          {
>              DBGB,   8
>          }
> 
> @@ -3265,23 +3265,95 @@
>                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
>                  {
>                      Return (Zero)
>                  }
> 
>                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
>                  {
>                      Return (Zero)
>                  }
> 
>                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
>                  {
>                      Return (Zero)
>                  }
>              }
> 
> +            Device (S10)
> +            {
> +                Name (_ADR, 0x00020000)  // _ADR: Address
> +                Name (BSEL, One)
> +                Device (S00)
> +                {
> +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> +                    Name (_ADR, Zero)  // _ADR: Address
> +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                    {
> +                        PCEJ (BSEL, _SUN)
> +                    }
> +
> +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> +                    {
> +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> +                    }
> +                }
> +
> +                Method (DVNT, 2, NotSerialized)
> +                {
> +                    If ((Arg0 & One))
> +                    {
> +                        Notify (S00, Arg1)
> +                    }
> +                }
> +
> +                Method (PCNT, 0, NotSerialized)
> +                {
> +                    BNUM = One
> +                    DVNT (PCIU, One)
> +                    DVNT (PCID, 0x03)
> +                }
> +            }
> +
> +            Device (S19)
> +            {
> +                Name (_ADR, 0x00030001)  // _ADR: Address
> +                Name (BSEL, Zero)
> +                Device (S00)
> +                {
> +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> +                    Name (_ADR, Zero)  // _ADR: Address
> +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                    {
> +                        PCEJ (BSEL, _SUN)
> +                    }
> +
> +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> +                    {
> +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> +                    }
> +                }
> +
> +                Method (DVNT, 2, NotSerialized)
> +                {
> +                    If ((Arg0 & One))
> +                    {
> +                        Notify (S00, Arg1)
> +                    }
> +                }
> +
> +                Method (PCNT, 0, NotSerialized)
> +                {
> +                    BNUM = Zero
> +                    DVNT (PCIU, One)
> +                    DVNT (PCID, 0x03)
> +                }
> +            }
> +
>              Method (PCNT, 0, NotSerialized)
>              {
> +                ^S19.PCNT ()
> +                ^S10.PCNT ()
>              }
>          }
>      }
>  }
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/DSDT.multi-bridge       | Bin 0 -> 8583 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a24c713d22102a1a1583b5c902edffe1694e5cfe 100644
> GIT binary patch
> literal 8583
> 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
> P)}F_He7!|yIezv(me~h+
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dabc024f53..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.multi-bridge",


