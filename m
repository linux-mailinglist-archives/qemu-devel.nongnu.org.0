Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E660EFEF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:13:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onw7T-0005RL-JO; Thu, 27 Oct 2022 02:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onw75-00028m-CJ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onw71-0007x8-BM
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666851090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z5EHVHYuy/LmWmnbtfu7h+IjkDoxbhSQ6dKzQInpkVQ=;
 b=Vl3HK2xO0aTkk3cGQvZ7L3eaLSFt66hVyzpvkiVfWqV60AOywtaUF+ycdzdAzvWQ/7N2UT
 KStyc/TESGnKQQjL1tGOa+XEYnUUh0nHaJJYTmaU4dtif/RyjMheh3qJikLDB52ExezSK9
 V1Jzlaql1WjSCBTYpwrVX0Mn0l1mldU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-csKsZJ8iMDSW0TnnpYRwCQ-1; Thu, 27 Oct 2022 02:11:28 -0400
X-MC-Unique: csKsZJ8iMDSW0TnnpYRwCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r18-20020a05600c35d200b003cb2ba79692so221345wmq.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5EHVHYuy/LmWmnbtfu7h+IjkDoxbhSQ6dKzQInpkVQ=;
 b=IyF1nMTVT97NpMV4F/zLZFONbUtC4xVK0soSTzLc9xVgxeV1FWJH7mqATvySQo8FCv
 jEDhUqESR000GIa3ro0psXLwUvE7uBP1WYcuyanj2yIiDAQ7h1n6v6QLw7NfYCqSp1yp
 9zqoSn/f2Fh2/yX6Vy09ccPENj+IgytN70a47A7j3c3lNZmLaydz6IurDG8b4ylqPp6h
 3CS7rc3r39rgKM4PHSDfVXeCW/uqeZm9uwHmnJvVn68CBQ7y86UMApZjRl1mhjut+69W
 lJneI5MyhFZtzbTtqGACWuKN+CGpAseYAD0LR0XrIbb1Vj338YbMA96ATUu1NYu84ua2
 SZ/w==
X-Gm-Message-State: ACrzQf3YBqmEql59x5fbvrCK+1gvsTT1d+Q5W0g/Tuv8hoGjjvank37v
 gqOz4hNG8I5pk33ZRRcDovd7HnSYhB5h+WpNPzFmyIkagmNhVPvXBndYkBbLdNfggY6iDBHE4tR
 7ET4aSbtgXTfrJ2A=
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7bad with SMTP id
 y13-20020a05600015cd00b0023697017badmr837152wry.679.1666851087385; 
 Wed, 26 Oct 2022 23:11:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UUcI/nKXQNsgtWIpY54plqG/D+lIJ26yBdc+OG32EeGSu2fjT08I5g2BJa2Xj38nCnqFKkQ==
X-Received: by 2002:a05:6000:15cd:b0:236:9701:7bad with SMTP id
 y13-20020a05600015cd00b0023697017badmr837133wry.679.1666851087062; 
 Wed, 26 Oct 2022 23:11:27 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm264547wrb.37.2022.10.26.23.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:11:26 -0700 (PDT)
Date: Thu, 27 Oct 2022 02:11:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 5/5] tests/acpi: update tables for new core count test
Message-ID: <20221027021016-mutt-send-email-mst@kernel.org>
References: <20221011111731.101412-1-jusual@redhat.com>
 <20221011111731.101412-6-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011111731.101412-6-jusual@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Oct 11, 2022 at 01:17:31PM +0200, Julia Suvorova wrote:
> Changes in the tables (for 275 cores):
> FACP:
> +                 Use APIC Cluster Model (V4) : 1
> 
> APIC:
> +[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
> +[02Dh 0045   1]                       Length : 08
> +[02Eh 0046   1]                 Processor ID : 00
> +[02Fh 0047   1]                Local Apic ID : 00
> +[030h 0048   4]        Flags (decoded below) : 00000001
> +                           Processor Enabled : 1
> ...
> +
> +[81Ch 2076   1]                Subtable Type : 00 [Processor Local APIC]
> +[81Dh 2077   1]                       Length : 08
> +[81Eh 2078   1]                 Processor ID : FE
> +[81Fh 2079   1]                Local Apic ID : FE
> +[820h 2080   4]        Flags (decoded below) : 00000001
> +                           Processor Enabled : 1
> +                      Runtime Online Capable : 0
> +
> +[824h 2084   1]                Subtable Type : 09 [Processor Local x2APIC]
> +[825h 2085   1]                       Length : 10
> +[826h 2086   2]                     Reserved : 0000
> +[828h 2088   4]          Processor x2Apic ID : 000000FF
> +[82Ch 2092   4]        Flags (decoded below) : 00000001
> +                           Processor Enabled : 1
> +[830h 2096   4]                Processor UID : 000000FF
> ...
> 
> DSDT:
> +            Processor (C001, 0x01, 0x00000000, 0x00)
> +            {
> +                Method (_STA, 0, Serialized)  // _STA: Status
> +                {
> +                    Return (CSTA (One))
> +                }
> +
> +                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
> +                {
> +                     0x00, 0x08, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00   // ........
> +                })
> +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                {
> +                    CEJ0 (One)
> +                }
> +
> +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> +                {
> +                    COST (One, Arg0, Arg1, Arg2)
> +                }
> +            }
> ...
> +            Processor (C0FE, 0xFE, 0x00000000, 0x00)
> +            {
> +                Method (_STA, 0, Serialized)  // _STA: Status
> +                {
> +                    Return (CSTA (0xFE))
> +                }
> +
> +                Name (_MAT, Buffer (0x08)  // _MAT: Multiple APIC Table Entry
> +                {
> +                     0x00, 0x08, 0xFE, 0xFE, 0x01, 0x00, 0x00, 0x00   // ........
> +                })
> +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                {
> +                    CEJ0 (0xFE)
> +                }
> +
> +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> +                {
> +                    COST (0xFE, Arg0, Arg1, Arg2)
> +                }
> +            }
> +
> +            Device (C0FF)
> +            {
> +                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
> +                Name (_UID, 0xFF)  // _UID: Unique ID
> +                Method (_STA, 0, Serialized)  // _STA: Status
> +                {
> +                    Return (CSTA (0xFF))
> +                }
> +
> +                Name (_MAT, Buffer (0x10)  // _MAT: Multiple APIC Table Entry
> +                {
> +                    /* 0000 */  0x09, 0x10, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00,  // ........
> +                    /* 0008 */  0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00   // ........
> +                })
> +                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> +                {
> +                    CEJ0 (0xFF)
> +                }
> +
> +                Method (_OST, 3, Serialized)  // _OST: OSPM Status Indication
> +                {
> +                    COST (0xFF, Arg0, Arg1, Arg2)
> +                }
> +            }
> +
> ...
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Message-Id: <20220731162141.178443-6-jusual@redhat.com>



I had to rebase pushed last update to my tree. Could you pls
disassemble and verify it's correct? Thanks!

-- 
MST


