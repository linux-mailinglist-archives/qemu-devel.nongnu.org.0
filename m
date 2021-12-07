Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C546C292
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 19:20:02 +0100 (CET)
Received: from localhost ([::1]:58708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muf4L-00072G-Ct
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 13:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1muf3W-0006NT-Be
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:19:10 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1muf3T-0001l8-Q9
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 13:19:09 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1B7II3Ri005520
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 7 Dec 2021 13:18:07 -0500
Date: Tue, 7 Dec 2021 13:18:03 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: Re: [PATCH] fuzz: pass failures from child process into libfuzzer
 engine
Message-ID: <20211207181803.6kmu7oiqry2yw7iw@mozz.bu.edu>
References: <163872107649.53117.6457962986798427964.stgit@dynamic-vpn.dhcp.yndx.net>
 <20211206163501.rh4du6omz4oxfgui@mozz.bu.edu>
 <140251638814249@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <140251638814249@mail.yandex-team.ru>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211206 2348, Konstantin Khlebnikov wrote:
>     
>     
>    06.12.2021, 19:35, "Alexander Bulekov" <[1]alxndr@bu.edu>:
> 
>      On 211205 1917, Konstantin Khlebnikov wrote:
> 
>         Fuzzer is supposed to stop when first bug is found and report
>        failure.
>         Present fuzzers fork new child at each iteration to isolate
>        side-effects.
>         But child's exit code is ignored, i.e. libfuzzer does not see any
>        crashes.
>         
>         Right now virtio-net fuzzer instantly falls on assert in iov_copy and
>         dumps crash-*, but fuzzing continues and ends successfully if global
>         timeout is set.
>         
>         Let's put required logic into helper function "fork_fuzzer_and_wait".
>         
> 
>      Hi Konstantin,
>      Can you provide more details about them problem this is meant to solve?
>      Currently, the fuzzer would just output a "crash-" file and continue
>      fuzzing. So the crash isn't lost - it can still be reproduced later.
>      This means the fuzzer can progress faster (no need to restart the whole
>      process each time there is a crash).
> 
>      However, this is of course, not the default libfuzzer behavior. That's
>      why I wonder whether you encountered some issue that depended on
>      libfuzzer exiting immediately. We have had some problems on OSS-Fuzz,
>      with incomplete coverage reports, and I wonder if this could be related.
> 
>      For the example you gave, OSS-Fuzz picked up on the crash, so even
>      though we don't comform to the default libfuzzer behavior, the crashes
>      are still detected.
>      [2]https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=23985&q=iov_copy&can=2
> 
>    Oh well. So, this is known "feature". That was unexpected. =)
>    Recent libfuzzer has options for that behaviour: "-fork=1
>    -ignore_crashes=1".
>     
>    I'm trying to fuzz various virtio devices and was really surprised that
>    present
>    fuzzing targes still find crashes in seconds.
>    I thought they might be missed due to unhandled exit status.

For some reason, I never created a report for this issue. Just created
one: https://gitlab.com/qemu-project/qemu/-/issues/762

>     
>    It seems fuzzing targets like "virtio-net" in present state wastes
>    resources.
>    oss-fuzz could instead focus on not yet broken targets.

I don't think so. For example, the generic-fuzz-virtio-net-pci-slirp
fuzzer also found the same issue, but it continued making progress, and
eventually found CVE-2021-3748
https://access.redhat.com/security/cve/cve-2021-3748
(the reproducer was almost 200 lines long - much more complex than issue #762)
So with the fork approach, the fuzzer might be slowed down (due to
outputting stacktraces and creating crash- files), but it can still
continue to make progress.

>     
>    Or "abort/assert' in device emulation code should be treated as "success"?
>    In some sense that's true, we cannot prevent suicide behaviour in vm.
>    Real hardware dies easily after shooting randomly into ports/io ranges.

Certainly not. We usually create QEMU Issues for assertion failures
found by the fuzzer, but the one you brough up slipped through the cracks.

> 
>      Small question below.
> 
>         Signed-off-by: Konstantin Khlebnikov <[3]khlebnikov@yandex-team.ru>
>         ---
>          tests/qtest/fuzz/fork_fuzz.c | 26 ++++++++++++++++++++++++++
>          tests/qtest/fuzz/fork_fuzz.h | 1 +
>          tests/qtest/fuzz/generic_fuzz.c | 3 +--
>          tests/qtest/fuzz/i440fx_fuzz.c | 3 +--
>          tests/qtest/fuzz/virtio_blk_fuzz.c | 6 ++----
>          tests/qtest/fuzz/virtio_net_fuzz.c | 6 ++----
>          tests/qtest/fuzz/virtio_scsi_fuzz.c | 6 ++----
>          7 files changed, 35 insertions(+), 16 deletions(-)
>         
>         diff --git a/tests/qtest/fuzz/fork_fuzz.c
>        b/tests/qtest/fuzz/fork_fuzz.c
>         index 6ffb2a7937..6e3a3867bf 100644
>         --- a/tests/qtest/fuzz/fork_fuzz.c
>         +++ b/tests/qtest/fuzz/fork_fuzz.c
>         @@ -38,4 +38,30 @@ void counter_shm_init(void)
>              free(copy);
>          }
>          
>         +/* Returns true in child process */
>         +bool fork_fuzzer_and_wait(void)
>         +{
>         + pid_t pid;
>         + int wstatus;
>         +
>         + pid = fork();
>         + if (pid < 0) {
>         + perror("fork");
>         + abort();
>         + }
>         +
>         + if (pid == 0) {
>         + return true;
>         + }
>          
>         + if (waitpid(pid, &wstatus, 0) < 0) {
>         + perror("waitpid");
>         + abort();
>         + }
>         +
>         + if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0) {
>         + abort();
>         + }
> 
>      Maybe instead of these aborts, we return "true" so the fork-server tries
>      to run the input, itself and (hopefully) crashes. That way we would have
>      an accurate stack trace, instead of abort, which is probably important
>      for the OSS-Fuzz crash-bucketing.
> 
>    Stack trace from child process should have same accuracy.
>    I don't see how they could be different.

Yes the child stack-trace is fine, however it is followed by one for the
abort() in the parent.

>     
>    I suppose OSS-Fuzz infrastructure is ready to handle multiple stacktraces,
>    e.g. stacktraces from several threads should be a common result.

I don't think it's that advanced. libfuzzer stack-traces typically only
contain a single trace for the thread that crashed (there are some
exceptions for AddressSanitizer). OSS-Fuzz relies on these traces to
automatically identify separate issues, so if it sees that the last
crash in the output is fork_fuzzer_and_wait->abort, I worry that it will
not be able to properly identify unique bugs.
-Alex

>     
> 
>      Thanks
>      -Alex
>       
> 
>         +
>         + return false;
>         +}
>         diff --git a/tests/qtest/fuzz/fork_fuzz.h
>        b/tests/qtest/fuzz/fork_fuzz.h
>         index 9ecb8b58ef..792e922731 100644
>         --- a/tests/qtest/fuzz/fork_fuzz.h
>         +++ b/tests/qtest/fuzz/fork_fuzz.h
>         @@ -18,6 +18,7 @@ extern uint8_t __FUZZ_COUNTERS_START;
>          extern uint8_t __FUZZ_COUNTERS_END;
>          
>          void counter_shm_init(void);
>         +bool fork_fuzzer_and_wait(void);
>          
>          #endif
>          
>         diff --git a/tests/qtest/fuzz/generic_fuzz.c
>        b/tests/qtest/fuzz/generic_fuzz.c
>         index dd7e25851c..f0e25b39ea 100644
>         --- a/tests/qtest/fuzz/generic_fuzz.c
>         +++ b/tests/qtest/fuzz/generic_fuzz.c
>         @@ -667,7 +667,7 @@ static void generic_fuzz(QTestState *s, const
>        unsigned char *Data, size_t Size)
>              size_t cmd_len;
>              uint8_t op;
>          
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  struct sigaction sact;
>                  struct itimerval timer;
>                  sigset_t set;
>         @@ -723,7 +723,6 @@ static void generic_fuzz(QTestState *s, const
>        unsigned char *Data, size_t Size)
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(0);
>              }
>          }
>          
>         diff --git a/tests/qtest/fuzz/i440fx_fuzz.c
>        b/tests/qtest/fuzz/i440fx_fuzz.c
>         index 86796bff2b..0b927f4b3a 100644
>         --- a/tests/qtest/fuzz/i440fx_fuzz.c
>         +++ b/tests/qtest/fuzz/i440fx_fuzz.c
>         @@ -147,12 +147,11 @@ static void i440fx_fuzz_qos(QTestState *s,
>          
>          static void i440fx_fuzz_qos_fork(QTestState *s,
>                  const unsigned char *Data, size_t Size) {
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  i440fx_fuzz_qos(s, Data, Size);
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c
>        b/tests/qtest/fuzz/virtio_blk_fuzz.c
>         index 623a756fd4..9532dc1fa7 100644
>         --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
>         +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
>         @@ -136,13 +136,12 @@ static void virtio_blk_fork_fuzz(QTestState *s,
>              if (!queues) {
>                  queues = qvirtio_blk_init(blk->vdev, 0);
>              }
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  virtio_blk_fuzz(s, queues, Data, Size);
>                  flush_events(s);
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         @@ -152,7 +151,7 @@ static void virtio_blk_with_flag_fuzz(QTestState
>        *s,
>              QVirtioBlk *blk = fuzz_qos_obj;
>              static QVirtioBlkQueues *queues;
>          
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  if (Size >= sizeof(uint64_t)) {
>                      queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
>                      virtio_blk_fuzz(s, queues,
>         @@ -162,7 +161,6 @@ static void virtio_blk_with_flag_fuzz(QTestState
>        *s,
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c
>        b/tests/qtest/fuzz/virtio_net_fuzz.c
>         index 0e873ab8e2..6b492ef9e7 100644
>         --- a/tests/qtest/fuzz/virtio_net_fuzz.c
>         +++ b/tests/qtest/fuzz/virtio_net_fuzz.c
>         @@ -118,26 +118,24 @@ static void virtio_net_fuzz_multi(QTestState
>        *s,
>          static void virtio_net_fork_fuzz(QTestState *s,
>                  const unsigned char *Data, size_t Size)
>          {
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  virtio_net_fuzz_multi(s, Data, Size, false);
>                  flush_events(s);
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>          static void virtio_net_fork_fuzz_check_used(QTestState *s,
>                  const unsigned char *Data, size_t Size)
>          {
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  virtio_net_fuzz_multi(s, Data, Size, true);
>                  flush_events(s);
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c
>        b/tests/qtest/fuzz/virtio_scsi_fuzz.c
>         index 6ff6fabe4a..c7eaf3242b 100644
>         --- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
>         +++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
>         @@ -140,13 +140,12 @@ static void virtio_scsi_fork_fuzz(QTestState
>        *s,
>              if (!queues) {
>                  queues = qvirtio_scsi_init(scsi->vdev, 0);
>              }
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  virtio_scsi_fuzz(s, queues, Data, Size);
>                  flush_events(s);
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         @@ -156,7 +155,7 @@ static void virtio_scsi_with_flag_fuzz(QTestState
>        *s,
>              QVirtioSCSI *scsi = fuzz_qos_obj;
>              static QVirtioSCSIQueues *queues;
>          
>         - if (fork() == 0) {
>         + if (fork_fuzzer_and_wait()) {
>                  if (Size >= sizeof(uint64_t)) {
>                      queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t
>        *)Data);
>                      virtio_scsi_fuzz(s, queues,
>         @@ -166,7 +165,6 @@ static void virtio_scsi_with_flag_fuzz(QTestState
>        *s,
>                  _Exit(0);
>              } else {
>                  flush_events(s);
>         - wait(NULL);
>              }
>          }
>          
>         
> 
>     
>     
>     
> 
> References
> 
>    Visible links
>    1. mailto:alxndr@bu.edu
>    2. https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=23985&q=iov_copy&can=2
>    3. mailto:khlebnikov@yandex-team.ru

