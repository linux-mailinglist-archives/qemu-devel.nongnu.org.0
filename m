Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082427B350
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 19:33:54 +0200 (CEST)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMx29-00086U-HR
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 13:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMwxk-0002sm-TR
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:29:21 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:53863)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1kMwxh-0007v8-Iu
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1601314157; x=1632850157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6RM41eV8/zv6Tqe8/Life+vIkclcKTwN9DS2uFecLD0=;
 b=F+B/PJ3QUcVi3hUJbFcS75GaLM1tz4X7yQ2NqLcp8DLe9HMRGVkO+q8M
 qmtuDRlRLhfMRqBKmQwoWBAB+2pT6+Os+C9HYvspINy2iVKOoWzRcb7wU
 HkfcVWS2O0M87rZ4rKrfyQ1bL4IZyhkwiK2BGm/JE8k9KXKgV9UIMzWwQ A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Sep 2020 10:29:03 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 28 Sep 2020 10:29:03 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 193711253; Mon, 28 Sep 2020 12:29:03 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 14/29] Hexagon (target/hexagon) instruction printing
Date: Mon, 28 Sep 2020 12:28:43 -0500
Message-Id: <1601314138-9930-15-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601314138-9930-1-git-send-email-tsimpson@quicinc.com>
References: <1601314138-9930-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 13:29:03
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, richard.henderson@linaro.org,
 laurent@vivier.eu, tsimpson@quicinc.com, philmd@redhat.com,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL3ByaW50aW5zbi5oIHwgMjYgKysrKysrKysrKysrKwogdGFyZ2V0L2hl
eGFnb24vcHJpbnRpbnNuLmMgfCA5MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24vcHJpbnRpbnNuLmgKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0YXJnZXQvaGV4YWdvbi9wcmludGluc24uYwoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L3ByaW50aW5zbi5oIGIvdGFyZ2V0L2hleGFnb24vcHJpbnRpbnNuLmgKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMC4uMjY0YjYzYwotLS0gL2Rldi9udWxsCisrKyBiL3RhcmdldC9o
ZXhhZ29uL3ByaW50aW5zbi5oCkBAIC0wLDAgKzEsMjYgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMp
IDIwMTktMjAyMCBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJl
c2VydmVkLgorICoKKyAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CisgKiAgdGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwg
b3IKKyAqICAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqICBUaGlz
IHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwKKyAqICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGll
ZCB3YXJyYW50eSBvZgorICogIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAqICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9yZSBkZXRhaWxzLgorICoKKyAqICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorICogIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8K
KworI2lmbmRlZiBIRVhBR09OX1BSSU5USU5TTl9ICisjZGVmaW5lIEhFWEFHT05fUFJJTlRJTlNO
X0gKKworI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKKyNpbmNsdWRlICJpbnNuLmgiCisKK2V4dGVy
biB2b2lkIHNucHJpbnRfYV9wa3QoY2hhciAqYnVmLCBpbnQgbiwgcGFja2V0X3QgKnBrdCk7CisK
KyNlbmRpZgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vcHJpbnRpbnNuLmMgYi90YXJnZXQv
aGV4YWdvbi9wcmludGluc24uYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi5l
NGRjZGFiCi0tLSAvZGV2L251bGwKKysrIGIvdGFyZ2V0L2hleGFnb24vcHJpbnRpbnNuLmMKQEAg
LTAsMCArMSw5MSBAQAorLyoKKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIwIFF1YWxjb21tIElu
bm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
OyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlv
bikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFO
WSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgor
ICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxo
dHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAqLworCisjaW5jbHVkZSAicWVtdS9vc2Rl
cC5oIgorI2luY2x1ZGUgIm9wY29kZXMuaCIKKyNpbmNsdWRlICJwcmludGluc24uaCIKKyNpbmNs
dWRlICJpbnNuLmgiCisjaW5jbHVkZSAicmVnX2ZpZWxkcy5oIgorI2luY2x1ZGUgImludGVybmFs
LmgiCisKK3N0YXRpYyBjb25zdCBjaGFyICpzcmVnMnN0cih1bnNpZ25lZCBpbnQgcmVnKQorewor
ICAgIGlmIChyZWcgPCBUT1RBTF9QRVJfVEhSRUFEX1JFR1MpIHsKKyAgICAgICAgcmV0dXJuIGhl
eGFnb25fcmVnbmFtZXNbcmVnXTsKKyAgICB9IGVsc2UgeworICAgICAgICByZXR1cm4gIj8/PyI7
CisgICAgfQorfQorCitzdGF0aWMgY29uc3QgY2hhciAqY3JlZzJzdHIodW5zaWduZWQgaW50IHJl
ZykKK3sKKyAgICByZXR1cm4gc3JlZzJzdHIocmVnICsgSEVYX1JFR19TQTApOworfQorCitzdGF0
aWMgdm9pZCBzbnByaW50aW5zbihjaGFyICpidWYsIGludCBuLCBpbnNuX3QgKiBpbnNuKQorewor
ICAgIHN3aXRjaCAoaW5zbi0+b3Bjb2RlKSB7CisjZGVmaW5lIERFRl9WRUNYX1BSSU5USU5GTyhU
QUcsIEZNVCwgLi4uKSBERUZfUFJJTlRJTkZPKFRBRywgRk1ULCBfX1ZBX0FSR1NfXykKKyNkZWZp
bmUgREVGX1BSSU5USU5GTyhUQUcsIEZNVCwgLi4uKSBcCisgICAgY2FzZSBUQUc6IFwKKyAgICAg
ICAgc25wcmludGYoYnVmLCBuLCBGTVQsIF9fVkFfQVJHU19fKTtcCisgICAgICAgIGJyZWFrOwor
I2luY2x1ZGUgInByaW50aW5zbl9nZW5lcmF0ZWQuaCIKKyN1bmRlZiBERUZfVkVDWF9QUklOVElO
Rk8KKyN1bmRlZiBERUZfUFJJTlRJTkZPCisgICAgfQorfQorCit2b2lkIHNucHJpbnRfYV9wa3Qo
Y2hhciAqYnVmLCBpbnQgbiwgcGFja2V0X3QgKiBwa3QpCit7CisgICAgY2hhciB0bXBidWZbMTI4
XTsKKyAgICBidWZbMF0gPSAnXDAnOworICAgIGludCBpLCBzbG90LCBvcGNvZGU7CisKKyAgICBp
ZiAocGt0ID09IE5VTEwpIHsKKyAgICAgICAgc25wcmludGYoYnVmLCBuLCAiPHByaW50cGt0OiBO
VUxMIHB0cj4iKTsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAgIGlmIChwa3QtPm51bV9p
bnNucyA+IDEpIHsKKyAgICAgICAgc3RybmNhdChidWYsICJcbntcbiIsIG4pOworICAgIH0KKyAg
ICBmb3IgKGkgPSAwOyBpIDwgcGt0LT5udW1faW5zbnM7IGkrKykgeworICAgICAgICBpZiAocGt0
LT5pbnNuW2ldLnBhcnQxKSB7CisgICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgfQorICAg
ICAgICBzbnByaW50aW5zbih0bXBidWYsIDEyNywgJihwa3QtPmluc25baV0pKTsKKyAgICAgICAg
c3RybmNhdChidWYsICJcdCIsIG4pOworICAgICAgICBzdHJuY2F0KGJ1ZiwgdG1wYnVmLCBuKTsK
KyAgICAgICAgaWYgKEdFVF9BVFRSSUIocGt0LT5pbnNuW2ldLm9wY29kZSwgQV9TVUJJTlNOKSkg
eworICAgICAgICAgICAgc3RybmNhdChidWYsICIgLy9zdWJpbnNuIiwgbik7CisgICAgICAgIH0K
KyAgICAgICAgaWYgKHBrdC0+aW5zbltpXS5leHRlbnNpb25fdmFsaWQpIHsKKyAgICAgICAgICAg
IHN0cm5jYXQoYnVmLCAiIC8vY29uc3RhbnQgZXh0ZW5kZWQiLCBuKTsKKyAgICAgICAgfQorICAg
ICAgICBzbG90ID0gcGt0LT5pbnNuW2ldLnNsb3Q7CisgICAgICAgIG9wY29kZSA9IHBrdC0+aW5z
bltpXS5vcGNvZGU7CisgICAgICAgIHNucHJpbnRmKHRtcGJ1ZiwgMTI3LCAiIC8vc2xvdD0lZDp0
YWc9JXMiLCBzbG90LCBvcGNvZGVfbmFtZXNbb3Bjb2RlXSk7CisgICAgICAgIHN0cm5jYXQoYnVm
LCB0bXBidWYsIG4pOworCisgICAgICAgIHN0cm5jYXQoYnVmLCAiXG4iLCBuKTsKKyAgICB9Cisg
ICAgaWYgKHBrdC0+bnVtX2luc25zID4gMSkgeworICAgICAgICBzdHJuY2F0KGJ1ZiwgIn1cbiIs
IG4pOworICAgIH0KK30KKwotLSAKMi43LjQKCg==

