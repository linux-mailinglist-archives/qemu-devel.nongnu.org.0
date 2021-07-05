Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6613BC42B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 01:42:09 +0200 (CEST)
Received: from localhost ([::1]:46036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0YE4-0000gV-Ew
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 19:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6z-0003JJ-8z
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:49 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1m0Y6x-0004dS-Bq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 19:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1625528087; x=1657064087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ww0v8/mnuM0II0gRz0G2O2CLED4Rk9WXpau7rNJV0RU=;
 b=D61LADYwsiy2mJ8lr/F1w7eSM4qUz+qkBycAtCrcRLT0ivF6XWaXTTAk
 aZuBoIpXLKHye3d5coVkSL6XTHg4ll3zPuYpBkMLT1bghktd5Xhy2I7Rf
 U+dM8VN5UEEwJePYZKxybHT5qFQfJlnGYZ+WW0KV1qr34Q9M5O7hDpfQY A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Jul 2021 16:34:39 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 05 Jul 2021 16:34:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D935FCFC; Mon,  5 Jul 2021 18:34:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] Hexagon HVX (target/hexagon) support in gdbstub
Date: Mon,  5 Jul 2021 18:34:18 -0500
Message-Id: <1625528074-19440-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, peter.maydell@linaro.org, bcain@quicinc.com,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dkYnN0dWIuYyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMgYi90YXJnZXQvaGV4YWdvbi9n
ZGJzdHViLmMKaW5kZXggOWM4YzA0Yy4uYjgwNGU5NyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2Ric3R1Yi5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dkYnN0dWIuYwpAQCAtMjEsNiArMjEs
MzAgQEAKICNpbmNsdWRlICJjcHUuaCIKICNpbmNsdWRlICJpbnRlcm5hbC5oIgogCitzdGF0aWMg
aW50IGdkYl9nZXRfdnJlZyhDUFVIZXhhZ29uU3RhdGUgKmVudiwgR0J5dGVBcnJheSAqbWVtX2J1
ZiwgaW50IG4pCit7CisgICAgaW50IHRvdGFsID0gMDsKKyAgICBpbnQgaTsKKyAgICBmb3IgKGkg
PSAwOyBpIDwgTUFYX1ZFQ19TSVpFX0JZVEVTIC8gc2l6ZW9mKHVpbnQzMl90KTsgaSsrKSB7Cisg
ICAgICAgIHRvdGFsICs9IGdkYl9nZXRfcmVnbChtZW1fYnVmLCBlbnYtPlZSZWdzW25dLnV3W2ld
KTsKKyAgICAgICAgbWVtX2J1ZiArPSBzaXplb2YodWludDMyX3QpOworICAgIH0KKyAgICByZXR1
cm4gdG90YWw7Cit9CisKK3N0YXRpYyBpbnQgZ2RiX2dldF9xcmVnKENQVUhleGFnb25TdGF0ZSAq
ZW52LCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikKK3sKKyAgICBpbnQgdG90YWwgPSAwOwor
ICAgIGludCBpOworICAgIGZvciAoaSA9IDA7CisgICAgICAgICBpIDwgTUFYX1ZFQ19TSVpFX0JZ
VEVTIC8gc2l6ZW9mKHVpbnQzMl90KSAvIEJJVFNfUEVSX0JZVEU7CisgICAgICAgICBpKyspIHsK
KyAgICAgICAgdG90YWwgKz0gZ2RiX2dldF9yZWdsKG1lbV9idWYsIGVudi0+UVJlZ3Nbbl0udXdb
aV0pOworICAgICAgICBtZW1fYnVmICs9IHNpemVvZih1aW50MzJfdCk7CisgICAgfQorICAgIHJl
dHVybiB0b3RhbDsKK30KKwogaW50IGhleGFnb25fZ2RiX3JlYWRfcmVnaXN0ZXIoQ1BVU3RhdGUg
KmNzLCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikKIHsKICAgICBIZXhhZ29uQ1BVICpjcHUg
PSBIRVhBR09OX0NQVShjcyk7CkBAIC0yOSwxMCArNTMsNDIgQEAgaW50IGhleGFnb25fZ2RiX3Jl
YWRfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNzLCBHQnl0ZUFycmF5ICptZW1fYnVmLCBpbnQgbikKICAg
ICBpZiAobiA8IFRPVEFMX1BFUl9USFJFQURfUkVHUykgewogICAgICAgICByZXR1cm4gZ2RiX2dl
dF9yZWdsKG1lbV9idWYsIGVudi0+Z3ByW25dKTsKICAgICB9CisgICAgbiAtPSBUT1RBTF9QRVJf
VEhSRUFEX1JFR1M7CisKKyAgICBpZiAobiA8IE5VTV9WUkVHUykgeworICAgICAgICByZXR1cm4g
Z2RiX2dldF92cmVnKGVudiwgbWVtX2J1Ziwgbik7CisgICAgfQorICAgIG4gLT0gTlVNX1ZSRUdT
OworCisgICAgaWYgKG4gPCBOVU1fUVJFR1MpIHsKKyAgICAgICAgcmV0dXJuIGdkYl9nZXRfcXJl
ZyhlbnYsIG1lbV9idWYsIG4pOworICAgIH0KIAogICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7
CiB9CiAKK3N0YXRpYyBpbnQgZ2RiX3B1dF92cmVnKENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50
OF90ICptZW1fYnVmLCBpbnQgbikKK3sKKyAgICBpbnQgaTsKKyAgICBmb3IgKGkgPSAwOyBpIDwg
TUFYX1ZFQ19TSVpFX0JZVEVTIC8gc2l6ZW9mKHVpbnQzMl90KTsgaSsrKSB7CisgICAgICAgIGVu
di0+VlJlZ3Nbbl0udXdbaV0gPSBsZHR1bF9wKG1lbV9idWYpOworICAgICAgICBtZW1fYnVmICs9
IHNpemVvZih1aW50MzJfdCk7CisgICAgfQorICAgIHJldHVybiBNQVhfVkVDX1NJWkVfQllURVM7
Cit9CisKK3N0YXRpYyBpbnQgZ2RiX3B1dF9xcmVnKENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50
OF90ICptZW1fYnVmLCBpbnQgbikKK3sKKyAgICBpbnQgaTsKKyAgICBmb3IgKGkgPSAwOworICAg
ICAgICAgaSA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIHNpemVvZih1aW50MzJfdCkgLyBCSVRTX1BF
Ul9CWVRFOworICAgICAgICAgaSsrKSB7CisgICAgICAgIGVudi0+UVJlZ3Nbbl0udXdbaV0gPSBs
ZHR1bF9wKG1lbV9idWYpOworICAgICAgICBtZW1fYnVmICs9IHNpemVvZih1aW50MzJfdCk7Cisg
ICAgfQorICAgIHJldHVybiBNQVhfVkVDX1NJWkVfQllURVMgLyBCSVRTX1BFUl9CWVRFOworfQor
CiBpbnQgaGV4YWdvbl9nZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNzLCB1aW50OF90ICpt
ZW1fYnVmLCBpbnQgbikKIHsKICAgICBIZXhhZ29uQ1BVICpjcHUgPSBIRVhBR09OX0NQVShjcyk7
CkBAIC00Miw2ICs5OCwxNiBAQCBpbnQgaGV4YWdvbl9nZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3Rh
dGUgKmNzLCB1aW50OF90ICptZW1fYnVmLCBpbnQgbikKICAgICAgICAgZW52LT5ncHJbbl0gPSBs
ZHR1bF9wKG1lbV9idWYpOwogICAgICAgICByZXR1cm4gc2l6ZW9mKHRhcmdldF91bG9uZyk7CiAg
ICAgfQorICAgIG4gLT0gVE9UQUxfUEVSX1RIUkVBRF9SRUdTOworCisgICAgaWYgKG4gPCBOVU1f
VlJFR1MpIHsKKyAgICAgICAgcmV0dXJuIGdkYl9wdXRfdnJlZyhlbnYsIG1lbV9idWYsIG4pOwor
ICAgIH0KKyAgICBuIC09IE5VTV9WUkVHUzsKKworICAgIGlmIChuIDwgTlVNX1FSRUdTKSB7Cisg
ICAgICAgIHJldHVybiBnZGJfcHV0X3FyZWcoZW52LCBtZW1fYnVmLCBuKTsKKyAgICB9CiAKICAg
ICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOwogfQotLSAKMi43LjQKCg==

