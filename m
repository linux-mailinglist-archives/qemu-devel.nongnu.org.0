Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81934D345
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:05:16 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtS7-0001Tm-UN
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtOm-00082M-1o
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lQtOf-0002FS-ME
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617030099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UAKvDyr8D2MH3gvwKT0x2RpR5H6sn7zXu2054FKNYEw=;
 b=YNPAmaXJ5NA/NmCES3vxx113leLkTxc9/kX/iMEqiLK63tYNIIxpkHV9S9lT6ArD8UIl0c
 TpxpZRNrPrV6wgZMlpJLz2fP6y6q4weB3EsEyXK1ao1KH957QmUnkuL2B0bEs08p5kmUgx
 2MYWmImk0eauGDKpsft4O4MYgxCaaCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-giuDC6xVPpuJgLciK70ZxQ-1; Mon, 29 Mar 2021 11:01:38 -0400
X-MC-Unique: giuDC6xVPpuJgLciK70ZxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA97F83DD21;
 Mon, 29 Mar 2021 15:01:35 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-72.ams2.redhat.com
 [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E7DF5D9D3;
 Mon, 29 Mar 2021 15:01:30 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/rbd: fix memory leaks
Date: Mon, 29 Mar 2021 17:01:27 +0200
Message-Id: <20210329150129.121182-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Florian Florensa <fflorensa@online.net>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes two memory leaks, found through valgrind, in the
rbd driver.

Stefano Garzarella (2):
  block/rbd: fix memory leak in qemu_rbd_connect()
  block/rbd: fix memory leak in qemu_rbd_co_create_opts()

 block/rbd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.30.2


