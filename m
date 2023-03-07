Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DB6AD6D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:36:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPye-0006nr-2P; Tue, 07 Mar 2023 00:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyP-0006Xq-IA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyK-0006ZF-08
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3274HpZE006325; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=48cMBzawn/IWTnsHw0eslJaVfMJmD6dZUGBz+USKKkU=;
 b=P7kChcugb12/mNbPoU7U0PXv9XVchP6K/GI0pjEHJVIPaPTNR8pYV/e6hIJ0En2FPWjC
 mGGdMUJOwBL2Y29AylIBucw8us4iewWjSe264GCmbxS8a1+J6cDZDUYwl8gbUD/TFNso
 qmOu55QBBMnm2Xow50G7mqbEEl4Ix2UbhtLY5sLJG9Pu5IxMpOM0/f5UZBG2Qwhg0NaC
 l2f5YJAwRAkrGkpPFYo+CYh3KFqvmyNdEPBHi/TlzU+8UHzwbROj5pOzJO/acloqt2kF
 VqSH6wq9DObnyV9M2s+n0xFUsEqIsEqtOMS7IIrS+IREwp4N1lO5MLLxj+3jtdzLuPlx nA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5ukn0fv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:45 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275Yi6K031927; 
 Tue, 7 Mar 2023 05:34:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3p4fg0ca7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275YhUE031911;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3275Yhq3031903
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 9295B6AB; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 06/17] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Date: Mon,  6 Mar 2023 21:34:27 -0800
Message-Id: <20230307053438.2416629-7-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: cyC1M6655rQZfW_VBdFLEPwxfoJzhLks
X-Proofpoint-GUID: cyC1M6655rQZfW_VBdFLEPwxfoJzhLks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=559 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIwMjMw
MzA3MDI1ODI4LjE2MTI4MDktNC10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4
YWdvbi9nZW5fdGNnLmggfCAgNCArKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8IDc4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
ODIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBi
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCBmYjIzZDU2ZDRhLi41YjcyNjNhODJjIDEw
MDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24v
Z2VuX3RjZy5oCkBAIC02MDMsNiArNjAzLDEwIEBACiAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfZW5k
bG9vcDAoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2VuZGxvb3AwKGN0eCkKKyNkZWZpbmUgZkdFTl9U
Q0dfSjJfZW5kbG9vcDEoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2VuZGxvb3AxKGN0eCkKKyNkZWZp
bmUgZkdFTl9UQ0dfSjJfZW5kbG9vcDAxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9lbmRsb29wMDEo
Y3R4KQogCiAvKgogICogQ29tcG91bmQgY29tcGFyZSBhbmQganVtcCBpbnN0cnVjdGlvbnMKZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMKaW5kZXggNTkyNDM4ZjYxZS4uZjcwMTdmZDQ4MyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTc3MCw2ICs3NzAs
ODQgQEAgc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AwKERpc2FzQ29udGV4dCAqY3R4KQogICAgIH0K
IH0KIAorc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AxKERpc2FzQ29udGV4dCAqY3R4KQoreworICAg
IC8qCisgICAgICogICAgaWYgKGhleF9ncHJbSEVYX1JFR19MQzFdID4gMSkgeworICAgICAqICAg
ICAgICBQQyA9IGhleF9ncHJbSEVYX1JFR19TQTFdOworICAgICAqICAgICAgICBoZXhfbmV3X3Zh
bHVlW0hFWF9SRUdfTEMxXSA9IGhleF9ncHJbSEVYX1JFR19MQzFdIC0gMTsKKyAgICAgKiAgICB9
CisgICAgICovCisgICAgVENHTGFiZWwgKmxhYmVsID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRj
Z19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9MRVUsIGhleF9ncHJbSEVYX1JFR19MQzFdLCAxLCBs
YWJlbCk7CisgICAgeworICAgICAgICBnZW5fanVtcHIoY3R4LCBoZXhfZ3ByW0hFWF9SRUdfU0Ex
XSk7CisgICAgICAgIHRjZ19nZW5fc3ViaV90bChoZXhfbmV3X3ZhbHVlW0hFWF9SRUdfTEMxXSwg
aGV4X2dwcltIRVhfUkVHX0xDMV0sIDEpOworICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVs
KTsKK30KKworc3RhdGljIHZvaWQgZ2VuX2VuZGxvb3AwMShEaXNhc0NvbnRleHQgKmN0eCkKK3sK
KyAgICBUQ0d2IGxwY2ZnID0gdGNnX3RlbXBfbmV3KCk7CisgICAgVENHTGFiZWwgKmxhYmVsMSA9
IGdlbl9uZXdfbGFiZWwoKTsKKyAgICBUQ0dMYWJlbCAqbGFiZWwyID0gZ2VuX25ld19sYWJlbCgp
OworICAgIFRDR0xhYmVsICpsYWJlbDMgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgVENHTGFiZWwg
KmRvbmUgPSBnZW5fbmV3X2xhYmVsKCk7CisKKyAgICBHRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywg
bHBjZmcpOworCisgICAgLyoKKyAgICAgKiAgICBpZiAobHBjZmcgPT0gMSkgeworICAgICAqICAg
ICAgICBoZXhfbmV3X3ByZWRfdmFsdWVbM10gPSAweGZmOworICAgICAqICAgICAgICBoZXhfcHJl
ZF93cml0dGVuIHw9IDEgPDwgMzsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgdGNnX2dlbl9i
cmNvbmRpX3RsKFRDR19DT05EX05FLCBscGNmZywgMSwgbGFiZWwxKTsKKyAgICB7CisgICAgICAg
IHRjZ19nZW5fbW92aV90bChoZXhfbmV3X3ByZWRfdmFsdWVbM10sIDB4ZmYpOworICAgICAgICB0
Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0dGVuLCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IDMp
OworICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsMSk7CisKKyAgICAvKgorICAgICAqICAg
IGlmIChscGNmZykgeworICAgICAqICAgICAgICBTRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgbHBj
ZmcgLSAxKTsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRD
R19DT05EX0VRLCBscGNmZywgMCwgbGFiZWwyKTsKKyAgICB7CisgICAgICAgIHRjZ19nZW5fc3Vi
aV90bChscGNmZywgbHBjZmcsIDEpOworICAgICAgICBTRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywg
bHBjZmcpOworICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsMik7CisKKyAgICAvKgorICAg
ICAqICAgIGlmIChoZXhfZ3ByW0hFWF9SRUdfTEMwXSA+IDEpIHsKKyAgICAgKiAgICAgICAgUEMg
PSBoZXhfZ3ByW0hFWF9SRUdfU0EwXTsKKyAgICAgKiAgICAgICAgaGV4X25ld192YWx1ZVtIRVhf
UkVHX0xDMF0gPSBoZXhfZ3ByW0hFWF9SRUdfTEMwXSAtIDE7CisgICAgICogICAgfSBlbHNlIHsK
KyAgICAgKiAgICAgICAgaWYgKGhleF9ncHJbSEVYX1JFR19MQzFdID4gMSkgeworICAgICAqICAg
ICAgICAgICAgaGV4X25leHRfcGMgPSBoZXhfZ3ByW0hFWF9SRUdfU0ExXTsKKyAgICAgKiAgICAg
ICAgICAgIGhleF9uZXdfdmFsdWVbSEVYX1JFR19MQzFdID0gaGV4X2dwcltIRVhfUkVHX0xDMV0g
LSAxOworICAgICAqICAgICAgICB9CisgICAgICogICAgfQorICAgICAqLworICAgIHRjZ19nZW5f
YnJjb25kaV90bChUQ0dfQ09ORF9MRVUsIGhleF9ncHJbSEVYX1JFR19MQzBdLCAxLCBsYWJlbDMp
OworICAgIHsKKyAgICAgICAgZ2VuX2p1bXByKGN0eCwgaGV4X2dwcltIRVhfUkVHX1NBMF0pOwor
ICAgICAgICB0Y2dfZ2VuX3N1YmlfdGwoaGV4X25ld192YWx1ZVtIRVhfUkVHX0xDMF0sIGhleF9n
cHJbSEVYX1JFR19MQzBdLCAxKTsKKyAgICAgICAgdGNnX2dlbl9icihkb25lKTsKKyAgICB9Cisg
ICAgZ2VuX3NldF9sYWJlbChsYWJlbDMpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09O
RF9MRVUsIGhleF9ncHJbSEVYX1JFR19MQzFdLCAxLCBkb25lKTsKKyAgICB7CisgICAgICAgIGdl
bl9qdW1wcihjdHgsIGhleF9ncHJbSEVYX1JFR19TQTFdKTsKKyAgICAgICAgdGNnX2dlbl9zdWJp
X3RsKGhleF9uZXdfdmFsdWVbSEVYX1JFR19MQzFdLCBoZXhfZ3ByW0hFWF9SRUdfTEMxXSwgMSk7
CisgICAgfQorICAgIGdlbl9zZXRfbGFiZWwoZG9uZSk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9j
bXBfanVtcG52KERpc2FzQ29udGV4dCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
VENHQ29uZCBjb25kLCBUQ0d2IHZhbCwgVENHdiBzcmMsIGludCBwY19vZmYpCiB7Ci0tIAoyLjI1
LjEKCg==

