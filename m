Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621725094C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 03:44:22 +0200 (CEST)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhLrp-0001Mz-1a
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 21:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nhLqT-0007ro-Vw
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 21:42:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40087)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1nhLqR-0000lQ-Qr
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 21:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650505375; x=1682041375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wnJyMXznj/NY6S7udslUPpj6o4RnH2MZKcgpGtQSUlg=;
 b=MRrswZBrpxJe2qeq1xeeGfRbtQedmutBF6MbHyMteAXByNp9zqOlCeX/
 ZfXYTg6aldSNpMHUGdHt3XOOQk0EOFMkjsAR6/TgbLrFRLjZdLsliz7m2
 pWtXUXgU4dXkh62dW3duyMkRsZGHpJb4jL9xKbsWtTW2PRCsJUL/e9Adv g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 20 Apr 2022 18:42:52 -0700
X-QCInternal: smtphost
Received: from hu-tsimpson-lv.qualcomm.com (HELO
 hu-devc-lv-u18-c.qualcomm.com) ([10.47.235.220])
 by ironmsg08-lv.qualcomm.com with ESMTP; 20 Apr 2022 18:42:52 -0700
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 42B65500582; Wed, 20 Apr 2022 18:42:52 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) make VyV operands use a unique temp
Date: Wed, 20 Apr 2022 18:42:40 -0700
Message-Id: <20220421014243.7834-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421014243.7834-1-tsimpson@quicinc.com>
References: <20220421014243.7834-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=129.46.98.28; envelope-from=tsimpson@qualcomm.com;
 helo=alexa-out.qualcomm.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

VnlWIG9wZXJhbmQgaXMgb25seSB1c2VkIGluIHRoZSB2c2h1ZmYgYW5kIHZkZWFsIGluc3RydWN0
aW9ucy4gIFRoZXNlCmluc3RydWN0aW9ucyB3cml0ZSB0byBib3RoIFZ5ViBhbmQgVnhWIG9wZXJh
bmRzLiAgSW4gdGhlIGNhc2Ugd2hlcmUKYm90aCBvcGVyYW5kcyBhcmUgdGhlIHNhbWUgcmVnaXN0
ZXIsIHdlIG5lZWQgYSBzZXBhcmF0ZSBsb2NhdGlvbiBmb3IKVnlWLiAgV2UgdXNlIHRoZSBleGlz
dGluZyB2dG1wIGZpZWxkIGluIENQVUhleGFnb25TdGF0ZS4KClRlc3QgY2FzZSBhZGRlZCBpbiB0
ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNv
biA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2Mu
YyAgICB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZ19mdW5jcy5weSB8ICA5ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDkgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdv
bi9odnhfbWlzYy5jIGIvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYwppbmRleCBiODk2ZjU4
OTdlLi42ZTJjOWFiM2NkIDEwMDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5j
CisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMKQEAgLTQ5OCw2ICs0OTgsNDkgQEAg
c3RhdGljIHZvaWQgdGVzdF92c3VidXdzYXRfZHYodm9pZCkKICAgICBjaGVja19vdXRwdXRfdyhf
X0xJTkVfXywgMik7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3RfdnNodWZmKHZvaWQpCit7CisgICAg
LyogVGVzdCB0aGF0IHZzaHVmZiB3b3JrcyB3aGVuIHRoZSB0d28gb3BlcmFuZHMgYXJlIHRoZSBz
YW1lIHJlZ2lzdGVyICovCisgICAgY29uc3QgdWludDMyX3Qgc3BsYXQgPSAweDA4OWJlNTVjOwor
ICAgIGNvbnN0IHVpbnQzMl90IHNodWZmID0gMHg0NTRmYTkyNjsKKyAgICBNTVZlY3RvciB2MCwg
djE7CisKKyAgICBtZW1zZXQoZXhwZWN0LCAweDEyLCBzaXplb2YoTU1WZWN0b3IpKTsKKyAgICBt
ZW1zZXQob3V0cHV0LCAweDM0LCBzaXplb2YoTU1WZWN0b3IpKTsKKworICAgIGFzbSB2b2xhdGls
ZSgidjI1ID0gdnNwbGF0KCUwKVxuXHQiCisgICAgICAgICAgICAgICAgICJ2c2h1ZmYodjI1LCB2
MjUsICUxKVxuXHQiCisgICAgICAgICAgICAgICAgICJ2bWVtKCUyICsgIzApID0gdjI1XG5cdCIK
KyAgICAgICAgICAgICAgICAgOiAvKiBubyBvdXRwdXRzICovCisgICAgICAgICAgICAgICAgIDog
InIiKHNwbGF0KSwgInIiKHNodWZmKSwgInIiKG91dHB1dCkKKyAgICAgICAgICAgICAgICAgOiAi
djI1IiwgIm1lbW9yeSIpOworCisgICAgLyoKKyAgICAgKiBUaGUgc2VtYW50aWNzIG9mIEhleGFn
b24gYXJlIHRoZSBvcGVyYW5kcyBhcmUgcGFzcy1ieS12YWx1ZSwgc28gY3JlYXRlCisgICAgICog
dHdvIGNvcGllcyBvZiB0aGUgdnNwbGF0IHJlc3VsdC4KKyAgICAgKi8KKyAgICBmb3IgKGludCBp
ID0gMDsgaSA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQ7IGkrKykgeworICAgICAgICB2MC51d1tp
XSA9IHNwbGF0OworICAgICAgICB2MS51d1tpXSA9IHNwbGF0OworICAgIH0KKyAgICAvKiBEbyB0
aGUgdnNodWZmIG9wZXJhdGlvbiAqLworICAgIGZvciAoaW50IG9mZnNldCA9IDE7IG9mZnNldCA8
IE1BWF9WRUNfU0laRV9CWVRFUzsgb2Zmc2V0IDw8PSAxKSB7CisgICAgICAgIGlmIChzaHVmZiAm
IG9mZnNldCkgeworICAgICAgICAgICAgZm9yIChpbnQgayA9IDA7IGsgPCBNQVhfVkVDX1NJWkVf
QllURVM7IGsrKykgeworICAgICAgICAgICAgICAgIGlmICghKGsgJiBvZmZzZXQpKSB7CisgICAg
ICAgICAgICAgICAgICAgIHVpbnQ4X3QgdG1wID0gdjAudWJba107CisgICAgICAgICAgICAgICAg
ICAgIHYwLnViW2tdID0gdjEudWJbayArIG9mZnNldF07CisgICAgICAgICAgICAgICAgICAgIHYx
LnViW2sgKyBvZmZzZXRdID0gdG1wOworICAgICAgICAgICAgICAgIH0KKyAgICAgICAgICAgIH0K
KyAgICAgICAgfQorICAgIH0KKyAgICAvKiBQdXQgdGhlIHJlc3VsdCBpbiB0aGUgZXhwZWN0IGJ1
ZmZlciBmb3IgdmVyaWZpY2F0aW9uICovCisgICAgZXhwZWN0WzBdID0gdjE7CisKKyAgICBjaGVj
a19vdXRwdXRfYihfX0xJTkVfXywgMSk7Cit9CisKIGludCBtYWluKCkKIHsKICAgICBpbml0X2J1
ZmZlcnMoKTsKQEAgLTUzMyw2ICs1NzYsOCBAQCBpbnQgbWFpbigpCiAgICAgdGVzdF92YWRkdXdz
YXQoKTsKICAgICB0ZXN0X3ZzdWJ1d3NhdF9kdigpOwogCisgICAgdGVzdF92c2h1ZmYoKTsKKwog
ICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1cm4gZXJyID8gMSA6IDA7
CiB9CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5IGIvdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQppbmRleCAxZmQ5ZGU5NWQ1Li5kNzJjNjg5YWQ3IDEw
MDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5CisrKyBiL3RhcmdldC9o
ZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkKQEAgLTEsNyArMSw3IEBACiAjIS91c3IvYmluL2VudiBw
eXRob24zCiAKICMjCi0jIyAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyMgIENvcHlyaWdodChjKSAy
MDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4KICMjCiAjIyAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICMjICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtMTY0LDcgKzE2
NCw5IEBAIGRlZiBnZW5wdHJfZGVjbChmLCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCByZWdubyk6CiAg
ICAgICAgICAgICAgICAgKHJlZ3R5cGUsIHJlZ2lkLCByZWdubykpCiAgICAgICAgICAgICBmLndy
aXRlKCIgICAgY29uc3QgaW50cHRyX3QgJXMlc1Zfb2ZmID1cbiIgJSBcCiAgICAgICAgICAgICAg
ICAgKHJlZ3R5cGUsIHJlZ2lkKSkKLSAgICAgICAgICAgIGlmIChoZXhfY29tbW9uLmlzX3RtcF9y
ZXN1bHQodGFnKSk6CisgICAgICAgICAgICBpZiAocmVnaWQgPT0gInkiKToKKyAgICAgICAgICAg
ICAgICBmLndyaXRlKCIgICAgICAgIG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgdnRtcCk7XG4i
KQorICAgICAgICAgICAgZWxpZiAoaGV4X2NvbW1vbi5pc190bXBfcmVzdWx0KHRhZykpOgogICAg
ICAgICAgICAgICAgIGYud3JpdGUoIiAgICAgICAgY3R4X3RtcF92cmVnX29mZihjdHgsICVzJXNO
LCAxLCB0cnVlKTtcbiIgJSBcCiAgICAgICAgICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCkp
CiAgICAgICAgICAgICBlbHNlOgpAQCAtMzc5LDkgKzM4MSw2IEBAIGRlZiBnZW5wdHJfc3JjX3Jl
YWQoZiwgdGFnLCByZWd0eXBlLCByZWdpZCk6CiAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAg
IHZyZWdfc3JjX29mZihjdHgsICVzJXNOKSxcbiIgJSBcCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChyZWd0eXBlLCByZWdpZCkpCiAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAgIHNp
emVvZihNTVZlY3RvciksIHNpemVvZihNTVZlY3RvcikpO1xuIikKLSAgICAgICAgICAgIGlmIChu
b3QgaGV4X2NvbW1vbi5za2lwX3FlbXVfaGVscGVyKHRhZykpOgotICAgICAgICAgICAgICAgIGYu
d3JpdGUoIiAgICB0Y2dfZ2VuX2FkZGlfcHRyKCVzJXNWLCBjcHVfZW52LCAlcyVzVl9vZmYpO1xu
IiAlIFwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCwg
cmVndHlwZSwgcmVnaWQpKQogICAgICAgICBlbHNlOgogICAgICAgICAgICAgcHJpbnQoIkJhZCBy
ZWdpc3RlciBwYXJzZTogIiwgcmVndHlwZSwgcmVnaWQpCiAgICAgZWxpZiAocmVndHlwZSA9PSAi
USIpOgotLSAKMi4xNy4xCgo=

