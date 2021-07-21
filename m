Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C43D0F53
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:16:11 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6C54-0005NO-Gt
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2P-0003JD-EC
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2N-0006eb-Tc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Haobh1jd428srZeJhM1s+YGnuG/LUO1GgjyL5lyzfI=;
 b=HjywnI+Ql75mNSCz3GbaOxT/JSw1vQCN4plWTSy4r9VhWDn2bg0qPtIOgK1ka1+KDr3SUg
 vuXrYinlRBNLHknD8aqI5WT3R6ccCQdIt7RRTkh1L6bB3bWKkhXKYZzr4/U1N/wfwtYwYq
 XwPkgV6gKTjBJuvEyIw7qwEQcUDpxnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-eZnd5luKOV-6f19-DZE80w-1; Wed, 21 Jul 2021 09:13:21 -0400
X-MC-Unique: eZnd5luKOV-6f19-DZE80w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1BD58C9B90;
 Wed, 21 Jul 2021 13:13:05 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 723D15C1BB;
 Wed, 21 Jul 2021 13:13:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 3/3] linux-aio: limit the batch size using
 `aio-max-batch` parameter
Date: Wed, 21 Jul 2021 14:12:53 +0100
Message-Id: <20210721131253.275821-4-stefanha@redhat.com>
In-Reply-To: <20210721131253.275821-1-stefanha@redhat.com>
References: <20210721131253.275821-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgoKV2hlbiB0aGVy
ZSBhcmUgbXVsdGlwbGUgcXVldWVzIGF0dGFjaGVkIHRvIHRoZSBzYW1lIEFJTyBjb250ZXh0LApz
b21lIHJlcXVlc3RzIG1heSBleHBlcmllbmNlIGhpZ2ggbGF0ZW5jeSwgc2luY2UgaW4gdGhlIHdv
cnN0IGNhc2UKdGhlIEFJTyBlbmdpbmUgcXVldWUgaXMgb25seSBmbHVzaGVkIHdoZW4gaXQgaXMg
ZnVsbCAoTUFYX0VWRU5UUykgb3IKdGhlcmUgYXJlIG5vIG1vcmUgcXVldWVzIHBsdWdnZWQuCgpD
b21taXQgMjU1OGNiOGRkNCAoImxpbnV4LWFpbzogaW5jcmVhc2luZyBNQVhfRVZFTlRTIHRvIGEg
bGFyZ2VyCmhhcmRjb2RlZCB2YWx1ZSIpIGNoYW5nZWQgTUFYX0VWRU5UUyBmcm9tIDEyOCB0byAx
MDI0LCB0byBpbmNyZWFzZQp0aGUgbnVtYmVyIG9mIGluLWZsaWdodCByZXF1ZXN0cy4gQnV0IHRo
aXMgY2hhbmdlIGFsc28gaW5jcmVhc2VkCnRoZSBwb3RlbnRpYWwgbWF4aW11bSBiYXRjaCB0byAx
MDI0IGVsZW1lbnRzLgoKV2hlbiB0aGVyZSBpcyBhIHNpbmdsZSBxdWV1ZSBhdHRhY2hlZCB0byB0
aGUgQUlPIGNvbnRleHQsIHRoZSBpc3N1ZQppcyBtaXRpZ2F0ZWQgZnJvbSBsYWlvX2lvX3VucGx1
ZygpIHRoYXQgd2lsbCBmbHVzaCB0aGUgcXVldWUgZXZlcnkKdGltZSBpcyBpbnZva2VkIHNpbmNl
IHRoZXJlIGNhbid0IGJlIG90aGVycyBxdWV1ZSBwbHVnZ2VkLgoKTGV0J3MgdXNlIHRoZSBuZXcg
YGFpby1tYXgtYmF0Y2hgIElPVGhyZWFkIHBhcmFtZXRlciB0byBtaXRpZ2F0ZQp0aGlzIGlzc3Vl
LCBsaW1pdGluZyB0aGUgbnVtYmVyIG9mIHJlcXVlc3RzIGluIGEgYmF0Y2guCgpXZSBhbHNvIGRl
ZmluZSBhIGRlZmF1bHQgdmFsdWUgKDMyKTogdGhpcyB2YWx1ZSBpcyBvYnRhaW5lZCBydW5uaW5n
CnNvbWUgYmVuY2htYXJrcyBhbmQgaXQgcmVwcmVzZW50cyBhIGdvb2QgdHJhZGVvZmYgYmV0d2Vl
biB0aGUgbGF0ZW5jeQppbmNyZWFzZSB3aGlsZSBhIHJlcXVlc3QgaXMgcXVldWVkIGFuZCB0aGUg
Y29zdCBvZiB0aGUgaW9fc3VibWl0KDIpCnN5c3RlbSBjYWxsLgoKU2lnbmVkLW9mZi1ieTogU3Rl
ZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDcy
MTA5NDIxMS42OTg1My00LXNnYXJ6YXJlQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGJsb2NrL2xpbnV4LWFpby5jIHwg
OSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9ibG9jay9saW51eC1haW8uYyBiL2Jsb2NrL2xpbnV4LWFpby5jCmlu
ZGV4IDNjMDUyN2MyYmYuLjBkYWI1MDdiNzEgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2xpbnV4LWFpby5j
CisrKyBiL2Jsb2NrL2xpbnV4LWFpby5jCkBAIC0yOCw2ICsyOCw5IEBACiAgKi8KICNkZWZpbmUg
TUFYX0VWRU5UUyAxMDI0CiAKKy8qIE1heGltdW0gbnVtYmVyIG9mIHJlcXVlc3RzIGluIGEgYmF0
Y2guIChkZWZhdWx0IHZhbHVlKSAqLworI2RlZmluZSBERUZBVUxUX01BWF9CQVRDSCAzMgorCiBz
dHJ1Y3QgcWVtdV9sYWlvY2IgewogICAgIENvcm91dGluZSAqY287CiAgICAgTGludXhBaW9TdGF0
ZSAqY3R4OwpAQCAtMzUxLDYgKzM1NCwxMCBAQCBzdGF0aWMgaW50IGxhaW9fZG9fc3VibWl0KGlu
dCBmZCwgc3RydWN0IHFlbXVfbGFpb2NiICpsYWlvY2IsIG9mZl90IG9mZnNldCwKICAgICBMaW51
eEFpb1N0YXRlICpzID0gbGFpb2NiLT5jdHg7CiAgICAgc3RydWN0IGlvY2IgKmlvY2JzID0gJmxh
aW9jYi0+aW9jYjsKICAgICBRRU1VSU9WZWN0b3IgKnFpb3YgPSBsYWlvY2ItPnFpb3Y7CisgICAg
aW50NjRfdCBtYXhfYmF0Y2ggPSBzLT5haW9fY29udGV4dC0+YWlvX21heF9iYXRjaCA/OiBERUZB
VUxUX01BWF9CQVRDSDsKKworICAgIC8qIGxpbWl0IHRoZSBiYXRjaCB3aXRoIHRoZSBudW1iZXIg
b2YgYXZhaWxhYmxlIGV2ZW50cyAqLworICAgIG1heF9iYXRjaCA9IE1JTl9OT05fWkVSTyhNQVhf
RVZFTlRTIC0gcy0+aW9fcS5pbl9mbGlnaHQsIG1heF9iYXRjaCk7CiAKICAgICBzd2l0Y2ggKHR5
cGUpIHsKICAgICBjYXNlIFFFTVVfQUlPX1dSSVRFOgpAQCAtMzcxLDcgKzM3OCw3IEBAIHN0YXRp
YyBpbnQgbGFpb19kb19zdWJtaXQoaW50IGZkLCBzdHJ1Y3QgcWVtdV9sYWlvY2IgKmxhaW9jYiwg
b2ZmX3Qgb2Zmc2V0LAogICAgIHMtPmlvX3EuaW5fcXVldWUrKzsKICAgICBpZiAoIXMtPmlvX3Eu
YmxvY2tlZCAmJgogICAgICAgICAoIXMtPmlvX3EucGx1Z2dlZCB8fAotICAgICAgICAgcy0+aW9f
cS5pbl9mbGlnaHQgKyBzLT5pb19xLmluX3F1ZXVlID49IE1BWF9FVkVOVFMpKSB7CisgICAgICAg
ICBzLT5pb19xLmluX3F1ZXVlID49IG1heF9iYXRjaCkpIHsKICAgICAgICAgaW9xX3N1Ym1pdChz
KTsKICAgICB9CiAKLS0gCjIuMzEuMQoK


