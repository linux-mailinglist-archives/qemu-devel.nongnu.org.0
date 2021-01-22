Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4786300968
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:19:24 +0100 (CET)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l305j-0006Xx-9e
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l304Y-000610-T3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:18:11 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l304V-0001il-1l
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=QHrnoWS/guIePMG5Zcixa3zj1aufSiEo24jgj8lLK6c=; b=VGq4v6kZi0HkzxjRTbwedn10ME
 JxHFSiWOxABNYllnWdIHgAA9/a8oq0MCcHTbK/c0835lwN++wgpk/gTSMzJDT3P5kB/DjJUn81IH+
 xbhHsou+r2bZe5QrBy/vduooQxqe5ZsGRIOnGl7AJ3j1Ddx/9fKTOyFvBYFyo/ZvCQ99Zl2J9nxwa
 8EJcQsMoIghIMqkYW4vXJRPkYu4HoTqQCrS4l2OtgIxPCHTvfH2zaxHSpHWj6Jij5uQAZ0uAkjBqJ
 xqpIkB9rnV9SIvvzncBBNByC8yYKYBU84XJsGf7D4CotLaRwzsRsBP/FD/zCqBOuxjTXUWdlZMPzc
 K8zXOz22khcGXa10PKTVfwBRsEBpQK+Dm6lHrkeYzIYS3ITNbPFM1hOl168f4qpBu31n1uMc9NCa/
 n939Od/UqYSHgbBUEnk8uSstS3PY4k6qJVCFPifDXk5b3beiOSSdrJiMY64GDYqL5GKugzIy9iIOC
 K5P+a7XeYh1DzVbUFMnhjzo2wguEyG6hF02DWd9Qyu+DMNQa9wLDwL2HUu9KyGU/jDjf4h2t02N4o
 VAX0vWG7Q8PVqPfXoCtz+c+X5rB0xKXLEQLqtii7e5jBLhAsuDkCHVYY/QmkOGXCwJi81asWvvBPG
 SFFPf4LinC+b0EuV8d3xRhv8j1az99uHjjIvSpiSE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] 9pfs: Convert reclaim list to QSLIST
Date: Fri, 22 Jan 2021 18:18:01 +0100
Message-ID: <5355021.HDEq59nvkH@silver>
In-Reply-To: <20210122143514.215780-1-groug@kaod.org>
References: <20210122143514.215780-1-groug@kaod.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.997, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 22. Januar 2021 15:35:14 CET Greg Kurz wrote:
> Use QSLIST instead of open-coding for a slightly improved readability.
> 
> No behavioral change.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

In general LGTM, so:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Some comments below.

> ---
>  hw/9pfs/9p.c | 17 ++++++++---------
>  hw/9pfs/9p.h |  2 +-
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 3864d014b43c..5a6e2c9d3d7f 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -416,7 +416,9 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>  {
>      int reclaim_count = 0;
>      V9fsState *s = pdu->s;
> -    V9fsFidState *f, *reclaim_list = NULL;
> +    V9fsFidState *f;
> +    QSLIST_HEAD(, V9fsFidState) reclaim_list =
> +        QSLIST_HEAD_INITIALIZER(reclaim_list);
> 
>      QSIMPLEQ_FOREACH(f, &s->fid_list, next) {
>          /*
> @@ -448,8 +450,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>                   * a clunk request won't free this fid
>                   */
>                  f->ref++;
> -                f->rclm_lst = reclaim_list;
> -                reclaim_list = f;
> +                QSLIST_INSERT_HEAD(&reclaim_list, f, reclaim_next);

Yeah, that's actually much more readable this way.

>                  f->fs_reclaim.fd = f->fs.fd;
>                  f->fs.fd = -1;
>                  reclaim_count++;
> @@ -461,8 +462,7 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>                   * a clunk request won't free this fid
>                   */
>                  f->ref++;
> -                f->rclm_lst = reclaim_list;
> -                reclaim_list = f;
> +                QSLIST_INSERT_HEAD(&reclaim_list, f, reclaim_next);
>                  f->fs_reclaim.dir.stream = f->fs.dir.stream;
>                  f->fs.dir.stream = NULL;
>                  reclaim_count++;
> @@ -476,15 +476,14 @@ void coroutine_fn v9fs_reclaim_fd(V9fsPDU *pdu)
>       * Now close the fid in reclaim list. Free them if they
>       * are already clunked.
>       */
> -    while (reclaim_list) {
> -        f = reclaim_list;
> -        reclaim_list = f->rclm_lst;
> +    while (!QSLIST_EMPTY(&reclaim_list)) {
> +        f = QSLIST_FIRST(&reclaim_list);
> +        QSLIST_REMOVE(&reclaim_list, f, V9fsFidState, reclaim_next);
>          if (f->fid_type == P9_FID_FILE) {
>              v9fs_co_close(pdu, &f->fs_reclaim);
>          } else if (f->fid_type == P9_FID_DIR) {
>              v9fs_co_closedir(pdu, &f->fs_reclaim);
>          }
> -        f->rclm_lst = NULL;
>          /*
>           * Now drop the fid reference, free it
>           * if clunked.
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 85fb6930b0ca..00381591ffa2 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -281,7 +281,7 @@ struct V9fsFidState {
>      int ref;
>      bool clunked;
>      QSIMPLEQ_ENTRY(V9fsFidState) next;
> -    V9fsFidState *rclm_lst;
> +    QSLIST_ENTRY(V9fsFidState) reclaim_next;
>  };
> 
>  typedef enum AffixType_t {

The following is actually independent of this patch here, but related. I don't 
know about you, but this looks weird to me:

static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
{
    struct rlimit rlim;
    if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
        error_report("Failed to get the resource limit");
        exit(1);
    }
    open_fd_hw = rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
    open_fd_rc = rlim.rlim_cur / 2;
}

'open_fd_rc' is supposed to be the soft limit I guess and 'open_fd_hw' the 
hard limit. One thing is this combination of arbitrary divisions + MIN() + 
arbitrary constant value of 400, but okay, the calculation does not appear to 
be wrong at least.

The other thing is how reliable is it to assume this resource limit to be 
constant for the entire process life time? I know on Linux this is usually not 
an issue as you can have plenty FDs, but macOS for instance (on my TODO list) 
is rather stingy when it comes to the soft limit of a process' FDs. Might 
account to BSD as well.

I also have some doubts about how reliable the overall reclaim algorithm 
actually is. It takes a while to actually hit this algorithm in practice. 
Probably worth adding a test case 'one day'^TM.

Best regards,
Christian Schoenebeck



