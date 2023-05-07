Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7C6F9AC5
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 19:58:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvich-00068h-Ep; Sun, 07 May 2023 13:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pvicf-00068Z-CY
 for qemu-devel@nongnu.org; Sun, 07 May 2023 13:56:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pvicd-0003Aw-NF
 for qemu-devel@nongnu.org; Sun, 07 May 2023 13:56:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E8250400F1;
 Sun,  7 May 2023 20:56:24 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8BA066D;
 Sun,  7 May 2023 20:56:23 +0300 (MSK)
Message-ID: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
Date: Sun, 7 May 2023 20:56:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.a@redhat.com>, Markus Armbruster <armbru@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: missing boot rom: is it really a fatal error?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi!

In old good world ;), there was qemu which didn't require boot roms to be present
for all devices for which bootrom file is defined, missing rom was just a warning.
But this changed in 2014, 9 years ago, with this commit:

commit 178e785fb4507ec3462dc772bbe08303416ece47
From: Marcel Apfelbaum <marcel.a@redhat.com>
Date: Mon, 27 Oct 2014 19:34:41 +0200
Subject: [PATCH] hw/pci: fixed error flow in pci_qdev_init

   Verify return code for pci_add_option_rom.

where inability to load rom file started being treated as an error.
Up until now I didn't even know about this change, until today when someone bugged
me about non-working qemu on debian, due to missing network boot roms (this a
packaging issue due to me being unaware of the above change).

What is the reason to require boot roms to be present and throw an error if not?

I'm about to revert that old change on debian, to make it just a warning instead
of an error (the code is different now, but the same principle applies), - because
I dislike dependencies which are useless 99.9% of the time and are trivial to
install when actually needed.

Thanks,

/mjt

