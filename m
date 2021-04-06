Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8F355B56
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:29:04 +0200 (CEST)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqRj-0004mB-O0
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lTqKv-0002rx-Lh; Tue, 06 Apr 2021 14:22:01 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lTqKt-0003Jg-JZ; Tue, 06 Apr 2021 14:22:01 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mi23L-1m7b0M3vur-00e3EV; Tue, 06 Apr 2021 20:21:56 +0200
Subject: Re: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-13-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ce14d154-f2b6-2f3b-1aea-9c72f9b1c945@vivier.eu>
Date: Tue, 6 Apr 2021 20:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406174031.64299-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uIN/N7/kdKMQ5cfsufW537P7vuhhmlRwNMnv2QjWe2o3G9GbW+A
 uNjpDJju1cLkdTRgfkARSC9KKCkzmyalT8NwfIYiy2dAVckSodQh3nmtgM2X4QxuvUAdEPF
 LXaaobrJnEzn+qNtT06D+YsfBbyltVuixVsVgfL+KJsn3xekHCMIu/bt+yqk/Kxdac/gKh3
 /DwzLqPL/GV2MNPXBGVxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+S9Y/tm41io=:KuAmDIW2N52Ff606g135rq
 KT08m3MUkO6IH7+I5WAwiphMl887sSiyewJUVHfPKDv8lThypVTl26YJeoLyOMR0fJ3vpIIqO
 kmL1HHJLV4LSboBcJaQJ+9fe0dDOKQ0Wlq3elBt48jZVOmh0IwXrr/+I+EohqXvBpJs9/BCx1
 rvcsMxB1FKac9WRhRCFnV8voCkaWaiUgzLwbpIfc37GRHAm9zTsqulwCIyLtsJ4F62O5HE6Vx
 ThB1TEDyd/0nTj30OoAJFS62ILWOnNJpaBA5FLcZST7w/41T6Ry5ByzSWVVM0LlViyub6lC+5
 lJ6dixkM021oJUbVH3LpYR0p54rm0ZZzxTkqP6OVosZsgcNjyBjN7t0yWOd/zSjZSVP0ubXPI
 nzfLYCk4N08GubGO3sjAgXZKTMsaaWhQuiYXCEAvWVWkHQn999lWW7L1rBhsq8UfLBVHxON00
 Fq5iUMxD6FHKaDGrRuIiOJsHIQ8CQq1/7kqyT+12NxaQbSu/o5tE
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/04/2021 à 19:40, Richard Henderson a écrit :
> Unfortuately, the elements of PAGE_* were not in numerical
> order and so PAGE_ANON was added to an "unused" bit.
> As an arbitrary choice, move PAGE_TARGET_{1,2} together.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
> Buglink: https://bugs.launchpad.net/bugs/1922617
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index d76b0b9e02..32cfb634c6 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
>  #define PAGE_RESERVED  0x0100
>  #endif
>  /* Target-specific bits that will be used via page_get_flags().  */
> -#define PAGE_TARGET_1  0x0080
> -#define PAGE_TARGET_2  0x0200
> +#define PAGE_TARGET_1  0x0200
> +#define PAGE_TARGET_2  0x0400
>  
>  #if defined(CONFIG_USER_ONLY)
>  void page_dump(FILE *f);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

