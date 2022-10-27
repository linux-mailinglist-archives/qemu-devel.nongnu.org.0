Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0B60FA38
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:13:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3bv-0007Ad-1P; Thu, 27 Oct 2022 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo3br-0006sG-Ii
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:11:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oo3bp-0006sH-Uz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666879908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ng4b8p0bjVsphbzABU5a7GImNBBrD0eZeYIp//Nyso=;
 b=R7oXqLoFSH6qJhK7k05VbOkjHFvyiA9DqNL1+lMW7QDmr3hRqCjQmhbTGgFL/+mDK+bt3v
 PDjGWYEuaYHpbpp7o+jaKgx7TGsuAsJT37euuLjA7WIBMoxYMDkDpNBJ7aX9p/fvf1X55R
 pxAq15/ix2mqZCidXz6tmy+0+4iul4w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-211-UaOjAre1MqWOzxUemYIWpg-1; Thu, 27 Oct 2022 10:11:47 -0400
X-MC-Unique: UaOjAre1MqWOzxUemYIWpg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r22-20020adfa156000000b0023660e969ddso425099wrr.19
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Ng4b8p0bjVsphbzABU5a7GImNBBrD0eZeYIp//Nyso=;
 b=qbVbhyq2j+zDXBI1npQB7OOk4baD/lF8IHIto0r5/r5nmxt2XclKSi+URR7XQACMnn
 Yt5BV2hTAOuMjWW41MhXby7wdN7v4l8rALXLDA9QADOHzpg016AYIBmuYPO8jrWn1CsR
 79i13C2UTcqEtzH71/oZ4LZ2bpNOO03YF3WE6eS4tZJGjRjn/O9gRV/3UBturFz7Etmp
 y7L12AAhCVT0xn9MW04jgrX/UJaVYjftP2l0oh5JBprchQASkWZTEUV4K6buxEPPHyFx
 QQspXcNf0ZRWvQPsC0hk9jBPEi+QbCCgOIKCAbs+lkVXgT3/kaDnke2fbzyG87VmgaXt
 UwnA==
X-Gm-Message-State: ACrzQf0E2L0KIPLoiIFZ1Hsq4tRu0pltHx1gVNThXE0M4iNoifM1RBzk
 n2gVvhuQvMZX+2uvdLcH6vwQMZbNCXr6eSaNm8F5hjDNe3irQ99CCnAclC7LU22jd9ZIwl8iUGu
 A6iPx74WwZKWUnfo=
X-Received: by 2002:a7b:c341:0:b0:3c4:552d:2ea7 with SMTP id
 l1-20020a7bc341000000b003c4552d2ea7mr6186370wmj.82.1666879906073; 
 Thu, 27 Oct 2022 07:11:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49+IkWqt/5T0VZvqAnCq2DzBW9U7idGyGOjGTVb61NYSmDfpIxrhKukwmKxFnxveH7rCBL+A==
X-Received: by 2002:a7b:c341:0:b0:3c4:552d:2ea7 with SMTP id
 l1-20020a7bc341000000b003c4552d2ea7mr6186339wmj.82.1666879905821; 
 Thu, 27 Oct 2022 07:11:45 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6d88000000b0022b315b4649sm1566149wrs.26.2022.10.27.07.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:11:45 -0700 (PDT)
Date: Thu, 27 Oct 2022 16:11:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v3 5/5] tests/acpi: update tables for new core count test
Message-ID: <20221027161144.58743fb1@fedora>
In-Reply-To: <20221027021016-mutt-send-email-mst@kernel.org>
References: <20221011111731.101412-1-jusual@redhat.com>
 <20221011111731.101412-6-jusual@redhat.com>
 <20221027021016-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 02:11:23 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Oct 11, 2022 at 01:17:31PM +0200, Julia Suvorova wrote:
> > Changes in the tables (for 275 cores):
> > FACP:
> > +                 Use APIC Cluster Model (V4) : 1
> > 
> > APIC:
> > +[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
> > +[02Dh 0045   1]                       Length : 08
> > +[02Eh 0046   1]                 Processor ID : 00
> > +[02Fh 0047   1]                Local Apic ID : 00
> > +[030h 0048   4]        Flags (decoded below) : 00000001
> > +                           Processor Enabled : 1
> > ...
> > +
> > +[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
> > +[81Dh 2077   1]                       Length : 08
> > +[81Eh 2078   1]                 Processor ID : FE
> > +[81Fh 2079   1]                Local Apic ID : FE
> > +[820h 2080   4]        Flags (decoded below) : 00000001
> > +                           Processor Enabled : 1
> > +                      Runtime Online Capable : 0
> > +
> > +[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
> > +[825h 2085   1]                       Length : 10
> > +[826h 2086   2]                     Reserved : 0000
> > +[828h 2088   4]          Processor x2Apic ID : 000000FF
> > +[82Ch 2092   4]        Flags (decoded below) : 00000001
> > +                           Processor Enabled : 1
> > +[830h 2096   4]                Processor UID : 000000FF
> > ...
> > 
> > DSDT:
> > +            Processor (C001, 0x01, 0x00000000, 0x00)
> > +            {
> > +                Method (_STA, 0, Serialized)  // _STA: Status
> > +                {
> > +                    Return (CSTA (One))
> > +                }
> > +
> > +                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
> > +                {
> > +                     0x00, 0x08, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00   // ........
> > +                })
> > +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > +                {
> > +                    CEJ0 (One)
> > +                }
> > +
> > +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> > +                {
> > +                    COST (One, Arg0, Arg1, Arg2)
> > +                }
> > +            }
> > ...
> > +            Processor (C0FE, 0xFE, 0x00000000, 0x00)
> > +            {
> > +                Method (_STA, 0, Serialized)  // _STA: Status
> > +                {
> > +                    Return (CSTA (0xFE))
> > +                }
> > +
> > +                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
> > +                {
> > +                     0x00, 0x08, 0xFE, 0xFE, 0x01, 0x00, 0x00, 0x00   // ........
> > +                })
> > +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > +                {
> > +                    CEJ0 (0xFE)
> > +                }
> > +
> > +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> > +                {
> > +                    COST (0xFE, Arg0, Arg1, Arg2)
> > +                }
> > +            }
> > +
> > +            Device (C0FF)
> > +            {
> > +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> > +                Name (_UID, 0xFF)  // _UID: Unique ID
> > +                Method (_STA, 0, Serialized)  // _STA: Status
> > +                {
> > +                    Return (CSTA (0xFF))
> > +                }
> > +
> > +                Name (_MAT, Buffer (0x10)  // _MAT: Multiple APIC Table Entry
> > +                {
> > +                    /* 0000 */  0x09, 0x10, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00,  // ........
> > +                    /* 0008 */  0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00   // ........
> > +                })
> > +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > +                {
> > +                    CEJ0 (0xFF)
> > +                }
> > +
> > +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> > +                {
> > +                    COST (0xFF, Arg0, Arg1, Arg2)
> > +                }
> > +            }
> > +
> > ...
> > 
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Message-Id: <20220731162141.178443-6-jusual@redhat.com>  
> 
> 
> 
> I had to rebase pushed last update to my tree. Could you pls
> disassemble and verify it's correct? Thanks!

new lobs look correct,
though I'd mention in commit log relevant FACP bits:
 +                 Use APIC Cluster Model (V4) : 1


