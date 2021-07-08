Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB83C16E0
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:11:22 +0200 (CEST)
Received: from localhost ([::1]:40326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WcT-0007JB-3M
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Vvs-0007LO-DM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Vvj-0002VP-C7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625758030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2/eRHnPbeGAHFVe3sH0z3fHgj/GZcyG64SIbfWSMK2A=;
 b=Z10aLM3+PN0pPi+2vyw1bfsWu3Tjm1PsplVC1jfPl36yp8f6dvwK1/C5hhRR82HZ95JdgR
 aR7S7MIx9NpS6PrX3+yU5SvYXMigbwb7ENHCWg2zQIgeqy3394p7FjTe/67w97JSwMBSsN
 1NGm4c6e7MmLNTslTVPUpWLn9SE/uHc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-6Tttl0KTOoeEF7UxYlEEQw-1; Thu, 08 Jul 2021 11:27:09 -0400
X-MC-Unique: 6Tttl0KTOoeEF7UxYlEEQw-1
Received: by mail-ej1-f72.google.com with SMTP id
 hy7-20020a1709068a67b02904cdf8737a75so1986813ejc.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2/eRHnPbeGAHFVe3sH0z3fHgj/GZcyG64SIbfWSMK2A=;
 b=m0rclFVEmfwUhVx3w13EPye9i4RXYmjZ1yxNOlLJ08vhexvY0v8cvyOtyb9mYg2Xdg
 RzbGw6H+YgJFXS8eINcw/BPpccWSVLLUeFgKTnd3LE2Jx0aw720p2hjBnyK/BJj7fx+F
 evHnYZNJ2Zr1605NzuetL6VNbk+Fmm0kj7IdllygoTtup0C+EW+oljj4XKPS1GglgaW/
 ZdQI3TRlqfArWEZXZq2w+x+9YaooczmP/Gjj76+JCYar0EBbJN94NXyjQ9KMm9QddNsX
 fhRCG9SL8ePeGTc+KNZJHWsXnrB60ORIwm9D1J0Z2I1bY8vH9O+fbQCuQL0hlDq2aJve
 FjNQ==
X-Gm-Message-State: AOAM531PIKFMRsdqGFCAouGD1ng642S17I3Z0g/jSVjW1zUZRj6S+Pnk
 flY/RNdEU8ZTmjY1RJd4klsYG3Al2pOwbbwQ24jr+/wxpevQ5obpxzLLjSar1K/K3eRu/NLr8Av
 AVg41kzEAB661qF4=
X-Received: by 2002:aa7:d158:: with SMTP id r24mr39226385edo.309.1625758028551; 
 Thu, 08 Jul 2021 08:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbJ+ukN+clfTnGcgl7nRaXmRKnRS4L6uvrltdRQf9WEMf8GrOq0Eu/JL/2rOBpDFZ9YC0vRQ==
X-Received: by 2002:aa7:d158:: with SMTP id r24mr39226354edo.309.1625758028368; 
 Thu, 08 Jul 2021 08:27:08 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id z10sm1440013edc.28.2021.07.08.08.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:27:07 -0700 (PDT)
Date: Thu, 8 Jul 2021 11:27:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 3/7] tests: Add suffix tpm2 or tpm12 to ACPI table files
Message-ID: <20210708112506-mutt-send-email-mst@kernel.org>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
 <20210708155902.53e3d7f7@redhat.com>
 <7a308683-2642-ff74-3f77-5826c6d5cfbd@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <7a308683-2642-ff74-3f77-5826c6d5cfbd@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 10:17:51AM -0400, Stefan Berger wrote:
> 
> On 7/8/21 9:59 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 11:37:19 -0400
> > Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
> > 
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >   tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
> > >   tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
> > >   tests/qtest/bios-tables-test.c                  |   3 ++-
> > >   3 files changed, 2 insertions(+), 1 deletion(-)
> > >   rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
> > >   rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)
> > it fails checkpatch which falsely detects it as adding new files
> > 
> > ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
> > 
> > ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
> > 
> > looks like checkpatch needs to be fixed to handle testcase variant renaming.
> 
> Is this a show stopper for upstreaming it?

It is. The message is wrong (we can teach checkpatch to say
do not add or rename) but the point is correct: don't touch
binary files and code in the same patch because such binary change
patches can't be cherry-picked rebased etc.

So pls follow the usual rules:
- allow diff
- change code
- change expected binary
- disallow diff

-- 
MST


