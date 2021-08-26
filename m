Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7E3F8D43
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:46:37 +0200 (CEST)
Received: from localhost ([::1]:39092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJSV-000643-UJ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIk-0004PH-57
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:30 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:10212)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIg-0005GW-QA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999386; x=1661535386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZVqEuL3lACcpOo+bvNAiYM7BeTIjwc3HIt7gss6FVKE=;
 b=VHTVQaBRE3h2geb8NEgWmZvFxW0SCKzxZAro82lPIPDSg9SdN5Rg+uQ0
 VPRTpZBAj9F22FMMHaXd7g8y0hzFpETV4foR0XP9SmUY/ZL0b62AtOjvf
 jPaJ937JdUyIMaxbP6qvCibF/HmEUWKTnvPvA3TOA1/55PoEPIyKR3N2P g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:15 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 78F6C14DD; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/30] Hexagon HVX (target/hexagon) helper overrides for
 histogram instructions
Date: Thu, 26 Aug 2021 12:35:41 -0500
Message-Id: <1629999358-25304-14-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCA5MSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19odnguaAppbmRleCBiNWM2Y2FkLi40MGZjYjU0IDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4
LmgKQEAgLTE4LDQgKzE4LDk1IEBACiAjaWZuZGVmIEhFWEFHT05fR0VOX1RDR19IVlhfSAogI2Rl
ZmluZSBIRVhBR09OX0dFTl9UQ0dfSFZYX0gKIAorLyoKKyAqIEhpc3RvZ3JhbSBpbnN0cnVjdGlv
bnMKKyAqCisgKiBOb3RlIHRoYXQgdGhlc2UgaW5zdHJ1Y3Rpb25zIG9wZXJhdGUgZGlyZWN0bHkg
b24gdGhlIHZlY3RvciByZWdpc3RlcnMKKyAqIGFuZCB0aGVyZWZvcmUgaGFwcGVuIGFmdGVyIGNv
bW1pdC4KKyAqCisgKiBUaGUgZ2VuZXJhdGVfPHRhZz4gZnVuY3Rpb24gaXMgY2FsbGVkIHR3aWNl
CisgKiAgICAgVGhlIGZpcnN0IHRpbWUgaXMgZHVyaW5nIHRoZSBub3JtYWwgVENHIGdlbmVyYXRp
b24KKyAqICAgICAgICAgY3R4LT5wcmVfY29tbWl0IGlzIHRydWUKKyAqICAgICAgICAgSW4gdGhl
IG1hc2tlZCBjYXNlcywgd2Ugc2F2ZSB0aGUgbWFzayB0byB0aGUgcXRtcCB0ZW1wb3JhcnkKKyAq
ICAgICAgICAgT3RoZXJ3aXNlLCB0aGVyZSBpcyBub3RoaW5nIHRvIGRvCisgKiAgICAgVGhlIHNl
Y29uZCBjYWxsIGlzIGF0IHRoZSBlbmQgb2YgZ2VuX2NvbW1pdF9wYWNrZXQKKyAqICAgICAgICAg
Y3R4LT5wcmVfY29tbWl0IGlzIGZhbHNlCisgKiAgICAgICAgIEdlbmVyYXRlIHRoZSBjYWxsIHRv
IHRoZSBoZWxwZXIKKyAqLworI2RlZmluZSBmR0VOX1RDR19WNl92aGlzdChTSE9SVENPREUpIFwK
KyAgICBpZiAoIWN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAgIGdlbl9oZWxwZXJfdmhpc3Qo
Y3B1X2Vudik7IFwKKyAgICB9CisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZoaXN0cShTSE9SVENPREUp
IFwKKyAgICBkbyB7IFwKKyAgICAgICAgaWYgKGN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAg
ICAgICBpbnRwdHJfdCBkc3RvZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0bXApOyBc
CisgICAgICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBkc3RvZmYsIFF2Vl9vZmYsIFwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1N
VmVjdG9yKSk7IFwKKyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92
aGlzdHEoY3B1X2Vudik7IFwKKyAgICAgICAgfSBcCisgICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUg
ZkdFTl9UQ0dfVjZfdndoaXN0MjU2KFNIT1JUQ09ERSkgXAorICAgIGlmICghY3R4LT5wcmVfY29t
bWl0KSB7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTYoY3B1X2Vudik7IFwKKyAgICB9
CisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3aGlzdDI1NnEoU0hPUlRDT0RFKSBcCisgICAgZG8geyBc
CisgICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAgICAgICAgaW50cHRyX3Qg
ZHN0b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBxdG1wKTsgXAorICAgICAgICAgICAg
dGNnX2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBRdlZfb2ZmLCBcCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpOyBcCisg
ICAgICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIGdlbl9oZWxwZXJfdndoaXN0MjU2cShjcHVf
ZW52KTsgXAorICAgICAgICB9IFwKKyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19W
Nl92d2hpc3QyNTZfc2F0KFNIT1JUQ09ERSkgXAorICAgIGlmICghY3R4LT5wcmVfY29tbWl0KSB7
IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTZfc2F0KGNwdV9lbnYpOyBcCisgICAgfQor
I2RlZmluZSBmR0VOX1RDR19WNl92d2hpc3QyNTZxX3NhdChTSE9SVENPREUpIFwKKyAgICBkbyB7
IFwKKyAgICAgICAgaWYgKGN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAgICAgICBpbnRwdHJf
dCBkc3RvZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0bXApOyBcCisgICAgICAgICAg
ICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBkc3RvZmYsIFF2Vl9vZmYsIFwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwK
KyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTZxX3Nh
dChjcHVfZW52KTsgXAorICAgICAgICB9IFwKKyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VO
X1RDR19WNl92d2hpc3QxMjgoU0hPUlRDT0RFKSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQp
IHsgXAorICAgICAgICBnZW5faGVscGVyX3Z3aGlzdDEyOChjcHVfZW52KTsgXAorICAgIH0KKyNk
ZWZpbmUgZkdFTl9UQ0dfVjZfdndoaXN0MTI4cShTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAg
ICAgICAgaWYgKGN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAgICAgICBpbnRwdHJfdCBkc3Rv
ZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0bXApOyBcCisgICAgICAgICAgICB0Y2df
Z2VuX2d2ZWNfbW92KE1PXzY0LCBkc3RvZmYsIFF2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAg
ICAgfSBlbHNlIHsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QxMjhxKGNwdV9lbnYp
OyBcCisgICAgICAgIH0gXAorICAgIH0gd2hpbGUgKDApCisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3
aGlzdDEyOG0oU0hPUlRDT0RFKSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQpIHsgXAorICAg
ICAgICBUQ0d2IHRjZ3ZfdWlWID0gdGNnX2NvbnN0X3RsKHVpVik7IFwKKyAgICAgICAgZ2VuX2hl
bHBlcl92d2hpc3QxMjhtKGNwdV9lbnYsIHRjZ3ZfdWlWKTsgXAorICAgICAgICB0Y2dfdGVtcF9m
cmVlKHRjZ3ZfdWlWKTsgXAorICAgIH0KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdndoaXN0MTI4cW0o
U0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsg
XAorICAgICAgICAgICAgaW50cHRyX3QgZHN0b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRl
LCBxdG1wKTsgXAorICAgICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBR
dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvciks
IHNpemVvZihNTVZlY3RvcikpOyBcCisgICAgICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIFRD
R3YgdGNndl91aVYgPSB0Y2dfY29uc3RfdGwodWlWKTsgXAorICAgICAgICAgICAgZ2VuX2hlbHBl
cl92d2hpc3QxMjhxbShjcHVfZW52LCB0Y2d2X3VpVik7IFwKKyAgICAgICAgICAgIHRjZ190ZW1w
X2ZyZWUodGNndl91aVYpOyBcCisgICAgICAgIH0gXAorICAgIH0gd2hpbGUgKDApCisKKwogI2Vu
ZGlmCi0tIAoyLjcuNAoK

