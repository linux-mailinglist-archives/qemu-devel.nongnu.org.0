Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533B577754
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 18:38:53 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oD7IB-0006GR-Rc
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 12:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD7H7-0004v8-6J
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:37:45 -0400
Received: from mout.gmx.net ([212.227.17.20]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oD7H5-0006TV-CL
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 12:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658075857;
 bh=ptX6pBWACF23fw3MponYxwbz9WY5j77A1DR8vMFVA9g=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:In-Reply-To;
 b=MMHBaN3zg5EyNeLC6qnqo3+2bqtUlJUC01wsK8yyZSvc/oHlEMi6drF1a07Ie8RYi
 syFHqqp/T2VqOXmAREX0cWfILQZz3WX/FZxlQx63wwnmmwhXHNOGZMK4l2ZiiBcjAw
 isTl9L2Al3h4FMD1wACVws7wYNHgpP7jlB9WRA4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.150.104]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1oIpuX3ZW9-00GpSO; Sun, 17
 Jul 2022 18:37:36 +0200
Message-ID: <ec019fe3-2804-7951-e560-525dc1e3e447@gmx.de>
Date: Sun, 17 Jul 2022 18:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS, 
 SH4 and SPARC
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <YtQzMUuBOfBiMNlY@p100>
In-Reply-To: <YtQzMUuBOfBiMNlY@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/1GlBOaas+ZUbJ13JQx3JFzdlVdaWX4jPXw3d9dO5cHfAC65uzy
 V3UZmZDu4ZhbxD/IqTqGLE3hOvXHINO4hLenBkR7QlnTuwUkhK1u0V7uuRcCAXusK+uvOIe
 gRO6Els5glAoPtCJJg/QScmZvgGv0eJc6fx75uFAsmRlkEo3ISxUOjCpnxZ5YIgmvfAXk0N
 K+evAZ1tqGvcj5JqItrNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PG760K9bQXo=:51VnrlapiNbOapzNMGH+pQ
 aD93dmil5cExbHpGPPacsuzqljb3VQlhX3b545EKyUronOiWzgS7JHrvUhQPI4rXyjIbQ11Vt
 WzjdaStLtgepe7HZD1VD1URwjM/OpNNESAiAm8TP7ijTUo2Fehbo/ZbxJCYL5L14fYkLYr2UI
 cFiPsU64iBeD93xtrEcDT7JWGtb2LpUWFEdMCAlZcAiE/hMcu950Cyraheib7w+yoNUTO0Qgu
 cETgPxFmbIdasV4CxNoGQPT3ABggY0Vrjlvm+SkBiHsovfG5svqER18XNS/U3SfOPUoky6j26
 7bKD0246HK+xD/dWkYYFHSZvSYoPDOSRlgnO9blVOV5EBw5p3cdU834OHcp1XmLkUyYj5uTpN
 hVtBLFK9k11aJHmbxr85WBydNkvJYxdwK6IFJTOmoxCyELTDqY3EZkAPaIdFZIpe5L1tt+lSQ
 rvz7nT8PppHh5CBEiRX9PqkL66LT96wQnScsV0/U1oMDwYX0S41eLbHdoSO9WTQxhdD0V/62F
 tnNxXtPlA563dmYmvT9C4URP17IHPzh/XRCmjRrL1R+I+B8/CsjsRpOoroCC+hDP3/wg5ttEv
 C+vrvesfpntOyMaL4ZXkactMaSSgQWV5ouO6Ty+yEu2pEa/KYhXv2b2Og2B4ltvDumB6QYqPs
 /O0RbrTC6R32333frxLgyvQvinqaT2z3B/RC/4qSB560avHYGiiUI24Q3ot9PiGxyoqjxl9LJ
 4rL4MunDCtemnk8FiDB2OnS+Q7fTTBm1joXqZetjXO87IsRnGiQQK5ulv2fs6QzlGrT/7J2T9
 z9ZhHf8X2rkb6KZ2HBXYwHw8n5+Cd/YAui7iZQ1OV5lBGXwdHA+uQe9Y+ERwpav0EbLoeDtJy
 a/sa8XLemVox1tCQfwQPlYS+Jvc2C87aMbej80EkzvHj2O0v91OQf8nptxbTmGqsXyEDJbCr3
 wr1ZtRujMyd8btOvEXBWRLOt2AsjVYrfNuCmrOLY8yfEr2FKxig5GkN6fj4XXiarxOmS/bhsv
 4AbIqk8RLVdZjiiTFwqNuTKA1OeU9YzmDWQULnksFyQuwUnqXy7WeYxsW3wU0cd/zRUEyn4Jv
 mVV3Su3sAQ7StRKakWf0qYiVAbWP9oWNp0plneNNiAEe44cGIK8CLCfBQ==
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/22 18:08, Helge Deller wrote:
> In 2010, the commit b41a66edd0c added a thrird parameter "is_pipe2" to t=
he
> internal do_pipe() function, but missed to actually use this parameter t=
o
> decide if the pipe() or pipe2() syscall should be used.
> Instead it just continued to check the flags parameter and used pipe2()
> unconditionally if flags is non-zero.
>
> This change should make a difference for the ALPHA, MIPS, SH4 and SPARC
> targets if the emulated code calls pipe2() with a flags value of 0.
>
> Fixes: fb41a66edd0c ("alpha-linux-user: Fix pipe return mechanism.")

Signed-off-by: Helge Deller <deller@gmx.de>

> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 991b85e6b4..1e6e814871 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1600,7 +1600,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi=
_ulong pipedes,
>  {
>      int host_pipe[2];
>      abi_long ret;
> -    ret =3D flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
> +    ret =3D is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
>
>      if (is_error(ret))
>          return get_errno(ret);


