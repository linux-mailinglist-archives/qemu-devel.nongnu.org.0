Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79D2FC954
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 04:47:30 +0100 (CET)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l24Sv-0001Pc-E2
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 22:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bi-0007JK-La
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:42 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:5511)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1l24Bd-0007VU-La
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 22:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611113377; x=1642649377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUhlAD3NC7M546xE63eWGdXMS1MGL1LuNBSwKKUIJsE=;
 b=l8h0S6CPUFsQydnD1SMx17ePS+SNkcDZYwvdpfRKGXxykPiFf6v8eeF7
 Kri8ltlDDrIcVBinzrkSdSwXV2ZcHu6MMqo10l3fhUwwJ+vaMvOI+vNrJ
 BXasG9wtOIlHo/6WT6vv95uoBIMd2UJ3pt420nGX0fR1E62bH6EELPEs4 M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 19 Jan 2021 19:29:25 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 642282A16; Tue, 19 Jan 2021 21:29:24 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/35] Hexagon (disas) disassembler
Date: Tue, 19 Jan 2021 21:28:38 -0600
Message-Id: <1611113349-24906-6-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
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
ZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmcKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmcKLS0tCiBpbmNsdWRlL2Rpc2FzL2Rpcy1hc20uaCB8ICAx
ICsKIGRpc2FzL2hleGFnb24uYyAgICAgICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogZGlzYXMvbWVzb24uYnVpbGQgICAgICAgfCAgMSAr
CiAzIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
aXNhcy9oZXhhZ29uLmMKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Rpc2FzL2Rpcy1hc20uaCBiL2lu
Y2x1ZGUvZGlzYXMvZGlzLWFzbS5oCmluZGV4IGQxMTMzYTQuLjEzZmExZWQgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvZGlzYXMvZGlzLWFzbS5oCisrKyBiL2luY2x1ZGUvZGlzYXMvZGlzLWFzbS5oCkBA
IC00NTksNiArNDU5LDcgQEAgaW50IHByaW50X2luc25feHRlbnNhICAgICAgICAgICAoYmZkX3Zt
YSwgZGlzYXNzZW1ibGVfaW5mbyopOwogaW50IHByaW50X2luc25fcmlzY3YzMiAgICAgICAgICAo
YmZkX3ZtYSwgZGlzYXNzZW1ibGVfaW5mbyopOwogaW50IHByaW50X2luc25fcmlzY3Y2NCAgICAg
ICAgICAoYmZkX3ZtYSwgZGlzYXNzZW1ibGVfaW5mbyopOwogaW50IHByaW50X2luc25fcngoYmZk
X3ZtYSwgZGlzYXNzZW1ibGVfaW5mbyAqKTsKK2ludCBwcmludF9pbnNuX2hleGFnb24oYmZkX3Zt
YSwgZGlzYXNzZW1ibGVfaW5mbyAqKTsKIAogI2lmZGVmIENPTkZJR19DQVBTVE9ORQogYm9vbCBj
YXBfZGlzYXNfdGFyZ2V0KGRpc2Fzc2VtYmxlX2luZm8gKmluZm8sIHVpbnQ2NF90IHBjLCBzaXpl
X3Qgc2l6ZSk7CmRpZmYgLS1naXQgYS9kaXNhcy9oZXhhZ29uLmMgYi9kaXNhcy9oZXhhZ29uLmMK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uM2MyNGUyYQotLS0gL2Rldi9udWxs
CisrKyBiL2Rpc2FzL2hleGFnb24uYwpAQCAtMCwwICsxLDY1IEBACisvKgorICogIENvcHlyaWdo
dChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqICBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogIHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vu
c2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAg
VGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1
c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGlt
cGxpZWQgd2FycmFudHkgb2YKKyAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEg
Y29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRo
aXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lgor
ICovCisKKy8qCisgKiBRRU1VIEhleGFnb24gRGlzYXNzZW1ibGVyCisgKi8KKworI2luY2x1ZGUg
InFlbXUvb3NkZXAuaCIKKyNpbmNsdWRlICJkaXNhcy9kaXMtYXNtLmgiCisjaW5jbHVkZSAidGFy
Z2V0L2hleGFnb24vY3B1X2JpdHMuaCIKKworLyoKKyAqIFdlIHdpbGwgZGlzYXNzZW1ibGUgYSBw
YWNrZXQgd2l0aCB1cCB0byA0IGluc3RydWN0aW9ucywgc28gd2UgbmVlZAorICogYSBoZWZ0eSBz
aXplIGJ1ZmZlci4KKyAqLworI2RlZmluZSBQQUNLRVRfQlVGRkVSX0xFTiAgICAgICAgICAgICAg
ICAgICAxMDI4CisKK2ludCBwcmludF9pbnNuX2hleGFnb24oYmZkX3ZtYSBtZW1hZGRyLCBzdHJ1
Y3QgZGlzYXNzZW1ibGVfaW5mbyAqaW5mbykKK3sKKyAgICB1aW50MzJfdCB3b3Jkc1tQQUNLRVRf
V09SRFNfTUFYXTsKKyAgICBib29sIGZvdW5kX2VuZCA9IGZhbHNlOworICAgIEdTdHJpbmcgKmJ1
ZiA9IGdfc3RyaW5nX3NpemVkX25ldyhQQUNLRVRfQlVGRkVSX0xFTik7CisgICAgaW50IGksIGxl
bjsKKworICAgIGZvciAoaSA9IDA7IGkgPCBQQUNLRVRfV09SRFNfTUFYICYmICFmb3VuZF9lbmQ7
IGkrKykgeworICAgICAgICBpbnQgc3RhdHVzID0gKCppbmZvLT5yZWFkX21lbW9yeV9mdW5jKSht
ZW1hZGRyICsgaSAqIHNpemVvZih1aW50MzJfdCksCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChiZmRfYnl0ZSAqKSZ3b3Jkc1tpXSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHVpbnQzMl90KSwgaW5m
byk7CisgICAgICAgIGlmIChzdGF0dXMpIHsKKyAgICAgICAgICAgIGlmIChpID4gMCkgeworICAg
ICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgfQorICAgICAgICAgICAgKCppbmZvLT5t
ZW1vcnlfZXJyb3JfZnVuYykoc3RhdHVzLCBtZW1hZGRyLCBpbmZvKTsKKyAgICAgICAgICAgIHJl
dHVybiBzdGF0dXM7CisgICAgICAgIH0KKyAgICAgICAgaWYgKGlzX3BhY2tldF9lbmQod29yZHNb
aV0pKSB7CisgICAgICAgICAgICBmb3VuZF9lbmQgPSB0cnVlOworICAgICAgICB9CisgICAgfQor
CisgICAgaWYgKCFmb3VuZF9lbmQpIHsKKyAgICAgICAgKCppbmZvLT5mcHJpbnRmX2Z1bmMpKGlu
Zm8tPnN0cmVhbSwgIjxpbnZhbGlkPiIpOworICAgICAgICByZXR1cm4gUEFDS0VUX1dPUkRTX01B
WCAqIHNpemVvZih1aW50MzJfdCk7CisgICAgfQorCisgICAgbGVuID0gZGlzYXNzZW1ibGVfaGV4
YWdvbih3b3JkcywgaSwgbWVtYWRkciwgYnVmKTsKKyAgICAoKmluZm8tPmZwcmludGZfZnVuYyko
aW5mby0+c3RyZWFtLCAiJXMiLCBidWYtPnN0cik7CisgICAgZ19zdHJpbmdfZnJlZShidWYsIHRy
dWUpOworCisgICAgcmV0dXJuIGxlbjsKK30KZGlmZiAtLWdpdCBhL2Rpc2FzL21lc29uLmJ1aWxk
IGIvZGlzYXMvbWVzb24uYnVpbGQKaW5kZXggMDlhODUyNy4uYjdiNjU5YiAxMDA2NDQKLS0tIGEv
ZGlzYXMvbWVzb24uYnVpbGQKKysrIGIvZGlzYXMvbWVzb24uYnVpbGQKQEAgLTYsNiArNiw3IEBA
IGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19BUk1fQTY0X0RJUycsIGlmX3RydWU6IGZpbGVz
KCdhcm0tYTY0LmNjJykpCiBjb21tb25fc3MuYWRkX2FsbCh3aGVuOiAnQ09ORklHX0FSTV9BNjRf
RElTJywgaWZfdHJ1ZTogbGlidml4bF9zcykKIGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19B
Uk1fRElTJywgaWZfdHJ1ZTogZmlsZXMoJ2FybS5jJykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdD
T05GSUdfQ1JJU19ESVMnLCBpZl90cnVlOiBmaWxlcygnY3Jpcy5jJykpCitjb21tb25fc3MuYWRk
KHdoZW46ICdDT05GSUdfSEVYQUdPTl9ESVMnLCBpZl90cnVlOiBmaWxlcygnaGV4YWdvbi5jJykp
CiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdfSFBQQV9ESVMnLCBpZl90cnVlOiBmaWxlcygn
aHBwYS5jJykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdfSTM4Nl9ESVMnLCBpZl90cnVl
OiBmaWxlcygnaTM4Ni5jJykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdfTE0zMl9ESVMn
LCBpZl90cnVlOiBmaWxlcygnbG0zMi5jJykpCi0tIAoyLjcuNAoK

