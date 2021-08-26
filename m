Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62043F8D45
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:49:05 +0200 (CEST)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJUu-0003RU-Ov
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJId-00041M-8k
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:23 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:2985)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1mJJIZ-0005B0-UT
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1629999379; x=1661535379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OHpH6GrMUPkiEe99roQACPRMesTcma3KpHQYCr+khb8=;
 b=HgvNWT4NYtbRA5+dxVXi/bYi2+gU2qZ4tJRqg42EK44DNXVRDPYArJDs
 U5bC1Zn5fyaAwP6uozW81rbr5y95qFgj0bcNiWxQl6Rh3+hHEGPtgnftM
 LpcCA9w+agM+xrV5Eu4QlHFLdtLaD96aWlJ4MB7Pmsd3xq0DTAuyN7p4B A=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Aug 2021 10:36:14 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 26 Aug 2021 10:36:13 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 629C5121E; Thu, 26 Aug 2021 12:36:13 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] Hexagon HVX (target/hexagon) instruction attributes
Date: Thu, 26 Aug 2021 12:35:32 -0500
Message-Id: <1629999358-25304-5-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
References: <1629999358-25304-1-git-send-email-tsimpson@quicinc.com>
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
Cc: ale@rev.ng, bcain@quicinc.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jIHwgMjIgKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVm
LmguaW5jCmluZGV4IDM4MTU1MDkuLjQxMzhhN2EgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
L2F0dHJpYnNfZGVmLmguaW5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5j
CkBAIC00MSw2ICs0MSwyNyBAQCBERUZfQVRUUklCKFNUT1JFLCAiU3RvcmVzIHRvIG1lbW9yeSIs
ICIiLCAiIikKIERFRl9BVFRSSUIoTUVNTElLRSwgIk1lbW9yeS1saWtlIGluc3RydWN0aW9uIiwg
IiIsICIiKQogREVGX0FUVFJJQihNRU1MSUtFX1BBQ0tFVF9SVUxFUywgImZvbGxvd3MgTWVtb3J5
LWxpa2UgcGFja2V0IHJ1bGVzIiwgIiIsICIiKQogCisvKiBWNiBWZWN0b3IgYXR0cmlidXRlcyAq
LworREVGX0FUVFJJQihDVkksICJFeGVjdXRlcyBvbiB0aGUgSFZYIGV4dGVuc2lvbiIsICIiLCAi
IikKKworREVGX0FUVFJJQihDVklfTkVXLCAiTmV3IHZhbHVlIG1lbW9yeSBpbnN0cnVjdGlvbiBl
eGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WTSwgIk1lbW9yeSBpbnN0
cnVjdGlvbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9WUCwgIlBl
cm11dGUgaW5zdHJ1Y3Rpb24gZXhlY3V0ZXMgb24gSFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihD
VklfVlBfVlMsICJEb3VibGUgdmVjdG9yIHBlcm11dGUvc2hmdCBpbnNuIGV4ZWN1dGVzIG9uIEhW
WCIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1ZYLCAiTXVsdGlwbHkgaW5zdHJ1Y3Rpb24gZXhl
Y3V0ZXMgb24gSFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfVlhfRFYsICJEb3VibGUgdmVj
dG9yIG11bHRpcGx5IGluc24gZXhlY3V0ZXMgb24gSFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihD
VklfVlMsICJTaGlmdCBpbnN0cnVjdGlvbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZf
QVRUUklCKENWSV9WU19WWCwgIlBlcm11dGUvc2hpZnQgYW5kIG11bHRpcGx5IGluc24gZXhlY3V0
ZXMgb24gSFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfVkEsICJBTFUgaW5zdHJ1Y3Rpb24g
ZXhlY3V0ZXMgb24gSFZYIiwgIiIsICIiKQorREVGX0FUVFJJQihDVklfVkFfRFYsICJEb3VibGUg
dmVjdG9yIGFsdSBpbnN0cnVjdGlvbiBleGVjdXRlcyBvbiBIVlgiLCAiIiwgIiIpCitERUZfQVRU
UklCKENWSV80U0xPVCwgIkNvbnN1bWVzIGFsbCB0aGUgdmVjdG9yIGV4ZWN1dGlvbiByZXNvdXJj
ZXMiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9UTVAsICJUcmFuc2llbnQgTWVtb3J5IExvYWQg
bm90IHdyaXR0ZW4gdG8gcmVnaXN0ZXIiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9HQVRIRVIs
ICJDVkkgR2F0aGVyIG9wZXJhdGlvbiIsICIiLCAiIikKK0RFRl9BVFRSSUIoQ1ZJX1NDQVRURVIs
ICJDVkkgU2NhdHRlciBvcGVyYXRpb24iLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9TQ0FUVEVS
X1JFTEVBU0UsICJDVkkgU3RvcmUgUmVsZWFzZSBmb3Igc2NhdHRlciIsICIiLCAiIikKK0RFRl9B
VFRSSUIoQ1ZJX1RNUF9EU1QsICJDVkkgaW5zdHJ1Y3Rpb24gdGhhdCBkb2Vzbid0IHdyaXRlIGEg
cmVnaXN0ZXIiLCAiIiwgIiIpCitERUZfQVRUUklCKENWSV9TTE9UMjMsICJDYW4gZXhlY3V0ZSBp
biBzbG90IDIgb3Igc2xvdCAzIChIVlgpIiwgIiIsICIiKQorCiAKIC8qIENoYW5nZS1vZi1mbG93
IGF0dHJpYnV0ZXMgKi8KIERFRl9BVFRSSUIoSlVNUCwgIkp1bXAtdHlwZSBpbnN0cnVjdGlvbiIs
ICIiLCAiIikKQEAgLTg2LDYgKzEwNyw3IEBAIERFRl9BVFRSSUIoSFdMT09QMV9FTkQsICJFbmRz
IEhXIGxvb3AxIiwgIiIsICIiKQogREVGX0FUVFJJQihEQ1pFUk9BLCAiZGN6ZXJvYSB0eXBlIiwg
IiIsICIiKQogREVGX0FUVFJJQihJQ0ZMVVNIT1AsICJpY2ZsdXNoIG9wIHR5cGUiLCAiIiwgIiIp
CiBERUZfQVRUUklCKERDRkxVU0hPUCwgImRjZmx1c2ggb3AgdHlwZSIsICIiLCAiIikKK0RFRl9B
VFRSSUIoTDJGTFVTSE9QLCAibDJmbHVzaCBvcCB0eXBlIiwgIiIsICIiKQogREVGX0FUVFJJQihE
Q0ZFVENILCAiZGNmZXRjaCB0eXBlIiwgIiIsICIiKQogCiBERUZfQVRUUklCKEwyRkVUQ0gsICJJ
bnN0cnVjdGlvbiBpcyBsMmZldGNoIHR5cGUiLCAiIiwgIiIpCi0tIAoyLjcuNAoK

