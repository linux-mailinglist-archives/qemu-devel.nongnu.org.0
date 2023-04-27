Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC66F0EA7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAb9-0001jP-Q8; Thu, 27 Apr 2023 19:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb7-0001ik-QW
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001Kv-R0
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:21 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RLwk1p018657; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SX6k1llq/hz73g50QsBk3Hn/wg28S9RTrYH1+2VNrfs=;
 b=UsiJCEZE1ndGvIBN48i0ALqCohKJQepKB01Rl/FIuOg07vzdjgkkmf8wzKwdfum27P8I
 KzpLS4R2Wud9wpqepEBUrby65xAbqD4egxs2C/nYe8GEn3yN8m26Yl0Ti/bkpFhBwKvW
 d9enhp661UTrKA3ZBwtLU89zuIQBauBkQeXKhwJSl0zykiJOy4WpEW8DMofFcQlRM32V
 SG4oZTbIxj33/qp+MfQFhqqNpGxRI1hjb/N8+zQn17l+aO40ntqEIrsmg/FVKfAywxSw
 jUWybpFIxNnSe75nCRTo+oWXI3KrFfAefO+u6zoTQuv7irDFfGcdPXp/NzORrfijhmrg 4g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7thv1576-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FP6014918; 
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q7wcbsb99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FOp014906;
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33RN0EZH014895
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D16E96C3; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 12/21] Hexagon (target/hexagon) Short-circuit packet
 predicate writes
Date: Thu, 27 Apr 2023 16:00:03 -0700
Message-Id: <20230427230012.3800327-13-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0J-LybJLMEn35cIKsQHpeMUEJGFN2RIc
X-Proofpoint-ORIG-GUID: 0J-LybJLMEn35cIKsQHpeMUEJGFN2RIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=960
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SW4gY2VydGFpbiBjYXNlcywgd2UgY2FuIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiB3cml0aW5nIHRv
IGhleF9uZXdfcHJlZF92YWx1ZQphbmQgd3JpdGUgZGlyZWN0bHkgdG8gaGV4X3ByZWQuICBXZSBj
b25zaWRlciBwcmVkaWNhdGUgcmVhZHMvd3JpdGVzIHdoZW4KY29tcHV0aW5nIGN0eC0+bmVlZF9j
b21taXQuICBUaGUgZ2V0X3Jlc3VsdF9wcmVkKCkgZnVuY3Rpb24gdXNlcyB0aGlzCmZpZWxkIHRv
IGRlY2lkZSBiZXR3ZWVuIGhleF9uZXdfcHJlZF92YWx1ZSBhbmQgaGV4X3ByZWQuICBUaGVuLCB3
ZSBjYW4KZWFybHktZXhpdCBmcm9tIGdlbl9wcmVkX3dyaXRlcy4KClNpZ25lZC1vZmYtYnk6IFRh
eWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotLS0KIHRhcmdldC9oZXhh
Z29uL2dlbnB0ci5oICAgIHwgIDEgKwogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgfCAxNSAr
KysrKysrKysrKystLS0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIHwgMTQgKysrKysrKysr
KystLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuaCBiL3RhcmdldC9oZXhhZ29uL2dl
bnB0ci5oCmluZGV4IDQyMDg2N2Y5MzQuLmUxMWNjYzIzNTggMTAwNjQ0Ci0tLSBhL3RhcmdldC9o
ZXhhZ29uL2dlbnB0ci5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5oCkBAIC0zNSw2ICsz
NSw3IEBAIHZvaWQgZ2VuX3N0b3JlNGkoVENHdl9lbnYgY3B1X2VudiwgVENHdiB2YWRkciwgaW50
MzJfdCBzcmMsIHVpbnQzMl90IHNsb3QpOwogdm9pZCBnZW5fc3RvcmU4aShUQ0d2X2VudiBjcHVf
ZW52LCBUQ0d2IHZhZGRyLCBpbnQ2NF90IHNyYywgdWludDMyX3Qgc2xvdCk7CiBUQ0d2IGdlbl9y
ZWFkX3JlZyhUQ0d2IHJlc3VsdCwgaW50IG51bSk7CiBUQ0d2IGdlbl9yZWFkX3ByZWcoVENHdiBw
cmVkLCB1aW50OF90IG51bSk7CitUQ0d2IGdldF9yZXN1bHRfcHJlZChEaXNhc0NvbnRleHQgKmN0
eCwgaW50IHBudW0pOwogdm9pZCBnZW5fbG9nX3JlZ193cml0ZShEaXNhc0NvbnRleHQgKmN0eCwg
aW50IHJudW0sIFRDR3YgdmFsKTsKIHZvaWQgZ2VuX2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4
dCAqY3R4LCBpbnQgcG51bSwgVENHdiB2YWwpOwogdm9pZCBnZW5fc2V0X3Vzcl9maWVsZChEaXNh
c0NvbnRleHQgKmN0eCwgaW50IGZpZWxkLCBUQ0d2IHZhbCk7CmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IDVhMGY2YjUx
OTUuLjMzZjlkNzhhZWQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBi
L3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0xMTAsOCArMTEwLDE4IEBAIHN0YXRpYyB2b2lk
IGdlbl9sb2dfcmVnX3dyaXRlX3BhaXIoRGlzYXNDb250ZXh0ICpjdHgsIGludCBybnVtLCBUQ0d2
X2k2NCB2YWwpCiAgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBybnVtICsgMSwgdmFsMzIpOwog
fQogCitUQ0d2IGdldF9yZXN1bHRfcHJlZChEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0pCit7
CisgICAgaWYgKGN0eC0+bmVlZF9jb21taXQpIHsKKyAgICAgICAgcmV0dXJuIGhleF9uZXdfcHJl
ZF92YWx1ZVtwbnVtXTsKKyAgICB9IGVsc2UgeworICAgICAgICByZXR1cm4gaGV4X3ByZWRbcG51
bV07CisgICAgfQorfQorCiB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0
eCwgaW50IHBudW0sIFRDR3YgdmFsKQogeworICAgIFRDR3YgcHJlZCA9IGdldF9yZXN1bHRfcHJl
ZChjdHgsIHBudW0pOwogICAgIFRDR3YgYmFzZV92YWwgPSB0Y2dfdGVtcF9uZXcoKTsKIAogICAg
IHRjZ19nZW5fYW5kaV90bChiYXNlX3ZhbCwgdmFsLCAweGZmKTsKQEAgLTEyNCwxMCArMTM0LDkg
QEAgdm9pZCBnZW5fbG9nX3ByZWRfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBwbnVtLCBU
Q0d2IHZhbCkKICAgICAgKiBzdHJhaWdodCBhc3NpZ25tZW50LiAgT3RoZXJ3aXNlLCBkbyBhbiBh
bmQuCiAgICAgICovCiAgICAgaWYgKCF0ZXN0X2JpdChwbnVtLCBjdHgtPnByZWdzX3dyaXR0ZW4p
KSB7Ci0gICAgICAgIHRjZ19nZW5fbW92X3RsKGhleF9uZXdfcHJlZF92YWx1ZVtwbnVtXSwgYmFz
ZV92YWwpOworICAgICAgICB0Y2dfZ2VuX21vdl90bChwcmVkLCBiYXNlX3ZhbCk7CiAgICAgfSBl
bHNlIHsKLSAgICAgICAgdGNnX2dlbl9hbmRfdGwoaGV4X25ld19wcmVkX3ZhbHVlW3BudW1dLAot
ICAgICAgICAgICAgICAgICAgICAgICBoZXhfbmV3X3ByZWRfdmFsdWVbcG51bV0sIGJhc2VfdmFs
KTsKKyAgICAgICAgdGNnX2dlbl9hbmRfdGwocHJlZCwgcHJlZCwgYmFzZV92YWwpOwogICAgIH0K
ICAgICBpZiAoSEVYX0RFQlVHKSB7CiAgICAgICAgIHRjZ19nZW5fb3JpX3RsKGhleF9wcmVkX3dy
aXR0ZW4sIGhleF9wcmVkX3dyaXR0ZW4sIDEgPDwgcG51bSk7CmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IDVi
ZDcxYmRjYWYuLjQ1MzJiOGQwNWUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0zODYsNiArMzg2LDE0IEBA
IHN0YXRpYyBib29sIG5lZWRfY29tbWl0KERpc2FzQ29udGV4dCAqY3R4KQogICAgICAgICB9CiAg
ICAgfQogCisgICAgLyogQ2hlY2sgZm9yIG92ZXJsYXAgYmV0d2VlbiBwcmVkaWNhdGUgcmVhZHMg
YW5kIHdyaXRlcyAqLworICAgIGZvciAoaW50IGkgPSAwOyBpIDwgY3R4LT5wcmVnX2xvZ19pZHg7
IGkrKykgeworICAgICAgICBpbnQgcG51bSA9IGN0eC0+cHJlZ19sb2dbaV07CisgICAgICAgIGlm
ICh0ZXN0X2JpdChwbnVtLCBjdHgtPnByZWdzX3JlYWQpKSB7CisgICAgICAgICAgICByZXR1cm4g
dHJ1ZTsKKyAgICAgICAgfQorICAgIH0KKwogICAgIHJldHVybiBmYWxzZTsKIH0KIApAQCAtNTAz
LDcgKzUxMSw3IEBAIHN0YXRpYyB2b2lkIGdlbl9zdGFydF9wYWNrZXQoRGlzYXNDb250ZXh0ICpj
dHgpCiAgICAgICogUHJlbG9hZCB0aGUgcHJlZGljYXRlZCBwcmVkIHJlZ2lzdGVycyBpbnRvIGhl
eF9uZXdfcHJlZF92YWx1ZVtwcmVkX251bV0KICAgICAgKiBPbmx5IGVuZGxvb3AgaW5zdHJ1Y3Rp
b25zIGNvbmRpdGlvbmFsbHkgd3JpdGUgdG8gcHJlZCByZWdpc3RlcnMKICAgICAgKi8KLSAgICBp
ZiAocGt0LT5wa3RfaGFzX2VuZGxvb3ApIHsKKyAgICBpZiAoY3R4LT5uZWVkX2NvbW1pdCAmJiBw
a3QtPnBrdF9oYXNfZW5kbG9vcCkgewogICAgICAgICBmb3IgKGludCBpID0gMDsgaSA8IGN0eC0+
cHJlZ19sb2dfaWR4OyBpKyspIHsKICAgICAgICAgICAgIGludCBwcmVkX251bSA9IGN0eC0+cHJl
Z19sb2dbaV07CiAgICAgICAgICAgICB0Y2dfZ2VuX21vdl90bChoZXhfbmV3X3ByZWRfdmFsdWVb
cHJlZF9udW1dLCBoZXhfcHJlZFtwcmVkX251bV0pOwpAQCAtNjE5LDggKzYyNyw4IEBAIHN0YXRp
YyB2b2lkIGdlbl9yZWdfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4KQogCiBzdGF0aWMgdm9pZCBn
ZW5fcHJlZF93cml0ZXMoRGlzYXNDb250ZXh0ICpjdHgpCiB7Ci0gICAgLyogRWFybHkgZXhpdCBp
ZiB0aGUgbG9nIGlzIGVtcHR5ICovCi0gICAgaWYgKCFjdHgtPnByZWdfbG9nX2lkeCkgeworICAg
IC8qIEVhcmx5IGV4aXQgaWYgbm90IG5lZWRlZCBvciB0aGUgbG9nIGlzIGVtcHR5ICovCisgICAg
aWYgKCFjdHgtPm5lZWRfY29tbWl0IHx8ICFjdHgtPnByZWdfbG9nX2lkeCkgewogICAgICAgICBy
ZXR1cm47CiAgICAgfQogCi0tIAoyLjI1LjEKCg==

