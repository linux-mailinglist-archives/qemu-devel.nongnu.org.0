Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A311587B4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 02:09:07 +0100 (CET)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1K30-0002xP-Aj
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 20:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1JdB-00035J-17
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:42:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tsimpson@qualcomm.com>) id 1j1Jd9-0004rf-H3
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:42:24 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:59197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tsimpson@qualcomm.com>)
 id 1j1Jd9-0004rC-0Z
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:42:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1581381743; x=1612917743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pp9Lk9V6WyraelkskLP0rMo4/Lvmws63pDJujN3GuLA=;
 b=KcvIPY8tDDN+KkV3LTBqGy1D2J3QN3KfP842LCnwv2D3r6UE5mn90qQ9
 yRxjJ+Di8R+fqt86Pt527YqWdfyYairFMyCvFtGj3ezdlP8k1juY8wUbf
 ptAkPc0ZAixky1xl+mXB/8x49pKyeVFR3Kyh+xgNVkh+o4O1PfzFqsmXw I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2020 16:41:04 -0800
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 10 Feb 2020 16:41:03 -0800
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id AE6701BB0; Mon, 10 Feb 2020 18:41:03 -0600 (CST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 63/66] Hexagon HVX helper to commit vector stores (masked
 and scatter/gather)
Date: Mon, 10 Feb 2020 18:40:41 -0600
Message-Id: <1581381644-13678-64-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
References: <1581381644-13678-1-git-send-email-tsimpson@quicinc.com>
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
IHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgIHwgIDEgKwogdGFyZ2V0L2hleGFnb24vb3BfaGVs
cGVyLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9oZWxwZXIuaCBiL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oCmluZGV4IDVkYzBmNzEu
LjNlNDcyOGQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL2hlbHBlci5oCkBAIC0yMSw2ICsyMSw3IEBAIERFRl9IRUxQRVJfMihyYWlzZV9l
eGNlcHRpb24sIG5vcmV0dXJuLCBlbnYsIGkzMikKIERFRl9IRUxQRVJfMShkZWJ1Z19zdGFydF9w
YWNrZXQsIHZvaWQsIGVudikKIERFRl9IRUxQRVJfMihuZXdfdmFsdWUsIHMzMiwgZW52LCBpbnQp
CiBERUZfSEVMUEVSXzMoZGVidWdfY2hlY2tfc3RvcmVfd2lkdGgsIHZvaWQsIGVudiwgaW50LCBp
bnQpCitERUZfSEVMUEVSXzEoY29tbWl0X2h2eF9zdG9yZXMsIHZvaWQsIGVudikKIERFRl9IRUxQ
RVJfMyhkZWJ1Z19jb21taXRfZW5kLCB2b2lkLCBlbnYsIGludCwgaW50KQogREVGX0hFTFBFUl8z
KHNmcmVjaXBhX3ZhbCwgczMyLCBlbnYsIHMzMiwgczMyKQogREVGX0hFTFBFUl8zKHNmcmVjaXBh
X3ByZWQsIHMzMiwgZW52LCBzMzIsIHMzMikKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKaW5kZXggNjZjY2QyMC4uYWMw
YjViMyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0
L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTI5LDYgKzI5LDggQEAKICNpbmNsdWRlICJhcmNoLmgi
CiAjaW5jbHVkZSAiZm1hX2VtdS5oIgogI2luY2x1ZGUgImNvbnZfZW11LmgiCisjaW5jbHVkZSAi
bW12ZWMvbW12ZWMuaCIKKyNpbmNsdWRlICJtbXZlYy9tYWNyb3MuaCIKIAogI2lmIENPVU5UX0hF
WF9IRUxQRVJTCiAjaW5jbHVkZSAib3Bjb2Rlcy5oIgpAQCAtMTk4LDYgKzIwMCw1MSBAQCB2b2lk
IEhFTFBFUihkZWJ1Z19jaGVja19zdG9yZV93aWR0aCkoQ1BVSGV4YWdvblN0YXRlICplbnYsIGlu
dCBzbG90LCBpbnQgY2hlY2spCiAgICAgfQogfQogCit2b2lkIEhFTFBFUihjb21taXRfaHZ4X3N0
b3JlcykoQ1BVSGV4YWdvblN0YXRlICplbnYpCit7CisgICAgaW50IGk7CisKKyAgICAvKiBOb3Jt
YWwgKHBvc3NpYmx5IG1hc2tlZCkgdmVjdG9yIHN0b3JlICovCisgICAgZm9yIChpID0gMDsgaSA8
IFZTVE9SRVNfTUFYOyBpKyspIHsKKyAgICAgICAgaWYgKGVudi0+dnN0b3JlX3BlbmRpbmdbaV0p
IHsKKyAgICAgICAgICAgIGVudi0+dnN0b3JlX3BlbmRpbmdbaV0gPSAwOworICAgICAgICAgICAg
dGFyZ2V0X3Vsb25nIHZhID0gZW52LT52c3RvcmVbaV0udmE7CisgICAgICAgICAgICBpbnQgc2l6
ZSA9IGVudi0+dnN0b3JlW2ldLnNpemU7CisgICAgICAgICAgICBmb3IgKGludCBqID0gMDsgaiA8
IHNpemU7IGorKykgeworICAgICAgICAgICAgICAgIGlmIChlbnYtPnZzdG9yZVtpXS5tYXNrLnVi
W2pdKSB7CisgICAgICAgICAgICAgICAgICAgIHB1dF91c2VyX3U4KGVudi0+dnN0b3JlW2ldLmRh
dGEudWJbal0sIHZhICsgaik7CisgICAgICAgICAgICAgICAgfQorICAgICAgICAgICAgfQorICAg
ICAgICB9CisgICAgfQorCisgICAgLyogU2NhdHRlciBzdG9yZSAqLworICAgIGlmIChlbnYtPnZ0
Y21fcGVuZGluZykgeworICAgICAgICBlbnYtPnZ0Y21fcGVuZGluZyA9IDA7CisgICAgICAgIGlm
IChlbnYtPnZ0Y21fbG9nLm9wKSB7CisgICAgICAgICAgICAvKiBOZWVkIHRvIHBlcmZvcm0gdGhl
IHNjYXR0ZXIgcmVhZC9tb2RpZnkvd3JpdGUgYXQgY29tbWl0IHRpbWUgKi8KKyAgICAgICAgICAg
IGlmIChlbnYtPnZ0Y21fbG9nLm9wX3NpemUgPT0gMikgeworICAgICAgICAgICAgICAgIFNDQVRU
RVJfT1BfV1JJVEVfVE9fTUVNKHNpemUydV90KTsKKyAgICAgICAgICAgIH0gZWxzZSBpZiAoZW52
LT52dGNtX2xvZy5vcF9zaXplID09IDQpIHsKKyAgICAgICAgICAgICAgICAvKiBXb3JkIFNjYXR0
ZXIgKz0gKi8KKyAgICAgICAgICAgICAgICBTQ0FUVEVSX09QX1dSSVRFX1RPX01FTShzaXplNHVf
dCk7CisgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAgIGdfYXNzZXJ0X25vdF9y
ZWFjaGVkKCk7CisgICAgICAgICAgICB9CisgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICBm
b3IgKGludCBpID0gMDsgaSA8IGVudi0+dnRjbV9sb2cuc2l6ZTsgaSsrKSB7CisgICAgICAgICAg
ICAgICAgaWYgKGVudi0+dnRjbV9sb2cubWFzay51YltpXSAhPSAwKSB7CisgICAgICAgICAgICAg
ICAgICAgIHB1dF91c2VyX3U4KGVudi0+dnRjbV9sb2cuZGF0YS51YltpXSwgZW52LT52dGNtX2xv
Zy52YVtpXSk7CisgICAgICAgICAgICAgICAgICAgIGVudi0+dnRjbV9sb2cubWFzay51YltpXSA9
IDA7CisgICAgICAgICAgICAgICAgICAgIGVudi0+dnRjbV9sb2cuZGF0YS51YltpXSA9IDA7Cisg
ICAgICAgICAgICAgICAgICAgIGVudi0+dnRjbV9sb2cub2Zmc2V0cy51YltpXSA9IDA7CisgICAg
ICAgICAgICAgICAgfQorCisgICAgICAgICAgICB9CisgICAgICAgIH0KKyAgICB9Cit9CisKIHN0
YXRpYyB2b2lkIHByaW50X3N0b3JlKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQgc2xvdCkKIHsK
ICAgICBpZiAoIShlbnYtPnNsb3RfY2FuY2VsbGVkICYgKDEgPDwgc2xvdCkpKSB7CkBAIC00MTMs
NiArNDYwLDM0IEBAIHZvaWQgSEVMUEVSKGRlYnVnX3ZhbHVlX2k2NCkoQ1BVSGV4YWdvblN0YXRl
ICplbnYsIGludDY0X3QgdmFsdWUpCiAgICAgSEVYX0RFQlVHX0xPRygidmFsdWUgPSAweCVseFxu
IiwgdmFsdWUpOwogfQogCisvKiBMb2cgYSB3cml0ZSB0byBIVlggdmVjdG9yICovCitzdGF0aWMg
aW5saW5lIHZvaWQgbG9nX3ZyZWdfd3JpdGUoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBudW0s
IHZvaWQgKnZhciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHZu
ZXcsIHVpbnQzMl90IHNsb3QpCit7CisgICAgSEVYX0RFQlVHX0xPRygibG9nX3ZyZWdfd3JpdGVb
JWRdIiwgbnVtKTsKKyAgICBpZiAoZW52LT5zbG90X2NhbmNlbGxlZCAmICgxIDw8IHNsb3QpKSB7
CisgICAgICAgIEhFWF9ERUJVR19MT0coIiBDQU5DRUxMRUQiKTsKKyAgICB9CisgICAgSEVYX0RF
QlVHX0xPRygiXG4iKTsKKworICAgIGlmICghKGVudi0+c2xvdF9jYW5jZWxsZWQgJiAoMSA8PCBz
bG90KSkpIHsKKyAgICAgICAgVlJlZ01hc2sgcmVnbnVtX21hc2sgPSAoKFZSZWdNYXNrKTEpIDw8
IG51bTsKKyAgICAgICAgZW52LT5WUmVnc191cGRhdGVkIHw9ICAgICAgKHZuZXcgIT0gRVhUX1RN
UCkgPyByZWdudW1fbWFzayA6IDA7CisgICAgICAgIGVudi0+VlJlZ3Nfc2VsZWN0IHw9ICAgICAg
ICh2bmV3ID09IEVYVF9ORVcpID8gcmVnbnVtX21hc2sgOiAwOworICAgICAgICBlbnYtPlZSZWdz
X3VwZGF0ZWRfdG1wICB8PSAodm5ldyA9PSBFWFRfVE1QKSA/IHJlZ251bV9tYXNrIDogMDsKKyAg
ICAgICAgZW52LT5mdXR1cmVfVlJlZ3NbbnVtXSA9ICoobW12ZWN0b3JfdCAqKXZhcjsKKyAgICAg
ICAgaWYgKHZuZXcgPT0gRVhUX1RNUCkgeworICAgICAgICAgICAgZW52LT50bXBfVlJlZ3NbbnVt
XSA9IGVudi0+ZnV0dXJlX1ZSZWdzW251bV07CisgICAgICAgIH0KKyAgICB9Cit9CisKK3N0YXRp
YyBpbmxpbmUgdm9pZCBsb2dfbW12ZWN0b3Jfd3JpdGUoQ1BVSGV4YWdvblN0YXRlICplbnYsIGlu
dCBudW0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1tdmVjdG9yX3Qg
dmFyLCBpbnQgdm5ldywgdWludDMyX3Qgc2xvdCkKK3sKKyAgICBsb2dfdnJlZ193cml0ZShlbnYs
IG51bSwgJnZhciwgdm5ldywgc2xvdCk7Cit9CisKIHN0YXRpYyB2b2lkIGNhbmNlbF9zbG90KENQ
VUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90KQogewogICAgIEhFWF9ERUJVR19MT0co
IlNsb3QgJWQgY2FuY2VsbGVkXG4iLCBzbG90KTsKLS0gCjIuNy40Cgo=

