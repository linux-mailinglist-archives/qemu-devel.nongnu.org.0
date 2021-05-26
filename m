Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DB39137D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:16:51 +0200 (CEST)
Received: from localhost ([::1]:43944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpeX-0006Gu-J8
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpbR-00022x-Mf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llpbL-0001Gu-M2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 05:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622020399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omTh+2VqrlWG+mA8A8bpUVVby68xoQ90QJPFIO0Jcus=;
 b=IDX1LQUXMxihactxa9DUry996n6BTRoZPXUcN2+RYu8+6FoWPilodG4vypCwYE1usbtLKk
 aVGCVL70MfnxgW1YCEaEc+kKNhu3vHwPLcDY8qFyxTvxEUMr4yiP9WXEyCP8rJze35nPXb
 4/xlp/Qcex/YMOARHPwNQn8fsy094zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-reEX55CANoKMdtYsXMjNOQ-1; Wed, 26 May 2021 05:13:15 -0400
X-MC-Unique: reEX55CANoKMdtYsXMjNOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0351D100945F;
 Wed, 26 May 2021 09:13:15 +0000 (UTC)
Received: from localhost (ovpn-115-80.ams2.redhat.com [10.36.115.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81C4F5D75A;
 Wed, 26 May 2021 09:13:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] ui/vdagent: fix clipboard info memory leak in error path
Date: Wed, 26 May 2021 10:12:48 +0100
Message-Id: <20210526091248.434459-4-stefanha@redhat.com>
In-Reply-To: <20210526091248.434459-1-stefanha@redhat.com>
References: <20210526091248.434459-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SWYgdGhlIHNpemUgb2YgYSBWRF9BR0VOVF9DTElQQk9BUkRfR1JBQiBtZXNzYWdlIGlzIGludmFs
aWQgd2UgbGVhayBpbmZvCndoZW4gcmV0dXJuaW5nIGVhcmx5LgoKVGhhbmtzIHRvIENvdmVyaXR5
IGZvciBzcG90dGluZyB0aGlzOgoKKioqIENJRCAxNDUzMjY2OiAgUmVzb3VyY2UgbGVha3MgIChS
RVNPVVJDRV9MRUFLKQovcWVtdS91aS92ZGFnZW50LmM6IDQ2NSBpbiB2ZGFnZW50X2Nocl9yZWN2
X2NsaXBib2FyZCgpCjQ1OSAgICAgICAgICAgICBpbmZvID0gcWVtdV9jbGlwYm9hcmRfaW5mb19u
ZXcoJnZkLT5jYnBlZXIsIHMpOwo0NjAgICAgICAgICAgICAgaWYgKHNpemUgPiBzaXplb2YodWlu
dDMyX3QpICogMTApIHsKNDYxICAgICAgICAgICAgICAgICAvKgo0NjIgICAgICAgICAgICAgICAg
ICAqIHNwaWNlIGhhcyA2IHR5cGVzIGFzIG9mIDIwMjEuIExpbWl0aW5nIHRvIDEwIGVudHJpZXMK
NDYzICAgICAgICAgICAgICAgICAgKiBzbyB3ZSB3ZSBoYXZlIHNvbWUgd2lnZ2xlIHJvb20uCjQ2
NCAgICAgICAgICAgICAgICAgICovCj4+PiAgICAgQ0lEIDE0NTMyNjY6ICBSZXNvdXJjZSBsZWFr
cyAgKFJFU09VUkNFX0xFQUspCj4+PiAgICAgVmFyaWFibGUgImluZm8iIGdvaW5nIG91dCBvZiBz
Y29wZSBsZWFrcyB0aGUgc3RvcmFnZSBpdCBwb2ludHMgdG8uCjQ2NSAgICAgICAgICAgICAgICAg
cmV0dXJuOwo0NjYgICAgICAgICAgICAgfQo0NjcgICAgICAgICAgICAgd2hpbGUgKHNpemUgPj0g
c2l6ZW9mKHVpbnQzMl90KSkgewo0NjggICAgICAgICAgICAgICAgIHRyYWNlX3ZkYWdlbnRfY2Jf
Z3JhYl90eXBlKEdFVF9OQU1FKHR5cGVfbmFtZSwgKih1aW50MzJfdCAqKWRhdGEpKTsKNDY5ICAg
ICAgICAgICAgICAgICBzd2l0Y2ggKCoodWludDMyX3QgKilkYXRhKSB7CjQ3MCAgICAgICAgICAg
ICAgICAgY2FzZSBWRF9BR0VOVF9DTElQQk9BUkRfVVRGOF9URVhUOgoKRml4ZXM6IGYwMzQ5ZjRk
ODk0N2FkMzJkMGZhNDY3OGNiZjVkYmIzNTZmY2JkYTEgKCJ1aS92ZGFnZW50OiBhZGQgY2xpcGJv
YXJkIHN1cHBvcnQiKQpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiB1aS92
ZGFnZW50LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS91aS92ZGFnZW50LmMgYi91aS92ZGFnZW50LmMKaW5kZXggYTI1
M2E4ZmU2My4uOGZjNTRkMzMwZSAxMDA2NDQKLS0tIGEvdWkvdmRhZ2VudC5jCisrKyBiL3VpL3Zk
YWdlbnQuYwpAQCAtNDU2LDcgKzQ1Niw2IEBAIHN0YXRpYyB2b2lkIHZkYWdlbnRfY2hyX3JlY3Zf
Y2xpcGJvYXJkKFZEQWdlbnRDaGFyZGV2ICp2ZCwgVkRBZ2VudE1lc3NhZ2UgKm1zZykKICAgICBz
d2l0Y2ggKG1zZy0+dHlwZSkgewogICAgIGNhc2UgVkRfQUdFTlRfQ0xJUEJPQVJEX0dSQUI6CiAg
ICAgICAgIHRyYWNlX3ZkYWdlbnRfY2JfZ3JhYl9zZWxlY3Rpb24oR0VUX05BTUUoc2VsX25hbWUs
IHMpKTsKLSAgICAgICAgaW5mbyA9IHFlbXVfY2xpcGJvYXJkX2luZm9fbmV3KCZ2ZC0+Y2JwZWVy
LCBzKTsKICAgICAgICAgaWYgKHNpemUgPiBzaXplb2YodWludDMyX3QpICogMTApIHsKICAgICAg
ICAgICAgIC8qCiAgICAgICAgICAgICAgKiBzcGljZSBoYXMgNiB0eXBlcyBhcyBvZiAyMDIxLiBM
aW1pdGluZyB0byAxMCBlbnRyaWVzCkBAIC00NjQsNiArNDYzLDcgQEAgc3RhdGljIHZvaWQgdmRh
Z2VudF9jaHJfcmVjdl9jbGlwYm9hcmQoVkRBZ2VudENoYXJkZXYgKnZkLCBWREFnZW50TWVzc2Fn
ZSAqbXNnKQogICAgICAgICAgICAgICovCiAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgIH0K
KyAgICAgICAgaW5mbyA9IHFlbXVfY2xpcGJvYXJkX2luZm9fbmV3KCZ2ZC0+Y2JwZWVyLCBzKTsK
ICAgICAgICAgd2hpbGUgKHNpemUgPj0gc2l6ZW9mKHVpbnQzMl90KSkgewogICAgICAgICAgICAg
dHJhY2VfdmRhZ2VudF9jYl9ncmFiX3R5cGUoR0VUX05BTUUodHlwZV9uYW1lLCAqKHVpbnQzMl90
ICopZGF0YSkpOwogICAgICAgICAgICAgc3dpdGNoICgqKHVpbnQzMl90ICopZGF0YSkgewotLSAK
Mi4zMS4xCgo=


