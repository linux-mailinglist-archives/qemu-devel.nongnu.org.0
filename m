Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7A28C24A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:26:24 +0200 (CEST)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4Ol-00082u-Uc
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS4NW-00070C-Cs
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:25:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:54754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kS4NU-0001Lu-Lg
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:25:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 809DDAFF9;
 Mon, 12 Oct 2020 20:25:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] accel: Add xen CpusAccel using dummy-cpu
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
References: <20201012200725.64137-1-jandryuk@gmail.com>
 <20201012200725.64137-3-jandryuk@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cafc34c0-0bcd-d138-d46d-ac2c0d5ba2fb@suse.de>
Date: Mon, 12 Oct 2020 22:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012200725.64137-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 10:07 PM, Jason Andryuk wrote:
> Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
> code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
> qemu_dummy_start_vcpu() in the default case, but that was replaced by
> g_assert_not_reached().
> 
> Add a minimal "CpusAccel" for xen using the dummy-cpu implementation
> used by qtest.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  accel/dummy/meson.build |  1 +
>  accel/xen/xen-all.c     | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/accel/dummy/meson.build b/accel/dummy/meson.build
> index 5fbe27de90..cdff0ba746 100644
> --- a/accel/dummy/meson.build
> +++ b/accel/dummy/meson.build
> @@ -4,3 +4,4 @@ dummy_ss.add(files(
>  ))
>  
>  specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 60b971d0a8..2d243c58d4 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -16,12 +16,15 @@
>  #include "hw/xen/xen_pt.h"
>  #include "chardev/char.h"
>  #include "sysemu/accel.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/xen.h"
>  #include "sysemu/runstate.h"
>  #include "migration/misc.h"
>  #include "migration/global_state.h"
>  #include "hw/boards.h"
>  
> +#include "accel/dummy/dummy-cpus.h"

it seems this should be in includes/sysemu/accel.h or so.

> +
>  //#define DEBUG_XEN
>  
>  #ifdef DEBUG_XEN
> @@ -153,6 +156,10 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
>      }
>  }
>  
> +const CpusAccel xen_cpus = {
> +    .create_vcpu_thread = dummy_start_vcpu_thread,
> +};
> +
>  static int xen_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -180,6 +187,9 @@ static int xen_init(MachineState *ms)
>       * opt out of system RAM being allocated by generic code
>       */
>      mc->default_ram_id = NULL;
> +
> +    cpus_register_accel(&xen_cpus);
> +
>      return 0;
>  }
>  
> 

Ciao,

Claudio

