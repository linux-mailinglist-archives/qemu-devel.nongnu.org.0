Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEE6B14E5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa27t-0000V1-Lp; Wed, 08 Mar 2023 17:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pa27i-0000U6-U2; Wed, 08 Mar 2023 17:19:05 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pa27h-0007ka-FL; Wed, 08 Mar 2023 17:19:02 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536af432ee5so652327b3.0; 
 Wed, 08 Mar 2023 14:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678313939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4afL+pC8nFOxR3Hsl1Glq3TgDp2/qL4eDw9bqxvDQZQ=;
 b=Nd4VeuaK6q4sdX2kB5News1rnyxFktcmjT9DJBgoZwnrpdN3pLMZWI4mZdg/UGI9ZP
 4lNpADcH+gA3tk8PQEDXHs1XpB4QVeJ7kweprgPdAUrq/hQACKHKWxsDQ876wwfhV0wa
 pcHZpPiuzNs7EWwTtYNbXDiaEu/5cKTzxkE+wUGFFCqeRn5vr2QvE8zIgg7VQye1x5RG
 yrzuLHNPYc52i20C8BNeT8E5eP9zFVurZCFZ+c9f9zIKoouiovOudVxK47rT/MRwGXKs
 8B1b2vr3TeuoIRm0f+a2J17xBERMmi3lXmZCusWKxLpBHiBz7yx2m+yBq/yX4ZWe4v9P
 sP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678313939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4afL+pC8nFOxR3Hsl1Glq3TgDp2/qL4eDw9bqxvDQZQ=;
 b=vbmvAulDUTNv5QGODpT3vWB4s7QM7XiQL/2qmIPxA3beyWhsQ973k34cqK0HlxurBC
 OnMAHVonft2tzk3vfevd+aKftA7J+ai6WmLHSr5Z+9Vje35SwynPmbc0pq1yYQ8Agrw9
 ExbC+gC0zPeSKMTG68eWxhxV/28XVRnINzQ5L19u3lbVe51sPysIMa1CJxeK5KFX+XxI
 3NJmgeXXEf4qLPNQC5yiDruVbicIMvtkO3I/PELhF7RRMZ/lqhTNAunU+R2DhU0u2qIG
 rPbGsZQwa+B4TNw3XQ/wKyShV+2XpIZIFBe9UKsBK+EzbJgUk2xdev7glbB4VdcG/Ea2
 f3dg==
X-Gm-Message-State: AO0yUKUmJQcUMdrLqz5OFFrYp+/OETsaAMCZtB3FclT0CHpc2UwCMYeH
 bAvNnkpyqVb7xOd/ek+IuMSHoocspW38GWPmSGw=
X-Google-Smtp-Source: AK7set/n3xbkhMeGRgCxV58RZfo3MJTplpJejdIOKifPOe23Ye8HfKnM1b1V972YD9jsqbfGEM3Hjj+stV02bRXgUgs=
X-Received: by 2002:a81:4520:0:b0:534:515:e472 with SMTP id
 s32-20020a814520000000b005340515e472mr12915941ywa.4.1678313939341; Wed, 08
 Mar 2023 14:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230308221739.352066-1-stefanha@redhat.com>
In-Reply-To: <20230308221739.352066-1-stefanha@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 8 Mar 2023 17:18:47 -0500
Message-ID: <CAJSP0QU8WhigEQaTnag8WTh2QDTP=zpgs2S8DUFJm1zq-HPcgw@mail.gmail.com>
Subject: Re: [PATCH v2] block: add missing coroutine_fn to
 bdrv_sum_allocated_file_size()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2 is the same as v1. I sent it by accident, sorry :).

Stefan

On Wed, 8 Mar 2023 at 17:18, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Not a coroutine_fn, you say?
>
>   static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
>   {
>       BdrvChild *child;
>       int64_t child_size, sum = 0;
>
>       QLIST_FOREACH(child, &bs->children, next) {
>           if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
>                              BDRV_CHILD_FILTERED))
>           {
>               child_size = bdrv_co_get_allocated_file_size(child->bs);
>                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Well what do we have here?!
>
> I rest my case, your honor.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block.c b/block.c
> index 0dd604d0f6..a79297f99b 100644
> --- a/block.c
> +++ b/block.c
> @@ -5749,7 +5749,7 @@ exit:
>   * sums the size of all data-bearing children.  (This excludes backing
>   * children.)
>   */
> -static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
> +static int64_t coroutine_fn bdrv_sum_allocated_file_size(BlockDriverState *bs)
>  {
>      BdrvChild *child;
>      int64_t child_size, sum = 0;
> --
> 2.39.2
>
>

