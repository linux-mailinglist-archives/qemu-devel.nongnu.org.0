Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240FB49E35B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:25:25 +0100 (CET)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4mB-0000LS-Hh
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nD3yH-0003gH-4x; Thu, 27 Jan 2022 07:33:49 -0500
Received: from [187.72.171.209] (port=40813 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nD3yF-0002pp-HN; Thu, 27 Jan 2022 07:33:48 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 27 Jan 2022 09:33:46 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B6E97800013;
 Thu, 27 Jan 2022 09:33:45 -0300 (-03)
Message-ID: <ee43938b-f4f6-9943-1696-1f9cf15c7ab3@eldorado.org.br>
Date: Thu, 27 Jan 2022 09:33:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] ppc/pnv: use a do-while() loop in
 pnv_phb3_translate_tve()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220127122234.842145-1-danielhb413@gmail.com>
 <20220127122234.842145-2-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220127122234.842145-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 27 Jan 2022 12:33:46.0080 (UTC)
 FILETIME=[2091E600:01D8137A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2022 09:22, Daniel Henrique Barboza wrote:
> The 'taddr' variable is left unintialized, being set only inside the
> "while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
> is an int32_t that is being initiliazed by the GETFIELD() macro, which
> returns an uint64_t.
> 
> For a human reader this means that 'lev' will always be positive or zero.
> But some compilers may beg to differ. 'lev' being an int32_t can in theory
> be set as negative, and the "while ((lev--) >= 0)" loop might never be
> reached, and 'taddr' will be left unitialized. This can cause phb3_error()
> to use 'taddr' uninitialized down below:
> 
> if ((is_write & !(tce & 2)) || ((!is_write) && !(tce & 1))) {
>      phb3_error(phb, "TCE access fault at 0x%"PRIx64, taddr);
> 
> A quick way of fixing it is to use a do/while() loop. This will keep the
> same semanting as the existing while() loop does and the compiler will
> understand that 'taddr' will be initialized at least once.
> 
> Suggested-by: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/573
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb3.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

