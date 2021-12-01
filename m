Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA600464934
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 08:54:57 +0100 (CET)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msKS8-0005cq-Rp
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 02:54:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msKP4-0001wV-Sm
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:51:47 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:34827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msKP1-0004hB-CY
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 02:51:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.179])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6DBDA21980;
 Wed,  1 Dec 2021 07:51:40 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 08:51:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005935b0765-bbe4-49fd-9992-4bc50498bf4f,
 A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <11ff4352-c0db-70aa-9bc2-d2ab7ca6f45f@kaod.org>
Date: Wed, 1 Dec 2021 08:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
 <YaVwvAyhyhlIYhV5@yekko> <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
 <59d0ebbd-d20c-9c9d-56f8-852adfb2af53@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <59d0ebbd-d20c-9c9d-56f8-852adfb2af53@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 54551055-d080-4b8a-9a56-b489942cb925
X-Ovh-Tracer-Id: 2993767855596407657
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedvgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdevgfdvjeeiieeggedtheefvdetvdelfedtkeehhfekuefggfffvddtjeeggeeinecuffhomhgrihhnpehfrhgvvggsshgurdhorhhgpdhgihhthhhusgdrtghomhdpshhtrghrthdqqhgvmhhurdhshhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 11/30/21 21:00, Leandro Lupori wrote:
> On 30/11/2021 05:44, Cédric Le Goater wrote:
>> It would be interesting to boot directly the PowerNV machine from a
>> FreeBSB kernel and a minimum inirtd without using the skiroot images
>> and an iso. Are images available ?
> 
> AFAIK there are no minimum initrd images available. The closest thing would be the "bootonly" ISOs that can be found in the links below:
> 
> https://download.freebsd.org/ftp/releases/powerpc/powerpc64/ISO-IMAGES/13.0/
> 
> https://download.freebsd.org/ftp/releases/powerpc/powerpc64le/ISO-IMAGES/13.0/
> 
> https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64/ISO-IMAGES/14.0/
> 
> https://download.freebsd.org/ftp/snapshots/powerpc/powerpc64le/ISO-IMAGES/14.0/
> 
> 
> But to avoid using skiroot, you would need to manually extract the kernel from the ISO and also specify the rootfs, using something like: "-append cd9660:cd0".
> If you don't want to emulate a disk or cd, the ISO can be passed to -initrd and "-append cd9660:md0" may be used to tell FreeBSD where to find the root partition (it loads it as a memory disk).

The ISO is too big for quick tests. Isn't there a minimum initrd ? can we build a
builroot-like image for FreeBSD ?

> 
> There are also qcow2 snapshots available:
> 
> https://artifact.ci.freebsd.org/snapshot/14.0-CURRENT/latest/powerpc/powerpc64/
> 
> https://artifact.ci.freebsd.org/snapshot/14.0-CURRENT/latest/powerpc/powerpc64le/
> 
> But you'll also need to extract the kernel from the image or from kernel.txz to boot them.

ok. I will take a look.

> As these images target pseries and lack a FAT32 partition, Petitboot won't be able to boot them.

The idea would be to skip petitboot and load directly the FreeBSD kernel from skiboot
with a minimum initrd or disk image. See :

   https://github.com/legoater/qemu-ppc-boot/blob/main/buildroot/qemu_ppc64le_powernv-2021.11-rc1-199-g927444a04e-20211120/start-qemu.sh

or

   https://github.com/legoater/qemu-ppc-boot/blob/main/buildroot/qemu_ppc64le_pseries-2021.11-rc1-199-g927444a04e-20211120/start-qemu.sh

Thanks,

C.

> 
> Alfredo (cc'ed) was trying to make them Petitboot compatible.
> 


