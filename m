Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7952EECAA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:49:09 +0100 (CET)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxji0-00078s-DW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOs-0006mN-Ke
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:22 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:25185)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kxjOq-00058Q-1O
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1610080159; x=1641616159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sj37VHBZKEqrMV66eyYTHeJSlGRgDx67/K5L8sl6oXg=;
 b=LUnG/NSp0dj71mDw8MtgaS+0R83Q53/MUljIGHrtNnow6y6wIylApkQW
 q92tSZ3NCkwPtgUIB9pxBeie5/w5BGuKg577aUVV+NlG5oXLCx2Zer/Y5
 SpXRu0PdBzN0vMoa+0rKAvBe9n9JTkQkv1Y0mfoTa06eV9zd4vnKAAfqS Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jan 2021 20:29:13 -0800
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 07 Jan 2021 20:29:12 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 01D7911F3; Thu,  7 Jan 2021 22:29:11 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/35] Hexagon (disas) disassembler
Date: Thu,  7 Jan 2021 22:28:36 -0600
Message-Id: <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 laurent@vivier.eu, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkIGhleGFnb24gdG8gZGlzYXMvbWVzb24uYnVpbGQKQWRkIGRpc2FzL2hleGFnb24uYwpBZGQg
aGV4YWdvbiB0byBpbmNsdWRlL2Rpc2FzL2Rpcy1hc20uaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9y
IFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIGluY2x1ZGUvZGlzYXMvZGlzLWFz
bS5oIHwgIDEgKwogZGlzYXMvaGV4YWdvbi5jICAgICAgICAgfCA2OCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkaXNhcy9tZXNvbi5idWlsZCAgICAg
ICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRpc2FzL2hleGFnb24uYwoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZGlzYXMvZGlzLWFz
bS5oIGIvaW5jbHVkZS9kaXNhcy9kaXMtYXNtLmgKaW5kZXggMjE2NDc2Mi4uMWY1NGZjMCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kaXNhcy9kaXMtYXNtLmgKKysrIGIvaW5jbHVkZS9kaXNhcy9kaXMt
YXNtLmgKQEAgLTQ1OSw2ICs0NTksNyBAQCBpbnQgcHJpbnRfaW5zbl94dGVuc2EgICAgICAgICAg
IChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5zbl9yaXNjdjMyICAg
ICAgICAgIChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5zbl9yaXNj
djY0ICAgICAgICAgIChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvKik7CiBpbnQgcHJpbnRfaW5z
bl9yeChiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvICopOworaW50IHByaW50X2luc25faGV4YWdv
bihiZmRfdm1hLCBkaXNhc3NlbWJsZV9pbmZvICopOwogCiAjaWZkZWYgQ09ORklHX0NBUFNUT05F
CiBib29sIGNhcF9kaXNhc190YXJnZXQoZGlzYXNzZW1ibGVfaW5mbyAqaW5mbywgdWludDY0X3Qg
cGMsIHNpemVfdCBzaXplKTsKZGlmZiAtLWdpdCBhL2Rpc2FzL2hleGFnb24uYyBiL2Rpc2FzL2hl
eGFnb24uYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi45NjhmMTFjCi0tLSAv
ZGV2L251bGwKKysrIGIvZGlzYXMvaGV4YWdvbi5jCkBAIC0wLDAgKzEsNjggQEAKKy8qCisgKiAg
Q29weXJpZ2h0KGMpIDIwMTktMjAyMCBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBB
bGwgUmlnaHRzIFJlc2VydmVkLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
CisgKiAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0
aGUgTGljZW5zZSwgb3IKKyAqICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgor
ICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsIGJlIHVzZWZ1bCwKKyAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZl
biB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25n
IHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLz4uCisgKi8KKworLyoKKyAqIFFFTVUgSGV4YWdvbiBEaXNhc3NlbWJsZXIKKyAqLworCisj
aW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgImRpc2FzL2Rpcy1hc20uaCIKKyNpbmNs
dWRlICJ0YXJnZXQvaGV4YWdvbi9jcHVfYml0cy5oIgorCisvKgorICogV2Ugd2lsbCBkaXNhc3Nl
bWJsZSBhIHBhY2tldCB3aXRoIHVwIHRvIDQgaW5zdHJ1Y3Rpb25zLCBzbyB3ZSBuZWVkCisgKiBh
IGhlZnR5IHNpemUgYnVmZmVyLgorICovCisjZGVmaW5lIFBBQ0tFVF9CVUZGRVJfTEVOICAgICAg
ICAgICAgICAgICAgIDEwMjgKKworaW50IHByaW50X2luc25faGV4YWdvbihiZmRfdm1hIG1lbWFk
ZHIsIHN0cnVjdCBkaXNhc3NlbWJsZV9pbmZvICppbmZvKQoreworICAgIHVpbnQzMl90IHdvcmRz
W1BBQ0tFVF9XT1JEU19NQVhdOworICAgIGJvb2wgZm91bmRfZW5kID0gZmFsc2U7CisgICAgY2hh
ciBidWZbUEFDS0VUX0JVRkZFUl9MRU5dOworICAgIGludCBpOworCisgICAgZm9yIChpID0gMDsg
aSA8IFBBQ0tFVF9XT1JEU19NQVggJiYgIWZvdW5kX2VuZDsgaSsrKSB7CisgICAgICAgIGludCBz
dGF0dXMgPSAoKmluZm8tPnJlYWRfbWVtb3J5X2Z1bmMpKG1lbWFkZHIgKyBpICogc2l6ZW9mKHVp
bnQzMl90KSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KGJmZF9ieXRlICopJndvcmRzW2ldLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplb2YodWludDMyX3QpLCBpbmZvKTsKKyAgICAgICAgaWYgKHN0YXR1
cykgeworICAgICAgICAgICAgaWYgKGkgPiAwKSB7CisgICAgICAgICAgICAgICAgYnJlYWs7Cisg
ICAgICAgICAgICB9CisgICAgICAgICAgICAoKmluZm8tPm1lbW9yeV9lcnJvcl9mdW5jKShzdGF0
dXMsIG1lbWFkZHIsIGluZm8pOworICAgICAgICAgICAgcmV0dXJuIHN0YXR1czsKKyAgICAgICAg
fQorICAgICAgICBpZiAoaXNfcGFja2V0X2VuZCh3b3Jkc1tpXSkpIHsKKyAgICAgICAgICAgIGZv
dW5kX2VuZCA9IHRydWU7CisgICAgICAgIH0KKyAgICB9CisKKyAgICBpZiAoIWZvdW5kX2VuZCkg
eworICAgICAgICAoKmluZm8tPmZwcmludGZfZnVuYykoaW5mby0+c3RyZWFtLCAiPGludmFsaWQ+
Iik7CisgICAgICAgIHJldHVybiBQQUNLRVRfV09SRFNfTUFYICogNDsKKyAgICB9CisKKyAgICBp
bnQgbGVuID0gZGlzYXNzZW1ibGVfaGV4YWdvbih3b3JkcywgaSwgbWVtYWRkciwgYnVmLCBQQUNL
RVRfQlVGRkVSX0xFTik7CisgICAgaW50IHNsZW4gPSBzdHJsZW4oYnVmKTsKKyAgICBpZiAoYnVm
W3NsZW4gLSAxXSA9PSAnXG4nKSB7CisgICAgICAgIGJ1ZltzbGVuIC0gMV0gPSAnXDAnOworICAg
IH0KKyAgICAoKmluZm8tPmZwcmludGZfZnVuYykoaW5mby0+c3RyZWFtLCAiJXMiLCBidWYpOwor
CisgICAgcmV0dXJuIGxlbjsKK30KZGlmZiAtLWdpdCBhL2Rpc2FzL21lc29uLmJ1aWxkIGIvZGlz
YXMvbWVzb24uYnVpbGQKaW5kZXggMDlhODUyNy4uYjdiNjU5YiAxMDA2NDQKLS0tIGEvZGlzYXMv
bWVzb24uYnVpbGQKKysrIGIvZGlzYXMvbWVzb24uYnVpbGQKQEAgLTYsNiArNiw3IEBAIGNvbW1v
bl9zcy5hZGQod2hlbjogJ0NPTkZJR19BUk1fQTY0X0RJUycsIGlmX3RydWU6IGZpbGVzKCdhcm0t
YTY0LmNjJykpCiBjb21tb25fc3MuYWRkX2FsbCh3aGVuOiAnQ09ORklHX0FSTV9BNjRfRElTJywg
aWZfdHJ1ZTogbGlidml4bF9zcykKIGNvbW1vbl9zcy5hZGQod2hlbjogJ0NPTkZJR19BUk1fRElT
JywgaWZfdHJ1ZTogZmlsZXMoJ2FybS5jJykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdf
Q1JJU19ESVMnLCBpZl90cnVlOiBmaWxlcygnY3Jpcy5jJykpCitjb21tb25fc3MuYWRkKHdoZW46
ICdDT05GSUdfSEVYQUdPTl9ESVMnLCBpZl90cnVlOiBmaWxlcygnaGV4YWdvbi5jJykpCiBjb21t
b25fc3MuYWRkKHdoZW46ICdDT05GSUdfSFBQQV9ESVMnLCBpZl90cnVlOiBmaWxlcygnaHBwYS5j
JykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdfSTM4Nl9ESVMnLCBpZl90cnVlOiBmaWxl
cygnaTM4Ni5jJykpCiBjb21tb25fc3MuYWRkKHdoZW46ICdDT05GSUdfTE0zMl9ESVMnLCBpZl90
cnVlOiBmaWxlcygnbG0zMi5jJykpCi0tIAoyLjcuNAoK

