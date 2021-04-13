Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C435D9DA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:19:03 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEGE-0006td-UI
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWEF5-0006EG-0u
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:17:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lWEF2-00043w-Qg
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:17:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 251A7AFF1;
 Tue, 13 Apr 2021 08:17:47 +0000 (UTC)
Subject: Re: [PATCH-for-6.1] exec: Remove accel/tcg/ from include paths
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210413081008.3409459-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8a6c1e1f-ad61-25d5-753e-fa4397e7adaa@suse.de>
Date: Tue, 13 Apr 2021 10:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210413081008.3409459-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>

Ciao,

Claudio

On 4/13/21 10:10 AM, Philippe Mathieu-Daudé wrote:
> When TCG is enabled, the accel/tcg/ include path is added to the
> project global include search list. This accel/tcg/ directory
> contains a header named "internal.h" which, while intented to
> be internal to accel/tcg/, is accessible by all files compiled
> when TCG is enabled. This might lead to problem with other
> directories using the same "internal.h" header name:
> 
>   $ git ls-files | fgrep /internal.h
>   accel/tcg/internal.h
>   include/hw/ide/internal.h
>   target/hexagon/internal.h
>   target/mips/internal.h
>   target/ppc/internal.h
>   target/s390x/internal.h
> 
> As we don't need to expose accel/tcg/ internals to the rest of
> the code base, simplify by removing it from the include search
> list, and include the accel/tcg/ public headers relative to the
> project root search path (which is already in the generic include
> search path).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Arguably public accel/tcg/ headers should be exposed under include/.
> ---
>  meson.build                 | 1 -
>  include/exec/helper-gen.h   | 4 ++--
>  include/exec/helper-proto.h | 4 ++--
>  include/exec/helper-tcg.h   | 4 ++--
>  4 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..d8bb1ec5aa9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -258,7 +258,6 @@
>      tcg_arch = 'riscv'
>    endif
>    add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
> -                        '-iquote', meson.current_source_dir() / 'accel/tcg',
>                          language: ['c', 'cpp', 'objc'])
>  
>    accelerators += 'CONFIG_TCG'
> diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
> index 29c02f85dcc..1c2e7a8ed39 100644
> --- a/include/exec/helper-gen.h
> +++ b/include/exec/helper-gen.h
> @@ -81,8 +81,8 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
>  #include "trace/generated-helpers-wrappers.h"
> -#include "tcg-runtime.h"
> -#include "plugin-helpers.h"
> +#include "accel/tcg/tcg-runtime.h"
> +#include "accel/tcg/plugin-helpers.h"
>  
>  #undef DEF_HELPER_FLAGS_0
>  #undef DEF_HELPER_FLAGS_1
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index 659f9298e8f..ba100793a7d 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -39,8 +39,8 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
>  
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
> -#include "tcg-runtime.h"
> -#include "plugin-helpers.h"
> +#include "accel/tcg/tcg-runtime.h"
> +#include "accel/tcg/plugin-helpers.h"
>  
>  #undef IN_HELPER_PROTO
>  
> diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
> index 27870509a20..68885146355 100644
> --- a/include/exec/helper-tcg.h
> +++ b/include/exec/helper-tcg.h
> @@ -60,8 +60,8 @@
>  
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
> -#include "tcg-runtime.h"
> -#include "plugin-helpers.h"
> +#include "accel/tcg/tcg-runtime.h"
> +#include "accel/tcg/plugin-helpers.h"
>  
>  #undef str
>  #undef DEF_HELPER_FLAGS_0
> 


