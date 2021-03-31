Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6834F82E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 06:59:15 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRSwj-0002e1-Ku
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 00:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mpe@ellerman.id.au>)
 id 1lRSvs-00028v-Mi; Wed, 31 Mar 2021 00:58:21 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mpe@ellerman.id.au>)
 id 1lRSvp-0006a0-V5; Wed, 31 Mar 2021 00:58:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9DbH4cWMz9sWK;
 Wed, 31 Mar 2021 15:58:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617166685;
 bh=rNPeANeJb0IEtwHXdF9sChKGAGD6QUedZ3TobGs/FM4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FyQ5LkPaOgxj1LwhFBphElivqB2Ss/vC+7pes7mZxB8LA+wPisdbL223ugv2ALdaX
 MusLl+14Md130ajqpxRCmceRfe76U4Z9x7qzWOrUa//drPZXf5lW38ubLeeAEVYm/j
 zKY8tQ13d/TZD5qEdnulFq6sM+LNpP8cPgRPNhxL/8HzC8EGhP5gh9tQLE3STdasDz
 KJl7XAQT55wWPWydsNeO4Odkjf2aMQF7PnhsbBnR7acvz9khIVWY1CpqBlI+WT8Jl/
 ncJ88OzQEFTnF0VUpYtBynuLyfv9F8kVttX+JSB0SlVyEW6meq2xNNAykusM06w41D
 nR56Nx2UqYnKA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: David Gibson <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
In-Reply-To: <YGPI5vgoI8JDO1HN@yekko.fritz.box>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
 <YGPI5vgoI8JDO1HN@yekko.fritz.box>
Date: Wed, 31 Mar 2021 15:58:03 +1100
Message-ID: <87blazyl5w.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=mpe@ellerman.id.au;
 helo=ozlabs.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:
> On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrote:
...
>
>> We assign ibm,chip-id=0x0 to CPUs 0-3, but CPUs 2-3 are located in a
>> different NUMA node than 0-1. This would mean that the same socket
>> would belong to different NUMA nodes at the same time.
>
> Right... and I'm still not seeing why that's a problem.  AFAICT that's
> a possible, if unexpected, situation under real hardware - though
> maybe not for POWER9 specifically.

I think I agree.

>> I believe this is what Cedric wants to be addressed. Given that the
>> property is called after the OPAL property ibm,chip-id, the kernel
>> expects that the property will have the same semantics as in OPAL.
>
> Even on powernv, I'm not clear why chip-id is tied into the NUMA
> configuration, rather than getting all the NUMA info from
> associativity properties.

AFAIK we don't use chip-id for anything related to NUMA, if we do I'd
consider that a bug.

We do use it for topology_physical_package_id(), but that's almost
completely unused.

cheers

