Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0D6B542B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:21:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pal6T-0003o4-7Y; Fri, 10 Mar 2023 17:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pal6R-0003nt-Ed
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:20:43 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pal6P-0005m2-CS
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:20:43 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l25so6376927wrb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 14:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678486839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kA09IJBsgPe8VYpcmjiPYAp/XfEkFejg55PDus1XABU=;
 b=eK902xJJn8M5ax12KU3WRD0/Cp4ApMkpJhIu/2LqnVvrwt/DeYIi1IDIQ+S02f6OFQ
 DhBk2iinJwEpKGzMAOyYRqskNOX90Gw9zUz05MGyv2O1qWtvZ8Hx5m25JAwZWYZQNOM/
 2fONnc81rs69HuCOAgtbnCJazKifnexQXq8lYzfg0h+ZJvOrLbF2GQWabEotSFMk80H7
 Ejp3PV6HS+I0tyD6+PlGe4q0nwqo7w8C2ybd2+a3ZAvwE5pCagKvoSUW3LWtN5cYmNfb
 S9Uk81tJPuMB+RZ5/kd7JdL64WxqPILee76NKygu1QuAAdorkmJGfGYLlgOnbSRl3Go0
 JZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678486839;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kA09IJBsgPe8VYpcmjiPYAp/XfEkFejg55PDus1XABU=;
 b=YhUouuoqKKBJRmqAUzdHUQdNbeZcU60gmqzIS7JhleerJLWS47Y31wGahf4Mc4GbLv
 vGx+B5w6JdFLkWnSySy18SL9TwyQLNK4QunHFK/C4lteQOv+60798CWYC29cD1Q/JdmR
 +oitTe3MuNJTHHSXUVoGm97EOLRuNnP+8UksTxA6n7Ij/WIB+VAaqZQGM2xx2O+UHlei
 7ns/L6Z5T9FdhghyMNT+uPl0ACv3IqAjhM7JLMQ7ILxib/aQrzus6Qelt+iyv1OV6Rw5
 BeywpcLDs0Sf7s9KrPLiFRiWEGqNd85P14jmPUTqt3nAPnzi5jfk29Tk+7bqId5K5Usj
 jlVA==
X-Gm-Message-State: AO0yUKW0VDqj5ao2kxCzjmqN2HyPNQ1ZIs1YhnLKMfTXA3Cv+NVm5D4U
 /PtTibbOwDAQWziHMKfo8zLpVQ==
X-Google-Smtp-Source: AK7set9ksHCDw69pCKIKK2vzdyIihLs4IqTqk+d7pUQx0fH9b/bCmkHNHj1tKQ+z6eAzqIGEogPH8g==
X-Received: by 2002:adf:ec0b:0:b0:2c7:bd6:68fd with SMTP id
 x11-20020adfec0b000000b002c70bd668fdmr17527566wrn.47.1678486839244; 
 Fri, 10 Mar 2023 14:20:39 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003dc4480df80sm1177496wmq.34.2023.03.10.14.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 14:20:38 -0800 (PST)
Message-ID: <dbc5dad7-0bb7-e947-60f8-84b6ff5a2dde@linaro.org>
Date: Fri, 10 Mar 2023 23:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/73] virtio,pc,pci: features, fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1678237635.git.mst@redhat.com>
 <20230309094647-mutt-send-email-mst@kernel.org>
 <CAFEAcA-pO1OYwO8PZwSjFiLX=MJcK+cYqtFqaF3ZZtTGdZ_EXw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-pO1OYwO8PZwSjFiLX=MJcK+cYqtFqaF3ZZtTGdZ_EXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On 10/3/23 18:32, Peter Maydell wrote:
> On Thu, 9 Mar 2023 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:

>> I moved it one commit back, now at (96cb085897)
>> Cornelia posted some concerns about the last commit.
>>
>>> ----------------------------------------------------------------
>>> virtio,pc,pci: features, fixes
>>>
>>> Several features that landed at the last possible moment:
>>>
>>> Passthrough HDM decoder emulation
>>> Refactor cryptodev
>>> RAS error emulation and injection
>>> acpi-index support on non-hotpluggable slots
>>> Dynamically switch to vhost shadow virtqueues at vdpa net migration
>>>
>>> Plus a couple of bugfixes that look important to have in the release.
>>>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>
> 
> 
> Applied, thanks.

I'm getting this failure on Darwin (m1):

C compiler for the host machine: clang (clang 14.0.0 "Apple clang 
version 14.0.0 (clang-1400.0.29.202)")
Program iasl found: YES (/opt/homebrew/bin/iasl)

$ make check-qtest-i386 V=1
  ...
  3/61 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test 
ERROR          17.52s   killed by signal 6 SIGABRT
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
✀ 
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
acpi-test: Warning! DSDT binary file mismatch. Actual 
[aml:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11], 
Expected [aml:tests/data/acpi/pc/DSDT.nosmm].
See source file tests/qtest/bios-tables-test.c for instructions on how 
to update expected files.
acpi-test: Warning! DSDT mismatch. Actual 
[asl:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-1CNQ11.dsl, 
aml:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11], 
Expected 
[asl:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-XXGQ11.dsl, 
aml:tests/data/acpi/pc/DSDT.nosmm].
--- /var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-XXGQ11.dsl 
2023-03-10 23:16:19
+++ /var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/asl-1CNQ11.dsl 
2023-03-10 23:16:19
@@ -1,30 +1,30 @@
  /*
   * Intel ACPI Component Architecture
   * AML/ASL+ Disassembler version 20221020 (64-bit version)
   * Copyright (c) 2000 - 2022 Intel Corporation
   *
   * Disassembling to symbolic ASL+ operators
   *
- * Disassembly of tests/data/acpi/pc/DSDT.nosmm, Fri Mar 10 23:16:19 2023
+ * Disassembly of 
/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11, Fri Mar 10 
23:16:19 2023
   *
   * Original Table Header:
   *     Signature        "DSDT"
- *     Length           0x000018D8 (6360)
+ *     Length           0x00001958 (6488)
   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math 
support
- *     Checksum         0xCE
+ *     Checksum         0xAF
   *     OEM ID           "BOCHS "
   *     OEM Table ID     "BXPC    "
   *     OEM Revision     0x00000001 (1)
   *     Compiler ID      "BXPC"
   *     Compiler Version 0x00000001 (1)
   */
  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
  {
      Scope (\)
      {
          OperationRegion (DBG, SystemIO, 0x0402, One)
          Field (DBG, ByteAcc, NoLock, Preserve)
          {
              DBGB,   8
          }

@@ -38,32 +38,66 @@
              {
                  DBGB = DerefOf (Local0 [Local2])
                  Local2++
              }

              DBGB = 0x0A
          }
      }

      Scope (_SB)
      {
          Device (PCI0)
          {
              Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: 
Hardware ID
              Name (_ADR, Zero)  // _ADR: Address
              Name (_UID, Zero)  // _UID: Unique ID
+            Method (EDSM, 5, Serialized)
+            {
+                If ((Arg2 == Zero))
+                {
+                    Local0 = Buffer (One)
+                        {
+                             0x00 
       // .
+                        }
+                    If ((Arg0 != ToUUID 
("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+                    {
+                        Return (Local0)
+                    }
+
+                    If ((Arg1 < 0x02))
+                    {
+                        Return (Local0)
+                    }
+
+                    Local0 [Zero] = 0x81
+                    Return (Local0)
+                }
+
+                If ((Arg2 == 0x07))
+                {
+                    Local0 = Package (0x02)
+                        {
+                            Zero,
+                            ""
+                        }
+                    Local1 = DerefOf (Arg4 [Zero])
+                    Local0 [Zero] = Local1
+                    Return (Local0)
+                }
+            }
          }
      }

      Scope (_SB.PCI0)
      {
          OperationRegion (PCST, SystemIO, 0xAE00, 0x08)
          Field (PCST, DWordAcc, NoLock, WriteAsZeros)
          {
              PCIU,   32,
              PCID,   32
          }

          OperationRegion (SEJ, SystemIO, 0xAE08, 0x04)
          Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
          {
              B0EJ,   32
@@ -91,43 +125,43 @@
              Acquire (BLCK, 0xFFFF)
              BNUM = Arg0
              PIDX = (One << Arg1)
              Local0 = PIDX /* \_SB_.PCI0.PIDX */
              Release (BLCK)
              Return (Local0)
          }

          Method (PDSM, 5, Serialized)
          {
              If ((Arg2 == Zero))
              {
                  Local0 = Buffer (One)
                      {
                           0x00 
    // .
                      }
-                Local1 = Zero
                  If ((Arg0 != ToUUID 
("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                  {
                      Return (Local0)
                  }

                  If ((Arg1 < 0x02))
                  {
                      Return (Local0)
                  }

+                Local1 = Zero
                  Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
                      ))
                  If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
                  {
                      Local1 |= One
                      Local1 |= (One << 0x07)
                  }

                  Local0 [Zero] = Local1
                  Return (Local0)
              }

              If ((Arg2 == 0x07))
              {
                  Local0 = Package (0x02)
                      {
@@ -915,32 +949,42 @@

                  Device (RTC)
                  {
                      Name (_HID, EisaId ("PNP0B00") /* AT Real-Time 
Clock */)  // _HID: Hardware ID
                      Name (_CRS, ResourceTemplate ()  // _CRS: Current 
Resource Settings
                      {
                          IO (Decode16,
                              0x0070,             // Range Minimum
                              0x0070,             // Range Maximum
                              0x01,               // Alignment
                              0x08,               // Length
                              )
                          IRQNoFlags ()
                              {8}
                      })
                  }
+            }
+
+            Device (S09)
+            {
+                Name (_ADR, 0x00010001)  // _ADR: Address
+            }
+
+            Device (S0B)
+            {
+                Name (_ADR, 0x00010003)  // _ADR: Address
              }

              Device (S10)
              {
                  Name (_ADR, 0x00020000)  // _ADR: Address
                  Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                  {
                      Return (Zero)
                  }

                  Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                  {
                      Return (Zero)
                  }

                  Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
**
ERROR:../../tests/qtest/bios-tables-test.c:536:test_acpi_asl: assertion 
failed: (all_tables_match)

(test program exited with status code -6)

FYI:

$ iasl -v

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20221020
Copyright (c) 2000 - 2022 Intel Corporation

Regards,

Phil.



