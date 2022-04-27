Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400451183A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:22:15 +0200 (CEST)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhcU-0006Nd-Dc
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njhb0-0005V1-7V
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njhay-0004g5-DC
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651065639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uB4/VY3cnsmH5DzBYZclhYtusKGD+QcL8HAek3sYbCg=;
 b=dCtdNIMHy1TBZA9X08RrmnAtivBgNzLfh+RO7YjjRrckT2o+qtsibbhv8UxXZisg26Bk7G
 F1nXqBBzNaIDgqClJQryJ+PcZJjvusDTmI4kxgxqhB/4W3jpu4L/gZjJUCuwpykvuSpUdz
 1wOP/XsILyOU5GxrOdHb4ZMjwAFKdB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-YTy__NYHO_WrcxJaYc6XLQ-1; Wed, 27 Apr 2022 09:20:38 -0400
X-MC-Unique: YTy__NYHO_WrcxJaYc6XLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A83E385A5BE;
 Wed, 27 Apr 2022 13:20:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191F12166B4D;
 Wed, 27 Apr 2022 13:20:37 +0000 (UTC)
Date: Wed, 27 Apr 2022 08:20:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/4] qcow2: Do not reopen data_file in invalidate_cache
Message-ID: <20220427132035.cocvmay6fgnuf5tj@redhat.com>
References: <20220427114057.36651-1-hreitz@redhat.com>
 <20220427114057.36651-3-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427114057.36651-3-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 01:40:55PM +0200, Hanna Reitz wrote:
> qcow2_co_invalidate_cache() closes and opens the qcow2 file, by calling
> qcow2_close() and qcow2_do_open().  These two functions must thus be
> usable from both a global-state and an I/O context.
> 
> As they are, they are not safe to call in an I/O context, because they
> use bdrv_unref_child() and bdrv_open_child() to close/open the data_file
> child, respectively, both of which are global-state functions.  When
> used from qcow2_co_invalidate_cache(), we do not need to close/open the
> data_file child, though (we do not do this for bs->file or bs->backing
> either), and so we should skip it in the qcow2_co_invalidate_cache()
> path.
> 
> To do so, add a parameter to qcow2_do_open() and qcow2_close() to make
> them skip handling s->data_file, and have qcow2_co_invalidate_cache()
> exempt it from the memset() on the BDRVQcow2State.
> 
> (Note that the QED driver similarly closes/opens the QED image by
> invoking bdrv_qed_close()+bdrv_qed_do_open(), but both functions seem
> safe to use in an I/O context.)
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/945
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  block/qcow2.c | 104 ++++++++++++++++++++++++++++++--------------------
>  1 file changed, 62 insertions(+), 42 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


