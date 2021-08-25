Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3C3F7579
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:57:35 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsTG-0000HQ-Ka
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsRy-000737-Mj; Wed, 25 Aug 2021 08:56:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46650
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsRw-0007yU-Vb; Wed, 25 Aug 2021 08:56:14 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIsRP-0009bN-5x; Wed, 25 Aug 2021 13:55:44 +0100
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1f5fe437-4839-c225-0859-91ccfa7532af@ilande.co.uk>
Date: Wed, 25 Aug 2021 13:55:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.24,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2021 21:11, matheus.ferst@eldorado.org.br wrote:

> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The definition of struct Int128 is currently independent of the host
> endianness, causing different results when using the member s128 of
> union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
> !CONFIG_INT128.
> 
> The only PPC instructions that seem to be affected by this issue are the
> "Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
> Left/Right-Index." Even on builds with Int128 support, however, their
> helpers give the wrong result on big-endian hosts.
> 
> The first patch in this series changes the definition of struct Int128
> to allow its use in the ppc_vsr_t union. The second patch fixes the
> helper definition.
> 
> Matheus Ferst (2):
>    include/qemu/int128.h: define struct Int128 according to the host
>      endianness
>    target/ppc: fix vextu[bhw][lr]x helpers
> 
>   include/qemu/int128.h   | 19 ++++++++++++-------
>   target/ppc/int_helper.c | 38 ++++++++++----------------------------
>   2 files changed, 22 insertions(+), 35 deletions(-)

Hi Matheus,

Slightly unrelated to this patchset, however I see you've managed to make some good 
efforts in consolidating the functionality between big-endian and little-endian host 
systems.

When I first worked on adding host vector support for PPC I noticed there were some 
further places in target/ppc/int_helper.c that could be improved from accessing 
ppc_avr_t fields such as u64 directly and instead using the relevant Vsr*() macros.

If you feel suitably motivated, it would be amazing to see more patches to help this 
further along: basically look in target/ppc/int_helper.c for individual elements such 
as u64 (and also the VECTOR_FOR_INORDER_I macro) and determine which ones are better 
replaced by the relevant Vsr*() macro.


ATB,

Mark.

