Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4550BF61
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:18:47 +0200 (CEST)
Received: from localhost ([::1]:42162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxri-0006Hz-U0
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nhxNJ-0004fp-GS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:47:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nhxNG-0006vD-VO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:47:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id ED9BA406C6;
 Fri, 22 Apr 2022 20:47:17 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E389D35C;
 Fri, 22 Apr 2022 20:42:02 +0300 (MSK)
Message-ID: <4c1c558a-5e71-b15c-4927-04d0ad68432d@msgid.tls.msk.ru>
Date: Fri, 22 Apr 2022 20:47:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: target/i386/kvm/kvm.c:2996: kvm_buf_set_msrs: Assertion `ret ==
 cpu->kvm_msr_buf->nmsrs' failed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Apparently there's an assertion failure like in $subj in qemu-7.0.0
(it didn't happen with qemu-6.2), even after the commit:

commit e910a53fb4f20aa012e46371ffb4c32c8da259b4
Author: Maxim Levitsky <mlevitsk@redhat.com>
Date:   Wed Feb 23 13:56:49 2022 +0200

     KVM: x86: nSVM: disallow userspace setting of MSR_AMD64_TSC_RATIO to non default value when tsc scaling disabled

is included in the kernel build.

The original debian bugreport: https://bugs.debian.org/1010026

The logs from libvirt with 2 kernels which have the said commit
included: (based on 5.16.18 and 5.17.3 - unfortunately the kernel
release reported there is difficult):
  https://bugs.debian.org/1010026#42

Both ends up with

qemu-system-x86_64: error: failed to set MSR 0xc0000104 to 0x100000000
qemu-system-x86_64: ../../target/i386/kvm/kvm.c:2996: kvm_buf_set_msrs:
  Assertion `ret == cpu->kvm_msr_buf->nmsrs' failed.

I wonder if there's something else needs to be fixed..

BTW, commit e910a53fb4f20aa012e46 included a bugfix for qemu 6.2, -
maybe we should not accumulate fixes for other software bugs in
kernel?  That's just a thought, nothing more..

Thanks!

/mjt

