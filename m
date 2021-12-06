Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F646A184
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:36:46 +0100 (CET)
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muGyq-0002Wf-KV
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1muGxt-0001lN-F8
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:35:45 -0500
Received: from relay68.bu.edu ([128.197.228.73]:56856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1muGxq-0005T6-QW
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:35:45 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1B6GZ1gd013626
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 6 Dec 2021 11:35:04 -0500
Date: Mon, 6 Dec 2021 11:35:01 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: Re: [PATCH] fuzz: pass failures from child process into libfuzzer
 engine
Message-ID: <20211206163501.rh4du6omz4oxfgui@mozz.bu.edu>
References: <163872107649.53117.6457962986798427964.stgit@dynamic-vpn.dhcp.yndx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163872107649.53117.6457962986798427964.stgit@dynamic-vpn.dhcp.yndx.net>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.846,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211205 1917, Konstantin Khlebnikov wrote:
> Fuzzer is supposed to stop when first bug is found and report failure.
> Present fuzzers fork new child at each iteration to isolate side-effects.
> But child's exit code is ignored, i.e. libfuzzer does not see any crashes.
> 
> Right now virtio-net fuzzer instantly falls on assert in iov_copy and
> dumps crash-*, but fuzzing continues and ends successfully if global
> timeout is set.
> 
> Let's put required logic into helper function "fork_fuzzer_and_wait".
> 

Hi Konstantin,
Can you provide more details about them problem this is meant to solve?
Currently, the fuzzer would just output a "crash-" file and continue
fuzzing. So the crash isn't lost - it can still be reproduced later.
This means the fuzzer can progress faster (no need to restart the whole
process each time there is a crash).

However, this is of course, not the default libfuzzer behavior. That's
why I wonder whether you encountered some issue that depended on
libfuzzer exiting immediately. We have had some problems on OSS-Fuzz,
with incomplete coverage reports, and I wonder if this could be related.

For the example you gave, OSS-Fuzz picked up on the crash, so even
though we don't comform to the default libfuzzer behavior, the crashes
are still detected.
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=23985&q=iov_copy&can=2

Small question below.

> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> ---
>  tests/qtest/fuzz/fork_fuzz.c        |   26 ++++++++++++++++++++++++++
>  tests/qtest/fuzz/fork_fuzz.h        |    1 +
>  tests/qtest/fuzz/generic_fuzz.c     |    3 +--
>  tests/qtest/fuzz/i440fx_fuzz.c      |    3 +--
>  tests/qtest/fuzz/virtio_blk_fuzz.c  |    6 ++----
>  tests/qtest/fuzz/virtio_net_fuzz.c  |    6 ++----
>  tests/qtest/fuzz/virtio_scsi_fuzz.c |    6 ++----
>  7 files changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/fork_fuzz.c b/tests/qtest/fuzz/fork_fuzz.c
> index 6ffb2a7937..6e3a3867bf 100644
> --- a/tests/qtest/fuzz/fork_fuzz.c
> +++ b/tests/qtest/fuzz/fork_fuzz.c
> @@ -38,4 +38,30 @@ void counter_shm_init(void)
>      free(copy);
>  }
>  
> +/* Returns true in child process */
> +bool fork_fuzzer_and_wait(void)
> +{
> +    pid_t pid;
> +    int wstatus;
> +
> +    pid = fork();
> +    if (pid < 0) {
> +        perror("fork");
> +        abort();
> +    }
> +
> +    if (pid == 0) {
> +        return true;
> +    }
>  
> +    if (waitpid(pid, &wstatus, 0) < 0) {
> +        perror("waitpid");
> +        abort();
> +    }
> +
> +    if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0) {
> +        abort();
> +    }

Maybe instead of these aborts, we return "true" so the fork-server tries
to run the input, itself and (hopefully) crashes. That way we would have
an accurate stack trace, instead of abort, which is probably important
for the OSS-Fuzz crash-bucketing.

Thanks
-Alex

> +
> +    return false;
> +}
> diff --git a/tests/qtest/fuzz/fork_fuzz.h b/tests/qtest/fuzz/fork_fuzz.h
> index 9ecb8b58ef..792e922731 100644
> --- a/tests/qtest/fuzz/fork_fuzz.h
> +++ b/tests/qtest/fuzz/fork_fuzz.h
> @@ -18,6 +18,7 @@ extern uint8_t __FUZZ_COUNTERS_START;
>  extern uint8_t __FUZZ_COUNTERS_END;
>  
>  void counter_shm_init(void);
> +bool fork_fuzzer_and_wait(void);
>  
>  #endif
>  
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index dd7e25851c..f0e25b39ea 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -667,7 +667,7 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>      size_t cmd_len;
>      uint8_t op;
>  
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          struct sigaction sact;
>          struct itimerval timer;
>          sigset_t set;
> @@ -723,7 +723,6 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(0);
>      }
>  }
>  
> diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
> index 86796bff2b..0b927f4b3a 100644
> --- a/tests/qtest/fuzz/i440fx_fuzz.c
> +++ b/tests/qtest/fuzz/i440fx_fuzz.c
> @@ -147,12 +147,11 @@ static void i440fx_fuzz_qos(QTestState *s,
>  
>  static void i440fx_fuzz_qos_fork(QTestState *s,
>          const unsigned char *Data, size_t Size) {
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          i440fx_fuzz_qos(s, Data, Size);
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
> index 623a756fd4..9532dc1fa7 100644
> --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
> @@ -136,13 +136,12 @@ static void virtio_blk_fork_fuzz(QTestState *s,
>      if (!queues) {
>          queues = qvirtio_blk_init(blk->vdev, 0);
>      }
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          virtio_blk_fuzz(s, queues, Data, Size);
>          flush_events(s);
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> @@ -152,7 +151,7 @@ static void virtio_blk_with_flag_fuzz(QTestState *s,
>      QVirtioBlk *blk = fuzz_qos_obj;
>      static QVirtioBlkQueues *queues;
>  
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          if (Size >= sizeof(uint64_t)) {
>              queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
>              virtio_blk_fuzz(s, queues,
> @@ -162,7 +161,6 @@ static void virtio_blk_with_flag_fuzz(QTestState *s,
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
> index 0e873ab8e2..6b492ef9e7 100644
> --- a/tests/qtest/fuzz/virtio_net_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_net_fuzz.c
> @@ -118,26 +118,24 @@ static void virtio_net_fuzz_multi(QTestState *s,
>  static void virtio_net_fork_fuzz(QTestState *s,
>          const unsigned char *Data, size_t Size)
>  {
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          virtio_net_fuzz_multi(s, Data, Size, false);
>          flush_events(s);
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
>  static void virtio_net_fork_fuzz_check_used(QTestState *s,
>          const unsigned char *Data, size_t Size)
>  {
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          virtio_net_fuzz_multi(s, Data, Size, true);
>          flush_events(s);
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> index 6ff6fabe4a..c7eaf3242b 100644
> --- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
> @@ -140,13 +140,12 @@ static void virtio_scsi_fork_fuzz(QTestState *s,
>      if (!queues) {
>          queues = qvirtio_scsi_init(scsi->vdev, 0);
>      }
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          virtio_scsi_fuzz(s, queues, Data, Size);
>          flush_events(s);
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> @@ -156,7 +155,7 @@ static void virtio_scsi_with_flag_fuzz(QTestState *s,
>      QVirtioSCSI *scsi = fuzz_qos_obj;
>      static QVirtioSCSIQueues *queues;
>  
> -    if (fork() == 0) {
> +    if (fork_fuzzer_and_wait()) {
>          if (Size >= sizeof(uint64_t)) {
>              queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
>              virtio_scsi_fuzz(s, queues,
> @@ -166,7 +165,6 @@ static void virtio_scsi_with_flag_fuzz(QTestState *s,
>          _Exit(0);
>      } else {
>          flush_events(s);
> -        wait(NULL);
>      }
>  }
>  
> 

