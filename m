Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1756839CD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:58:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYm-0000fN-9t; Tue, 31 Jan 2023 17:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYj-0000eQ-C6
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:01 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYg-0003tr-8C
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:01 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VMUURe000552; Tue, 31 Jan 2023 22:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OYx8J3tK/3hUCjFX9IlAs8QxJIfhOYDikXV1ZUmrCJM=;
 b=GHGbYJDohM0iIK5x5JO0RJmsNpUc7Q6W0ei1rB7x6bHrMdLGcgHcVH7t4N0lbHQA2g0G
 pLGAqeWVrFVHQRZdeCnQAG1VXicpktr2qkfK1UyJ/FJiDnSxDnaqEBeFcpR5qC0STbZi
 Q544TSNxknn+4kxWh0FvZJurG7Tldp/VbN8C88go9WoUzQmbWZZcV7q6g4/rQCq43FLM
 C400vISBxUbDP/Zyjb6F5IbfOVx/GSCqqJUSKZ2kXEBL3nfygH8tpLdWdNieT9UGXjyH
 ovPNoB/nvHvXrkOu+4TPKZKGv4SI0SJiqH4JgoAt51LqfnBMSx1jFgJNLpn+6aKnGQIw 8w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfbuh0135-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:56 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMq0ZQ028677; 
 Tue, 31 Jan 2023 22:56:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3ncvskts7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:54 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMushf001458;
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 30VMurvN001452;
 Tue, 31 Jan 2023 22:56:54 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 12279500118; Tue, 31 Jan 2023 14:56:53 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 11/14] Hexagon (target/hexagon) Change subtract from zero
 to change sign
Date: Tue, 31 Jan 2023 14:56:44 -0800
Message-Id: <20230131225647.25274-12-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jyd_aOBXelEqU5iqxGA8574FIp5HYzHe
X-Proofpoint-GUID: jyd_aOBXelEqU5iqxGA8574FIp5HYzHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 adultscore=0 mlxlogscore=527 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310197
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

VGhlIEYyX3NmZm1zIGluc3RydWN0aW9uIFtyMCAtPSBzZm1weShyMSwgcjIpXSBkb2Vzbid0IHBy
b3Blcmx5CmhhbmRsZSAtMC4gIFByZXZpb3VzbHkgd2Ugd291bGQgbmVnYXRlIHRoZSBpbnB1dCBv
cGVyYW5kIGJ5IHN1YnRyYWN0aW5nCmZyb20gemVyby4gIEluc3RlYWQsIHdlIG5lZ2F0ZSBieSBj
aGFuZ2luZyB0aGUgc2lnbiBiaXQuCgpUZXN0IGNhc2UgYWRkZWQgdG8gdGVzdHMvdGNnL2hleGFn
b24vZnBzdHVmZi5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgIHwgIDIgKy0KIHRlc3Rz
L3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5jCmluZGV4IDM4YjhhZWUxOTMuLjk0MjU5NDFjNjkgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL29wX2hlbHBlci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCkBA
IC0xMTY5LDcgKzExNjksNyBAQCBmbG9hdDMyIEhFTFBFUihzZmZtcykoQ1BVSGV4YWdvblN0YXRl
ICplbnYsIGZsb2F0MzIgUnhWLAogewogICAgIGZsb2F0MzIgbmVnX1JzVjsKICAgICBhcmNoX2Zw
b3Bfc3RhcnQoZW52KTsKLSAgICBuZWdfUnNWID0gZmxvYXQzMl9zdWIoZmxvYXQzMl96ZXJvLCBS
c1YsICZlbnYtPmZwX3N0YXR1cyk7CisgICAgbmVnX1JzViA9IGZsb2F0MzJfc2V0X3NpZ24oUnNW
LCBmbG9hdDMyX2lzX25lZyhSc1YpID8gMCA6IDEpOwogICAgIFJ4ViA9IGludGVybmFsX2ZtYWZ4
KG5lZ19Sc1YsIFJ0ViwgUnhWLCAwLCAmZW52LT5mcF9zdGF0dXMpOwogICAgIGFyY2hfZnBvcF9l
bmQoZW52KTsKICAgICByZXR1cm4gUnhWOwpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24v
ZnBzdHVmZi5jIGIvdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCmluZGV4IDU2YmY1NjJhNDAu
LjkwY2U5YTZlZjMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYworKysg
Yi90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMKQEAgLTEsNSArMSw1IEBACiAvKgotICogIENv
cHlyaWdodChjKSAyMDIwLTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAyMC0yMDIzIFF1YWxjb21tIElu
bm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAgKgogICogIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3Ig
bW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTQwLDYgKzQwLDcgQEAgY29uc3QgaW50IFNGX0hF
WF9OQU4gPSAgICAgICAgICAgICAgICAgICAgMHhmZmZmZmZmZjsKIGNvbnN0IGludCBTRl9zbWFs
bF9uZWcgPSAgICAgICAgICAgICAgICAgIDB4YWI5OGZiYTg7CiBjb25zdCBpbnQgU0ZfZGVub3Jt
ID0gICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDAxOwogY29uc3QgaW50IFNGX3JhbmRvbSA9
ICAgICAgICAgICAgICAgICAgICAgMHgzNDYwMDFkNjsKK2NvbnN0IGludCBTRl9uZWdfemVybyA9
ICAgICAgICAgICAgICAgICAgIDB4ODAwMDAwMDA7CiAKIGNvbnN0IGxvbmcgbG9uZyBERl9RTmFO
ID0gICAgICAgICAgICAgICAgIDB4N2ZmODAwMDAwMDAwMDAwMFVMTDsKIGNvbnN0IGxvbmcgbG9u
ZyBERl9TTmFOID0gICAgICAgICAgICAgICAgIDB4N2ZmNzAwMDAwMDAwMDAwMFVMTDsKQEAgLTUz
Niw2ICs1MzcsMzMgQEAgc3RhdGljIHZvaWQgY2hlY2tfc2ZmaXh1cGQodm9pZCkKICAgICBjaGVj
azMyKHJlc3VsdCwgMHgxNDYwMDFkNik7CiB9CiAKK3N0YXRpYyB2b2lkIGNoZWNrX3NmZm1zKHZv
aWQpCit7CisgICAgaW50IHJlc3VsdDsKKworICAgIC8qIENoZWNrIHRoYXQgc2ZmbXMgcHJvcGVy
bHkgZGVhbHMgd2l0aCAtMCAqLworICAgIHJlc3VsdCA9IFNGX25lZ196ZXJvOworICAgIGFzbSAo
IiUwIC09IHNmbXB5KCUxICwgJTIpXG5cdCIKKyAgICAgICAgOiAiK3IiKHJlc3VsdCkKKyAgICAg
ICAgOiAiciIoU0ZfWkVSTyksICJyIihTRl9aRVJPKQorICAgICAgICA6ICJyMTIiLCAicjgiKTsK
KyAgICBjaGVjazMyKHJlc3VsdCwgU0ZfbmVnX3plcm8pOworCisgICAgcmVzdWx0ID0gU0ZfWkVS
TzsKKyAgICBhc20gKCIlMCAtPSBzZm1weSglMSAsICUyKVxuXHQiCisgICAgICAgIDogIityIihy
ZXN1bHQpCisgICAgICAgIDogInIiKFNGX25lZ196ZXJvKSwgInIiKFNGX1pFUk8pCisgICAgICAg
IDogInIxMiIsICJyOCIpOworICAgIGNoZWNrMzIocmVzdWx0LCBTRl9aRVJPKTsKKworICAgIHJl
c3VsdCA9IFNGX1pFUk87CisgICAgYXNtICgiJTAgLT0gc2ZtcHkoJTEgLCAlMilcblx0IgorICAg
ICAgICA6ICIrciIocmVzdWx0KQorICAgICAgICA6ICJyIihTRl9aRVJPKSwgInIiKFNGX25lZ196
ZXJvKQorICAgICAgICA6ICJyMTIiLCAicjgiKTsKKyAgICBjaGVjazMyKHJlc3VsdCwgU0ZfWkVS
Tyk7Cit9CisKIHN0YXRpYyB2b2lkIGNoZWNrX2Zsb2F0MmludF9jb252cygpCiB7CiAgICAgaW50
IHJlczMyOwpAQCAtNjg4LDYgKzcxNiw3IEBAIGludCBtYWluKCkKICAgICBjaGVja19pbnZzcXJ0
YSgpOwogICAgIGNoZWNrX3NmZml4dXBuKCk7CiAgICAgY2hlY2tfc2ZmaXh1cGQoKTsKKyAgICBj
aGVja19zZmZtcygpOwogICAgIGNoZWNrX2Zsb2F0MmludF9jb252cygpOwogCiAgICAgcHV0cyhl
cnIgPyAiRkFJTCIgOiAiUEFTUyIpOwotLSAKMi4xNy4xCgo=

