Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1631B7A2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:52:40 +0100 (CET)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbUd-0007DC-JB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBbTu-0006me-Lm
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:51:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBbTt-0001YT-0R
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613386312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYY5Jg9wnLbXzPop0ndlZ0ZadkwesoK2qW32ai1FRls=;
 b=JPJk0qMwY3djpl0OVdlf1iwL6WmIzWugfinr3TRZof5b5zD6Owvuc6jzmq2JiihF5LL1YD
 N4e97x2xGN0peu1lfRlWzvJrZkgWx0G3ClQ/2rWsFMe5CbzS9p/TQiGHLFLgxgqt28Vaqo
 Enx/Pg3hYhIx6g5lUkcdU617RjsDH/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-en3XCfTZM9KwMZkEje0NTw-1; Mon, 15 Feb 2021 05:51:50 -0500
X-MC-Unique: en3XCfTZM9KwMZkEje0NTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAB31E56C;
 Mon, 15 Feb 2021 10:51:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B65722C7;
 Mon, 15 Feb 2021 10:51:46 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:51:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: paul@xen.org
Subject: Re: [PATCH] xen-block: fix reporting of discard feature
Message-ID: <20210215105144.GG7226@merkur.fritz.box>
References: <20210118153330.82324-1-roger.pau@citrix.com>
 <00d701d6edb1$894122f0$9bc368d0$@xen.org>
MIME-Version: 1.0
In-Reply-To: <00d701d6edb1$894122f0$9bc368d0$@xen.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, 'Arthur Borsboom' <arthurborsboom@gmail.com>,
 'Max Reitz' <mreitz@redhat.com>, 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Roger Pau Monne' <roger.pau@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.01.2021 um 16:49 hat Paul Durrant geschrieben:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 18 January 2021 15:34
> > To: qemu-devel@nongnu.org
> > Cc: Roger Pau Monne <roger.pau@citrix.com>; Arthur Borsboom <arthurborsboom@gmail.com>; Stefano
> > Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul Durrant
> > <paul@xen.org>; Kevin Wolf <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; xen-
> > devel@lists.xenproject.org; qemu-block@nongnu.org
> > Subject: [PATCH] xen-block: fix reporting of discard feature
> > 
> > Linux blkfront expects both "discard-granularity" and
> > "discard-alignment" present on xenbus in order to properly enable the
> > feature, not exposing "discard-alignment" left some Linux blkfront
> > versions with a broken discard setup. This has also been addressed in
> > Linux with:
> > 
> > https://lore.kernel.org/lkml/20210118151528.81668-1-roger.pau@citrix.com/T/#u
> > 
> > Fix QEMU to report a "discard-alignment" of 0, in order for it to work
> > with older Linux frontends.
> > 
> > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, applied to the block branch.

Kevin


