Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54094F3C82
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 18:10:51 +0200 (CEST)
Received: from localhost ([::1]:33600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbllY-0008T8-I0
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 12:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nbljj-00075s-0R
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 12:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nbljg-00077e-47
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 12:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649174930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7r5TPGIwJiyN4Wa9L1EkyDfkVvhMk7CY56CG7O6262g=;
 b=YCk/7LHWA2UssMRCtV6n/XHqEjYtGA3fQzQvoKsVbejFctl6Dj8SvR/5juoLFAjrgJtdpI
 FhK7tR9G2mRGelzmkB944KieeMbm6rZvwL20OWSdYtjZQdpvQgCkW9YSFSdbufMSQS9O7N
 yoY6vJQK/uKf+gBgEcvHehS96Wb6Bso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-_pPKwB2FOyWHkJAprmxA_g-1; Tue, 05 Apr 2022 12:08:49 -0400
X-MC-Unique: _pPKwB2FOyWHkJAprmxA_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19DBB19705A9;
 Tue,  5 Apr 2022 16:08:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDE4120296B6;
 Tue,  5 Apr 2022 16:08:44 +0000 (UTC)
Date: Tue, 5 Apr 2022 11:08:42 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 3/3] qcow2: Add errp to rebuild_refcount_structure()
Message-ID: <20220405160842.cyeg2qn7qyyxquyx@redhat.com>
References: <20220405134652.19278-1-hreitz@redhat.com>
 <20220405134652.19278-4-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220405134652.19278-4-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-539-2bb233
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 05, 2022 at 03:46:52PM +0200, Hanna Reitz wrote:
> Instead of fprint()-ing error messages in rebuild_refcount_structure()
> and its rebuild_refcounts_write_refblocks() helper, pass them through an
> Error object to qcow2_check_refcounts() (which will then print it).
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/qcow2-refcount.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index c5669eaa51..ed0ecfaa89 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -2465,7 +2465,8 @@ static int64_t alloc_clusters_imrt(BlockDriverState *bs,
>  static int rebuild_refcounts_write_refblocks(
>          BlockDriverState *bs, void **refcount_table, int64_t *nb_clusters,
>          int64_t first_cluster, int64_t end_cluster,
> -        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr
> +        uint64_t **on_disk_reftable_ptr, uint32_t *on_disk_reftable_entries_ptr,
> +        Error **errp
>      )
>  {
>      BDRVQcow2State *s = bs->opaque;
> @@ -2516,8 +2517,8 @@ static int rebuild_refcounts_write_refblocks(
>                                                    nb_clusters,
>                                                    &first_free_cluster);
>              if (refblock_offset < 0) {
> -                fprintf(stderr, "ERROR allocating refblock: %s\n",
> -                        strerror(-refblock_offset));
> +                error_setg_errno(errp, -refblock_offset,
> +                                 "ERROR allocating refblock");

Most uses of error_setg* don't ALL_CAPS the first word.  But this is
pre-existing, so I'm not insisting you change it here.

>                  return refblock_offset;
>              }
>  
> @@ -2539,6 +2540,7 @@ static int rebuild_refcounts_write_refblocks(
>                                    on_disk_reftable_entries *
>                                    REFTABLE_ENTRY_SIZE);
>                  if (!on_disk_reftable) {
> +                    error_setg(errp, "ERROR allocating reftable memory");
>                      return -ENOMEM;

Ah, so this is also a corner case bug fix, where we didn't have a
message on all error paths.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


