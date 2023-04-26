Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4F6EEB96
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFp-0000cU-MY; Tue, 25 Apr 2023 20:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFm-0000OU-GL
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTF9-0006PZ-Cg
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0elkc016628; Wed, 26 Apr 2023 00:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/nfPv/TvobWq4Kqpip6qMM0TTe91TZpql8EgzSt29zQ=;
 b=aDJAfPflk7ZQ7pAj8Py+QLziiYHRuVvzBl0/9h6cDEx3/6fIdaWF6KjoDbsrgPUncXLD
 b0BqlOTr9gZoNJcPxB1F8oYjtN98Ua3QDyNwJyiQnooUFCJxStytoBmm4aEUBY1A0rkZ
 a6J+ir+sL1AVLvO2P+x7MrFYd/1pYR5VxTRtupNm9TrtsXfuOfuayS3oXWeATZ22B8l+
 S3W+fV0JARJs6DczStx3chBfBCCxDQ/VmYJMdnQbWzpDbDgoravToqKkmK1zkyQmt5V5
 C1y01lnKkmXqfwgheGfsuQ8f7KOGJ2V3dR6hnZMn/QQr0EZdmIhYQxxguodS3tcN9uW2 IA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5qv6vtgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:37 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gaC3017535; 
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q48nm4ycw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gaut017524;
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33Q0gZNs017522
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A0E73666; Tue, 25 Apr 2023 17:42:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 12/21] Hexagon (target/hexagon) Short-circuit packet predicate
 writes
Date: Tue, 25 Apr 2023 17:42:27 -0700
Message-Id: <20230426004234.1319401-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426004234.1319401-1-tsimpson@quicinc.com>
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: r3zK3_bMi0BfsZCXK3XQx8o0_m79-k2c
X-Proofpoint-ORIG-GUID: r3zK3_bMi0BfsZCXK3XQx8o0_m79-k2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=954
 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
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
eWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuaCAgICB8ICAxICsKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTUgKysrKysr
KysrKysrLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyB8IDE0ICsrKysrKysrKysrLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmggYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIu
aAppbmRleCA0MjA4NjdmOTM0Li5lMTFjY2MyMzU4IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdv
bi9nZW5wdHIuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuaApAQCAtMzUsNiArMzUsNyBA
QCB2b2lkIGdlbl9zdG9yZTRpKFRDR3ZfZW52IGNwdV9lbnYsIFRDR3YgdmFkZHIsIGludDMyX3Qg
c3JjLCB1aW50MzJfdCBzbG90KTsKIHZvaWQgZ2VuX3N0b3JlOGkoVENHdl9lbnYgY3B1X2Vudiwg
VENHdiB2YWRkciwgaW50NjRfdCBzcmMsIHVpbnQzMl90IHNsb3QpOwogVENHdiBnZW5fcmVhZF9y
ZWcoVENHdiByZXN1bHQsIGludCBudW0pOwogVENHdiBnZW5fcmVhZF9wcmVnKFRDR3YgcHJlZCwg
dWludDhfdCBudW0pOworVENHdiBnZXRfcmVzdWx0X3ByZWQoRGlzYXNDb250ZXh0ICpjdHgsIGlu
dCBwbnVtKTsKIHZvaWQgZ2VuX2xvZ19yZWdfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBy
bnVtLCBUQ0d2IHZhbCk7CiB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0
eCwgaW50IHBudW0sIFRDR3YgdmFsKTsKIHZvaWQgZ2VuX3NldF91c3JfZmllbGQoRGlzYXNDb250
ZXh0ICpjdHgsIGludCBmaWVsZCwgVENHdiB2YWwpOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCA5NDMxYmVlYmMzLi5k
YTY4ZDE5ZWQzIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtMTEwLDggKzExMCwxOCBAQCBzdGF0aWMgdm9pZCBnZW5f
bG9nX3JlZ193cml0ZV9wYWlyKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcm51bSwgVENHdl9pNjQg
dmFsKQogICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgcm51bSArIDEsIHZhbDMyKTsKIH0KIAor
VENHdiBnZXRfcmVzdWx0X3ByZWQoRGlzYXNDb250ZXh0ICpjdHgsIGludCBwbnVtKQoreworICAg
IGlmIChjdHgtPm5lZWRfY29tbWl0KSB7CisgICAgICAgIHJldHVybiBoZXhfbmV3X3ByZWRfdmFs
dWVbcG51bV07CisgICAgfSBlbHNlIHsKKyAgICAgICAgcmV0dXJuIGhleF9wcmVkW3BudW1dOwor
ICAgIH0KK30KKwogdm9pZCBnZW5fbG9nX3ByZWRfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGlu
dCBwbnVtLCBUQ0d2IHZhbCkKIHsKKyAgICBUQ0d2IHByZWQgPSBnZXRfcmVzdWx0X3ByZWQoY3R4
LCBwbnVtKTsKICAgICBUQ0d2IGJhc2VfdmFsID0gdGNnX3RlbXBfbmV3KCk7CiAKICAgICB0Y2df
Z2VuX2FuZGlfdGwoYmFzZV92YWwsIHZhbCwgMHhmZik7CkBAIC0xMjQsMTAgKzEzNCw5IEBAIHZv
aWQgZ2VuX2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcG51bSwgVENHdiB2
YWwpCiAgICAgICogc3RyYWlnaHQgYXNzaWdubWVudC4gIE90aGVyd2lzZSwgZG8gYW4gYW5kLgog
ICAgICAqLwogICAgIGlmICghdGVzdF9iaXQocG51bSwgY3R4LT5wcmVnc193cml0dGVuKSkgewot
ICAgICAgICB0Y2dfZ2VuX21vdl90bChoZXhfbmV3X3ByZWRfdmFsdWVbcG51bV0sIGJhc2VfdmFs
KTsKKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwocHJlZCwgYmFzZV92YWwpOwogICAgIH0gZWxzZSB7
Ci0gICAgICAgIHRjZ19nZW5fYW5kX3RsKGhleF9uZXdfcHJlZF92YWx1ZVtwbnVtXSwKLSAgICAg
ICAgICAgICAgICAgICAgICAgaGV4X25ld19wcmVkX3ZhbHVlW3BudW1dLCBiYXNlX3ZhbCk7Cisg
ICAgICAgIHRjZ19nZW5fYW5kX3RsKHByZWQsIHByZWQsIGJhc2VfdmFsKTsKICAgICB9CiAgICAg
aWYgKEhFWF9ERUJVRykgewogICAgICAgICB0Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0dGVu
LCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IHBudW0pOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCBhODdmN2U3
MTMwLi4wN2VkMzZmNmE4IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwor
KysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwpAQCAtMzg2LDYgKzM4NiwxNCBAQCBzdGF0
aWMgYm9vbCBuZWVkX2NvbW1pdChEaXNhc0NvbnRleHQgKmN0eCkKICAgICAgICAgfQogICAgIH0K
IAorICAgIC8qIENoZWNrIGZvciBvdmVybGFwIGJldHdlZW4gcHJlZGljYXRlIHJlYWRzIGFuZCB3
cml0ZXMgKi8KKyAgICBmb3IgKGludCBpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2dfaWR4OyBpKysp
IHsKKyAgICAgICAgaW50IHBudW0gPSBjdHgtPnByZWdfbG9nW2ldOworICAgICAgICBpZiAodGVz
dF9iaXQocG51bSwgY3R4LT5wcmVnc19yZWFkKSkgeworICAgICAgICAgICAgcmV0dXJuIHRydWU7
CisgICAgICAgIH0KKyAgICB9CisKICAgICByZXR1cm4gZmFsc2U7CiB9CiAKQEAgLTUwMyw3ICs1
MTEsNyBAQCBzdGF0aWMgdm9pZCBnZW5fc3RhcnRfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQog
ICAgICAqIFByZWxvYWQgdGhlIHByZWRpY2F0ZWQgcHJlZCByZWdpc3RlcnMgaW50byBoZXhfbmV3
X3ByZWRfdmFsdWVbcHJlZF9udW1dCiAgICAgICogT25seSBlbmRsb29wIGluc3RydWN0aW9ucyBj
b25kaXRpb25hbGx5IHdyaXRlIHRvIHByZWQgcmVnaXN0ZXJzCiAgICAgICovCi0gICAgaWYgKHBr
dC0+cGt0X2hhc19lbmRsb29wKSB7CisgICAgaWYgKGN0eC0+bmVlZF9jb21taXQgJiYgcGt0LT5w
a3RfaGFzX2VuZGxvb3ApIHsKICAgICAgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBjdHgtPnByZWdf
bG9nX2lkeDsgaSsrKSB7CiAgICAgICAgICAgICBpbnQgcHJlZF9udW0gPSBjdHgtPnByZWdfbG9n
W2ldOwogICAgICAgICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X25ld19wcmVkX3ZhbHVlW3ByZWRf
bnVtXSwgaGV4X3ByZWRbcHJlZF9udW1dKTsKQEAgLTYxOSw4ICs2MjcsOCBAQCBzdGF0aWMgdm9p
ZCBnZW5fcmVnX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCkKIAogc3RhdGljIHZvaWQgZ2VuX3By
ZWRfd3JpdGVzKERpc2FzQ29udGV4dCAqY3R4KQogewotICAgIC8qIEVhcmx5IGV4aXQgaWYgdGhl
IGxvZyBpcyBlbXB0eSAqLwotICAgIGlmICghY3R4LT5wcmVnX2xvZ19pZHgpIHsKKyAgICAvKiBF
YXJseSBleGl0IGlmIG5vdCBuZWVkZWQgb3IgdGhlIGxvZyBpcyBlbXB0eSAqLworICAgIGlmICgh
Y3R4LT5uZWVkX2NvbW1pdCB8fCAhY3R4LT5wcmVnX2xvZ19pZHgpIHsKICAgICAgICAgcmV0dXJu
OwogICAgIH0KIAotLSAKMi4yNS4xCgo=

