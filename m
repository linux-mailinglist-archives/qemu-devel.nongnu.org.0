Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7691F43C9CE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 14:37:31 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfiBO-0006HZ-I1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 08:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfhQx-0005Wh-Lk; Wed, 27 Oct 2021 07:49:31 -0400
Received: from [201.28.113.2] (port=30515 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mfhQv-0000H8-VC; Wed, 27 Oct 2021 07:49:31 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 27 Oct 2021 08:49:27 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 77EDD80045D;
 Wed, 27 Oct 2021 08:49:27 -0300 (-03)
Subject: Re: [PATCH 0/2] Fix mtfsf, mtfsfi and mtfsb1 bug
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <923736b0-edcf-ab4b-b16f-a6e43017a931@eldorado.org.br>
Date: Wed, 27 Oct 2021 08:49:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 27 Oct 2021 11:49:27.0940 (UTC)
 FILETIME=[B230EC40:01D7CB28]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, pc@us.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing the reporter

On 20/10/2021 09:57, Lucas Mateus Castro (alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
> 
> The instructions mtfsf, mtfsfi and mtfsb, when called, fail to set the FI
> bit (bit 46 in the FPSCR) and can set to 1 the reserved bit 52 of the
> FPSCR, as reported in https://gitlab.com/qemu-project/qemu/-/issues/266
> (although the bug report is only for mtfsf, the bug applies to mtfsfi and
> mtfsb1 as well).
> 
> These instructions also fail to throw an exception when the exception
> and enabling bits are set, this can be tested by adding
> 'prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);' before the __builtin_mtfsf
> call in the test case of the bug report.
> 
> These patches aim to fix these issues.
> 
> Lucas Mateus Castro (alqotel) (2):
>    target/ppc: Fixed call to deferred exception
>    target/ppc: ppc_store_fpscr doesn't update bit 52
> 
>   target/ppc/cpu.c                   |  2 +-
>   target/ppc/cpu.h                   |  3 +++
>   target/ppc/fpu_helper.c            | 41 ++++++++++++++++++++++++++++++
>   target/ppc/helper.h                |  1 +
>   target/ppc/translate/fp-impl.c.inc |  6 ++---
>   5 files changed, 49 insertions(+), 4 deletions(-)
> 
> --
> 2.31.1
> 
> 
-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

