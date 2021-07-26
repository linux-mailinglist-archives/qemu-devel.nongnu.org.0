Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D23D5889
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:32:34 +0200 (CEST)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yqX-0007n4-44
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7yoS-0006hz-Uo
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7yoR-00015V-8c
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627299021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz7g436YV7E8CMU7uiXNkrE/gYjY5ZHB+G4x6pbxxaU=;
 b=hWGQMDuWKo5ZaUzo3BVkOmhaCBsHOcZEr9xJuEC15Ea9DPAlBdXjSz+BZbuIM1XAXWtpI2
 UGlWMZ+Hj2DysgGxfZ/RhSn1ZEM9xhMEdJ/W3cJMAa85etMIhTp+uumlIKzkf0sXPAkt/Q
 rJv7VvChwvQrukC5s74yyu+POnTQgN0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-DICSbqY_NHeDJBQGUSVQVQ-1; Mon, 26 Jul 2021 07:30:20 -0400
X-MC-Unique: DICSbqY_NHeDJBQGUSVQVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so4598851wrs.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tz7g436YV7E8CMU7uiXNkrE/gYjY5ZHB+G4x6pbxxaU=;
 b=UAmws/DcM+F1WxEFBulkFA0mSdO6/j6XawUr1gG3WE02J9bFOrmhmS+6fey8m0uZj+
 NtT1A8DSXp3ewPgJ4p9E8zJvvJsdxqgzMstj+JKT0TS2FO0KyeM1xtcZbytuM7XbyFVF
 CmCmp1xTPmj22OKQBQDIOYs/0NWEkJX2zsa0QUOeofnlmTbKPBxxVOIQq1s4Cz4oi9Nw
 +0rjnrrMliSFCUuwM4Z0nNdbCGE1akpizhv47PtwL20TxIjYyHNI8FrJoBx1RtLmBWe3
 ZCN9PydPZ7WeOLPcF7orUZXNnwtnqPu3JbZ4oCeZT96tkJpmgHoABpp8Kz3RjJl0FO2Y
 QctQ==
X-Gm-Message-State: AOAM533FAc/PckUUUQE/E/sRBD4fkT/NJFox0O/OKxNRXQT80opqzwmo
 KboZTfgyuUsb77t7Abj+MhP22yV7xxREJSeZgG6M1V8klqZS4O0BgHS+9szRxs2vHg9x1oXiyTE
 uspJXqQgBRMEq3Ro=
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr5897844wmj.53.1627299019599;
 Mon, 26 Jul 2021 04:30:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDsXDJev+vOwrcpc2DUPskoTLPtElvDf4qOY6WVrlg8c2Yf10Q/tzZmf6osisrZfjuam9Iww==
X-Received: by 2002:a7b:c1c7:: with SMTP id a7mr5897817wmj.53.1627299019435;
 Mon, 26 Jul 2021 04:30:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a7sm32583811wru.67.2021.07.26.04.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:30:19 -0700 (PDT)
Date: Mon, 26 Jul 2021 13:30:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 08/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
Message-ID: <20210726133017.6b0d0031@redhat.com>
In-Reply-To: <3916035d-a628-f7e2-44f3-1a724e3d523f@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
 <20210720151924.2eb89d31@redhat.com>
 <3916035d-a628-f7e2-44f3-1a724e3d523f@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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

On Wed, 21 Jul 2021 11:16:42 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/20/21 8:19 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 15:07:19 -0400
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> This change exposes ACPI ERST support for x86 guests.
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>  
> > looks good to me, maybe move find_erst_dev() impl. here as well
> > if it's the patch it's first used.  
> 
> I've followed your previous suggestion of mimicking find_vmgenid_dev(), which
> declares it in its header file. I've done the same, find_erst_dev() is
> declared in its header file and used in these files.

it's fine doing like this but
it would be easier to follow if this were part of [6/10],
so that function is introduced and used in the same patch.


> >   
> >> ---
> >>   hw/i386/acpi-build.c   | 9 +++++++++
> >>   hw/i386/acpi-microvm.c | 9 +++++++++
> >>   2 files changed, 18 insertions(+)
> >>
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index de98750..d2026cc 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -43,6 +43,7 @@
> >>   #include "sysemu/tpm.h"
> >>   #include "hw/acpi/tpm.h"
> >>   #include "hw/acpi/vmgenid.h"
> >> +#include "hw/acpi/erst.h"
> >>   #include "hw/boards.h"
> >>   #include "sysemu/tpm_backend.h"
> >>   #include "hw/rtc/mc146818rtc_regs.h"
> >> @@ -2327,6 +2328,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >>       GArray *tables_blob = tables->table_data;
> >>       AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
> >>       Object *vmgenid_dev;
> >> +    Object *erst_dev;
> >>       char *oem_id;
> >>       char *oem_table_id;
> >>   
> >> @@ -2388,6 +2390,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >>                       x86ms->oem_table_id);
> >>   
> >> +    erst_dev = find_erst_dev();
> >> +    if (erst_dev) {
> >> +        acpi_add_table(table_offsets, tables_blob);
> >> +        build_erst(tables_blob, tables->linker, erst_dev,
> >> +                   x86ms->oem_id, x86ms->oem_table_id);
> >> +    }
> >> +
> >>       vmgenid_dev = find_vmgenid_dev();
> >>       if (vmgenid_dev) {
> >>           acpi_add_table(table_offsets, tables_blob);
> >> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> >> index ccd3303..0099b13 100644
> >> --- a/hw/i386/acpi-microvm.c
> >> +++ b/hw/i386/acpi-microvm.c
> >> @@ -30,6 +30,7 @@
> >>   #include "hw/acpi/bios-linker-loader.h"
> >>   #include "hw/acpi/generic_event_device.h"
> >>   #include "hw/acpi/utils.h"
> >> +#include "hw/acpi/erst.h"
> >>   #include "hw/boards.h"
> >>   #include "hw/i386/fw_cfg.h"
> >>   #include "hw/i386/microvm.h"
> >> @@ -160,6 +161,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >>       X86MachineState *x86ms = X86_MACHINE(mms);
> >>       GArray *table_offsets;
> >>       GArray *tables_blob = tables->table_data;
> >> +    Object *erst_dev;
> >>       unsigned dsdt, xsdt;
> >>       AcpiFadtData pmfadt = {
> >>           /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
> >> @@ -209,6 +211,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
> >>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> >>                       x86ms->oem_table_id);
> >>   
> >> +    erst_dev = find_erst_dev();
> >> +    if (erst_dev) {
> >> +        acpi_add_table(table_offsets, tables_blob);
> >> +        build_erst(tables_blob, tables->linker, erst_dev,
> >> +                   x86ms->oem_id, x86ms->oem_table_id);
> >> +    }
> >> +
> >>       xsdt = tables_blob->len;
> >>       build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
> >>                  x86ms->oem_table_id);  
> >   
> 


