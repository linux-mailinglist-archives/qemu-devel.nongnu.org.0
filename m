Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFB350231
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 16:28:54 +0200 (CEST)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRbq1-00076k-1I
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 10:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRbor-0006bH-Lz
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRbon-0005s4-Hw
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617200855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qMdZN+A50oAa5Pg2GR3WaK2FI9glbASRQXnmOxDEiBA=;
 b=Er5GvN9x/7mg2cUeD6X8k4mLhSSE6G8hgUsBWeDTWkNMCHxceJ7sL3AdOl4gtjDk57m2ye
 Cm4uAIRj10W4CCqFtkVLXLkO3g5o85DCcuysY1frReYQBrdyrNnzopL3A8Ysa6bfth2zwk
 ju0F40BlfpQZuq4KlOG9WWU6OESJrtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-MXrbH_i-O6afERIB374osg-1; Wed, 31 Mar 2021 10:27:33 -0400
X-MC-Unique: MXrbH_i-O6afERIB374osg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DCF280067;
 Wed, 31 Mar 2021 14:27:32 +0000 (UTC)
Received: from localhost (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD75019C44;
 Wed, 31 Mar 2021 14:27:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/export: improve vu_blk_sect_range_ok()
Date: Wed, 31 Mar 2021 15:27:27 +0100
Message-Id: <20210331142727.391465-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGNoZWNrcyBpbiB2dV9ibGtfc2VjdF9yYW5nZV9vaygpIGFzc3VtZSBWSVJUSU9fQkxLX1NF
Q1RPUl9TSVpFIGlzCmVxdWFsIHRvIEJEUlZfU0VDVE9SX1NJWkUuIFRoaXMgaXMgdHJ1ZSwgYnV0
IGxldCdzIGFkZCBhClFFTVVfQlVJTERfQlVHX09OKCkgdG8gbWFrZSBpdCBleHBsaWNpdC4KCldl
IG1pZ2h0IGFzIHdlbGwgY2hlY2sgdGhhdCB0aGUgcmVxdWVzdCBidWZmZXIgc2l6ZSBpcyBhIG11
bHRpcGxlIG9mClZJUlRJT19CTEtfU0VDVE9SX1NJWkUgd2hpbGUgd2UncmUgYXQgaXQuCgpTdWdn
ZXN0ZWQtYnk6IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0
ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBibG9jay9leHBvcnQvdmhv
c3QtdXNlci1ibGstc2VydmVyLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2V4cG9ydC92aG9z
dC11c2VyLWJsay1zZXJ2ZXIuYyBiL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIu
YwppbmRleCBmYTA2OTk2ZDM3Li4xODYyNTYzMzM2IDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQv
dmhvc3QtdXNlci1ibGstc2VydmVyLmMKKysrIGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxr
LXNlcnZlci5jCkBAIC03MCw5ICs3MCwxNiBAQCBzdGF0aWMgdm9pZCB2dV9ibGtfcmVxX2NvbXBs
ZXRlKFZ1QmxrUmVxICpyZXEpCiBzdGF0aWMgYm9vbCB2dV9ibGtfc2VjdF9yYW5nZV9vayhWdUJs
a0V4cG9ydCAqdmV4cCwgdWludDY0X3Qgc2VjdG9yLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZV90IHNpemUpCiB7Ci0gICAgdWludDY0X3QgbmJfc2VjdG9ycyA9IHNpemUg
Pj4gQkRSVl9TRUNUT1JfQklUUzsKKyAgICB1aW50NjRfdCBuYl9zZWN0b3JzOwogICAgIHVpbnQ2
NF90IHRvdGFsX3NlY3RvcnM7CiAKKyAgICBpZiAoc2l6ZSAlIFZJUlRJT19CTEtfU0VDVE9SX1NJ
WkUpIHsKKyAgICAgICAgcmV0dXJuIGZhbHNlOworICAgIH0KKworICAgIG5iX3NlY3RvcnMgPSBz
aXplID4+IFZJUlRJT19CTEtfU0VDVE9SX0JJVFM7CisKKyAgICBRRU1VX0JVSUxEX0JVR19PTihC
RFJWX1NFQ1RPUl9TSVpFICE9IFZJUlRJT19CTEtfU0VDVE9SX1NJWkUpOwogICAgIGlmIChuYl9z
ZWN0b3JzID4gQkRSVl9SRVFVRVNUX01BWF9TRUNUT1JTKSB7CiAgICAgICAgIHJldHVybiBmYWxz
ZTsKICAgICB9Ci0tIAoyLjMwLjIKCg==


