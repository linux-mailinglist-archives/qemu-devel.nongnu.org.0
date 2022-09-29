Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AD5EEBD5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:35:20 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odjOR-0002qD-KF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odjL4-0007IJ-Iw
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:31:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:32212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odjL1-0002j1-Jn
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:31:49 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SMXDFd029188;
 Thu, 29 Sep 2022 02:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=HxFLd67o98q74l9ijQTRbSOqeFghNHhk377Ai4GVGek=;
 b=kKxFDJnjaCK5xvJu+kW4pSDpumIR07JA0WM5jiGVzc9gKIkUGDcvEOPeI9t1t2MzPYXh
 /tVJ2wyjJZJ2JGSyqQ0wV2VpVEbkdBrvEWOjtLNfncp8LCUyWszJ7pnS9l41TjdPaBho
 nQQzPk0ANixdRmvkuytmGsOnh4AYjYGR1j4UfUTYJQyaMzRg+JAl+iBDF0bRIIbFwi44
 J8JVWEtWnzZj+dKkRxvvX7dRRKdU8S4c+upgjJsatBjrtdUTB+rVcp8gXkeX0N8N99np
 abr985J0vXuw3xwuF3VWqK6GSU4wtGI/HZBJSwlL9TeBTCEzSuSnXmkhy5vAjANF8rSf 2w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvfp3ufrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 02:31:38 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28T2Qtgh015814; 
 Thu, 29 Sep 2022 02:31:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3jvm5sjrte-1;
 Thu, 29 Sep 2022 02:31:37 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T2UD7q020489;
 Thu, 29 Sep 2022 02:31:37 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 28T2VaAq021794;
 Thu, 29 Sep 2022 02:31:37 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id BD1E35000A7; Wed, 28 Sep 2022 19:31:36 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Fix predicated assignment to .tmp
Date: Wed, 28 Sep 2022 19:31:31 -0700
Message-Id: <20220929023131.22935-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sKZJ20nauFGPHtolGKbb3I08uPtvYZiA
X-Proofpoint-GUID: sKZJ20nauFGPHtolGKbb3I08uPtvYZiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_01,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=668 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290014
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGVyZSBpcyBhbiBleGFtcGxlIG9mIGFuIGluc3RydWN0aW9uIHdpdGggYSBwcmVkaWNhdGVkIGFz
c2lnbm1lbnQKdG8gYSAudG1wIEhWWCByZWdpc3RlcgogICAgaWYgKHAxKSB2MTIudG1wID0gdm1l
bSglMSArICMwKQpOb3RlIHRoYXQgdGhlIC50bXAgaW5kaWNhdGVzIHRoYXQgcmVmZXJlbmNlcyB0
byB2MTIgaW4gdGhlIHNhbWUgcGFja2V0CnRha2UgdGhlIHJlc3VsdCBvZiB0aGUgbG9hZC4gIEhv
d2V2ZXIsIHdoZW4gdGhlIHByZWRpY2F0ZSBpcyBmYWxzZSwKdGhlIHZhbHVlIGF0IHRoZSBzdGFy
dCBvZiB0aGUgcGFja2V0IHNob3VsZCBiZSB1c2VkLgoKVG8gZml4IHRoaXMgYnVnLCB3ZSBwcmVs
b2FkIHRoZSB0ZW1wb3Jhcnkgd2l0aCB0aGUgdmFsdWUgZnJvbSB0aGUKSFZYIHJlZ2lzdGVyLgoK
VGVzdCBjYXNlIGFkZGVkIHRvIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMKClNpZ25lZC1v
ZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQv
aGV4YWdvbi90cmFuc2xhdGUuaCAgICAgIHwgIDUgKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL2h2
eF9taXNjLmMgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRhcmdl
dC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkgfCAxMiArKysrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuaCBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCmluZGV4IGEyNDUxNzI4MjcuLjEyNTY4
OTlkZmEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL3RyYW5zbGF0ZS5oCkBAIC04Myw2ICs4MywxMSBAQCBzdGF0aWMgaW5saW5lIGJv
b2wgaXNfcHJlbG9hZGVkKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgbnVtKQogICAgIHJldHVybiB0
ZXN0X2JpdChudW0sIGN0eC0+cmVnc193cml0dGVuKTsKIH0KIAorc3RhdGljIGlubGluZSBib29s
IGlzX3RtcF92cmVnX3ByZWxvYWRlZChEaXNhc0NvbnRleHQgKmN0eCwgaW50IG51bSkKK3sKKyAg
ICByZXR1cm4gdGVzdF9iaXQobnVtLCBjdHgtPnZyZWdzX3VwZGF0ZWRfdG1wKTsKK30KKwogaW50
cHRyX3QgY3R4X2Z1dHVyZV92cmVnX29mZihEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJlZ251bSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG51bSwgYm9vbCBhbGxvY19vayk7CiBp
bnRwdHJfdCBjdHhfdG1wX3ZyZWdfb2ZmKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcmVnbnVtLApk
aWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYyBiL3Rlc3RzL3RjZy9oZXhh
Z29uL2h2eF9taXNjLmMKaW5kZXggNmUyYzlhYjNjZC4uM2ViNDcwNWZiMyAxMDA2NDQKLS0tIGEv
dGVzdHMvdGNnL2hleGFnb24vaHZ4X21pc2MuYworKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9odnhf
bWlzYy5jCkBAIC01NDEsNiArNTQxLDQzIEBAIHN0YXRpYyB2b2lkIHRlc3RfdnNodWZmKHZvaWQp
CiAgICAgY2hlY2tfb3V0cHV0X2IoX19MSU5FX18sIDEpOwogfQogCitzdGF0aWMgdm9pZCB0ZXN0
X2xvYWRfdG1wX3ByZWRpY2F0ZWQodm9pZCkKK3sKKyAgICB2b2lkICpwMCA9IGJ1ZmZlcjA7Cisg
ICAgdm9pZCAqcDEgPSBidWZmZXIxOworICAgIHZvaWQgKnBvdXQgPSBvdXRwdXQ7CisKKyAgICBm
b3IgKGludCBpID0gMDsgaSA8IEJVRlNJWkU7IGkrKykgeworICAgICAgICAvKgorICAgICAgICAg
KiBMb2FkIGludG8gdjEyIGFzIC50bXAgd2l0aCBhIGZhbHNlIHByZWRpY2F0ZSwgdGhlbgorICAg
ICAgICAgKiB1c2UgaXQgaW4gdGhlIG5leHQgcGFja2V0CisgICAgICAgICAqIFNob3VsZCBnZXQg
b2xkIG5ldyB2YWx1ZSB3aXRoaW4gdGhlIHNhbWUgcGFja2V0IGFuZAorICAgICAgICAgKiB0aGUg
b2xkIHZhbHVlIGluIHRoZSBuZXh0IHBhY2tldAorICAgICAgICAgKi8KKyAgICAgICAgYXNtKCJ2
MyA9IHZtZW0oJTAgKyAjMClcblx0IgorICAgICAgICAgICAgInIxID0gIzFcblx0IgorICAgICAg
ICAgICAgInYxMiA9IHZzcGxhdChyMSlcblx0IgorICAgICAgICAgICAgInAxID0gY21wLmd0KHIw
LCByMClcblx0IgorICAgICAgICAgICAgIntcblx0IgorICAgICAgICAgICAgIiAgICBpZiAocDEp
IHYxMi50bXAgPSB2bWVtKCUxICsgIzApXG5cdCIKKyAgICAgICAgICAgICIgICAgdjQudyA9IHZh
ZGQodjEyLncsIHYzLncpXG5cdCIKKyAgICAgICAgICAgICJ9XG5cdCIKKyAgICAgICAgICAgICJ2
NC53ID0gdmFkZCh2NC53LCB2MTIudylcblx0IgorICAgICAgICAgICAgInZtZW0oJTIgKyAjMCkg
PSB2NFxuXHQiCisgICAgICAgICAgICA6IDogInIiKHAwKSwgInIiKHAxKSwgInIiKHBvdXQpCisg
ICAgICAgICAgICA6ICJyMSIsICJwMSIsICJ2MTIiLCAidjMiLCAidjQiLCAidjYiLCAibWVtb3J5
Iik7CisgICAgICAgIHAwICs9IHNpemVvZihNTVZlY3Rvcik7CisgICAgICAgIHAxICs9IHNpemVv
ZihNTVZlY3Rvcik7CisgICAgICAgIHBvdXQgKz0gc2l6ZW9mKE1NVmVjdG9yKTsKKworICAgICAg
ICBmb3IgKGludCBqID0gMDsgaiA8IE1BWF9WRUNfU0laRV9CWVRFUyAvIDQ7IGorKykgeworICAg
ICAgICAgICAgZXhwZWN0W2ldLndbal0gPSBidWZmZXIwW2ldLndbal0gKyAyOworICAgICAgICB9
CisgICAgfQorCisgICAgY2hlY2tfb3V0cHV0X3coX19MSU5FX18sIEJVRlNJWkUpOworfQorCiBp
bnQgbWFpbigpCiB7CiAgICAgaW5pdF9idWZmZXJzKCk7CkBAIC01NzgsNiArNjE1LDggQEAgaW50
IG1haW4oKQogCiAgICAgdGVzdF92c2h1ZmYoKTsKIAorICAgIHRlc3RfbG9hZF90bXBfcHJlZGlj
YXRlZCgpOworCiAgICAgcHV0cyhlcnIgPyAiRkFJTCIgOiAiUEFTUyIpOwogICAgIHJldHVybiBl
cnIgPyAxIDogMDsKIH0KZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3Mu
cHkgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5CmluZGV4IGQ3MmM2ODlhZDcuLjBl
MTNmY2JlMWYgMTAwNzU1Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkKKysr
IGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weQpAQCAtMTY5LDYgKzE2OSwxOCBAQCBk
ZWYgZ2VucHRyX2RlY2woZiwgdGFnLCByZWd0eXBlLCByZWdpZCwgcmVnbm8pOgogICAgICAgICAg
ICAgZWxpZiAoaGV4X2NvbW1vbi5pc190bXBfcmVzdWx0KHRhZykpOgogICAgICAgICAgICAgICAg
IGYud3JpdGUoIiAgICAgICAgY3R4X3RtcF92cmVnX29mZihjdHgsICVzJXNOLCAxLCB0cnVlKTtc
biIgJSBcCiAgICAgICAgICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCkpCisgICAgICAgICAg
ICAgICAgaWYgKCdBX0NPTkRFWEVDJyBpbiBoZXhfY29tbW9uLmF0dHJpYmRpY3RbdGFnXSk6Cisg
ICAgICAgICAgICAgICAgICAgIGYud3JpdGUoIiAgICBpZiAoIWlzX3RtcF92cmVnX3ByZWxvYWRl
ZChjdHgsICVzKSkge1xuIiAlIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWdOKQorICAgICAgICAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAgIGludHB0cl90IHNy
Y19vZmYgPSIpCisgICAgICAgICAgICAgICAgICAgIGYud3JpdGUoIiBvZmZzZXRvZihDUFVIZXhh
Z29uU3RhdGUsIFZSZWdzWyVzJXNOXSk7XG4iJSBcCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChyZWd0eXBlLCByZWdpZCkpCisgICAgICAgICAgICAgICAgICAgIGYu
d3JpdGUoIiAgICAgICAgdGNnX2dlbl9ndmVjX21vdihNT182NCwgJXMlc1Zfb2ZmLFxuIiAlIFwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHJlZ3R5cGUsIHJlZ2lk
KSkKKyAgICAgICAgICAgICAgICAgICAgZi53cml0ZSgiICAgICAgICAgICAgICAgICAgICAgICAg
IHNyY19vZmYsXG4iKQorICAgICAgICAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKE1NVmVjdG9yKSxcbiIpCisgICAgICAgICAgICAgICAgICAgIGYu
d3JpdGUoIiAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoTU1WZWN0b3IpKTtcbiIpCisg
ICAgICAgICAgICAgICAgICAgIGYud3JpdGUoIiAgICB9XG4iKQogICAgICAgICAgICAgZWxzZToK
ICAgICAgICAgICAgICAgICBmLndyaXRlKCIgICAgICAgIGN0eF9mdXR1cmVfdnJlZ19vZmYoY3R4
LCAlcyVzTiwiICUgXAogICAgICAgICAgICAgICAgICAgICAocmVndHlwZSwgcmVnaWQpKQotLSAK
Mi4xNy4xCgo=

