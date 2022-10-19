Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39AF605356
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 00:46:27 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olHpS-0005ZS-TM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 18:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHhH-0002HG-NT
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:37:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHh8-00029m-Qc
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:37:59 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JM4BWE013719;
 Wed, 19 Oct 2022 22:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xW+A+3m+1APH6vwEWz7CXLnU68XQG4Yabg1bWghn+h0=;
 b=eSvabjm/Bp6ymq+lom1ftq+UloPnSH8GiMmXst52aP+yfH2Zci9TOwraaHgq4C+WeKpV
 PxmczshQu/fCBdG4pFLcv+b/sJFMvbdYAO8hjGogEKBo5N5yo1j+wTNKKL94JDGoZqxi
 r+YLDDSTpMB4tItIirO/4qdtC4VMM7RzkBKuuOz7ee5cl/oX/0DlkrRfarOXLghUxpeq
 vDPxu3uo83APjN6hkSz+sT6DSR4/3uncvZPSkGgPVdzKjO8Bx6n9ddjOMTwpCLjwLTbS
 7jnkMVXbaFMmEfKYF61rRHo+D+q1sA+twNy0dgyYVFVRUnCJb/w/niCY/Afro5dWMTHR tA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kaknjh9mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 22:37:43 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29JMbg7X004636; 
 Wed, 19 Oct 2022 22:37:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3k7nxkwacg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 19 Oct 2022 22:37:42 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JMbg15004620;
 Wed, 19 Oct 2022 22:37:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 29JMbf1h004617;
 Wed, 19 Oct 2022 22:37:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id BBB5F5000B0; Wed, 19 Oct 2022 15:37:41 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 4/8] Hexagon (target/hexagon) Add overrides for direct call
 instructions
Date: Wed, 19 Oct 2022 15:37:35 -0700
Message-Id: <20221019223739.3868-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019223739.3868-1-tsimpson@quicinc.com>
References: <20221019223739.3868-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SPD7S9koZguBgNTdUeV1dh6lVF0bilRW
X-Proofpoint-ORIG-GUID: SPD7S9koZguBgNTdUeV1dh6lVF0bilRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=740
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190125
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGwKICAgIEoyX2NhbGx0CiAgICBKMl9jYWxsZgoK
U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA4ICsrKysrKwogdGFyZ2V0L2hleGFnb24vZ2Vu
cHRyLmMgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
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
dC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IDgwNmQwOTc0ZmYuLjRiNDNiM2Y1YzggMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5j
CkBAIC00NTYsNiArNDU2LDY1IEBAIHN0YXRpYyBUQ0d2IGdlbl84Yml0c29mKFRDR3YgcmVzdWx0
LCBUQ0d2IHZhbHVlKQogICAgIHJldHVybiByZXN1bHQ7CiB9CiAKK3N0YXRpYyB2b2lkIGdlbl93
cml0ZV9uZXdfcGNfcGNyZWwoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tldCAqcGt0LAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcGNfb2ZmLCBUQ0d2IHByZWQpCit7Cisg
ICAgdGFyZ2V0X3Vsb25nIGRlc3QgPSBwa3QtPnBjICsgcGNfb2ZmOworICAgIGlmIChwa3QtPnBr
dF9oYXNfbXVsdGlfY29mKSB7CisgICAgICAgIFRDR0xhYmVsICpwcmVkX2ZhbHNlID0gTlVMTDsK
KyAgICAgICAgaWYgKHByZWQgIT0gTlVMTCkgeworICAgICAgICAgICAgcHJlZF9mYWxzZSA9IGdl
bl9uZXdfbGFiZWwoKTsKKyAgICAgICAgICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9F
USwgcHJlZCwgMCwgcHJlZF9mYWxzZSk7CisgICAgICAgIH0KKyAgICAgICAgLyogSWYgdGhlcmUg
YXJlIG11bHRpcGxlIGJyYW5jaGVzIGluIGEgcGFja2V0LCBpZ25vcmUgdGhlIHNlY29uZCBvbmUg
Ki8KKyAgICAgICAgVENHTGFiZWwgKnNraXAgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgICAgIHRj
Z19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9ORSwgaGV4X2JyYW5jaF90YWtlbiwgMCwgc2tpcCk7
CisgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsKKyAg
ICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9icmFuY2hfdGFrZW4sIDEpOworICAgICAgICBnZW5f
c2V0X2xhYmVsKHNraXApOworICAgICAgICBpZiAocHJlZCAhPSBOVUxMKSB7CisgICAgICAgICAg
ICBnZW5fc2V0X2xhYmVsKHByZWRfZmFsc2UpOworICAgICAgICB9CisgICAgfSBlbHNlIHsKKyAg
ICAgICAgVENHTGFiZWwgKnByZWRfZmFsc2UgPSBOVUxMOworICAgICAgICBpZiAocHJlZCAhPSBO
VUxMKSB7CisgICAgICAgICAgICBwcmVkX2ZhbHNlID0gZ2VuX25ld19sYWJlbCgpOworICAgICAg
ICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX0VRLCBwcmVkLCAwLCBwcmVkX2ZhbHNl
KTsKKyAgICAgICAgfQorICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoaGV4X2dwcltIRVhfUkVHX1BD
XSwgZGVzdCk7CisgICAgICAgIGlmIChwcmVkICE9IE5VTEwpIHsKKyAgICAgICAgICAgIGdlbl9z
ZXRfbGFiZWwocHJlZF9mYWxzZSk7CisgICAgICAgIH0KKyAgICB9Cit9CisKK3N0YXRpYyB2b2lk
IGdlbl9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBQYWNrZXQgKnBrdCwgaW50IHBjX29mZikKK3sK
KyAgICBUQ0d2IG5leHRfUEMgPQorICAgICAgICB0Y2dfY29uc3RhbnRfdGwocGt0LT5wYyArIHBr
dC0+ZW5jb2RfcGt0X3NpemVfaW5fYnl0ZXMpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKEhFWF9S
RUdfTFIsIG5leHRfUEMpOworICAgIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoY3R4LCBwa3QsIHBj
X29mZiwgTlVMTCk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9jb25kX2NhbGwoRGlzYXNDb250ZXh0
ICpjdHgsIFBhY2tldCAqcGt0LAorICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0d2IHByZWQs
IGJvb2wgc2Vuc2UsIGludCBwY19vZmYpCit7CisgICAgVENHdiBuZXh0X1BDOworICAgIFRDR3Yg
bHNiID0gdGNnX3RlbXBfbG9jYWxfbmV3KCk7CisgICAgVENHTGFiZWwgKnNraXAgPSBnZW5fbmV3
X2xhYmVsKCk7CisgICAgdGNnX2dlbl9hbmRpX3RsKGxzYiwgcHJlZCwgMSk7CisgICAgaWYgKCFz
ZW5zZSkgeworICAgICAgICB0Y2dfZ2VuX3hvcmlfdGwobHNiLCBsc2IsIDEpOworICAgIH0KKyAg
ICBnZW5fd3JpdGVfbmV3X3BjX3BjcmVsKGN0eCwgcGt0LCBwY19vZmYsIGxzYik7CisgICAgdGNn
X2dlbl9icmNvbmRpX3RsKFRDR19DT05EX0VRLCBsc2IsIDAsIHNraXApOworICAgIHRjZ190ZW1w
X2ZyZWUobHNiKTsKKyAgICBuZXh0X1BDID0KKyAgICAgICAgdGNnX2NvbnN0YW50X3RsKHBrdC0+
cGMgKyBwa3QtPmVuY29kX3BrdF9zaXplX2luX2J5dGVzKTsKKyAgICBnZW5fbG9nX3JlZ193cml0
ZShIRVhfUkVHX0xSLCBuZXh0X1BDKTsKKyAgICBnZW5fc2V0X2xhYmVsKHNraXApOworfQorCiBz
dGF0aWMgaW50cHRyX3QgdnJlZ19zcmNfb2ZmKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgbnVtKQog
ewogICAgIGludHB0cl90IG9mZnNldCA9IG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgVlJlZ3Nb
bnVtXSk7Ci0tIAoyLjE3LjEKCg==

