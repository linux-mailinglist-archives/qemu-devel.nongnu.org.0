Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF42B7A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:19:11 +0100 (CET)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJcM-0006a3-Kf
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJb6-00059I-TT
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:17:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kfJb5-0003jz-A6
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605691070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRG1RXW8GZlRp5NVquq5gN1UIHhe7RO2Kv/LicCH7m4=;
 b=gC+I/e/xivEW/+yVIuEe0Znm88k9yOl2yTTG6le7uNw0oVqwYWrcx3Dx+8h/jtdWDJUmhF
 osiBwiPi1dwWWZcc6JjUGp4YEQFmc8gO2aehUyxxdac7hApVY4421mWi1zQ+BxbUTQHD6Z
 hetiMGABwKq6q0ThVtU2N3+Tw0vCVps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Bi1y73EIPdmFJ_125DtCPA-1; Wed, 18 Nov 2020 04:17:48 -0500
X-MC-Unique: Bi1y73EIPdmFJ_125DtCPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891A2100855F;
 Wed, 18 Nov 2020 09:17:47 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AC17196FB;
 Wed, 18 Nov 2020 09:17:33 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] contrib/vhost-user-gpu: avoid g_return_val_if() input
 validation
Date: Wed, 18 Nov 2020 09:16:42 +0000
Message-Id: <20201118091644.199527-3-stefanha@redhat.com>
In-Reply-To: <20201118091644.199527-1-stefanha@redhat.com>
References: <20201118091644.199527-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG8gbm90IHZhbGlkYXRlIGlucHV0IHdpdGggZ19yZXR1cm5fdmFsX2lmKCkuIFRoaXMgQVBJIGlz
IGludGVuZGVkIGZvcgpjaGVja2luZyBwcm9ncmFtbWluZyBlcnJvcnMgYW5kIGlzIGNvbXBpbGVk
IG91dCB3aXRoIC1ER19ESVNBQkxFX0NIRUNLUy4KClVzZSBhbiBleHBsaWNpdCBpZiBzdGF0ZW1l
bnQgZm9yIGlucHV0IHZhbGlkYXRpb24gc28gaXQgY2Fubm90CmFjY2lkZW50YWxseSBiZSBjb21w
aWxlZCBvdXQuCgpTdWdnZXN0ZWQtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29t
PgotLS0KIGNvbnRyaWIvdmhvc3QtdXNlci1ncHUvdmhvc3QtdXNlci1ncHUuYyB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2NvbnRyaWIvdmhvc3QtdXNlci1ncHUvdmhvc3QtdXNlci1ncHUuYyBiL2NvbnRyaWIvdmhv
c3QtdXNlci1ncHUvdmhvc3QtdXNlci1ncHUuYwppbmRleCBhMDE5ZDBhOWFjLi5mNDQ1ZWYyOGVj
IDEwMDY0NAotLS0gYS9jb250cmliL3Zob3N0LXVzZXItZ3B1L3Zob3N0LXVzZXItZ3B1LmMKKysr
IGIvY29udHJpYi92aG9zdC11c2VyLWdwdS92aG9zdC11c2VyLWdwdS5jCkBAIC0xMDQ0LDcgKzEw
NDQsOSBAQCB2Z19nZXRfY29uZmlnKFZ1RGV2ICpkZXYsIHVpbnQ4X3QgKmNvbmZpZywgdWludDMy
X3QgbGVuKQogewogICAgIFZ1R3B1ICpnID0gY29udGFpbmVyX29mKGRldiwgVnVHcHUsIGRldi5w
YXJlbnQpOwogCi0gICAgZ19yZXR1cm5fdmFsX2lmX2ZhaWwobGVuIDw9IHNpemVvZihzdHJ1Y3Qg
dmlydGlvX2dwdV9jb25maWcpLCAtMSk7CisgICAgaWYgKGxlbiA+IHNpemVvZihzdHJ1Y3Qgdmly
dGlvX2dwdV9jb25maWcpKSB7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CiAKICAgICBpZiAo
b3B0X3ZpcmdsKSB7CiAgICAgICAgIGctPnZpcnRpb19jb25maWcubnVtX2NhcHNldHMgPSB2Z192
aXJnbF9nZXRfbnVtX2NhcHNldHMoKTsKLS0gCjIuMjguMAoK


