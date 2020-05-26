Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBD1D9BA9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:50:04 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb4VI-0000qZ-21
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jb4TI-00079Q-5f
 for qemu-devel@nongnu.org; Tue, 19 May 2020 11:48:00 -0400
Received: from relay68.bu.edu ([128.197.228.73]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jb4TH-00080d-2G
 for qemu-devel@nongnu.org; Tue, 19 May 2020 11:47:59 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 04JFlCBF022064
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 19 May 2020 11:47:16 -0400
Date: Tue, 19 May 2020 11:47:12 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PATCH 0/4] fuzz: misc changes for oss-fuzz compatability
Message-ID: <20200519154712.lyh42fm7d26final@mozz.bu.edu>
References: <20200512030133.29896-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512030133.29896-1-alxndr@bu.edu>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 11:47:56
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: darren.kenny@oracle.com, bsd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 200511 2301, Alexander Bulekov wrote:
> Hello,
> With these patches, the fuzzer passes the oss-fuzz build checks.
> There are also some miscelanous improvement to the fuzzer, in general:
>  * If building for oss-fuzz, check executable_dir/pc-bios for
>    the bios images
>  * Fix a typo in the i440fx-qtest-reboot argument which resulted in an
>    invalid argument to qemu_main
>  * Add an alternate name to resolve libfuzzer's internal fuzzer::TPC
>    object at link-time
>  * For all fork-based fuzzers, run the main-loop in the parent, to
>    prevent the clock from running far-ahead of the previous main-loop.
> -Alex
> 
> Alexander Bulekov (4):
>   fuzz: add datadir for oss-fuzz compatability
>   fuzz: fix typo in i440fx-qtest-reboot arguments
>   fuzz: add mangled object name to linker script
>   fuzz: run the main-loop in fork-server process
> 
>  include/sysemu/sysemu.h             |  2 ++
>  softmmu/vl.c                        |  2 +-
>  tests/qtest/fuzz/fork_fuzz.ld       |  5 +++++
>  tests/qtest/fuzz/fuzz.c             | 15 +++++++++++++++
>  tests/qtest/fuzz/i440fx_fuzz.c      |  3 ++-
>  tests/qtest/fuzz/virtio_net_fuzz.c  |  2 ++
>  tests/qtest/fuzz/virtio_scsi_fuzz.c |  2 ++
>  7 files changed, 29 insertions(+), 2 deletions(-)
> 
> -- 
> 2.26.2
> 

