Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08982CC0CD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:29:40 +0100 (CET)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU4Z-0007Et-N9
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU1t-0005V8-S5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:26:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU1p-000411-S0
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4f4fF+jza61JyObyzKSwizPk2hRlmVl4AjLmXsZW5sQ=;
 b=LJrARZMJr7mMAA+gGVjEfvonrQQyN2BK4fzfyRh0KrjtxGHjtpP7Vr6eBx70qF24Xk8+il
 2i/msA3U1Bx+wxQADUateuX+QSUU32RBQRM5rhSCEcakqoH/zhK25mclqxHZlIf8+DIZ6+
 cO2LB++QtGcSSkxwz+kRtKFsk709kq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-C0d1ZxSkNa--IG19JFHvyA-1; Wed, 02 Dec 2020 10:26:45 -0500
X-MC-Unique: C0d1ZxSkNa--IG19JFHvyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524948042AC;
 Wed,  2 Dec 2020 15:26:44 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E64BE19C48;
 Wed,  2 Dec 2020 15:26:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] contrib/vhost-user-blk: avoid g_return_val_if() input
 validation
Date: Wed,  2 Dec 2020 15:26:08 +0000
Message-Id: <20201202152611.677753-2-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-1-stefanha@redhat.com>
References: <20201202152611.677753-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
PgotLS0KIGNvbnRyaWIvdmhvc3QtdXNlci1ibGsvdmhvc3QtdXNlci1ibGsuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvY29udHJpYi92aG9zdC11c2VyLWJsay92aG9zdC11c2VyLWJsay5jIGIvY29udHJpYi92
aG9zdC11c2VyLWJsay92aG9zdC11c2VyLWJsay5jCmluZGV4IGRjOTgxYmY5NDUuLjYwZTNjOWVk
MzcgMTAwNjQ0Ci0tLSBhL2NvbnRyaWIvdmhvc3QtdXNlci1ibGsvdmhvc3QtdXNlci1ibGsuYwor
KysgYi9jb250cmliL3Zob3N0LXVzZXItYmxrL3Zob3N0LXVzZXItYmxrLmMKQEAgLTQwNCw3ICs0
MDQsMTEgQEAgdnViX2dldF9jb25maWcoVnVEZXYgKnZ1X2RldiwgdWludDhfdCAqY29uZmlnLCB1
aW50MzJfdCBsZW4pCiAgICAgVnVnRGV2ICpnZGV2OwogICAgIFZ1YkRldiAqdmRldl9ibGs7CiAK
LSAgICBnX3JldHVybl92YWxfaWZfZmFpbChsZW4gPD0gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxr
X2NvbmZpZyksIC0xKTsKKyAgICBpZiAobGVuID4gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2Nv
bmZpZykpIHsKKyAgICAgICAgZnByaW50ZihzdGRlcnIsICJJbnZhbGlkIGdldF9jb25maWcgbGVu
ICV1LCBleHBlY3RlZCA8PSAlenVcbiIsCisgICAgICAgICAgICAgICAgbGVuLCBzaXplb2Yoc3Ry
dWN0IHZpcnRpb19ibGtfY29uZmlnKSk7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CiAKICAg
ICBnZGV2ID0gY29udGFpbmVyX29mKHZ1X2RldiwgVnVnRGV2LCBwYXJlbnQpOwogICAgIHZkZXZf
YmxrID0gY29udGFpbmVyX29mKGdkZXYsIFZ1YkRldiwgcGFyZW50KTsKLS0gCjIuMjguMAoK


