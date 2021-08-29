Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3773B3FAD01
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 18:06:02 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKNJo-00072K-LQ
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 12:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@gorilla.13thmonkey.org>)
 id 1mKNIk-00068B-7h
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 12:04:54 -0400
Received: from 13thmonkey.org ([80.100.255.32]:63512
 helo=gorilla.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@gorilla.13thmonkey.org>) id 1mKNIi-0000VV-Dg
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 12:04:53 -0400
Received: by gorilla.13thmonkey.org (Postfix, from userid 103)
 id B11E42FF07A7; Sun, 29 Aug 2021 18:04:38 +0200 (CEST)
Date: Sun, 29 Aug 2021 18:04:36 +0200
From: Reinoud Zandijk <reinoud@13thmonkey.org>
To: qemu-devel@nongnu.org
Subject: applied? Re: [PATCH v1 0/2] Update NVMM support to recent changes,
 [PATCH v1 1/2] Only check CONFIG_NVMM when NEED_CPU_H is defined, [PATCH v1
 2/2] Fix nvmm_ram_block_added() function arguments
Message-ID: <YSuwFI8vBJTDF2GW@gorilla.13thmonkey.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210718134650.1191-3-reinoud@NetBSD.org>
 <20210718134650.1191-2-reinoud@NetBSD.org>
 <20210718134650.1191-1-reinoud@NetBSD.org>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@gorilla.13thmonkey.org; helo=gorilla.13thmonkey.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi :)

Have these patches been applied? How can I easily check it without manually
checking if they are there in a git pullup? Am I notified normally when
patches are applied?

With regards,
Reinoud

On Sun, Jul 18, 2021 at 03:46:48PM +0200, Reinoud Zandijk wrote:
> This patchset fixes small NVMM accelerator compilation issues due to
> changes made in the rest of Qemu since its import.
> 
> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> ---
> 
> Reinoud Zandijk (2):
>   Only check CONFIG_NVMM when NEED_CPU_H is defined
>   Fix nvmm_ram_block_added() function arguments
> 
>  include/sysemu/nvmm.h       | 7 ++++---
>  target/i386/nvmm/nvmm-all.c | 5 +++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> -- 
> 2.31.1

On Sun, Jul 18, 2021 at 03:46:49PM +0200, Reinoud Zandijk wrote:
> Userland targers will otherwise use a poisoned CONFIG_NVMM
> 
> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> ---
>  include/sysemu/nvmm.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
> index 6d216599b0..833670fccb 100644
> --- a/include/sysemu/nvmm.h
> +++ b/include/sysemu/nvmm.h
> @@ -10,8 +10,7 @@
>  #ifndef QEMU_NVMM_H
>  #define QEMU_NVMM_H
>  
> -#include "config-host.h"
> -#include "qemu-common.h"
> +#ifdef NEED_CPU_H
>  
>  #ifdef CONFIG_NVMM
>  
> @@ -23,4 +22,6 @@ int nvmm_enabled(void);
>  
>  #endif /* CONFIG_NVMM */
>  
> -#endif /* CONFIG_NVMM */
> +#endif /* NEED_CPU_H */
> +
> +#endif /* QEMU_NVMM_H */
> -- 
> 2.31.1

On Sun, Jul 18, 2021 at 03:46:50PM +0200, Reinoud Zandijk wrote:
> A parameter max_size was added to the RAMBlockNotifier
> ram_block_added function. Use the max_size for pre allocation
> of hva space.
> 
> Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
> ---
>  target/i386/nvmm/nvmm-all.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
> index dfa690d65d..fdcd37ed3e 100644
> --- a/target/i386/nvmm/nvmm-all.c
> +++ b/target/i386/nvmm/nvmm-all.c
> @@ -1134,13 +1134,14 @@ static MemoryListener nvmm_memory_listener = {
>  };
>  
>  static void
> -nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
> +nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
> +                     size_t max_size)
>  {
>      struct nvmm_machine *mach = get_nvmm_mach();
>      uintptr_t hva = (uintptr_t)host;
>      int ret;
>  
> -    ret = nvmm_hva_map(mach, hva, size);
> +    ret = nvmm_hva_map(mach, hva, max_size);
>  
>      if (ret == -1) {
>          error_report("NVMM: Failed to map HVA, HostVA:%p "
> -- 
> 2.31.1


