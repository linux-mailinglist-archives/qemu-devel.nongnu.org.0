Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F8A65F307
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:42:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDUCb-0002vS-Pd; Thu, 05 Jan 2023 12:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCT-0002iB-Iu
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDUCQ-0007B8-5p
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:38:45 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305EJPhO016615; Thu, 5 Jan 2023 17:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hgDzBEi2AyxEhktC3aqUfqs4NN2pcQKo5O2rO4UCwHQ=;
 b=d06RirQPa25XH1olQEMEUjZBuip0CHPqTu/PnQsTR1hXMPCLo71KSQjHCe2v5X2Canxx
 SvwvALEg/hmipsn3rRwHhnwieQjoPSpdWBjWw6Vh6WYK1tLjyaFdHlaq14m4CJll5ChZ
 NPhu81rADuxueugLXFCpK89gLXoC2T/ygsgORXtoE6WqXGOiK2SnCqNdsAcep5eDTqH7
 km1LaKJ1v8KrJr3PS2m6AWFGnDUxVHj/tGJP9elBZjzIFl9ARxWkLWBbrv6mtHbPLL34
 csV5IxVpTj/ttqPjU5Hn3YTFVHE5T7lc0U9Tou1PaDRQ/LTRvimQk+eWZnRSrlBwF3+H Jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwdckjh42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 17:38:40 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305Hbwse024119; 
 Thu, 5 Jan 2023 17:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3mx2kp84a9-1;
 Thu, 05 Jan 2023 17:38:39 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305HccVI024836;
 Thu, 5 Jan 2023 17:38:38 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 305Hcc6A024567;
 Thu, 05 Jan 2023 17:38:38 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 58C195000AF; Thu,  5 Jan 2023 09:38:38 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Subject: [PULL 3/7] tests/tcg/hexagon: fix underspecifed asm constraints
Date: Thu,  5 Jan 2023 09:38:22 -0800
Message-Id: <20230105173826.21444-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105173826.21444-1-tsimpson@quicinc.com>
References: <20230105173826.21444-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a7ezRCGqdqjbrVtSZWQb0hXE5W_dEcC0
X-Proofpoint-ORIG-GUID: a7ezRCGqdqjbrVtSZWQb0hXE5W_dEcC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=891 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050139
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

RnJvbTogTXVraWxhbiBUaGl5YWdhcmFqYW4gPHF1aWNfbXRoaXlhZ2FAcXVpY2luYy5jb20+CgpU
aGVyZSBhcmUgdHdvIHRlc3QgY2FzZXMgd2hlcmUgdGhlIGlubGluZSBhc20gZG9lc24ndApoYXZl
IHRoZSBjb3JyZWN0IGNvbnN0cmFpbnRzIGNhdXNpbmcgdGhlbSB0byBmYWlsLgoKSW4gbWlzYy5j
LCB0aGUgJ3Jlc3VsdCcgb3V0cHV0IG5lZWRzIHRoZSBlYXJseSBjbG9iYmVyCm1vZGlmaWVyIHNp
bmNlIHRoZSByZXN0IG9mIHRoZSBpbnB1dHMgYXJlIHJlYWQgYWZ0ZXIKYXNzaWdubWVudCB0byB0
aGUgb3V0cHV0IHJlZ2lzdGVyLgoKSW4gbWVtX25vc2h1Zi5jLCB0aGUgcmVnaXN0ZXIgcjcgaXMg
d3JpdHRlbiB0byBidXQKbm90IHNwZWNpZmllZCBpbiB0aGUgY2xvYmJlciBsaXN0LgoKU2lnbmVk
LW9mZi1ieTogTXVraWxhbiBUaGl5YWdhcmFqYW4gPHF1aWNfbXRoaXlhZ2FAcXVpY2luYy5jb20+
ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1J
ZDogPDIwMjIxMjI5MDgxODM2LjEyMTMwLTEtcXVpY19tdGhpeWFnYUBxdWljaW5jLmNvbT4KLS0t
CiB0ZXN0cy90Y2cvaGV4YWdvbi9tZW1fbm9zaHVmLmMgfCAyICstCiB0ZXN0cy90Y2cvaGV4YWdv
bi9taXNjLmMgICAgICAgfCA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vbWVtX25v
c2h1Zi5jIGIvdGVzdHMvdGNnL2hleGFnb24vbWVtX25vc2h1Zi5jCmluZGV4IDBmNDA2NGU3MDAu
LjIxMGIyZjEyMDggMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL21lbV9ub3NodWYuYwor
KysgYi90ZXN0cy90Y2cvaGV4YWdvbi9tZW1fbm9zaHVmLmMKQEAgLTE0NCw3ICsxNDQsNyBAQCBz
dGF0aWMgaW5saW5lIGxvbmcgbG9uZyBwcmVkX2xkX3NkX3BpKGludCBwcmVkLCBsb25nIGxvbmcg
KnAsIGxvbmcgbG9uZyAqcSwKICAgICAgICAgICAgICAgICAgIn06bWVtX25vc2h1ZlxuIgogICAg
ICAgICAgICAgICAgICA6ICI9JnIiKHJldCkKICAgICAgICAgICAgICAgICAgOiAiciIocCksICJy
IihxKSwgInIiKHgpLCAiciIoeSksICJyIihwcmVkKQotICAgICAgICAgICAgICAgICA6ICJwMCIs
ICJtZW1vcnkiKTsKKyAgICAgICAgICAgICAgICAgOiAicjciLCAicDAiLCAibWVtb3J5Iik7CiAg
ICAgcmV0dXJuIHJldDsKIH0KIApkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vbWlzYy5j
IGIvdGVzdHMvdGNnL2hleGFnb24vbWlzYy5jCmluZGV4IGYwYjE5NDdmYjMuLmU3M2FiNTczMzQg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL21pc2MuYworKysgYi90ZXN0cy90Y2cvaGV4
YWdvbi9taXNjLmMKQEAgLTE4NiwxMCArMTg2LDEwIEBAIHN0YXRpYyBpbnQgTDJfcGxvYWRyaWZu
ZXdfcGkodm9pZCAqcCwgaW50IHByZWQpCiAgIGludCByZXN1bHQ7CiAgIGFzbSB2b2xhdGlsZSgi
JTAgPSAjMzFcblx0IgogICAgICAgICAgICAgICAgIntcblx0IgotICAgICAgICAgICAgICAgIiAg
ICBwMCA9IGNtcC5lcSglMSwgIzEpXG5cdCIKLSAgICAgICAgICAgICAgICIgICAgaWYgKCFwMC5u
ZXcpICUwID0gbWVtdyglMisrIzQpXG5cdCIKKyAgICAgICAgICAgICAgICIgICAgcDAgPSBjbXAu
ZXEoJTIsICMxKVxuXHQiCisgICAgICAgICAgICAgICAiICAgIGlmICghcDAubmV3KSAlMCA9IG1l
bXcoJTErKyM0KVxuXHQiCiAgICAgICAgICAgICAgICAifVxuXHQiCi0gICAgICAgICAgICAgICA6
ICI9ciIocmVzdWx0KSA6ICJyIihwcmVkKSwgInIiKHApCisgICAgICAgICAgICAgICA6ICI9JnIi
KHJlc3VsdCksICIrciIocCkgOiAiciIocHJlZCkKICAgICAgICAgICAgICAgIDogInAwIik7CiAg
IHJldHVybiByZXN1bHQ7CiB9Ci0tIAoyLjE3LjEKCg==

