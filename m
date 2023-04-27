Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45E6F0EB7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbS-0001ny-H2; Thu, 27 Apr 2023 19:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbK-0001mB-Rj
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbE-0001LB-5j
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:34 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMISnH018057; Thu, 27 Apr 2023 23:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=owSwjU7sQ+19lkHQu2LgaLDLM0ZM6e5MRvVjdg6Vb1E=;
 b=Cz4gQa7BK4tpMbLIjRcjKfBz4E0UNZ9G12c9uvzriFDm+iPdeBcLPcp1GqhMXH4XT8mU
 HAuuhLEFXSZtgPejFJMyNBnjFKfMu3TrCkSlu59/huA3fJnR/uVFfGVex8zMotMBG6Gh
 H9oyeOCHvzAKmydVkLIQ8uzEI8YB8VAzcx9Y2gD9/ONNt7iU0FVCvCDDkIMPuLjWRbeE
 +tNL4s4UOHA77YYjt6odeCU7TsV28cbgzsey7YFLztSSfVk9AYwKAgBNSnQWQ8NxBrzw
 xxyzDmxZTS6UQ2AaeK+BHd+bTmnG+cZL4fk/AFMOt+4eIykzMI+0KHyIx0NkTWd1r8f3 WQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7j4etda2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0Bum014939; 
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q48nmj7kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0EWF015007;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33RN0EqN014991
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C74906A5; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 08/21] Hexagon (target/hexagon) Clean up pred_written usage
Date: Thu, 27 Apr 2023 15:59:59 -0700
Message-Id: <20230427230012.3800327-9-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HLuqfrM9psw-3efYykgif-9kr7ka9CQf
X-Proofpoint-GUID: HLuqfrM9psw-3efYykgif-9kr7ka9CQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=497 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

T25seSBlbmRsb29wIGluc3RydWN0aW9ucyB3aWxsIGNvbmRpdGlvbmFsbHkgd3JpdGUgdG8gYSBw
cmVkaWNhdGUuCldoZW4gdGhlcmUgaXMgYW4gZW5kbG9vcCBpbnN0cnVjdGlvbiwgd2UgcHJlbG9h
ZCB0aGUgdmFsdWVzIGludG8KbmV3X3ByZWRfdmFsdWUuCgpUaGUgb25seSBwbGFjZSBwcmVkX3dy
aXR0ZW4gaXMgbmVlZGVkIGlzIHdoZW4gSEVYX0RFQlVHIGlzIG9uLgoKV2UgcmVtb3ZlIHRoZSBs
YXN0IHVzZSBvZiBjaGVja19mb3JfYXR0cmliLiAgSG93ZXZlciwgbmV3IHVzZXMgd2lsbCBiZQpp
bnRyb2R1Y2VkIGxhdGVyIGluIHRoaXMgc2VyaWVzLCBzbyB3ZSBtYXJrIGl0IHdpdGggR19HTlVD
X1VOVVNFRC4KClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTYgKysrKystLS0t
LS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyB8IDUzICsrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQ2
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggY2RlNWNmZjA2YS4uMjAxNGE4MDY4YSAxMDA2NDQK
LS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMKQEAgLTEzNyw3ICsxMzcsOSBAQCB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRl
eHQgKmN0eCwgaW50IHBudW0sIFRDR3YgdmFsKQogICAgICAgICB0Y2dfZ2VuX2FuZF90bChoZXhf
bmV3X3ByZWRfdmFsdWVbcG51bV0sCiAgICAgICAgICAgICAgICAgICAgICAgIGhleF9uZXdfcHJl
ZF92YWx1ZVtwbnVtXSwgYmFzZV92YWwpOwogICAgIH0KLSAgICB0Y2dfZ2VuX29yaV90bChoZXhf
cHJlZF93cml0dGVuLCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IHBudW0pOworICAgIGlmIChIRVhf
REVCVUcpIHsKKyAgICAgICAgdGNnX2dlbl9vcmlfdGwoaGV4X3ByZWRfd3JpdHRlbiwgaGV4X3By
ZWRfd3JpdHRlbiwgMSA8PCBwbnVtKTsKKyAgICB9CiAgICAgc2V0X2JpdChwbnVtLCBjdHgtPnBy
ZWdzX3dyaXR0ZW4pOwogfQogCkBAIC04MjYsMTUgKzgyOCwxMyBAQCBzdGF0aWMgdm9pZCBnZW5f
ZW5kbG9vcDAoRGlzYXNDb250ZXh0ICpjdHgpCiAKICAgICAvKgogICAgICAqICAgIGlmIChscGNm
ZyA9PSAxKSB7Ci0gICAgICogICAgICAgIGhleF9uZXdfcHJlZF92YWx1ZVszXSA9IDB4ZmY7Ci0g
ICAgICogICAgICAgIGhleF9wcmVkX3dyaXR0ZW4gfD0gMSA8PCAzOworICAgICAqICAgICAgICBw
MyA9IDB4ZmY7CiAgICAgICogICAgfQogICAgICAqLwogICAgIFRDR0xhYmVsICpsYWJlbDEgPSBn
ZW5fbmV3X2xhYmVsKCk7CiAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX05FLCBscGNm
ZywgMSwgbGFiZWwxKTsKICAgICB7Ci0gICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfbmV3X3By
ZWRfdmFsdWVbM10sIDB4ZmYpOwotICAgICAgICB0Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0
dGVuLCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IDMpOworICAgICAgICBnZW5fbG9nX3ByZWRfd3Jp
dGUoY3R4LCAzLCB0Y2dfY29uc3RhbnRfdGwoMHhmZikpOwogICAgIH0KICAgICBnZW5fc2V0X2xh
YmVsKGxhYmVsMSk7CiAKQEAgLTkwMywxNCArOTAzLDEyIEBAIHN0YXRpYyB2b2lkIGdlbl9lbmRs
b29wMDEoRGlzYXNDb250ZXh0ICpjdHgpCiAKICAgICAvKgogICAgICAqICAgIGlmIChscGNmZyA9
PSAxKSB7Ci0gICAgICogICAgICAgIGhleF9uZXdfcHJlZF92YWx1ZVszXSA9IDB4ZmY7Ci0gICAg
ICogICAgICAgIGhleF9wcmVkX3dyaXR0ZW4gfD0gMSA8PCAzOworICAgICAqICAgICAgICBwMyA9
IDB4ZmY7CiAgICAgICogICAgfQogICAgICAqLwogICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0df
Q09ORF9ORSwgbHBjZmcsIDEsIGxhYmVsMSk7CiAgICAgewotICAgICAgICB0Y2dfZ2VuX21vdmlf
dGwoaGV4X25ld19wcmVkX3ZhbHVlWzNdLCAweGZmKTsKLSAgICAgICAgdGNnX2dlbl9vcmlfdGwo
aGV4X3ByZWRfd3JpdHRlbiwgaGV4X3ByZWRfd3JpdHRlbiwgMSA8PCAzKTsKKyAgICAgICAgZ2Vu
X2xvZ19wcmVkX3dyaXRlKGN0eCwgMywgdGNnX2NvbnN0YW50X3RsKDB4ZmYpKTsKICAgICB9CiAg
ICAgZ2VuX3NldF9sYWJlbChsYWJlbDEpOwogCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90
cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IGMwODdmMTgzZDAu
LjZiMDA0YjYyNDggMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCisrKyBi
L3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0yMzksNyArMjM5LDcgQEAgc3RhdGljIGlu
dCByZWFkX3BhY2tldF93b3JkcyhDUFVIZXhhZ29uU3RhdGUgKmVudiwgRGlzYXNDb250ZXh0ICpj
dHgsCiAgICAgcmV0dXJuIG53b3JkczsKIH0KIAotc3RhdGljIGJvb2wgY2hlY2tfZm9yX2F0dHJp
YihQYWNrZXQgKnBrdCwgaW50IGF0dHJpYikKK3N0YXRpYyBHX0dOVUNfVU5VU0VEIGJvb2wgY2hl
Y2tfZm9yX2F0dHJpYihQYWNrZXQgKnBrdCwgaW50IGF0dHJpYikKIHsKICAgICBmb3IgKGludCBp
ID0gMDsgaSA8IHBrdC0+bnVtX2luc25zOyBpKyspIHsKICAgICAgICAgaWYgKEdFVF9BVFRSSUIo
cGt0LT5pbnNuW2ldLm9wY29kZSwgYXR0cmliKSkgewpAQCAtMjYyLDExICsyNjIsNiBAQCBzdGF0
aWMgYm9vbCBuZWVkX3Nsb3RfY2FuY2VsbGVkKFBhY2tldCAqcGt0KQogICAgIHJldHVybiBmYWxz
ZTsKIH0KIAotc3RhdGljIGJvb2wgbmVlZF9wcmVkX3dyaXR0ZW4oUGFja2V0ICpwa3QpCi17Ci0g
ICAgcmV0dXJuIGNoZWNrX2Zvcl9hdHRyaWIocGt0LCBBX1dSSVRFU19QUkVEX1JFRyk7Ci19Ci0K
IHN0YXRpYyBib29sIG5lZWRfbmV4dF9QQyhEaXNhc0NvbnRleHQgKmN0eCkKIHsKICAgICBQYWNr
ZXQgKnBrdCA9IGN0eC0+cGt0OwpAQCAtNDE0LDcgKzQwOSw3IEBAIHN0YXRpYyB2b2lkIGdlbl9z
dGFydF9wYWNrZXQoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgICAgICAgICB0Y2dfZ2VuX21vdmlf
dGwoaGV4X2dwcltIRVhfUkVHX1BDXSwgbmV4dF9QQyk7CiAgICAgICAgIH0KICAgICB9Ci0gICAg
aWYgKG5lZWRfcHJlZF93cml0dGVuKHBrdCkpIHsKKyAgICBpZiAoSEVYX0RFQlVHKSB7CiAgICAg
ICAgIHRjZ19nZW5fbW92aV90bChoZXhfcHJlZF93cml0dGVuLCAwKTsKICAgICB9CiAKQEAgLTQy
OCw2ICs0MjMsMTcgQEAgc3RhdGljIHZvaWQgZ2VuX3N0YXJ0X3BhY2tldChEaXNhc0NvbnRleHQg
KmN0eCkKICAgICAgICAgfQogICAgIH0KIAorICAgIC8qCisgICAgICogUHJlbG9hZCB0aGUgcHJl
ZGljYXRlZCBwcmVkIHJlZ2lzdGVycyBpbnRvIGhleF9uZXdfcHJlZF92YWx1ZVtwcmVkX251bV0K
KyAgICAgKiBPbmx5IGVuZGxvb3AgaW5zdHJ1Y3Rpb25zIGNvbmRpdGlvbmFsbHkgd3JpdGUgdG8g
cHJlZCByZWdpc3RlcnMKKyAgICAgKi8KKyAgICBpZiAocGt0LT5wa3RfaGFzX2VuZGxvb3ApIHsK
KyAgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsgaSsrKSB7Cisg
ICAgICAgICAgICBpbnQgcHJlZF9udW0gPSBjdHgtPnByZWdfbG9nW2ldOworICAgICAgICAgICAg
dGNnX2dlbl9tb3ZfdGwoaGV4X25ld19wcmVkX3ZhbHVlW3ByZWRfbnVtXSwgaGV4X3ByZWRbcHJl
ZF9udW1dKTsKKyAgICAgICAgfQorICAgIH0KKwogICAgIC8qIFByZWxvYWQgdGhlIHByZWRpY2F0
ZWQgSFZYIHJlZ2lzdGVycyBpbnRvIGZ1dHVyZV9WUmVncyBhbmQgdG1wX1ZSZWdzICovCiAgICAg
aWYgKCFiaXRtYXBfZW1wdHkoY3R4LT5wcmVkaWNhdGVkX2Z1dHVyZV92cmVncywgTlVNX1ZSRUdT
KSkgewogICAgICAgICBpbnQgaSA9IGZpbmRfZmlyc3RfYml0KGN0eC0+cHJlZGljYXRlZF9mdXR1
cmVfdnJlZ3MsIE5VTV9WUkVHUyk7CkBAIC01MzIsNDEgKzUzOCwxNCBAQCBzdGF0aWMgdm9pZCBn
ZW5fcmVnX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCkKIAogc3RhdGljIHZvaWQgZ2VuX3ByZWRf
d3JpdGVzKERpc2FzQ29udGV4dCAqY3R4KQogewotICAgIGludCBpOwotCiAgICAgLyogRWFybHkg
ZXhpdCBpZiB0aGUgbG9nIGlzIGVtcHR5ICovCiAgICAgaWYgKCFjdHgtPnByZWdfbG9nX2lkeCkg
ewogICAgICAgICByZXR1cm47CiAgICAgfQogCi0gICAgLyoKLSAgICAgKiBPbmx5IGVuZGxvb3Ag
aW5zdHJ1Y3Rpb25zIHdpbGwgY29uZGl0aW9uYWxseQotICAgICAqIHdyaXRlIGEgcHJlZGljYXRl
LiAgSWYgdGhlcmUgYXJlIG5vIGVuZGxvb3AKLSAgICAgKiBpbnN0cnVjdGlvbnMsIHdlIGNhbiB1
c2UgdGhlIG5vbi1jb25kaXRpb25hbAotICAgICAqIHdyaXRlIG9mIHRoZSBwcmVkaWNhdGVzLgot
ICAgICAqLwotICAgIGlmIChjdHgtPnBrdC0+cGt0X2hhc19lbmRsb29wKSB7Ci0gICAgICAgIFRD
R3YgemVybyA9IHRjZ19jb25zdGFudF90bCgwKTsKLSAgICAgICAgVENHdiBwcmVkX3dyaXR0ZW4g
PSB0Y2dfdGVtcF9uZXcoKTsKLSAgICAgICAgZm9yIChpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2df
aWR4OyBpKyspIHsKLSAgICAgICAgICAgIGludCBwcmVkX251bSA9IGN0eC0+cHJlZ19sb2dbaV07
Ci0KLSAgICAgICAgICAgIHRjZ19nZW5fYW5kaV90bChwcmVkX3dyaXR0ZW4sIGhleF9wcmVkX3dy
aXR0ZW4sIDEgPDwgcHJlZF9udW0pOwotICAgICAgICAgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRD
R19DT05EX05FLCBoZXhfcHJlZFtwcmVkX251bV0sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHJlZF93cml0dGVuLCB6ZXJvLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGhleF9uZXdfcHJlZF92YWx1ZVtwcmVkX251bV0sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaGV4X3ByZWRbcHJlZF9udW1dKTsKLSAgICAgICAgfQotICAgIH0gZWxzZSB7Ci0gICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsgaSsrKSB7Ci0gICAgICAgICAg
ICBpbnQgcHJlZF9udW0gPSBjdHgtPnByZWdfbG9nW2ldOwotICAgICAgICAgICAgdGNnX2dlbl9t
b3ZfdGwoaGV4X3ByZWRbcHJlZF9udW1dLCBoZXhfbmV3X3ByZWRfdmFsdWVbcHJlZF9udW1dKTsK
LSAgICAgICAgICAgIGlmIChIRVhfREVCVUcpIHsKLSAgICAgICAgICAgICAgICAvKiBEbyB0aGlz
IHNvIEhFTFBFUihkZWJ1Z19jb21taXRfZW5kKSB3aWxsIGtub3cgKi8KLSAgICAgICAgICAgICAg
ICB0Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0dGVuLCBoZXhfcHJlZF93cml0dGVuLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEgPDwgcHJlZF9udW0pOwotICAgICAgICAgICAg
fQotICAgICAgICB9CisgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBjdHgtPnByZWdfbG9nX2lkeDsg
aSsrKSB7CisgICAgICAgIGludCBwcmVkX251bSA9IGN0eC0+cHJlZ19sb2dbaV07CisgICAgICAg
IHRjZ19nZW5fbW92X3RsKGhleF9wcmVkW3ByZWRfbnVtXSwgaGV4X25ld19wcmVkX3ZhbHVlW3By
ZWRfbnVtXSk7CiAgICAgfQogfQogCi0tIAoyLjI1LjEKCg==

