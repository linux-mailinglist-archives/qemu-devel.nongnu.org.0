Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32253625F1F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 17:09:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otWZi-0004f2-EN; Fri, 11 Nov 2022 11:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1otVac-0000V8-5c
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:05:07 -0500
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1otVaX-000274-KM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:05:05 -0500
X-QQ-mid: bizesmtp71t1668178859tewe27g0
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 11 Nov 2022 23:00:58 +0800 (CST)
X-QQ-SSF: 00200000002000807000B00A0000000
X-QQ-FEAT: ILHsT53NKPhm2w4xBYnDGTh4Z4WHAVzU5btVg2EyR+xL4ZIByL15vRuuxKR2e
 Wf9f3FGkdPxomnth2UjBCQawsBkDPQEsicL3H7+wFNH6y8xsZnC2T+QlmYPpPwmR3In/tS+
 C1CQfrxkB/eCBOFQcFvKRb51OYwV/Ap9eq3GChqUjJYcxrzOtz8S5+gLj6Z0LD9TpN41ifD
 Quqpa2Fx347gA0YCMdB8ZG6qgnC2nUTMy8WW6kDZFbObwrCK69iLOVKg1YkiFVjSL1tCuoz
 AnzNDKKfu1NMnhcrJMYiSJDZ32i01vY6lxxAtLD2YzlxW7L9pBqLBJ/E8rApCPb4nYaF5qb
 yxQ066a4kqnaugk0ZtzLMBzEundytpIMya+wDBk7hPJPUI9oD0=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: philmd@linaro.org
Cc: armbru@redhat.com, bin.meng@windriver.com, f4bug@amsat.org,
 kwolf@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 xieyongji@bytedance.com
Subject: Re: [PATCH-for-7.2 v2] libvduse: Avoid warning about dangerous use of
 strncpy()
Date: Fri, 11 Nov 2022 23:00:57 +0800
Message-Id: <20221111150057.1134462-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111124550.35753-1-philmd@linaro.org>
References: <20221111124550.35753-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 11 Nov 2022 11:08:11 -0500
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

> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> GCC 8 added a -Wstringop-truncation warning:
> 
>   The -Wstringop-truncation warning added in GCC 8.0 via r254630 for
>   bug 81117 is specifically intended to highlight likely unintended
>   uses of the strncpy function that truncate the terminating NUL
>   character from the source string.
> 
> Here the next line indeed unconditionally zeroes the last byte, but
> 1/ the buffer has been calloc'd, so we don't need to add an extra
> byte, and 2/ we called vduse_name_is_invalid() which checked the
> string length, so we can simply call strcpy().
> 
> This fixes when using gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0:
> 
>   [42/666] Compiling C object subprojects/libvduse/libvduse.a.p/libvduse.c.o
>   FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
>   cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p -Isubprojects/libvduse -I../../subprojects/libvduse [...] -o subprojects/libvduse/libvduse.a.p/libvduse.c.o -c ../../subprojects/libvduse/libvduse.c
>   In file included from /usr/include/string.h:495,
>                    from ../../subprojects/libvduse/libvduse.c:24:
>   In function ‘strncpy’,
>       inlined from ‘vduse_dev_create’ at ../../subprojects/libvduse/libvduse.c:1312:5:
>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ‘__builtin_strncpy’ specified bound 256 equals destination size [-Werror=stringop-truncation]
>     106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>   ninja: build stopped: cannot make progress due to previous errors.
> 
> Fixes: d9cf16c0be ("libvduse: Replace strcpy() with strncpy()")
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Supersedes: <20220919192306.52729-1-f4bug@amsat.org>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> ---
>  subprojects/libvduse/libvduse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Tested-by: Bin Meng <bmeng@tinylab.org>

