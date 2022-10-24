Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71E60BF17
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:55:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on7F5-0003S2-Mw; Mon, 24 Oct 2022 19:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7EA-0000mu-Cf
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7E4-0005DM-VX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:30 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OMlqrT031731;
 Mon, 24 Oct 2022 23:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UpJRrJgt0P6e29T4N/Rmm2GnTkiHMfUZ9BaMrxEQha8=;
 b=MweaUjeWAi6Rx6EsVFCWRwsqdzn04uIk7CSRoBDo2zclYgLlWfo1ogBIINJCwnn2sf1f
 pqETiQMZ8k1EadfB8xsHPn8yXGBcMwwjQZYVMDP3O1pyB0lc8daMYD3cNHzI+gA8jRz8
 Mrjxy3P1G4qUiIr4U+CXZc7JnwbyctL/dV2XRNDhJjoZl76fPRoVRSrqx+ZQaJjqvlQP
 xcuzzs37B3tVOWeHOH3+oH9Sa30Q/AiNH/ToVfQxQfnTJ2cQweLG9QIeHl6Xr8tW5gYk
 T0AaUwnLaWCYiPX+dddFKkXPqWzapIF1S8eVJz+k1VEmlh0EfOns6g4XLe9giCUAbaCw cA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc7utcr4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 23:51:21 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29ONmFKO003594; 
 Mon, 24 Oct 2022 23:51:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3kc9kkr1tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 24 Oct 2022 23:51:20 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ONpJRL006985;
 Mon, 24 Oct 2022 23:51:19 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 29ONpJGT006984;
 Mon, 24 Oct 2022 23:51:19 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 3F3AA5000B0; Mon, 24 Oct 2022 16:51:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 4/8] Hexagon (target/hexagon) Add overrides for direct call
 instructions
Date: Mon, 24 Oct 2022 16:51:13 -0700
Message-Id: <20221024235117.3663-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024235117.3663-1-tsimpson@quicinc.com>
References: <20221024235117.3663-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: diZ5I9sllBhF7RxiG45Oi5-nBGuQvjy3
X-Proofpoint-GUID: diZ5I9sllBhF7RxiG45Oi5-nBGuQvjy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_07,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=713 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGwKICAgIEoyX2NhbGx0CiAgICBKMl9jYWxsZgoK
U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA4ICsrKysrKwogdGFyZ2V0L2hleGFnb24vZ2Vu
cHRyLmMgIHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IGU2ZmM3ZDk3ZDIu
LmFkMTQ5YWRiZTEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTYxMiw2ICs2MTIsMTQgQEAKICAgICAgICAgdGNn
X3RlbXBfZnJlZSh0bXApOyBcCiAgICAgfSB3aGlsZSAoMCkKIAorI2RlZmluZSBmR0VOX1RDR19K
Ml9jYWxsKFNIT1JUQ09ERSkgXAorICAgIGdlbl9jYWxsKGN0eCwgcGt0LCByaVYpCisKKyNkZWZp
bmUgZkdFTl9UQ0dfSjJfY2FsbHQoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbChjdHgs
IHBrdCwgUHVWLCB0cnVlLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxmKFNIT1JUQ09E
RSkgXAorICAgIGdlbl9jb25kX2NhbGwoY3R4LCBwa3QsIFB1ViwgZmFsc2UsIHJpVikKKwogI2Rl
ZmluZSBmR0VOX1RDR19KMl9wYXVzZShTSE9SVENPREUpIFwKICAgICBkbyB7IFwKICAgICAgICAg
dWlWID0gdWlWOyBcCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3Rhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IDgwNmQwOTc0ZmYuLjI3ODRiODQwNDEgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5j
CkBAIC00NTYsNiArNDU2LDY0IEBAIHN0YXRpYyBUQ0d2IGdlbl84Yml0c29mKFRDR3YgcmVzdWx0
LCBUQ0d2IHZhbHVlKQogICAgIHJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyB2b2lkIGdlbl93
cml0ZV9uZXdfcGNfYWRkcihEaXNhc0NvbnRleHQgKmN0eCwgUGFja2V0ICpwa3QsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHdiBhZGRyLCBUQ0d2IHByZWQpCit7CisgICAg
VENHTGFiZWwgKnByZWRfZmFsc2UgPSBOVUxMOworICAgIGlmIChwcmVkICE9IE5VTEwpIHsKKyAg
ICAgICAgcHJlZF9mYWxzZSA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICAgICAgdGNnX2dlbl9icmNv
bmRpX3RsKFRDR19DT05EX0VRLCBwcmVkLCAwLCBwcmVkX2ZhbHNlKTsKKyAgICB9CisKKyAgICBp
ZiAocGt0LT5wa3RfaGFzX211bHRpX2NvZikgeworICAgICAgICAvKiBJZiB0aGVyZSBhcmUgbXVs
dGlwbGUgYnJhbmNoZXMgaW4gYSBwYWNrZXQsIGlnbm9yZSB0aGUgc2Vjb25kIG9uZSAqLworICAg
ICAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfTkUsIGhleF9ncHJbSEVYX1JFR19QQ10s
CisgICAgICAgICAgICAgICAgICAgICAgICAgICBoZXhfYnJhbmNoX3Rha2VuLCB0Y2dfY29uc3Rh
bnRfdGwoMCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICBoZXhfZ3ByW0hFWF9SRUdfUENd
LCBhZGRyKTsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9icmFuY2hfdGFrZW4sIDEpOwor
ICAgIH0gZWxzZSB7CisgICAgICAgIHRjZ19nZW5fbW92X3RsKGhleF9ncHJbSEVYX1JFR19QQ10s
IGFkZHIpOworICAgIH0KKworICAgIGlmIChwcmVkICE9IE5VTEwpIHsKKyAgICAgICAgZ2VuX3Nl
dF9sYWJlbChwcmVkX2ZhbHNlKTsKKyAgICB9Cit9CisKK3N0YXRpYyB2b2lkIGdlbl93cml0ZV9u
ZXdfcGNfcGNyZWwoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAqcGt0LAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgcGNfb2ZmLCBUQ0d2IHByZWQpCit7CisgICAgdGFy
Z2V0X3Vsb25nIGRlc3QgPSBwa3QtPnBjICsgcGNfb2ZmOworICAgIGdlbl93cml0ZV9uZXdfcGNf
YWRkcihjdHgsIHBrdCwgdGNnX2NvbnN0YW50X3RsKGRlc3QpLCBwcmVkKTsKK30KKworc3RhdGlj
IHZvaWQgZ2VuX2NhbGwoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAqcGt0LCBpbnQgcGNfb2Zm
KQoreworICAgIFRDR3YgbmV4dF9QQyA9CisgICAgICAgIHRjZ19jb25zdGFudF90bChwa3QtPnBj
ICsgcGt0LT5lbmNvZF9wa3Rfc2l6ZV9pbl9ieXRlcyk7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUo
SEVYX1JFR19MUiwgbmV4dF9QQyk7CisgICAgZ2VuX3dyaXRlX25ld19wY19wY3JlbChjdHgsIHBr
dCwgcGNfb2ZmLCBOVUxMKTsKK30KKworc3RhdGljIHZvaWQgZ2VuX2NvbmRfY2FsbChEaXNhc0Nv
bnRleHQgKmN0eCwgUGFja2V0ICpwa3QsCisgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR3Yg
cHJlZCwgYm9vbCBzZW5zZSwgaW50IHBjX29mZikKK3sKKyAgICBUQ0d2IG5leHRfUEM7CisgICAg
VENHdiBsc2IgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTsKKyAgICBUQ0dMYWJlbCAqc2tpcCA9IGdl
bl9uZXdfbGFiZWwoKTsKKyAgICB0Y2dfZ2VuX2FuZGlfdGwobHNiLCBwcmVkLCAxKTsKKyAgICBp
ZiAoIXNlbnNlKSB7CisgICAgICAgIHRjZ19nZW5feG9yaV90bChsc2IsIGxzYiwgMSk7CisgICAg
fQorICAgIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoY3R4LCBwa3QsIHBjX29mZiwgbHNiKTsKKyAg
ICB0Y2dfZ2VuX2JyY29uZGlfdGwoVENHX0NPTkRfRVEsIGxzYiwgMCwgc2tpcCk7CisgICAgdGNn
X3RlbXBfZnJlZShsc2IpOworICAgIG5leHRfUEMgPQorICAgICAgICB0Y2dfY29uc3RhbnRfdGwo
cGt0LT5wYyArIHBrdC0+ZW5jb2RfcGt0X3NpemVfaW5fYnl0ZXMpOworICAgIGdlbl9sb2dfcmVn
X3dyaXRlKEhFWF9SRUdfTFIsIG5leHRfUEMpOworICAgIGdlbl9zZXRfbGFiZWwoc2tpcCk7Cit9
CisKIHN0YXRpYyBpbnRwdHJfdCB2cmVnX3NyY19vZmYoRGlzYXNDb250ZXh0ICpjdHgsIGludCBu
dW0pCiB7CiAgICAgaW50cHRyX3Qgb2Zmc2V0ID0gb2Zmc2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBW
UmVnc1tudW1dKTsKLS0gCjIuMTcuMQoK

