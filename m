Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C626613C9
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 07:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEPWY-0002ad-1O; Sun, 08 Jan 2023 01:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEPWV-0002Xp-RO
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 01:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pEPWU-0003md-3r
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 01:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673160673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6Xw2/1fKi9/Wp63lZvvlu9Rd/QU/JNXhZ9H+GZgPEg=;
 b=FctLx7/MZ/w88JZ+eXRdbNo3mIw7SiVfTbjlNyHF141cLi8rP5cUoUbcxgEfjYnhlXq/c5
 lXRmmDinVKiricdZjKkmpGCGNpVHFOAgRkgY5jxD07ryGDrb/uSKRy9V1cobfnh8Smwoi3
 L8VZuLznGmNSzNWtqxgf0+9ODeHlzGg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-59-73Cqg9nQPh6FQiXky-mqOg-1; Sun, 08 Jan 2023 01:51:10 -0500
X-MC-Unique: 73Cqg9nQPh6FQiXky-mqOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so3257111wmb.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 22:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w6Xw2/1fKi9/Wp63lZvvlu9Rd/QU/JNXhZ9H+GZgPEg=;
 b=MiW9qRH917oges6kiZYEajytkXRtrcDXzizpll7M9VOZsRFFHnjEiH2hfer/iFT4u7
 jUMUXW6v/hjf6htpArMuDP6wzJ4F/iwxnNwXQjxGa+stnMBSqrcdqqgrpGGUeh5gxCoS
 A/1k5yPOubPK4aoPq0sPvj/i3gI3vK/54hroaUZd6GpyYEavttM+Sz+hmMSt7P3MwhOq
 9zM/AGcLNFEaVMEp+ArwmVCWz+MJMs57gemt79CzoQn3FRjbeyYuWQQ+3WUM75a4M7De
 EvXqjDmQYuIC8GkFV+vBZhp1pBIgCWrsZiqCxxYt/WiGP/538WApm43u5JK8Yt2fX2ay
 ftJg==
X-Gm-Message-State: AFqh2kqQjwZtVkH2zb6Z3hzRPpkZK3niR2AGXhKCnNdZaAKgH06UWVWi
 BdJYe+/i4S+VHZIGOCKyuCZdwTajohaAXgAjhxubd1HfyEM5NQAUcLquawJsy4AYOuvkU5dCHQ2
 M2TXDBe1hdQC3Jpo=
X-Received: by 2002:adf:db8d:0:b0:29f:4e42:33c3 with SMTP id
 u13-20020adfdb8d000000b0029f4e4233c3mr12288374wri.56.1673160669717; 
 Sat, 07 Jan 2023 22:51:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkrRijC2P1V6KIiKZzmcoK75x4vygt+ANxKwRO3yF9k2HfXUxxFLrMHdSL8mU/2AGbchnwlA==
X-Received: by 2002:adf:db8d:0:b0:29f:4e42:33c3 with SMTP id
 u13-20020adfdb8d000000b0029f4e4233c3mr12288353wri.56.1673160669471; 
 Sat, 07 Jan 2023 22:51:09 -0800 (PST)
Received: from redhat.com ([2.52.141.223]) by smtp.gmail.com with ESMTPSA id
 j15-20020a5d452f000000b0028f9132e9ddsm5420302wra.39.2023.01.07.22.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 22:51:08 -0800 (PST)
Date: Sun, 8 Jan 2023 01:51:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v2 3/4] include: Don't include qemu/osdep.h
Message-ID: <20230108015023-mutt-send-email-mst@kernel.org>
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221222120813.727830-4-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 22, 2022 at 01:08:12PM +0100, Markus Armbruster wrote:
> docs/devel/style.rst mandates:
> 
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
> 
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
> 
> A few violations have crept in.  Fix them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud� <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Dropped this one due to CI failures.

> ---
>  bsd-user/qemu.h                 | 1 -
>  crypto/block-luks-priv.h        | 1 -
>  include/hw/cxl/cxl_host.h       | 1 -
>  include/hw/input/pl050.h        | 1 -
>  include/hw/tricore/triboard.h   | 1 -
>  include/qemu/userfaultfd.h      | 1 -
>  net/vmnet_int.h                 | 1 -
>  qga/cutils.h                    | 1 -
>  target/hexagon/hex_arch_types.h | 1 -
>  target/hexagon/mmvec/macros.h   | 1 -
>  target/riscv/pmu.h              | 1 -
>  qga/cutils.c                    | 3 ++-
>  12 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..0ceecfb6df 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
>  
> -#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/units.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
> index dc2dd14e52..8fc967afcb 100644
> --- a/crypto/block-luks-priv.h
> +++ b/crypto/block-luks-priv.h
> @@ -18,7 +18,6 @@
>   *
>   */
>  
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/bswap.h"
>  
> diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
> index a1b662ce40..c9bc9c7c50 100644
> --- a/include/hw/cxl/cxl_host.h
> +++ b/include/hw/cxl/cxl_host.h
> @@ -7,7 +7,6 @@
>   * COPYING file in the top-level directory.
>   */
>  
> -#include "qemu/osdep.h"
>  #include "hw/cxl/cxl.h"
>  #include "hw/boards.h"
>  
> diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
> index 89ec4fafc9..4cb8985f31 100644
> --- a/include/hw/input/pl050.h
> +++ b/include/hw/input/pl050.h
> @@ -10,7 +10,6 @@
>  #ifndef HW_PL050_H
>  #define HW_PL050_H
>  
> -#include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "hw/input/ps2.h"
> diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
> index 094c8bd563..4fdd2d7d97 100644
> --- a/include/hw/tricore/triboard.h
> +++ b/include/hw/tricore/triboard.h
> @@ -18,7 +18,6 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "sysemu/sysemu.h"
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> index 6b74f92792..55c95998e8 100644
> --- a/include/qemu/userfaultfd.h
> +++ b/include/qemu/userfaultfd.h
> @@ -13,7 +13,6 @@
>  #ifndef USERFAULTFD_H
>  #define USERFAULTFD_H
>  
> -#include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
>  #include <linux/userfaultfd.h>
>  
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index adf6e8c20d..d0b90594f2 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -10,7 +10,6 @@
>  #ifndef VMNET_INT_H
>  #define VMNET_INT_H
>  
> -#include "qemu/osdep.h"
>  #include "vmnet_int.h"
>  #include "clients.h"
>  
> diff --git a/qga/cutils.h b/qga/cutils.h
> index f0f30a7d28..2bfaf554a8 100644
> --- a/qga/cutils.h
> +++ b/qga/cutils.h
> @@ -1,7 +1,6 @@
>  #ifndef CUTILS_H_
>  #define CUTILS_H_
>  
> -#include "qemu/osdep.h"
>  
>  int qga_open_cloexec(const char *name, int flags, mode_t mode);
>  
> diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
> index 885f68f760..52a7f2b2f3 100644
> --- a/target/hexagon/hex_arch_types.h
> +++ b/target/hexagon/hex_arch_types.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_HEX_ARCH_TYPES_H
>  #define HEXAGON_HEX_ARCH_TYPES_H
>  
> -#include "qemu/osdep.h"
>  #include "mmvec/mmvec.h"
>  #include "qemu/int128.h"
>  
> diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
> index 8c864e8c68..1201d778d0 100644
> --- a/target/hexagon/mmvec/macros.h
> +++ b/target/hexagon/mmvec/macros.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_MMVEC_MACROS_H
>  #define HEXAGON_MMVEC_MACROS_H
>  
> -#include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
>  #include "arch.h"
>  #include "mmvec/system_ext_mmvec.h"
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 3004ce37b6..0c819ca983 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -16,7 +16,6 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
> diff --git a/qga/cutils.c b/qga/cutils.c
> index b8e142ef64..b21bcf3683 100644
> --- a/qga/cutils.c
> +++ b/qga/cutils.c
> @@ -2,8 +2,9 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
>   */
> -#include "cutils.h"
>  
> +#include "qemu/osdep.h"
> +#include "cutils.h"
>  #include "qapi/error.h"
>  
>  /**
> -- 
> 2.38.1


