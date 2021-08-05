Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31223E10D2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:07:02 +0200 (CEST)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZLB-0000EI-D9
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZK9-0007vV-Ez
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZK4-0002lG-Nr
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628154351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3AedGLkdeDMR/mXb1izCXEbyZXQYsi5sbEe6qRvuofQ=;
 b=XJBHqzKLPoK72DlSJE+cvK1BS1uFQQIJmM8KZ4QyLQCT3//f0RFEl/e0UMlYF/9Wgk6715
 2qDPnugWh1cWeS2EjYKxqr2jcVR9LkGjxWyO6QuLceV/tArVtCKufRM78+DHbMfDZTbLnu
 OvHBsWSWfqSP8shULIRJPFsxciqXk7k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-zhjq-oFRMDyrjH9n76nnmw-1; Thu, 05 Aug 2021 05:05:50 -0400
X-MC-Unique: zhjq-oFRMDyrjH9n76nnmw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g187-20020a1c20c40000b02902458d430db6so1026943wmg.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3AedGLkdeDMR/mXb1izCXEbyZXQYsi5sbEe6qRvuofQ=;
 b=bIsULaLUhIT9/jdZXe+LgWhOCy4C/3hqH7/yDlecq26ptHYXt/tWKSfVlq215CiiTB
 X2CteKQP7GuBXg/vlV6GQ4PyhG5aSmq69c3eQawk0+UAs/nBI5PR6nFBfN8f7FgtM9TE
 f4axrHwxgkotad6SVI6AKZYFaA9VO1lrmR+sOj/sk7QQ9ZrUbqulnmpoHfZUYfhEzNoz
 32RiC4ldBlAa0AwM7A5KB84CfHZURsoX25c26xxfZ7N1xDW0P8v6s1VXSJBEvKvFc/n+
 8OctxFcrWIkGIImWNm4YhKbPb6mxp0/RvOJ5WxC0/Jabw6GR1J5bWrSi56+5pBlNpCTP
 5odA==
X-Gm-Message-State: AOAM531pmu5BGDX4yLI6SXRYOzbQ/Bg51d3kxijZCtAgskIJ4hRE0qgq
 ziPwnDaR7uWKnbFqDTDIpxFS0yDImcDuecA13XD0cC+OydadEVnedryCmPX7G0ojeZuag1Tjc23
 yfKFRpHQAk7Gn568=
X-Received: by 2002:a05:600c:1d0a:: with SMTP id
 l10mr14297182wms.29.1628154348517; 
 Thu, 05 Aug 2021 02:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya6lMmY1oJswJd/URR+amcanJG+Ojs0Z1w7EByyeATY8aZr0BSlOdFxYcTyKrNwL96KHVqgA==
X-Received: by 2002:a05:600c:1d0a:: with SMTP id
 l10mr14297113wms.29.1628154347699; 
 Thu, 05 Aug 2021 02:05:47 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d8sm5421777wrv.20.2021.08.05.02.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:05:47 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:05:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
Message-ID: <20210805110544.21545b10@redhat.com>
In-Reply-To: <e4b777fe-4146-95aa-da5e-5805e863e86e@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
 <0a09250e-4347-0ad6-d95c-0bfd2094b98b@oracle.com>
 <20210726124213.58b0e557@redhat.com>
 <6d450e75-3355-1552-7b27-0966f3a18b9a@oracle.com>
 <20210727145247.0174f401@redhat.com>
 <e4b777fe-4146-95aa-da5e-5805e863e86e@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Aug 2021 17:13:40 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/27/21 7:52 AM, Igor Mammedov wrote:
> > On Mon, 26 Jul 2021 15:01:05 -0500
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> On 7/26/21 5:42 AM, Igor Mammedov wrote:  
> >>> On Wed, 21 Jul 2021 11:07:40 -0500
> >>> Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>>      
> >>>> On 7/20/21 7:17 AM, Igor Mammedov wrote:  
> >>>>> On Wed, 30 Jun 2021 15:07:16 -0400
> >>>>> Eric DeVolder <eric.devolder@oracle.com> wrote:
> >>>>>         
> > [..]  
> >>>>>> +
> >>>>>> +static uint64_t erst_rd_reg64(hwaddr addr,
> >>>>>> +    uint64_t reg, unsigned size)
> >>>>>> +{
> >>>>>> +    uint64_t rdval;
> >>>>>> +    uint64_t mask;
> >>>>>> +    unsigned shift;
> >>>>>> +
> >>>>>> +    if (size == sizeof(uint64_t)) {
> >>>>>> +        /* 64b access */
> >>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> >>>>>> +        shift = 0;
> >>>>>> +    } else {
> >>>>>> +        /* 32b access */
> >>>>>> +        mask = 0x00000000FFFFFFFFUL;
> >>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    rdval = reg;
> >>>>>> +    rdval >>= shift;
> >>>>>> +    rdval &= mask;
> >>>>>> +
> >>>>>> +    return rdval;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static uint64_t erst_wr_reg64(hwaddr addr,
> >>>>>> +    uint64_t reg, uint64_t val, unsigned size)
> >>>>>> +{
> >>>>>> +    uint64_t wrval;
> >>>>>> +    uint64_t mask;
> >>>>>> +    unsigned shift;
> >>>>>> +
> >>>>>> +    if (size == sizeof(uint64_t)) {
> >>>>>> +        /* 64b access */
> >>>>>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
> >>>>>> +        shift = 0;
> >>>>>> +    } else {
> >>>>>> +        /* 32b access */
> >>>>>> +        mask = 0x00000000FFFFFFFFUL;
> >>>>>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    val &= mask;
> >>>>>> +    val <<= shift;
> >>>>>> +    mask <<= shift;
> >>>>>> +    wrval = reg;
> >>>>>> +    wrval &= ~mask;
> >>>>>> +    wrval |= val;
> >>>>>> +
> >>>>>> +    return wrval;
> >>>>>> +}  
> >>>>> (I see in next patch it's us defining access width in the ACPI tables)
> >>>>> so question is: do we have to have mixed register width access?
> >>>>> can't all register accesses be 64-bit?  
> >>>>
> >>>> Initially I attempted to just use 64-bit exclusively. The problem is that,
> >>>> for reasons I don't understand, the OSPM on Linux, even x86_64, breaks a 64b
> >>>> register access into two. Here's an example of reading the exchange buffer
> >>>> address, which is coded as a 64b access:
> >>>>
> >>>> acpi_erst_reg_write addr: 0x0000 <== 0x000000000000000d (size: 4)
> >>>> acpi_erst_reg_read  addr: 0x0008 ==> 0x00000000c1010000 (size: 4)
> >>>> acpi_erst_reg_read  addr: 0x000c ==> 0x0000000000000000 (size: 4)
> >>>>
> >>>> So I went ahead and made ACTION register accesses 32b, else there would
> >>>> be two reads of 32-bts, of which the second is useless.  
> >>>
> >>> could you post here decompiled ERST table?  
> >> As it is long, I posted it to the end of this message.  
> > 
> > RHEL8 or Fedora 34 says that erst is invalid table,
> > so I can't help tracing what's going on there.
> > 
> > You'll have to figure out why access is not 64 bit on your own.  
> 
> Today I downloaded Fedora 34 Server and created a guest. Using my
> qemu-6 branch with ERST, it appears to work just fine. I was able to
> create entries into it.
> 
> 
> [    0.010215] ACPI: ERST 0x000000007F9F3000 000390 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.010250] ACPI: Reserving ERST table memory at [mem 0x7f9f3000-0x7f9f338f]
> [    1.056244] ERST: Error Record Serialization Table (ERST) support is initialized.
> [    1.056279] pstore: Registered erst as persistent store backend
> 
> total 0
> drwxr-x---.  2 root root     0 Aug  4 18:05 .
> drwxr-xr-x. 10 root root     0 Aug  4 18:05 ..
> -r--r--r--.  1 root root 17700 Aug  4 17:54 dmesg-erst-6992696633267847169
> -r--r--r--.  1 root root 17714 Aug  4 17:54 dmesg-erst-6992696633267847170
> 
> 
> It appears to Linux OSPM is taking the 64-bit register access and breaking it
> into two 32-bit accesses. 
We need to figure out why this happens.

> If this is the case, then the fix would be in
> Linux and not this code.
> 
> Pending your response to this finding, I have v6 ready to go.
ok, let's go with v6, I hope it will work for me.

> Thanks
> eric
> 
> 
> > 
> > [...]
> >   
> >> Obtained via a running guest with:
> >> iasl -d -vt /sys/firmware/acpi/tables/ERST
> >>
> >> /*
> >>    * Intel ACPI Component Architecture
> >>    * AML/ASL+ Disassembler version 20180105 (64-bit version)
> >>    * Copyright (c) 2000 - 2018 Intel Corporation
> >>    *
> >>    * Disassembly of ERST.blob, Mon Jul 26 14:31:21 2021
> >>    *
> >>    * ACPI Data Table [ERST]
> >>    *
> >>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
> >>    */
> >>
> >> [000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
> >> [004h 0004   4]                 Table Length : 00000390
> >> [008h 0008   1]                     Revision : 01
> >> [009h 0009   1]                     Checksum : C8
> >> [00Ah 0010   6]                       Oem ID : "BOCHS "
> >> [010h 0016   8]                 Oem Table ID : "BXPC    "
> >> [018h 0024   4]                 Oem Revision : 00000001
> >> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> >> [020h 0032   4]        Asl Compiler Revision : 00000001
> >>
> >> [024h 0036   4]  Serialization Header Length : 00000030
> >> [028h 0040   4]                     Reserved : 00000000
> >> [02Ch 0044   4]      Instruction Entry Count : 0000001B
> >>
> >> [030h 0048   1]                       Action : 00 [Begin Write Operation]
> >> [031h 0049   1]                  Instruction : 03 [Write Register Value]
> >> [032h 0050   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [033h 0051   1]                     Reserved : 00
> >>
> >> [034h 0052  12]              Register Region : [Generic Address Structure]
> >> [034h 0052   1]                     Space ID : 00 [SystemMemory]
> >> [035h 0053   1]                    Bit Width : 20
> >> [036h 0054   1]                   Bit Offset : 00
> >> [037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [038h 0056   8]                      Address : 00000000C1063000
> >>
> >> [040h 0064   8]                        Value : 0000000000000000
> >> [048h 0072   8]                         Mask : 00000000000000FF
> >>
> >> [050h 0080   1]                       Action : 01 [Begin Read Operation]
> >> [051h 0081   1]                  Instruction : 03 [Write Register Value]
> >> [052h 0082   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [053h 0083   1]                     Reserved : 00
> >>
> >> [054h 0084  12]              Register Region : [Generic Address Structure]
> >> [054h 0084   1]                     Space ID : 00 [SystemMemory]
> >> [055h 0085   1]                    Bit Width : 20
> >> [056h 0086   1]                   Bit Offset : 00
> >> [057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [058h 0088   8]                      Address : 00000000C1063000
> >>
> >> [060h 0096   8]                        Value : 0000000000000001
> >> [068h 0104   8]                         Mask : 00000000000000FF
> >>
> >> [070h 0112   1]                       Action : 02 [Begin Clear Operation]
> >> [071h 0113   1]                  Instruction : 03 [Write Register Value]
> >> [072h 0114   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [073h 0115   1]                     Reserved : 00
> >>
> >> [074h 0116  12]              Register Region : [Generic Address Structure]
> >> [074h 0116   1]                     Space ID : 00 [SystemMemory]
> >> [075h 0117   1]                    Bit Width : 20
> >> [076h 0118   1]                   Bit Offset : 00
> >> [077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [078h 0120   8]                      Address : 00000000C1063000
> >>
> >> [080h 0128   8]                        Value : 0000000000000002
> >> [088h 0136   8]                         Mask : 00000000000000FF
> >>
> >> [090h 0144   1]                       Action : 03 [End Operation]
> >> [091h 0145   1]                  Instruction : 03 [Write Register Value]
> >> [092h 0146   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [093h 0147   1]                     Reserved : 00
> >>
> >> [094h 0148  12]              Register Region : [Generic Address Structure]
> >> [094h 0148   1]                     Space ID : 00 [SystemMemory]
> >> [095h 0149   1]                    Bit Width : 20
> >> [096h 0150   1]                   Bit Offset : 00
> >> [097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [098h 0152   8]                      Address : 00000000C1063000
> >>
> >> [0A0h 0160   8]                        Value : 0000000000000003
> >> [0A8h 0168   8]                         Mask : 00000000000000FF
> >>
> >> [0B0h 0176   1]                       Action : 04 [Set Record Offset]
> >> [0B1h 0177   1]                  Instruction : 02 [Write Register]
> >> [0B2h 0178   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [0B3h 0179   1]                     Reserved : 00
> >>
> >> [0B4h 0180  12]              Register Region : [Generic Address Structure]
> >> [0B4h 0180   1]                     Space ID : 00 [SystemMemory]
> >> [0B5h 0181   1]                    Bit Width : 20
> >> [0B6h 0182   1]                   Bit Offset : 00
> >> [0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [0B8h 0184   8]                      Address : 00000000C1063008
> >>
> >> [0C0h 0192   8]                        Value : 0000000000000000
> >> [0C8h 0200   8]                         Mask : 00000000FFFFFFFF
> >>
> >> [0D0h 0208   1]                       Action : 04 [Set Record Offset]
> >> [0D1h 0209   1]                  Instruction : 03 [Write Register Value]
> >> [0D2h 0210   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [0D3h 0211   1]                     Reserved : 00
> >>
> >> [0D4h 0212  12]              Register Region : [Generic Address Structure]
> >> [0D4h 0212   1]                     Space ID : 00 [SystemMemory]
> >> [0D5h 0213   1]                    Bit Width : 20
> >> [0D6h 0214   1]                   Bit Offset : 00
> >> [0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [0D8h 0216   8]                      Address : 00000000C1063000
> >>
> >> [0E0h 0224   8]                        Value : 0000000000000004
> >> [0E8h 0232   8]                         Mask : 00000000000000FF
> >>
> >> [0F0h 0240   1]                       Action : 05 [Execute Operation]
> >> [0F1h 0241   1]                  Instruction : 03 [Write Register Value]
> >> [0F2h 0242   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [0F3h 0243   1]                     Reserved : 00
> >>
> >> [0F4h 0244  12]              Register Region : [Generic Address Structure]
> >> [0F4h 0244   1]                     Space ID : 00 [SystemMemory]
> >> [0F5h 0245   1]                    Bit Width : 20
> >> [0F6h 0246   1]                   Bit Offset : 00
> >> [0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [0F8h 0248   8]                      Address : 00000000C1063008
> >>
> >> [100h 0256   8]                        Value : 000000000000009C
> >> [108h 0264   8]                         Mask : 00000000000000FF
> >>
> >> [110h 0272   1]                       Action : 05 [Execute Operation]
> >> [111h 0273   1]                  Instruction : 03 [Write Register Value]
> >> [112h 0274   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [113h 0275   1]                     Reserved : 00
> >>
> >> [114h 0276  12]              Register Region : [Generic Address Structure]
> >> [114h 0276   1]                     Space ID : 00 [SystemMemory]
> >> [115h 0277   1]                    Bit Width : 20
> >> [116h 0278   1]                   Bit Offset : 00
> >> [117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [118h 0280   8]                      Address : 00000000C1063000
> >>
> >> [120h 0288   8]                        Value : 0000000000000005
> >> [128h 0296   8]                         Mask : 00000000000000FF
> >>
> >> [130h 0304   1]                       Action : 06 [Check Busy Status]
> >> [131h 0305   1]                  Instruction : 03 [Write Register Value]
> >> [132h 0306   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [133h 0307   1]                     Reserved : 00
> >>
> >> [134h 0308  12]              Register Region : [Generic Address Structure]
> >> [134h 0308   1]                     Space ID : 00 [SystemMemory]
> >> [135h 0309   1]                    Bit Width : 20
> >> [136h 0310   1]                   Bit Offset : 00
> >> [137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [138h 0312   8]                      Address : 00000000C1063000
> >>
> >> [140h 0320   8]                        Value : 0000000000000006
> >> [148h 0328   8]                         Mask : 00000000000000FF
> >>
> >> [150h 0336   1]                       Action : 06 [Check Busy Status]
> >> [151h 0337   1]                  Instruction : 01 [Read Register Value]
> >> [152h 0338   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [153h 0339   1]                     Reserved : 00
> >>
> >> [154h 0340  12]              Register Region : [Generic Address Structure]
> >> [154h 0340   1]                     Space ID : 00 [SystemMemory]
> >> [155h 0341   1]                    Bit Width : 20
> >> [156h 0342   1]                   Bit Offset : 00
> >> [157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [158h 0344   8]                      Address : 00000000C1063008
> >>
> >> [160h 0352   8]                        Value : 0000000000000001
> >> [168h 0360   8]                         Mask : 00000000000000FF
> >>
> >> [170h 0368   1]                       Action : 07 [Get Command Status]
> >> [171h 0369   1]                  Instruction : 03 [Write Register Value]
> >> [172h 0370   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [173h 0371   1]                     Reserved : 00
> >>
> >> [174h 0372  12]              Register Region : [Generic Address Structure]
> >> [174h 0372   1]                     Space ID : 00 [SystemMemory]
> >> [175h 0373   1]                    Bit Width : 20
> >> [176h 0374   1]                   Bit Offset : 00
> >> [177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [178h 0376   8]                      Address : 00000000C1063000
> >>
> >> [180h 0384   8]                        Value : 0000000000000007
> >> [188h 0392   8]                         Mask : 00000000000000FF
> >>
> >> [190h 0400   1]                       Action : 07 [Get Command Status]
> >> [191h 0401   1]                  Instruction : 00 [Read Register]
> >> [192h 0402   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [193h 0403   1]                     Reserved : 00
> >>
> >> [194h 0404  12]              Register Region : [Generic Address Structure]
> >> [194h 0404   1]                     Space ID : 00 [SystemMemory]
> >> [195h 0405   1]                    Bit Width : 20
> >> [196h 0406   1]                   Bit Offset : 00
> >> [197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [198h 0408   8]                      Address : 00000000C1063008
> >>
> >> [1A0h 0416   8]                        Value : 0000000000000000
> >> [1A8h 0424   8]                         Mask : 00000000000000FF
> >>
> >> [1B0h 0432   1]                       Action : 08 [Get Record Identifier]
> >> [1B1h 0433   1]                  Instruction : 03 [Write Register Value]
> >> [1B2h 0434   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [1B3h 0435   1]                     Reserved : 00
> >>
> >> [1B4h 0436  12]              Register Region : [Generic Address Structure]
> >> [1B4h 0436   1]                     Space ID : 00 [SystemMemory]
> >> [1B5h 0437   1]                    Bit Width : 20
> >> [1B6h 0438   1]                   Bit Offset : 00
> >> [1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [1B8h 0440   8]                      Address : 00000000C1063000
> >>
> >> [1C0h 0448   8]                        Value : 0000000000000008
> >> [1C8h 0456   8]                         Mask : 00000000000000FF
> >>
> >> [1D0h 0464   1]                       Action : 08 [Get Record Identifier]
> >> [1D1h 0465   1]                  Instruction : 00 [Read Register]
> >> [1D2h 0466   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [1D3h 0467   1]                     Reserved : 00
> >>
> >> [1D4h 0468  12]              Register Region : [Generic Address Structure]
> >> [1D4h 0468   1]                     Space ID : 00 [SystemMemory]
> >> [1D5h 0469   1]                    Bit Width : 40
> >> [1D6h 0470   1]                   Bit Offset : 00
> >> [1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
> >> [1D8h 0472   8]                      Address : 00000000C1063008
> >>
> >> [1E0h 0480   8]                        Value : 0000000000000000
> >> [1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF
> >>
> >> [1F0h 0496   1]                       Action : 09 [Set Record Identifier]
> >> [1F1h 0497   1]                  Instruction : 02 [Write Register]
> >> [1F2h 0498   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [1F3h 0499   1]                     Reserved : 00
> >>
> >> [1F4h 0500  12]              Register Region : [Generic Address Structure]
> >> [1F4h 0500   1]                     Space ID : 00 [SystemMemory]
> >> [1F5h 0501   1]                    Bit Width : 40
> >> [1F6h 0502   1]                   Bit Offset : 00
> >> [1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
> >> [1F8h 0504   8]                      Address : 00000000C1063008
> >>
> >> [200h 0512   8]                        Value : 0000000000000000
> >> [208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF
> >>
> >> [210h 0528   1]                       Action : 09 [Set Record Identifier]
> >> [211h 0529   1]                  Instruction : 03 [Write Register Value]
> >> [212h 0530   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [213h 0531   1]                     Reserved : 00
> >>
> >> [214h 0532  12]              Register Region : [Generic Address Structure]
> >> [214h 0532   1]                     Space ID : 00 [SystemMemory]
> >> [215h 0533   1]                    Bit Width : 20
> >> [216h 0534   1]                   Bit Offset : 00
> >> [217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [218h 0536   8]                      Address : 00000000C1063000
> >>
> >> [220h 0544   8]                        Value : 0000000000000009
> >> [228h 0552   8]                         Mask : 00000000000000FF
> >>
> >> [230h 0560   1]                       Action : 0A [Get Record Count]
> >> [231h 0561   1]                  Instruction : 03 [Write Register Value]
> >> [232h 0562   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [233h 0563   1]                     Reserved : 00
> >>
> >> [234h 0564  12]              Register Region : [Generic Address Structure]
> >> [234h 0564   1]                     Space ID : 00 [SystemMemory]
> >> [235h 0565   1]                    Bit Width : 20
> >> [236h 0566   1]                   Bit Offset : 00
> >> [237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [238h 0568   8]                      Address : 00000000C1063000
> >>
> >> [240h 0576   8]                        Value : 000000000000000A
> >> [248h 0584   8]                         Mask : 00000000000000FF
> >>
> >> [250h 0592   1]                       Action : 0A [Get Record Count]
> >> [251h 0593   1]                  Instruction : 00 [Read Register]
> >> [252h 0594   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [253h 0595   1]                     Reserved : 00
> >>
> >> [254h 0596  12]              Register Region : [Generic Address Structure]
> >> [254h 0596   1]                     Space ID : 00 [SystemMemory]
> >> [255h 0597   1]                    Bit Width : 20
> >> [256h 0598   1]                   Bit Offset : 00
> >> [257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [258h 0600   8]                      Address : 00000000C1063008
> >>
> >> [260h 0608   8]                        Value : 0000000000000000
> >> [268h 0616   8]                         Mask : 00000000FFFFFFFF
> >>
> >> [270h 0624   1]                       Action : 0B [Begin Dummy Write]
> >> [271h 0625   1]                  Instruction : 03 [Write Register Value]
> >> [272h 0626   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [273h 0627   1]                     Reserved : 00
> >>
> >> [274h 0628  12]              Register Region : [Generic Address Structure]
> >> [274h 0628   1]                     Space ID : 00 [SystemMemory]
> >> [275h 0629   1]                    Bit Width : 20
> >> [276h 0630   1]                   Bit Offset : 00
> >> [277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [278h 0632   8]                      Address : 00000000C1063000
> >>
> >> [280h 0640   8]                        Value : 000000000000000B
> >> [288h 0648   8]                         Mask : 00000000000000FF
> >>
> >> [290h 0656   1]                       Action : 0D [Get Error Address Range]
> >> [291h 0657   1]                  Instruction : 03 [Write Register Value]
> >> [292h 0658   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [293h 0659   1]                     Reserved : 00
> >>
> >> [294h 0660  12]              Register Region : [Generic Address Structure]
> >> [294h 0660   1]                     Space ID : 00 [SystemMemory]
> >> [295h 0661   1]                    Bit Width : 20
> >> [296h 0662   1]                   Bit Offset : 00
> >> [297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [298h 0664   8]                      Address : 00000000C1063000
> >>
> >> [2A0h 0672   8]                        Value : 000000000000000D
> >> [2A8h 0680   8]                         Mask : 00000000000000FF
> >>
> >> [2B0h 0688   1]                       Action : 0D [Get Error Address Range]
> >> [2B1h 0689   1]                  Instruction : 00 [Read Register]
> >> [2B2h 0690   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [2B3h 0691   1]                     Reserved : 00
> >>
> >> [2B4h 0692  12]              Register Region : [Generic Address Structure]
> >> [2B4h 0692   1]                     Space ID : 00 [SystemMemory]
> >> [2B5h 0693   1]                    Bit Width : 40
> >> [2B6h 0694   1]                   Bit Offset : 00
> >> [2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
> >> [2B8h 0696   8]                      Address : 00000000C1063008
> >>
> >> [2C0h 0704   8]                        Value : 0000000000000000
> >> [2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF
> >>
> >> [2D0h 0720   1]                       Action : 0E [Get Error Address Length]
> >> [2D1h 0721   1]                  Instruction : 03 [Write Register Value]
> >> [2D2h 0722   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [2D3h 0723   1]                     Reserved : 00
> >>
> >> [2D4h 0724  12]              Register Region : [Generic Address Structure]
> >> [2D4h 0724   1]                     Space ID : 00 [SystemMemory]
> >> [2D5h 0725   1]                    Bit Width : 20
> >> [2D6h 0726   1]                   Bit Offset : 00
> >> [2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [2D8h 0728   8]                      Address : 00000000C1063000
> >>
> >> [2E0h 0736   8]                        Value : 000000000000000E
> >> [2E8h 0744   8]                         Mask : 00000000000000FF
> >>
> >> [2F0h 0752   1]                       Action : 0E [Get Error Address Length]
> >> [2F1h 0753   1]                  Instruction : 00 [Read Register]
> >> [2F2h 0754   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [2F3h 0755   1]                     Reserved : 00
> >>
> >> [2F4h 0756  12]              Register Region : [Generic Address Structure]
> >> [2F4h 0756   1]                     Space ID : 00 [SystemMemory]
> >> [2F5h 0757   1]                    Bit Width : 40
> >> [2F6h 0758   1]                   Bit Offset : 00
> >> [2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
> >> [2F8h 0760   8]                      Address : 00000000C1063008
> >>
> >> [300h 0768   8]                        Value : 0000000000000000
> >> [308h 0776   8]                         Mask : 00000000FFFFFFFF
> >>
> >> [310h 0784   1]                       Action : 0F [Get Error Attributes]
> >> [311h 0785   1]                  Instruction : 03 [Write Register Value]
> >> [312h 0786   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [313h 0787   1]                     Reserved : 00
> >>
> >> [314h 0788  12]              Register Region : [Generic Address Structure]
> >> [314h 0788   1]                     Space ID : 00 [SystemMemory]
> >> [315h 0789   1]                    Bit Width : 20
> >> [316h 0790   1]                   Bit Offset : 00
> >> [317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [318h 0792   8]                      Address : 00000000C1063000
> >>
> >> [320h 0800   8]                        Value : 000000000000000F
> >> [328h 0808   8]                         Mask : 00000000000000FF
> >>
> >> [330h 0816   1]                       Action : 0F [Get Error Attributes]
> >> [331h 0817   1]                  Instruction : 00 [Read Register]
> >> [332h 0818   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [333h 0819   1]                     Reserved : 00
> >>
> >> [334h 0820  12]              Register Region : [Generic Address Structure]
> >> [334h 0820   1]                     Space ID : 00 [SystemMemory]
> >> [335h 0821   1]                    Bit Width : 20
> >> [336h 0822   1]                   Bit Offset : 00
> >> [337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [338h 0824   8]                      Address : 00000000C1063008
> >>
> >> [340h 0832   8]                        Value : 0000000000000000
> >> [348h 0840   8]                         Mask : 00000000FFFFFFFF
> >>
> >> [350h 0848   1]                       Action : 10 [Execute Timings]
> >> [351h 0849   1]                  Instruction : 03 [Write Register Value]
> >> [352h 0850   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [353h 0851   1]                     Reserved : 00
> >>
> >> [354h 0852  12]              Register Region : [Generic Address Structure]
> >> [354h 0852   1]                     Space ID : 00 [SystemMemory]
> >> [355h 0853   1]                    Bit Width : 20
> >> [356h 0854   1]                   Bit Offset : 00
> >> [357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
> >> [358h 0856   8]                      Address : 00000000C1063000
> >>
> >> [360h 0864   8]                        Value : 0000000000000010
> >> [368h 0872   8]                         Mask : 00000000000000FF
> >>
> >> [370h 0880   1]                       Action : 10 [Execute Timings]
> >> [371h 0881   1]                  Instruction : 00 [Read Register]
> >> [372h 0882   1]        Flags (decoded below) : 00
> >>                         Preserve Register Bits : 0
> >> [373h 0883   1]                     Reserved : 00
> >>
> >> [374h 0884  12]              Register Region : [Generic Address Structure]
> >> [374h 0884   1]                     Space ID : 00 [SystemMemory]
> >> [375h 0885   1]                    Bit Width : 40
> >> [376h 0886   1]                   Bit Offset : 00
> >> [377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
> >> [378h 0888   8]                      Address : 00000000C1063008
> >>
> >> [380h 0896   8]                        Value : 0000000000000000
> >> [388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF
> >>
> >> Raw Table Data: Length 912 (0x390)
> >>
> >>     0000: 45 52 53 54 90 03 00 00 01 C8 42 4F 43 48 53 20  // ERST......BOCHS
> >>     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
> >>     0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
> >>     0030: 00 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0040: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0050: 01 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0060: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0070: 02 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0080: 02 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0090: 03 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     00A0: 03 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     00B0: 04 02 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
> >>     00D0: 04 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     00E0: 04 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     00F0: 05 03 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0100: 9C 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0110: 05 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0120: 05 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0130: 06 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0140: 06 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0150: 06 01 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0160: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0170: 07 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0180: 07 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0190: 07 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     01A0: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     01B0: 08 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     01C0: 08 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     01D0: 08 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
> >>     01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
> >>     01F0: 09 02 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
> >>     0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
> >>     0210: 09 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0220: 09 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0230: 0A 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0240: 0A 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0250: 0A 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
> >>     0270: 0B 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0280: 0B 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0290: 0D 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     02A0: 0D 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     02B0: 0D 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
> >>     02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
> >>     02D0: 0E 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     02E0: 0E 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     02F0: 0E 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
> >>     0300: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
> >>     0310: 0F 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0320: 0F 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0330: 0F 00 00 00 00 20 00 03 08 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
> >>     0350: 10 03 00 00 00 20 00 03 00 30 06 C1 00 00 00 00  // ..... ...0......
> >>     0360: 10 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
> >>     0370: 10 00 00 00 00 40 00 04 08 30 06 C1 00 00 00 00  // .....@...0......
> >>     0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
> >>  
> >   
> 


