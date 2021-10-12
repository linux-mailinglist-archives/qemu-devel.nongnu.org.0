Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30E42A168
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:52:50 +0200 (CEST)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maESn-0006Z3-T0
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maE8R-0008J6-V0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:47 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6317)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1maE8O-00073g-IT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1634031104; x=1665567104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uyEP4IIoEecyQ67HTTcAxzZnywqonDywkat+eswTuSA=;
 b=EHg0IHtEUUVKKe3Es5NwomE1Q6PumdEeftIc9esZzv+CBlQuAZ2MEris
 m8HXO60S6AqzE7ue07lZGWI/bJfyC2VWWpHb9AaZV4MtZo9WrpbmG6BNR
 YI83vSm5hpd5253a0VlVZiVpBlZbj9drTtStbS6WIK7uHmM1dGDnj8NyK 4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Oct 2021 02:31:38 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg05-sd.qualcomm.com with ESMTP; 12 Oct 2021 02:31:38 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D24C0112F; Tue, 12 Oct 2021 04:31:37 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) put writes to USR into temp until
 commit
Date: Tue, 12 Oct 2021 04:31:20 -0500
Message-Id: <1634031081-25450-3-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
References: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
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

Q2hhbmdlIFNFVF9VU1JfRklFTEQgdG8gd3JpdGUgdG8gaGV4X25ld192YWx1ZVtIRVhfUkVHX1VT
Ul0gaW5zdGVhZApvZiBoZXhfZ3ByW0hFWF9SRUdfVVNSXS4KClRoZW4sIHdlIG5lZWQgY29kZSB0
byBtYXJrIHRoZSBpbnN0cnVjdGlvbnMgdGhhdCBjYW4gc2V0IGltcGxpY2l0bHkKc2V0IFVTUgot
IE1hY3JvcyBhZGRlZCB0byBoZXhfY29tbW9uLnB5Ci0gQV9GUE9QIGFkZGVkIGluIHRyYW5zbGF0
ZS5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+
Ci0tLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICAgfCAyICstCiB0YXJnZXQvaGV4
YWdvbi9hdHRyaWJzX2RlZi5oLmluYyB8IDEgKwogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMg
ICAgICAgfCA5ICsrKysrKysrLQogdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgfCAy
ICsrCiA0IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQvaGV4YWdvbi9tYWNy
b3MuaAppbmRleCAwOTRiOGRhLi5jMGUyZDdjIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9t
YWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApAQCAtNjIsNyArNjIsNyBAQAog
ICAgICAgICAgICAgICAgICAgIHJlZ19maWVsZF9pbmZvW0ZJRUxEXS5vZmZzZXQpCiAKICNkZWZp
bmUgU0VUX1VTUl9GSUVMRChGSUVMRCwgVkFMKSBcCi0gICAgZklOU0VSVF9CSVRTKGVudi0+Z3By
W0hFWF9SRUdfVVNSXSwgcmVnX2ZpZWxkX2luZm9bRklFTERdLndpZHRoLCBcCisgICAgZklOU0VS
VF9CSVRTKGVudi0+bmV3X3ZhbHVlW0hFWF9SRUdfVVNSXSwgcmVnX2ZpZWxkX2luZm9bRklFTERd
LndpZHRoLCBcCiAgICAgICAgICAgICAgICAgIHJlZ19maWVsZF9pbmZvW0ZJRUxEXS5vZmZzZXQs
IChWQUwpKQogI2VuZGlmCiAKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVm
LmguaW5jIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKaW5kZXggMzgxNTUwOS4u
ZTQ0YTdlYSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKKysr
IGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMKQEAgLTY0LDYgKzY0LDcgQEAgREVG
X0FUVFJJQihJTVBMSUNJVF9XUklURVNfUDEsICJXcml0ZXMgUHJlZGljYXRlIDEiLCAiIiwgIlVS
RUcuUDEiKQogREVGX0FUVFJJQihJTVBMSUNJVF9XUklURVNfUDIsICJXcml0ZXMgUHJlZGljYXRl
IDEiLCAiIiwgIlVSRUcuUDIiKQogREVGX0FUVFJJQihJTVBMSUNJVF9XUklURVNfUDMsICJNYXkg
d3JpdGUgUHJlZGljYXRlIDMiLCAiIiwgIlVSRUcuUDMiKQogREVGX0FUVFJJQihJTVBMSUNJVF9S
RUFEU19QQywgIlJlYWRzIHRoZSBQQyByZWdpc3RlciIsICIiLCAiIikKK0RFRl9BVFRSSUIoSU1Q
TElDSVRfV1JJVEVTX1VTUiwgIk1heSB3cml0ZSBVU1IiLCAiIiwgIiIpCiBERUZfQVRUUklCKFdS
SVRFU19QUkVEX1JFRywgIldyaXRlcyBhIHByZWRpY2F0ZSByZWdpc3RlciIsICIiLCAiIikKIAog
REVGX0FUVFJJQihDUlNMT1QyMywgIkNhbiBleGVjdXRlIGluIHNsb3QgMiBvciBzbG90IDMgKENS
KSIsICIiLCAiIikKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmMKaW5kZXggNmZiNGU2OC4uMmM5MDgxYSAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmMKQEAgLTIxMCw3ICsyMTAsMTIgQEAgc3RhdGljIHZvaWQgbWFya19pbXBsaWNpdF9yZWdf
d3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIEluc24gKmluc24sCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBpbnQgYXR0cmliLCBpbnQgcm51bSkKIHsKICAgICBpZiAoR0VUX0FU
VFJJQihpbnNuLT5vcGNvZGUsIGF0dHJpYikpIHsKLSAgICAgICAgYm9vbCBpc19wcmVkaWNhdGVk
ID0gR0VUX0FUVFJJQihpbnNuLT5vcGNvZGUsIEFfQ09OREVYRUMpOworICAgICAgICAvKgorICAg
ICAgICAgKiBVU1IgaXMgdXNlZCB0byBzZXQgb3ZlcmZsb3cgYW5kIEZQIGV4Y2VwdGlvbnMsCisg
ICAgICAgICAqIHNvIHRyZWF0IGl0IGFzIGNvbmRpdGlvbmFsCisgICAgICAgICAqLworICAgICAg
ICBib29sIGlzX3ByZWRpY2F0ZWQgPSBHRVRfQVRUUklCKGluc24tPm9wY29kZSwgQV9DT05ERVhF
QykgfHwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm51bSA9PSBIRVhfUkVHX1VTUjsK
ICAgICAgICAgaWYgKGlzX3ByZWRpY2F0ZWQgJiYgIWlzX3ByZWxvYWRlZChjdHgsIHJudW0pKSB7
CiAgICAgICAgICAgICB0Y2dfZ2VuX21vdl90bChoZXhfbmV3X3ZhbHVlW3JudW1dLCBoZXhfZ3By
W3JudW1dKTsKICAgICAgICAgfQpAQCAtMjM2LDYgKzI0MSw4IEBAIHN0YXRpYyB2b2lkIG1hcmtf
aW1wbGljaXRfcmVnX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCwgSW5zbiAqaW5zbikKICAgICBt
YXJrX2ltcGxpY2l0X3JlZ193cml0ZShjdHgsIGluc24sIEFfSU1QTElDSVRfV1JJVEVTX1NBMCwg
SEVYX1JFR19TQTApOwogICAgIG1hcmtfaW1wbGljaXRfcmVnX3dyaXRlKGN0eCwgaW5zbiwgQV9J
TVBMSUNJVF9XUklURVNfTEMxLCBIRVhfUkVHX0xDMSk7CiAgICAgbWFya19pbXBsaWNpdF9yZWdf
d3JpdGUoY3R4LCBpbnNuLCBBX0lNUExJQ0lUX1dSSVRFU19TQTEsIEhFWF9SRUdfU0ExKTsKKyAg
ICBtYXJrX2ltcGxpY2l0X3JlZ193cml0ZShjdHgsIGluc24sIEFfSU1QTElDSVRfV1JJVEVTX1VT
UiwgSEVYX1JFR19VU1IpOworICAgIG1hcmtfaW1wbGljaXRfcmVnX3dyaXRlKGN0eCwgaW5zbiwg
QV9GUE9QLCBIRVhfUkVHX1VTUik7CiB9CiAKIHN0YXRpYyB2b2lkIG1hcmtfaW1wbGljaXRfcHJl
ZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgsIEluc24gKmluc24pCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5IGIvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weQpp
bmRleCBiM2I1MzQwLi5hODRiMDAzIDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9oZXhfY29t
bW9uLnB5CisrKyBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKQEAgLTczLDYgKzczLDgg
QEAgZGVmIGNhbGN1bGF0ZV9hdHRyaWJzKCk6CiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdm
V1JJVEVfUDEnLCAnQV9XUklURVNfUFJFRF9SRUcnKQogICAgIGFkZF9xZW11X21hY3JvX2F0dHJp
YignZldSSVRFX1AyJywgJ0FfV1JJVEVTX1BSRURfUkVHJykKICAgICBhZGRfcWVtdV9tYWNyb19h
dHRyaWIoJ2ZXUklURV9QMycsICdBX1dSSVRFU19QUkVEX1JFRycpCisgICAgYWRkX3FlbXVfbWFj
cm9fYXR0cmliKCdmU0VUX09WRVJGTE9XJywgJ0FfSU1QTElDSVRfV1JJVEVTX1VTUicpCisgICAg
YWRkX3FlbXVfbWFjcm9fYXR0cmliKCdmU0VUX0xQQ0ZHJywgJ0FfSU1QTElDSVRfV1JJVEVTX1VT
UicpCiAKICAgICAjIFJlY3Vyc2UgZG93biBtYWNyb3MsIGZpbmQgYXR0cmlidXRlcyBmcm9tIHN1
Yi1tYWNyb3MKICAgICBtYWNyb1ZhbHVlcyA9IGxpc3QobWFjcm9zLnZhbHVlcygpKQotLSAKMi43
LjQKCg==

