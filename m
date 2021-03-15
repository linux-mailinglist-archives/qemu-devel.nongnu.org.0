Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD333BB00
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:14:31 +0100 (CET)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnzK-0006xg-Oh
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLnsn-0007O2-KP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:07:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:40562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLnsk-0002nJ-9D
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:07:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2ACACAC17;
 Mon, 15 Mar 2021 14:07:40 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <db946056-f099-ac99-38c2-60c61f079676@suse.de>
Date: Mon, 15 Mar 2021 15:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210315135410.221729-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 2:54 PM, Thomas Huth wrote:
> We are generating a lot of target-specific defines in the *-config-devices.h
> and *-config-target.h files. Using them in common code is wrong and leads
> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
> as expected. To avoid these issues, we are already poisoning some of the
> macros in include/exec/poison.h - but maintaining this list manually is
> cumbersome. Thus let's generate the list of poisoned macros automatically
> instead.
> Note that CONFIG_TCG (which is also defined in config-host.h) and
> CONFIG_USER_ONLY are special, so we have to filter these out.



I have the impression that CONFIG_USER_ONLY should be poisoned too.

A lot of the

#ifndef CONFIG_USER_ONLY

end up currently doing the wrong thing in common modules includes,
especially due to the inverted nature of the check.

So the stuff that should be "hidden" for CONFIG_USER_ONLY, is actually processed even for CONFIG_USER_ONLY in the common modules,
while in "specific" modules it isn't, which remains a potential for trouble IMO.

Ciao,

CLaudio

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  RFC since the shell stuff in "configure" is quite ugly ... maybe there's
>  a better way to do this via meson, but my meson-foo is still lacking...
> 
>  Makefile              | 2 +-
>  configure             | 5 +++++
>  include/exec/poison.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index bcbbec71a1..4cab10a2a4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -213,7 +213,7 @@ qemu-%.tar.bz2:
>  
>  distclean: clean
>  	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
> -	rm -f config-host.mak config-host.h*
> +	rm -f config-host.mak config-host.h* config-poison.h
>  	rm -f tests/tcg/config-*.mak
>  	rm -f config-all-disas.mak config.status
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
> diff --git a/configure b/configure
> index f7d022a5db..c7b5df3a5c 100755
> --- a/configure
> +++ b/configure
> @@ -6441,6 +6441,11 @@ if test -n "${deprecated_features}"; then
>      echo "  features: ${deprecated_features}"
>  fi
>  
> +cat *-config-devices.h *-config-target.h | grep '^#define '  \
> +    | grep -v CONFIG_TCG | grep -v CONFIG_USER_ONLY \
> +    | sed -e 's/#define //' -e 's/ .*//' | sort -u \
> +    | sed -e 's/^/#pragma GCC poison /' > config-poison.h
> +
>  # Save the configure command line for later reuse.
>  cat <<EOD >config.status
>  #!/bin/sh
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 4cd3f8abb4..9e55d5aec2 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -4,6 +4,8 @@
>  #ifndef HW_POISON_H
>  #define HW_POISON_H
>  
> +#include "config-poison.h"
> +
>  #pragma GCC poison TARGET_I386
>  #pragma GCC poison TARGET_X86_64
>  #pragma GCC poison TARGET_AARCH64
> 


