Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E1355CD2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:25:24 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsGI-0000je-3K
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lTs9B-0007n9-3O
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:18:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lTs95-0005sP-Qt
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:18:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 24487402A3;
 Tue,  6 Apr 2021 23:17:42 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0529521E;
 Tue,  6 Apr 2021 23:17:41 +0300 (MSK)
To: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Thomas Gleixner <tglx@linutronix.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Commit "x86/kvm: Move context tracking where it belongs" broke guest
 time accounting
Message-ID: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
Date: Tue, 6 Apr 2021 23:17:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

It looks like this commit:

commit 87fa7f3e98a1310ef1ac1900e7ee7f9610a038bc
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Wed Jul 8 21:51:54 2020 +0200

     x86/kvm: Move context tracking where it belongs

     Context tracking for KVM happens way too early in the vcpu_run()
     code. Anything after guest_enter_irqoff() and before guest_exit_irqoff()
     cannot use RCU and should also be not instrumented.

     The current way of doing this covers way too much code. Move it closer to
     the actual vmenter/exit code.

broke kvm guest cpu time accounting - after this commit, when running
qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
elsewhere) is always 0.

I dunno why it happened, but it happened, and all kernels after 5.9
are affected by this.

This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.

Thanks,

/mjt

