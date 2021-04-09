Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9335A6BC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:10:17 +0200 (CEST)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUwWG-0000QB-2W
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUwOi-0004pQ-7h
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUwOe-0000Kz-MK
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617994943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkPg0tL7I2ef+pb9boU4fPrBGU2236nCORY3RGZkAhU=;
 b=LRc3EAkIqoaj7nH9TsUdFyEo4jFPHZhkd2UzKF2IFc78SYH0UDEVfsBmYRfESxTSzDdSgE
 sZKkxMXeD9OJyeiWvrSRIJh3lcfcWGk1zpo8EgGPM1gHilcI7MBePDuZvi74Au9UcrkB72
 B7mw4ZhS7U4ihTCEknUBCGPyQSzwywE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-YbXuEb1-MMShqG7hCxpOTg-1; Fri, 09 Apr 2021 15:02:22 -0400
X-MC-Unique: YbXuEb1-MMShqG7hCxpOTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E8491858EC9
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 19:02:21 +0000 (UTC)
Received: from localhost (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A38421037E98;
 Fri,  9 Apr 2021 19:02:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs/devel/qgraph: add troubleshooting information
Date: Fri,  9 Apr 2021 20:01:09 +0100
Message-Id: <20210409190109.476167-3-stefanha@redhat.com>
In-Reply-To: <20210409190109.476167-1-stefanha@redhat.com>
References: <20210409190109.476167-1-stefanha@redhat.com>
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
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgY2FuIGJlIHRyaWNreSB0byB0cm91Ymxlc2hvb3QgcW9zLXRlc3Qgd2hlbiBhIHRlc3Qgd29u
J3QgZXhlY3V0ZS4gQWRkCmFuIGV4cGxhbmF0aW9uIG9mIGhvdyB0byB0cmFjZSBxZ3JhcGggbm9k
ZSBjb25uZWN0aXZpdHkgYW5kIGZpbmQgd2hpY2gKbm9kZSBoYXMgdGhlIHByb2JsZW0uCgpDYzog
RW1hbnVlbGUgR2l1c2VwcGUgRXNwb3NpdG8gPGVlc3Bvc2l0QHJlZGhhdC5jb20+CkNjOiBQYW9s
byBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogZG9jcy9kZXZlbC9xZ3JhcGgucnN0IHwg
NTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDU4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3FncmFwaC5y
c3QgYi9kb2NzL2RldmVsL3FncmFwaC5yc3QKaW5kZXggYTlhZmYxNjdhZC4uNDYzNWVmYjJjMiAx
MDA2NDQKLS0tIGEvZG9jcy9kZXZlbC9xZ3JhcGgucnN0CisrKyBiL2RvY3MvZGV2ZWwvcWdyYXBo
LnJzdApAQCAtOTIsNiArOTIsNjQgQEAgVGhlIGJhc2ljIGZyYW1ld29yayBzdGVwcyBhcmUgdGhl
IGZvbGxvd2luZzoKIERlcGVuZGluZyBvbiB0aGUgUUVNVSBiaW5hcnkgdXNlZCwgb25seSBzb21l
IGRyaXZlcnMvbWFjaGluZXMgd2lsbCBiZQogYXZhaWxhYmxlIGFuZCBvbmx5IHRlc3QgdGhhdCBh
cmUgcmVhY2hlZCBieSB0aGVtIHdpbGwgYmUgZXhlY3V0ZWQuCiAKK1Ryb3VibGVzaG9vdGluZyB1
bmF2YWlsYWJsZSB0ZXN0cworXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCitJZiB0
aGVyZSBpcyBubyBwYXRoIGZyb20gYW4gYXZhaWxhYmxlIG1hY2hpbmUgdG8gYSB0ZXN0IHRoZW4g
dGhhdCB0ZXN0IHdpbGwKK3VuYXZhaWxhYmxlIGFuZCBjYW5ub3QgZXhlY3V0ZS4gVGhpcyBjYW4g
aGFwcGVuIGlmIGEgdGVzdCBvciBkcml2ZXIgZGlkIG5vdCBzZXQKK3VwIGl0cyBxZ3JhcGggbm9k
ZSBjb3JyZWN0bHkuIEl0IGNhbiBhbHNvIGhhcHBlbiBpZiB0aGUgbmVjZXNzYXJ5IG1hY2hpbmUg
dHlwZQorb3IgZGV2aWNlIGlzIG1pc3NpbmcgZnJvbSB0aGUgUUVNVSBiaW5hcnkgYmVjYXVzZSBp
dCB3YXMgY29tcGlsZWQgb3V0IG9yCitvdGhlcndpc2UuCisKK0l0IGlzIHBvc3NpYmxlIHRvIHRy
b3VibGVzaG9vdCB1bmF2YWlsYWJsZSB0ZXN0cyBieSBydW5uaW5nOjoKKworICAkIFFURVNUX1FF
TVVfQklOQVJZPWJ1aWxkL3FlbXUtc3lzdGVtLXg4Nl82NCBidWlsZC90ZXN0cy9xdGVzdC9xb3Mt
dGVzdCAtLXZlcmJvc2UKKyAgIyBBTEwgUUdSQVBIIEVER0VTOiB7CisgICMgICBzcmM9J3ZpcnRp
by1uZXQnCisgICMgICAgICB8LT4gZGVzdD0ndmlydGlvLW5ldC10ZXN0cy92aG9zdC11c2VyL211
bHRpcXVldWUnIHR5cGU9MiAobm9kZT0weDU1OTE0MjEwOWUzMCkKKyAgIyAgICAgIHwtPiBkZXN0
PSd2aXJ0aW8tbmV0LXRlc3RzL3Zob3N0LXVzZXIvbWlncmF0ZScgdHlwZT0yIChub2RlPTB4NTU5
MTQyMTA5ZDAwKQorICAjICAgc3JjPSd2aXJ0aW8tbmV0LXBjaScKKyAgIyAgICAgIHwtPiBkZXN0
PSd2aXJ0aW8tbmV0JyB0eXBlPTEgKG5vZGU9MHg1NTkxNDIxMGQ3NDApCisgICMgICBzcmM9J3Bj
aS1idXMnCisgICMgICAgICB8LT4gZGVzdD0ndmlydGlvLW5ldC1wY2knIHR5cGU9MiAobm9kZT0w
eDU1OTE0MjEwZDg4MCkKKyAgIyAgIHNyYz0ncGNpLWJ1cy1wYycKKyAgIyAgICAgIHwtPiBkZXN0
PSdwY2ktYnVzJyB0eXBlPTEgKG5vZGU9MHg1NTkxNDIxMDNmNDApCisgICMgICBzcmM9J2k0NDBG
WC1wY2lob3N0JworICAjICAgICAgfC0+IGRlc3Q9J3BjaS1idXMtcGMnIHR5cGU9MCAobm9kZT0w
eDU1OTE0MjEwYWM3MCkKKyAgIyAgIHNyYz0neDg2XzY0L3BjJworICAjICAgICAgfC0+IGRlc3Q9
J2k0NDBGWC1wY2lob3N0JyB0eXBlPTAgKG5vZGU9MHg1NTkxNDIxMTE3ZjApCisgICMgICBzcmM9
JycKKyAgIyAgICAgIHwtPiBkZXN0PSd4ODZfNjQvcGMnIHR5cGU9MCAobm9kZT0weDU1OTE0MjEx
MTYwMCkKKyAgIyAgICAgIHwtPiBkZXN0PSdhcm0vcmFzcGkyJyB0eXBlPTAgKG5vZGU9MHg1NTkx
NDIxMTA3NDApCisgIC4uLgorICAjIH0KKyAgIyBBTEwgUUdSQVBIIE5PREVTOiB7CisgICMgICBu
YW1lPSd2aXJ0aW8tbmV0LXRlc3RzL2Fubm91bmNlLXNlbGYnIHR5cGU9MyBjbWRfbGluZT0nKG51
bGwpJyBbYXZhaWxhYmxlXQorICAjICAgbmFtZT0nYXJtL3Jhc3BpMicgdHlwZT0wIGNtZF9saW5l
PSctTSByYXNwaTIgJyBbVU5BVkFJTEFCTEVdCisgIC4uLgorICAjIH0KKworVGhlIGBgdmlydGlv
LW5ldC10ZXN0cy9hbm5vdW5jZS1zZWxmYGAgdGVzdCBpcyBsaXN0ZWQgYXMgImF2YWlsYWJsZSIg
aW4gdGhlCisiQUxMIFFHUkFQSCBOT0RFUyIgb3V0cHV0LiBUaGlzIG1lYW5zIHRoZSB0ZXN0IHdp
bGwgZXhlY3V0ZS4gV2UgY2FuIGZvbGxvdyB0aGUKK3FncmFwaCBwYXRoIGluIHRoZSAiQUxMIFFH
UkFQSCBFREdFUyIgb3V0cHV0IGFzIGZvbGxvd3M6ICcnIC0+ICd4ODZfNjQvcGMnIC0+CisnaTQ0
MEZYLXBjaWhvc3QnIC0+ICdwY2ktYnVzLXBjJyAtPiAncGNpLWJ1cycgLT4gJ3ZpcnRpby1uZXQt
cGNpJyAtPgorJ3ZpcnRpby1uZXQnLiBUaGUgcm9vdCBvZiB0aGUgcWdyYXBoIGlzICcnIGFuZCB0
aGUgZGVwdGggZmlyc3Qgc2VhcmNoIGJlZ2lucwordGhlcmUuCisKK1RoZSBgYGFybS9yYXNwaWBg
IG1hY2hpbmUgbm9kZSBpcyBsaXN0ZWQgYXMgIlVOQVZBSUxBQkxFIi4gQWx0aG91Z2ggaXQgaXMK
K3JlYWNoYWJsZSBmcm9tIHRoZSByb290IHZpYSAnJyAtPiAnYXJtL3Jhc3BpMicgdGhlIG5vZGUg
aXMgdW5hdmFpbGFibGUgYmVjYXVzZQordGhlIFFFTVUgYmluYXJ5IGRpZCBub3QgbGlzdCBpdCB3
aGVuIHF1ZXJpZWQgYnkgdGhlIGZyYW1ld29yay4gVGhpcyBpcyBleHBlY3RlZAorYmVjYXVzZSB3
ZSB1c2VkIHRoZSBgYHFlbXUtc3lzdGVtLXg4Nl82NGBgIGJpbmFyeSB3aGljaCBkb2VzIG5vdCBz
dXBwb3J0IEFSTQorbWFjaGluZSB0eXBlcy4KKworSWYgYSB0ZXN0IGlzIHVuZXhwZWN0ZWRseSBs
aXN0ZWQgYXMgIlVOQVZBSUxBQkxFIiwgZmlyc3QgY2hlY2sgdGhhdCB0aGUgIkFMTAorUUdSQVBI
IEVER0VTIiBvdXRwdXQgcmVwb3J0cyBlZGdlIGNvbm5lY3Rpdml0eSBmcm9tIHRoZSByb290ICgn
JykgdG8gdGhlIHRlc3QuCitJZiB0aGVyZSBpcyBubyBjb25uZWN0aXZpdHkgdGhlbiB0aGUgcWdy
YXBoIG5vZGVzIHdlcmUgbm90IHNldCB1cCBjb3JyZWN0bHkgYW5kCit0aGUgZHJpdmVyIG9yIHRl
c3QgY29kZSBpcyBpbmNvcnJlY3QuIElmIHRoZXJlIGlzIGNvbm5lY3Rpdml0eSwgY2hlY2sgdGhl
CithdmFpbGFiaWxpdHkgb2YgZWFjaCBub2RlIGluIHRoZSBwYXRoIGluIHRoZSAiQUxMIFFHUkFQ
SCBOT0RFUyIgb3V0cHV0LiBUaGUKK2ZpcnN0IHVuYXZhaWxhYmxlIG5vZGUgaW4gdGhlIHBhdGgg
aXMgdGhlIHJlYXNvbiB3aHkgdGhlIHRlc3QgaXMgdW5hdmFpbGFibGUuCitUeXBpY2FsbHkgdGhp
cyBpcyBiZWNhdXNlIHRoZSBRRU1VIGJpbmFyeSBsYWNrcyBzdXBwb3J0IGZvciB0aGUgbmVjZXNz
YXJ5CittYWNoaW5lIHR5cGUgb3IgZGV2aWNlLgorCiBDcmVhdGluZyBhIG5ldyBkcml2ZXIgYW5k
IGl0cyBpbnRlcmZhY2UKICIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIi
CiAKLS0gCjIuMzAuMgoK


