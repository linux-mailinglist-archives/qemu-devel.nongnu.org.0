Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0C6586F5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 22:15:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAdkA-0001W0-R4; Wed, 28 Dec 2022 16:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pAdk0-0001U2-Lr
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:13:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pAdjx-0001AS-G5
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 16:13:36 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSL2L7Y017612; Wed, 28 Dec 2022 21:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oVJFKsp59cwVp6y3vI3ISc2HPHZR9ucnLhs9QSRVrN0=;
 b=iQUGY70+7Setzi+gRRl2ffyiDTK9BYGanw/azRvwnE+hMfzAafofP0nbQ8njfdZu044j
 tVoWzTC3vj0bIKYCLUToMRJrhPt0foalN6AUuhyNc8/8ihKx+yA6qjLQRJw0Hblbu2r8
 1AubowqB/Q9135XfLEg28dGNNKjXWbZQoFvibWEXokN/gg/yEWJ+hGNMr2vitbDPydHZ
 tu4bqQe7XbUH12DknEBZREFEcraChQxXzQFWLa+fIioea0dsDKxAaLroux0X22CBdIl7
 vZGB9Mfmo20j4ugJOQfbwHx7vBk7gSQH+6NTTNa+QyUGPFxxg3s7d+lgt6wmAStyKjyE Xg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mratp1xgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 21:13:30 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BSLDTfx030063; 
 Wed, 28 Dec 2022 21:13:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3mntgkr0f9-1;
 Wed, 28 Dec 2022 21:13:29 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BSLDSsC030055;
 Wed, 28 Dec 2022 21:13:28 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2BSLDSHu030053;
 Wed, 28 Dec 2022 21:13:28 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 5479F5000A8; Wed, 28 Dec 2022 13:13:28 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 1/6] Hexagon (target/hexagon) Add overrides for jumpr31
 instructions
Date: Wed, 28 Dec 2022 13:13:19 -0800
Message-Id: <20221228211324.26989-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221228211324.26989-1-tsimpson@quicinc.com>
References: <20221228211324.26989-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PCiBd6UMIxw9GZKlFj7JBKY8LObfi324
X-Proofpoint-GUID: PCiBd6UMIxw9GZKlFj7JBKY8LObfi324
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_15,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=598
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280182
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIFNMMl9qdW1wcjMxICAgICAgICAgICAgVW5jb25kaXRpb25h
bAogICAgU0wyX2p1bXByMzFfdCAgICAgICAgICBQcmVkaWNhdGVkIHRydWUgKG9sZCB2YWx1ZSkK
ICAgIFNMMl9qdW1wcjMxX2YgICAgICAgICAgUHJlZGljYXRlZCBmYWxzZSAob2xkIHZhbHVlKQog
ICAgU0wyX2p1bXByMzFfdG5ldyAgICAgICBQcmVkaWNhdGVkIHRydWUgKG5ldyB2YWx1ZSkKICAg
IFNMMl9qdW1wcjMxX2ZuZXcgICAgICAgUHJlZGljYXRlZCBmYWxzZSAobmV3IHZhbHVlKQoKU2ln
bmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRh
cmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8IDEzICsrKysrKysrKysrKysKIHRhcmdldC9oZXhhZ29u
L2dlbnB0ci5jICB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggYi90YXJnZXQvaGV4YWdv
bi9nZW5fdGNnLmgKaW5kZXggMTk2OTdiNDJhNS4uM2VlNTMwZjVkOSAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaApAQCAt
MTAxNSw2ICsxMDE1LDE5IEBACiAjZGVmaW5lIGZHRU5fVENHX1MyX2FzbF9yX3Jfc2F0KFNIT1JU
Q09ERSkgXAogICAgIGdlbl9hc2xfcl9yX3NhdChSZFYsIFJzViwgUnRWKQogCisjZGVmaW5lIGZH
RU5fVENHX1NMMl9qdW1wcjMxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9qdW1wcihjdHgsIGhleF9n
cHJbSEVYX1JFR19MUl0pCisKKyNkZWZpbmUgZkdFTl9UQ0dfU0wyX2p1bXByMzFfdChTSE9SVENP
REUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0eCwgVENHX0NPTkRfRVEsIGhleF9wcmVkWzBd
KQorI2RlZmluZSBmR0VOX1RDR19TTDJfanVtcHIzMV9mKFNIT1JUQ09ERSkgXAorICAgIGdlbl9j
b25kX2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9ORSwgaGV4X3ByZWRbMF0pCisKKyNkZWZpbmUgZkdF
Tl9UQ0dfU0wyX2p1bXByMzFfdG5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMx
KGN0eCwgVENHX0NPTkRfRVEsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKyNkZWZpbmUgZkdFTl9U
Q0dfU0wyX2p1bXByMzFfZm5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0
eCwgVENHX0NPTkRfTkUsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKwogLyogRmxvYXRpbmcgcG9p
bnQgKi8KICNkZWZpbmUgZkdFTl9UQ0dfRjJfY29udl9zZjJkZihTSE9SVENPREUpIFwKICAgICBn
ZW5faGVscGVyX2NvbnZfc2YyZGYoUmRkViwgY3B1X2VudiwgUnNWKQpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCA2Y2Yy
ZTBlZDQzLi5lZTY3Y2IwMDY5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwor
KysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtNTUzLDYgKzU1MywxNCBAQCBzdGF0aWMg
dm9pZCBnZW5fY29uZF9qdW1wcihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBkc3RfcGMsCiAgICAg
Z2VuX3dyaXRlX25ld19wY19hZGRyKGN0eCwgZHN0X3BjLCBjb25kLCBwcmVkKTsKIH0KIAorc3Rh
dGljIHZvaWQgZ2VuX2NvbmRfanVtcHIzMShEaXNhc0NvbnRleHQgKmN0eCwgVENHQ29uZCBjb25k
LCBUQ0d2IHByZWQpCit7CisgICAgVENHdiBMU0IgPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICB0Y2df
Z2VuX2FuZGlfdGwoTFNCLCBwcmVkLCAxKTsKKyAgICBnZW5fY29uZF9qdW1wcihjdHgsIGhleF9n
cHJbSEVYX1JFR19MUl0sIGNvbmQsIExTQik7CisgICAgdGNnX3RlbXBfZnJlZShMU0IpOworfQor
CiBzdGF0aWMgdm9pZCBnZW5fY29uZF9qdW1wKERpc2FzQ29udGV4dCAqY3R4LCBUQ0dDb25kIGNv
bmQsIFRDR3YgcHJlZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHBjX29mZikKIHsK
LS0gCjIuMTcuMQoK

