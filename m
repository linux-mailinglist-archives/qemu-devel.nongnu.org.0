Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE2173E25
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 18:16:27 +0100 (CET)
Received: from localhost ([::1]:51112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7jFT-0002NR-0g
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 12:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7im1-0005ax-0m
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j7ilz-00079p-Pv
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:46:00 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:27026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j7ilz-0005U4-GM
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1582908359; x=1614444359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DFiYq/TqpVVEyNz6Bpz3GlX93C54CgCm5kaxbuGCrBA=;
 b=UP3xBp8Oew2St3TcWoHwUnD1Nl7+QmV+4LaKtx7BwdC10hY1f7S1J7aK
 +6p0iDbNu+eGd0/mQZACpUxSuI/wx0QaeS8fXIvx5HAvqeEKSQuRArYjQ
 fZ2RDw6wK8agqC9k7kBT5zQuQUBu7+djA7Nc9bdfvFWmEhBTB2Id9nxbe U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Feb 2020 08:44:34 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 28 Feb 2020 08:44:33 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id E515D1110; Fri, 28 Feb 2020 10:44:32 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 55/67] Hexagon HVX support in gdbstub
Date: Fri, 28 Feb 2020 10:43:51 -0600
Message-Id: <1582908244-304-56-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
References: <1582908244-304-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
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
Cc: riku.voipio@iki.fi, richard.henderson@linaro.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dkYnN0dWIuYyB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMgYi90YXJnZXQvaGV4YWdvbi9n
ZGJzdHViLmMKaW5kZXggZTY3OGFlYS4uNzlhNGYzMyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2Ric3R1Yi5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dkYnN0dWIuYwpAQCAtMjEsNiArMjEs
MjggQEAKICNpbmNsdWRlICJjcHUuaCIKICNpbmNsdWRlICJpbnRlcm5hbC5oIgogCitzdGF0aWMg
aW50IGdkYl9nZXRfdnJlZyhDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDhfdCAqbWVtX2J1Ziwg
aW50IG4pCit7CisgICAgaW50IHRvdGFsID0gMDsKKyAgICBpbnQgaTsKKyAgICBmb3IgKGkgPSAw
OyBpIDwgTUFYX1ZFQ19TSVpFX0JZVEVTIC8gNDsgaSsrKSB7CisgICAgICAgIHRvdGFsICs9IGdk
Yl9nZXRfcmVnbChtZW1fYnVmLCBlbnYtPlZSZWdzW25dLnV3W2ldKTsKKyAgICAgICAgbWVtX2J1
ZiArPSA0OworICAgIH0KKyAgICByZXR1cm4gdG90YWw7Cit9CisKK3N0YXRpYyBpbnQgZ2RiX2dl
dF9xcmVnKENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50OF90ICptZW1fYnVmLCBpbnQgbikKK3sK
KyAgICBpbnQgdG90YWwgPSAwOworICAgIGludCBpOworICAgIGZvciAoaSA9IDA7IGkgPCBNQVhf
VkVDX1NJWkVfQllURVMgLyA0IC8gODsgaSsrKSB7CisgICAgICAgIHRvdGFsICs9IGdkYl9nZXRf
cmVnbChtZW1fYnVmLCBlbnYtPlFSZWdzW25dLnV3W2ldKTsKKyAgICAgICAgbWVtX2J1ZiArPSA0
OworICAgIH0KKyAgICByZXR1cm4gdG90YWw7Cit9CisKIGludCBoZXhhZ29uX2dkYl9yZWFkX3Jl
Z2lzdGVyKENQVVN0YXRlICpjcywgdWludDhfdCAqbWVtX2J1ZiwgaW50IG4pCiB7CiAgICAgSGV4
YWdvbkNQVSAqY3B1ID0gSEVYQUdPTl9DUFUoY3MpOwpAQCAtMjksMTEgKzUxLDQxIEBAIGludCBo
ZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgdWludDhfdCAqbWVtX2J1Ziwg
aW50IG4pCiAgICAgaWYgKG4gPCBUT1RBTF9QRVJfVEhSRUFEX1JFR1MpIHsKICAgICAgICAgcmV0
dXJuIGdkYl9nZXRfcmVnbChtZW1fYnVmLCBlbnYtPmdwcltuXSk7CiAgICAgfQorICAgIG4gLT0g
VE9UQUxfUEVSX1RIUkVBRF9SRUdTOworCisgICAgaWYgKG4gPCBOVU1fVlJFR1MpIHsKKyAgICAg
ICAgcmV0dXJuIGdkYl9nZXRfdnJlZyhlbnYsIG1lbV9idWYsIG4pOworICAgIH0KKyAgICBuIC09
IE5VTV9WUkVHUzsKKworICAgIGlmIChuIDwgTlVNX1FSRUdTKSB7CisgICAgICAgIHJldHVybiBn
ZGJfZ2V0X3FyZWcoZW52LCBtZW1fYnVmLCBuKTsKKyAgICB9CiAKICAgICBnX2Fzc2VydF9ub3Rf
cmVhY2hlZCgpOwogICAgIHJldHVybiAwOwogfQogCitzdGF0aWMgaW50IGdkYl9wdXRfdnJlZyhD
UFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDhfdCAqbWVtX2J1ZiwgaW50IG4pCit7CisgICAgaW50
IGk7CisgICAgZm9yIChpID0gMDsgaSA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQ7IGkrKykgewor
ICAgICAgICBlbnYtPlZSZWdzW25dLnV3W2ldID0gbGR0dWxfcChtZW1fYnVmKTsKKyAgICAgICAg
bWVtX2J1ZiArPSA0OworICAgIH0KKyAgICByZXR1cm4gTUFYX1ZFQ19TSVpFX0JZVEVTOworfQor
CitzdGF0aWMgaW50IGdkYl9wdXRfcXJlZyhDUFVIZXhhZ29uU3RhdGUgKmVudiwgdWludDhfdCAq
bWVtX2J1ZiwgaW50IG4pCit7CisgICAgaW50IGk7CisgICAgZm9yIChpID0gMDsgaSA8IE1BWF9W
RUNfU0laRV9CWVRFUyAvIDQgLyA4OyBpKyspIHsKKyAgICAgICAgZW52LT5RUmVnc1tuXS51d1tp
XSA9IGxkdHVsX3AobWVtX2J1Zik7CisgICAgICAgIG1lbV9idWYgKz0gNDsKKyAgICB9CisgICAg
cmV0dXJuIE1BWF9WRUNfU0laRV9CWVRFUyAvIDg7Cit9CisKIGludCBoZXhhZ29uX2dkYl93cml0
ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3MsIHVpbnQ4X3QgKm1lbV9idWYsIGludCBuKQogewogICAg
IEhleGFnb25DUFUgKmNwdSA9IEhFWEFHT05fQ1BVKGNzKTsKQEAgLTQzLDYgKzk1LDE2IEBAIGlu
dCBoZXhhZ29uX2dkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0ZSAqY3MsIHVpbnQ4X3QgKm1lbV9i
dWYsIGludCBuKQogICAgICAgICBlbnYtPmdwcltuXSA9IGxkdHVsX3AobWVtX2J1Zik7CiAgICAg
ICAgIHJldHVybiBzaXplb2YodGFyZ2V0X3Vsb25nKTsKICAgICB9CisgICAgbiAtPSBUT1RBTF9Q
RVJfVEhSRUFEX1JFR1M7CisKKyAgICBpZiAobiA8IE5VTV9WUkVHUykgeworICAgICAgICByZXR1
cm4gZ2RiX3B1dF92cmVnKGVudiwgbWVtX2J1Ziwgbik7CisgICAgfQorICAgIG4gLT0gTlVNX1ZS
RUdTOworCisgICAgaWYgKG4gPCBOVU1fUVJFR1MpIHsKKyAgICAgICAgcmV0dXJuIGdkYl9wdXRf
cXJlZyhlbnYsIG1lbV9idWYsIG4pOworICAgIH0KIAogICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVk
KCk7CiAgICAgcmV0dXJuIDA7Ci0tIAoyLjcuNAoK

