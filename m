Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73537373D05
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:07:09 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIBA-0000cc-H3
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leI3P-0003BI-Fr
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leI3N-0005tC-QX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 09:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620223145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rAN9nD23xbwyUjOIKVQBbmB525RcJckVSUYgg5gP/NA=;
 b=abkm0PoGFit6XelC/NeYKa9iKKhdlHOkESvCcShzLCuphrOwVHtAkEKNpB1pEjDXUjAW9I
 4FqUwVuVM0Yst1BTJZr5O54t3gFpxSZkbQvIheCiOAYwjwfgL7Xis4J1o6kFb9Ag26eIdd
 Pe+E8ajzMFEnRNstXRM8dHk94NoSFTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-EtCzI3JSNf2AV2sWZpzfHQ-1; Wed, 05 May 2021 09:59:01 -0400
X-MC-Unique: EtCzI3JSNf2AV2sWZpzfHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B342A1B18BC8;
 Wed,  5 May 2021 13:59:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9948A10074E5;
 Wed,  5 May 2021 13:58:59 +0000 (UTC)
Date: Wed, 5 May 2021 15:58:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
Message-ID: <YJKkoQzEo5OdTn4i@merkur.fritz.box>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.03.2021 um 18:15 hat Alberto Garcia geschrieben:
> When the x-blockdev-reopen was added it allowed reconfiguring the
> graph by replacing backing files, but changing the 'file' option was
> forbidden. Because of this restriction some operations are not
> possible, notably inserting and removing block filters.
> 
> This patch adds support for replacing the 'file' option. This is
> similar to replacing the backing file and the user is likewise
> responsible for the correctness of the resulting graph, otherwise this
> can lead to data corruption.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>

> @@ -4238,13 +4254,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>      }
>  
>      /* If we want to replace the backing file we need some extra checks */
> -    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
> +    if (new_child_bs != bdrv_filter_or_cow_bs(overlay_bs)) {

I may be missing something, but I don't see how this whole block makes
sense for changing 'file'.

overlay_bs was found by going down the backing chain, so of course it
will be different from new_child_bs (unless you use the same node as
'backing' and as 'file'). So we run all this code that seems to be
concerned only with backing files.

Probably overlay_bs should be found by starting from child and using
bdrv_filter_or_cow_bs() only for the following loop iterations.

>          int ret;
>  
>          /* Check for implicit nodes between bs and its backing file */
>          if (bs != overlay_bs) {
> -            error_setg(errp, "Cannot change backing link if '%s' has "
> -                       "an implicit backing file", bs->node_name);
> +            error_setg(errp, "Cannot change %s link if '%s' has an implicit "
> +                       "child", parse_file ? "file" : "backing", bs->node_name);
>              return -EPERM;
>          }

With fixed overlay_bs, this check makes sense, though the comment needs
an update.

>          /*
> @@ -4256,16 +4272,24 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>           * with bs->drv->supports_backing == true.
>           */
>          if (bdrv_is_backing_chain_frozen(overlay_bs,
> -                                         child_bs(overlay_bs->backing), errp))
> +                                         bdrv_filter_or_cow_bs(overlay_bs),
> +                                         errp))
>          {
>              return -EPERM;
>          }

This checks if bs->backing is frozen (overlay_bs == bs because of the
check above). What we really want to check is if child is frozen (i.e.
bs->backing for updating 'backing', bs->file for updating 'file). So
maybe this should be just written as that:

    if (child && child->frozen) {
        error_setg(errp, ...);
        return -EPERM;
    }

Or factor this part out from bdrv_is_backing_chain_frozen() into a
bdrv_is_child_frozen() or something like that.

Either way, this might make the whole (outdated) comment above
unnecessary because things would become a lot clearer.

> -        reopen_state->replace_backing_bs = true;
> -        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
> -        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
> -                                      errp);
> -        if (ret < 0) {
> -            return ret;
> +        if (parse_file) {
> +            /* Store the old file bs, we'll need to refresh its permissions */
> +            reopen_state->old_file_bs = bs->file->bs;
> +
> +            /* And finally replace the child */
> +            bdrv_replace_child(bs->file, new_child_bs, tran);
> +        } else {
> +            reopen_state->replace_backing_bs = true;
> +            reopen_state->old_backing_bs = child_bs(bs->backing);
> +            ret = bdrv_set_backing_noperm(bs, new_child_bs, tran, errp);
> +            if (ret < 0) {
> +                return ret;
> +            }
>          }
>      }

Kevin


