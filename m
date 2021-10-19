Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B93843369E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 15:03:28 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcom6-0006Bt-Re
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 09:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcokG-0005Kc-Fd
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcok2-0003CX-FW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 09:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634648473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+m/TQyDqZskOb3huxf8DufeWst6wvhY0B2lMQw83TKQ=;
 b=F/REaT6CpKo4xU2WsovaZKTb/oREAb4JeoB0JQMXmzjYnZs6x0b9oam0WhIpskgeotyqbI
 z9iCaeA8j6UvSgmUTJHVbBOeY863QerrgDzQm28Oy8Wq5a0zPyQtfjlNFE6lVRgIgS032h
 RbvPpezqTWEbVcck7q2G2Iu+iMeTLBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-jhlEBnshPwWC3Wo9Ky3nnQ-1; Tue, 19 Oct 2021 09:01:12 -0400
X-MC-Unique: jhlEBnshPwWC3Wo9Ky3nnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E714C101B4A4;
 Tue, 19 Oct 2021 13:01:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D1560C82;
 Tue, 19 Oct 2021 13:00:56 +0000 (UTC)
Date: Tue, 19 Oct 2021 15:00:55 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V5] block/rbd: implement bdrv_co_block_status
Message-ID: <YW7BhwgzolMCL5CF@redhat.com>
References: <20211012152231.24868-1-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20211012152231.24868-1-pl@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: idryomov@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-devel@nongnu.org, pbonzini@redhat.com,
 idryomov@gmail.com, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.10.2021 um 17:22 hat Peter Lieven geschrieben:
> the qemu rbd driver currently lacks support for bdrv_co_block_status.
> This results mainly in incorrect progress during block operations (e.g.
> qemu-img convert with an rbd image as source).
> 
> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
> allocated and unallocated (all zero areas).
> 
> To avoid querying the ceph OSDs for the answer this is only done if
> the image has the fast-diff feature which depends on the object-map and
> exclusive-lock features. In this case it is guaranteed that the information
> is present in memory in the librbd client and thus very fast.
> 
> If fast-diff is not available all areas are reported to be allocated
> which is the current behaviour if bdrv_co_block_status is not implemented.
> 
> Signed-off-by: Peter Lieven <pl@kamp.de>

Thanks, applied to the block branch.

Kevin


