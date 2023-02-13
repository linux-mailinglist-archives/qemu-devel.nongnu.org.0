Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD95694467
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWys-0005Ss-Ga; Mon, 13 Feb 2023 06:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWyp-0005Rf-3U
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pRWym-0000Rc-A2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676287597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pC/Ar1E5Q+BGDw71oHr+IXrP99FpcjicxJmmzGEI5dE=;
 b=QUpdYsIzNdwVOIV5+3iK34eIkiVYtaBGv8F7Ir7O1mpMuodeue6Ow15SfdyXB+FKyQzp3S
 X4ZakPpXcrA7tr54HVnPGFt4PRbIaNzNXvZfFUsO3bV4K7Ls9vVQy8fZBBxUZBfdTVSxbQ
 FPl+XnOwq079vlg9t4crukC5/GK7EY0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-Fo-enUV-PfO2aYJkjL9RvQ-1; Mon, 13 Feb 2023 06:26:26 -0500
X-MC-Unique: Fo-enUV-PfO2aYJkjL9RvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8266B1818E6A;
 Mon, 13 Feb 2023 11:26:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C7D2166B26;
 Mon, 13 Feb 2023 11:26:25 +0000 (UTC)
Date: Mon, 13 Feb 2023 12:26:24 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: hreitz@redhat.com, eesposit@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 00/13] block: Fix bdrv_open*() calls from coroutine context
Message-ID: <Y+oeYHYAK24+/A0Z@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 26.01.2023 um 18:24 hat Kevin Wolf geschrieben:
> bdrv_open*() must not be called from coroutine context, amongst others
> because it modifies the block graph. However, some functions - in
> particular all .bdrv_co_create* implementations of image formats - do
> call it from coroutine context. This is already wrong today, but when we
> add locking, it actually becomes visible.
> 
> This series adds no_co_wrapper functions, which are automatically
> generated wrappers that run in coroutine context and use a BH to call
> the wrapped function outside of coroutine context. It then uses these
> wrappers to fix the problematic bdrv_open*() calls.

Thanks for the review, fixed up the missing coroutine_fn in patch 3 (as
pointed out by Emanuele) and applied to the block branch.

Kevin


