Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9C322CF2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:56:49 +0100 (CET)
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZ7I-0007bW-Ov
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEZ0n-0007nM-Dp
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEZ0l-0003Hn-Nb
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upKVBedJ0skPxF7fKkioEt6tKB9mTkPoP7mf5Bog2JA=;
 b=eHMmDZDKM1xFHTqsZN0YXKSovvGGWH3Q2DFsYsg9jT/4a9V1EVMKpaqnljHy0Rlw5xd2Ti
 Mb8w8z6g04DX/cKHlnueSwSMENUVukgP8lzrTLJQKTZx1S7j669nnU7cB7/uiP7BQOGswn
 FHwJ6DH9zBqN1UUaHEnLRlB8kddcZHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-_HUPCavUN4yQiU-5CmmYXw-1; Tue, 23 Feb 2021 09:49:53 -0500
X-MC-Unique: _HUPCavUN4yQiU-5CmmYXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A9CC806675;
 Tue, 23 Feb 2021 14:48:21 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE54A1002391;
 Tue, 23 Feb 2021 14:48:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] block/export: use VIRTIO_BLK_SECTOR_BITS
Date: Tue, 23 Feb 2021 14:46:49 +0000
Message-Id: <20210223144653.811468-9-stefanha@redhat.com>
In-Reply-To: <20210223144653.811468-1-stefanha@redhat.com>
References: <20210223144653.811468-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VXNlIFZJUlRJT19CTEtfU0VDVE9SX0JJVFMgYW5kIFZJUlRJT19CTEtfU0VDVE9SX1NJWkUgd2hl
biBkZWFsaW5nIHdpdGgKdmlydGlvLWJsayBzZWN0b3IgbnVtYmVycy4gQWx0aG91Z2ggdGhlIHZh
bHVlcyBoYXBwZW4gdG8gYmUgdGhlIHNhbWUgYXMKQkRSVl9TRUNUT1JfQklUUyBhbmQgQkRSVl9T
RUNUT1JfU0laRSwgdGhleSBhcmUgY29uY2VwdHVhbGx5IGRpZmZlcmVudC4KVGhpcyBtYWtlcyBp
dCBjbGVhcmVyIHdoZW4gd2UgYXJlIGRlYWxpbmcgd2l0aCB2aXJ0aW8tYmxrIHNlY3RvciB1bml0
cy4KClVzZSBWSVJUSU9fQkxLX1NFQ1RPUl9CSVRTIGluIHZ1X2Jsa19pbml0aWFsaXplX2NvbmZp
ZygpLiBMYXRlciBwYXRjaGVzCndpbGwgdXNlIGl0IHRoZSBuZXcgY29uc3RhbnRzIHRoZSB2aXJ0
cXVldWUgcmVxdWVzdCBwcm9jZXNzaW5nIGNvZGUKcGF0aC4KClN1Z2dlc3RlZC1ieTogTWF4IFJl
aXR6IDxtcmVpdHpAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxz
dGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2
ZXIuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXIt
YmxrLXNlcnZlci5jIGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCmluZGV4
IDdhZWExMzJmNjkuLjI2MTRhNjM3OTEgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2V4cG9ydC92aG9zdC11
c2VyLWJsay1zZXJ2ZXIuYworKysgYi9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVy
LmMKQEAgLTIwLDYgKzIwLDEzIEBACiAjaW5jbHVkZSAic3lzZW11L2Jsb2NrLWJhY2tlbmQuaCIK
ICNpbmNsdWRlICJ1dGlsL2Jsb2NrLWhlbHBlcnMuaCIKIAorLyoKKyAqIFNlY3RvciB1bml0cyBh
cmUgNTEyIGJ5dGVzIHJlZ2FyZGxlc3Mgb2YgdGhlCisgKiB2aXJ0aW9fYmxrX2NvbmZpZy0+Ymxr
X3NpemUgdmFsdWUuCisgKi8KKyNkZWZpbmUgVklSVElPX0JMS19TRUNUT1JfQklUUyA5CisjZGVm
aW5lIFZJUlRJT19CTEtfU0VDVE9SX1NJWkUgKDF1bGwgPDwgVklSVElPX0JMS19TRUNUT1JfQklU
UykKKwogZW51bSB7CiAgICAgVkhPU1RfVVNFUl9CTEtfTlVNX1FVRVVFU19ERUZBVUxUID0gMSwK
IH07CkBAIC0zNDcsNyArMzU0LDggQEAgdnVfYmxrX2luaXRpYWxpemVfY29uZmlnKEJsb2NrRHJp
dmVyU3RhdGUgKmJzLAogICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGJsa19zaXpl
LAogICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IG51bV9xdWV1ZXMpCiB7Ci0gICAg
Y29uZmlnLT5jYXBhY2l0eSA9IGNwdV90b19sZTY0KGJkcnZfZ2V0bGVuZ3RoKGJzKSA+PiBCRFJW
X1NFQ1RPUl9CSVRTKTsKKyAgICBjb25maWctPmNhcGFjaXR5ID0KKyAgICAgICAgY3B1X3RvX2xl
NjQoYmRydl9nZXRsZW5ndGgoYnMpID4+IFZJUlRJT19CTEtfU0VDVE9SX0JJVFMpOwogICAgIGNv
bmZpZy0+YmxrX3NpemUgPSBjcHVfdG9fbGUzMihibGtfc2l6ZSk7CiAgICAgY29uZmlnLT5zaXpl
X21heCA9IGNwdV90b19sZTMyKDApOwogICAgIGNvbmZpZy0+c2VnX21heCA9IGNwdV90b19sZTMy
KDEyOCAtIDIpOwpAQCAtMzU2LDcgKzM2NCw4IEBAIHZ1X2Jsa19pbml0aWFsaXplX2NvbmZpZyhC
bG9ja0RyaXZlclN0YXRlICpicywKICAgICBjb25maWctPm51bV9xdWV1ZXMgPSBjcHVfdG9fbGUx
NihudW1fcXVldWVzKTsKICAgICBjb25maWctPm1heF9kaXNjYXJkX3NlY3RvcnMgPSBjcHVfdG9f
bGUzMigzMjc2OCk7CiAgICAgY29uZmlnLT5tYXhfZGlzY2FyZF9zZWcgPSBjcHVfdG9fbGUzMigx
KTsKLSAgICBjb25maWctPmRpc2NhcmRfc2VjdG9yX2FsaWdubWVudCA9IGNwdV90b19sZTMyKGJs
a19zaXplID4+IDkpOworICAgIGNvbmZpZy0+ZGlzY2FyZF9zZWN0b3JfYWxpZ25tZW50ID0KKyAg
ICAgICAgY3B1X3RvX2xlMzIoYmxrX3NpemUgPj4gVklSVElPX0JMS19TRUNUT1JfQklUUyk7CiAg
ICAgY29uZmlnLT5tYXhfd3JpdGVfemVyb2VzX3NlY3RvcnMgPSBjcHVfdG9fbGUzMigzMjc2OCk7
CiAgICAgY29uZmlnLT5tYXhfd3JpdGVfemVyb2VzX3NlZyA9IGNwdV90b19sZTMyKDEpOwogfQpA
QCAtMzgzLDcgKzM5Miw3IEBAIHN0YXRpYyBpbnQgdnVfYmxrX2V4cF9jcmVhdGUoQmxvY2tFeHBv
cnQgKmV4cCwgQmxvY2tFeHBvcnRPcHRpb25zICpvcHRzLAogICAgIGlmICh2dV9vcHRzLT5oYXNf
bG9naWNhbF9ibG9ja19zaXplKSB7CiAgICAgICAgIGxvZ2ljYWxfYmxvY2tfc2l6ZSA9IHZ1X29w
dHMtPmxvZ2ljYWxfYmxvY2tfc2l6ZTsKICAgICB9IGVsc2UgewotICAgICAgICBsb2dpY2FsX2Js
b2NrX3NpemUgPSBCRFJWX1NFQ1RPUl9TSVpFOworICAgICAgICBsb2dpY2FsX2Jsb2NrX3NpemUg
PSBWSVJUSU9fQkxLX1NFQ1RPUl9TSVpFOwogICAgIH0KICAgICBjaGVja19ibG9ja19zaXplKGV4
cC0+aWQsICJsb2dpY2FsLWJsb2NrLXNpemUiLCBsb2dpY2FsX2Jsb2NrX3NpemUsCiAgICAgICAg
ICAgICAgICAgICAgICAmbG9jYWxfZXJyKTsKLS0gCjIuMjkuMgoK


