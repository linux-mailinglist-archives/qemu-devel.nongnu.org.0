Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E233068D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:53:19 +0100 (CET)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6xK-0000cU-Hd
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJ6wR-0008Tu-DI
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:52:24 -0500
Received: from relay68.bu.edu ([128.197.228.73]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJ6wM-0006XM-UT
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:52:20 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1283q0MW026652
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 7 Mar 2021 22:52:03 -0500
Date: Sun, 7 Mar 2021 22:52:00 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Yan Zhiqiang <yanz3q@gmail.com>
Subject: Re: About libfuzzer in qemu
Message-ID: <20210308035200.averk4yfddkqttyf@mozz.bu.edu>
References: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
 <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
 <CAB7jVHECxxStzzV+5=7w_4QPwMxLRG5HE1Un97fCoxi72_MUBA@mail.gmail.com>
 <20210306051010.rfg3ox2yo3hwmn2c@mozz.bu.edu>
 <CAB7jVHHFc9FsnZmgGGwBLTON_8u2f8o5M6XJ1s9bZxShT+_ksQ@mail.gmail.com>
 <20210308034253.m6rjohwqcuynsaip@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308034253.m6rjohwqcuynsaip@mozz.bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210307 2242, Alexander Bulekov wrote:
> My basic workflow for that is:
> QEMU_FUZZ_TIMEOUT=0 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
> ./qemu-fuzz-target \
>        --fuzz-target=generic-fuzz-virtio-vga ./crash-... > /tmp/out
                                                           ^
                                        Oops that should be 2> or &>

> ./scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py /tmp/out > /tmp/repro
> 
> # In /tmp/out find the line "Starting qemu with Arguments:" and copy the
> # args ( without -qtest /dev/null)
> less /tmp/out 
> 
> export QEMU_ARGS="-display none -machine accel=qtest, -m 512M -machine q35 -nodefaults -device virtio-vga"
> 
> # Reproduce the crash on a non-fuzz binary
> ./qemu-system-i386 $QEMU_ARGS -qtest stdio < /tmp/repro

