Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15A5861FA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 01:34:59 +0200 (CEST)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIISY-0003ol-MN
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 19:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQS-00081A-2M
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:48 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54485)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oIIQP-0000Zn-P9
 for qemu-devel@nongnu.org; Sun, 31 Jul 2022 19:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659310365; x=1690846365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NEGgRBwf3rM4eg8w/M5ErsZyNtM9IFSE9v1ETELiOAo=;
 b=VWvX8kh09VPCgO2Wayfle20RiR0ZFxb8YHNgBf4vrnGWlpM2CM1KVpLD
 Gz0GK7QvHJe06rNh0+yOpDb3jzyw4MhCktI/p/GEa+tpGV2Wz6Qz2+dON
 WB4zIr8HFBNqMkEXM/67O/jSIKyFB6x6VMuqpFnh3bilJxeXID09gJNct k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 31 Jul 2022 16:32:34 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg09-lv.qualcomm.com with ESMTP; 31 Jul 2022 16:32:34 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id F23DA5005B7; Sun, 31 Jul 2022 16:32:33 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org
Subject: [PULL 1/3] Hexagon (target/hexagon) make VyV operands use a unique
 temp
Date: Sun, 31 Jul 2022 16:32:30 -0700
Message-Id: <20220731233232.2473-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220731233232.2473-1-tsimpson@quicinc.com>
References: <20220731233232.2473-1-tsimpson@quicinc.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VnlWIG9wZXJhbmQgaXMgb25seSB1c2VkIGluIHRoZSB2c2h1ZmYgYW5kIHZkZWFsIGluc3RydWN0
aW9ucy4gIFRoZXNlCmluc3RydWN0aW9ucyB3cml0ZSB0byBib3RoIFZ5ViBhbmQgVnhWIG9wZXJh
bmRzLiAgSW4gdGhlIGNhc2Ugd2hlcmUKYm90aCBvcGVyYW5kcyBhcmUgdGhlIHNhbWUgcmVnaXN0
ZXIsIHdlIG5lZWQgYSBzZXBhcmF0ZSBsb2NhdGlvbiBmb3IKVnlWLiAgV2UgdXNlIHRoZSBleGlz
dGluZyB2dG1wIGZpZWxkIGluIENQVUhleGFnb25TdGF0ZS4KClRlc3QgY2FzZSBhZGRlZCBpbiB0
ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNv
biA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIwMjIwNzE4MjMwMzIw
LjI0NDQ0LTItdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vaHZ4
X21pc2MuYyAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSB8ICA5ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cv
aGV4YWdvbi9odnhfbWlzYy5jIGIvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYwppbmRleCBi
ODk2ZjU4OTdlLi42ZTJjOWFiM2NkIDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9odnhf
bWlzYy5jCisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMKQEAgLTQ5OCw2ICs0OTgs
NDkgQEAgc3RhdGljIHZvaWQgdGVzdF92c3VidXdzYXRfZHYodm9pZCkKICAgICBjaGVja19vdXRw
dXRfdyhfX0xJTkVfXywgMik7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfdnNodWZmKHZvaWQpCit7
CisgICAgLyogVGVzdCB0aGF0IHZzaHVmZiB3b3JrcyB3aGVuIHRoZSB0d28gb3BlcmFuZHMgYXJl
IHRoZSBzYW1lIHJlZ2lzdGVyICovCisgICAgY29uc3QgdWludDMyX3Qgc3BsYXQgPSAweDA4OWJl
NTVjOworICAgIGNvbnN0IHVpbnQzMl90IHNodWZmID0gMHg0NTRmYTkyNjsKKyAgICBNTVZlY3Rv
ciB2MCwgdjE7CisKKyAgICBtZW1zZXQoZXhwZWN0LCAweDEyLCBzaXplb2YoTU1WZWN0b3IpKTsK
KyAgICBtZW1zZXQob3V0cHV0LCAweDM0LCBzaXplb2YoTU1WZWN0b3IpKTsKKworICAgIGFzbSB2
b2xhdGlsZSgidjI1ID0gdnNwbGF0KCUwKVxuXHQiCisgICAgICAgICAgICAgICAgICJ2c2h1ZmYo
djI1LCB2MjUsICUxKVxuXHQiCisgICAgICAgICAgICAgICAgICJ2bWVtKCUyICsgIzApID0gdjI1
XG5cdCIKKyAgICAgICAgICAgICAgICAgOiAvKiBubyBvdXRwdXRzICovCisgICAgICAgICAgICAg
ICAgIDogInIiKHNwbGF0KSwgInIiKHNodWZmKSwgInIiKG91dHB1dCkKKyAgICAgICAgICAgICAg
ICAgOiAidjI1IiwgIm1lbW9yeSIpOworCisgICAgLyoKKyAgICAgKiBUaGUgc2VtYW50aWNzIG9m
IEhleGFnb24gYXJlIHRoZSBvcGVyYW5kcyBhcmUgcGFzcy1ieS12YWx1ZSwgc28gY3JlYXRlCisg
ICAgICogdHdvIGNvcGllcyBvZiB0aGUgdnNwbGF0IHJlc3VsdC4KKyAgICAgKi8KKyAgICBmb3Ig
KGludCBpID0gMDsgaSA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQ7IGkrKykgeworICAgICAgICB2
MC51d1tpXSA9IHNwbGF0OworICAgICAgICB2MS51d1tpXSA9IHNwbGF0OworICAgIH0KKyAgICAv
KiBEbyB0aGUgdnNodWZmIG9wZXJhdGlvbiAqLworICAgIGZvciAoaW50IG9mZnNldCA9IDE7IG9m
ZnNldCA8IE1BWF9WRUNfU0laRV9CWVRFUzsgb2Zmc2V0IDw8PSAxKSB7CisgICAgICAgIGlmIChz
aHVmZiAmIG9mZnNldCkgeworICAgICAgICAgICAgZm9yIChpbnQgayA9IDA7IGsgPCBNQVhfVkVD
X1NJWkVfQllURVM7IGsrKykgeworICAgICAgICAgICAgICAgIGlmICghKGsgJiBvZmZzZXQpKSB7
CisgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgdG1wID0gdjAudWJba107CisgICAgICAgICAg
ICAgICAgICAgIHYwLnViW2tdID0gdjEudWJbayArIG9mZnNldF07CisgICAgICAgICAgICAgICAg
ICAgIHYxLnViW2sgKyBvZmZzZXRdID0gdG1wOworICAgICAgICAgICAgICAgIH0KKyAgICAgICAg
ICAgIH0KKyAgICAgICAgfQorICAgIH0KKyAgICAvKiBQdXQgdGhlIHJlc3VsdCBpbiB0aGUgZXhw
ZWN0IGJ1ZmZlciBmb3IgdmVyaWZpY2F0aW9uICovCisgICAgZXhwZWN0WzBdID0gdjE7CisKKyAg
ICBjaGVja19vdXRwdXRfYihfX0xJTkVfXywgMSk7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBp
bml0X2J1ZmZlcnMoKTsKQEAgLTUzMyw2ICs1NzYsOCBAQCBpbnQgbWFpbigpCiAgICAgdGVzdF92
YWRkdXdzYXQoKTsKICAgICB0ZXN0X3ZzdWJ1d3NhdF9kdigpOwogCisgICAgdGVzdF92c2h1ZmYo
KTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyID8g
MSA6IDA7CiB9CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5IGIv
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQppbmRleCAxZmQ5ZGU5NWQ1Li5kNzJjNjg5
YWQ3IDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5CisrKyBiL3Rh
cmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkKQEAgLTEsNyArMSw3IEBACiAjIS91c3IvYmlu
L2VudiBweXRob24zCiAKICMjCi0jIyAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJ
bm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyMgIENvcHlyaWdo
dChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KICMjCiAjIyAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICMjICBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMTY0
LDcgKzE2NCw5IEBAIGRlZiBnZW5wdHJfZGVjbChmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdu
byk6CiAgICAgICAgICAgICAgICAgKHJlZ3R5cGUsIHJlZ2lkLCByZWdubykpCiAgICAgICAgICAg
ICBmLndyaXRlKCIgICAgY29uc3QgaW50cHRyX3QgJXMlc1Zfb2ZmID1cbiIgJSBcCiAgICAgICAg
ICAgICAgICAgKHJlZ3R5cGUsIHJlZ2lkKSkKLSAgICAgICAgICAgIGlmIChoZXhfY29tbW9uLmlz
X3RtcF9yZXN1bHQodGFnKSk6CisgICAgICAgICAgICBpZiAocmVnaWQgPT0gInkiKToKKyAgICAg
ICAgICAgICAgICBmLndyaXRlKCIgICAgICAgIG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgdnRt
cCk7XG4iKQorICAgICAgICAgICAgZWxpZiAoaGV4X2NvbW1vbi5pc190bXBfcmVzdWx0KHRhZykp
OgogICAgICAgICAgICAgICAgIGYud3JpdGUoIiAgICAgICAgY3R4X3RtcF92cmVnX29mZihjdHgs
ICVzJXNOLCAxLCB0cnVlKTtcbiIgJSBcCiAgICAgICAgICAgICAgICAgICAgIChyZWd0eXBlLCBy
ZWdpZCkpCiAgICAgICAgICAgICBlbHNlOgpAQCAtMzc5LDkgKzM4MSw2IEBAIGRlZiBnZW5wdHJf
c3JjX3JlYWQoZiwgdGFnLCByZWd0eXBlLCByZWdpZCk6CiAgICAgICAgICAgICBmLndyaXRlKCIg
ICAgICAgIHZyZWdfc3JjX29mZihjdHgsICVzJXNOKSxcbiIgJSBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCkpCiAgICAgICAgICAgICBmLndyaXRlKCIgICAg
ICAgIHNpemVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpO1xuIikKLSAgICAgICAgICAg
IGlmIChub3QgaGV4X2NvbW1vbi5za2lwX3FlbXVfaGVscGVyKHRhZykpOgotICAgICAgICAgICAg
ICAgIGYud3JpdGUoIiAgICB0Y2dfZ2VuX2FkZGlfcHRyKCVzJXNWLCBjcHVfZW52LCAlcyVzVl9v
ZmYpO1xuIiAlIFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChyZWd0eXBlLCBy
ZWdpZCwgcmVndHlwZSwgcmVnaWQpKQogICAgICAgICBlbHNlOgogICAgICAgICAgICAgcHJpbnQo
IkJhZCByZWdpc3RlciBwYXJzZTogIiwgcmVndHlwZSwgcmVnaWQpCiAgICAgZWxpZiAocmVndHlw
ZSA9PSAiUSIpOgotLSAKMi4xNy4xCgo=

