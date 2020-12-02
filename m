Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC982CC0CE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:29:52 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU4l-0007QL-Sj
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU24-0005k1-Cb
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU22-00042g-G1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPVhlieJZjI5dUsg4mXlWox9fLe5bNs3rgVncgUdYNs=;
 b=V3BlPWTJjaBDEvKSawRW9EGcXo8xOhEw1lkQ1RfSbIMS8bU8f/e0sMiOiPI2yXaGWDuLmJ
 a+GWqA5dbVzbBIeF2Yb8WosbJgaG+GIkTwmjmzy4za2ikQ9FFUzh8j3aUPthKWdT3ufJF9
 1rH3yYhPscNKTbVEqe1q4DobVYs1Gv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-vX1BCKCcM7mLz5aRaCYj_A-1; Wed, 02 Dec 2020 10:27:00 -0500
X-MC-Unique: vX1BCKCcM7mLz5aRaCYj_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8E081005E57;
 Wed,  2 Dec 2020 15:26:57 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2FF460854;
 Wed,  2 Dec 2020 15:26:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] contrib/vhost-user-gpu: avoid g_return_val_if() input
 validation
Date: Wed,  2 Dec 2020 15:26:09 +0000
Message-Id: <20201202152611.677753-3-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-1-stefanha@redhat.com>
References: <20201202152611.677753-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG8gbm90IHZhbGlkYXRlIGlucHV0IHdpdGggZ19yZXR1cm5fdmFsX2lmKCkuIFRoaXMgQVBJIGlz
IGludGVuZGVkIGZvcgpjaGVja2luZyBwcm9ncmFtbWluZyBlcnJvcnMgYW5kIGlzIGNvbXBpbGVk
IG91dCB3aXRoIC1ER19ESVNBQkxFX0NIRUNLUy4KClVzZSBhbiBleHBsaWNpdCBpZiBzdGF0ZW1l
bnQgZm9yIGlucHV0IHZhbGlkYXRpb24gc28gaXQgY2Fubm90CmFjY2lkZW50YWxseSBiZSBjb21w
aWxlZCBvdXQuCgpTdWdnZXN0ZWQtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIGNvbnRyaWIvdmhvc3QtdXNlci1ncHUvdmhvc3QtdXNlci1ncHUuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvY29udHJpYi92aG9zdC11c2VyLWdwdS92aG9zdC11c2VyLWdwdS5jIGIvY29udHJpYi92
aG9zdC11c2VyLWdwdS92aG9zdC11c2VyLWdwdS5jCmluZGV4IGEwMTlkMGE5YWMuLjUzNGJhZDI0
ZDEgMTAwNjQ0Ci0tLSBhL2NvbnRyaWIvdmhvc3QtdXNlci1ncHUvdmhvc3QtdXNlci1ncHUuYwor
KysgYi9jb250cmliL3Zob3N0LXVzZXItZ3B1L3Zob3N0LXVzZXItZ3B1LmMKQEAgLTEwNDQsNyAr
MTA0NCwxMSBAQCB2Z19nZXRfY29uZmlnKFZ1RGV2ICpkZXYsIHVpbnQ4X3QgKmNvbmZpZywgdWlu
dDMyX3QgbGVuKQogewogICAgIFZ1R3B1ICpnID0gY29udGFpbmVyX29mKGRldiwgVnVHcHUsIGRl
di5wYXJlbnQpOwogCi0gICAgZ19yZXR1cm5fdmFsX2lmX2ZhaWwobGVuIDw9IHNpemVvZihzdHJ1
Y3QgdmlydGlvX2dwdV9jb25maWcpLCAtMSk7CisgICAgaWYgKGxlbiA+IHNpemVvZihzdHJ1Y3Qg
dmlydGlvX2dwdV9jb25maWcpKSB7CisgICAgICAgIGdfY3JpdGljYWwoIiVzOiBsZW4gJXUgaXMg
bGFyZ2VyIHRoYW4gJXp1IiwKKyAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgbGVuLCBzaXpl
b2Yoc3RydWN0IHZpcnRpb19ncHVfY29uZmlnKSk7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9
CiAKICAgICBpZiAob3B0X3ZpcmdsKSB7CiAgICAgICAgIGctPnZpcnRpb19jb25maWcubnVtX2Nh
cHNldHMgPSB2Z192aXJnbF9nZXRfbnVtX2NhcHNldHMoKTsKLS0gCjIuMjguMAoK


