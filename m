Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A9D6AD526
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:59:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXJ-0000NG-0N; Mon, 06 Mar 2023 21:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXD-00007Q-BR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNX9-0005nA-Uy
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:39 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32712AWR017311; Tue, 7 Mar 2023 02:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vJQ25e6EUtORG/7Z4yT+OCoEqiC3Tz5DC/XNj5oOWX4=;
 b=ANeaA8WTZgCyaoLn/sXvhDa0i9rSBspaP9JP/6+LlKGt+axqDNAejyF8E71yZYpJuL58
 MTj0DEyJ1Xgzz/sRBdutJ0jzcEnifqW+kPwyL1JFPEZzqpcwWv1HgSVkW7rU496PTBAq
 5EhnlHM0aGuDvRkTIIKybmE8bIVkxfe4zqy58N3gL/2bSuzavwfvpVYAqOzU1528vOQP
 3LeHy/xooqrTDoVe68BdLdd9FVQeCtbrd1wb5oi2oZIXY6uyKlHQSWtet2xUvTe7fPpM
 qMnJuoj3TVYdhljBd4SdoF+9aIUyNk/g78hHagOYh/73+ZA66OSy1I3dDmvjxMReQwxH jQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5nkw8yy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:33 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272wWRZ023803; 
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsun8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272tILx020341;
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3272wV7t023789
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id DB0F9A79; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 11/14] Hexagon (target/hexagon) Change subtract from zero
 to change sign
Date: Mon,  6 Mar 2023 18:58:25 -0800
Message-Id: <20230307025828.1612809-12-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307025828.1612809-1-tsimpson@quicinc.com>
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NEgCNeKqokbuKAc99tK4r9KHAm2J4SEF
X-Proofpoint-ORIG-GUID: NEgCNeKqokbuKAc99tK4r9KHAm2J4SEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxlogscore=626 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070025
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
Y2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPgotLS0K
IHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICB8ICAyICstCiB0ZXN0cy90Y2cvaGV4YWdvbi9m
cHN0dWZmLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRl
eCAzOGI4YWVlMTkzLi45NDI1OTQxYzY5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9o
ZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtMTE2OSw3ICsxMTY5
LDcgQEAgZmxvYXQzMiBIRUxQRVIoc2ZmbXMpKENQVUhleGFnb25TdGF0ZSAqZW52LCBmbG9hdDMy
IFJ4ViwKIHsKICAgICBmbG9hdDMyIG5lZ19Sc1Y7CiAgICAgYXJjaF9mcG9wX3N0YXJ0KGVudik7
Ci0gICAgbmVnX1JzViA9IGZsb2F0MzJfc3ViKGZsb2F0MzJfemVybywgUnNWLCAmZW52LT5mcF9z
dGF0dXMpOworICAgIG5lZ19Sc1YgPSBmbG9hdDMyX3NldF9zaWduKFJzViwgZmxvYXQzMl9pc19u
ZWcoUnNWKSA/IDAgOiAxKTsKICAgICBSeFYgPSBpbnRlcm5hbF9mbWFmeChuZWdfUnNWLCBSdFYs
IFJ4ViwgMCwgJmVudi0+ZnBfc3RhdHVzKTsKICAgICBhcmNoX2Zwb3BfZW5kKGVudik7CiAgICAg
cmV0dXJuIFJ4VjsKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYyBiL3Rl
c3RzL3RjZy9oZXhhZ29uL2Zwc3R1ZmYuYwppbmRleCA1NmJmNTYyYTQwLi45MGNlOWE2ZWYzIDEw
MDY0NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9mcHN0dWZmLmMKKysrIGIvdGVzdHMvdGNnL2hl
eGFnb24vZnBzdHVmZi5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAy
MC0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMjAtMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRl
ciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0
IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVi
bGlzaGVkIGJ5CkBAIC00MCw2ICs0MCw3IEBAIGNvbnN0IGludCBTRl9IRVhfTkFOID0gICAgICAg
ICAgICAgICAgICAgIDB4ZmZmZmZmZmY7CiBjb25zdCBpbnQgU0Zfc21hbGxfbmVnID0gICAgICAg
ICAgICAgICAgICAweGFiOThmYmE4OwogY29uc3QgaW50IFNGX2Rlbm9ybSA9ICAgICAgICAgICAg
ICAgICAgICAgMHgwMDAwMDAwMTsKIGNvbnN0IGludCBTRl9yYW5kb20gPSAgICAgICAgICAgICAg
ICAgICAgIDB4MzQ2MDAxZDY7Citjb25zdCBpbnQgU0ZfbmVnX3plcm8gPSAgICAgICAgICAgICAg
ICAgICAweDgwMDAwMDAwOwogCiBjb25zdCBsb25nIGxvbmcgREZfUU5hTiA9ICAgICAgICAgICAg
ICAgICAweDdmZjgwMDAwMDAwMDAwMDBVTEw7CiBjb25zdCBsb25nIGxvbmcgREZfU05hTiA9ICAg
ICAgICAgICAgICAgICAweDdmZjcwMDAwMDAwMDAwMDBVTEw7CkBAIC01MzYsNiArNTM3LDMzIEBA
IHN0YXRpYyB2b2lkIGNoZWNrX3NmZml4dXBkKHZvaWQpCiAgICAgY2hlY2szMihyZXN1bHQsIDB4
MTQ2MDAxZDYpOwogfQogCitzdGF0aWMgdm9pZCBjaGVja19zZmZtcyh2b2lkKQoreworICAgIGlu
dCByZXN1bHQ7CisKKyAgICAvKiBDaGVjayB0aGF0IHNmZm1zIHByb3Blcmx5IGRlYWxzIHdpdGgg
LTAgKi8KKyAgICByZXN1bHQgPSBTRl9uZWdfemVybzsKKyAgICBhc20gKCIlMCAtPSBzZm1weSgl
MSAsICUyKVxuXHQiCisgICAgICAgIDogIityIihyZXN1bHQpCisgICAgICAgIDogInIiKFNGX1pF
Uk8pLCAiciIoU0ZfWkVSTykKKyAgICAgICAgOiAicjEyIiwgInI4Iik7CisgICAgY2hlY2szMihy
ZXN1bHQsIFNGX25lZ196ZXJvKTsKKworICAgIHJlc3VsdCA9IFNGX1pFUk87CisgICAgYXNtICgi
JTAgLT0gc2ZtcHkoJTEgLCAlMilcblx0IgorICAgICAgICA6ICIrciIocmVzdWx0KQorICAgICAg
ICA6ICJyIihTRl9uZWdfemVybyksICJyIihTRl9aRVJPKQorICAgICAgICA6ICJyMTIiLCAicjgi
KTsKKyAgICBjaGVjazMyKHJlc3VsdCwgU0ZfWkVSTyk7CisKKyAgICByZXN1bHQgPSBTRl9aRVJP
OworICAgIGFzbSAoIiUwIC09IHNmbXB5KCUxICwgJTIpXG5cdCIKKyAgICAgICAgOiAiK3IiKHJl
c3VsdCkKKyAgICAgICAgOiAiciIoU0ZfWkVSTyksICJyIihTRl9uZWdfemVybykKKyAgICAgICAg
OiAicjEyIiwgInI4Iik7CisgICAgY2hlY2szMihyZXN1bHQsIFNGX1pFUk8pOworfQorCiBzdGF0
aWMgdm9pZCBjaGVja19mbG9hdDJpbnRfY29udnMoKQogewogICAgIGludCByZXMzMjsKQEAgLTY4
OCw2ICs3MTYsNyBAQCBpbnQgbWFpbigpCiAgICAgY2hlY2tfaW52c3FydGEoKTsKICAgICBjaGVj
a19zZmZpeHVwbigpOwogICAgIGNoZWNrX3NmZml4dXBkKCk7CisgICAgY2hlY2tfc2ZmbXMoKTsK
ICAgICBjaGVja19mbG9hdDJpbnRfY29udnMoKTsKIAogICAgIHB1dHMoZXJyID8gIkZBSUwiIDog
IlBBU1MiKTsKLS0gCjIuMjUuMQoK

