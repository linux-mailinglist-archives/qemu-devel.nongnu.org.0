Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99361A101
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2L5-0001bA-Po; Fri, 04 Nov 2022 15:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kx-0001Y3-NV
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kt-0002Lg-KR
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:43 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A4JMuZO008430; Fri, 4 Nov 2022 19:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9UBWRAO5klejRR9l+sIDfzhWRo/xo6SPGRBdMbrT/xc=;
 b=AfVJtjBOpgvK46DkzQzwB6eMJzr8wgebBxefvyCjf5NueTgbmcOu/1Yo873TYqSbqMDr
 0vf8u+jYbQmfBW80YgnmBOPcABqAZWdMvOL4/F1lenqsL0W0VDAQDOA2Wpf7ToIXZCaq
 RrngjXoGj0P3kkIVSz0zME2q/ceLr28SWhb90lK5qKQvhcazpsIYGI4y7CqxWAOatZ2f
 iKfPAyDk+utCO/pGxYgfc+8WPZZZoPM0vXBNlAMcxR1iEIVX7n8gdhspnrxHB7YdYRUR
 Ep7uwmLkzabdNWq14AFO3vlQIaUF3aXHUTGg9sNgCvH7ItyYtNf154DzylIPU+bUbrOS LQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kn7ep85d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 19:26:35 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4JLiiA021917; 
 Fri, 4 Nov 2022 19:26:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3khdkxqm5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 04 Nov 2022 19:26:34 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4JQXRP026085;
 Fri, 4 Nov 2022 19:26:33 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 2A4JQXJl026083;
 Fri, 04 Nov 2022 19:26:33 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id F2F385000AE; Fri,  4 Nov 2022 12:26:32 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 02/11] Hexagon (target/hexagon) Fix predicated assignment
 to .tmp and .cur
Date: Fri,  4 Nov 2022 12:26:22 -0700
Message-Id: <20221104192631.29434-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104192631.29434-1-tsimpson@quicinc.com>
References: <20221104192631.29434-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: E1myqSiud7JdlFxryak_n-bh-28Iv3oA
X-Proofpoint-GUID: E1myqSiud7JdlFxryak_n-bh-28Iv3oA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 mlxlogscore=815 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040121
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGVyZSBhcmUgZXhhbXBsZSBpbnN0cnVjdGlvbnMgd2l0aCBhIHByZWRpY2F0ZWQgLnRtcC8uY3Vy
IGFzc2lnbm1lbnQKICAgIGlmIChwMSkgdjEyLnRtcCA9IHZtZW0ocjcgKyAjMCkKICAgIGlmIChw
MCkgdjEyLmN1ciA9IHZtZW0ocjkgKyAjMCkKVGhlIC50bXAvLmN1ciBpbmRpY2F0ZXMgdGhhdCBy
ZWZlcmVuY2VzIHRvIHYxMiBpbiB0aGUgc2FtZSBwYWNrZXQKdGFrZSB0aGUgcmVzdWx0IG9mIHRo
ZSBsb2FkLiAgSG93ZXZlciwgd2hlbiB0aGUgcHJlZGljYXRlIGlzIGZhbHNlLAp0aGUgdmFsdWUg
YXQgdGhlIHN0YXJ0IG9mIHRoZSBwYWNrZXQgc2hvdWxkIGJlIHVzZWQuICBBZnRlciB0aGUgcGFj
a2V0CmNvbW1pdHMsIHRoZSAudG1wIHZhbHVlIGlzIGRyb3BwZWQsIGJ1dCB0aGUgLmN1ciB2YWx1
ZSBpcyBtYWludGFpbmVkLgoKVG8gZml4IHRoaXMgYnVnLCB3ZSBwcmVsb2FkIHRoZSBvcmlnaW5h
bCB2YWx1ZSBmcm9tIHRoZSBIVlggcmVnaXN0ZXIKaW50byB0aGUgdGVtcG9yYXJ5IHVzZWQgZm9y
IHRoZSByZXN1bHQuCgpUZXN0IGNhc2VzIGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9t
aXNjLmMKCkNvLWF1dGhvcmVkLWJ5OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVpY19t
YXRoYmVybkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF0aGV1cyBUYXZhcmVzIEJlcm5h
cmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuaCAgICAgIHwgIDYgKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jICAgIHwgNzIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNn
X2Z1bmNzLnB5IHwgMTIgKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCBiL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5oCmluZGV4IDExNWUyOWI4NGYuLmI4ZmNmNjE1ZTggMTAwNjQ0Ci0tLSBhL3Rh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5o
CkBAIC04Niw2ICs4NiwxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHJlbG9hZGVkKERpc2Fz
Q29udGV4dCAqY3R4LCBpbnQgbnVtKQogICAgIHJldHVybiB0ZXN0X2JpdChudW0sIGN0eC0+cmVn
c193cml0dGVuKTsKIH0KIAorc3RhdGljIGlubGluZSBib29sIGlzX3ZyZWdfcHJlbG9hZGVkKERp
c2FzQ29udGV4dCAqY3R4LCBpbnQgbnVtKQoreworICAgIHJldHVybiB0ZXN0X2JpdChudW0sIGN0
eC0+dnJlZ3NfdXBkYXRlZCkgfHwKKyAgICAgICAgICAgdGVzdF9iaXQobnVtLCBjdHgtPnZyZWdz
X3VwZGF0ZWRfdG1wKTsKK30KKwogaW50cHRyX3QgY3R4X2Z1dHVyZV92cmVnX29mZihEaXNhc0Nv
bnRleHQgKmN0eCwgaW50IHJlZ251bSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IG51bSwgYm9vbCBhbGxvY19vayk7CiBpbnRwdHJfdCBjdHhfdG1wX3ZyZWdfb2ZmKERpc2FzQ29u
dGV4dCAqY3R4LCBpbnQgcmVnbnVtLApkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vaHZ4
X21pc2MuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMKaW5kZXggNmUyYzlhYjNjZC4u
NTNkNWM5YjQ0ZiAxMDA2NDQKLS0tIGEvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYworKysg
Yi90ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jCkBAIC01NDEsNiArNTQxLDc1IEBAIHN0YXRp
YyB2b2lkIHRlc3RfdnNodWZmKHZvaWQpCiAgICAgY2hlY2tfb3V0cHV0X2IoX19MSU5FX18sIDEp
OwogfQogCitzdGF0aWMgdm9pZCB0ZXN0X2xvYWRfdG1wX3ByZWRpY2F0ZWQodm9pZCkKK3sKKyAg
ICB2b2lkICpwMCA9IGJ1ZmZlcjA7CisgICAgdm9pZCAqcDEgPSBidWZmZXIxOworICAgIHZvaWQg
KnBvdXQgPSBvdXRwdXQ7CisgICAgYm9vbCBwcmVkID0gdHJ1ZTsKKworICAgIGZvciAoaW50IGkg
PSAwOyBpIDwgQlVGU0laRTsgaSsrKSB7CisgICAgICAgIC8qCisgICAgICAgICAqIExvYWQgaW50
byB2MTIgYXMgLnRtcCB3aXRoIGEgcHJlZGljYXRlCisgICAgICAgICAqIFdoZW4gdGhlIHByZWRp
Y2F0ZSBpcyB0cnVlLCB3ZSBnZXQgdGhlIHZlY3RvciBmcm9tIGJ1ZmZlcjFbaV0KKyAgICAgICAg
ICogV2hlbiB0aGUgcHJlZGljYXRlIGlzIGZhbHNlLCB3ZSBnZXQgYSB2ZWN0b3Igb2YgYWxsIDEn
cworICAgICAgICAgKiBSZWdhcmRsZXNzIG9mIHRoZSBwcmVkaWNhdGUsIHRoZSBuZXh0IHBhY2tl
dCBzaG91bGQgaGF2ZQorICAgICAgICAgKiBhIHZlY3RvciBvZiBhbGwgMSdzCisgICAgICAgICAq
LworICAgICAgICBhc20oInYzID0gdm1lbSglMCArICMwKVxuXHQiCisgICAgICAgICAgICAicjEg
PSAjMVxuXHQiCisgICAgICAgICAgICAidjEyID0gdnNwbGF0KHIxKVxuXHQiCisgICAgICAgICAg
ICAicDEgPSAhY21wLmVxKCUzLCAjMClcblx0IgorICAgICAgICAgICAgIntcblx0IgorICAgICAg
ICAgICAgIiAgICBpZiAocDEpIHYxMi50bXAgPSB2bWVtKCUxICsgIzApXG5cdCIKKyAgICAgICAg
ICAgICIgICAgdjQudyA9IHZhZGQodjEyLncsIHYzLncpXG5cdCIKKyAgICAgICAgICAgICJ9XG5c
dCIKKyAgICAgICAgICAgICJ2NC53ID0gdmFkZCh2NC53LCB2MTIudylcblx0IgorICAgICAgICAg
ICAgInZtZW0oJTIgKyAjMCkgPSB2NFxuXHQiCisgICAgICAgICAgICA6IDogInIiKHAwKSwgInIi
KHAxKSwgInIiKHBvdXQpLCAiciIocHJlZCkKKyAgICAgICAgICAgIDogInIxIiwgInAxIiwgInYx
MiIsICJ2MyIsICJ2NCIsICJ2NiIsICJtZW1vcnkiKTsKKyAgICAgICAgcDAgKz0gc2l6ZW9mKE1N
VmVjdG9yKTsKKyAgICAgICAgcDEgKz0gc2l6ZW9mKE1NVmVjdG9yKTsKKyAgICAgICAgcG91dCAr
PSBzaXplb2YoTU1WZWN0b3IpOworCisgICAgICAgIGZvciAoaW50IGogPSAwOyBqIDwgTUFYX1ZF
Q19TSVpFX0JZVEVTIC8gNDsgaisrKSB7CisgICAgICAgICAgICBleHBlY3RbaV0ud1tqXSA9Cisg
ICAgICAgICAgICAgICAgcHJlZCA/IGJ1ZmZlcjBbaV0ud1tqXSArIGJ1ZmZlcjFbaV0ud1tqXSAr
IDEKKyAgICAgICAgICAgICAgICAgICAgIDogYnVmZmVyMFtpXS53W2pdICsgMjsKKyAgICAgICAg
fQorICAgICAgICBwcmVkID0gIXByZWQ7CisgICAgfQorCisgICAgY2hlY2tfb3V0cHV0X3coX19M
SU5FX18sIEJVRlNJWkUpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2xvYWRfY3VyX3ByZWRpY2F0
ZWQodm9pZCkKK3sKKyAgICBib29sIHByZWQgPSB0cnVlOworICAgIGZvciAoaW50IGkgPSAwOyBp
IDwgQlVGU0laRTsgaSsrKSB7CisgICAgICAgIGFzbSB2b2xhdGlsZSgicDAgPSAhY21wLmVxKCUz
LCAjMClcblx0IgorICAgICAgICAgICAgICAgICAgICAgInYzID0gdm1lbSglMCsjMClcblx0Igor
ICAgICAgICAgICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAgICAgICAgICAqIFByZWxvYWQg
djQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGFzc2lnbm1lbnQgZnJvbSB0aGUKKyAgICAgICAgICAg
ICAgICAgICAgICAqIHBhY2tldCBiZWxvdyBpcyBub3QgYmVpbmcgaWdub3JlZCB3aGVuIHByZWQg
aXMgZmFsc2UuCisgICAgICAgICAgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgICAgICAgICAg
ICJyMCA9ICMweDAxMjM3NjU0XG5cdCIKKyAgICAgICAgICAgICAgICAgICAgICJ2NCA9IHZzcGxh
dChyMClcblx0IgorICAgICAgICAgICAgICAgICAgICAgIntcblx0IgorICAgICAgICAgICAgICAg
ICAgICAgIiAgICBpZiAocDApIHYzLmN1ciA9IHZtZW0oJTErIzApXG5cdCIKKyAgICAgICAgICAg
ICAgICAgICAgICIgICAgdjQgPSB2M1xuXHQiCisgICAgICAgICAgICAgICAgICAgICAifVxuXHQi
CisgICAgICAgICAgICAgICAgICAgICAidm1lbSglMisjMCkgPSB2NFxuXHQiCisgICAgICAgICAg
ICAgICAgICAgICA6CisgICAgICAgICAgICAgICAgICAgICA6ICJyIigmYnVmZmVyMFtpXSksICJy
IigmYnVmZmVyMVtpXSksCisgICAgICAgICAgICAgICAgICAgICAgICJyIigmb3V0cHV0W2ldKSwg
InIiKHByZWQpCisgICAgICAgICAgICAgICAgICAgICA6ICJyMCIsICJwMCIsICJ2MyIsICJ2NCIs
ICJtZW1vcnkiKTsKKyAgICAgICAgZXhwZWN0W2ldID0gcHJlZCA/IGJ1ZmZlcjFbaV0gOiBidWZm
ZXIwW2ldOworICAgICAgICBwcmVkID0gIXByZWQ7CisgICAgfQorICAgIGNoZWNrX291dHB1dF93
KF9fTElORV9fLCBCVUZTSVpFKTsKK30KKwogaW50IG1haW4oKQogewogICAgIGluaXRfYnVmZmVy
cygpOwpAQCAtNTc4LDYgKzY0Nyw5IEBAIGludCBtYWluKCkKIAogICAgIHRlc3RfdnNodWZmKCk7
CiAKKyAgICB0ZXN0X2xvYWRfdG1wX3ByZWRpY2F0ZWQoKTsKKyAgICB0ZXN0X2xvYWRfY3VyX3By
ZWRpY2F0ZWQoKTsKKwogICAgIHB1dHMoZXJyID8gIkZBSUwiIDogIlBBU1MiKTsKICAgICByZXR1
cm4gZXJyID8gMSA6IDA7CiB9CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1
bmNzLnB5IGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQppbmRleCAwMmE2NTY1Njg1
Li5jYTVmZGU5MWNjIDEwMDc1NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5
CisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkKQEAgLTE3Myw2ICsxNzMsMTgg
QEAgZGVmIGdlbnB0cl9kZWNsKGYsIHRhZywgcmVndHlwZSwgcmVnaWQsIHJlZ25vKToKICAgICAg
ICAgICAgICAgICBmLndyaXRlKCIgICAgICAgIGN0eF9mdXR1cmVfdnJlZ19vZmYoY3R4LCAlcyVz
TiwiICUgXAogICAgICAgICAgICAgICAgICAgICAocmVndHlwZSwgcmVnaWQpKQogICAgICAgICAg
ICAgICAgIGYud3JpdGUoIiAxLCB0cnVlKTtcbiIpOworICAgICAgICAgICAgaWYgJ0FfQ09OREVY
RUMnIGluIGhleF9jb21tb24uYXR0cmliZGljdFt0YWddOgorICAgICAgICAgICAgICAgIGYud3Jp
dGUoIiAgICBpZiAoIWlzX3ZyZWdfcHJlbG9hZGVkKGN0eCwgJXMpKSB7XG4iICUgKHJlZ04pKQor
ICAgICAgICAgICAgICAgIGYud3JpdGUoIiAgICAgICAgaW50cHRyX3Qgc3JjX29mZiA9IikKKyAg
ICAgICAgICAgICAgICBmLndyaXRlKCIgb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBWUmVnc1sl
cyVzTl0pO1xuIiUgXAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChyZWd0
eXBlLCByZWdpZCkpCisgICAgICAgICAgICAgICAgZi53cml0ZSgiICAgICAgICB0Y2dfZ2VuX2d2
ZWNfbW92KE1PXzY0LCAlcyVzVl9vZmYsXG4iICUgXAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCkpCisgICAgICAgICAgICAgICAgZi53cml0ZSgi
ICAgICAgICAgICAgICAgICAgICAgICAgIHNyY19vZmYsXG4iKQorICAgICAgICAgICAgICAgIGYu
d3JpdGUoIiAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpLFxuIikKKyAg
ICAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKE1N
VmVjdG9yKSk7XG4iKQorICAgICAgICAgICAgICAgIGYud3JpdGUoIiAgICB9XG4iKQorCiAgICAg
ICAgICAgICBpZiAobm90IGhleF9jb21tb24uc2tpcF9xZW11X2hlbHBlcih0YWcpKToKICAgICAg
ICAgICAgICAgICBmLndyaXRlKCIgICAgVENHdl9wdHIgJXMlc1YgPSB0Y2dfdGVtcF9uZXdfcHRy
KCk7XG4iICUgXAogICAgICAgICAgICAgICAgICAgICAocmVndHlwZSwgcmVnaWQpKQotLSAKMi4x
Ny4xCgo=

