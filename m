Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C5168DC5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Feb 2020 09:58:52 +0100 (CET)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Qcd-0001vS-Fq
	for lists+qemu-devel@lfdr.de; Sat, 22 Feb 2020 03:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j5QXn-0001IG-Pn
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j5QXm-0000ta-Jf
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35497
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j5QXm-0000t3-E1
 for qemu-devel@nongnu.org; Sat, 22 Feb 2020 03:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582361630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LAZyfV6cE+9qupmeUil5CcBoBdp93oxLrdi2n/Y7to=;
 b=RdIbXOaEs+I5v9IY/ymMuuEouPZzIRzWdGZpRbHoQB+WXhlVQYRtf4uWxrCNNktf6NPn4g
 ypMdO03i6WCO2ckHpcn4/iKbUZF17sP+S1LugC320W7SDs4zUdpAgifIATGUCGoeBbCmgT
 4FaahCAsLVuXPL47cfs7D34LxXvJPsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-_lttpwV2M0ST6PSveKCXLQ-1; Sat, 22 Feb 2020 03:53:47 -0500
X-MC-Unique: _lttpwV2M0ST6PSveKCXLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52717184B13F;
 Sat, 22 Feb 2020 08:53:46 +0000 (UTC)
Received: from localhost (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 857C88B74A;
 Sat, 22 Feb 2020 08:53:35 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/31] qtest: add in-process incoming command handler
Date: Sat, 22 Feb 2020 08:50:16 +0000
Message-Id: <20200222085030.1760640-18-stefanha@redhat.com>
In-Reply-To: <20200222085030.1760640-1-stefanha@redhat.com>
References: <20200222085030.1760640-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Darren Kenny <darren.kenny@oracle.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQWxleGFuZGVyIEJ1bGVrb3YgPGFseG5kckBidS5lZHU+CgpUaGUgaGFuZGxlciBhbGxv
d3MgYSBxdGVzdCBjbGllbnQgdG8gc2VuZCBjb21tYW5kcyB0byB0aGUgc2VydmVyIGJ5CmRpcmVj
dGx5IGNhbGxpbmcgYSBmdW5jdGlvbiwgcmF0aGVyIHRoYW4gdXNpbmcgYSBmaWxlL0NoYXJCYWNr
ZW5kCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgQnVsZWtvdiA8YWx4bmRyQGJ1LmVkdT4KUmV2
aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQt
Ynk6IERhcnJlbiBLZW5ueSA8ZGFycmVuLmtlbm55QG9yYWNsZS5jb20+Ck1lc3NhZ2UtaWQ6IDIw
MjAwMjIwMDQxMTE4LjIzMjY0LTktYWx4bmRyQGJ1LmVkdQpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4g
SGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9zeXNlbXUvcXRlc3Qu
aCB8ICAxICsKIHF0ZXN0LmMgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3N5c2Vt
dS9xdGVzdC5oIGIvaW5jbHVkZS9zeXNlbXUvcXRlc3QuaAppbmRleCBlMmYxMDQ3ZmQ3Li5lZWRk
MzY2NGYwIDEwMDY0NAotLS0gYS9pbmNsdWRlL3N5c2VtdS9xdGVzdC5oCisrKyBiL2luY2x1ZGUv
c3lzZW11L3F0ZXN0LmgKQEAgLTI4LDUgKzI4LDYgQEAgdm9pZCBxdGVzdF9zZXJ2ZXJfaW5pdChj
b25zdCBjaGFyICpxdGVzdF9jaHJkZXYsIGNvbnN0IGNoYXIgKnF0ZXN0X2xvZywgRXJyb3IgKioK
IAogdm9pZCBxdGVzdF9zZXJ2ZXJfc2V0X3NlbmRfaGFuZGxlcih2b2lkICgqc2VuZCkodm9pZCAq
LCBjb25zdCBjaGFyICopLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
b3BhcXVlKTsKK3ZvaWQgcXRlc3Rfc2VydmVyX2lucHJvY19yZWN2KHZvaWQgKm9wYXF1ZSwgY29u
c3QgY2hhciAqYnVmKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9xdGVzdC5jIGIvcXRlc3QuYwpp
bmRleCA4YTRiYTU5ODI4Li40M2JiOTBmNTNlIDEwMDY0NAotLS0gYS9xdGVzdC5jCisrKyBiL3F0
ZXN0LmMKQEAgLTgwNCwzICs4MDQsMTYgQEAgYm9vbCBxdGVzdF9kcml2ZXIodm9pZCkKIHsKICAg
ICByZXR1cm4gcXRlc3RfY2hyLmNociAhPSBOVUxMOwogfQorCit2b2lkIHF0ZXN0X3NlcnZlcl9p
bnByb2NfcmVjdih2b2lkICpkdW1teSwgY29uc3QgY2hhciAqYnVmKQoreworICAgIHN0YXRpYyBH
U3RyaW5nICpnc3RyOworICAgIGlmICghZ3N0cikgeworICAgICAgICBnc3RyID0gZ19zdHJpbmdf
bmV3KE5VTEwpOworICAgIH0KKyAgICBnX3N0cmluZ19hcHBlbmQoZ3N0ciwgYnVmKTsKKyAgICBp
ZiAoZ3N0ci0+c3RyW2dzdHItPmxlbiAtIDFdID09ICdcbicpIHsKKyAgICAgICAgcXRlc3RfcHJv
Y2Vzc19pbmJ1ZihOVUxMLCBnc3RyKTsKKyAgICAgICAgZ19zdHJpbmdfdHJ1bmNhdGUoZ3N0ciwg
MCk7CisgICAgfQorfQotLSAKMi4yNC4xCgo=


