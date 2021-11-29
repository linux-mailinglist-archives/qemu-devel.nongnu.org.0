Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A34623A0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 22:46:14 +0100 (CET)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mroTR-0006lc-9F
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 16:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mroRu-0005wa-Rb; Mon, 29 Nov 2021 16:44:35 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mroRq-0006XH-JE; Mon, 29 Nov 2021 16:44:32 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 3EB1E2E174F;
 Tue, 30 Nov 2021 00:44:19 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 WUC5GjkyjV-iIsSNE0M; Tue, 30 Nov 2021 00:44:19 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638222259; bh=7T0ca5fmk1nK18fTa7thhJa+QHDoB8RzYUP1LFIwQKc=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=D1DwFMpTTF5S57IRtCKSWbjEQkR2Q0Lbx9VtqjMAh6BwK1F2C+X3u9SfroWfXlXYj
 Di9fmoZ6SO+ypf3xYjU5YkOUdURP/13KizwpfH2ccjoswPu2XUS1/klhD8RjtXKYzo
 UJRHw1LNT2mgpznCl2k8zj86NIYNyuACaSRc/h0U=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8132::1:3c])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 GdwWMDNkc9-iIw4qCIJ; Tue, 30 Nov 2021 00:44:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Tue, 30 Nov 2021 00:44:17 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/10] vhost: stick to -errno error return convention
Message-ID: <YaVJsSAPeKj2H97D@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 yc-core@yandex-team.ru, qemu-block@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211128164607-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211128164607-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 28, 2021 at 04:47:20PM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 11, 2021 at 06:33:44PM +0300, Roman Kagan wrote:
> > Error propagation between the generic vhost code and the specific backends is
> > not quite consistent: some places follow "return -1 and set errno" convention,
> > while others assume "return negated errno".  Furthermore, not enough care is
> > taken not to clobber errno.
> > 
> > As a result, on certain code paths the errno resulting from a failure may get
> > overridden by another function call, and then that zero errno inidicating
> > success is propagated up the stack, leading to failures being lost.  In
> > particular, we've seen errors in the communication with a vhost-user-blk slave
> > not trigger an immediate connection drop and reconnection, leaving it in a
> > broken state.
> > 
> > Rework error propagation to always return negated errno on errors and
> > correctly pass it up the stack.
> 
> Hi Roman,
> if there are bugfixes here I'll be happy to take them right now.
> The wholesale rework seems inappropriate for 6.2, I'll be
> happy to tag it for after 6.2. Pls ping me aftre release to help
> make sure it's not lost.

All these patches are bugfixes in one way or another.  That said, none
of the problems being addressed are recent regressions.  OTOH the
patches introduce non-zero churn and change behavior on some error
paths, so I'd suggest to postpone the whole series till after 6.2 is
out.

Thanks,
Roman.

