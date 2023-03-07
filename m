Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CE6AD6D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyc-0006mf-3R; Tue, 07 Mar 2023 00:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyP-0006Xp-9l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyK-0006ZB-0Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32750w3R010154; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=puiRbiKy0IM42b1U5NPnr63oIWRxYWdR5tMCWDcX3FA=;
 b=AcFU5edXb9ai7PF5h3dfok8P+97tyc92Cl0VevwQPu7VCgycMzZSt8Ul39gpY9wykSwO
 XgSmBdigkn8fKWK95l0a1uYlkLmc+EJtBdOKFc/lYTYXiFy21lik+ddwCqAMfYAdXedI
 G53ZLJkM/rTTxDa9p1v3iBvbd67GoUwxIvqpkxSx08kft0eWQEwTxz4x81t26WLlYeyf
 nsN/Pgzciqlhs/3NXnbBt4L/F9CsiFXGRoQFYbtKzZWc2QAiinH2mVB/axuqMBySmt4G
 3gcRVs3qygdBzXufmWHpbLSYPLP3aeWRo/MzTOL+av9GwkPO9pjtPS8WxxR6e/ZUGj8Y iA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5xrb8250-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:45 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275YihP020269; 
 Tue, 7 Mar 2023 05:34:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsvd1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275Yh7u020248;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3275Yhod020227
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A7524A84; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 14/17] Hexagon (target/hexagon) Change subtract from zero to
 change sign
Date: Mon,  6 Mar 2023 21:34:35 -0800
Message-Id: <20230307053438.2416629-15-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ERBcmUZvXQ2q9cEzKueQjXg6wA28XOXh
X-Proofpoint-GUID: ERBcmUZvXQ2q9cEzKueQjXg6wA28XOXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=442
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070050
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

VGhlIEYyX3NmZm1zIGluc3RydWN0aW9uIFtyMCAtPSBzZm1weShyMSwgcjIpXSBkb2Vzbid0IHBy
b3Blcmx5CmhhbmRsZSAtMC4gIFByZXZpb3VzbHkgd2Ugd291bGQgbmVnYXRlIHRoZSBpbnB1dCBv
cGVyYW5kIGJ5IHN1YnRyYWN0aW5nCmZyb20gemVyby4gIEluc3RlYWQsIHdlIG5lZ2F0ZSBieSBj
aGFuZ2luZyB0aGUgc2lnbiBiaXQuCgpUZXN0IGNhc2UgYWRkZWQgdG8gdGVzdHMvdGNnL2hleGFn
b24vZnBzdHVmZi5jCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVp
Y2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPgpNZXNz
YWdlLUlkOiA8MjAyMzAzMDcwMjU4MjguMTYxMjgwOS0xMi10c2ltcHNvbkBxdWljaW5jLmNvbT4K
LS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgfCAgMiArLQogdGVzdHMvdGNnL2hleGFn
b24vZnBzdHVmZi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMK
aW5kZXggMzhiOGFlZTE5My4uOTQyNTk0MWM2OSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
b3BfaGVscGVyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMKQEAgLTExNjksNyAr
MTE2OSw3IEBAIGZsb2F0MzIgSEVMUEVSKHNmZm1zKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgZmxv
YXQzMiBSeFYsCiB7CiAgICAgZmxvYXQzMiBuZWdfUnNWOwogICAgIGFyY2hfZnBvcF9zdGFydChl
bnYpOwotICAgIG5lZ19Sc1YgPSBmbG9hdDMyX3N1YihmbG9hdDMyX3plcm8sIFJzViwgJmVudi0+
ZnBfc3RhdHVzKTsKKyAgICBuZWdfUnNWID0gZmxvYXQzMl9zZXRfc2lnbihSc1YsIGZsb2F0MzJf
aXNfbmVnKFJzVikgPyAwIDogMSk7CiAgICAgUnhWID0gaW50ZXJuYWxfZm1hZngobmVnX1JzViwg
UnRWLCBSeFYsIDAsICZlbnYtPmZwX3N0YXR1cyk7CiAgICAgYXJjaF9mcG9wX2VuZChlbnYpOwog
ICAgIHJldHVybiBSeFY7CmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMg
Yi90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMKaW5kZXggNTZiZjU2MmE0MC4uOTBjZTlhNmVm
MyAxMDA2NDQKLS0tIGEvdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jCisrKyBiL3Rlc3RzL3Rj
Zy9oZXhhZ29uL2Zwc3R1ZmYuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMp
IDIwMjAtMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJl
c2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDIwLTIwMjMgUXVhbGNvbW0gSW5ub3ZhdGlvbiBD
ZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAq
ICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieQpAQCAtNDAsNiArNDAsNyBAQCBjb25zdCBpbnQgU0ZfSEVYX05BTiA9ICAg
ICAgICAgICAgICAgICAgICAweGZmZmZmZmZmOwogY29uc3QgaW50IFNGX3NtYWxsX25lZyA9ICAg
ICAgICAgICAgICAgICAgMHhhYjk4ZmJhODsKIGNvbnN0IGludCBTRl9kZW5vcm0gPSAgICAgICAg
ICAgICAgICAgICAgIDB4MDAwMDAwMDE7CiBjb25zdCBpbnQgU0ZfcmFuZG9tID0gICAgICAgICAg
ICAgICAgICAgICAweDM0NjAwMWQ2OworY29uc3QgaW50IFNGX25lZ196ZXJvID0gICAgICAgICAg
ICAgICAgICAgMHg4MDAwMDAwMDsKIAogY29uc3QgbG9uZyBsb25nIERGX1FOYU4gPSAgICAgICAg
ICAgICAgICAgMHg3ZmY4MDAwMDAwMDAwMDAwVUxMOwogY29uc3QgbG9uZyBsb25nIERGX1NOYU4g
PSAgICAgICAgICAgICAgICAgMHg3ZmY3MDAwMDAwMDAwMDAwVUxMOwpAQCAtNTM2LDYgKzUzNywz
MyBAQCBzdGF0aWMgdm9pZCBjaGVja19zZmZpeHVwZCh2b2lkKQogICAgIGNoZWNrMzIocmVzdWx0
LCAweDE0NjAwMWQ2KTsKIH0KIAorc3RhdGljIHZvaWQgY2hlY2tfc2ZmbXModm9pZCkKK3sKKyAg
ICBpbnQgcmVzdWx0OworCisgICAgLyogQ2hlY2sgdGhhdCBzZmZtcyBwcm9wZXJseSBkZWFscyB3
aXRoIC0wICovCisgICAgcmVzdWx0ID0gU0ZfbmVnX3plcm87CisgICAgYXNtICgiJTAgLT0gc2Zt
cHkoJTEgLCAlMilcblx0IgorICAgICAgICA6ICIrciIocmVzdWx0KQorICAgICAgICA6ICJyIihT
Rl9aRVJPKSwgInIiKFNGX1pFUk8pCisgICAgICAgIDogInIxMiIsICJyOCIpOworICAgIGNoZWNr
MzIocmVzdWx0LCBTRl9uZWdfemVybyk7CisKKyAgICByZXN1bHQgPSBTRl9aRVJPOworICAgIGFz
bSAoIiUwIC09IHNmbXB5KCUxICwgJTIpXG5cdCIKKyAgICAgICAgOiAiK3IiKHJlc3VsdCkKKyAg
ICAgICAgOiAiciIoU0ZfbmVnX3plcm8pLCAiciIoU0ZfWkVSTykKKyAgICAgICAgOiAicjEyIiwg
InI4Iik7CisgICAgY2hlY2szMihyZXN1bHQsIFNGX1pFUk8pOworCisgICAgcmVzdWx0ID0gU0Zf
WkVSTzsKKyAgICBhc20gKCIlMCAtPSBzZm1weSglMSAsICUyKVxuXHQiCisgICAgICAgIDogIity
IihyZXN1bHQpCisgICAgICAgIDogInIiKFNGX1pFUk8pLCAiciIoU0ZfbmVnX3plcm8pCisgICAg
ICAgIDogInIxMiIsICJyOCIpOworICAgIGNoZWNrMzIocmVzdWx0LCBTRl9aRVJPKTsKK30KKwog
c3RhdGljIHZvaWQgY2hlY2tfZmxvYXQyaW50X2NvbnZzKCkKIHsKICAgICBpbnQgcmVzMzI7CkBA
IC02ODgsNiArNzE2LDcgQEAgaW50IG1haW4oKQogICAgIGNoZWNrX2ludnNxcnRhKCk7CiAgICAg
Y2hlY2tfc2ZmaXh1cG4oKTsKICAgICBjaGVja19zZmZpeHVwZCgpOworICAgIGNoZWNrX3NmZm1z
KCk7CiAgICAgY2hlY2tfZmxvYXQyaW50X2NvbnZzKCk7CiAKICAgICBwdXRzKGVyciA/ICJGQUlM
IiA6ICJQQVNTIik7Ci0tIAoyLjI1LjEKCg==

