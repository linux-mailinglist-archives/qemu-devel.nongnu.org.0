Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1B463EFE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 21:04:12 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms9MJ-0006Wz-6U
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 15:04:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ms9Iu-00054C-MU; Tue, 30 Nov 2021 15:00:40 -0500
Received: from [201.28.113.2] (port=13820 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ms9Ir-0001g3-KG; Tue, 30 Nov 2021 15:00:40 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 30 Nov 2021 17:00:32 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id 5EAD7800A6B;
 Tue, 30 Nov 2021 17:00:32 -0300 (-03)
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
 <YaVwvAyhyhlIYhV5@yekko> <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Message-ID: <59d0ebbd-d20c-9c9d-56f8-852adfb2af53@eldorado.org.br>
Date: Tue, 30 Nov 2021 17:00:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Nov 2021 20:00:32.0660 (UTC)
 FILETIME=[EE93E540:01D7E624]
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
Cc: alfredo.junior@eldorado.org.br, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/2021 05:44, Cédric Le Goater wrote:
> It would be interesting to boot directly the PowerNV machine from a
> FreeBSB kernel and a minimum inirtd without using the skiroot images
> and an iso. Are images available ?

AFAIK there are no minimum initrd images available. The closest thing 
would be the "bootonly" ISOs that can be found in the links below:

https://download.freebsd.org/ftp/releases/powerpc/powerpc64/ISO-IMAGES/13.0/

https://download.freebsd.org/ftp/releases/powerpc/powerpc64le/ISO-IMAGES/13.0/

https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/

https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64le/ISO-IMAGES/14.0/


But to avoid using skiroot, you would need to manually extract the 
kernel from the ISO and also specify the rootfs, using something like: 
"-append cd9660:cd0".
If you don't want to emulate a disk or cd, the ISO can be passed to 
-initrd and "-append cd9660:md0" may be used to tell FreeBSD where to 
find the root partition (it loads it as a memory disk).

There are also qcow2 snapshots available:

https://artifact.ci.freebsd.org/snapshot/14.0-CURRENT/latest/powerpc/powerpc64/

https://artifact.ci.freebsd.org/snapshot/14.0-CURRENT/latest/powerpc/powerpc64le/

But you'll also need to extract the kernel from the image or from 
kernel.txz to boot them.
As these images target pseries and lack a FAT32 partition, Petitboot 
won't be able to boot them.

Alfredo (cc'ed) was trying to make them Petitboot compatible.

