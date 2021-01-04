Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB522E9BD8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:19:09 +0100 (CET)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTVc-0006nl-3W
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQZ-00021S-PP
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwTQX-0002Sg-4m
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609780431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmziWGG3iR9SW4enWSD6rryB71UeydLuL8gvMlFBO8k=;
 b=MfBR5ptZFLZIPbQ0XzJUx6X34mJQFoi1a2ld+K8QvHh4/DK2pz3asiR6lOKEiG48JnmBXS
 R771yCJEqwqGWLomkKhpVDcbFsc9ZnliPDWFtJgft98cN7q8PWK+c9yM6ncZuMUfGGoOEr
 p4z4kvFlvHiUZhaV2q2daweaWn7fKqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-riqY7QKJOSKgznmq_SFEVQ-1; Mon, 04 Jan 2021 12:13:47 -0500
X-MC-Unique: riqY7QKJOSKgznmq_SFEVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AC08107ACF8;
 Mon,  4 Jan 2021 17:13:46 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EA685D751;
 Mon,  4 Jan 2021 17:13:45 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] nvdimm: check -object memory-backend-file,
 readonly=on option
Date: Mon,  4 Jan 2021 17:13:20 +0000
Message-Id: <20210104171320.575838-4-stefanha@redhat.com>
In-Reply-To: <20210104171320.575838-1-stefanha@redhat.com>
References: <20210104171320.575838-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, eric.g.ernst@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2hlY2sgdGhhdCAtZGV2aWNlIG52ZGltbSx1bmFybWVkPW9uIGlzIHVzZWQgd2hlbiAtb2JqZWN0
Cm1lbW9yeS1iYWNrZW5kLWZpbGUscmVhZG9ubHk9b24gYW5kIGRvY3VtZW50IHRoYXQgLWRldmlj
ZQpudmRpbW0sdW5hcm1lZD1vbnxvZmYgY29udHJvbHMgd2hldGhlciB0aGUgTlZESU1NIGFwcGVh
cnMgcmVhZC1vbmx5IHRvCnRoZSBndWVzdC4KCkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4g
PG1zdEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogTGlhbSBNZXJ3aWNrIDxsaWFtLm1lcndpY2tA
b3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRo
YXQuY29tPgotLS0KdjM6CiAqIFByb2R1Y2UgYW4gZXJyb3Igd2hlbiAtZGV2aWNlIG52ZGltbSx1
bmFybWVkPW9mZiBpcyB1c2VkIHdpdGggLW9iamVjdAogICBtZW1vcnktYmFja2VuZC1maWxlLHJl
YWRvbmx5PW9uIGluc3RlYWQgb2Ygc2lsZW50bHkgc3dpdGNoaW5nIG9uCiAgIHVuYXJtZWQuIFtJ
Z29yXQotLS0KIGRvY3MvbnZkaW1tLnR4dCB8IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0tLQog
aHcvbWVtL252ZGltbS5jIHwgIDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9udmRpbW0udHh0IGIv
ZG9jcy9udmRpbW0udHh0CmluZGV4IGMyYzZlNDQxYjMuLjBhYWU2ODJiZTMgMTAwNjQ0Ci0tLSBh
L2RvY3MvbnZkaW1tLnR4dAorKysgYi9kb2NzL252ZGltbS50eHQKQEAgLTE3LDggKzE3LDggQEAg
Zm9sbG93aW5nIGNvbW1hbmQgbGluZSBvcHRpb25zOgogCiAgLW1hY2hpbmUgcGMsbnZkaW1tCiAg
LW0gJFJBTV9TSVpFLHNsb3RzPSROLG1heG1lbT0kTUFYX1NJWkUKLSAtb2JqZWN0IG1lbW9yeS1i
YWNrZW5kLWZpbGUsaWQ9bWVtMSxzaGFyZT1vbixtZW0tcGF0aD0kUEFUSCxzaXplPSROVkRJTU1f
U0laRQotIC1kZXZpY2UgbnZkaW1tLGlkPW52ZGltbTEsbWVtZGV2PW1lbTEKKyAtb2JqZWN0IG1l
bW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtMSxzaGFyZT1vbixtZW0tcGF0aD0kUEFUSCxzaXplPSRO
VkRJTU1fU0laRSxyZWFkb25seT1vZmYKKyAtZGV2aWNlIG52ZGltbSxpZD1udmRpbW0xLG1lbWRl
dj1tZW0xLHVuYXJtZWQ9b2ZmCiAKIFdoZXJlLAogCkBAIC0zMSw5ICszMSwxMCBAQCBXaGVyZSwK
ICAgIG9mIG5vcm1hbCBSQU0gZGV2aWNlcyBhbmQgdk5WRElNTSBkZXZpY2VzLCBlLmcuICRNQVhf
U0laRSBzaG91bGQgYmUKICAgID49ICRSQU1fU0laRSArICROVkRJTU1fU0laRSBoZXJlLgogCi0g
LSAib2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtMSxzaGFyZT1vbixtZW0tcGF0aD0k
UEFUSCxzaXplPSROVkRJTU1fU0laRSIKLSAgIGNyZWF0ZXMgYSBiYWNrZW5kIHN0b3JhZ2Ugb2Yg
c2l6ZSAkTlZESU1NX1NJWkUgb24gYSBmaWxlICRQQVRILiBBbGwKLSAgIGFjY2Vzc2VzIHRvIHRo
ZSB2aXJ0dWFsIE5WRElNTSBkZXZpY2UgZ28gdG8gdGhlIGZpbGUgJFBBVEguCisgLSAib2JqZWN0
IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9bWVtMSxzaGFyZT1vbixtZW0tcGF0aD0kUEFUSCwKKyAg
IHNpemU9JE5WRElNTV9TSVpFLHJlYWRvbmx5PW9mZiIgY3JlYXRlcyBhIGJhY2tlbmQgc3RvcmFn
ZSBvZiBzaXplCisgICAkTlZESU1NX1NJWkUgb24gYSBmaWxlICRQQVRILiBBbGwgYWNjZXNzZXMg
dG8gdGhlIHZpcnR1YWwgTlZESU1NIGRldmljZSBnbworICAgdG8gdGhlIGZpbGUgJFBBVEguCiAK
ICAgICJzaGFyZT1vbi9vZmYiIGNvbnRyb2xzIHRoZSB2aXNpYmlsaXR5IG9mIGd1ZXN0IHdyaXRl
cy4gSWYKICAgICJzaGFyZT1vbiIsIHRoZW4gZ3Vlc3Qgd3JpdGVzIHdpbGwgYmUgYXBwbGllZCB0
byB0aGUgYmFja2VuZApAQCAtNDIsOCArNDMsMTcgQEAgV2hlcmUsCiAgICAic2hhcmU9b2ZmIiwg
dGhlbiBndWVzdCB3cml0ZXMgd29uJ3QgYmUgYXBwbGllZCB0byB0aGUgYmFja2VuZAogICAgZmls
ZSBhbmQgdGh1cyB3aWxsIGJlIGludmlzaWJsZSB0byBvdGhlciBndWVzdHMuCiAKLSAtICJkZXZp
Y2UgbnZkaW1tLGlkPW52ZGltbTEsbWVtZGV2PW1lbTEiIGNyZWF0ZXMgYSB2aXJ0dWFsIE5WRElN
TQotICAgZGV2aWNlIHdob3NlIHN0b3JhZ2UgaXMgcHJvdmlkZWQgYnkgYWJvdmUgbWVtb3J5IGJh
Y2tlbmQgZGV2aWNlLgorICAgInJlYWRvbmx5PW9uL29mZiIgY29udHJvbHMgd2hldGhlciB0aGUg
ZmlsZSAkUEFUSCBpcyBvcGVuZWQgcmVhZC1vbmx5IG9yCisgICByZWFkL3dyaXRlIChkZWZhdWx0
KS4KKworIC0gImRldmljZSBudmRpbW0saWQ9bnZkaW1tMSxtZW1kZXY9bWVtMSx1bmFybWVkPW9m
ZiIgY3JlYXRlcyBhIHJlYWQvd3JpdGUKKyAgIHZpcnR1YWwgTlZESU1NIGRldmljZSB3aG9zZSBz
dG9yYWdlIGlzIHByb3ZpZGVkIGJ5IGFib3ZlIG1lbW9yeSBiYWNrZW5kCisgICBkZXZpY2UuCisK
KyAgICJ1bmFybWVkIiBjb250cm9scyB0aGUgQUNQSSBORklUIE5WRElNTSBSZWdpb24gTWFwcGlu
ZyBTdHJ1Y3R1cmUgIk5WRElNTQorICAgU3RhdGUgRmxhZ3MiIEJpdCAzIGluZGljYXRpbmcgdGhh
dCB0aGUgZGV2aWNlIGlzICJ1bmFybWVkIiBhbmQgY2Fubm90IGFjY2VwdAorICAgcGVyc2lzdGVu
dCB3cml0ZXMuIExpbnV4IGd1ZXN0IGRyaXZlcnMgc2V0IHRoZSBkZXZpY2UgdG8gcmVhZC1vbmx5
IHdoZW4gdGhpcworICAgYml0IGlzIHByZXNlbnQuIFNldCB1bmFybWVkIHRvIG9uIHdoZW4gdGhl
IG1lbWRldiBoYXMgcmVhZG9ubHk9b24uCiAKIE11bHRpcGxlIHZOVkRJTU0gZGV2aWNlcyBjYW4g
YmUgY3JlYXRlZCBpZiBtdWx0aXBsZSBwYWlycyBvZiAiLW9iamVjdCIKIGFuZCAiLWRldmljZSIg
YXJlIHByb3ZpZGVkLgpkaWZmIC0tZ2l0IGEvaHcvbWVtL252ZGltbS5jIGIvaHcvbWVtL252ZGlt
bS5jCmluZGV4IDAzYzIyMDFiNTYuLmUwYTlkNjA2ZTEgMTAwNjQ0Ci0tLSBhL2h3L21lbS9udmRp
bW0uYworKysgYi9ody9tZW0vbnZkaW1tLmMKQEAgLTE0Niw2ICsxNDYsMTUgQEAgc3RhdGljIHZv
aWQgbnZkaW1tX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbihOVkRJTU1EZXZpY2UgKm52ZGltbSwgRXJy
b3IgKiplcnJwKQogICAgICAgICByZXR1cm47CiAgICAgfQogCisgICAgaWYgKCFudmRpbW0tPnVu
YXJtZWQgJiYgbWVtb3J5X3JlZ2lvbl9pc19yb20obXIpKSB7CisgICAgICAgIEhvc3RNZW1vcnlC
YWNrZW5kICpob3N0bWVtID0gZGltbS0+aG9zdG1lbTsKKworICAgICAgICBlcnJvcl9zZXRnKGVy
cnAsICIndW5hcm1lZCcgcHJvcGVydHkgbXVzdCBiZSBvZmYgc2luY2UgbWVtZGV2ICVzICIKKyAg
ICAgICAgICAgICAgICAgICAiaXMgcmVhZC1vbmx5IiwKKyAgICAgICAgICAgICAgICAgICBvYmpl
Y3RfZ2V0X2Nhbm9uaWNhbF9wYXRoX2NvbXBvbmVudChPQkpFQ1QoaG9zdG1lbSkpKTsKKyAgICAg
ICAgcmV0dXJuOworICAgIH0KKwogICAgIG52ZGltbS0+bnZkaW1tX21yID0gZ19uZXcoTWVtb3J5
UmVnaW9uLCAxKTsKICAgICBtZW1vcnlfcmVnaW9uX2luaXRfYWxpYXMobnZkaW1tLT5udmRpbW1f
bXIsIE9CSkVDVChkaW1tKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm52ZGltbS1t
ZW1vcnkiLCBtciwgMCwgcG1lbV9zaXplKTsKLS0gCjIuMjkuMgoK


