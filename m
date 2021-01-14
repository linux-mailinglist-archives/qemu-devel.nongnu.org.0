Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD12F6EC8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 00:06:54 +0100 (CET)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Bhd-0002L7-Gk
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 18:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1l0Bgb-0001s0-8j
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 18:05:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1l0BgW-0003TA-NO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 18:05:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D90CB23A59;
 Thu, 14 Jan 2021 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610665541;
 bh=yUA/Bs1Pwhr1bUAUEs42FLI2wWiP3Hw6EnZlzaalbO8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NhKHtB3okHZoISqekRvJc5v4BL++WC/qaXQR8B1au8DW9lS/p15z6mNivFMQ43AtO
 VgpNah2N5MJjzHNV9nTofnTAleSGHaQR/K59a5St+HrYoAn+3IEC/1S5ezkkWssP46
 usYqAF4odCuen7nD3HJlSc0J2heqbM3DmI1t5E01dK8WIN5OjAfUZZGWSL2xEw/wPI
 kUh7kM2rh5fW/1X61Fki2a7dNhxUTzMZLJVpnNKQUP4VBFC3rt8kEkzfhhxZpaRnlP
 Lmr9KCPEVpXUiN9/9cXE4hyN72gqDCAz0xytwT0Jl4Bfn5n0jMRcyJ6/RxtoOxuzsf
 OQuuEFVUJZlEQ==
Date: Thu, 14 Jan 2021 15:05:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: Fully restart unreclaim loop (CVE-2021-20181)
In-Reply-To: <161064025265.1838153.15185571283519390907.stgit@bahia.lan>
Message-ID: <alpine.DEB.2.21.2101141505200.31265@sstabellini-ThinkPad-T480s>
References: <161064025265.1838153.15185571283519390907.stgit@bahia.lan>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Prasad J Pandit <prasad@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021, Greg Kurz wrote:
> Depending on the client activity, the server can be asked to open a huge
> number of file descriptors and eventually hit RLIMIT_NOFILE. This is
> currently mitigated using a reclaim logic : the server closes the file
> descriptors of idle fids, based on the assumption that it will be able
> to re-open them later. This assumption doesn't hold of course if the
> client requests the file to be unlinked. In this case, we loop on the
> entire fid list and mark all related fids as unreclaimable (the reclaim
> logic will just ignore them) and, of course, we open or re-open their
> file descriptors if needed since we're about to unlink the file.
> 
> This is the purpose of v9fs_mark_fids_unreclaim(). Since the actual
> opening of a file can cause the coroutine to yield, another client
> request could possibly add a new fid that we may want to mark as
> non-reclaimable as well. The loop is thus restarted if the re-open
> request was actually transmitted to the backend. This is achieved
> by keeping a reference on the first fid (head) before traversing
> the list.
> 
> This is wrong in several ways:
> - a potential clunk request from the client could tear the first
>   fid down and cause the reference to be stale. This leads to a
>   use-after-free error that can be detected with ASAN, using a
>   custom 9p client
> - fids are added at the head of the list : restarting from the
>   previous head will always miss fids added by a some other
>   potential request
> 
> All these problems could be avoided if fids were being added at the
> end of the list. This can be achieved with a QSIMPLEQ, but this is
> probably too much change for a bug fix. For now let's keep it
> simple and just restart the loop from the current head.
> 
> Fixes: CVE-2021-20181
> Buglink: https://bugs.launchpad.net/qemu/+bug/1911666
> Reported-by: Zero Day Initiative <zdi-disclosures@trendmicro.com>
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/9pfs/9p.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 94df440fc740..6026b51a1c04 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -502,9 +502,9 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>  {
>      int err;
>      V9fsState *s = pdu->s;
> -    V9fsFidState *fidp, head_fid;
> +    V9fsFidState *fidp;
>  
> -    head_fid.next = s->fid_list;
> +again:
>      for (fidp = s->fid_list; fidp; fidp = fidp->next) {
>          if (fidp->path.size != path->size) {
>              continue;
> @@ -524,7 +524,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPDU *pdu, V9fsPath *path)
>               * switched to the worker thread
>               */
>              if (err == 0) {
> -                fidp = &head_fid;
> +                goto again;
>              }
>          }
>      }
> 
> 

