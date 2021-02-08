Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E361B312A4C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 06:56:20 +0100 (CET)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8zX1-0000ys-Td
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 00:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zNw-0007ch-LG
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:46:56 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l8zNs-0006RS-JH
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 00:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1612763212; x=1644299212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aAUf//6Otmwsr5GNai3Zqy0MF8zv9cUAfHCpD9oiAmI=;
 b=AMyFwjoKfSOAy3cFk72KB7g5MMs19tWV8dIjVjMUWWWBl3sYeCrgh4yG
 t7yomUVwsnvSSOiIIRPtUSWH8zIw7rMQCjsZcGqyqYA/6olxenuVelFAl
 Y3xQVOmatwCqNeA45dYusEarDNJ+mBPrndDAAJs6S8ppEw/+m6ZjHugb2 Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Feb 2021 21:46:30 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 07 Feb 2021 21:46:29 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id DDFED2A73; Sun,  7 Feb 2021 23:46:28 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/35] Hexagon (disas) disassembler
Date: Sun,  7 Feb 2021 23:45:55 -0600
Message-Id: <1612763186-18161-6-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, tsimpson@quicinc.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGhleGFnb24gdG8gZGlzYXMvbWVzb24uYnVpbGQKQWRkIGRpc2FzL2hleGFnb24uYwpBZGQg
aGV4YWdvbiB0byBpbmNsdWRlL2Rpc2FzL2Rpcy1hc20uaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpUZXN0ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgotLS0KIGluY2x1ZGUvZGlzYXMvZGlzLWFzbS5oIHwg
IDEgKwogZGlzYXMvaGV4YWdvbi5jICAgICAgICAgfCA2NSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkaXNhcy9tZXNvbi5idWlsZCAgICAgICB8ICAx
ICsKIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRpc2FzL2hleGFnb24uYwoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZGlzYXMvZGlzLWFzbS5oIGIv
aW5jbHVkZS9kaXNhcy9kaXMtYXNtLmgKaW5kZXggZDExMzNhNC4uMTNmYTFlZCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kaXNhcy9kaXMtYXNtLmgKKysrIGIvaW5jbHVkZS9kaXNhcy9kaXMtYXNtLmgK
QEAgLTQ1OSw2ICs0NTksNyBAQCBpbnQgcHJpbnRfaW5zbl94dGVuc2EgICAgICAgICAgIChiZmRf
dm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5zbl9yaXNjdjMyICAgICAgICAg
IChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5zbl9yaXNjdjY0ICAg
ICAgICAgIChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5zbl9yeChi
ZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvICopOworaW50IHByaW50X2luc25faGV4YWdvbihiZmRf
dm1hLCBkaXNhc3NlbWJsZV9pbmZvICopOwogCiAjaWZkZWYgQ09ORklHX0NBUFNUT05FCiBib29s
IGNhcF9kaXNhc190YXJnZXQoZGlzYXNzZW1ibGVfaW5mbyAqaW5mbywgdWludDY0X3QgcGMsIHNp
emVfdCBzaXplKTsKZGlmZiAtLWdpdCBhL2Rpc2FzL2hleGFnb24uYyBiL2Rpc2FzL2hleGFnb24u
YwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4zYzI0ZTJhCi0tLSAvZGV2L251
bGwKKysrIGIvZGlzYXMvaGV4YWdvbi5jCkBAIC0wLDAgKzEsNjUgQEAKKy8qCisgKiAgQ29weXJp
Z2h0KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmln
aHRzIFJlc2VydmVkLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGlj
ZW5zZSwgb3IKKyAqICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAq
ICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJl
IHVzZWZ1bCwKKyAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUg
aW1wbGllZCB3YXJyYW50eSBvZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQg
YSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGgg
dGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4u
CisgKi8KKworLyoKKyAqIFFFTVUgSGV4YWdvbiBEaXNhc3NlbWJsZXIKKyAqLworCisjaW5jbHVk
ZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgImRpc2FzL2Rpcy1hc20uaCIKKyNpbmNsdWRlICJ0
YXJnZXQvaGV4YWdvbi9jcHVfYml0cy5oIgorCisvKgorICogV2Ugd2lsbCBkaXNhc3NlbWJsZSBh
IHBhY2tldCB3aXRoIHVwIHRvIDQgaW5zdHJ1Y3Rpb25zLCBzbyB3ZSBuZWVkCisgKiBhIGhlZnR5
IHNpemUgYnVmZmVyLgorICovCisjZGVmaW5lIFBBQ0tFVF9CVUZGRVJfTEVOICAgICAgICAgICAg
ICAgICAgIDEwMjgKKworaW50IHByaW50X2luc25faGV4YWdvbihiZmRfdm1hIG1lbWFkZHIsIHN0
cnVjdCBkaXNhc3NlbWJsZV9pbmZvICppbmZvKQoreworICAgIHVpbnQzMl90IHdvcmRzW1BBQ0tF
VF9XT1JEU19NQVhdOworICAgIGJvb2wgZm91bmRfZW5kID0gZmFsc2U7CisgICAgR1N0cmluZyAq
YnVmID0gZ19zdHJpbmdfc2l6ZWRfbmV3KFBBQ0tFVF9CVUZGRVJfTEVOKTsKKyAgICBpbnQgaSwg
bGVuOworCisgICAgZm9yIChpID0gMDsgaSA8IFBBQ0tFVF9XT1JEU19NQVggJiYgIWZvdW5kX2Vu
ZDsgaSsrKSB7CisgICAgICAgIGludCBzdGF0dXMgPSAoKmluZm8tPnJlYWRfbWVtb3J5X2Z1bmMp
KG1lbWFkZHIgKyBpICogc2l6ZW9mKHVpbnQzMl90KSwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGJmZF9ieXRlICopJndvcmRzW2ldLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YodWludDMyX3QpLCBp
bmZvKTsKKyAgICAgICAgaWYgKHN0YXR1cykgeworICAgICAgICAgICAgaWYgKGkgPiAwKSB7Cisg
ICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CisgICAgICAgICAgICAoKmluZm8t
Pm1lbW9yeV9lcnJvcl9mdW5jKShzdGF0dXMsIG1lbWFkZHIsIGluZm8pOworICAgICAgICAgICAg
cmV0dXJuIHN0YXR1czsKKyAgICAgICAgfQorICAgICAgICBpZiAoaXNfcGFja2V0X2VuZCh3b3Jk
c1tpXSkpIHsKKyAgICAgICAgICAgIGZvdW5kX2VuZCA9IHRydWU7CisgICAgICAgIH0KKyAgICB9
CisKKyAgICBpZiAoIWZvdW5kX2VuZCkgeworICAgICAgICAoKmluZm8tPmZwcmludGZfZnVuYyko
aW5mby0+c3RyZWFtLCAiPGludmFsaWQ+Iik7CisgICAgICAgIHJldHVybiBQQUNLRVRfV09SRFNf
TUFYICogc2l6ZW9mKHVpbnQzMl90KTsKKyAgICB9CisKKyAgICBsZW4gPSBkaXNhc3NlbWJsZV9o
ZXhhZ29uKHdvcmRzLCBpLCBtZW1hZGRyLCBidWYpOworICAgICgqaW5mby0+ZnByaW50Zl9mdW5j
KShpbmZvLT5zdHJlYW0sICIlcyIsIGJ1Zi0+c3RyKTsKKyAgICBnX3N0cmluZ19mcmVlKGJ1Ziwg
dHJ1ZSk7CisKKyAgICByZXR1cm4gbGVuOworfQpkaWZmIC0tZ2l0IGEvZGlzYXMvbWVzb24uYnVp
bGQgYi9kaXNhcy9tZXNvbi5idWlsZAppbmRleCBkYTM0MWE1Li40YzhkYTAxIDEwMDY0NAotLS0g
YS9kaXNhcy9tZXNvbi5idWlsZAorKysgYi9kaXNhcy9tZXNvbi5idWlsZApAQCAtNiw2ICs2LDcg
QEAgY29tbW9uX3NzLmFkZCh3aGVuOiAnQ09ORklHX0FSTV9BNjRfRElTJywgaWZfdHJ1ZTogZmls
ZXMoJ2FybS1hNjQuY2MnKSkKIGNvbW1vbl9zcy5hZGRfYWxsKHdoZW46ICdDT05GSUdfQVJNX0E2
NF9ESVMnLCBpZl90cnVlOiBsaWJ2aXhsX3NzKQogY29tbW9uX3NzLmFkZCh3aGVuOiAnQ09ORklH
X0FSTV9ESVMnLCBpZl90cnVlOiBmaWxlcygnYXJtLmMnKSkKIGNvbW1vbl9zcy5hZGQod2hlbjog
J0NPTkZJR19DUklTX0RJUycsIGlmX3RydWU6IGZpbGVzKCdjcmlzLmMnKSkKK2NvbW1vbl9zcy5h
ZGQod2hlbjogJ0NPTkZJR19IRVhBR09OX0RJUycsIGlmX3RydWU6IGZpbGVzKCdoZXhhZ29uLmMn
KSkKIGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19IUFBBX0RJUycsIGlmX3RydWU6IGZpbGVz
KCdocHBhLmMnKSkKIGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19JMzg2X0RJUycsIGlmX3Ry
dWU6IGZpbGVzKCdpMzg2LmMnKSkKIGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19MTTMyX0RJ
UycsIGlmX3RydWU6IGZpbGVzKCdsbTMyLmMnKSkKLS0gCjIuNy40Cgo=

