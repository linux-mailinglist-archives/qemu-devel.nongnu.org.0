Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC06F0EB4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:07:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAb7-0001iC-6v; Thu, 27 Apr 2023 19:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb5-0001hP-JN
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001Ko-OQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:19 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RN04t0011823; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rhclc67cuZ9C1rVd3J3O7z7QMFoVQRGw1cCrx0QRn+Q=;
 b=NBFAmShfd64teeJ9jiEHZaKUnJYrke9wgEp3ReHOfEhLm+sywo153YbV9Tci2SWfAXBN
 +CzzJM30YPA5n9tJFjvwF03NSDrsrRfFlpZlfwAbdsGiWyAuAwbyYKeIlY25u9HZCVWD
 CiUii/6WEwffMatEDXBY8pcIKCUUNpQ4f038caayjmoAmsVslGgEJEA9wXH1TJWutQJX
 ZOW4jjAQQWVktIfdEXrIVF+K3d6LE4MLgTdr9ZenexLtH/sSWehJkl3koqz0+jbQkBNb
 46ApwHLn0gvVo3H0nk+/qiHaKBEP6X6FBLJQ++N9jGWvc1t3gjJbag2VrdEu+pr3D4DP /A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7j4etda1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMviPZ023136; 
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3q48nmt3xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0Esi026444;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 33RN0Em7026426
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C24BA694; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 06/21] Hexagon (target/hexagon) Remove log_reg_write from
 op_helper.[ch]
Date: Thu, 27 Apr 2023 15:59:57 -0700
Message-Id: <20230427230012.3800327-7-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KdHsxMIv19Ri4H7qAvRUfI6ZMwhVoAnc
X-Proofpoint-GUID: KdHsxMIv19Ri4H7qAvRUfI6ZMwhVoAnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=652 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

V2l0aCB0aGUgb3ZlcnJpZGVzIGFkZGVkIGluIHByaW9yIGNvbW1pdHMsIHRoaXMgZnVuY3Rpb24g
aXMgbm90IHVzZWQKUmVtb3ZlIHJlZmVyZW5jZXMgaW4gbWFjcm9zLmgKClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFJpY2hh
cmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgotLS0KIHRhcmdldC9o
ZXhhZ29uL21hY3Jvcy5oICAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KIHRhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5oIHwgIDQgLS0tLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgfCAxNyAtLS0t
LS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCmlu
ZGV4IDJjYjA2NDdjZTIuLjk0YTY3NmZiZjkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCkBAIC0zNDMsMTAgKzM0Myw2IEBA
IHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVzdWx0LCBUQ0d2IHZhbCwg
aW50IHNoaWZ0KQogCiAjZGVmaW5lIGZSRUFEX0xSKCkgKGVudi0+Z3ByW0hFWF9SRUdfTFJdKQog
Ci0jZGVmaW5lIGZXUklURV9MUihBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19MUiwgQSkK
LSNkZWZpbmUgZldSSVRFX0ZQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX0ZQLCBBKQot
I2RlZmluZSBmV1JJVEVfU1AoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfU1AsIEEpCi0K
ICNkZWZpbmUgZlJFQURfU1AoKSAoZW52LT5ncHJbSEVYX1JFR19TUF0pCiAjZGVmaW5lIGZSRUFE
X0xDMCAoZW52LT5ncHJbSEVYX1JFR19MQzBdKQogI2RlZmluZSBmUkVBRF9MQzEgKGVudi0+Z3By
W0hFWF9SRUdfTEMxXSkKQEAgLTM3MSwxNiArMzY3LDYgQEAgc3RhdGljIGlubGluZSBUQ0d2IGdl
bl9yZWFkX2lyZWcoVENHdiByZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hpZnQpCiAjZGVmaW5lIGZC
UkFOQ0goTE9DLCBUWVBFKSAgICAgICAgICBmV1JJVEVfTlBDKExPQykKICNkZWZpbmUgZkpVTVBS
KFJFR05PLCBUQVJHRVQsIFRZUEUpIGZCUkFOQ0goVEFSR0VULCBDT0ZfVFlQRV9KVU1QUikKICNk
ZWZpbmUgZkhJTlRKUihUQVJHRVQpIHsgLyogTm90IG1vZGVsbGVkIGluIHFlbXUgKi99Ci0jZGVm
aW5lIGZXUklURV9MT09QX1JFR1MwKFNUQVJULCBDT1VOVCkgXAotICAgIGRvIHsgXAotICAgICAg
ICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19MQzAsIENPVU5UKTsgIFwKLSAgICAgICAgbG9n
X3JlZ193cml0ZShlbnYsIEhFWF9SRUdfU0EwLCBTVEFSVCk7IFwKLSAgICB9IHdoaWxlICgwKQot
I2RlZmluZSBmV1JJVEVfTE9PUF9SRUdTMShTVEFSVCwgQ09VTlQpIFwKLSAgICBkbyB7IFwKLSAg
ICAgICAgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTEMxLCBDT1VOVCk7ICBcCi0gICAgICAg
IGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX1NBMSwgU1RBUlQpO1wKLSAgICB9IHdoaWxlICgw
KQogCiAjZGVmaW5lIGZTRVRfT1ZFUkZMT1coKSBTRVRfVVNSX0ZJRUxEKFVTUl9PVkYsIDEpCiAj
ZGVmaW5lIGZTRVRfTFBDRkcoVkFMKSBTRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgKFZBTCkpCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuaCBiL3RhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5oCmluZGV4IGRiMjJiNTQ0MDEuLjZiZDRiMDc4NDkgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL29wX2hlbHBlci5oCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5oCkBA
IC0xOSwxNSArMTksMTEgQEAKICNkZWZpbmUgSEVYQUdPTl9PUF9IRUxQRVJfSAogCiAvKiBNaXNj
IGZ1bmN0aW9ucyAqLwotdm9pZCB3cml0ZV9uZXdfcGMoQ1BVSGV4YWdvblN0YXRlICplbnYsIGJv
b2wgcGt0X2hhc19tdWx0aV9jb2YsIHRhcmdldF91bG9uZyBhZGRyKTsKLQogdWludDhfdCBtZW1f
bG9hZDEoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQzMl90IHNsb3QsIHRhcmdldF91bG9uZyB2
YWRkcik7CiB1aW50MTZfdCBtZW1fbG9hZDIoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQzMl90
IHNsb3QsIHRhcmdldF91bG9uZyB2YWRkcik7CiB1aW50MzJfdCBtZW1fbG9hZDQoQ1BVSGV4YWdv
blN0YXRlICplbnYsIHVpbnQzMl90IHNsb3QsIHRhcmdldF91bG9uZyB2YWRkcik7CiB1aW50NjRf
dCBtZW1fbG9hZDgoQ1BVSGV4YWdvblN0YXRlICplbnYsIHVpbnQzMl90IHNsb3QsIHRhcmdldF91
bG9uZyB2YWRkcik7CiAKLXZvaWQgbG9nX3JlZ193cml0ZShDUFVIZXhhZ29uU3RhdGUgKmVudiwg
aW50IHJudW0sCi0gICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nIHZhbCk7CiB2b2lkIGxv
Z19zdG9yZTY0KENQVUhleGFnb25TdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgYWRkciwKICAgICAg
ICAgICAgICAgICAgaW50NjRfdCB2YWwsIGludCB3aWR0aCwgaW50IHNsb3QpOwogdm9pZCBsb2df
c3RvcmUzMihDUFVIZXhhZ29uU3RhdGUgKmVudiwgdGFyZ2V0X3Vsb25nIGFkZHIsCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jCmluZGV4IDNjYzcxYjY5ZDkuLjdlOWUzZjMwNWUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL29wX2hlbHBlci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCkBAIC01Miwy
MyArNTIsNiBAQCBHX05PUkVUVVJOIHZvaWQgSEVMUEVSKHJhaXNlX2V4Y2VwdGlvbikoQ1BVSGV4
YWdvblN0YXRlICplbnYsIHVpbnQzMl90IGV4Y3ApCiAgICAgZG9fcmFpc2VfZXhjZXB0aW9uX2Vy
cihlbnYsIGV4Y3AsIDApOwogfQogCi12b2lkIGxvZ19yZWdfd3JpdGUoQ1BVSGV4YWdvblN0YXRl
ICplbnYsIGludCBybnVtLAotICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YWwpCi17
Ci0gICAgSEVYX0RFQlVHX0xPRygibG9nX3JlZ193cml0ZVslZF0gPSAiIFRBUkdFVF9GTVRfbGQg
IiAoMHgiIFRBUkdFVF9GTVRfbHggIikiLAotICAgICAgICAgICAgICAgICAgcm51bSwgdmFsLCB2
YWwpOwotICAgIGlmICh2YWwgPT0gZW52LT5ncHJbcm51bV0pIHsKLSAgICAgICAgSEVYX0RFQlVH
X0xPRygiIE5PIENIQU5HRSIpOwotICAgIH0KLSAgICBIRVhfREVCVUdfTE9HKCJcbiIpOwotCi0g
ICAgZW52LT5uZXdfdmFsdWVbcm51bV0gPSB2YWw7Ci0gICAgaWYgKEhFWF9ERUJVRykgewotICAg
ICAgICAvKiBEbyB0aGlzIHNvIEhFTFBFUihkZWJ1Z19jb21taXRfZW5kKSB3aWxsIGtub3cgKi8K
LSAgICAgICAgZW52LT5yZWdfd3JpdHRlbltybnVtXSA9IDE7Ci0gICAgfQotfQotCiBzdGF0aWMg
dm9pZCBsb2dfcHJlZF93cml0ZShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IHBudW0sIHRhcmdl
dF91bG9uZyB2YWwpCiB7CiAgICAgSEVYX0RFQlVHX0xPRygibG9nX3ByZWRfd3JpdGVbJWRdID0g
IiBUQVJHRVRfRk1UX2xkCi0tIAoyLjI1LjEKCg==

