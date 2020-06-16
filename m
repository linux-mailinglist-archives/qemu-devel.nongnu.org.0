Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B971FAE0F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 12:34:20 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl8v5-00037j-4l
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 06:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@telegraphics.com.au>)
 id 1jl8ty-0002cK-EB; Tue, 16 Jun 2020 06:33:10 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50166)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1jl8tw-0001zB-UM; Tue, 16 Jun 2020 06:33:10 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 77258274AC;
 Tue, 16 Jun 2020 06:24:42 -0400 (EDT)
Date: Tue, 16 Jun 2020 20:24:37 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 00/22] ADB: fix autopoll issues and rework mac_via state
 machine
In-Reply-To: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <alpine.LNX.2.22.394.2006162015310.11@nippy.intranet>
References: <20200614142840.10245-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=98.124.60.144;
 envelope-from=fthain@telegraphics.com.au; helo=kvm5.telegraphics.com.au
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 06:24:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Tested-by: Finn Thain <fthain@telegraphics.com.au>

Thanks for all your work on this.

I've just noticed a discrepancy between the traces from an ADB bus scan on 
Laurent's Apple Quadra and an ADB bus scan on your patched QEMU machine.

Apple Q800:

[C1f][s   ][Rff-][Rff ][rff-]
[C2f][s   ][R61 ][R05 ][r00-]
[C3f][s   ][R79 ][R01 ][r00-]
[C4f][s   ][Rff-][Rff ][rff-]
[C5f][s   ][Rff-][Rff ][rff-]
[C6f][s   ][Rff-][Rff ][rff-]
[C7f][s   ][Rff-][Rff ][rff-]
[C8f][s   ][Rff-][Rff ][rff-]
[C9f][s   ][Rff-][Rff ][rff-]
[Caf][s   ][Rff-][Rff ][rff-]
[Cbf][s   ][Rff-][Rff ][rff-]
[Ccf][s   ][Rff-][Rff ][rff-]
[Cdf][s   ][Rff-][Rff ][rff-]
[Cef][s   ][Rff-][Rff ][rff-]
[Cff][s   ][Rff-][Rff ][rff-]

QEMU Q800:

[C1f][s   ][Rff-][Rff ][rff-]
[C2f][s   ][R02 ][R01 ][r00-]
[C3f][s   ][R03 ][R02 ][r00-]
[C4f][s   ][R03-][R02 ][rff-]
[C5f][s   ][R03-][R02 ][rff-]
[C6f][s   ][R03-][R02 ][rff-]
[C7f][s   ][R03-][R02 ][rff-]
[C8f][s   ][R03-][R02 ][rff-]
[C9f][s   ][R03-][R02 ][rff-]
[Caf][s   ][R03-][R02 ][rff-]
[Cbf][s   ][R03-][R02 ][rff-]
[Ccf][s   ][R03-][R02 ][rff-]
[Cdf][s   ][R03-][R02 ][rff-]
[Cef][s   ][R03-][R02 ][rff-]
[Cff][s   ][R03-][R02 ][rff-]

I think this could be easy to fix; it's probably just an uninitialized 
packet buffer. When you come to submit v2, you may want to look into this.

