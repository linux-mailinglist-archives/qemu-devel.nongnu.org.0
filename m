Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5859F42A1E7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:20:44 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEtn-0000mj-BK
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEkx-0000ZX-EB
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:36 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12878)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maEkv-0006y1-Ki
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634033493; x=1665569493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oau7xqaEz0ArC6cVJZqDdEH2oQSa8dL507+tY4f6SWQ=;
 b=jgNRw4KtDhG0GaXFBWpyhoW6Da8vCq3d6G4mOqJRl4XdXroBn9QgDnj4
 q+s6in0zojIxkoVHmB+IW9G79KR+Y2jiwPs012mXGfekatDByTtz4URdq
 /cdxz6w7hdUE2Rq9R1KVMlMS8B3hULcLvlzs39osepj6glgVrzg9U7AdT E=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Oct 2021 03:11:24 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 12 Oct 2021 03:11:23 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 5B16C167F; Tue, 12 Oct 2021 05:11:22 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/30] Hexagon HVX (target/hexagon) helper overrides for
 histogram instructions
Date: Tue, 12 Oct 2021 05:10:52 -0500
Message-Id: <1634033468-23566-15-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggfCAxMDYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCBiL3RhcmdldC9oZXhh
Z29uL2dlbl90Y2dfaHZ4LmgKaW5kZXggYjVjNmNhZC4uYTU2MDUwNCAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vZ2VuX3RjZ19odnguaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2
eC5oCkBAIC0xOCw0ICsxOCwxMTAgQEAKICNpZm5kZWYgSEVYQUdPTl9HRU5fVENHX0hWWF9ICiAj
ZGVmaW5lIEhFWEFHT05fR0VOX1RDR19IVlhfSAogCisvKgorICogSGlzdG9ncmFtIGluc3RydWN0
aW9ucworICoKKyAqIE5vdGUgdGhhdCB0aGVzZSBpbnN0cnVjdGlvbnMgb3BlcmF0ZSBkaXJlY3Rs
eSBvbiB0aGUgdmVjdG9yIHJlZ2lzdGVycworICogYW5kIHRoZXJlZm9yZSBoYXBwZW4gYWZ0ZXIg
Y29tbWl0LgorICoKKyAqIFRoZSBnZW5lcmF0ZV88dGFnPiBmdW5jdGlvbiBpcyBjYWxsZWQgdHdp
Y2UKKyAqICAgICBUaGUgZmlyc3QgdGltZSBpcyBkdXJpbmcgdGhlIG5vcm1hbCBUQ0cgZ2VuZXJh
dGlvbgorICogICAgICAgICBjdHgtPnByZV9jb21taXQgaXMgdHJ1ZQorICogICAgICAgICBJbiB0
aGUgbWFza2VkIGNhc2VzLCB3ZSBzYXZlIHRoZSBtYXNrIHRvIHRoZSBxdG1wIHRlbXBvcmFyeQor
ICogICAgICAgICBPdGhlcndpc2UsIHRoZXJlIGlzIG5vdGhpbmcgdG8gZG8KKyAqICAgICBUaGUg
c2Vjb25kIGNhbGwgaXMgYXQgdGhlIGVuZCBvZiBnZW5fY29tbWl0X3BhY2tldAorICogICAgICAg
ICBjdHgtPnByZV9jb21taXQgaXMgZmFsc2UKKyAqICAgICAgICAgR2VuZXJhdGUgdGhlIGNhbGwg
dG8gdGhlIGhlbHBlcgorICovCisKK3N0YXRpYyBpbmxpbmUgdm9pZCBhc3NlcnRfdmhpc3RfdG1w
KERpc2FzQ29udGV4dCAqY3R4KQoreworICAgIC8qIHZoaXN0IGluc3RydWN0aW9ucyByZXF1aXJl
IGV4YWN0bHkgb25lIC50bXAgdG8gYmUgZGVmaW5lZCAqLworICAgIGdfYXNzZXJ0KGN0eC0+dG1w
X3ZyZWdzX2lkeCA9PSAxKTsKK30KKworI2RlZmluZSBmR0VOX1RDR19WNl92aGlzdChTSE9SVENP
REUpIFwKKyAgICBpZiAoIWN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAgIGFzc2VydF92aGlz
dF90bXAoY3R4KTsgXAorICAgICAgICBnZW5faGVscGVyX3ZoaXN0KGNwdV9lbnYpOyBcCisgICAg
fQorI2RlZmluZSBmR0VOX1RDR19WNl92aGlzdHEoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisg
ICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAgICAgICAgaW50cHRyX3QgZHN0
b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBxdG1wKTsgXAorICAgICAgICAgICAgdGNn
X2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBRdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpOyBcCisgICAg
ICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIGFzc2VydF92aGlzdF90bXAoY3R4KTsgXAorICAg
ICAgICAgICAgZ2VuX2hlbHBlcl92aGlzdHEoY3B1X2Vudik7IFwKKyAgICAgICAgfSBcCisgICAg
fSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdndoaXN0MjU2KFNIT1JUQ09ERSkgXAor
ICAgIGlmICghY3R4LT5wcmVfY29tbWl0KSB7IFwKKyAgICAgICAgYXNzZXJ0X3ZoaXN0X3RtcChj
dHgpOyBcCisgICAgICAgIGdlbl9oZWxwZXJfdndoaXN0MjU2KGNwdV9lbnYpOyBcCisgICAgfQor
I2RlZmluZSBmR0VOX1RDR19WNl92d2hpc3QyNTZxKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAor
ICAgICAgICBpZiAoY3R4LT5wcmVfY29tbWl0KSB7IFwKKyAgICAgICAgICAgIGludHB0cl90IGRz
dG9mZiA9IG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgcXRtcCk7IFwKKyAgICAgICAgICAgIHRj
Z19nZW5fZ3ZlY19tb3YoTU9fNjQsIGRzdG9mZiwgUXZWX29mZiwgXAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKTsgXAorICAg
ICAgICB9IGVsc2UgeyBcCisgICAgICAgICAgICBhc3NlcnRfdmhpc3RfdG1wKGN0eCk7IFwKKyAg
ICAgICAgICAgIGdlbl9oZWxwZXJfdndoaXN0MjU2cShjcHVfZW52KTsgXAorICAgICAgICB9IFwK
KyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19WNl92d2hpc3QyNTZfc2F0KFNIT1JU
Q09ERSkgXAorICAgIGlmICghY3R4LT5wcmVfY29tbWl0KSB7IFwKKyAgICAgICAgYXNzZXJ0X3Zo
aXN0X3RtcChjdHgpOyBcCisgICAgICAgIGdlbl9oZWxwZXJfdndoaXN0MjU2X3NhdChjcHVfZW52
KTsgXAorICAgIH0KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdndoaXN0MjU2cV9zYXQoU0hPUlRDT0RF
KSBcCisgICAgZG8geyBcCisgICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAg
ICAgICAgaW50cHRyX3QgZHN0b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBxdG1wKTsg
XAorICAgICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBRdlZfb2ZmLCBc
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihN
TVZlY3RvcikpOyBcCisgICAgICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIGFzc2VydF92aGlz
dF90bXAoY3R4KTsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTZxX3NhdChjcHVf
ZW52KTsgXAorICAgICAgICB9IFwKKyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19W
Nl92d2hpc3QxMjgoU0hPUlRDT0RFKSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQpIHsgXAor
ICAgICAgICBhc3NlcnRfdmhpc3RfdG1wKGN0eCk7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92d2hp
c3QxMjgoY3B1X2Vudik7IFwKKyAgICB9CisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3aGlzdDEyOHEo
U0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsg
XAorICAgICAgICAgICAgaW50cHRyX3QgZHN0b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRl
LCBxdG1wKTsgXAorICAgICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBR
dlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3Rvciks
IHNpemVvZihNTVZlY3RvcikpOyBcCisgICAgICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIGFz
c2VydF92aGlzdF90bXAoY3R4KTsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QxMjhx
KGNwdV9lbnYpOyBcCisgICAgICAgIH0gXAorICAgIH0gd2hpbGUgKDApCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3Z3aGlzdDEyOG0oU0hPUlRDT0RFKSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQp
IHsgXAorICAgICAgICBUQ0d2IHRjZ3ZfdWlWID0gdGNnX2NvbnN0YW50X3RsKHVpVik7IFwKKyAg
ICAgICAgYXNzZXJ0X3ZoaXN0X3RtcChjdHgpOyBcCisgICAgICAgIGdlbl9oZWxwZXJfdndoaXN0
MTI4bShjcHVfZW52LCB0Y2d2X3VpVik7IFwKKyAgICB9CisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3
aGlzdDEyOHFtKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAgICBpZiAoY3R4LT5wcmVf
Y29tbWl0KSB7IFwKKyAgICAgICAgICAgIGludHB0cl90IGRzdG9mZiA9IG9mZnNldG9mKENQVUhl
eGFnb25TdGF0ZSwgcXRtcCk7IFwKKyAgICAgICAgICAgIHRjZ19nZW5fZ3ZlY19tb3YoTU9fNjQs
IGRzdG9mZiwgUXZWX29mZiwgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
TU1WZWN0b3IpLCBzaXplb2YoTU1WZWN0b3IpKTsgXAorICAgICAgICB9IGVsc2UgeyBcCisgICAg
ICAgICAgICBUQ0d2IHRjZ3ZfdWlWID0gdGNnX2NvbnN0YW50X3RsKHVpVik7IFwKKyAgICAgICAg
ICAgIGFzc2VydF92aGlzdF90bXAoY3R4KTsgXAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hp
c3QxMjhxbShjcHVfZW52LCB0Y2d2X3VpVik7IFwKKyAgICAgICAgfSBcCisgICAgfSB3aGlsZSAo
MCkKKworCiAjZW5kaWYKLS0gCjIuNy40Cgo=

