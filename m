Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B129729B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:43:24 +0200 (CEST)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzDv-0007Bd-6R
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyuN-0005hm-P9
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVyuD-0000il-LE
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603466579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDviE/SJ6uF9ldAP6G/NhtSKe90wMCeVNvasQ/wFgFo=;
 b=XzR9aaSoq4io5KM/FOqnOb0NA+ohsLnh2/4nYbzI1c6GsGmo6tGiFfDj2vUSikZ6vLZDcZ
 1Y2pUzEAqltfK+S+97DNYNBCELV7CVMCk9Ua1rsVCmr8z06Y9skr/yeIFg7csVnudnMdyN
 Q4xpD9f3zZclF1GqR1p2lb77zdEWpUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-XhcWh-cWMICb7oAkVWxrGQ-1; Fri, 23 Oct 2020 11:22:51 -0400
X-MC-Unique: XhcWh-cWMICb7oAkVWxrGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1498610E2181;
 Fri, 23 Oct 2020 15:22:50 +0000 (UTC)
Received: from localhost (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7D895B4AC;
 Fri, 23 Oct 2020 15:22:46 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v3 10/28] util/vhost-user-server: drop unnecessary watch
 deletion
Date: Fri, 23 Oct 2020 16:21:29 +0100
Message-Id: <20201023152147.1016281-11-stefanha@redhat.com>
In-Reply-To: <20201023152147.1016281-1-stefanha@redhat.com>
References: <20201023152147.1016281-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RXhwbGljaXRseSBkZWxldGluZyB3YXRjaGVzIGlzIG5vdCBuZWNlc3Nhcnkgc2luY2UgbGlidmhv
c3QtdXNlciBjYWxscwpyZW1vdmVfd2F0Y2goKSBkdXJpbmcgdnVfZGVpbml0KCkuIEFkZCBhbiBh
c3NlcnRpb24gdG8gY2hlY2sgdGhpcwp0aG91Z2guCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwOTI0MTUxNTQ5Ljkx
MzczNy01LXN0ZWZhbmhhQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3pp
IDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyB8IDE5
ICsrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyBiL3V0
aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwppbmRleCA0NDNhYjc0NDhjLi42ZWZlMjI3OWZkIDEwMDY0
NAotLS0gYS91dGlsL3Zob3N0LXVzZXItc2VydmVyLmMKKysrIGIvdXRpbC92aG9zdC11c2VyLXNl
cnZlci5jCkBAIC00OCwyMSArNDgsNiBAQCBzdGF0aWMgdm9pZCBjbG9zZV9jbGllbnQoVnVTZXJ2
ZXIgKnNlcnZlcikKICAgICAvKiBXaGVuIHRoaXMgaXMgc2V0IHZ1X2NsaWVudF90cmlwIHdpbGwg
c3RvcCBuZXcgcHJvY2Vzc2luZyB2aG9zdC11c2VyIG1lc3NhZ2UgKi8KICAgICBzZXJ2ZXItPnNp
b2MgPSBOVUxMOwogCi0gICAgVnVGZFdhdGNoICp2dV9mZF93YXRjaCwgKm5leHQ7Ci0gICAgUVRB
SUxRX0ZPUkVBQ0hfU0FGRSh2dV9mZF93YXRjaCwgJnNlcnZlci0+dnVfZmRfd2F0Y2hlcywgbmV4
dCwgbmV4dCkgewotICAgICAgICBhaW9fc2V0X2ZkX2hhbmRsZXIoc2VydmVyLT5pb2MtPmN0eCwg
dnVfZmRfd2F0Y2gtPmZkLCB0cnVlLCBOVUxMLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
TlVMTCwgTlVMTCwgTlVMTCk7Ci0gICAgfQotCi0gICAgd2hpbGUgKCFRVEFJTFFfRU1QVFkoJnNl
cnZlci0+dnVfZmRfd2F0Y2hlcykpIHsKLSAgICAgICAgUVRBSUxRX0ZPUkVBQ0hfU0FGRSh2dV9m
ZF93YXRjaCwgJnNlcnZlci0+dnVfZmRfd2F0Y2hlcywgbmV4dCwgbmV4dCkgewotICAgICAgICAg
ICAgaWYgKCF2dV9mZF93YXRjaC0+cHJvY2Vzc2luZykgewotICAgICAgICAgICAgICAgIFFUQUlM
UV9SRU1PVkUoJnNlcnZlci0+dnVfZmRfd2F0Y2hlcywgdnVfZmRfd2F0Y2gsIG5leHQpOwotICAg
ICAgICAgICAgICAgIGdfZnJlZSh2dV9mZF93YXRjaCk7Ci0gICAgICAgICAgICB9Ci0gICAgICAg
IH0KLSAgICB9Ci0KICAgICB3aGlsZSAoc2VydmVyLT5wcm9jZXNzaW5nX21zZykgewogICAgICAg
ICBpZiAoc2VydmVyLT5pb2MtPnJlYWRfY29yb3V0aW5lKSB7CiAgICAgICAgICAgICBzZXJ2ZXIt
PmlvYy0+cmVhZF9jb3JvdXRpbmUgPSBOVUxMOwpAQCAtNzMsNiArNTgsMTAgQEAgc3RhdGljIHZv
aWQgY2xvc2VfY2xpZW50KFZ1U2VydmVyICpzZXJ2ZXIpCiAgICAgfQogCiAgICAgdnVfZGVpbml0
KCZzZXJ2ZXItPnZ1X2Rldik7CisKKyAgICAvKiB2dV9kZWluaXQoKSBzaG91bGQgaGF2ZSBjYWxs
ZWQgcmVtb3ZlX3dhdGNoKCkgKi8KKyAgICBhc3NlcnQoUVRBSUxRX0VNUFRZKCZzZXJ2ZXItPnZ1
X2ZkX3dhdGNoZXMpKTsKKwogICAgIG9iamVjdF91bnJlZihPQkpFQ1Qoc2lvYykpOwogICAgIG9i
amVjdF91bnJlZihPQkpFQ1Qoc2VydmVyLT5pb2MpKTsKIH0KLS0gCjIuMjYuMgoK


