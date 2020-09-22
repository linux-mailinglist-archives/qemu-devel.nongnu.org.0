Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1012743D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 16:07:30 +0200 (CEST)
Received: from localhost ([::1]:33026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKix6-0000JJ-MD
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 10:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kKiuj-0007jV-G2
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 10:05:02 -0400
Received: from relay64.bu.edu ([128.197.228.104]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kKiug-0004K0-L4
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 10:05:01 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 08ME3ofk030520
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Sep 2020 10:03:53 -0400
Date: Tue, 22 Sep 2020 10:03:50 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 02/16] fuzz: Add general virtual-device fuzzer
Message-ID: <20200922140350.slchhw6qw4ia3bmp@mozz.bu.edu>
References: <20200921022506.873303-1-alxndr@bu.edu>
 <20200921022506.873303-3-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921022506.873303-3-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 10:04:55
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200920 2224, Alexander Bulekov wrote:
[snip]
> +static int locate_fuzz_memory_regions(Object *child, void *opaque)
> +{
> +    const char *name;
> +    MemoryRegion *mr;
> +    if (object_dynamic_cast(child, TYPE_MEMORY_REGION)) {
> +        mr = MEMORY_REGION(child);
> +        if ((memory_region_is_ram(mr) ||
> +            memory_region_is_ram_device(mr) ||
> +            memory_region_is_rom(mr) ||
> +            memory_region_is_romd(mr)) == false) {
> +            name = object_get_canonical_path_component(child);

This isn't a great way to check whether MRs have ops with code that is
interesting to fuzz (for example the pflash MemoryRegions do not pass
these checks, so you can't fuzz the pflash device). Need to think of
some better checks to identify MRs that we are interested in fuzzing.

-Alex

> +            /*
> +             * We don't want duplicate pointers to the same MemoryRegion, so
> +             * try to remove copies of the pointer, before adding it.
> +             */
> +            g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
> +        }
> +    }
> +    return 0;
> +}
> +static int locate_fuzz_objects(Object *child, void *opaque)
> +{
> +    char *pattern = opaque;
> +    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
> +        /* Find and save ptrs to any child MemoryRegions */
> +        object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
> +
> +    } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
> +        if (g_pattern_match_simple(pattern,
> +            object_get_canonical_path_component(child))) {
> +            MemoryRegion *mr;
> +            mr = MEMORY_REGION(child);
> +            if ((memory_region_is_ram(mr) ||
> +                 memory_region_is_ram_device(mr) ||
> +                 memory_region_is_rom(mr) ||
> +                 memory_region_is_romd(mr)) == false) {
> +                g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
> +            }
> +        }
> +    }
> +    return 0;
> +}

