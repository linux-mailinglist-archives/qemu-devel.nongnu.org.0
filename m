Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFE47BDEF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 11:12:22 +0100 (CET)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzc85-0008Cy-Id
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 05:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mzc5x-0006U0-F4
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:10:11 -0500
Received: from ciao.gmane.io ([116.202.254.214]:49712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1mzc5v-0006ca-Tm
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:10:09 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1mzc5q-0001Tm-18
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:10:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 6/8] migration: Dump sub-cmd name in
 loadvm_process_command tp
Date: Tue, 21 Dec 2021 10:08:24 +0000
Message-ID: <cun35mmmfs7.fsf@oracle.com>
References: <20211220085355.2284-1-peterx@redhat.com>
 <20211220085355.2284-7-peterx@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Cancel-Lock: sha1:nxBA33mjU86jPMYGNlgde08sw9M=
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

On Monday, 2021-12-20 at 16:53:53 +08, Peter Xu wrote:

> It'll be easier to read the name rather than index of sub-cmd when debugging.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 3 ++-
>  migration/trace-events | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 0bef031acb..7f7af6f750 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2272,12 +2272,13 @@ static int loadvm_process_command(QEMUFile *f)
>          return qemu_file_get_error(f);
>      }
>
> -    trace_loadvm_process_command(cmd, len);
>      if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
>          error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
>          return -EINVAL;
>      }
>
> +    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
> +
>      if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
>          error_report("%s received with bad length - expecting %zu, got %d",
>                       mig_cmd_args[cmd].name,
> diff --git a/migration/trace-events b/migration/trace-events
> index b48d873b8a..d63a5915f5 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
>  loadvm_postcopy_ram_handle_discard(void) ""
>  loadvm_postcopy_ram_handle_discard_end(void) ""
>  loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
> -loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
> +loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"

"cmd" rather than "com", to match the code.

>  loadvm_process_command_ping(uint32_t val) "0x%x"
>  postcopy_ram_listen_thread_exit(void) ""
>  postcopy_ram_listen_thread_start(void) ""

dme.
-- 
I went starin' out of my window, been caught doin' it once or twice.


