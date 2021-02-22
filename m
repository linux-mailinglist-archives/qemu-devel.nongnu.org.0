Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B39321C9D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:18:44 +0100 (CET)
Received: from localhost ([::1]:44540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDv1-0001iT-J7
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnh-0002ZY-Dg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEDnf-0002B8-MH
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfKyB3gUAqSG9wFlu0Z7cbVS/JqR/5j8rNgFaP0cEJw=;
 b=Ii6lRoMbGM/ZCKY7n0TL28n0xlxn+CwafTrCs67mL65i2h4aYKCDF2A/BOuaAaj4lqzPBD
 HZNA5b46oNJsECffoO/4eASOi23MbUIXupc7DJ8JCxuq2LxG95bS9qa5NguuJOYpqDvyh/
 72sBGvKev9cXJRWDaSEU0LrKF2Y5Jf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-qdD2Q4iBNzW9w6STYXwIAg-1; Mon, 22 Feb 2021 11:11:01 -0500
X-MC-Unique: qdD2Q4iBNzW9w6STYXwIAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFCEA86A060
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:11:00 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03FCA1024817;
 Mon, 22 Feb 2021 16:10:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] memory: add memory_region_is_mapped_shared()
Date: Mon, 22 Feb 2021 16:10:16 +0000
Message-Id: <20210222161017.570837-3-stefanha@redhat.com>
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

QWRkIGEgZnVuY3Rpb24gdG8gcXVlcnkgd2hldGhlciBhIG1lbW9yeSByZWdpb24gaXMgbW1hcChN
QVBfU0hBUkVEKS4KVGhpcyB3aWxsIGJlIHVzZWQgdG8gY2hlY2sgdGhhdCB2aG9zdC11c2VyIG1l
bW9yeSByZWdpb25zIGNhbiBiZSBzaGFyZWQKd2l0aCB0aGUgZGV2aWNlIGJhY2tlbmQgcHJvY2Vz
cyBpbiB0aGUgbmV4dCBwYXRjaC4KCkFuIGlubGluZSBmdW5jdGlvbiBpbiAiZXhlYy9tZW1vcnku
aCIgd291bGQgaGF2ZSBiZWVuIG5pY2UgYnV0IFJBTUJsb2NrCmZpZWxkcyBhcmUgb25seSBhY2Nl
c3NpYmxlIGZyb20gbWVtb3J5LmMgKHNlZSAiZXhlYy9yYW1ibG9jay5oIikuCgpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9l
eGVjL21lbW9yeS5oIHwgMTEgKysrKysrKysrKysKIHNvZnRtbXUvbWVtb3J5LmMgICAgICB8ICA2
ICsrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9leGVjL21lbW9yeS5oIGIvaW5jbHVkZS9leGVjL21lbW9yeS5oCmluZGV4IGM2ZmI3
MTRlNDkuLjdiN2RiZTlmZDAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZXhlYy9tZW1vcnkuaAorKysg
Yi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgKQEAgLTI0NTcsNiArMjQ1NywxNyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgbWVtb3J5X2FjY2Vzc19pc19kaXJlY3QoTWVtb3J5UmVnaW9uICptciwgYm9vbCBp
c193cml0ZSkKICAgICB9CiB9CiAKKy8qKgorICogbWVtb3J5X3JlZ2lvbl9pc19tYXBwZWRfc2hh
cmVkOiBjaGVjayB3aGV0aGVyIGEgbWVtb3J5IHJlZ2lvbiBpcworICogbW1hcChNQVBfU0hBUkVE
KQorICoKKyAqIFJldHVybnMgJXRydWUgaXMgYSBtZW1vcnkgcmVnaW9uIGlzIG1tYXAoTUFQX1NI
QVJFRCkuIFRoaXMgaXMgYWx3YXlzIGZhbHNlCisgKiBvbiBtZW1vcnkgcmVnaW9ucyB0aGF0IGRv
IG5vdCBzdXBwb3J0IG1lbW9yeV9yZWdpb25fZ2V0X3JhbV9wdHIoKS4KKyAqCisgKiBAbXI6IHRo
ZSBtZW1vcnkgcmVnaW9uIGJlaW5nIHF1ZXJpZWQKKyAqLworYm9vbCBtZW1vcnlfcmVnaW9uX2lz
X21hcHBlZF9zaGFyZWQoTWVtb3J5UmVnaW9uICptcik7CisKIC8qKgogICogYWRkcmVzc19zcGFj
ZV9yZWFkOiByZWFkIGZyb20gYW4gYWRkcmVzcyBzcGFjZS4KICAqCmRpZmYgLS1naXQgYS9zb2Z0
bW11L21lbW9yeS5jIGIvc29mdG1tdS9tZW1vcnkuYwppbmRleCA4NzRhOGZjY2RlLi5lNjYzMWU1
ZDRjIDEwMDY0NAotLS0gYS9zb2Z0bW11L21lbW9yeS5jCisrKyBiL3NvZnRtbXUvbWVtb3J5LmMK
QEAgLTE4MDksNiArMTgwOSwxMiBAQCBib29sIG1lbW9yeV9yZWdpb25faXNfcmFtX2RldmljZShN
ZW1vcnlSZWdpb24gKm1yKQogICAgIHJldHVybiBtci0+cmFtX2RldmljZTsKIH0KIAorYm9vbCBt
ZW1vcnlfcmVnaW9uX2lzX21hcHBlZF9zaGFyZWQoTWVtb3J5UmVnaW9uICptcikKK3sKKyAgICBy
ZXR1cm4gbWVtb3J5X2FjY2Vzc19pc19kaXJlY3QobXIsIGZhbHNlKSAmJgorICAgICAgICAgICAo
bXItPnJhbV9ibG9jay0+ZmxhZ3MgJiBSQU1fU0hBUkVEKTsKK30KKwogdWludDhfdCBtZW1vcnlf
cmVnaW9uX2dldF9kaXJ0eV9sb2dfbWFzayhNZW1vcnlSZWdpb24gKm1yKQogewogICAgIHVpbnQ4
X3QgbWFzayA9IG1yLT5kaXJ0eV9sb2dfbWFzazsKLS0gCjIuMjkuMgoK


