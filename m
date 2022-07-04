Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D85656A3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:11:56 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lrn-0002P3-MP
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LiQ-0006Qs-TO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LiO-0008Aw-Bq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AFW8MeiY6pZvOnkaP5WkHh5L9IKTjxRnPEXROmnTR2o=;
 b=f01dQjvmdeVVeomS2NciOy7btVLbnCAFvyLSuqHO3foyAoEIsxaUdu1iNYPGokjJUCeK8y
 Z9rWpbh7EEXQCqfaKysvTUO5TkKsqfatY4J0casbpBpl/KSLVNr0OXK5cOqKdt886eDWpr
 Q/OKkohjL1gBYdAsa0OuFP9GzlzNgDU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-izXJ3SU6PUqt2WvBD2vsXg-1; Mon, 04 Jul 2022 09:02:10 -0400
X-MC-Unique: izXJ3SU6PUqt2WvBD2vsXg-1
Received: by mail-il1-f197.google.com with SMTP id
 x11-20020a056e021cab00b002dada9d2a50so4197318ill.15
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFW8MeiY6pZvOnkaP5WkHh5L9IKTjxRnPEXROmnTR2o=;
 b=pvkaVkdV6CnvHOpy+XAMcWgNbEHPEkxCRwJRla9yDJQlcCY+GqINCxIrhi4fs45Yum
 2FLWwb/KG6eKhLaoDdvTOLi15A4sNS4CitYnlO+pGPD4tAhsrLg1MoJpG3tXyFjNi/go
 TqAdrjBAnyU0XtxUQcQLALE+imCjpAUEUcdGA93IkkucR2+Y1gZZS3FWJjr5pxjw71gu
 Z81CzP/m6BWp1Ew7u8x8xhEftaPPHgCpD0W1nEJoVZLMapjmlrbzevTmvqiZIqYpBkTt
 jotXdhbSVrC43wmahIkt59AaYr3RYIhuonqu7ZFPMUE20x3ojnBmkNxEQ2Eepd+yhiv2
 Z/fQ==
X-Gm-Message-State: AJIora+/gmQ/EZRfJ4yI9A03ok9giHfpCbZaGqAPL4dTIQgS5Du8Qk9B
 tfhQChRP+6V4vHSvjh1EgfnjyMoX1eSbyymi+QsQV4wACUzCiqYzY8+LzBegcsGZ1Tb/xbPbPkk
 4M+faL2xPC6keecS9Rup0dG3nwDHG2E4=
X-Received: by 2002:a05:6e02:1cac:b0:2da:8e5f:a49f with SMTP id
 x12-20020a056e021cac00b002da8e5fa49fmr17244238ill.200.1656939729818; 
 Mon, 04 Jul 2022 06:02:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+4kNz4q4F31Ob2s3cbMuunDUV/SjiEUprlS4ZLPlfzUXzAOWIS5Bw9KuLThGRCNBMzi4IhXYvOKvlt3cHOfI=
X-Received: by 2002:a05:6e02:1cac:b0:2da:8e5f:a49f with SMTP id
 x12-20020a056e021cac00b002da8e5fa49fmr17244222ill.200.1656939729406; Mon, 04
 Jul 2022 06:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-19-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-19-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:01:33 +0100
Message-ID: <CAELaAXy4BfJteqjcBeOB7E4Zf=G_=qaif-S=WLLjxmugntab=g@mail.gmail.com>
Subject: Re: [PATCH v2 18/26] quorum: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 9, 2022 at 11:54 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/quorum.c | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/block/quorum.c b/block/quorum.c
> index f33f30d36b..5ff69d7443 100644
> --- a/block/quorum.c
> +++ b/block/quorum.c
> @@ -161,11 +161,10 @@ static bool quorum_64bits_compare(QuorumVoteValue *a, QuorumVoteValue *b)
>      return a->l == b->l;
>  }
>
> -static QuorumAIOCB *quorum_aio_get(BlockDriverState *bs,
> -                                   QEMUIOVector *qiov,
> -                                   uint64_t offset,
> -                                   uint64_t bytes,
> -                                   int flags)
> +static QuorumAIOCB *coroutine_fn quorum_aio_get(BlockDriverState *bs,
> +                                                QEMUIOVector *qiov,
> +                                                uint64_t offset, uint64_t bytes,
> +                                                int flags)
>  {
>      BDRVQuorumState *s = bs->opaque;
>      QuorumAIOCB *acb = g_new(QuorumAIOCB, 1);
> @@ -273,7 +272,7 @@ static void quorum_report_bad_versions(BDRVQuorumState *s,
>      }
>  }
>
> -static void quorum_rewrite_entry(void *opaque)
> +static void coroutine_fn quorum_rewrite_entry(void *opaque)
>  {
>      QuorumCo *co = opaque;
>      QuorumAIOCB *acb = co->acb;
> @@ -574,7 +573,7 @@ free_exit:
>      quorum_free_vote_list(&acb->votes);
>  }
>
> -static void read_quorum_children_entry(void *opaque)
> +static void coroutine_fn read_quorum_children_entry(void *opaque)
>  {
>      QuorumCo *co = opaque;
>      QuorumAIOCB *acb = co->acb;
> @@ -602,7 +601,7 @@ static void read_quorum_children_entry(void *opaque)
>      }
>  }
>
> -static int read_quorum_children(QuorumAIOCB *acb)
> +static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
>  {
>      BDRVQuorumState *s = acb->bs->opaque;
>      int i;
> @@ -643,7 +642,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
>      return acb->vote_ret;
>  }
>
> -static int read_fifo_child(QuorumAIOCB *acb)
> +static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)

There's a prototype further above that may be worth marking as coroutine_fn too.

>  {
>      BDRVQuorumState *s = acb->bs->opaque;
>      int n, ret;
> @@ -664,8 +663,9 @@ static int read_fifo_child(QuorumAIOCB *acb)
>      return ret;
>  }
>
> -static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
> -                            QEMUIOVector *qiov, BdrvRequestFlags flags)
> +static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
> +                                         int64_t offset, int64_t bytes,
> +                                         QEMUIOVector *qiov, BdrvRequestFlags flags)

Overly long line.

>  {
>      BDRVQuorumState *s = bs->opaque;
>      QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
> @@ -684,7 +684,7 @@ static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
>      return ret;
>  }
>
> -static void write_quorum_entry(void *opaque)
> +static void coroutine_fn write_quorum_entry(void *opaque)
>  {
>      QuorumCo *co = opaque;
>      QuorumAIOCB *acb = co->acb;
> @@ -715,9 +715,9 @@ static void write_quorum_entry(void *opaque)
>      }
>  }
>
> -static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
> -                             int64_t bytes, QEMUIOVector *qiov,
> -                             BdrvRequestFlags flags)
> +static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
> +                                          int64_t bytes, QEMUIOVector *qiov,
> +                                          BdrvRequestFlags flags)
>  {
>      BDRVQuorumState *s = bs->opaque;
>      QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
> @@ -746,8 +746,9 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
>      return ret;
>  }
>
> -static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> -                                   int64_t bytes, BdrvRequestFlags flags)
> +static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
> +                                                int64_t offset, int64_t bytes,
> +                                                BdrvRequestFlags flags)
>
>  {
>      return quorum_co_pwritev(bs, offset, bytes, NULL,
> --
> 2.35.1

Reviewed-by: Alberto Faria <afaria@redhat.com>


