Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F437438C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:35:43 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLR0-0000KH-3H
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leLME-00072e-Ii; Wed, 05 May 2021 13:30:47 -0400
Received: from [201.28.113.2] (port=64330 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leLM9-0007Cw-6d; Wed, 05 May 2021 13:30:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 5 May 2021 14:30:35 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 6E8F18013C2;
 Wed,  5 May 2021 14:30:35 -0300 (-03)
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Moved functions out of mmu-hash64
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
 <YI97GykbXX5u428t@yekko>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <6c67c7fb-a825-a469-a0dd-30c3c76c6472@eldorado.org.br>
Date: Wed, 5 May 2021 14:30:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YI97GykbXX5u428t@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OriginalArrivalTime: 05 May 2021 17:30:35.0739 (UTC)
 FILETIME=[5BA8F2B0:01D741D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 03/05/2021 01:24, David Gibson wrote:
> On Fri, Apr 30, 2021 at 03:40:46PM -0300, Lucas Mateus Castro (alqotel) wrote:
>> The functions ppc_store_lpcr, ppc_hash64_filter_pagesizes and
>> ppc_hash64_unmap_hptes have been moved to mmu-misc.h since they are
>> not needed in a !TCG context and mmu-hash64 should not be compiled
>> in such situation.
>>
>> ppc_store_lpcr and ppc_hash64_filter_pagesizes are used by multiple
>> functions, while ppc_hash64_unmap_hptes is used by rehash_hpt (in
>> spapr_hcall.c).
> Hmm.. looking at it, ppc_store_lpcr() (and helper_store_lpcr()) don't
> really belong in this file at all.  The LPCR has some things related
> to the hash MMU, but plenty of others that don't.  So, maybe
> misc_helper.c?  That might have to be moved again, since misc_helper
> itself should probably mostly not be used for !TCG.  But.. one thing
> at a time.

I tested here and compiling misc_helper.c with disable-tcg it's kind of

complicated and it would require many changes in it, so for this patch

just move it there and deal with it in a later patch?

> AFAICT the only user of ppc_hash64_filter_pagesizes() is in
> spapr_caps.c.  For now you can just move it next to the caller, it's
> debatable whether it belongs more to PAPR or MMU code.

Also I'm assuming the prototype should also be moved from

"target/ppc/mmu-hash64.h" to "include/hw/ppc/spapr.h" (or some other

spapr_*.h file), or should it be left in the original file?

> ppc_hash64_unmap_hptes() is definitely TCG only and should stay where
> it is.  The call from rehash_hpt() can be solved because rehash_hpt()
> itself is TCG only.  I've already suggested splitting the TCG (well,
> softmmu) only things out from spapr_hcall.c, so it might simplify
> things to tackle that first.
>


