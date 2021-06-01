Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF239776C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:02:56 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6r1-0005TQ-LI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6me-0007EV-Cv
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6mc-00080t-LQ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622563101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXTaWhOPtcGoxS4emjtrp1bVKeiRhwHglzBAWuwMz20=;
 b=ArL9weQHyfNXJD6EV3kkPkTHyaynH2hFFrZ2bxfaId2CRkFwcBxnga6IsJkOcsDD3npkWE
 2k8v/0epMXh9oxviODit08i4Ta0y286K3GhWljmJhMa4scsoO1sRnxeO3sSAyrsasNgQ/5
 yVCLZaZb0qh+coysllcjnobwTRkByCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-37jo1wkaNDe5fNgLsD62Pg-1; Tue, 01 Jun 2021 11:58:20 -0400
X-MC-Unique: 37jo1wkaNDe5fNgLsD62Pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB65106BB2D;
 Tue,  1 Jun 2021 15:58:19 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 372755D6CF;
 Tue,  1 Jun 2021 15:58:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ui/vdagent: fix clipboard info memory leak in error
 path
Date: Tue,  1 Jun 2021 16:57:55 +0100
Message-Id: <20210601155755.216949-3-stefanha@redhat.com>
In-Reply-To: <20210601155755.216949-1-stefanha@redhat.com>
References: <20210601155755.216949-1-stefanha@redhat.com>
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
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
YXJkIHN1cHBvcnQiKQpSZXZpZXdlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4K
LS0tCiB1aS92ZGFnZW50LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS91aS92ZGFnZW50LmMgYi91aS92ZGFnZW50LmMK
aW5kZXggYTI1M2E4ZmU2My4uOGZjNTRkMzMwZSAxMDA2NDQKLS0tIGEvdWkvdmRhZ2VudC5jCisr
KyBiL3VpL3ZkYWdlbnQuYwpAQCAtNDU2LDcgKzQ1Niw2IEBAIHN0YXRpYyB2b2lkIHZkYWdlbnRf
Y2hyX3JlY3ZfY2xpcGJvYXJkKFZEQWdlbnRDaGFyZGV2ICp2ZCwgVkRBZ2VudE1lc3NhZ2UgKm1z
ZykKICAgICBzd2l0Y2ggKG1zZy0+dHlwZSkgewogICAgIGNhc2UgVkRfQUdFTlRfQ0xJUEJPQVJE
X0dSQUI6CiAgICAgICAgIHRyYWNlX3ZkYWdlbnRfY2JfZ3JhYl9zZWxlY3Rpb24oR0VUX05BTUUo
c2VsX25hbWUsIHMpKTsKLSAgICAgICAgaW5mbyA9IHFlbXVfY2xpcGJvYXJkX2luZm9fbmV3KCZ2
ZC0+Y2JwZWVyLCBzKTsKICAgICAgICAgaWYgKHNpemUgPiBzaXplb2YodWludDMyX3QpICogMTAp
IHsKICAgICAgICAgICAgIC8qCiAgICAgICAgICAgICAgKiBzcGljZSBoYXMgNiB0eXBlcyBhcyBv
ZiAyMDIxLiBMaW1pdGluZyB0byAxMCBlbnRyaWVzCkBAIC00NjQsNiArNDYzLDcgQEAgc3RhdGlj
IHZvaWQgdmRhZ2VudF9jaHJfcmVjdl9jbGlwYm9hcmQoVkRBZ2VudENoYXJkZXYgKnZkLCBWREFn
ZW50TWVzc2FnZSAqbXNnKQogICAgICAgICAgICAgICovCiAgICAgICAgICAgICByZXR1cm47CiAg
ICAgICAgIH0KKyAgICAgICAgaW5mbyA9IHFlbXVfY2xpcGJvYXJkX2luZm9fbmV3KCZ2ZC0+Y2Jw
ZWVyLCBzKTsKICAgICAgICAgd2hpbGUgKHNpemUgPj0gc2l6ZW9mKHVpbnQzMl90KSkgewogICAg
ICAgICAgICAgdHJhY2VfdmRhZ2VudF9jYl9ncmFiX3R5cGUoR0VUX05BTUUodHlwZV9uYW1lLCAq
KHVpbnQzMl90ICopZGF0YSkpOwogICAgICAgICAgICAgc3dpdGNoICgqKHVpbnQzMl90ICopZGF0
YSkgewotLSAKMi4zMS4xCgo=


