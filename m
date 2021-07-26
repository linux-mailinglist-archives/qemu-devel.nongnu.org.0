Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CB43D58C9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:47:27 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7z4w-0001v5-Ac
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7z3A-0000Uh-3T
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m7z36-0001dD-Dl
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627299930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=80oCDLAzBvuMfQmiE+FG0Sajvct7qaJHkEzXRaQ4Qvw=;
 b=ZL3luCJ3lfQS+JXbeUMg9Xcnrejf8B9x2dGO4euHkNBT3ZnECkUm5G8c1ADHvejXI6c8xv
 OzqDF7Bbrk2I/eKdXKxl+iIfBcKreIwyRKqkWnyYDT3jaSyumvfpnfiO5f41emV6FSzQsV
 yihYf71dP4C/vlLY2K+DXsocxPFHfWY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-y8GM_oyRMfqaaDAPLxzRUQ-1; Mon, 26 Jul 2021 07:45:29 -0400
X-MC-Unique: y8GM_oyRMfqaaDAPLxzRUQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso4630520wri.7
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80oCDLAzBvuMfQmiE+FG0Sajvct7qaJHkEzXRaQ4Qvw=;
 b=aHFBXwlBc2RXR9GYbh19LHHySWE4WyMreLpnJYAO1hl4baPVpB92A6hb3dpMwamcjM
 51bteFNYzDy/kr2wbVm76IZsXcHhNNA0Lg+NNLv/A0TYQVUnTXYVmWs1InsSpf0zCub8
 vd/nP+VH0IVjToen+hdhWBC++1VS6p17iPpS/1Ow74GjRYayDlWZtVbyccQb6bYP1zSt
 qpiYQzFEVu+p12j/smLYgP9Ce6S3P0cqxY2fcEZQcNSpMzgUJiDAvdwmceOMHCg/b/k/
 epHU+I94lJ9KAxP0JdkqaKCbvc5IDC/sV0kocF5Ssu2Gzc73//ttMzOhCknCwu7igJ1J
 e8Cw==
X-Gm-Message-State: AOAM532Xu1+Z2uHm/IWi+djv6oR8cNUR+Akq7HMFIkH9FbZmOQ14P821
 N6HUm7g4asWDiRsejknW81B8cbVJXg+YSQ+DXXP6UXwdG0SXkYAPs2n9fewMm4G/jUw2jney6fz
 fi/c8eQOoNczh6QI=
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr16693967wml.18.1627299928252; 
 Mon, 26 Jul 2021 04:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynJonF+5AlqbA9dIB4FWij1HbWSv1DWCGeWOzZkBG8FfTyAKhIGTdoEvoaiDxRTuMwmapnvQ==
X-Received: by 2002:a05:600c:2105:: with SMTP id
 u5mr16693939wml.18.1627299927949; 
 Mon, 26 Jul 2021 04:45:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e6sm13090382wme.28.2021.07.26.04.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:45:27 -0700 (PDT)
Date: Mon, 26 Jul 2021 13:45:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 09/10] ACPI ERST: qtest for ERST
Message-ID: <20210726134526.0eb2cff7@redhat.com>
In-Reply-To: <f80724d7-f319-1e97-ce3a-7dc8682ac193@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
 <20210720153830.71bd4b8e@redhat.com>
 <f80724d7-f319-1e97-ce3a-7dc8682ac193@oracle.com>
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

On Wed, 21 Jul 2021 11:18:44 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/20/21 8:38 AM, Igor Mammedov wrote:
> > On Wed, 30 Jun 2021 15:07:20 -0400
> > Eric DeVolder <eric.devolder@oracle.com> wrote:
> >   
> >> This change provides a qtest that locates and then does a simple
> >> interrogation of the ERST feature within the guest.
> >>
> >> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >> ---
> >>   tests/qtest/erst-test.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>   tests/qtest/meson.build |   2 +
> >>   2 files changed, 131 insertions(+)
> >>   create mode 100644 tests/qtest/erst-test.c
> >>
> >> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
> >> new file mode 100644
> >> index 0000000..ce014c1
> >> --- /dev/null
> >> +++ b/tests/qtest/erst-test.c
> >> @@ -0,0 +1,129 @@
> >> +/*
> >> + * QTest testcase for ACPI ERST
> >> + *
> >> + * Copyright (c) 2021 Oracle
> >> + *
> >> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >> + * See the COPYING file in the top-level directory.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "qemu/bitmap.h"
> >> +#include "qemu/uuid.h"
> >> +#include "hw/acpi/acpi-defs.h"
> >> +#include "boot-sector.h"
> >> +#include "acpi-utils.h"
> >> +#include "libqos/libqtest.h"
> >> +#include "qapi/qmp/qdict.h"
> >> +
> >> +#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
> >> +
> >> +static uint64_t acpi_find_erst(QTestState *qts)
> >> +{
> >> +    uint32_t rsdp_offset;
> >> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
> >> +    uint32_t rsdt_len, table_length;
> >> +    uint8_t *rsdt, *ent;
> >> +    uint64_t base = 0;
> >> +
> >> +    /* Wait for guest firmware to finish and start the payload. */
> >> +    boot_sector_test(qts);
> >> +
> >> +    /* Tables should be initialized now. */
> >> +    rsdp_offset = acpi_find_rsdp_address(qts);
> >> +
> >> +    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
> >> +
> >> +    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
> >> +    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
> >> +                     4, "RSDT", true);
> >> +
> >> +    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
> >> +        uint8_t *table_aml;
> >> +        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
> >> +        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
> >> +            /*
> >> +             * Picking up ERST base address from the Register Region
> >> +             * specified as part of the first Serialization Instruction
> >> +             * Action (which is a Begin Write Operation).
> >> +             */
> >> +            memcpy(&base, &table_aml[56], sizeof(base));
> >> +            g_free(table_aml);
> >> +            break;
> >> +        }
> >> +        g_free(table_aml);
> >> +    }
> >> +    g_free(rsdt);
> >> +    return base;
> >> +}  
> > I'd drop this, bios-tables-test should do ACPI table check
> > as for PCI device itself you can test it with qtest accelerator
> > that allows to instantiate it and access registers directly
> > without overhead of running actual guest.  
> Yes, bios-tables-test checks the ACPI table, but not the functionality.
> This test has actually caught a problem/bug during development.

What I'm saying is not to drop test, but rather use qtest
accelerator to test PCI hardware registers. Which doesn't run
guest code. but lets you directly program/access PCI device.

So instead of searching/parsing ERST table, you'd program BARs
manually on behalf of BIOS, and then test that it works as expected.

As for ACPI tables, we don't have complete testing infrastructure
in tree, bios-tables-test, only tests matching to committed
reference blobs. And verifying that reference blob is correct,
is manual process currently.

To test whole stack one could write an optional acceptance test,
which would run actual guest (if you wish to add that, you can look at
docs/devel/testing.rst "Acceptance tests ...").



> > As example you can look into megasas-test.c, ivshmem-test.c
> > or other PCI device tests.  
> But I'll look at these and see about migrating to this approach.
> 
> >   
> >> +static char disk[] = "tests/erst-test-disk-XXXXXX";
> >> +
> >> +#define ERST_CMD()                              \
> >> +    "-accel kvm -accel tcg "                    \
> >> +    "-object memory-backend-file," \
> >> +      "id=erstnvram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
> >> +    "-device acpi-erst,memdev=erstnvram " \
> >> +    "-drive id=hd0,if=none,file=%s,format=raw " \
> >> +    "-device ide-hd,drive=hd0 ", disk
> >> +
> >> +static void erst_get_error_log_address_range(void)
> >> +{
> >> +    QTestState *qts;
> >> +    uint64_t log_address_range = 0;
> >> +    unsigned log_address_length = 0;
> >> +    unsigned log_address_attr = 0;
> >> +
> >> +    qts = qtest_initf(ERST_CMD());
> >> +
> >> +    uint64_t base = acpi_find_erst(qts);
> >> +    g_assert(base != 0);
> >> +
> >> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
> >> +    qtest_writel(qts, base + 0, 0xD);
> >> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
> >> +    log_address_range = qtest_readq(qts, base + 8);\
> >> +
> >> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_LENGTH command */
> >> +    qtest_writel(qts, base + 0, 0xE);
> >> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_LENGTH result */
> >> +    log_address_length = qtest_readq(qts, base + 8);\
> >> +
> >> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES command */
> >> +    qtest_writel(qts, base + 0, 0xF);
> >> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES result */
> >> +    log_address_attr = qtest_readq(qts, base + 8);\
> >> +
> >> +    /* Check log_address_range is not 0,~0 or base */
> >> +    g_assert(log_address_range != base);
> >> +    g_assert(log_address_range != 0);
> >> +    g_assert(log_address_range != ~0UL);
> >> +
> >> +    /* Check log_address_length is ERST_RECORD_SIZE */
> >> +    g_assert(log_address_length == (8 * 1024));
> >> +
> >> +    /* Check log_address_attr is 0 */
> >> +    g_assert(log_address_attr == 0);
> >> +
> >> +    qtest_quit(qts);
> >> +}
> >> +
> >> +int main(int argc, char **argv)
> >> +{
> >> +    int ret;
> >> +
> >> +    ret = boot_sector_init(disk);
> >> +    if (ret) {
> >> +        return ret;
> >> +    }
> >> +
> >> +    g_test_init(&argc, &argv, NULL);
> >> +
> >> +    qtest_add_func("/erst/get-error-log-address-range",
> >> +                   erst_get_error_log_address_range);
> >> +
> >> +    ret = g_test_run();
> >> +    boot_sector_cleanup(disk);
> >> +
> >> +    return ret;
> >> +}
> >> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> >> index 0c76738..deae443 100644
> >> --- a/tests/qtest/meson.build
> >> +++ b/tests/qtest/meson.build
> >> @@ -66,6 +66,7 @@ qtests_i386 = \
> >>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
> >>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
> >>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
> >> +  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
> >>     qtests_pci +                                                                              \
> >>     ['fdc-test',
> >>      'ide-test',
> >> @@ -237,6 +238,7 @@ qtests = {
> >>     'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
> >>     'cdrom-test': files('boot-sector.c'),
> >>     'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
> >> +  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
> >>     'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
> >>     'migration-test': files('migration-helpers.c'),
> >>     'pxe-test': files('boot-sector.c'),  
> >   
> 


