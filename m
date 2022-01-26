Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B950749D179
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:12:02 +0100 (CET)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmm1-0002aH-Po
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:12:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCm6u-0000A3-Ss; Wed, 26 Jan 2022 12:29:34 -0500
Received: from [187.72.171.209] (port=41887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCm6t-00045I-0c; Wed, 26 Jan 2022 12:29:32 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 26 Jan 2022 14:28:22 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2DE25800031;
 Wed, 26 Jan 2022 14:28:22 -0300 (-03)
Message-ID: <582d8d5f-d46f-daba-5911-96b0a8f78bf4@eldorado.org.br>
Date: Wed, 26 Jan 2022 14:28:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ppc/pnv: initialize 'taddr' in
 pnv_phb3_translate_tve()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220126134137.791968-1-danielhb413@gmail.com>
 <20220126134137.791968-2-danielhb413@gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220126134137.791968-2-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 26 Jan 2022 17:28:22.0625 (UTC)
 FILETIME=[1E32DD10:01D812DA]
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

On 26/01/2022 10:41, Daniel Henrique Barboza wrote:
> The 'taddr' variable is left unintialized, being set only inside the
> "while ((lev--) >= 0)" loop where we get the TCE address. The 'lev' var
> is an int32_t that is being initiliazed by the GETFIELD() macro, which
> returns an uint64_t.
> 
> For a human reader this means that 'lev' will always be positive or zero.
> But some compilers may beg to differ. 'lev' being an int32_t can in theory
> be set as negative, and the "while ((lev--) >= 0)" loop might never be
> reached, and 'taddr' will be left unitialized.

If we expect this code to execute at least once, wouldn't it be better 
to use a do-while? E.g.:

do {
     lev--;

     /* Grab the TCE address */
     taddr = base | (((addr >> sh) & ((1ul << tbl_shift) - 1)) << 3);
     if (dma_memory_read(&address_space_memory, taddr, &tce,
     /* ... */
     }
     sh -= tbl_shift;
     base = tce & ~0xfffull;
} while (lev >= 0);

Otherwise, I think we'll need to initialize tce too.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

