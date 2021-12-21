Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471947BE1C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 11:23:20 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzcIg-0006V9-II
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 05:23:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mzcAx-0001qR-T9
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:15:21 -0500
Received: from ciao.gmane.io ([116.202.254.214]:37308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mzcAm-0007Ex-D6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:15:13 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1mzcAg-0007Un-HG
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:15:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Date: Tue, 21 Dec 2021 10:12:34 +0000
Message-ID: <cunwnjyl10t.fsf@oracle.com>
References: <20211220085355.2284-1-peterx@redhat.com>
 <20211220085355.2284-8-peterx@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Cancel-Lock: sha1:AMuS3Qj6vAXs+j8lhIsI08Gk2MI=
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-12-20 at 16:53:54 +08, Peter Xu wrote:

> The enablement of postcopy listening has a few steps, add a few tracepoints to
> be there ready for some basic measurements for them.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 9 ++++++++-
>  migration/trace-events | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 7f7af6f750..25face6de0 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1947,9 +1947,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
>  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>  {
>      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> -    trace_loadvm_postcopy_handle_listen();
>      Error *local_err = NULL;
>
> +    trace_loadvm_postcopy_handle_listen("enter");
> +
>      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
>          error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
>          return -1;
> @@ -1964,6 +1965,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>
> +    trace_loadvm_postcopy_handle_listen("after disgard");

s/disgard/discard/

> +
>      /*
>       * Sensitise RAM - can now generate requests for blocks that don't exist
>       * However, at this point the CPU shouldn't be running, and the IO
> @@ -1976,6 +1979,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>          }
>      }
>
> +    trace_loadvm_postcopy_handle_listen("after uffd");
> +
>      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
>          error_report_err(local_err);
>          return -1;
> @@ -1990,6 +1995,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
>      qemu_sem_wait(&mis->listen_thread_sem);
>      qemu_sem_destroy(&mis->listen_thread_sem);
>
> +    trace_loadvm_postcopy_handle_listen("exit");
> +

"return" rather than "exit"?

>      return 0;
>  }
>
> diff --git a/migration/trace-events b/migration/trace-events
> index d63a5915f5..77d1237d89 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
>  loadvm_handle_cmd_packaged_received(int ret) "%d"
>  loadvm_handle_recv_bitmap(char *s) "%s"
>  loadvm_postcopy_handle_advise(void) ""
> -loadvm_postcopy_handle_listen(void) ""
> +loadvm_postcopy_handle_listen(const char *str) "%s"
>  loadvm_postcopy_handle_run(void) ""
>  loadvm_postcopy_handle_run_cpu_sync(void) ""
>  loadvm_postcopy_handle_run_vmstart(void) ""

dme.
-- 
When you were the brightest star, who were the shadows?


