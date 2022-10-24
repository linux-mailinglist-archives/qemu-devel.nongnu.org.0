Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59760BF16
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 01:55:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on7Et-0002sC-K1; Mon, 24 Oct 2022 19:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7E9-0000kX-1B
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1on7E4-0005DR-VO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 19:51:28 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ONUKqe008741;
 Mon, 24 Oct 2022 23:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T/7i8zYwekmP6aPYQaWPwGW31XrWUDyt44DPwj209N4=;
 b=XoMzRkrpVauVKqEYLdvR/CS1t9+W9yptEM/vMX2L7OYOG1EmMvmGNPziQfZk0G89ZfPN
 b7I28ROs+/t5e0aDgftxZxpbLyiX06Ukez5jfHZKdja2GQIAECgIq5547kdCJkJR7WbN
 Jb7Gly6mxFPZ8PG3ZFnGX6AVLa5v50LczGe1Zcuy1hluHs44EGvcv8ZItmgoNt+VE2yO
 0Qrg+GRYDbrCHUyeDVMQNyWhiDZevvFGX6Hurq4jXh/7c0SRu5lzglqD3tzomrcLKFHg
 /8881CCwmJFDDl7YEaQBcKnz4BP2GfZZ8S4uJpCnbSGKyuR8451vYzIJhRsn6X7VdjGF QA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kc7utcr4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 23:51:21 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29ONpKcd031366; 
 Mon, 24 Oct 2022 23:51:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3kc9kkr1fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 24 Oct 2022 23:51:20 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29ONpKmt031360;
 Mon, 24 Oct 2022 23:51:20 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 29ONpJ01031357;
 Mon, 24 Oct 2022 23:51:20 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 47261500102; Mon, 24 Oct 2022 16:51:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 7/8] Hexagon (target/hexagon) Use direct block chaining for
 direct jump/branch
Date: Mon, 24 Oct 2022 16:51:16 -0700
Message-Id: <20221024235117.3663-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024235117.3663-1-tsimpson@quicinc.com>
References: <20221024235117.3663-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cNUUWXDP-QNnf2OoVAagzLpsLavgB8ca
X-Proofpoint-GUID: cNUUWXDP-QNnf2OoVAagzLpsLavgB8ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_07,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=918 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240142
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RGlyZWN0IGJsb2NrIGNoYWluaW5nIGlzIGRvY3VtZW50ZWQgaGVyZQpodHRwczovL3FlbXUucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RldmVsL3RjZy5odG1sI2RpcmVjdC1ibG9jay1jaGFpbmlu
ZwoKUmVjYWxsIHRoYXQgSGV4YWdvbiBhbGxvd3MgcGFja2V0cyB3aXRoIG11bHRpcGxlIGp1bXBz
IHdoZXJlIG9ubHkgdGhlIGZpcnN0Cm9uZSB3aXRoIGEgdHJ1ZSBwcmVkaWNhdGUgd2lsbCBhY3R1
YWxseSBqdW1wLiAgU28sIHdlIGNhbiBvbmx5IHVzZSBkaXJlY3QKYmxvY2sgY2hhaW5pbmcgd2hl
biB0aGUgcGFja2V0IGNvbnRhaW5zIGEgc2luZ2xlIFBDLXJlbGF0aXZlIGp1bXAuICBXZSBhZGQK
dGhlIGZvbGxvd2luZyB0byBEaXNhc0NvbnRleHQgaW4gb3JkZXIgdG8gcGVyZm9ybSBkaXJlY3Qg
YmxvY2sgY2hhaW5pbmcgYXQKdGhlIGVuZCBvZiBwYWNrZXQgY29tbWl0IChpbiBnZW5fZW5kX3Ri
KQogICAgaGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoCiAgICAgICAgSW5kaWNhdGVzIHRoYXQgd2Ug
Y2FuIHVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcKICAgIGJyYW5jaF9jb25kCiAgICAgICAgVGhl
IGNvbmRpdGlvbiB1bmRlciB3aGljaCB0aGUgYnJhbmNoIGlzIHRha2VuCiAgICBicmFuY2hfZGVz
dAogICAgICAgIFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgYnJhbmNoCgpTaWduZWQtb2ZmLWJ5OiBU
YXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24v
dHJhbnNsYXRlLmggfCAgMyArKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTMgKysr
KysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggZWFlMzU4Y2YzMy4uZTYwZGJm
MGU3YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIvdGFyZ2V0
L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTU0LDYgKzU0LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgRGlz
YXNDb250ZXh0IHsKICAgICBib29sIHFyZWdfaXNfcHJlZGljYXRlZFtOVU1fUVJFR1NdOwogICAg
IGludCBxcmVnX2xvZ19pZHg7CiAgICAgYm9vbCBwcmVfY29tbWl0OworICAgIGJvb2wgaGFzX3Np
bmdsZV9kaXJlY3RfYnJhbmNoOworICAgIFRDR3YgYnJhbmNoX2NvbmQ7CisgICAgdGFyZ2V0X3Vs
b25nIGJyYW5jaF9kZXN0OwogfSBEaXNhc0NvbnRleHQ7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBj
dHhfbG9nX3JlZ193cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJudW0pCmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4
IDQzNzI1MGMwZjkuLmM3NWE2YWFlODQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC00ODQsNyArNDg0LDE4IEBAIHN0
YXRpYyB2b2lkIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoRGlzYXNDb250ZXh0ICpjdHgsIFBhY2tl
dCAqcGt0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcGNfb2ZmLCBU
Q0d2IHByZWQpCiB7CiAgICAgdGFyZ2V0X3Vsb25nIGRlc3QgPSBwa3QtPnBjICsgcGNfb2ZmOwot
ICAgIGdlbl93cml0ZV9uZXdfcGNfYWRkcihjdHgsIHBrdCwgdGNnX2NvbnN0YW50X3RsKGRlc3Qp
LCBwcmVkKTsKKyAgICBpZiAocGt0LT5wa3RfaGFzX211bHRpX2NvZikgeworICAgICAgICBnZW5f
d3JpdGVfbmV3X3BjX2FkZHIoY3R4LCBwa3QsIHRjZ19jb25zdGFudF90bChkZXN0KSwgcHJlZCk7
CisgICAgfSBlbHNlIHsKKyAgICAgICAgLyogRGVmZXIgdGhpcyBqdW1wIHRvIHRoZSBlbmQgb2Yg
dGhlIFRCICovCisgICAgICAgIGdfYXNzZXJ0KGN0eC0+YnJhbmNoX2NvbmQgPT0gTlVMTCk7Cisg
ICAgICAgIGN0eC0+aGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoID0gdHJ1ZTsKKyAgICAgICAgaWYg
KHByZWQgIT0gTlVMTCkgeworICAgICAgICAgICAgY3R4LT5icmFuY2hfY29uZCA9IHRjZ190ZW1w
X2xvY2FsX25ldygpOworICAgICAgICAgICAgdGNnX2dlbl9tb3ZfdGwoY3R4LT5icmFuY2hfY29u
ZCwgcHJlZCk7CisgICAgICAgIH0KKyAgICAgICAgY3R4LT5icmFuY2hfZGVzdCA9IGRlc3Q7Cisg
ICAgfQogfQogCiBzdGF0aWMgdm9pZCBnZW5fY29tcGFyZShUQ0dDb25kIGNvbmQsIFRDR3YgcmVz
LCBUQ0d2IGFyZzEsIFRDR3YgYXJnMikKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5z
bGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKaW5kZXggNzFhZDJkYTY4Mi4uMjll
MmNhYWYwZiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTExNiwxMCArMTE2LDQ0IEBAIHN0YXRpYyB2b2lk
IGdlbl9leGVjX2NvdW50ZXJzKERpc2FzQ29udGV4dCAqY3R4KQogICAgICAgICAgICAgICAgICAg
ICBoZXhfZ3ByW0hFWF9SRUdfUUVNVV9IVlhfQ05UXSwgY3R4LT5udW1faHZ4X2luc25zKTsKIH0K
IAorc3RhdGljIGJvb2wgdXNlX2dvdG9fdGIoRGlzYXNDb250ZXh0ICpjdHgsIHRhcmdldF91bG9u
ZyBkZXN0KQoreworICAgIHJldHVybiB0cmFuc2xhdG9yX3VzZV9nb3RvX3RiKCZjdHgtPmJhc2Us
IGRlc3QpOworfQorCitzdGF0aWMgdm9pZCBnZW5fZ290b190YihEaXNhc0NvbnRleHQgKmN0eCwg
aW50IGlkeCwgdGFyZ2V0X3Vsb25nIGRlc3QpCit7CisgICAgaWYgKHVzZV9nb3RvX3RiKGN0eCwg
ZGVzdCkpIHsKKyAgICAgICAgdGNnX2dlbl9nb3RvX3RiKGlkeCk7CisgICAgICAgIHRjZ19nZW5f
bW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsKKyAgICAgICAgdGNnX2dlbl9leGl0
X3RiKGN0eC0+YmFzZS50YiwgaWR4KTsKKyAgICB9IGVsc2UgeworICAgICAgICB0Y2dfZ2VuX21v
dmlfdGwoaGV4X2dwcltIRVhfUkVHX1BDXSwgZGVzdCk7CisgICAgICAgIHRjZ19nZW5fbG9va3Vw
X2FuZF9nb3RvX3B0cigpOworICAgIH0KK30KKwogc3RhdGljIHZvaWQgZ2VuX2VuZF90YihEaXNh
c0NvbnRleHQgKmN0eCkKIHsKICAgICBnZW5fZXhlY19jb3VudGVycyhjdHgpOwotICAgIHRjZ19n
ZW5fZXhpdF90YihOVUxMLCAwKTsKKworICAgIGlmIChjdHgtPmhhc19zaW5nbGVfZGlyZWN0X2Jy
YW5jaCkgeworICAgICAgICBpZiAoY3R4LT5icmFuY2hfY29uZCAhPSBOVUxMKSB7CisgICAgICAg
ICAgICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICAgICAgICAgIHRjZ19n
ZW5fYnJjb25kaV90bChUQ0dfQ09ORF9FUSwgY3R4LT5icmFuY2hfY29uZCwgMCwgc2tpcCk7Cisg
ICAgICAgICAgICBnZW5fZ290b190YihjdHgsIDAsIGN0eC0+YnJhbmNoX2Rlc3QpOworICAgICAg
ICAgICAgZ2VuX3NldF9sYWJlbChza2lwKTsKKyAgICAgICAgICAgIGdlbl9nb3RvX3RiKGN0eCwg
MSwgY3R4LT5uZXh0X1BDKTsKKyAgICAgICAgICAgIHRjZ190ZW1wX2ZyZWUoY3R4LT5icmFuY2hf
Y29uZCk7CisgICAgICAgICAgICBjdHgtPmJyYW5jaF9jb25kID0gTlVMTDsKKyAgICAgICAgfSBl
bHNlIHsKKyAgICAgICAgICAgIGdlbl9nb3RvX3RiKGN0eCwgMCwgY3R4LT5icmFuY2hfZGVzdCk7
CisgICAgICAgIH0KKyAgICB9IGVsc2UgeworICAgICAgICB0Y2dfZ2VuX2xvb2t1cF9hbmRfZ290
b19wdHIoKTsKKyAgICB9CisKKyAgICBnX2Fzc2VydChjdHgtPmJyYW5jaF9jb25kID09IE5VTEwp
OwogICAgIGN0eC0+YmFzZS5pc19qbXAgPSBESVNBU19OT1JFVFVSTjsKIH0KIApAQCAtODAzLDYg
KzgzNyw5IEBAIHN0YXRpYyB2b2lkIGhleGFnb25fdHJfaW5pdF9kaXNhc19jb250ZXh0KERpc2Fz
Q29udGV4dEJhc2UgKmRjYmFzZSwKIAogc3RhdGljIHZvaWQgaGV4YWdvbl90cl90Yl9zdGFydChE
aXNhc0NvbnRleHRCYXNlICpkYiwgQ1BVU3RhdGUgKmNwdSkKIHsKKyAgICBEaXNhc0NvbnRleHQg
KmN0eCA9IGNvbnRhaW5lcl9vZihkYiwgRGlzYXNDb250ZXh0LCBiYXNlKTsKKyAgICBjdHgtPmhh
c19zaW5nbGVfZGlyZWN0X2JyYW5jaCA9IGZhbHNlOworICAgIGN0eC0+YnJhbmNoX2NvbmQgPSBO
VUxMOwogfQogCiBzdGF0aWMgdm9pZCBoZXhhZ29uX3RyX2luc25fc3RhcnQoRGlzYXNDb250ZXh0
QmFzZSAqZGNiYXNlLCBDUFVTdGF0ZSAqY3B1KQotLSAKMi4xNy4xCgo=

