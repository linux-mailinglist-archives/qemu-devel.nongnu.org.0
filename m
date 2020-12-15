Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFDB2DAC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 13:03:46 +0100 (CET)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp93R-00065O-64
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 07:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp8yM-0002kG-Mu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:58:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kp8yK-0004F8-JX
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608033506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xQncgaDlvRlYMFtHSjAoEgnBxR0gZjfPlDQMbTR0GW8=;
 b=K4c2O2DjUzFauBl1SAYDmTEOIrCmPmsuPP1wyXAIkN2mbPD4zJaHBF5zC+Lam2thgu/ZCa
 fHi+ZvwF4aj26kbNRiWxsNLJlU/gCbFtJmaSTLNQUJiyzmngkXBUUu2GHiu0j3+o18RsRD
 uUtNtoNhWOtD/ctPEfaA4X8IaCuW234=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-IpJsG-4QN5y60YuRWvO2tg-1; Tue, 15 Dec 2020 06:58:23 -0500
X-MC-Unique: IpJsG-4QN5y60YuRWvO2tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD3371922961;
 Tue, 15 Dec 2020 11:58:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A94AB10074EF;
 Tue, 15 Dec 2020 11:58:06 +0000 (UTC)
Date: Tue, 15 Dec 2020 12:58:04 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v2 1/4] block: Honor blk_set_aio_context() context
 requirements
Message-ID: <20201215115804.GC8185@merkur.fritz.box>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-2-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-2-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> The documentation for bdrv_set_aio_context_ignore() states this:
> 
>  * The caller must own the AioContext lock for the old AioContext of bs, but it
>  * must not own the AioContext lock for new_context (unless new_context is the
>  * same as the current context of bs).
> 
> As blk_set_aio_context() makes use of this function, this rule also
> applies to it.
> 
> Fix all occurrences where this rule wasn't honored.
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


