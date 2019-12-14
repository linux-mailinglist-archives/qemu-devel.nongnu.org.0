Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE111F00F
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 03:53:18 +0100 (CET)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifxYT-0002DI-Q8
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 21:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifxXm-0001ny-BS
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 21:52:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifxXl-0002Kz-0x
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 21:52:34 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:48090)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ifxXk-0002Gp-RZ; Fri, 13 Dec 2019 21:52:32 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 171E722C0A;
 Fri, 13 Dec 2019 21:52:29 -0500 (EST)
Date: Sat, 14 Dec 2019 13:52:33 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
In-Reply-To: <157628778601.20418.17236421597625110152@37313f22b938>
Message-ID: <alpine.LNX.2.21.1.1912141345460.18@nippy.intranet>
References: <157628778601.20418.17236421597625110152@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: jasowang@redhat.com, qemu-stable@nongnu.org, hpoussin@reactos.org,
 aleksandar.rikalo@rt-rk.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Dec 2019, no-reply@patchew.org wrote:

> === OUTPUT BEGIN ===
> 1/10 Checking commit 9c9ffc38e9b9 (dp8393x: Mask EOL bit from descriptor addresses)
> ERROR: return is not a function, parentheses are not required
> #24: FILE: hw/net/dp8393x.c:200:
> +    return (s->regs[SONIC_URDA] << 16) | (s->regs[SONIC_CRDA] & 0xfffe);
> 
> ERROR: return is not a function, parentheses are not required
> #33: FILE: hw/net/dp8393x.c:220:
> +    return (s->regs[SONIC_UTDA] << 16) | (s->regs[SONIC_TTDA] & 0xfffe);
> 

I expect that checkpatch.pl has no idea about operator precedence, but 
these parentheses could actually be omitted.

I kept them because I don't want readers to have to remember that bit 
shift operator has higher precedence than bitwise OR operator, or look it 
up if they don't.

The existing code also has those unnecessary parentheses.

Please let me know if this patch should include a code style change.

