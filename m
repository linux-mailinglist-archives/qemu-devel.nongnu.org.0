Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFB6EEB90
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTE4-0006mw-E6; Tue, 25 Apr 2023 20:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTE2-0006mV-JA
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTDs-00068K-V3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:37 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0f76R017859; Wed, 26 Apr 2023 00:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=qUt0C00iFUxjfps6D+GqcCf2BQve6Ef973E5/YCx+BI=;
 b=KOPVIJuEv+a0QJvUUA0Hk362xVoE4iTUu+Qej+ma3xO80LIfOpWndcemirNCJky3MAVD
 PY0PdUP5JK6tN1OKRwrgfxyp5+1Fnu7WFpX79C+WA5JfUqQyhZnPa5XmOcgZ4dONIMd7
 Ekf7li0Zpb1bB6ngtouyJq5MGQIRaZBWmQddPWCbuQCh4edcSanRR+V/W8jcLk5ZyFTZ
 rA20e3b/JRH6zzY31vIczQuT1gbOUsxVYU+KGjXSI6nMZnge6RPexkfLVYtrpF8c2Rxk
 fj5oCWip33lPlmfHfuLSGzStr81JIBBzvjCU1UeJIquGmegn8IwhQteaky1rDBCHCPoh rQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6fs2sfab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:25 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fPU9016585; 
 Wed, 26 Apr 2023 00:41:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q48nm4y7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:25 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fOTR016580;
 Wed, 26 Apr 2023 00:41:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33Q0fOto016579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:24 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 3D521532; Tue, 25 Apr 2023 17:41:24 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 03/21] Hexagon (target/hexagon) Add overrides for loop setup
 instructions
Date: Tue, 25 Apr 2023 17:41:21 -0700
Message-Id: <20230426004121.1318914-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 9fu21h5oS7w8D-eUPmxJa4_yZatn8oIm
X-Proofpoint-ORIG-GUID: 9fu21h5oS7w8D-eUPmxJa4_yZatn8oIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=417 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGhhdmUgaW1wbGljaXQgd3JpdGVzIHRvIHJlZ2lzdGVycywgc28g
d2UgZG9uJ3QKd2FudCB0aGVtIHRvIGJlIGhlbHBlcnMgd2hlbiBpZGVmLXBhcnNlciBpcyBvZmYu
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIHwgMjEgKysrKysrKysrKysrKysrKysrKwogdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmlu
ZGV4IDA2MGMxMWY2YzAuLjU3NzRhZjRhNTkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTY2Myw2ICs2NjMsMjcg
QEAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbHJmKFNIT1JUQ09ERSkgXAogICAgIGdlbl9jb25k
X2NhbGxyKGN0eCwgVENHX0NPTkRfTkUsIFB1ViwgUnNWKQogCisjZGVmaW5lIGZHRU5fVENHX0oy
X2xvb3AwcihTSE9SVENPREUpIFwKKyAgICBnZW5fbG9vcDByKGN0eCwgUnNWLCByaVYpCisjZGVm
aW5lIGZHRU5fVENHX0oyX2xvb3AxcihTSE9SVENPREUpIFwKKyAgICBnZW5fbG9vcDFyKGN0eCwg
UnNWLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2xvb3AwaShTSE9SVENPREUpIFwKKyAgICBn
ZW5fbG9vcDBpKGN0eCwgVWlWLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2xvb3AxaShTSE9S
VENPREUpIFwKKyAgICBnZW5fbG9vcDFpKGN0eCwgVWlWLCByaVYpCisjZGVmaW5lIGZHRU5fVENH
X0oyX3Bsb29wMXNyKFNIT1JUQ09ERSkgXAorICAgIGdlbl9wbG9vcE5zcihjdHgsIDEsIFJzViwg
cmlWKQorI2RlZmluZSBmR0VOX1RDR19KMl9wbG9vcDFzaShTSE9SVENPREUpIFwKKyAgICBnZW5f
cGxvb3BOc2koY3R4LCAxLCBVaVYsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfcGxvb3Ayc3Io
U0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNyKGN0eCwgMiwgUnNWLCByaVYpCisjZGVmaW5l
IGZHRU5fVENHX0oyX3Bsb29wMnNpKFNIT1JUQ09ERSkgXAorICAgIGdlbl9wbG9vcE5zaShjdHgs
IDIsIFVpViwgcmlWKQorI2RlZmluZSBmR0VOX1RDR19KMl9wbG9vcDNzcihTSE9SVENPREUpIFwK
KyAgICBnZW5fcGxvb3BOc3IoY3R4LCAzLCBSc1YsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJf
cGxvb3Azc2koU0hPUlRDT0RFKSBcCisgICAgZ2VuX3Bsb29wTnNpKGN0eCwgMywgVWlWLCByaVYp
CisKICNkZWZpbmUgZkdFTl9UQ0dfSjJfZW5kbG9vcDAoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2Vu
ZGxvb3AwKGN0eCkKICNkZWZpbmUgZkdFTl9UQ0dfSjJfZW5kbG9vcDEoU0hPUlRDT0RFKSBcCmRp
ZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCmluZGV4IDEyYzcyY2JhYzkuLjRjMzRkYTg0MDcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC01MTgsNiArNTE4
LDUwIEBAIHN0YXRpYyB2b2lkIGdlbl9jb21wYXJlKFRDR0NvbmQgY29uZCwgVENHdiByZXMsIFRD
R3YgYXJnMSwgVENHdiBhcmcyKQogICAgIHRjZ19nZW5fbW92Y29uZF90bChjb25kLCByZXMsIGFy
ZzEsIGFyZzIsIG9uZSwgemVybyk7CiB9CiAKKyNpZm5kZWYgQ09ORklHX0hFWEFHT05fSURFRl9Q
QVJTRVIKK3N0YXRpYyBpbmxpbmUgdm9pZCBnZW5fbG9vcDByKERpc2FzQ29udGV4dCAqY3R4LCBU
Q0d2IFJzViwgaW50IHJpVikKK3sKKyAgICBmSU1NRVhUKHJpVik7CisgICAgZlBDQUxJR04ocmlW
KTsKKyAgICBnZW5fbG9nX3JlZ193cml0ZShjdHgsIEhFWF9SRUdfTEMwLCBSc1YpOworICAgIGdl
bl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19TQTAsIHRjZ19jb25zdGFudF90bChjdHgtPnBr
dC0+cGMgKyByaVYpKTsKKyAgICBnZW5fc2V0X3Vzcl9maWVsZGkoY3R4LCBVU1JfTFBDRkcsIDAp
OworfQorCitzdGF0aWMgdm9pZCBnZW5fbG9vcDBpKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgY291
bnQsIGludCByaVYpCit7CisgICAgZ2VuX2xvb3AwcihjdHgsIHRjZ19jb25zdGFudF90bChjb3Vu
dCksIHJpVik7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBnZW5fbG9vcDFyKERpc2FzQ29udGV4
dCAqY3R4LCBUQ0d2IFJzViwgaW50IHJpVikKK3sKKyAgICBmSU1NRVhUKHJpVik7CisgICAgZlBD
QUxJR04ocmlWKTsKKyAgICBnZW5fbG9nX3JlZ193cml0ZShjdHgsIEhFWF9SRUdfTEMxLCBSc1Yp
OworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19TQTEsIHRjZ19jb25zdGFudF90
bChjdHgtPnBrdC0+cGMgKyByaVYpKTsKK30KKworc3RhdGljIHZvaWQgZ2VuX2xvb3AxaShEaXNh
c0NvbnRleHQgKmN0eCwgaW50IGNvdW50LCBpbnQgcmlWKQoreworICAgIGdlbl9sb29wMXIoY3R4
LCB0Y2dfY29uc3RhbnRfdGwoY291bnQpLCByaVYpOworfQorCitzdGF0aWMgdm9pZCBnZW5fcGxv
b3BOc3IoRGlzYXNDb250ZXh0ICpjdHgsIGludCBOLCBUQ0d2IFJzViwgaW50IHJpVikKK3sKKyAg
ICBmSU1NRVhUKHJpVik7CisgICAgZlBDQUxJR04ocmlWKTsKKyAgICBnZW5fbG9nX3JlZ193cml0
ZShjdHgsIEhFWF9SRUdfTEMwLCBSc1YpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVY
X1JFR19TQTAsIHRjZ19jb25zdGFudF90bChjdHgtPnBrdC0+cGMgKyByaVYpKTsKKyAgICBnZW5f
c2V0X3Vzcl9maWVsZGkoY3R4LCBVU1JfTFBDRkcsIE4pOworICAgIGdlbl9sb2dfcHJlZF93cml0
ZShjdHgsIDMsIHRjZ19jb25zdGFudF90bCgwKSk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9wbG9v
cE5zaShEaXNhc0NvbnRleHQgKmN0eCwgaW50IE4sIGludCBjb3VudCwgaW50IHJpVikKK3sKKyAg
ICBnZW5fcGxvb3BOc3IoY3R4LCBOLCB0Y2dfY29uc3RhbnRfdGwoY291bnQpLCByaVYpOworfQor
I2VuZGlmCisKIHN0YXRpYyB2b2lkIGdlbl9jb25kX2p1bXByKERpc2FzQ29udGV4dCAqY3R4LCBU
Q0d2IGRzdF9wYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR0NvbmQgY29uZCwgVENH
diBwcmVkKQogewotLSAKMi4yNS4xCgo=

