Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B607329729F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:43:44 +0200 (CEST)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzEF-00082U-PY
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyvY-0007rk-Qq
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyvR-00010g-EU
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogDc78Da3pGyWDfyJyhV89iS65RlQAvah2kWaoor87s=;
 b=AG3r9+q0EwL+fmLsoFFgNEt5sH7wwkA6i42XxAnLmf+libvpdTLrjOylS17usbwJtWl4NY
 +MqFZIW5mKRLltzVYHda/zLOyW0GlxBzKS05TkxK1IbAHK95bPlVoFDApbGeivYr4tufxs
 2KYVTUTPHrJDr/6GZeNQl/q6m77a9+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-vpaYeNDHMq2GF90gf_kBsw-1; Fri, 23 Oct 2020 11:24:13 -0400
X-MC-Unique: vpaYeNDHMq2GF90gf_kBsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C241F18C07FD;
 Fri, 23 Oct 2020 15:23:41 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 643015D9CC;
 Fri, 23 Oct 2020 15:23:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 20/28] qemu-storage-daemon: avoid compiling blockdev_ss twice
Date: Fri, 23 Oct 2020 16:21:39 +0100
Message-Id: <20201023152147.1016281-21-stefanha@redhat.com>
In-Reply-To: <20201023152147.1016281-1-stefanha@redhat.com>
References: <20201023152147.1016281-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SW50cm9kdWNlIGxpYmJsa2Rldi5mYSB0byBhdm9pZCByZWNvbXBpbGluZyBibG9ja2Rldl9zcyB0
d2ljZS4KClN1Z2dlc3RlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDog
MjAyMDA5MjkxMjU1MTYuMTg2NzE1LTMtc3RlZmFuaGFAcmVkaGF0LmNvbQpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogbWVzb24uYnVpbGQg
ICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysrLS0KIHN0b3JhZ2UtZGFlbW9uL21lc29uLmJ1
aWxkIHwgIDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAppbmRleCAyZWM0
ZjExNGNlLi44ODA2ODM0MDdmIDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5i
dWlsZApAQCAtMTQ2NCw3ICsxNDY0LDYgQEAgYmxvY2tkZXZfc3MuYWRkKGZpbGVzKAogIyBvcy13
aW4zMi5jIGRvZXMgbm90CiBibG9ja2Rldl9zcy5hZGQod2hlbjogJ0NPTkZJR19QT1NJWCcsIGlm
X3RydWU6IGZpbGVzKCdvcy1wb3NpeC5jJykpCiBzb2Z0bW11X3NzLmFkZCh3aGVuOiAnQ09ORklH
X1dJTjMyJywgaWZfdHJ1ZTogW2ZpbGVzKCdvcy13aW4zMi5jJyldKQotc29mdG1tdV9zcy5hZGRf
YWxsKGJsb2NrZGV2X3NzKQogCiBjb21tb25fc3MuYWRkKGZpbGVzKCdjcHVzLWNvbW1vbi5jJykp
CiAKQEAgLTE1OTYsNiArMTU5NSwxNSBAQCBibG9jayA9IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5r
X3dob2xlOiBbbGliYmxvY2tdLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlua19hcmdz
OiAnQGJsb2NrLnN5bXMnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVwZW5kZW5jaWVz
OiBbY3J5cHRvLCBpb10pCiAKK2Jsb2NrZGV2X3NzID0gYmxvY2tkZXZfc3MuYXBwbHkoY29uZmln
X2hvc3QsIHN0cmljdDogZmFsc2UpCitsaWJibG9ja2RldiA9IHN0YXRpY19saWJyYXJ5KCdibG9j
a2RldicsIGJsb2NrZGV2X3NzLnNvdXJjZXMoKSArIGdlbmgsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRlcGVuZGVuY2llczogYmxvY2tkZXZfc3MuZGVwZW5kZW5jaWVzKCksCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG5hbWVfc3VmZml4OiAnZmEnLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBidWlsZF9ieV9kZWZhdWx0OiBmYWxzZSkKKworYmxvY2tkZXYgPSBk
ZWNsYXJlX2RlcGVuZGVuY3kobGlua193aG9sZTogW2xpYmJsb2NrZGV2XSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGRlcGVuZGVuY2llczogW2Jsb2NrXSkKKwogcW1wX3NzID0gcW1w
X3NzLmFwcGx5KGNvbmZpZ19ob3N0LCBzdHJpY3Q6IGZhbHNlKQogbGlicW1wID0gc3RhdGljX2xp
YnJhcnkoJ3FtcCcsIHFtcF9zcy5zb3VyY2VzKCkgKyBnZW5oLAogICAgICAgICAgICAgICAgICAg
ICAgICAgZGVwZW5kZW5jaWVzOiBxbXBfc3MuZGVwZW5kZW5jaWVzKCksCkBAIC0xNjI4LDcgKzE2
MzYsNyBAQCBmb3JlYWNoIG0gOiBibG9ja19tb2RzICsgc29mdG1tdV9tb2RzCiAgICAgICAgICAg
ICAgICAgaW5zdGFsbF9kaXI6IGNvbmZpZ19ob3N0WydxZW11X21vZGRpciddKQogZW5kZm9yZWFj
aAogCi1zb2Z0bW11X3NzLmFkZChhdXRoeiwgYmxvY2ssIGNoYXJkZXYsIGNyeXB0bywgaW8sIHFt
cCkKK3NvZnRtbXVfc3MuYWRkKGF1dGh6LCBibG9ja2RldiwgY2hhcmRldiwgY3J5cHRvLCBpbywg
cW1wKQogY29tbW9uX3NzLmFkZChxb20sIHFlbXV1dGlsKQogCiBjb21tb25fc3MuYWRkX2FsbCh3
aGVuOiAnQ09ORklHX1NPRlRNTVUnLCBpZl90cnVlOiBbc29mdG1tdV9zc10pCmRpZmYgLS1naXQg
YS9zdG9yYWdlLWRhZW1vbi9tZXNvbi5idWlsZCBiL3N0b3JhZ2UtZGFlbW9uL21lc29uLmJ1aWxk
CmluZGV4IDA0MDlhY2MzZjUuLmM1YWRjZTgxYzMgMTAwNjQ0Ci0tLSBhL3N0b3JhZ2UtZGFlbW9u
L21lc29uLmJ1aWxkCisrKyBiL3N0b3JhZ2UtZGFlbW9uL21lc29uLmJ1aWxkCkBAIC0xLDcgKzEs
NiBAQAogcXNkX3NzID0gc3Muc291cmNlX3NldCgpCiBxc2Rfc3MuYWRkKGZpbGVzKCdxZW11LXN0
b3JhZ2UtZGFlbW9uLmMnKSkKLXFzZF9zcy5hZGQoYmxvY2ssIGNoYXJkZXYsIHFtcCwgcW9tLCBx
ZW11dXRpbCkKLXFzZF9zcy5hZGRfYWxsKGJsb2NrZGV2X3NzKQorcXNkX3NzLmFkZChibG9ja2Rl
diwgY2hhcmRldiwgcW1wLCBxb20sIHFlbXV1dGlsKQogCiBzdWJkaXIoJ3FhcGknKQogCi0tIAoy
LjI2LjIKCg==


