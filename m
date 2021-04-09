Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD8359D98
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:42:00 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpWS-0005vI-1E
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUpUL-00050Y-Sn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:39:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40464
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUpUJ-0001h4-H8
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 07:39:49 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lUpUN-0007jf-On; Fri, 09 Apr 2021 12:39:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com, Peter Maydell <peter.maydell@linaro.org>
References: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <53965efe-eeb9-9934-fed9-78a73a4b3c19@ilande.co.uk>
Date: Fri, 9 Apr 2021 12:39:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407195801.685-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 for-6.0 00/12] esp: fix asserts/segfaults discovered by
 fuzzer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 20:57, Mark Cave-Ayland wrote:

(added Peter to CC)

> Recently there have been a number of issues raised on Launchpad as a result of
> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
> days checking to see if anything had improved since my last patchset: from
> what I can tell the issues are still present, but the cmdfifo related failures
> now assert rather than corrupting memory.
> 
> This patchset applied to master passes my local tests using the qtest fuzz test
> cases added by Alexander for the following Launchpad bugs:
> 
>    https://bugs.launchpad.net/qemu/+bug/1919035
>    https://bugs.launchpad.net/qemu/+bug/1919036
>    https://bugs.launchpad.net/qemu/+bug/1910723
>    https://bugs.launchpad.net/qemu/+bug/1909247
>    
> I'm posting this now just before soft freeze since I see that some of the issues
> have recently been allocated CVEs and so it could be argued that even though
> they have existed for some time, it is worth fixing them for 6.0.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> v4:
> - Rebase onto master
> - Add R-B tags from Phil
> - Fix accidental line space removal in patch 3 discovered by Phil
> - Change spelling of sanitiser -> sanitizer in patch 5 as suggested by Phil
> - Fix up cmdfifo length checks in patch 8
> - Add T-B tags from Alex
> - Add patch 11 to handle additional assert discovered by Alex during fuzzing
> 
> v3:
> - Rebase onto master
> - Rearrange patch ordering (move patch 5 to the front) to help reduce cross-talk
>    between the regression tests
> - Introduce patch 2 to remove unnecessary FIFO usage
> - Introduce patches 3-4 to consolidate esp_fifo_pop()/esp_fifo_push() wrapper
>    functions to avoid having to introduce 2 variants of esp_fifo_pop_buf()
> - Introduce esp_fifo_pop_buf() in patch 5 to prevent callers from overflowing
>    the array used to model the FIFO
> - Introduce patch 10 to clarify cancellation logic should all occur in the .cancel
>    SCSI callback rather than at the site of the caller
> - Add extra qtests in patch 11 to cover addition test cases provided on LP
> 
> v2:
> - Add Alexander's R-B tag for patch 2 and Phil's R-B for patch 3
> - Add patch 4 for additional testcase provided in Alexander's patch 1 comment
> - Move current_req NULL checks forward in DMA functions (fixes ASAN bug reported
>    at https://bugs.launchpad.net/qemu/+bug/1909247/comments/6) in patch 3
> - Add qtest for am53c974 containing a basic set of regression tests using the
>    automatic test cases generated by the fuzzer as requested by Paolo
> 
> 
> Mark Cave-Ayland (12):
>    esp: always check current_req is not NULL before use in DMA callbacks
>    esp: rework write_response() to avoid using the FIFO for DMA
>      transactions
>    esp: consolidate esp_cmdfifo_push() into esp_fifo_push()
>    esp: consolidate esp_cmdfifo_pop() into esp_fifo_pop()
>    esp: introduce esp_fifo_pop_buf() and use it instead of
>      fifo8_pop_buf()
>    esp: ensure cmdfifo is not empty and current_dev is non-NULL
>    esp: don't underflow cmdfifo in do_cmd()
>    esp: don't overflow cmdfifo in get_cmd()
>    esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
>    esp: don't reset async_len directly in esp_select() if cancelling
>      request
>    esp: ensure that do_cmd is set to zero before submitting an ESP select
>      command
>    tests/qtest: add tests for am53c974 device
> 
>   MAINTAINERS                 |   1 +
>   hw/scsi/esp.c               | 119 +++++++++++---------
>   tests/qtest/am53c974-test.c | 216 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build     |   1 +
>   4 files changed, 285 insertions(+), 52 deletions(-)
>   create mode 100644 tests/qtest/am53c974-test.c

Hi Paolo,

Is this still a candidate for 6.0 as you suggested in your response to v1? There is 
also the related ESP fix for the SPARC acceptance test failure which I think is also 
appropriate for 6.0.

If so, who would be able to review/merge both these ESP patches? Given that we're 
already at -rc2 I'm aware that it's getting quite close to the 6.0 release.


ATB,

Mark.

