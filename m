Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DE02D7694
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:31:23 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniW2-0000l4-1b
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kniTQ-0008H2-SZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:28:40 -0500
Received: from mx2.suse.de ([195.135.220.15]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kniTP-0005xA-5J
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:28:40 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D91D9AC10;
 Fri, 11 Dec 2020 13:28:33 +0000 (UTC)
Subject: Re: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201211131346.473882-1-philmd@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d15617d9-4892-b349-2e22-8f6bb7c4a715@suse.de>
Date: Fri, 11 Dec 2020 14:28:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201211131346.473882-1-philmd@redhat.com>
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:13 PM, Philippe Mathieu-Daudé wrote:
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >= 4.8.
> 
> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
> __builtin_expect too)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> [PMD: #error if likely/unlikely already defined]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c76281f3540..ae1aee79c8d 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -43,14 +43,11 @@
>  #define tostring(s)	#s
>  #endif
>  
> -#ifndef likely
> -#if __GNUC__ < 3
> -#define __builtin_expect(x, n) (x)
> +#if defined(likely) || defined(unlikely)
> +#error building with likely/unlikely is not supported

I'd put the argument of #error as a single string constant delimited by quotes ",
doesn't matter in this case though as there are no problem characters in the string.

>  #endif
> -
>  #define likely(x)   __builtin_expect(!!(x), 1)
>  #define unlikely(x)   __builtin_expect(!!(x), 0)
> -#endif
>  
>  #ifndef container_of
>  #define container_of(ptr, type, member) ({                      \
> 

Reviewed-by: Claudio Fontana <cfontana@suse.de>

