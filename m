Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921945CECB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 22:14:24 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpzaw-0002fN-45
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 16:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mpzYw-0001n3-4i; Wed, 24 Nov 2021 16:12:18 -0500
Received: from [201.28.113.2] (port=16358 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mpzYu-0006AN-A4; Wed, 24 Nov 2021 16:12:17 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 24 Nov 2021 18:12:12 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id DBFFC800A92;
 Wed, 24 Nov 2021 18:12:11 -0300 (-03)
Subject: Re: [PATCH] target/ppc: fix Hash64 MMU update of PTE bit R
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20211124120046.6831-1-leandro.lupori@eldorado.org.br>
 <00546896-2466-007f-b73c-fe4f889fac2f@gmail.com>
 <1dae4d80-6b0b-5542-b783-7a3bb434bc16@kaod.org>
 <CP2PR80MB35865D04C82D81F7BCBA351CC6619@CP2PR80MB3586.lamprd80.prod.outlook.com>
 <b97bdc40-a220-bf66-0b0e-febc26da763a@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Message-ID: <bb6f04eb-8243-3532-ef18-842661408c7e@eldorado.org.br>
Date: Wed, 24 Nov 2021 18:12:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b97bdc40-a220-bf66-0b0e-febc26da763a@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Nov 2021 21:12:12.0115 (UTC)
 FILETIME=[F2C62A30:01D7E177]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "groug@kaod.org" <groug@kaod.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/2021 16:52, Cédric Le Goater wrote:
>> It can be reproduced by trying to boot this iso: 
>> https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/FreeBSD-14.0-CURRENT-powerpc-powerpc64-20211028-4827bf76bce-250301-disc1.iso.xz 
>>
>>
>> It is easier to reproduce it using power8/powernv8.
> 
> power8 only has Hash MMU. I understand that FreeBSD also supports power9
> processor. with radix ? and XIVE ?
> 

Right, FreeBSD supports POWER9 with Radix, that is now the default MMU 
choice. To select Hash MMU, you need to pass radix_mmu=0 to kernel 
command line.
FreeBSD supports XIVE too, but only for PowerNV.

BTW, when trying to boot with Radix instead of Hash, a different issue 
happens. Boot goes further, but then programs start to get SIGILL or 
SIGSEGV.

> Thanks,
> 
> C.

Thanks,
Leandro

