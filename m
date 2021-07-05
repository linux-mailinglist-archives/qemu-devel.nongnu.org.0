Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BC83BC32C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:34:56 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0UMo-0008Od-Ul
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0ULk-0007j3-Bu
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:33:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43202
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0ULh-0004Jf-8l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:33:48 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0ULL-0000zK-3L; Mon, 05 Jul 2021 20:33:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Finn Thain <fthain@linux-m68k.org>
References: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
 <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
 <cf9f6c26-473a-20ed-bf0d-bac63114c60f@ilande.co.uk>
Message-ID: <6f2a138a-aed4-530d-be6b-9ad1ad01c00b@ilande.co.uk>
Date: Mon, 5 Jul 2021 20:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cf9f6c26-473a-20ed-bf0d-bac63114c60f@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] dp8393x: don't force 32-bit register access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2021 08:52, Mark Cave-Ayland wrote:

> I think the problem is because of the interaction of .impl.max_access_size = 2 and 
> the it_shift property specifying a stride of 4 bytes: when the 4 byte access is split 
> into 2 x 2 byte accesses then for a read reg = addr >> s->it_shift causes the second 
> access to be a duplicate of the first rather than containing zeros.

After some more experiments I'm fairly confident this is the issue: if you rely on 
applying it_shift within the MMIO access itself then you lose the zero extension of 
the result to the access size as done by the memory API.

I'll come up with a new version which I shall send as part of an updated and tested 
v2 of Phil's housekeeping patchset, since the endian changes were really helpful when 
studying the descriptors.


ATB,

Mark.

