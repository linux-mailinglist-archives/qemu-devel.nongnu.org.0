Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6742351713
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:03:42 +0200 (CEST)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0jN-00069T-EC
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lS0hI-0005hS-Eh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:01:32 -0400
Received: from relay64.bu.edu ([128.197.228.104]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lS0hC-0005g4-Ta
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:01:31 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 131H0LLJ002847
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 1 Apr 2021 13:00:24 -0400
Date: Thu, 1 Apr 2021 13:00:21 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3 00/11] esp: fix asserts/segfaults discovered by fuzzer
Message-ID: <20210401170021.x5ek7cusc62m7m6f@mozz.bu.edu>
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210401 0849, Mark Cave-Ayland wrote:
> Recently there have been a number of issues raised on Launchpad as a result of
> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
> days checking to see if anything had improved since my last patchset: from
> what I can tell the issues are still present, but the cmdfifo related failures
> now assert rather than corrupting memory.
> 
> This patchset applied to master passes my local tests using the qtest fuzz test
> cases added by Alexander for the following Launchpad bugs:
> 
>   https://bugs.launchpad.net/qemu/+bug/1919035
>   https://bugs.launchpad.net/qemu/+bug/1919036
>   https://bugs.launchpad.net/qemu/+bug/1910723
>   https://bugs.launchpad.net/qemu/+bug/1909247
>   
> I'm posting this now just before soft freeze since I see that some of the issues
> have recently been allocated CVEs and so it could be argued that even though
> they have existed for some time, it is worth fixing them for 6.0.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v3:
> - Rebase onto master
> - Rearrange patch ordering (move patch 5 to the front) to help reduce cross-talk
>   between the regression tests
> - Introduce patch 2 to remove unnecessary FIFO usage
> - Introduce patches 3-4 to consolidate esp_fifo_pop()/esp_fifo_push() wrapper
>   functions to avoid having to introduce 2 variants of esp_fifo_pop_buf()
> - Introduce esp_fifo_pop_buf() in patch 5 to prevent callers from overflowing
>   the array used to model the FIFO
> - Introduce patch 10 to clarify cancellation logic should all occur in the .cancel
>   SCSI callback rather than at the site of the caller
> - Add extra qtests in patch 11 to cover addition test cases provided on LP
> 

Hi Mark,
I applied this and ran through the whole fuzzer corpus, and all I'm
seeing are just a few assertion failures:
handle_satn_stop -> get_cmd -> util/fifo8.c:43:5 and
hw/scsi/esp.c:790:5

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thank you
-Alex

> v2:
> - Add Alexander's R-B tag for patch 2 and Phil's R-B for patch 3
> - Add patch 4 for additional testcase provided in Alexander's patch 1 comment
> - Move current_req NULL checks forward in DMA functions (fixes ASAN bug reported
>   at https://bugs.launchpad.net/qemu/+bug/1909247/comments/6) in patch 3
> - Add qtest for am53c974 containing a basic set of regression tests using the
>   automatic test cases generated by the fuzzer as requested by Paolo
> 
> 
> Mark Cave-Ayland (11):
>   esp: always check current_req is not NULL before use in DMA callbacks
>   esp: rework write_response() to avoid using the FIFO for DMA
>     transactions
>   esp: consolidate esp_cmdfifo_push() into esp_fifo_push()
>   esp: consolidate esp_cmdfifo_pop() into esp_fifo_pop()
>   esp: introduce esp_fifo_pop_buf() and use it instead of
>     fifo8_pop_buf()
>   esp: ensure cmdfifo is not empty and current_dev is non-NULL
>   esp: don't underflow cmdfifo in do_cmd()
>   esp: don't overflow cmdfifo in get_cmd()
>   esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
>   esp: don't reset async_len directly in esp_select() if cancelling
>     request
>   tests/qtest: add tests for am53c974 device
> 
>  MAINTAINERS                 |   1 +
>  hw/scsi/esp.c               | 116 ++++++++++---------
>  tests/qtest/am53c974-test.c | 216 ++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build     |   1 +
>  4 files changed, 282 insertions(+), 52 deletions(-)
>  create mode 100644 tests/qtest/am53c974-test.c
> 
> -- 
> 2.20.1
> 

