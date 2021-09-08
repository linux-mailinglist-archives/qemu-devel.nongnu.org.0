Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C70403B4C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:16:36 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyNP-0004nW-LB
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mNyIR-00088S-F6
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mNyIO-0008IO-Q4
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631110283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NOg26o5Z8jYznkKW+hOb5RkKD6p4RAISczwAwG75/sw=;
 b=N5/GqUYRznNHg8RNVdPhZUrhLIa9y9l4gc5Lw3DY+9h9nJ8OaM4DaLNN7nbaHQ4BzyBliL
 xpt+STlsFcWYBjLg/4xdKBqA8mv6kUrrDkW8zqEcFqoGJ4wpO4YRJPImgOnyknrzSELUGT
 bdHawk9wEWpCpKn+0dC2wBPYhWIRJyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-dw-KyV-rOkKjdeFWqtdFWg-1; Wed, 08 Sep 2021 10:11:22 -0400
X-MC-Unique: dw-KyV-rOkKjdeFWqtdFWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD9B1017965;
 Wed,  8 Sep 2021 14:11:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA77E5C1BB;
 Wed,  8 Sep 2021 14:11:20 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:11:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Guillaume Roche <groche@genymobile.com>
Subject: Re: [PATCH] block/vvfat: Fix ro shared folder
Message-ID: <YTjEh+ubHuoQur3e@redhat.com>
References: <20210831141727.347597-1-groche@genymobile.com>
MIME-Version: 1.0
In-Reply-To: <20210831141727.347597-1-groche@genymobile.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.08.2021 um 16:17 hat Guillaume Roche geschrieben:
> QEMU exits in error when passing a vfat shared folder in read-only mode.
> 
> To fix this issue, this patch removes any potential write permission
> from cumulative_perms, when a read-only block device is in use.
> 
> Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=918950
> 
> Signed-off-by: Guillaume Roche <groche@genymobile.com>
> ---
> This is an attempt to fix this behavior, but it feels a bit hacky to me
> since this patch checks for the vvfat format in a generic function.
> 
> However, I'd be glad to have some advice to make it better. Anyway, I
> ran the block tests to ensure this does not introduce any regression.
> 
> To add some context: I know that this can be worked around by setting 
> the shared folder in rw mode. But our use-case requires using both
> shared and VM snapshots, and QEMU prevents using snapshot with a rw 
> shared folder.

I don't think the behaviour is actually a bug: ide-hd requires a
writable backend, so attaching a read-only vvfat node is a real error.

You can either specify -drive read-only=on and use a device that can
accept read-only backends (such as virtio-blk or ide-cd), or add a
temporary writable qcow2 overlay with -snapshot or -drive snapshot=on so
that the ide-hd device actually does get the writable backend it needs.

Kevin


