Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA559173D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:52:36 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7isN-0006bS-Pz
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ikc-0002oa-Md
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ika-0005XD-OM
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:34 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:13250)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j7ika-0005Uz-CN
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1582908272; x=1614444272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUWIh60VIBZ0LRuhNAwMPb0vZxGR3JoiB9ulRsp8naY=;
 b=LlBBjBS+SQmPywNMZxbIfI7zB+uAqirrQudbLJ2a5genMN1RFubdiCdJ
 ldzTBj+63KMPslw/VbSnaIXKIZecFxhayimiRMhAGwy2QMHfAZlbFLa9R
 bhAy1LNr1xj09V+CoJN7ZoWCglBHIY+h64VtXv7tbA4y+Zf2JgxZcGcK/ o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Feb 2020 08:44:28 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 28 Feb 2020 08:44:28 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 329C8119A; Fri, 28 Feb 2020 10:44:28 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/67] Hexagon register map
Date: Fri, 28 Feb 2020 10:43:09 -0600
Message-Id: <1582908244-304-14-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
References: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.38
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q2VydGFpbiBvcGVyYW5kIHR5cGVzIHJlcHJlc2VudCBhIG5vbi1jb250aWd1b3VzIHNldCBvZiB2
YWx1ZXMuCkZvciBleGFtcGxlLCB0aGUgY29tcG91bmQgY29tcGFyZS1hbmQtanVtcCBpbnN0cnVj
dGlvbiBjYW4gb25seSBhY2Nlc3MKcmVnaXN0ZXJzIFIwLVI3IGFuZCBSMTYtMjMuClRoaXMgdGFi
bGUgcmVwcmVzZW50cyB0aGUgbWFwcGluZyBmcm9tIHRoZSBlbmNvZGluZyB0byB0aGUgYWN0dWFs
IHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9yZWdtYXAuaCB8IDM4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29uL3JlZ21hcC5oCgpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2hleGFnb24vcmVnbWFwLmggYi90YXJnZXQvaGV4YWdvbi9yZWdtYXAuaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4yYmNjMGRlCi0tLSAvZGV2L251bGwKKysrIGIv
dGFyZ2V0L2hleGFnb24vcmVnbWFwLmgKQEAgLTAsMCArMSwzOCBAQAorLyoKKyAqICBDb3B5cmln
aHQoYykgMjAxOS0yMDIwIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdo
dHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNl
bnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICog
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBp
bXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBh
IGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0
aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4K
KyAqLworCisvKgorICogIENlcnRhaW4gb3BlcmFuZCB0eXBlcyByZXByZXNlbnQgYSBub24tY29u
dGlndW91cyBzZXQgb2YgdmFsdWVzLgorICogIEZvciBleGFtcGxlLCB0aGUgY29tcG91bmQgY29t
cGFyZS1hbmQtanVtcCBpbnN0cnVjdGlvbiBjYW4gb25seSBhY2Nlc3MKKyAqICByZWdpc3RlcnMg
UjAtUjcgYW5kIFIxNi0yMy4KKyAqICBUaGlzIHRhYmxlIHJlcHJlc2VudHMgdGhlIG1hcHBpbmcg
ZnJvbSB0aGUgZW5jb2RpbmcgdG8gdGhlIGFjdHVhbCB2YWx1ZXMuCisgKi8KKworI2lmbmRlZiBI
RVhBR09OX1JFR01BUF9ICisjZGVmaW5lIEhFWEFHT05fUkVHTUFQX0gKKworICAgICAgICAvKiBO
YW1lICAgTnVtIFRhYmxlICovCitERUZfUkVHTUFQKFJfMTYsICAxNiwgMCwgMSwgMiwgMywgNCwg
NSwgNiwgNywgMTYsIDE3LCAxOCwgMTksIDIwLCAyMSwgMjIsIDIzKQorREVGX1JFR01BUChSX184
LCAgOCwgIDAsIDIsIDQsIDYsIDE2LCAxOCwgMjAsIDIyKQorREVGX1JFR01BUChSX180LCAgNCwg
IDAsIDIsIDQsIDYpCitERUZfUkVHTUFQKFJfNCwgICA0LCAgMCwgMSwgMiwgMykKK0RFRl9SRUdN
QVAoUl84UywgIDgsICAwLCAxLCAyLCAzLCAxNiwgMTcsIDE4LCAxOSkKK0RFRl9SRUdNQVAoUl84
LCAgIDgsICAwLCAxLCAyLCAzLCA0LCA1LCA2LCA3KQorREVGX1JFR01BUChWX184LCAgOCwgIDAs
IDQsIDgsIDEyLCAxNiwgMjAsIDI0LCAyOCkKK0RFRl9SRUdNQVAoVl9fMTYsIDE2LCAwLCAyLCA0
LCA2LCA4LCAxMCwgMTIsIDE0LCAxNiwgMTgsIDIwLCAyMiwgMjQsIDI2LCAyOCwgMzApCisKKyNl
bmRpZgotLSAKMi43LjQKCg==

