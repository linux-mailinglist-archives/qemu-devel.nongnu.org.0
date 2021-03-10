Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478023345C5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:55:46 +0100 (CET)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK33h-0003LK-B1
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lK2fB-00068s-4l
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lK2f8-0006XM-Gm
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gb5rQs4qgMFQU9uP6U3Hzen8MciKVUJAaBQygwm38pA=;
 b=FWouAwXZ1XBEzrAyZATY8iz5PIruqzm53pCKGkbTWTbnGNi8Xev4V7jnI9z+rC/8x3ZwEG
 DAiXRDSPfNrHUclRYrBBSc79u+zCfMFb/SXRVd66qbpib/m+WTc2BXypHb35fdyd6MmLQD
 QNcBVJytkM3XcJiS66ExkoH4RVlktxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-NxfZ19CPM_GMeR9iQ01h_Q-1; Wed, 10 Mar 2021 12:30:13 -0500
X-MC-Unique: NxfZ19CPM_GMeR9iQ01h_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744E4108BD10
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 17:30:12 +0000 (UTC)
Received: from localhost (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D94A75C255;
 Wed, 10 Mar 2021 17:30:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Date: Wed, 10 Mar 2021 17:30:04 +0000
Message-Id: <20210310173004.420190-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

c29ja2V0X2dldF9mZCgpIGZhaWxzIHdpdGggdGhlIGVycm9yICJzb2NrZXRfZ2V0X2ZkOiB0b28g
bWFueQpjb25uZWN0aW9ucyIgaWYgdGhlIGdpdmVuIGxpc3RlbiBiYWNrbG9nIHZhbHVlIGlzIG5v
dCAxLgoKTm90IGFsbCBjYWxsZXJzIHNldCB0aGUgYmFja2xvZyB0byAxLiBGb3IgZXhhbXBsZSwg
Y29tbWl0CjU4MmQ0MjEwZWIyZjJhYjViYWFjMzI4ZmU0YjQ3OWNkODZkYTE2NDcgKCJxZW11LW5i
ZDogVXNlIFNPTUFYQ09OTiBmb3IKc29ja2V0IGxpc3RlbigpIGJhY2tsb2ciKSB1c2VzIFNPTUFY
Q09OTi4gVGhpcyB3aWxsIGFsd2F5cyBmYWlsIHdpdGggaW4Kc29ja2V0X2dldF9mZCgpLgoKVGhp
cyBwYXRjaCBjYWxscyBsaXN0ZW4oMikgb24gdGhlIGZkIHRvIHVwZGF0ZSB0aGUgYmFja2xvZyB2
YWx1ZS4gVGhlCnNvY2tldCBtYXkgYWxyZWFkeSBiZSBpbiB0aGUgbGlzdGVuIHN0YXRlLiBJIGhh
dmUgdGVzdGVkIHRoYXQgdGhpcyB3b3JrcwpvbiBMaW51eCA1LjEwIGFuZCBtYWNPUyBDYXRhbGlu
YS4KCkFzIGEgYm9udXMgdGhpcyBhbGxvd3MgdXMgdG8gZGV0ZWN0IHdoZW4gdGhlIGZkIGNhbm5v
dCBsaXN0ZW4uIE5vdyB3ZSdsbApiZSBhYmxlIHRvIGNhdGNoIHVuYm91bmQgb3IgY29ubmVjdGVk
IGZkcyBpbiBzb2NrZXRfbGlzdGVuKCkuCgpEcm9wIHRoZSBudW0gYXJndW1lbnQgZnJvbSBzb2Nr
ZXRfZ2V0X2ZkKCkgc2luY2UgdGhpcyBmdW5jdGlvbiBpcyBhbHNvCmNhbGxlZCBieSBzb2NrZXRf
Y29ubmVjdCgpIHdoZXJlIGEgbGlzdGVuIGJhY2tsb2cgdmFsdWUgZG9lcyBub3QgbWFrZQpzZW5z
ZS4KCkZpeGVzOiBlNWI2MzUzY2YyNWM5OWMzZjA4YmY1MWUyOTkzMzM1MmY3MTQwZThmICgic29j
a2V0OiBBZGQgYmFja2xvZyBwYXJhbWV0ZXIgdG8gc29ja2V0X2xpc3RlbiIpClJlcG9ydGVkLWJ5
OiBSaWNoYXJkIFcuTS4gSm9uZXMgPHJqb25lc0ByZWRoYXQuY29tPgpDYzogSnVhbiBRdWludGVs
YSA8cXVpbnRlbGFAcmVkaGF0LmNvbT4KQ2M6IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0t
LQogdXRpbC9xZW11LXNvY2tldHMuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS91dGlsL3FlbXUtc29ja2V0cy5jIGIvdXRpbC9xZW11LXNvY2tldHMuYwppbmRleCA4
YWYwMjc4ZjE1Li4yNDYzYzQ5NzczIDEwMDY0NAotLS0gYS91dGlsL3FlbXUtc29ja2V0cy5jCisr
KyBiL3V0aWwvcWVtdS1zb2NrZXRzLmMKQEAgLTExMTYsMTQgKzExMTYsMTAgQEAgZmFpbDoKICAg
ICByZXR1cm4gTlVMTDsKIH0KIAotc3RhdGljIGludCBzb2NrZXRfZ2V0X2ZkKGNvbnN0IGNoYXIg
KmZkc3RyLCBpbnQgbnVtLCBFcnJvciAqKmVycnApCitzdGF0aWMgaW50IHNvY2tldF9nZXRfZmQo
Y29uc3QgY2hhciAqZmRzdHIsIEVycm9yICoqZXJycCkKIHsKICAgICBNb25pdG9yICpjdXJfbW9u
ID0gbW9uaXRvcl9jdXIoKTsKICAgICBpbnQgZmQ7Ci0gICAgaWYgKG51bSAhPSAxKSB7Ci0gICAg
ICAgIGVycm9yX3NldGdfZXJybm8oZXJycCwgRUlOVkFMLCAic29ja2V0X2dldF9mZDogdG9vIG1h
bnkgY29ubmVjdGlvbnMiKTsKLSAgICAgICAgcmV0dXJuIC0xOwotICAgIH0KICAgICBpZiAoY3Vy
X21vbikgewogICAgICAgICBmZCA9IG1vbml0b3JfZ2V0X2ZkKGN1cl9tb24sIGZkc3RyLCBlcnJw
KTsKICAgICAgICAgaWYgKGZkIDwgMCkgewpAQCAtMTE1OSw3ICsxMTU1LDcgQEAgaW50IHNvY2tl
dF9jb25uZWN0KFNvY2tldEFkZHJlc3MgKmFkZHIsIEVycm9yICoqZXJycCkKICAgICAgICAgYnJl
YWs7CiAKICAgICBjYXNlIFNPQ0tFVF9BRERSRVNTX1RZUEVfRkQ6Ci0gICAgICAgIGZkID0gc29j
a2V0X2dldF9mZChhZGRyLT51LmZkLnN0ciwgMSwgZXJycCk7CisgICAgICAgIGZkID0gc29ja2V0
X2dldF9mZChhZGRyLT51LmZkLnN0ciwgZXJycCk7CiAgICAgICAgIGJyZWFrOwogCiAgICAgY2Fz
ZSBTT0NLRVRfQUREUkVTU19UWVBFX1ZTT0NLOgpAQCAtMTE4Nyw3ICsxMTgzLDI2IEBAIGludCBz
b2NrZXRfbGlzdGVuKFNvY2tldEFkZHJlc3MgKmFkZHIsIGludCBudW0sIEVycm9yICoqZXJycCkK
ICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIFNPQ0tFVF9BRERSRVNTX1RZUEVfRkQ6Ci0gICAg
ICAgIGZkID0gc29ja2V0X2dldF9mZChhZGRyLT51LmZkLnN0ciwgbnVtLCBlcnJwKTsKKyAgICAg
ICAgZmQgPSBzb2NrZXRfZ2V0X2ZkKGFkZHItPnUuZmQuc3RyLCBlcnJwKTsKKyAgICAgICAgaWYg
KGZkIDwgMCkgeworICAgICAgICAgICAgcmV0dXJuIC0xOworICAgICAgICB9CisKKyAgICAgICAg
LyoKKyAgICAgICAgICogSWYgdGhlIHNvY2tldCBpcyBub3QgeWV0IGluIHRoZSBsaXN0ZW4gc3Rh
dGUsIHRoZW4gdHJhbnNpdGlvbiBpdCB0bworICAgICAgICAgKiB0aGUgbGlzdGVuIHN0YXRlIG5v
dy4KKyAgICAgICAgICoKKyAgICAgICAgICogSWYgaXQncyBhbHJlYWR5IGxpc3RlbmluZyB0aGVu
IHRoaXMgdXBkYXRlcyB0aGUgYmFja2xvZyB2YWx1ZSBhcworICAgICAgICAgKiByZXF1ZXN0ZWQu
CisgICAgICAgICAqCisgICAgICAgICAqIElmIHRoaXMgc29ja2V0IGNhbm5vdCBsaXN0ZW4gYmVj
YXVzZSBpdCdzIGFscmVhZHkgaW4gYW5vdGhlciBzdGF0ZQorICAgICAgICAgKiAoZS5nLiB1bmJv
dW5kIG9yIGNvbm5lY3RlZCkgdGhlbiB3ZSdsbCBjYXRjaCB0aGUgZXJyb3IgaGVyZS4KKyAgICAg
ICAgICovCisgICAgICAgIGlmIChsaXN0ZW4oZmQsIG51bSkgIT0gMCkgeworICAgICAgICAgICAg
ZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCBlcnJubywgIkZhaWxlZCB0byBsaXN0ZW4gb24gZmQgc29j
a2V0Iik7CisgICAgICAgICAgICBjbG9zZXNvY2tldChmZCk7CisgICAgICAgICAgICByZXR1cm4g
LTE7CisgICAgICAgIH0KICAgICAgICAgYnJlYWs7CiAKICAgICBjYXNlIFNPQ0tFVF9BRERSRVNT
X1RZUEVfVlNPQ0s6Ci0tIAoyLjI5LjIKCg==


