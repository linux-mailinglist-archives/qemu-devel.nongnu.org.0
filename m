Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31607440F9D
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 17:59:46 +0100 (CET)
Received: from localhost ([::1]:60950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhEBN-0007MT-9v
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 12:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvw-0001z3-8Q
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:48 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:31506)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mhDvu-0008Ap-IH
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 12:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635698626; x=1667234626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckvX+U4d6OPdMh0Um2lfNQ1it5svXckJOQyPUDJZ3iw=;
 b=F2HjArBMhe5i2ljoqYrJu4HghcgSi9xteFLhApG5Wj49NfZYxIHb5rcF
 eWrcgdDKljaJRnHOEJp8Uly2PkE9oqX/e81picJYo/PudDTDJO+oGMDhG
 vVuOOPEXesZXF83Uysz2BlyQeBvebzjc0++cNX9dc+qixfZZiYpjwOnal g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 31 Oct 2021 09:43:30 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 6F13C308E; Sun, 31 Oct 2021 11:43:29 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] Hexagon HVX (target/hexagon) helper overrides for
 histogram instructions
Date: Sun, 31 Oct 2021 11:42:53 -0500
Message-Id: <1635698589-31849-15-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: peter.maydell@linaro.org, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCB8IDEwNiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oIGIvdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZ19odnguaAppbmRleCBiNWM2Y2FkLi5hNTYwNTA0IDEwMDY0NAotLS0g
YS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90
Y2dfaHZ4LmgKQEAgLTE4LDQgKzE4LDExMCBAQAogI2lmbmRlZiBIRVhBR09OX0dFTl9UQ0dfSFZY
X0gKICNkZWZpbmUgSEVYQUdPTl9HRU5fVENHX0hWWF9ICiAKKy8qCisgKiBIaXN0b2dyYW0gaW5z
dHJ1Y3Rpb25zCisgKgorICogTm90ZSB0aGF0IHRoZXNlIGluc3RydWN0aW9ucyBvcGVyYXRlIGRp
cmVjdGx5IG9uIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzCisgKiBhbmQgdGhlcmVmb3JlIGhhcHBlbiBh
ZnRlciBjb21taXQuCisgKgorICogVGhlIGdlbmVyYXRlXzx0YWc+IGZ1bmN0aW9uIGlzIGNhbGxl
ZCB0d2ljZQorICogICAgIFRoZSBmaXJzdCB0aW1lIGlzIGR1cmluZyB0aGUgbm9ybWFsIFRDRyBn
ZW5lcmF0aW9uCisgKiAgICAgICAgIGN0eC0+cHJlX2NvbW1pdCBpcyB0cnVlCisgKiAgICAgICAg
IEluIHRoZSBtYXNrZWQgY2FzZXMsIHdlIHNhdmUgdGhlIG1hc2sgdG8gdGhlIHF0bXAgdGVtcG9y
YXJ5CisgKiAgICAgICAgIE90aGVyd2lzZSwgdGhlcmUgaXMgbm90aGluZyB0byBkbworICogICAg
IFRoZSBzZWNvbmQgY2FsbCBpcyBhdCB0aGUgZW5kIG9mIGdlbl9jb21taXRfcGFja2V0CisgKiAg
ICAgICAgIGN0eC0+cHJlX2NvbW1pdCBpcyBmYWxzZQorICogICAgICAgICBHZW5lcmF0ZSB0aGUg
Y2FsbCB0byB0aGUgaGVscGVyCisgKi8KKworc3RhdGljIGlubGluZSB2b2lkIGFzc2VydF92aGlz
dF90bXAoRGlzYXNDb250ZXh0ICpjdHgpCit7CisgICAgLyogdmhpc3QgaW5zdHJ1Y3Rpb25zIHJl
cXVpcmUgZXhhY3RseSBvbmUgLnRtcCB0byBiZSBkZWZpbmVkICovCisgICAgZ19hc3NlcnQoY3R4
LT50bXBfdnJlZ3NfaWR4ID09IDEpOworfQorCisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZoaXN0KFNI
T1JUQ09ERSkgXAorICAgIGlmICghY3R4LT5wcmVfY29tbWl0KSB7IFwKKyAgICAgICAgYXNzZXJ0
X3ZoaXN0X3RtcChjdHgpOyBcCisgICAgICAgIGdlbl9oZWxwZXJfdmhpc3QoY3B1X2Vudik7IFwK
KyAgICB9CisjZGVmaW5lIGZHRU5fVENHX1Y2X3ZoaXN0cShTSE9SVENPREUpIFwKKyAgICBkbyB7
IFwKKyAgICAgICAgaWYgKGN0eC0+cHJlX2NvbW1pdCkgeyBcCisgICAgICAgICAgICBpbnRwdHJf
dCBkc3RvZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0bXApOyBcCisgICAgICAgICAg
ICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBkc3RvZmYsIFF2Vl9vZmYsIFwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwK
KyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAgICAgYXNzZXJ0X3ZoaXN0X3RtcChjdHgpOyBc
CisgICAgICAgICAgICBnZW5faGVscGVyX3ZoaXN0cShjcHVfZW52KTsgXAorICAgICAgICB9IFwK
KyAgICB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19WNl92d2hpc3QyNTYoU0hPUlRDT0RF
KSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAgICBhc3NlcnRfdmhpc3Rf
dG1wKGN0eCk7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTYoY3B1X2Vudik7IFwKKyAg
ICB9CisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3aGlzdDI1NnEoU0hPUlRDT0RFKSBcCisgICAgZG8g
eyBcCisgICAgICAgIGlmIChjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAgICAgICAgaW50cHRy
X3QgZHN0b2ZmID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBxdG1wKTsgXAorICAgICAgICAg
ICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgZHN0b2ZmLCBRdlZfb2ZmLCBcCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpOyBc
CisgICAgICAgIH0gZWxzZSB7IFwKKyAgICAgICAgICAgIGFzc2VydF92aGlzdF90bXAoY3R4KTsg
XAorICAgICAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTZxKGNwdV9lbnYpOyBcCisgICAgICAg
IH0gXAorICAgIH0gd2hpbGUgKDApCisjZGVmaW5lIGZHRU5fVENHX1Y2X3Z3aGlzdDI1Nl9zYXQo
U0hPUlRDT0RFKSBcCisgICAgaWYgKCFjdHgtPnByZV9jb21taXQpIHsgXAorICAgICAgICBhc3Nl
cnRfdmhpc3RfdG1wKGN0eCk7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92d2hpc3QyNTZfc2F0KGNw
dV9lbnYpOyBcCisgICAgfQorI2RlZmluZSBmR0VOX1RDR19WNl92d2hpc3QyNTZxX3NhdChTSE9S
VENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgaWYgKGN0eC0+cHJlX2NvbW1pdCkgeyBcCisg
ICAgICAgICAgICBpbnRwdHJfdCBkc3RvZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHF0
bXApOyBcCisgICAgICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBkc3RvZmYsIFF2Vl9v
ZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSwgc2l6
ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAgICAgYXNzZXJ0
X3ZoaXN0X3RtcChjdHgpOyBcCisgICAgICAgICAgICBnZW5faGVscGVyX3Z3aGlzdDI1NnFfc2F0
KGNwdV9lbnYpOyBcCisgICAgICAgIH0gXAorICAgIH0gd2hpbGUgKDApCisjZGVmaW5lIGZHRU5f
VENHX1Y2X3Z3aGlzdDEyOChTSE9SVENPREUpIFwKKyAgICBpZiAoIWN0eC0+cHJlX2NvbW1pdCkg
eyBcCisgICAgICAgIGFzc2VydF92aGlzdF90bXAoY3R4KTsgXAorICAgICAgICBnZW5faGVscGVy
X3Z3aGlzdDEyOChjcHVfZW52KTsgXAorICAgIH0KKyNkZWZpbmUgZkdFTl9UQ0dfVjZfdndoaXN0
MTI4cShTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgaWYgKGN0eC0+cHJlX2NvbW1p
dCkgeyBcCisgICAgICAgICAgICBpbnRwdHJfdCBkc3RvZmYgPSBvZmZzZXRvZihDUFVIZXhhZ29u
U3RhdGUsIHF0bXApOyBcCisgICAgICAgICAgICB0Y2dfZ2VuX2d2ZWNfbW92KE1PXzY0LCBkc3Rv
ZmYsIFF2Vl9vZmYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1NVmVj
dG9yKSwgc2l6ZW9mKE1NVmVjdG9yKSk7IFwKKyAgICAgICAgfSBlbHNlIHsgXAorICAgICAgICAg
ICAgYXNzZXJ0X3ZoaXN0X3RtcChjdHgpOyBcCisgICAgICAgICAgICBnZW5faGVscGVyX3Z3aGlz
dDEyOHEoY3B1X2Vudik7IFwKKyAgICAgICAgfSBcCisgICAgfSB3aGlsZSAoMCkKKyNkZWZpbmUg
ZkdFTl9UQ0dfVjZfdndoaXN0MTI4bShTSE9SVENPREUpIFwKKyAgICBpZiAoIWN0eC0+cHJlX2Nv
bW1pdCkgeyBcCisgICAgICAgIFRDR3YgdGNndl91aVYgPSB0Y2dfY29uc3RhbnRfdGwodWlWKTsg
XAorICAgICAgICBhc3NlcnRfdmhpc3RfdG1wKGN0eCk7IFwKKyAgICAgICAgZ2VuX2hlbHBlcl92
d2hpc3QxMjhtKGNwdV9lbnYsIHRjZ3ZfdWlWKTsgXAorICAgIH0KKyNkZWZpbmUgZkdFTl9UQ0df
VjZfdndoaXN0MTI4cW0oU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIGlmIChjdHgt
PnByZV9jb21taXQpIHsgXAorICAgICAgICAgICAgaW50cHRyX3QgZHN0b2ZmID0gb2Zmc2V0b2Yo
Q1BVSGV4YWdvblN0YXRlLCBxdG1wKTsgXAorICAgICAgICAgICAgdGNnX2dlbl9ndmVjX21vdihN
T182NCwgZHN0b2ZmLCBRdlZfb2ZmLCBcCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpOyBcCisgICAgICAgIH0gZWxzZSB7IFwK
KyAgICAgICAgICAgIFRDR3YgdGNndl91aVYgPSB0Y2dfY29uc3RhbnRfdGwodWlWKTsgXAorICAg
ICAgICAgICAgYXNzZXJ0X3ZoaXN0X3RtcChjdHgpOyBcCisgICAgICAgICAgICBnZW5faGVscGVy
X3Z3aGlzdDEyOHFtKGNwdV9lbnYsIHRjZ3ZfdWlWKTsgXAorICAgICAgICB9IFwKKyAgICB9IHdo
aWxlICgwKQorCisKICNlbmRpZgotLSAKMi43LjQKCg==

