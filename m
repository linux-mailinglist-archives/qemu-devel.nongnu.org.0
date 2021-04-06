Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FDD3556D6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:42:03 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmtz-0000mw-Dq
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lTmsV-0008U3-W4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:40:28 -0400
Received: from relay64.bu.edu ([128.197.228.104]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lTmsU-0001R6-AC
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:40:27 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 136EdnPb015559
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 10:39:53 -0400
Date: Tue, 6 Apr 2021 10:39:49 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
Message-ID: <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
References: <20210406133944.4193691-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406133944.4193691-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210406 1539, Philippe Mathieu-Daudé wrote:
> sparse-mem.c is added to the 'mem_ss' source set, which itself
> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
> selected.
> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
> even if CONFIG_FUZZ is selected:
> 
>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> Fix by adding sparse-mem.c directly to the softmmu_ss set.
> 
> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Oops..
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  hw/mem/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index ef79e046787..3c8fdef9f9e 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,8 +1,9 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>  
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> +
> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
> -- 
> 2.26.3
> 
> 

