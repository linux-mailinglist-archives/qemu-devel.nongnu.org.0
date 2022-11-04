Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238961A0F8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2Kx-0001XJ-E8; Fri, 04 Nov 2022 15:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Ku-0001Ww-LF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Ks-0002Li-TX
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:40 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A4IS04m029694; Fri, 4 Nov 2022 19:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nE+3tcRCVj2bdTh3YU2vIb7GfIjbECec59TuZx6DPPU=;
 b=PHJa27R931w2SnVfqtSesOepzVBkrGbzakPqeXJIp8qwZoofXBSWVrDCAxczCVHGzq5o
 ZdQyXiiQiEfbsFwSTpaWRzDZaRtRul/2sezglSdQxMAw51lR/lQq2pHWCeH1JrGyKd9l
 E0YKv//qCSLot7fu2tkfbOiHlOWvVDXD7ol9H8pQpgJmpred63SOi/drLtvwi+ZZqiDB
 4DZZ5+gDpoHQBtwD2UOda33p1CminBUNRGK79QrLvBUouDpYAMnOuShPCfgYF3kWvkv0
 5ZH/U7k9vAmdN3COqnYxR6Zn1LZeDT8Y3GqCiZmS/hOA9mBWGRNuxOJUuTvL/3plcsQv lw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kn6je0a8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 19:26:35 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4JQYww012330; 
 Fri, 4 Nov 2022 19:26:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3khdpmqm6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 04 Nov 2022 19:26:34 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4JNPeE010086;
 Fri, 4 Nov 2022 19:26:34 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 2A4JQXoi012320;
 Fri, 04 Nov 2022 19:26:34 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0C6A5500102; Fri,  4 Nov 2022 12:26:33 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 07/11] Hexagon (target/hexagon) Add overrides for direct
 call instructions
Date: Fri,  4 Nov 2022 12:26:27 -0700
Message-Id: <20221104192631.29434-8-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Dk5ifpWIPqQRWu3Rp_BxKmIfIivke3la
X-Proofpoint-GUID: Dk5ifpWIPqQRWu3Rp_BxKmIfIivke3la
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=720 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040121
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
cHRyLmMgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IGRmMjc5YWI0M2Iu
LmZlMGE1ZTljMTMgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTYxMiw2ICs2MTIsMTQgQEAKICAgICAgICAgdGNn
X3RlbXBfZnJlZSh0bXApOyBcCiAgICAgfSB3aGlsZSAoMCkKIAorI2RlZmluZSBmR0VOX1RDR19K
Ml9jYWxsKFNIT1JUQ09ERSkgXAorICAgIGdlbl9jYWxsKGN0eCwgcmlWKQorCisjZGVmaW5lIGZH
RU5fVENHX0oyX2NhbGx0KFNIT1JUQ09ERSkgXAorICAgIGdlbl9jb25kX2NhbGwoY3R4LCBQdVYs
IHRydWUsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbGYoU0hPUlRDT0RFKSBcCisgICAg
Z2VuX2NvbmRfY2FsbChjdHgsIFB1ViwgZmFsc2UsIHJpVikKKwogI2RlZmluZSBmR0VOX1RDR19K
Ml9wYXVzZShTSE9SVENPREUpIFwKICAgICBkbyB7IFwKICAgICAgICAgdWlWID0gdWlWOyBcCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCmluZGV4IGMxNDI2M2FlOTUuLjg4ZTY4OTgwMjcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC00NTYsNiArNDU2
LDM1IEBAIHN0YXRpYyBUQ0d2IGdlbl84Yml0c29mKFRDR3YgcmVzdWx0LCBUQ0d2IHZhbHVlKQog
ICAgIHJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyB2b2lkIGdlbl93cml0ZV9uZXdfcGNfYWRk
cihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBhZGRyLCBUQ0d2IHByZWQpCit7CisgICAgVENHTGFi
ZWwgKnByZWRfZmFsc2UgPSBOVUxMOworICAgIGlmIChwcmVkICE9IE5VTEwpIHsKKyAgICAgICAg
cHJlZF9mYWxzZSA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICAgICAgdGNnX2dlbl9icmNvbmRpX3Rs
KFRDR19DT05EX0VRLCBwcmVkLCAwLCBwcmVkX2ZhbHNlKTsKKyAgICB9CisKKyAgICBpZiAoY3R4
LT5wa3QtPnBrdF9oYXNfbXVsdGlfY29mKSB7CisgICAgICAgIC8qIElmIHRoZXJlIGFyZSBtdWx0
aXBsZSBicmFuY2hlcyBpbiBhIHBhY2tldCwgaWdub3JlIHRoZSBzZWNvbmQgb25lICovCisgICAg
ICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9ORSwgaGV4X2dwcltIRVhfUkVHX1BDXSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIGhleF9icmFuY2hfdGFrZW4sIHRjZ19jb25zdGFu
dF90bCgwKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGhleF9ncHJbSEVYX1JFR19QQ10s
IGFkZHIpOworICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoaGV4X2JyYW5jaF90YWtlbiwgMSk7Cisg
ICAgfSBlbHNlIHsKKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X2dwcltIRVhfUkVHX1BDXSwg
YWRkcik7CisgICAgfQorCisgICAgaWYgKHByZWQgIT0gTlVMTCkgeworICAgICAgICBnZW5fc2V0
X2xhYmVsKHByZWRfZmFsc2UpOworICAgIH0KK30KKworc3RhdGljIHZvaWQgZ2VuX3dyaXRlX25l
d19wY19wY3JlbChEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBjX29mZiwgVENHdiBwcmVkKQorewor
ICAgIHRhcmdldF91bG9uZyBkZXN0ID0gY3R4LT5wa3QtPnBjICsgcGNfb2ZmOworICAgIGdlbl93
cml0ZV9uZXdfcGNfYWRkcihjdHgsIHRjZ19jb25zdGFudF90bChkZXN0KSwgcHJlZCk7Cit9CisK
IHN0YXRpYyB2b2lkIGdlbl9zZXRfdXNyX2ZpZWxkKGludCBmaWVsZCwgVENHdiB2YWwpCiB7CiAg
ICAgdGNnX2dlbl9kZXBvc2l0X3RsKGhleF9uZXdfdmFsdWVbSEVYX1JFR19VU1JdLCBoZXhfbmV3
X3ZhbHVlW0hFWF9SRUdfVVNSXSwKQEAgLTQ3MCw2ICs0OTksMzIgQEAgc3RhdGljIHZvaWQgZ2Vu
X3NldF91c3JfZmllbGRpKGludCBmaWVsZCwgaW50IHgpCiAgICAgZ2VuX3NldF91c3JfZmllbGQo
ZmllbGQsIHZhbCk7CiB9CiAKK3N0YXRpYyB2b2lkIGdlbl9jYWxsKERpc2FzQ29udGV4dCAqY3R4
LCBpbnQgcGNfb2ZmKQoreworICAgIFRDR3YgbmV4dF9QQyA9CisgICAgICAgIHRjZ19jb25zdGFu
dF90bChjdHgtPnBrdC0+cGMgKyBjdHgtPnBrdC0+ZW5jb2RfcGt0X3NpemVfaW5fYnl0ZXMpOwor
ICAgIGdlbl9sb2dfcmVnX3dyaXRlKEhFWF9SRUdfTFIsIG5leHRfUEMpOworICAgIGdlbl93cml0
ZV9uZXdfcGNfcGNyZWwoY3R4LCBwY19vZmYsIE5VTEwpOworfQorCitzdGF0aWMgdm9pZCBnZW5f
Y29uZF9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IHByZWQsIGJvb2wgc2Vuc2UsIGludCBw
Y19vZmYpCit7CisgICAgVENHdiBuZXh0X1BDOworICAgIFRDR3YgbHNiID0gdGNnX3RlbXBfbG9j
YWxfbmV3KCk7CisgICAgVENHTGFiZWwgKnNraXAgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgdGNn
X2dlbl9hbmRpX3RsKGxzYiwgcHJlZCwgMSk7CisgICAgaWYgKCFzZW5zZSkgeworICAgICAgICB0
Y2dfZ2VuX3hvcmlfdGwobHNiLCBsc2IsIDEpOworICAgIH0KKyAgICBnZW5fd3JpdGVfbmV3X3Bj
X3BjcmVsKGN0eCwgcGNfb2ZmLCBsc2IpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09O
RF9FUSwgbHNiLCAwLCBza2lwKTsKKyAgICB0Y2dfdGVtcF9mcmVlKGxzYik7CisgICAgbmV4dF9Q
QyA9CisgICAgICAgIHRjZ19jb25zdGFudF90bChjdHgtPnBrdC0+cGMgKyBjdHgtPnBrdC0+ZW5j
b2RfcGt0X3NpemVfaW5fYnl0ZXMpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKEhFWF9SRUdfTFIs
IG5leHRfUEMpOworICAgIGdlbl9zZXRfbGFiZWwoc2tpcCk7Cit9CisKIHN0YXRpYyB2b2lkIGdl
bl9zYXRfaTY0KFRDR3ZfaTY0IGRzdCwgVENHdl9pNjQgc3JjLCB1aW50MzJfdCBiaXRzKQogewog
ICAgIFRDR0xhYmVsICpsYWJlbCA9IGdlbl9uZXdfbGFiZWwoKTsKLS0gCjIuMTcuMQoK

