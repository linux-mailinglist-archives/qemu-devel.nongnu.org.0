Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F63F4681
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:17:06 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI58i-0006G1-Tj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mI56k-0004dO-Vm
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:15:03 -0400
Received: from relay68.bu.edu ([128.197.228.73]:42451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mI56j-0003tA-5K
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:15:02 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17N8E37N007446
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 23 Aug 2021 04:14:11 -0400
Date: Mon, 23 Aug 2021 04:14:03 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: QEMU / QEMU <incoming+76b541d3da83db84dd2a5b0ba3bba9ff@incoming.gitlab.com>
Subject: Re: QEMU | Heap-use-after-free through ehci_flush_qh (#541)
Message-ID: <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
References: <reply-76b541d3da83db84dd2a5b0ba3bba9ff@gitlab.com>
 <issue_92358130@gitlab.com> <note_656820217@gitlab.com>
 <note_657261050@gitlab.com> <note_657305687@gitlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <note_657305687@gitlab.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.833,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure I understand. We try to avoid writing to MMIO regions in
fuzz_dma_read_cb to avoid such false-positives. E.g. that's why we have
code to do address_space_translate and manually walk the AddressSpace
and verify that we are writing to RAM, before doing the actual
qtest_memwrite. There is a fix to that code that need to be applied, but
those have to wait for the 6.1 release. BTW, since this is about the
generic-fuzzer rather than this bug, I cc-ed qemu-devel. Let's continue
the discussion there.

-Alex

On 210823 0132, 李秋豪 (@QiuhaoLi) wrote:
> 
> 
> 
> 李秋豪 commented on a discussion: https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> 
> Ok, I add a reply to my report about #540 and #541.
> 
> Btw, it suddenly occurred to me that our generic-fuzzer can also make reentry issues. For example, a device tries to read from a mmio region while being fuzzed, but the fuzz_dma_read_cb() will write to that region, thus leading to positive-false reentry issues. In short, we change a read action to write. Should we add checks?
> 
> -- 
> Reply to this email directly or view it on GitLab: https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> You're receiving this email because of your account on gitlab.com.
> 
> 

