Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9E6EEB93
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTER-0007K5-Au; Tue, 25 Apr 2023 20:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEL-00075V-17
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTE7-0006EO-F4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:45 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0aZDY024100; Wed, 26 Apr 2023 00:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Xk1SEzFU54z3d6h60+VQogo05Nf6kEWp/14huaA/ndE=;
 b=iPdEozIu5ARDJ4tlPdZJmOmEA6EhP3Fr4yp6LpwhMAX714+ZtCsfFldJVM9HZmhJ0uyq
 CIQEyy04zhbsz8T4H6fSDNwA3Ctaf6wpJKdtFrv0+I6WtSwTo4zbBcbOPDw972r9U6oZ
 ambwWkF94UZGBDfztNE6ujD0J53KB1gG5jfCkeF20r68hDpY4RvX4GZSRwxjLcijMmz5
 3kGjDjLl/KhRqttfPLK+R2XCt8Ba8QgDmHFPjMO5Q+V2nUPbrr1cGdb/4W52BF7USTax
 0V6vpNGuCS1bzlr2Ioi9vl1AzgrSPCP7sgvh3aWwTqKAXYIr5zRaMC6FBu5qhhqNrx5P oQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6f6cskm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:40 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fdvZ003825; 
 Wed, 26 Apr 2023 00:41:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q48nm4ypn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:39 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fdeA003820;
 Wed, 26 Apr 2023 00:41:39 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33Q0fcHF003819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:39 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id E754F532; Tue, 25 Apr 2023 17:41:38 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 05/21] Hexagon (target/hexagon) Add overrides for clr[tf]new
Date: Tue, 25 Apr 2023 17:41:37 -0700
Message-Id: <20230426004137.1319051-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 7el5X3H1lNlev5nfO4kQoH_EH2YsrCnm
X-Proofpoint-GUID: 7el5X3H1lNlev5nfO4kQoH_EH2YsrCnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=678
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
L2hleGFnb24vZ2VuX3RjZy5oIHwgMTggKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdv
bi9tYWNyb3MuaCAgfCAgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIv
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IDdjNWNiOTMyOTcuLjVlODdkMWQ4NjEgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmgKQEAgLTEwOTcsNiArMTA5NywyNCBAQAogICAgICAgICBnZW5fanVtcChjdHgsIHJp
Vik7IFwKICAgICB9IHdoaWxlICgwKQogCisvKiBpZiAocDAubmV3KSByMCA9ICMwICovCisjZGVm
aW5lIGZHRU5fVENHX1NBMV9jbHJ0bmV3KFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAorICAgICAg
ICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsgXAorICAgICAgICB0Y2dfZ2VuX2Jy
Y29uZGlfdGwoVENHX0NPTkRfRVEsIGhleF9uZXdfcHJlZF92YWx1ZVswXSwgMCwgc2tpcCk7IFwK
KyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKFJkViwgMCk7IFwKKyAgICAgICAgZ2VuX3NldF9sYWJl
bChza2lwKTsgXAorICAgIH0gd2hpbGUgKDApCisKKy8qIGlmICghcDAubmV3KSByMCA9ICMwICov
CisjZGVmaW5lIGZHRU5fVENHX1NBMV9jbHJmbmV3KFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAor
ICAgICAgICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsgXAorICAgICAgICB0Y2df
Z2VuX2JyY29uZGlfdGwoVENHX0NPTkRfTkUsIGhleF9uZXdfcHJlZF92YWx1ZVswXSwgMCwgc2tp
cCk7IFwKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKFJkViwgMCk7IFwKKyAgICAgICAgZ2VuX3Nl
dF9sYWJlbChza2lwKTsgXAorICAgIH0gd2hpbGUgKDApCisKICNkZWZpbmUgZkdFTl9UQ0dfSjJf
cGF1c2UoU0hPUlRDT0RFKSBcCiAgICAgZG8geyBcCiAgICAgICAgIHVpViA9IHVpVjsgXApkaWZm
IC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQvaGV4YWdvbi9tYWNyb3Mu
aAppbmRleCAzZTE2MmRlM2E3Li4yY2IwNjQ3Y2UyIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdv
bi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApAQCAtMjI3LDEyICsyMjcs
OCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX2NhbmNlbCh1aW50MzJfdCBzbG90KQogCiAjaWZk
ZWYgUUVNVV9HRU5FUkFURQogI2RlZmluZSBmTFNCTkVXKFBWQUwpICAgdGNnX2dlbl9hbmRpX3Rs
KExTQiwgKFBWQUwpLCAxKQotI2RlZmluZSBmTFNCTkVXMCAgICAgICAgdGNnX2dlbl9hbmRpX3Rs
KExTQiwgaGV4X25ld19wcmVkX3ZhbHVlWzBdLCAxKQotI2RlZmluZSBmTFNCTkVXMSAgICAgICAg
dGNnX2dlbl9hbmRpX3RsKExTQiwgaGV4X25ld19wcmVkX3ZhbHVlWzFdLCAxKQogI2Vsc2UKICNk
ZWZpbmUgZkxTQk5FVyhQVkFMKSAgICgoUFZBTCkgJiAxKQotI2RlZmluZSBmTFNCTkVXMCAgICAg
ICAgKGVudi0+bmV3X3ByZWRfdmFsdWVbMF0gJiAxKQotI2RlZmluZSBmTFNCTkVXMSAgICAgICAg
KGVudi0+bmV3X3ByZWRfdmFsdWVbMV0gJiAxKQogI2VuZGlmCiAKICNpZmRlZiBRRU1VX0dFTkVS
QVRFCi0tIAoyLjI1LjEKCg==

