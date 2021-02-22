Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66FA321C87
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:14:21 +0100 (CET)
Received: from localhost ([::1]:33098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDqm-0004Tm-SD
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnu-0002hT-Td
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnp-0002C3-0v
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpyhnN1NebAljP7wiEMoaKfZAgDCBNT0cY/9U2rhBlo=;
 b=JTNpr04/otSny/peK7vjNbyYq/CXkvF7JBED+qkG5PKir39ScWxAk+vhsgkOrCS6G/bgIF
 QcQAF0Fwizfm1rxc/LWaTjvmkGGSGxwTg1BMNQkOeaSCbwhBaoW7rjBpqdHtzS5OEKnM9C
 7crVTKoywyrs/A9ozh2eNi1nhILcdvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-c2ioTXnHOdOE8TUOSpNPcg-1; Mon, 22 Feb 2021 11:11:14 -0500
X-MC-Unique: c2ioTXnHOdOE8TUOSpNPcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16F0C100CCC8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:11:03 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B24491045D3B;
 Mon, 22 Feb 2021 16:11:01 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] vhost-user: warn when guest RAM is not shared
Date: Mon, 22 Feb 2021 16:10:17 +0000
Message-Id: <20210222161017.570837-4-stefanha@redhat.com>
In-Reply-To: <20210222161017.570837-1-stefanha@redhat.com>
References: <20210222161017.570837-1-stefanha@redhat.com>
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
Cc: kwolf@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWVtb3J5IHJlZ2lvbnMgbXVzdCBiZSBtbWFwKE1BUF9TSEFSRUQpIHNvIHRoYXQgbW9kaWZpY2F0
aW9ucyBtYWRlIGJ5CnRoZSB2aG9zdCBkZXZpY2UgYmFja2VuZCBwcm9jZXNzIGFyZSB2aXNpYmxl
IHRvIFFFTVUgYW5kIHZpY2UgdmVyc2EuIFVzZQp0aGUgbmV3IG1lbW9yeV9yZWdpb25faXNfbWFw
cGVkX3NoYXJlZCgpIGZ1bmN0aW9uIHRvIGNoZWNrIHRoaXMgYW5kCnByaW50IGEgd2FybmluZyBp
ZiBndWVzdCBSQU0gaXMgbm90IHNoYXJlZDoKCiAgcWVtdS1zeXN0ZW0teDg2XzY0OiAtZGV2aWNl
IHZob3N0LXVzZXItZnMtcGNpLGNoYXJkZXY9Y2hhcjAsdGFnPW15ZnM6IHdhcm5pbmc6IEZvdW5k
IHZob3N0LXVzZXIgbWVtb3J5IHJlZ2lvbiB3aXRob3V0IE1BUF9TSEFSRUQgKGRpZCB5b3UgZm9y
Z2V0IC1vYmplY3QgbWVtb3J5LSosc2hhcmU9b24/KQogIHFlbXUtc3lzdGVtLXg4Nl82NDogRmFp
bGVkIHRvIHJlYWQgZnJvbSBzbGF2ZS4KClRoaXMgd2FybmluZyBtYWtlcyBpdCBjbGVhciB0aGF0
IG1lbW9yeSBuZWVkcyB0byBiZSBjb25maWd1cmVkIHdpdGgKc2hhcmU9b24uIFdpdGhvdXQgdGhp
cyBwYXRjaCB0aGUgdmhvc3QgZGV2aWNlIGlzIGluaXRpYWxpemVkIGFuZCB0aGUKZGV2aWNlIGZh
aWxzIHdpdGggdmFndWUgZXJyb3IgbWVzc2FnZXMgY2F1c2VkIGJ5IGluY29uc2lzdGVudCBtZW1v
cnkKdmlld3MuIFRoZSB3YXJuaW5nIHNob3VsZCBtYWtlIGl0IGVhc2llciB0byB0cm91Ymxlc2hv
b3QgUUVNVQpjb21tYW5kLWxpbmVzIHRoYXQgbGFjayBzaGFyZT1vbiBtZW1vcnkuCgpJIGNvdWxk
bid0IGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgdGhpcyBhIHZob3N0X2Rldl9pbml0KCkgZXJyb3Is
IGJlY2F1c2UKbWVtb3J5IHJlZ2lvbnMgYXJlbid0IG5lY2Vzc2FyaWx5IGZpbmFsIHdoZW4gaXQg
aXMgY2FsbGVkLiBBbHNvLCBob3RwbHVnCmNhbiBhZGQgbWVtb3J5IHJlZ2lvbnMgd2l0aG91dCBN
QVBfU0hBUkVEIGluIHRoZSBmdXR1cmUsIHNvIHdlIHN0aWxsCm5lZWQgdG8gd2FybiBhYm91dCB0
aGF0LgoKUmVwb3J0ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBody92aXJ0
aW8vdmhvc3QtdXNlci5jIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3ZpcnRp
by92aG9zdC11c2VyLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jCmluZGV4IDJmZGQ1ZGFmNzQu
LjE3YzJmYjgxYmUgMTAwNjQ0Ci0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2VyLmMKKysrIGIvaHcv
dmlydGlvL3Zob3N0LXVzZXIuYwpAQCAtMjIyMywxMSArMjIyMywyMyBAQCB2aG9zdF91c2VyX2Ny
eXB0b19jbG9zZV9zZXNzaW9uKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwgdWludDY0X3Qgc2Vzc2lv
bl9pZCkKIHN0YXRpYyBib29sIHZob3N0X3VzZXJfbWVtX3NlY3Rpb25fZmlsdGVyKHN0cnVjdCB2
aG9zdF9kZXYgKmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1lbW9yeVJlZ2lvblNlY3Rpb24gKnNlY3Rpb24pCiB7Ci0gICAgYm9vbCByZXN1bHQ7CisgICAg
LyogQW4gZmQgaXMgcmVxdWlyZWQgc28gd2UgY2FuIHBhc3MgaXQgdG8gdGhlIGRldmljZSBiYWNr
ZW5kIHByb2Nlc3MgKi8KKyAgICBpZiAobWVtb3J5X3JlZ2lvbl9nZXRfZmQoc2VjdGlvbi0+bXIp
IDwgMCkgeworICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgfQogCi0gICAgcmVzdWx0ID0gbWVt
b3J5X3JlZ2lvbl9nZXRfZmQoc2VjdGlvbi0+bXIpID49IDA7Ci0KLSAgICByZXR1cm4gcmVzdWx0
OworICAgIC8qCisgICAgICogSXQgbXVzdCBiZSBtbWFwKE1BUF9TSEFSRUQpIHNvIG1lbW9yeSBz
dG9yZXMgZnJvbSB0aGUgZGV2aWNlIGJhY2tlbmQKKyAgICAgKiBwcm9jZXNzIGFyZSB2aXNpYmxl
IHRvIHVzIGFuZCB2aWNlIHZlcnNhLgorICAgICAqLworICAgIGlmICghbWVtb3J5X3JlZ2lvbl9p
c19tYXBwZWRfc2hhcmVkKHNlY3Rpb24tPm1yKSkgeworICAgICAgICBzdGF0aWMgYm9vbCB3YXJu
ZWQ7CisgICAgICAgIHdhcm5fcmVwb3J0X29uY2VfY29uZCgmd2FybmVkLCAiRm91bmQgdmhvc3Qt
dXNlciBtZW1vcnkgcmVnaW9uICIKKyAgICAgICAgICAgICAgICAid2l0aG91dCBNQVBfU0hBUkVE
IChkaWQgeW91IGZvcmdldCAtb2JqZWN0ICIKKyAgICAgICAgICAgICAgICAibWVtb3J5LSosc2hh
cmU9b24/KSIpOworICAgICAgICByZXR1cm4gZmFsc2U7CisgICAgfQorICAgIHJldHVybiB0cnVl
OwogfQogCiBzdGF0aWMgaW50IHZob3N0X3VzZXJfZ2V0X2luZmxpZ2h0X2ZkKHN0cnVjdCB2aG9z
dF9kZXYgKmRldiwKLS0gCjIuMjkuMgoK


