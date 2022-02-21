Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEDB4BEBF2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 21:37:54 +0100 (CET)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMFRR-0002OL-C3
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 15:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMFOY-0001J8-Sp; Mon, 21 Feb 2022 15:34:54 -0500
Received: from [187.72.171.209] (port=8964 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMFOX-0005OU-5h; Mon, 21 Feb 2022 15:34:54 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 21 Feb 2022 17:34:48 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A941180009B;
 Mon, 21 Feb 2022 17:34:47 -0300 (-03)
Message-ID: <3a5ae757-a461-139f-55da-c5369f1d5d8b@eldorado.org.br>
Date: Mon, 21 Feb 2022 17:34:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/3] linux-user/ppc: Deliver SIGTRAP on tw[i]/td[i]
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220113170456.1796911-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 21 Feb 2022 20:34:48.0321 (UTC)
 FILETIME=[78221F10:01D82762]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, laurent@vivier.eu,
 groug@kaod.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

All patches reviewed and the series still applies to master with no 
conflicts.

On 13/01/2022 14:04, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> In the review of 66c6b40aba1, Richard Henderson suggested[1] using
> "trap" instead of ".long 0x0" to generate the signal to test XER
> save/restore behavior. However, linux-user aborts when a trap
> exception is raised, so we kept the patch with SIGILL.
> 
> This patch series is a follow-up to remove the cpu_abort call, deliver
> SIGTRAP instead (using TRAP_BRKPT as si_code), and apply the suggestion
> to the signal_save_restore_xer test.
> 
> The first patch removes the "qemu: fatal: Tried to call a TRAP" reported
> in issue #588[2]. The third patch is an RFC to address the other logged
> messages of "Unknown privilege violation (03)".
> 
> [1] https://lists.gnu.org/archive/html/qemu-ppc/2021-10/msg00143.html
> [2] https://gitlab.com/qemu-project/qemu/-/issues/588
> 
> v3:
>   - RFC to address the "Unknown privilege violation (03)" in #588.
> 
> v2:
>   - Based-on rth's patch to use force_sig_fault and avoid merge conflicts
> 
> Matheus Ferst (3):
>    linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
>    tests/tcg/ppc64le: change signal_save_restore_xer to use SIGTRAP
>    target/ppc: Fix gen_priv_exception error value in mfspr/mtspr
> 
>   linux-user/ppc/cpu_loop.c                   | 3 ++-
>   target/ppc/translate.c                      | 8 ++++----
>   tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
>   3 files changed, 10 insertions(+), 9 deletions(-)
>

