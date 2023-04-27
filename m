Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6706F0EA2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAb7-0001iN-EU; Thu, 27 Apr 2023 19:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb6-0001hX-4G
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001Kb-NC
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:19 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMNrr2012246; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=i93CnUug/G9CZfMT4OZH30bHmQU+/cjpX3Vfg1dNtc4=;
 b=YK6Ef2v5RoAe/V6t0+7CdODGF+Hvd4B6KDqJRaYUUSsueuSNnlLbmVLAR5T034eGj3lQ
 Awx+ed/e+RWdFSO9TxgZ0peidXo763pE5dsf8Gs5jzezQgBEe5V4a0CnJqacqE4FwOoI
 n4IctmAjnH2+z3+mhn4EJV2Lj8M4LNSQVpj/Q3mnE378ik4ByNZtG/GN3iG/GID8UCw9
 5NiNdYUi/ejIr1W8jOcDoMZru3Wy1PJoqdxKePYnv+OPdzCwNqlawwM6osmdtknUUhtq
 FD4FI3VxK/1aCMbZKoY7sCrgoOS9XwuUQAjUr+qyZNIsv0h/hgCDvPK8jVrn1s9uPZXN Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7wq88gpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0Eb8014896; 
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q7wcbsb8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0EXP014889;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33RN0Es7014881
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id BFC0E692; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 05/21] Hexagon (target/hexagon) Add overrides for clr[tf]new
Date: Thu, 27 Apr 2023 15:59:56 -0700
Message-Id: <20230427230012.3800327-6-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: iiOIPh3PW0JSY_eod1eQnmhX5w3K_4PI
X-Proofpoint-ORIG-GUID: iiOIPh3PW0JSY_eod1eQnmhX5w3K_4PI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=691
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGhhdmUgaW1wbGljaXQgcmVhZHMgZnJvbSBwMCwgc28gd2UgZG9u
J3Qgd2FudAp0aGVtIGluIGhlbHBlcnMgd2hlbiBpZGVmLXBhcnNlciBpcyBvZmYuCgpTaWduZWQt
b2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZy5oIHwgMTYgKysrKysrKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggIHwgIDQgLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3Rh
cmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCA3YzVjYjkzMjk3Li5mM2U5YzI4MGIwIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2Vu
X3RjZy5oCkBAIC0xMDk3LDYgKzEwOTcsMjIgQEAKICAgICAgICAgZ2VuX2p1bXAoY3R4LCByaVYp
OyBcCiAgICAgfSB3aGlsZSAoMCkKIAorLyogaWYgKHAwLm5ldykgcjAgPSAjMCAqLworI2RlZmlu
ZSBmR0VOX1RDR19TQTFfY2xydG5ldyhTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAg
dGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBSZFYsIFwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGhleF9uZXdfcHJlZF92YWx1ZVswXSwgdGNnX2NvbnN0YW50X3RsKDApLCBcCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICBSZFYsIHRjZ19jb25zdGFudF90bCgwKSk7IFwKKyAg
ICB9IHdoaWxlICgwKQorCisvKiBpZiAoIXAwLm5ldykgcjAgPSAjMCAqLworI2RlZmluZSBmR0VO
X1RDR19TQTFfY2xyZm5ldyhTSE9SVENPREUpIFwKKyAgICBkbyB7IFwKKyAgICAgICAgdGNnX2dl
bl9tb3Zjb25kX3RsKFRDR19DT05EX05FLCBSZFYsIFwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGhleF9uZXdfcHJlZF92YWx1ZVswXSwgdGNnX2NvbnN0YW50X3RsKDApLCBcCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICBSZFYsIHRjZ19jb25zdGFudF90bCgwKSk7IFwKKyAgICB9IHdo
aWxlICgwKQorCiAjZGVmaW5lIGZHRU5fVENHX0oyX3BhdXNlKFNIT1JUQ09ERSkgXAogICAgIGRv
IHsgXAogICAgICAgICB1aVYgPSB1aVY7IFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggM2UxNjJkZTNhNy4uMmNiMDY0
N2NlMiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hl
eGFnb24vbWFjcm9zLmgKQEAgLTIyNywxMiArMjI3LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGdl
bl9jYW5jZWwodWludDMyX3Qgc2xvdCkKIAogI2lmZGVmIFFFTVVfR0VORVJBVEUKICNkZWZpbmUg
ZkxTQk5FVyhQVkFMKSAgIHRjZ19nZW5fYW5kaV90bChMU0IsIChQVkFMKSwgMSkKLSNkZWZpbmUg
ZkxTQk5FVzAgICAgICAgIHRjZ19nZW5fYW5kaV90bChMU0IsIGhleF9uZXdfcHJlZF92YWx1ZVsw
XSwgMSkKLSNkZWZpbmUgZkxTQk5FVzEgICAgICAgIHRjZ19nZW5fYW5kaV90bChMU0IsIGhleF9u
ZXdfcHJlZF92YWx1ZVsxXSwgMSkKICNlbHNlCiAjZGVmaW5lIGZMU0JORVcoUFZBTCkgICAoKFBW
QUwpICYgMSkKLSNkZWZpbmUgZkxTQk5FVzAgICAgICAgIChlbnYtPm5ld19wcmVkX3ZhbHVlWzBd
ICYgMSkKLSNkZWZpbmUgZkxTQk5FVzEgICAgICAgIChlbnYtPm5ld19wcmVkX3ZhbHVlWzFdICYg
MSkKICNlbmRpZgogCiAjaWZkZWYgUUVNVV9HRU5FUkFURQotLSAKMi4yNS4xCgo=

