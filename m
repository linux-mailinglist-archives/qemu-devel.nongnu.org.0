Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92196DCC11
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 22:25:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ply3i-00057o-8m; Mon, 10 Apr 2023 16:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ply3g-00056k-Iw
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 16:24:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ply3e-0005Vo-9a
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 16:24:11 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33AKLM9F014202; Mon, 10 Apr 2023 20:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=6I/oPgZfFpcdnzBDuh/ax62M3jBRUrHBxssEHv6pmZc=;
 b=EVh2uE17aVnXDsJWd0kYu6KIo988iI/nYs63BJGqpcpbXFIbQcSMI9fqQgTaFJzVe7/I
 LJkpwrdC3BGt+1SYoy/c7iEcsRXAYzhPSfhqqff83QF42tJAEBCrbZYAlItfh94YVx/U
 SuNEdAQB8dsywiVRQRa6KawLEP1cLiHqK09qV4JbpcLY7wdoWbkKO3Tj3L2yZnqToz6/
 IQqr6rMfrB0365QNu3YLLEWNRRQh+nghLaDqitngNpf64MloKURH+63vh7obysaYvsZI
 gzndFICXxiS9zkh5LX7bgWT1YzRS4KEGSX+7JV0zU4H6tpnkRkCBtVlZ/KQeMo84hS3L Dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pvq4dg8yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Apr 2023 20:24:06 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33AKO5PF002991; 
 Mon, 10 Apr 2023 20:24:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3pvqwdgcp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Apr 2023 20:24:05 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33AKO5QG002984;
 Mon, 10 Apr 2023 20:24:05 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33AKO5Y8002968
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Apr 2023 20:24:05 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 1F6F867D; Mon, 10 Apr 2023 13:24:05 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH] Hexagon (target/hexagon) Add overrides for cache/sync/barrier
 instructions
Date: Mon, 10 Apr 2023 13:24:02 -0700
Message-Id: <20230410202402.2856852-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8Z22yCXS_C_BYB156La5GQJkqsIJPebl
X-Proofpoint-GUID: 8Z22yCXS_C_BYB156La5GQJkqsIJPebl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_14,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=462 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100176
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

TW9zdCBvZiB0aGVzZSBhcmUgbm90IG1vZGVsbGVkIGluIFFFTVUsIHNvIHNhdmUgdGhlIG92ZXJo
ZWFkIG9mCmNhbGxpbmcgYSBoZWxwZXIuCgpUaGUgb25seSBleGNlcHRpb24gaXMgZGN6ZXJvYS4g
IEl0IGFzc2lnbnMgdG8gaGV4X2RjemVyb19hZGRyLCB3aGljaAppcyBoYW5kbGVkIGR1cmluZyBw
YWNrZXQgY29tbWl0LgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1
aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKysrKwogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggIHwgMTggKysrKy0tLS0tLS0t
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2cuaAppbmRleCBiY2YwY2Y0NjZhLi5jYTQxY2ExZTQxIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBAIC00
ODcsNiArNDg3LDE5IEBACiAjZGVmaW5lIGZHRU5fVENHX1MyX3N0b3JlcmluZXdfcGNyKFNIT1JU
Q09ERSkgXAogICAgIGZHRU5fVENHX1NUT1JFX3BjcigyLCBmU1RPUkUoMSwgNCwgRUEsIE50Tikp
CiAKKy8qIGRjemVyb2EgY2xlYXJzIHRoZSAzMiBieXRlIGNhY2hlIGxpbmUgYXQgdGhlIGFkZHJl
c3MgZ2l2ZW4gKi8KKyNkZWZpbmUgZkdFTl9UQ0dfWTJfZGN6ZXJvYShTSE9SVENPREUpIFNIT1JU
Q09ERQorCisvKiBJbiBsaW51eC11c2VyIG1vZGUsIHRoZXNlIGFyZSBub3QgbW9kZWxsZWQsIHN1
cHByZXNzIGNvbXBpbGVyIHdhcm5pbmcgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfWTJfZGNpbnZhKFNI
T1JUQ09ERSkgXAorICAgIGRvIHsgUnNWID0gUnNWOyB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VO
X1RDR19ZMl9kY2NsZWFuaW52YShTSE9SVENPREUpIFwKKyAgICBkbyB7IFJzViA9IFJzVjsgfSB3
aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTJfZGNjbGVhbmEoU0hPUlRDT0RFKSBcCisgICAg
ZG8geyBSc1YgPSBSc1Y7IH0gd2hpbGUgKDApCisjZGVmaW5lIGZHRU5fVENHX1kyX2ljaW52YShT
SE9SVENPREUpIFwKKyAgICBkbyB7IFJzViA9IFJzVjsgfSB3aGlsZSAoMCkKKwogLyoKICAqIGRl
YWxsb2NfcmV0dXJuCiAgKiBBc3NlbWJsZXIgbWFwcGVkIHRvCkBAIC0xMTg3LDYgKzEyMDAsMTcg
QEAKICAgICBkbyB7IFwKICAgICAgICAgUnNWID0gUnNWOyBcCiAgICAgfSB3aGlsZSAoMCkKKyNk
ZWZpbmUgZkdFTl9UQ0dfWTJfaXN5bmMoU0hPUlRDT0RFKSBcCisgICAgZG8geyB9IHdoaWxlICgw
KQorI2RlZmluZSBmR0VOX1RDR19ZMl9iYXJyaWVyKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgfSB3
aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTJfc3luY2h0KFNIT1JUQ09ERSkgXAorICAgIGRv
IHsgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTJfZGNmZXRjaGJvKFNIT1JUQ09ERSkg
XAorICAgIGRvIHsgXAorICAgICAgICBSc1YgPSBSc1Y7IFwKKyAgICAgICAgdWlWID0gdWlWOyBc
CisgICAgfSB3aGlsZSAoMCkKIAogI2RlZmluZSBmR0VOX1RDR19KMl90cmFwMChTSE9SVENPREUp
IFwKICAgICBkbyB7IFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFy
Z2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggNDgyYTljNzg3Zi4uZDg3ODY4OGQ5NiAxMDA2NDQK
LS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmgKQEAgLTY4OCwyMCArNjg4LDEwIEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVn
KFRDR3YgcmVzdWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogICAgICAgICAgICAgICAgICAgIHJl
Z19maWVsZF9pbmZvW0ZJRUxEXS5vZmZzZXQpCiAjZGVmaW5lIGZHRVRfRklFTEQoVkFMLCBGSUVM
RCkKICNkZWZpbmUgZlNFVF9GSUVMRChWQUwsIEZJRUxELCBORVdWQUwpCi0jZGVmaW5lIGZCQVJS
SUVSKCkKLSNkZWZpbmUgZlNZTkNIKCkKLSNkZWZpbmUgZklTWU5DKCkKLSNkZWZpbmUgZkRDRkVU
Q0goUkVHKSBcCi0gICAgZG8geyAodm9pZClSRUc7IH0gd2hpbGUgKDApIC8qIE5vdGhpbmcgdG8g
ZG8gaW4gcWVtdSAqLwotI2RlZmluZSBmSUNJTlZBKFJFRykgXAotICAgIGRvIHsgKHZvaWQpUkVH
OyB9IHdoaWxlICgwKSAvKiBOb3RoaW5nIHRvIGRvIGluIHFlbXUgKi8KLSNkZWZpbmUgZkwyRkVU
Q0goQUREUiwgSEVJR0hULCBXSURUSCwgU1RSSURFLCBGTEFHUykKLSNkZWZpbmUgZkRDQ0xFQU5B
KFJFRykgXAotICAgIGRvIHsgKHZvaWQpUkVHOyB9IHdoaWxlICgwKSAvKiBOb3RoaW5nIHRvIGRv
IGluIHFlbXUgKi8KLSNkZWZpbmUgZkRDQ0xFQU5JTlZBKFJFRykgXAotICAgIGRvIHsgKHZvaWQp
UkVHOyB9IHdoaWxlICgwKSAvKiBOb3RoaW5nIHRvIGRvIGluIHFlbXUgKi8KLQotI2RlZmluZSBm
RENaRVJPQShSRUcpIGRvIHsgZW52LT5kY3plcm9fYWRkciA9IChSRUcpOyB9IHdoaWxlICgwKQor
CisjaWZkZWYgUUVNVV9HRU5FUkFURQorI2RlZmluZSBmRENaRVJPQShSRUcpIHRjZ19nZW5fbW92
X3RsKGhleF9kY3plcm9fYWRkciwgKFJFRykpCisjZW5kaWYKIAogI2RlZmluZSBmQlJBTkNIX1NQ
RUNVTEFURV9TVEFMTChET1RORVdWQUwsIEpVTVBfQ09ORCwgU1BFQ19ESVIsIEhJTlRCSVROVU0s
IFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RSQklUTlVNKSAvKiBOb3RoaW5n
ICovCi0tIAoyLjI1LjEKCg==

