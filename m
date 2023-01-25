Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683CF67A8EE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVkC-0006k4-QL; Tue, 24 Jan 2023 21:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVk8-0006iJ-PI
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:32 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVk3-0007A1-Q3
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:31 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30P2QKWv023212; Wed, 25 Jan 2023 02:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=N79wYqwZeBbRboQtu4axXlGQzeSU8zFLvoVksZ6Bxnw=;
 b=CXn7b/k5ny7pC1g3ZWOqPUVYG3df6Eh7Xt6hm9MFaO30evfptuOzL58P6suZDZBfyOfA
 93esQgoF3J+mE5J5qN3rPpfGJC4t08fo/k3QLRzDpy3o6m5OQRp+LxUDPzB285QVzm6R
 wGsHGKKKHrYX9Yh3uAMNcsFNhFm/1sIPtJiH448mo+m3S3gq8dzm7lWPnYXwf2Cbsc4I
 gW6XCUEy/yjuZCRq3rbdxRQf48+JOGvGvzZR/TaZK5Hc+uNGp+4zTrGfkFuj0R1+2lR7
 8Cm9CxEVRAT+tvhebX8tamjq2fwEKGJAcWTjRiQhGeDs7VGDJ6HmX1c/gCsM055d28WN YQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3naaas9wc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 02:42:18 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30P2gHGQ015757; 
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3n894m874a-1;
 Wed, 25 Jan 2023 02:42:17 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30P2gHTi015746;
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 30P2gHJo015742;
 Wed, 25 Jan 2023 02:42:17 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 8D6EA500117; Tue, 24 Jan 2023 18:42:16 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v4 10/13] Hexagon (target/hexagon) Change subtract from zero
 to change sign
Date: Tue, 24 Jan 2023 18:42:12 -0800
Message-Id: <20230125024215.10430-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125024215.10430-1-tsimpson@quicinc.com>
References: <20230125024215.10430-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xiE1WX710qhpZl3e6CUsOiKQJjMPh8wO
X-Proofpoint-ORIG-GUID: xiE1WX710qhpZl3e6CUsOiKQJjMPh8wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=572 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250020
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

VGhlIEYyX3NmZm1zIGluc3RydWN0aW9uIFtyMCAtPSBzZm1weShyMSwgcjIpXSBkb2Vzbid0IHBy
b3Blcmx5CmhhbmRsZSAtMC4gIFByZXZpb3VzbHkgd2Ugd291bGQgbmVnYXRlIHRoZSBpbnB1dCBv
cGVyYW5kIGJ5IHN1YnRyYWN0aW5nCmZyb20gemVyby4gIEluc3RlYWQsIHdlIG5lZ2F0ZSBieSBj
aGFuZ2luZyB0aGUgc2lnbiBiaXQuCgpUZXN0IGNhc2UgYWRkZWQgdG8gdGVzdHMvdGNnL2hleGFn
b24vZnBzdHVmZi5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgIHwgIDQgKystLQogdGVz
dHMvdGNnL2hleGFnb24vZnBzdHVmZi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24v
b3BfaGVscGVyLmMKaW5kZXggY2I0MzUxOWVkZi4uOGRkYWQzNWRlNyAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vb3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMK
QEAgLTEsNSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0g
SW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmln
aHQoYykgMjAxOS0yMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdo
dHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTEx
MjQsNyArMTEyNCw3IEBAIGZsb2F0MzIgSEVMUEVSKHNmZm1zKShDUFVIZXhhZ29uU3RhdGUgKmVu
diwgZmxvYXQzMiBSeFYsCiB7CiAgICAgZmxvYXQzMiBuZWdfUnNWOwogICAgIGFyY2hfZnBvcF9z
dGFydChlbnYpOwotICAgIG5lZ19Sc1YgPSBmbG9hdDMyX3N1YihmbG9hdDMyX3plcm8sIFJzViwg
JmVudi0+ZnBfc3RhdHVzKTsKKyAgICBuZWdfUnNWID0gZmxvYXQzMl9zZXRfc2lnbihSc1YsIGZs
b2F0MzJfaXNfbmVnKFJzVikgPyAwIDogMSk7CiAgICAgUnhWID0gaW50ZXJuYWxfZm1hZngobmVn
X1JzViwgUnRWLCBSeFYsIDAsICZlbnYtPmZwX3N0YXR1cyk7CiAgICAgYXJjaF9mcG9wX2VuZChl
bnYpOwogICAgIHJldHVybiBSeFY7CmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0
dWZmLmMgYi90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMKaW5kZXggNTZiZjU2MmE0MC4uOTBj
ZTlhNmVmMyAxMDA2NDQKLS0tIGEvdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCisrKyBiL3Rl
c3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJp
Z2h0KGMpIDIwMjAtMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmln
aHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDIwLTIwMjMgUXVhbGNvbW0gSW5ub3Zh
dGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2Rp
ZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNDAsNiArNDAsNyBAQCBjb25zdCBpbnQgU0ZfSEVYX05B
TiA9ICAgICAgICAgICAgICAgICAgICAweGZmZmZmZmZmOwogY29uc3QgaW50IFNGX3NtYWxsX25l
ZyA9ICAgICAgICAgICAgICAgICAgMHhhYjk4ZmJhODsKIGNvbnN0IGludCBTRl9kZW5vcm0gPSAg
ICAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMDE7CiBjb25zdCBpbnQgU0ZfcmFuZG9tID0gICAg
ICAgICAgICAgICAgICAgICAweDM0NjAwMWQ2OworY29uc3QgaW50IFNGX25lZ196ZXJvID0gICAg
ICAgICAgICAgICAgICAgMHg4MDAwMDAwMDsKIAogY29uc3QgbG9uZyBsb25nIERGX1FOYU4gPSAg
ICAgICAgICAgICAgICAgMHg3ZmY4MDAwMDAwMDAwMDAwVUxMOwogY29uc3QgbG9uZyBsb25nIERG
X1NOYU4gPSAgICAgICAgICAgICAgICAgMHg3ZmY3MDAwMDAwMDAwMDAwVUxMOwpAQCAtNTM2LDYg
KzUzNywzMyBAQCBzdGF0aWMgdm9pZCBjaGVja19zZmZpeHVwZCh2b2lkKQogICAgIGNoZWNrMzIo
cmVzdWx0LCAweDE0NjAwMWQ2KTsKIH0KIAorc3RhdGljIHZvaWQgY2hlY2tfc2ZmbXModm9pZCkK
K3sKKyAgICBpbnQgcmVzdWx0OworCisgICAgLyogQ2hlY2sgdGhhdCBzZmZtcyBwcm9wZXJseSBk
ZWFscyB3aXRoIC0wICovCisgICAgcmVzdWx0ID0gU0ZfbmVnX3plcm87CisgICAgYXNtICgiJTAg
LT0gc2ZtcHkoJTEgLCAlMilcblx0IgorICAgICAgICA6ICIrciIocmVzdWx0KQorICAgICAgICA6
ICJyIihTRl9aRVJPKSwgInIiKFNGX1pFUk8pCisgICAgICAgIDogInIxMiIsICJyOCIpOworICAg
IGNoZWNrMzIocmVzdWx0LCBTRl9uZWdfemVybyk7CisKKyAgICByZXN1bHQgPSBTRl9aRVJPOwor
ICAgIGFzbSAoIiUwIC09IHNmbXB5KCUxICwgJTIpXG5cdCIKKyAgICAgICAgOiAiK3IiKHJlc3Vs
dCkKKyAgICAgICAgOiAiciIoU0ZfbmVnX3plcm8pLCAiciIoU0ZfWkVSTykKKyAgICAgICAgOiAi
cjEyIiwgInI4Iik7CisgICAgY2hlY2szMihyZXN1bHQsIFNGX1pFUk8pOworCisgICAgcmVzdWx0
ID0gU0ZfWkVSTzsKKyAgICBhc20gKCIlMCAtPSBzZm1weSglMSAsICUyKVxuXHQiCisgICAgICAg
IDogIityIihyZXN1bHQpCisgICAgICAgIDogInIiKFNGX1pFUk8pLCAiciIoU0ZfbmVnX3plcm8p
CisgICAgICAgIDogInIxMiIsICJyOCIpOworICAgIGNoZWNrMzIocmVzdWx0LCBTRl9aRVJPKTsK
K30KKwogc3RhdGljIHZvaWQgY2hlY2tfZmxvYXQyaW50X2NvbnZzKCkKIHsKICAgICBpbnQgcmVz
MzI7CkBAIC02ODgsNiArNzE2LDcgQEAgaW50IG1haW4oKQogICAgIGNoZWNrX2ludnNxcnRhKCk7
CiAgICAgY2hlY2tfc2ZmaXh1cG4oKTsKICAgICBjaGVja19zZmZpeHVwZCgpOworICAgIGNoZWNr
X3NmZm1zKCk7CiAgICAgY2hlY2tfZmxvYXQyaW50X2NvbnZzKCk7CiAKICAgICBwdXRzKGVyciA/
ICJGQUlMIiA6ICJQQVNTIik7Ci0tIAoyLjE3LjEKCg==

