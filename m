Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A618464E2F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 13:48:19 +0100 (CET)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msP1z-0006uW-Uh
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 07:48:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1msOrL-0001HF-PH; Wed, 01 Dec 2021 07:37:17 -0500
Received: from [201.28.113.2] (port=55116 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1msOrK-0006jX-Ev; Wed, 01 Dec 2021 07:37:15 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 1 Dec 2021 09:37:10 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id 86CB0800CFF;
 Wed,  1 Dec 2021 09:37:10 -0300 (-03)
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
 <YaVwvAyhyhlIYhV5@yekko> <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
 <59d0ebbd-d20c-9c9d-56f8-852adfb2af53@eldorado.org.br>
 <11ff4352-c0db-70aa-9bc2-d2ab7ca6f45f@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Message-ID: <140661ab-4c92-f0b8-2bb0-d402233984bb@eldorado.org.br>
Date: Wed, 1 Dec 2021 09:37:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <11ff4352-c0db-70aa-9bc2-d2ab7ca6f45f@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Dec 2021 12:37:10.0888 (UTC)
 FILETIME=[29195E80:01D7E6B0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alfredo.junior@eldorado.org.br,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/2021 04:51, Cédric Le Goater wrote:
> The ISO is too big for quick tests. Isn't there a minimum initrd ? can 
> we build a
> builroot-like image for FreeBSD ?
> 

FreeBSD doesn't use initrd. Its bootloader loads kernel modules directly 
from disk (unfortunately, it doesn't work on PowerNV).

But it's possible to build a minimum disk image and make FreeBSD load it 
as a ramdisk, by passing it through QEMU's -initrd (even though it's not 
an initrd). By default FreeBSD builds a program called rescue, that is 
similar to busybox, that would help when building a minimum image.

