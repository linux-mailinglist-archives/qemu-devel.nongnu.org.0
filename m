Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6A36E7F8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 11:28:10 +0200 (CEST)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc2xs-0002p4-Vy
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 05:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc2wX-0002M6-8L
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc2wU-0000HE-IU
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 05:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619688401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvAc6h8/gIMgHWbJYPVmfnIXVgMqpeuVd/cae6SkhGg=;
 b=N7BJcAyPkOBj5b42EPpVbgGtiQRAw4bWapJOd/gEbwIBfbOwYVay73DRYrN13yvR2Fae+K
 S4HuDv41pvhzWaa3662H8pV3UVTQ28gsN4pU/AsO8qi2mC3PTdYnD4sGpZ6+0Q4H8jXkCr
 2SVgky9li6GaR2s1Gprkgm2ct+lnZ9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Fw35UJ-vO5GBiTyrKqMk5w-1; Thu, 29 Apr 2021 05:26:38 -0400
X-MC-Unique: Fw35UJ-vO5GBiTyrKqMk5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3532E107ACC7;
 Thu, 29 Apr 2021 09:26:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7EBB5DAA5;
 Thu, 29 Apr 2021 09:26:30 +0000 (UTC)
Date: Thu, 29 Apr 2021 11:26:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH 2/5] vhost-user-blk: Use Error more consistently
Message-ID: <YIp7xcFS5eqq4XHE@merkur.fritz.box>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-3-kwolf@redhat.com>
 <20210428180847.GB20148@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20210428180847.GB20148@raphael-debian-dev>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.04.2021 um 20:08 hat Raphael Norwitz geschrieben:
> Code looks ok - question about the commit message.
> 
> Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> 
> On Thu, Apr 22, 2021 at 07:02:18PM +0200, Kevin Wolf wrote:
> > Now that vhost_user_blk_connect() is not called from an event handler
> > any more, but directly from vhost_user_blk_device_realize(), we don't
> > have to resort to error_report() any more, but can use Error again.
> 
> vhost_user_blk_connect() is still called by vhost_user_blk_event() which
> is registered as an event handler. I don't understand your point around
> us having had to use error_report() before, but not anymore. Can you
> clarify?

What I meant is that vhost_user_blk_event() can't really make use of an
Error object other than passing it to error_report_err(), which has the
same result as directly using error_report().

With the new code where vhost_user_blk_device_realize() calls the
function directly, we can actually return the error to its caller so
that it ends up in the QMP result or the command line error message.

The result is still not great because vhost_user_blk_connect() doesn't
know the original error message. We'd have to add Error to
vhost_dev_init() and the functions that it calls to get the real error
messages, but at least it's a first step in the right direction.

We already figured that we need to change error reporting so we can know
whether we should retry, so I guess this can be solved at the same time.

Kevin


