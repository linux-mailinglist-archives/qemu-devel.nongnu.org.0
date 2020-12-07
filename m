Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1D32D14FB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:44:05 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIgH-0005Qg-1d
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIds-0003qT-3L
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:41:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmIdq-0001dn-PE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607355694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QASlTp6FX1yCFcAFyAdao8pslfnzmsfnIliwT+65HrY=;
 b=Cz9J4X5SjmVY7uy+54n0gk4YA9IuylQHZ4LNjIt9hRa5n9WKfXJSriN/7fms/LaBkEK6Ap
 dHjsDFrWtazWsqrbqZJVZfez61xI/wUCoEmCHW6RZAlRrPtcgL6+CZRRq/+OjAK+vYVYwF
 Xw+qg7djekXYVOIrcbyoi//P808WAVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-j_hWXsxsOw6U7NXj-LJlDw-1; Mon, 07 Dec 2020 10:41:30 -0500
X-MC-Unique: j_hWXsxsOw6U7NXj-LJlDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2AE6CF987;
 Mon,  7 Dec 2020 15:41:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E32075D6AD;
 Mon,  7 Dec 2020 15:41:26 +0000 (UTC)
Date: Mon, 7 Dec 2020 16:41:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] iotests/221: Discard image before qemu-img map
Message-ID: <20201207154125.GE5281@merkur.fritz.box>
References: <20201207152245.66987-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201207152245.66987-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.12.2020 um 16:22 hat Max Reitz geschrieben:
> See the new comment for why this should be done.
> 
> I do not have a reproducer on master, but when using FUSE block exports,
> this test breaks depending on the underlying filesystem (for me, it
> works on tmpfs, but fails on xfs, because the block allocated by
> file-posix has 16 kB there instead of 4 kB).
> 
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin


