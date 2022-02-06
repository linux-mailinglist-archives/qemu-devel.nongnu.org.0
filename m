Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1244AB2E2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 01:08:03 +0100 (CET)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGrZa-0002qK-FP
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 19:08:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrPN-0000g4-Gn
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:30 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62051)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nGrPH-00085e-UA
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 18:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644191844; x=1675727844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tSZkjOBwGC0+JqdxSoRQCqZl2IJIxvRSnoEWwRfr41k=;
 b=dYAgS0x1TjZqT4p03wRULJsJoqg72JsBr1hRlsPqPH6Lh2ntVDyIDLi5
 HwtZ6t3JctSlMyp2mRLdKyMvLbzmOQGwX8JjRjjgdUq7E+jjW1lJrieTV
 KqENASVB46yGEZAGWlRYJkb7iE5uxkHrdFOHqJ5O/NoO/3fNFTx7e+xUT A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 06 Feb 2022 15:51:14 -0800
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 06 Feb 2022 15:51:13 -0800
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 9E69D500599; Sun,  6 Feb 2022 15:50:33 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] Hexagon HVX (target/hexagon)) fix bug in HVX saturate
 instructions
Date: Sun,  6 Feb 2022 15:50:24 -0800
Message-Id: <20220206235030.31493-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220206235030.31493-1-tsimpson@quicinc.com>
References: <20220206235030.31493-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 f4bug@amsat.org, tsimpson@quicinc.com, mlambert@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VHdvIHRlc3RzIGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMKICAgIHYyMS51
dyA9IHZhZGQodjExLnV3LCB2MTAudXcpOnNhdAogICAgdjI1OjI0LnV3ID0gdnN1Yih2MTc6MTYu
dXcsIHYyNzoyNi51dyk6c2F0CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICB8ICA0ICst
CiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jIHwgNzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQv
aGV4YWdvbi9tYWNyb3MuaAppbmRleCAxOWQxMDNjYWQ1Li5hNzhlODRmYWE0IDEwMDY0NAotLS0g
YS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApA
QCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJ
bm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdo
dChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMjY4
LDcgKzI2OCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fcHJlZF9jYW5jZWwoVENHdiBwcmVk
LCBpbnQgc2xvdF9udW0pCiAKICNkZWZpbmUgZlZTQVRVVkFMTihOLCBWQUwpIFwKICAgICAoeyBc
Ci0gICAgICAgICgoKGludCkoVkFMKSkgPCAwKSA/IDAgOiAoKDFMTCA8PCAoTikpIC0gMSk7IFwK
KyAgICAgICAgKCgoaW50NjRfdCkoVkFMKSkgPCAwKSA/IDAgOiAoKDFMTCA8PCAoTikpIC0gMSk7
IFwKICAgICB9KQogI2RlZmluZSBmU0FUVVZBTE4oTiwgVkFMKSBcCiAgICAgKHsgXApkaWZmIC0t
Z2l0IGEvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2h2
eF9taXNjLmMKaW5kZXggMzEyYmI5OGI0MS4uYjg5NmY1ODk3ZSAxMDA2NDQKLS0tIGEvdGVzdHMv
dGNnL2hleGFnb24vaHZ4X21pc2MuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5j
CkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAyMSBRdWFsY29tbSBJbm5v
dmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChj
KSAyMDIxLTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBS
ZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMTksNiAr
MTksNyBAQAogI2luY2x1ZGUgPHN0ZGludC5oPgogI2luY2x1ZGUgPHN0ZGJvb2wuaD4KICNpbmNs
dWRlIDxzdHJpbmcuaD4KKyNpbmNsdWRlIDxsaW1pdHMuaD4KIAogaW50IGVycjsKIApAQCAtNDMy
LDYgKzQzMyw3MSBAQCBURVNUX1BSRURfT1AyKHByZWRfYW5kLCBhbmQsICYsICIiKQogVEVTVF9Q
UkVEX09QMihwcmVkX2FuZF9uLCBhbmQsICYsICIhIikKIFRFU1RfUFJFRF9PUDIocHJlZF94b3Is
IHhvciwgXiwgIiIpCiAKK3N0YXRpYyB2b2lkIHRlc3RfdmFkZHV3c2F0KHZvaWQpCit7CisgICAg
LyoKKyAgICAgKiBUZXN0IGZvciBzYXR1cmF0aW9uIGJ5IGFkZGluZyB0d28gbnVtYmVycyB0aGF0
IGFkZCB0byBtb3JlIHRoYW4gVUlOVF9NQVgKKyAgICAgKiBhbmQgbWFrZSBzdXJlIHRoZSByZXN1
bHQgc2F0dXJhdGVzIHRvIFVJTlRfTUFYCisgICAgICovCisgICAgY29uc3QgdWludDMyX3QgeCA9
IDB4ZmZmZjAwMDA7CisgICAgY29uc3QgdWludDMyX3QgeSA9IDB4MDAwZmZmZmY7CisKKyAgICBt
ZW1zZXQoZXhwZWN0LCAweDEyLCBzaXplb2YoTU1WZWN0b3IpKTsKKyAgICBtZW1zZXQob3V0cHV0
LCAweDM0LCBzaXplb2YoTU1WZWN0b3IpKTsKKworICAgIGFzbSB2b2xhdGlsZSAoInYxMCA9IHZz
cGxhdCglMClcblx0IgorICAgICAgICAgICAgICAgICAgInYxMSA9IHZzcGxhdCglMSlcblx0Igor
ICAgICAgICAgICAgICAgICAgInYyMS51dyA9IHZhZGQodjExLnV3LCB2MTAudXcpOnNhdFxuXHQi
CisgICAgICAgICAgICAgICAgICAidm1lbSglMisjMCkgPSB2MjFcblx0IgorICAgICAgICAgICAg
ICAgICAgOiAvKiBubyBvdXRwdXRzICovCisgICAgICAgICAgICAgICAgICA6ICJyIih4KSwgInIi
KHkpLCAiciIob3V0cHV0KQorICAgICAgICAgICAgICAgICAgOiAidjEwIiwgInYxMSIsICJ2MjEi
LCAibWVtb3J5Iik7CisKKyAgICBmb3IgKGludCBqID0gMDsgaiA8IE1BWF9WRUNfU0laRV9CWVRF
UyAvIDQ7IGorKykgeworICAgICAgICBleHBlY3RbMF0udXdbal0gPSBVSU5UX01BWDsKKyAgICB9
CisKKyAgICBjaGVja19vdXRwdXRfdyhfX0xJTkVfXywgMSk7Cit9CisKK3N0YXRpYyB2b2lkIHRl
c3RfdnN1YnV3c2F0X2R2KHZvaWQpCit7CisgICAgLyoKKyAgICAgKiBUZXN0IGZvciBzYXR1cmF0
aW9uIGJ5IHN1YnRyYWN0aW5nIHR3byBudW1iZXJzIHdoZXJlIHRoZSByZXN1bHQgaXMKKyAgICAg
KiBuZWdhdGl2ZSBhbmQgbWFrZSBzdXJlIHRoZSByZXN1bHQgc2F0dXJhdGVzIHRvIHplcm8KKyAg
ICAgKgorICAgICAqIHZzdWJ1d3NhdF9kdiBvcGVyYXRlcyBvbiBhbiBIVlggcmVnaXN0ZXIgcGFp
ciwgc28gd2UnbGwgaGF2ZSBhCisgICAgICogcGFpciBvZiBzdWJ0cmFjdGlvbnMKKyAgICAgKiAg
ICAgdyAtIHggPCAwCisgICAgICogICAgIHkgLSB6IDwgMAorICAgICAqLworICAgIGNvbnN0IHVp
bnQzMl90IHcgPSAweDAwMDAwMGI3OworICAgIGNvbnN0IHVpbnQzMl90IHggPSAweGZmZmZmZjRl
OworICAgIGNvbnN0IHVpbnQzMl90IHkgPSAweDMxZmU4OGU3OworICAgIGNvbnN0IHVpbnQzMl90
IHogPSAweDdmZmZmZjc5OworCisgICAgbWVtc2V0KGV4cGVjdCwgMHgxMiwgc2l6ZW9mKE1NVmVj
dG9yKSAqIDIpOworICAgIG1lbXNldChvdXRwdXQsIDB4MzQsIHNpemVvZihNTVZlY3RvcikgKiAy
KTsKKworICAgIGFzbSB2b2xhdGlsZSAoInYxNiA9IHZzcGxhdCglMClcblx0IgorICAgICAgICAg
ICAgICAgICAgInYxNyA9IHZzcGxhdCglMSlcblx0IgorICAgICAgICAgICAgICAgICAgInYyNiA9
IHZzcGxhdCglMilcblx0IgorICAgICAgICAgICAgICAgICAgInYyNyA9IHZzcGxhdCglMylcblx0
IgorICAgICAgICAgICAgICAgICAgInYyNToyNC51dyA9IHZzdWIodjE3OjE2LnV3LCB2Mjc6MjYu
dXcpOnNhdFxuXHQiCisgICAgICAgICAgICAgICAgICAidm1lbSglNCsjMCkgPSB2MjRcblx0Igor
ICAgICAgICAgICAgICAgICAgInZtZW0oJTQrIzEpID0gdjI1XG5cdCIKKyAgICAgICAgICAgICAg
ICAgIDogLyogbm8gb3V0cHV0cyAqLworICAgICAgICAgICAgICAgICAgOiAiciIodyksICJyIih5
KSwgInIiKHgpLCAiciIoeiksICJyIihvdXRwdXQpCisgICAgICAgICAgICAgICAgICA6ICJ2MTYi
LCAidjE3IiwgInYyNCIsICJ2MjUiLCAidjI2IiwgInYyNyIsICJtZW1vcnkiKTsKKworICAgIGZv
ciAoaW50IGogPSAwOyBqIDwgTUFYX1ZFQ19TSVpFX0JZVEVTIC8gNDsgaisrKSB7CisgICAgICAg
IGV4cGVjdFswXS51d1tqXSA9IDB4MDAwMDAwMDA7CisgICAgICAgIGV4cGVjdFsxXS51d1tqXSA9
IDB4MDAwMDAwMDA7CisgICAgfQorCisgICAgY2hlY2tfb3V0cHV0X3coX19MSU5FX18sIDIpOwor
fQorCiBpbnQgbWFpbigpCiB7CiAgICAgaW5pdF9idWZmZXJzKCk7CkBAIC00NjQsNiArNTMwLDkg
QEAgaW50IG1haW4oKQogICAgIHRlc3RfcHJlZF9hbmRfbih0cnVlKTsKICAgICB0ZXN0X3ByZWRf
eG9yKGZhbHNlKTsKIAorICAgIHRlc3RfdmFkZHV3c2F0KCk7CisgICAgdGVzdF92c3VidXdzYXRf
ZHYoKTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJy
ID8gMSA6IDA7CiB9Ci0tIAoyLjE3LjEKCg==

