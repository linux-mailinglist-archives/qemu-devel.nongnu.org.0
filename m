Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523A2CC0D5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 16:30:36 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkU5T-0008VY-Bl
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 10:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU2d-0006SG-NO
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkU2b-000493-18
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 10:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606922851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QVw1FA0gSbZOuZ4y7uGJDFYO+dNUFEqyXxgdyQXFpQ=;
 b=cPlwyZGzp2Kni996mjg+2Zomr93Uz71JOvudx4bXRjNSn4fGzK0E2stnKqnwv4mwHzbe51
 VaJwY5rPdCaYh0Y2LizpWM0Hd0I0jiIFcziYOzJA3dQGlOuMpPscXeB5hWZL3is7Lttnfp
 PbS+OEXax0ToUh93lokQbJKtX4DYJgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-XL5BWiaXOO6PdMl8NP6oYA-1; Wed, 02 Dec 2020 10:27:29 -0500
X-MC-Unique: XL5BWiaXOO6PdMl8NP6oYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DE75708B;
 Wed,  2 Dec 2020 15:27:28 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDDF71001B2C;
 Wed,  2 Dec 2020 15:27:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] block/export: avoid g_return_val_if() input validation
Date: Wed,  2 Dec 2020 15:26:11 +0000
Message-Id: <20201202152611.677753-5-stefanha@redhat.com>
In-Reply-To: <20201202152611.677753-1-stefanha@redhat.com>
References: <20201202152611.677753-1-stefanha@redhat.com>
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
PgotLS0KIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyB8IDYgKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jIGIvYmxvY2svZXhwb3J0L3Zo
b3N0LXVzZXItYmxrLXNlcnZlci5jCmluZGV4IDYyNjcyZDFjYjkuLmJjY2JjOThkNTcgMTAwNjQ0
Ci0tLSBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYworKysgYi9ibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKQEAgLTI2Nyw3ICsyNjcsMTEgQEAgdnVfYmxr
X2dldF9jb25maWcoVnVEZXYgKnZ1X2RldiwgdWludDhfdCAqY29uZmlnLCB1aW50MzJfdCBsZW4p
CiAgICAgVnVTZXJ2ZXIgKnNlcnZlciA9IGNvbnRhaW5lcl9vZih2dV9kZXYsIFZ1U2VydmVyLCB2
dV9kZXYpOwogICAgIFZ1QmxrRXhwb3J0ICp2ZXhwID0gY29udGFpbmVyX29mKHNlcnZlciwgVnVC
bGtFeHBvcnQsIHZ1X3NlcnZlcik7CiAKLSAgICBnX3JldHVybl92YWxfaWZfZmFpbChsZW4gPD0g
c2l6ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2NvbmZpZyksIC0xKTsKKyAgICBpZiAobGVuID4gc2l6
ZW9mKHN0cnVjdCB2aXJ0aW9fYmxrX2NvbmZpZykpIHsKKyAgICAgICAgZXJyb3JfcmVwb3J0KCJJ
bnZhbGlkIGdldF9jb25maWcgbGVuICV1LCBleHBlY3RlZCA8PSAlenUiLAorICAgICAgICAgICAg
ICAgICAgICAgbGVuLCBzaXplb2Yoc3RydWN0IHZpcnRpb19ibGtfY29uZmlnKSk7CisgICAgICAg
IHJldHVybiAtMTsKKyAgICB9CiAKICAgICBtZW1jcHkoY29uZmlnLCAmdmV4cC0+YmxrY2ZnLCBs
ZW4pOwogICAgIHJldHVybiAwOwotLSAKMi4yOC4wCgo=


