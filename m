Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB32FBE70
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:02:16 +0100 (CET)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vKY-00059d-NA
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1v1j-0001qp-6z
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1v1g-0001eS-9e
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611078163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wlWhGXlEin5LW7LHSvGCy6NihMf+M2882KOUnfGj5NI=;
 b=NqM/UCSNQiERmWxYGPdrbURb7QyVwgLcdB2s4VdXiGX+hN42qArAy/Q4ibet6HGpdmR/1P
 BPpITdZpc9QK14ZboqvXFPqOop4gOo2DFfCIBWI/l91Dl0sgFAGxzlvXWoQwqvjw+LwfyY
 dE5VGgB25L5SB5/d0diUyA2XSSqn7JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-HD9_ucdSNC-aD1KkvRhGgw-1; Tue, 19 Jan 2021 12:42:39 -0500
X-MC-Unique: HD9_ucdSNC-aD1KkvRhGgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5EBDBBEE1;
 Tue, 19 Jan 2021 17:42:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-149.ams2.redhat.com [10.36.115.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44DF260C5A;
 Tue, 19 Jan 2021 17:42:36 +0000 (UTC)
Date: Tue, 19 Jan 2021 18:42:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 11/36] block: bdrv_refresh_perms: check parents
 compliance
Message-ID: <20210119174234.GJ5012@merkur.fritz.box>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-12-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201127144522.29991-12-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Add additional check that node parents do not interfere with each
> other. This should not hurt existing callers and allows in further
> patch use bdrv_refresh_perms() to update a subtree of changed
> BdrvChild (check that change is correct).
> 
> New check will substitute bdrv_check_update_perm() in following
> permissions refactoring, so keep error messages the same to avoid
> unit test result changes.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The change itself looks ok, but I'm not happy with the naming. It feels
a bit unspecific. How about inverting the result and calling it
bdrv_parent_perms_conflict() and bdrv_child_perms_conflict()?

At least, I'd call it "permission consistency" rather then "compliance".

> diff --git a/block.c b/block.c
> index 29082c6d47..a756f3e8ad 100644
> --- a/block.c
> +++ b/block.c
> @@ -1966,6 +1966,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
>      return bdrv_is_writable_after_reopen(bs, NULL);
>  }
>  
> +static char *bdrv_child_user_desc(BdrvChild *c)
> +{
> +    if (c->klass->get_parent_desc) {
> +        return c->klass->get_parent_desc(c);
> +    }
> +
> +    return g_strdup("another user");
> +}
> +
> +static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
> +{
> +    g_autofree char *user = NULL;
> +    g_autofree char *perm_names = NULL;
> +
> +    if ((b->perm & a->shared_perm) == b->perm) {
> +        return true;
> +    }
> +
> +    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
> +    user = bdrv_child_user_desc(a);
> +    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
> +               "allow '%s' on %s",
> +               user, a->name, perm_names, bdrv_get_node_name(b->bs));
> +
> +    return false;
> +}
> +
> +static bool bdrv_check_parents_compliance(BlockDriverState *bs, Error **errp)
> +{
> +    BdrvChild *a, *b;
> +
> +    /*
> +     * During the loop we'll look at each pair twice. That's correct is

s/is/because/ or what did you mean here?

> +     * bdrv_a_allow_b() is asymmetric and we should check each pair in both
> +     * directions.
> +     */
> +    QLIST_FOREACH(a, &bs->parents, next_parent) {
> +        QLIST_FOREACH(b, &bs->parents, next_parent) {
> +            if (a == b) {
> +                continue;
> +            }
> +
> +            if (!bdrv_a_allow_b(a, b, errp)) {
> +                return false;
> +            }
> +        }
> +    }
> +
> +    return true;
> +}

Kevin


