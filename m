Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD721DDFF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 18:57:37 +0200 (CEST)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv1lo-0002ty-RA
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 12:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jv1l1-0002UQ-2D
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:56:47 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27850
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jv1ky-0007rX-EN
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 12:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594659403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1FJQeaTOIgHy3nBz/pffDMJv5BxjWnXhQ39QhULKEo=;
 b=X0p0kkcMH+0r73Q/dZT73o7plMNiwvLtYhdj8jNs9M8sHNbUwhEU5kqKCb/jyU26OZxeFN
 Jmx/AWPT6HqhWveY/tJ7QUce4e91D260Q9IDPlytbiErA6OAyVDojK5hudRLGUhWJXxiqT
 L1hm3S7Rr1CxU1p+lxGrPlftYqrntFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-Cx8Y3EEDPj28u3fxeiECPQ-1; Mon, 13 Jul 2020 12:56:41 -0400
X-MC-Unique: Cx8Y3EEDPj28u3fxeiECPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C14C800400;
 Mon, 13 Jul 2020 16:56:40 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-91.ams2.redhat.com [10.36.114.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 543305D9DC;
 Mon, 13 Jul 2020 16:56:39 +0000 (UTC)
Date: Mon, 13 Jul 2020 18:56:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH for-5.1 1/2] block: Require aligned image size to avoid
 assertion failure
Message-ID: <20200713165637.GH10318@linux.fritz.box>
References: <20200710142149.40962-1-kwolf@redhat.com>
 <20200710142149.40962-2-kwolf@redhat.com>
 <CAMRbyyux0eQo8vmz4JB8pT_1i4PJviQJPKiaJC6ehwjLhc649A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyux0eQo8vmz4JB8pT_1i4PJviQJPKiaJC6ehwjLhc649A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.07.2020 um 18:33 hat Nir Soffer geschrieben:
> On Fri, Jul 10, 2020 at 5:22 PM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Unaligned requests will automatically be aligned to bl.request_alignment
> > and we don't want to extend requests to access space beyond the end of
> > the image, so it's required that the image size is aligned.
> >
> > With write requests, this could cause assertion failures like this if
> > RESIZE permissions weren't requested:
> >
> > qemu-img: block/io.c:1910: bdrv_co_write_req_prepare: Assertion `end_sector <= bs->total_sectors || child->perm & BLK_PERM_RESIZE' failed.
> >
> > This was e.g. triggered by qemu-img converting to a target image with 4k
> > request alignment when the image was only aligned to 512 bytes, but not
> > to 4k.
> 
> Was it on NFS? Shouldn't this be fix by the next patch then?

Patch 2 makes the problem go away for NFS because NFS doesn't even
require the 4k alignment. But on storage that legitimately needs 4k
alignment (or possibly other filesystems that are misdetected), you
would still hit the same problem.

Kevin


