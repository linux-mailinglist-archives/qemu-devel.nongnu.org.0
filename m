Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3402DE1F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:27:36 +0100 (CET)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDv4-0006fD-3v
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kqDtB-0005qb-2T
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:25:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kqDt5-0002Kf-NA
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:25:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E930EAF2C;
 Fri, 18 Dec 2020 11:25:29 +0000 (UTC)
Subject: Re: [PATCH] whpx: fix compilation
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <60f08ffb-e761-d708-e90e-aed66c1dd584@suse.de>
Date: Fri, 18 Dec 2020 12:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201218084611.634254-1-marcandre.lureau@redhat.com>
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
Cc: pbonzini@redhat.com, sunilmut@microsoft.com,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 9:46 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> When compiling WHPX (on msys2)
> 
> FAILED: libqemu-x86_64-softmmu.fa.p/target_i386_whpx_whpx-all.c.obj
> ../target/i386/whpx/whpx-all.c:29:10: fatal error: whp-dispatch.h: No such file or directory
>    29 | #include "whp-dispatch.h"
>       |          ^~~~~~~~~~~~~~~~
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/sysemu/whpx.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 9346fd92e9..79ab3d73cf 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -15,7 +15,9 @@
>  
>  #ifdef CONFIG_WHPX
>  
> -#include "whp-dispatch.h"
> +#include <windows.h>
> +#include <WinHvPlatform.h>
> +#include <WinHvEmulation.h>
>  
>  struct whpx_state {
>      uint64_t mem_quota;
> 

Hi Marc, interesting factoid: cirrus-ci shows "GREEN", screaming all-ok for msys2, while the error is present,
and visible only on manual inspection of "Run main".

https://cirrus-ci.com/task/6573590369796096

Maybe something that needs attention CI-wise? Not sure who knows the details there, and how to fix it..
Maybe it's my move of whpx code to a subdirectory of target/i386/ that caused the breakage?

Ciao,

Claudio

