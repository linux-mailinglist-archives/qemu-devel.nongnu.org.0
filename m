Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01BD6839C0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYt-0000kU-UR; Tue, 31 Jan 2023 17:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYl-0000fd-Pf
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:04 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYg-0003tV-N1
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:03 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VM3ZT7014255; Tue, 31 Jan 2023 22:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m9d8tjBLl2PWfW4sDx9hJ+U9jv/xXEXlVlrs9CK0iQY=;
 b=TXOfM3ZTdYhqn2Tvzy10kvBoVkF8yBQLD+XJ7Jl2EiErqOf+AGlTZgc5F8BL84jZkLKq
 qr2Po+odFPuyta54bziyAuk/n1V+7Rjdo4nvxB2XNzTaD/OmXxnSGagkGB6WPUkdg1KL
 sCSTstwg+pImXsSZm6diZusVU4yLfcnzi5T3fPYD7O4sdaK0ZF4VA9D/UHBZo6U4+ope
 BS/BERFR61BSTDIRNW/mtkQdCA6oAMxyCfu4C932JC9IGFxYCGCBE6bTXyCXfTV810yO
 sl6g8nyvB0jNy9o0gjDcifjgMllemJWfd8uPDYv3rF2I7yFiFGzJykhyHSGSg0dISWes vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3netx4jb4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:54 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMusVK026068; 
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3ncvskts9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:53 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMur8Y026059;
 Tue, 31 Jan 2023 22:56:53 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 30VMurbw026057;
 Tue, 31 Jan 2023 22:56:53 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id EE13A5000AE; Tue, 31 Jan 2023 14:56:52 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 02/14] Hexagon (target/hexagon) Add overrides for callr
Date: Tue, 31 Jan 2023 14:56:35 -0800
Message-Id: <20230131225647.25274-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225647.25274-1-tsimpson@quicinc.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0sJ5F6lCw8TuVm_FwsSQwbiJDNoEOLiI
X-Proofpoint-GUID: 0sJ5F6lCw8TuVm_FwsSQwbiJDNoEOLiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=587 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310197
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGxyCiAgICBKMl9jYWxscnQKICAgIEoyX2NhbGxy
ZgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgot
LS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA2ICsrKysrKwogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggIHwgMTIgKy0tLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgfCAy
MCArKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgg
Yi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggZDY0NGU1OWE2My4uOWU4ZjMzNzNhZCAx
MDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2cuaApAQCAtNjE0LDExICs2MTQsMTcgQEAKIAogI2RlZmluZSBmR0VOX1RDR19KMl9j
YWxsKFNIT1JUQ09ERSkgXAogICAgIGdlbl9jYWxsKGN0eCwgcmlWKQorI2RlZmluZSBmR0VOX1RD
R19KMl9jYWxscihTSE9SVENPREUpIFwKKyAgICBnZW5fY2FsbHIoY3R4LCBSc1YpCiAKICNkZWZp
bmUgZkdFTl9UQ0dfSjJfY2FsbHQoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2NvbmRfY2FsbChjdHgs
IFB1ViwgVENHX0NPTkRfRVEsIHJpVikKICNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbGYoU0hPUlRD
T0RFKSBcCiAgICAgZ2VuX2NvbmRfY2FsbChjdHgsIFB1ViwgVENHX0NPTkRfTkUsIHJpVikKKyNk
ZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbHJ0KFNIT1JUQ09ERSkgXAorICAgIGdlbl9jb25kX2NhbGxy
KGN0eCwgVENHX0NPTkRfRVEsIFB1ViwgUnNWKQorI2RlZmluZSBmR0VOX1RDR19KMl9jYWxscmYo
U0hPUlRDT0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbHIoY3R4LCBUQ0dfQ09ORF9ORSwgUHVWLCBS
c1YpCiAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfZW5kbG9vcDAoU0hPUlRDT0RFKSBcCiAgICAgZ2Vu
X2VuZGxvb3AwKGN0eCkKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oIGIvdGFy
Z2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggY2Q2NGJiOGVlYy4uOGYxZjgyZjhkYSAxMDA2NDQK
LS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmgKQEAgLTEsNSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5
cmlnaHQoYykgMjAxOS0yMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAg
LTQyMSwxNiArNDIxLDYgQEAgc3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFkX2lyZWcoVENHdiBy
ZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hpZnQpCiAjZGVmaW5lIGZCUkFOQ0goTE9DLCBUWVBFKSAg
ICAgICAgICBmV1JJVEVfTlBDKExPQykKICNkZWZpbmUgZkpVTVBSKFJFR05PLCBUQVJHRVQsIFRZ
UEUpIGZCUkFOQ0goVEFSR0VULCBDT0ZfVFlQRV9KVU1QUikKICNkZWZpbmUgZkhJTlRKUihUQVJH
RVQpIHsgLyogTm90IG1vZGVsbGVkIGluIHFlbXUgKi99Ci0jZGVmaW5lIGZDQUxMKEEpIFwKLSAg
ICBkbyB7IFwKLSAgICAgICAgZldSSVRFX0xSKGZSRUFEX05QQygpKTsgXAotICAgICAgICBmQlJB
TkNIKEEsIENPRl9UWVBFX0NBTEwpOyBcCi0gICAgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZkNBTExS
KEEpIFwKLSAgICBkbyB7IFwKLSAgICAgICAgZldSSVRFX0xSKGZSRUFEX05QQygpKTsgXAotICAg
ICAgICBmQlJBTkNIKEEsIENPRl9UWVBFX0NBTExSKTsgXAotICAgIH0gd2hpbGUgKDApCiAjZGVm
aW5lIGZXUklURV9MT09QX1JFR1MwKFNUQVJULCBDT1VOVCkgXAogICAgIGRvIHsgXAogICAgICAg
ICBXUklURV9SUkVHKEhFWF9SRUdfTEMwLCBDT1VOVCk7ICBcCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IDIzZmI4MDhl
MzcuLjM2MGJjZDBhMTkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBi
L3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC03MTAsNiArNzEwLDE0IEBAIHN0YXRpYyB2b2lk
IGdlbl9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcGNfb2ZmKQogICAgIGdlbl93cml0ZV9u
ZXdfcGNfcGNyZWwoY3R4LCBwY19vZmYsIFRDR19DT05EX0FMV0FZUywgTlVMTCk7CiB9CiAKK3N0
YXRpYyB2b2lkIGdlbl9jYWxscihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBuZXdfcGMpCit7Cisg
ICAgVENHdiBuZXh0X1BDID0KKyAgICAgICAgdGNnX2NvbnN0YW50X3RsKGN0eC0+cGt0LT5wYyAr
IGN0eC0+cGt0LT5lbmNvZF9wa3Rfc2l6ZV9pbl9ieXRlcyk7CisgICAgZ2VuX2xvZ19yZWdfd3Jp
dGUoSEVYX1JFR19MUiwgbmV4dF9QQyk7CisgICAgZ2VuX3dyaXRlX25ld19wY19hZGRyKGN0eCwg
bmV3X3BjLCBUQ0dfQ09ORF9BTFdBWVMsIE5VTEwpOworfQorCiBzdGF0aWMgdm9pZCBnZW5fY29u
ZF9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IHByZWQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRDR0NvbmQgY29uZCwgaW50IHBjX29mZikKIHsKQEAgLTcyNiw2ICs3MzQsMTggQEAg
c3RhdGljIHZvaWQgZ2VuX2NvbmRfY2FsbChEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBwcmVkLAog
ICAgIGdlbl9zZXRfbGFiZWwoc2tpcCk7CiB9CiAKK3N0YXRpYyB2b2lkIGdlbl9jb25kX2NhbGxy
KERpc2FzQ29udGV4dCAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgVENHQ29uZCBj
b25kLCBUQ0d2IHByZWQsIFRDR3YgbmV3X3BjKQoreworICAgIFRDR3YgbHNiID0gdGNnX3RlbXBf
bmV3KCk7CisgICAgVENHTGFiZWwgKnNraXAgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgdGNnX2dl
bl9hbmRpX3RsKGxzYiwgcHJlZCwgMSk7CisgICAgdGNnX2dlbl9icmNvbmRpX3RsKGNvbmQsIGxz
YiwgMCwgc2tpcCk7CisgICAgdGNnX3RlbXBfZnJlZShsc2IpOworICAgIGdlbl9jYWxscihjdHgs
IG5ld19wYyk7CisgICAgZ2VuX3NldF9sYWJlbChza2lwKTsKK30KKwogc3RhdGljIHZvaWQgZ2Vu
X2VuZGxvb3AwKERpc2FzQ29udGV4dCAqY3R4KQogewogICAgIFRDR3YgbHBjZmcgPSB0Y2dfdGVt
cF9sb2NhbF9uZXcoKTsKLS0gCjIuMTcuMQoK

