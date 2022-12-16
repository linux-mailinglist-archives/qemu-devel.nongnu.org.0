Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9134D64F304
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:10:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6He0-0002kx-Er; Fri, 16 Dec 2022 15:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6Hdx-0002jx-Ow
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:21 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p6Hdu-0004P4-La
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:49:21 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGGlYxR000436; Fri, 16 Dec 2022 20:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1pv6A7MoBkzjXsDL0IjGKUMxac2muHq/MHQLgAv1t4I=;
 b=RFr2YZx+sW7wdeCWEgDxyVxdXVOIZ906BkhQf4B4d+mZbx4g5N49QKL7WpN3iltaYx7O
 c/M5Xi9T4tezyTspyWssSwZjhlm2zivuGmXn8iC6rvBM4FgU9f9YYvIZJ1whkVvt0Uvk
 C6sbuM87RU3zHbtkOo72b3QUfVUP2yLdtxAineo6sgmgcHCIatFrMJW/GjXyNUPDp3Ft
 1SwJPiPpoYYaTUz4bVyWpJVfBxlBnZFUnVIBXCi+GFa2H5qDHEEkBnccZjc9ZoNBRdzD
 xTDKcg0aEbFF0cYS0hIG7xAY+TddxzAi5FpCrRwRVZjd1zOg3+c6NLOVJGIOMHaefR6I ow== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg3f8w3de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 20:49:14 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BGKgROh020154; 
 Fri, 16 Dec 2022 20:49:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3mgwb1gmpq-1;
 Fri, 16 Dec 2022 20:49:14 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGKhTx1021015;
 Fri, 16 Dec 2022 20:49:13 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2BGKnDog028292;
 Fri, 16 Dec 2022 20:49:13 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 07A0750011B; Fri, 16 Dec 2022 12:49:13 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, Paolo Montesel <babush@rev.ng>,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PULL 14/21] target/hexagon: make slot number an unsigned
Date: Fri, 16 Dec 2022 12:48:38 -0800
Message-Id: <20221216204845.19290-15-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221216204845.19290-1-tsimpson@quicinc.com>
References: <20221216204845.19290-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _DiVcxt8Lcp_grnF5ED5T6lhr8e3o6m4
X-Proofpoint-ORIG-GUID: _DiVcxt8Lcp_grnF5ED5T6lhr8e3o6m4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=291
 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160185
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

RnJvbTogUGFvbG8gTW9udGVzZWwgPGJhYnVzaEByZXYubmc+CgpTaWduZWQtb2ZmLWJ5OiBBbGVz
c2FuZHJvIERpIEZlZGVyaWNvIDxhbGVAcmV2Lm5nPgpTaWduZWQtb2ZmLWJ5OiBQYW9sbyBNb250
ZXNlbCA8YmFidXNoQHJldi5uZz4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1w
c29uQHF1aWNpbmMuY29tPgpBY2tlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDIyMDkyMzE3MzgzMS4yMjc1NTEtNC1hbmpvQHJl
di5uZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCB8ICAyICstCiB0YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYyB8IDI0ICsrKysrKysrKysrKystLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9tYWNyb3MuaCBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCmluZGV4IDkwMzUwMzU0
MGUuLjFhMzE1NDIwMTAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCisrKyBi
L3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCkBAIC0yMDIsNyArMjAyLDcgQEAKICNkZWZpbmUgTE9B
RF9DQU5DRUwoRUEpIGRvIHsgQ0FOQ0VMOyB9IHdoaWxlICgwKQogCiAjaWZkZWYgUUVNVV9HRU5F
UkFURQotc3RhdGljIGlubGluZSB2b2lkIGdlbl9wcmVkX2NhbmNlbChUQ0d2IHByZWQsIGludCBz
bG90X251bSkKK3N0YXRpYyBpbmxpbmUgdm9pZCBnZW5fcHJlZF9jYW5jZWwoVENHdiBwcmVkLCB1
aW50MzJfdCBzbG90X251bSkKICB7CiAgICAgVENHdiBzbG90X21hc2sgPSB0Y2dfdGVtcF9uZXco
KTsKICAgICBUQ0d2IHRtcCA9IHRjZ190ZW1wX25ldygpOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCBhNGE3OWM4NDU0
Li40Y2QyYTJhZWI5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtMzAsNyArMzAsOCBAQAogI2luY2x1ZGUgImdlbl90
Y2cuaCIKICNpbmNsdWRlICJnZW5fdGNnX2h2eC5oIgogCi1zdGF0aWMgaW5saW5lIHZvaWQgZ2Vu
X2xvZ19wcmVkaWNhdGVkX3JlZ193cml0ZShpbnQgcm51bSwgVENHdiB2YWwsIGludCBzbG90KQor
c3RhdGljIGlubGluZSB2b2lkIGdlbl9sb2dfcHJlZGljYXRlZF9yZWdfd3JpdGUoaW50IHJudW0s
IFRDR3YgdmFsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDMyX3Qgc2xvdCkKIHsKICAgICBUQ0d2IHplcm8gPSB0Y2dfY29uc3RhbnRfdGwoMCk7
CiAgICAgVENHdiBzbG90X21hc2sgPSB0Y2dfdGVtcF9uZXcoKTsKQEAgLTYyLDcgKzYzLDggQEAg
c3RhdGljIGlubGluZSB2b2lkIGdlbl9sb2dfcmVnX3dyaXRlKGludCBybnVtLCBUQ0d2IHZhbCkK
ICAgICB9CiB9CiAKLXN0YXRpYyB2b2lkIGdlbl9sb2dfcHJlZGljYXRlZF9yZWdfd3JpdGVfcGFp
cihpbnQgcm51bSwgVENHdl9pNjQgdmFsLCBpbnQgc2xvdCkKK3N0YXRpYyB2b2lkIGdlbl9sb2df
cHJlZGljYXRlZF9yZWdfd3JpdGVfcGFpcihpbnQgcm51bSwgVENHdl9pNjQgdmFsLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNsb3QpCiB7
CiAgICAgVENHdiB2YWwzMiA9IHRjZ190ZW1wX25ldygpOwogICAgIFRDR3YgemVybyA9IHRjZ19j
b25zdGFudF90bCgwKTsKQEAgLTM5NCw1NCArMzk2LDU0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBn
ZW5fc3RvcmVfY29uZGl0aW9uYWw4KERpc2FzQ29udGV4dCAqY3R4LAogICAgIHRjZ19nZW5fbW92
aV90bChoZXhfbGxzY19hZGRyLCB+MCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3Rv
cmUzMihUQ0d2IHZhZGRyLCBUQ0d2IHNyYywgaW50IHdpZHRoLCBpbnQgc2xvdCkKK3N0YXRpYyBp
bmxpbmUgdm9pZCBnZW5fc3RvcmUzMihUQ0d2IHZhZGRyLCBUQ0d2IHNyYywgaW50IHdpZHRoLCB1
aW50MzJfdCBzbG90KQogewogICAgIHRjZ19nZW5fbW92X3RsKGhleF9zdG9yZV9hZGRyW3Nsb3Rd
LCB2YWRkcik7CiAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9zdG9yZV93aWR0aFtzbG90XSwgd2lk
dGgpOwogICAgIHRjZ19nZW5fbW92X3RsKGhleF9zdG9yZV92YWwzMltzbG90XSwgc3JjKTsKIH0K
IAotc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZTEoVENHdl9lbnYgY3B1X2VudiwgVENHdiB2
YWRkciwgVENHdiBzcmMsIGludCBzbG90KQorc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZTEo
VENHdl9lbnYgY3B1X2VudiwgVENHdiB2YWRkciwgVENHdiBzcmMsIHVpbnQzMl90IHNsb3QpCiB7
CiAgICAgZ2VuX3N0b3JlMzIodmFkZHIsIHNyYywgMSwgc2xvdCk7CiB9CiAKLXN0YXRpYyBpbmxp
bmUgdm9pZCBnZW5fc3RvcmUxaShUQ0d2X2VudiBjcHVfZW52LCBUQ0d2IHZhZGRyLCBpbnQzMl90
IHNyYywgaW50IHNsb3QpCitzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlMWkoVENHdl9lbnYg
Y3B1X2VudiwgVENHdiB2YWRkciwgaW50MzJfdCBzcmMsIHVpbnQzMl90IHNsb3QpCiB7CiAgICAg
VENHdiB0bXAgPSB0Y2dfY29uc3RhbnRfdGwoc3JjKTsKICAgICBnZW5fc3RvcmUxKGNwdV9lbnYs
IHZhZGRyLCB0bXAsIHNsb3QpOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0b3JlMihU
Q0d2X2VudiBjcHVfZW52LCBUQ0d2IHZhZGRyLCBUQ0d2IHNyYywgaW50IHNsb3QpCitzdGF0aWMg
aW5saW5lIHZvaWQgZ2VuX3N0b3JlMihUQ0d2X2VudiBjcHVfZW52LCBUQ0d2IHZhZGRyLCBUQ0d2
IHNyYywgdWludDMyX3Qgc2xvdCkKIHsKICAgICBnZW5fc3RvcmUzMih2YWRkciwgc3JjLCAyLCBz
bG90KTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZTJpKFRDR3ZfZW52IGNwdV9l
bnYsIFRDR3YgdmFkZHIsIGludDMyX3Qgc3JjLCBpbnQgc2xvdCkKK3N0YXRpYyBpbmxpbmUgdm9p
ZCBnZW5fc3RvcmUyaShUQ0d2X2VudiBjcHVfZW52LCBUQ0d2IHZhZGRyLCBpbnQzMl90IHNyYywg
dWludDMyX3Qgc2xvdCkKIHsKICAgICBUQ0d2IHRtcCA9IHRjZ19jb25zdGFudF90bChzcmMpOwog
ICAgIGdlbl9zdG9yZTIoY3B1X2VudiwgdmFkZHIsIHRtcCwgc2xvdCk7CiB9CiAKLXN0YXRpYyBp
bmxpbmUgdm9pZCBnZW5fc3RvcmU0KFRDR3ZfZW52IGNwdV9lbnYsIFRDR3YgdmFkZHIsIFRDR3Yg
c3JjLCBpbnQgc2xvdCkKK3N0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmU0KFRDR3ZfZW52IGNw
dV9lbnYsIFRDR3YgdmFkZHIsIFRDR3Ygc3JjLCB1aW50MzJfdCBzbG90KQogewogICAgIGdlbl9z
dG9yZTMyKHZhZGRyLCBzcmMsIDQsIHNsb3QpOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgZ2Vu
X3N0b3JlNGkoVENHdl9lbnYgY3B1X2VudiwgVENHdiB2YWRkciwgaW50MzJfdCBzcmMsIGludCBz
bG90KQorc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZTRpKFRDR3ZfZW52IGNwdV9lbnYsIFRD
R3YgdmFkZHIsIGludDMyX3Qgc3JjLCB1aW50MzJfdCBzbG90KQogewogICAgIFRDR3YgdG1wID0g
dGNnX2NvbnN0YW50X3RsKHNyYyk7CiAgICAgZ2VuX3N0b3JlNChjcHVfZW52LCB2YWRkciwgdG1w
LCBzbG90KTsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIGdlbl9zdG9yZTgoVENHdl9lbnYgY3B1
X2VudiwgVENHdiB2YWRkciwgVENHdl9pNjQgc3JjLCBpbnQgc2xvdCkKK3N0YXRpYyBpbmxpbmUg
dm9pZCBnZW5fc3RvcmU4KFRDR3ZfZW52IGNwdV9lbnYsIFRDR3YgdmFkZHIsIFRDR3ZfaTY0IHNy
YywgdWludDMyX3Qgc2xvdCkKIHsKICAgICB0Y2dfZ2VuX21vdl90bChoZXhfc3RvcmVfYWRkcltz
bG90XSwgdmFkZHIpOwogICAgIHRjZ19nZW5fbW92aV90bChoZXhfc3RvcmVfd2lkdGhbc2xvdF0s
IDgpOwogICAgIHRjZ19nZW5fbW92X2k2NChoZXhfc3RvcmVfdmFsNjRbc2xvdF0sIHNyYyk7CiB9
CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fc3RvcmU4aShUQ0d2X2VudiBjcHVfZW52LCBUQ0d2
IHZhZGRyLCBpbnQ2NF90IHNyYywgaW50IHNsb3QpCitzdGF0aWMgaW5saW5lIHZvaWQgZ2VuX3N0
b3JlOGkoVENHdl9lbnYgY3B1X2VudiwgVENHdiB2YWRkciwgaW50NjRfdCBzcmMsIHVpbnQzMl90
IHNsb3QpCiB7CiAgICAgVENHdl9pNjQgdG1wID0gdGNnX2NvbnN0YW50X2k2NChzcmMpOwogICAg
IGdlbl9zdG9yZTgoY3B1X2VudiwgdmFkZHIsIHRtcCwgc2xvdCk7Ci0tIAoyLjE3LjEKCg==

