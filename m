Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2E6AD6DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyj-0006qa-Q2; Tue, 07 Mar 2023 00:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyR-0006bO-Qw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:56 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyL-0006Zm-Hk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:54 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3275B0tQ011833; Tue, 7 Mar 2023 05:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3U/xW3K02J7kyq8YaaLnNzWV6Bah1FteImhb1uyq3Fc=;
 b=QhL5Cmk4Io4wMxpRlmy/owXHtK+qPcCOKjKJcPBdI8pJm1QWwQF7aiXlorWmNFfo9RFM
 G9zH9tKMR/dEfflBOb9ZMSq6hbEQkl39FLot0AjXKKcQk2pY2M3or8OvgDG3IPX2Sv3L
 8ecrW2AwdvIRdoGNuWdAmGjkDLZng60xc8U974P3REOeIX4P6OoO88hVp49Y7z+4bJ7z
 bxaB9BgkBCuOUdPpkubjw/HfPURXspGq32nfY9sCdaG2O0ArZHVD4/b+A21PpVE8MfUj
 3/oLa8Rp3ZzR5zD7azkDPYA1rEp/yryPupLDlYozjraIgyy4kIFYoXU9MYHPGnOFKCqu KA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5usx0exx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:47 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275TVTL012156; 
 Tue, 7 Mar 2023 05:34:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsvd1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275TwNS012311;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3275YhvZ020224
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 901846A6; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 05/17] Hexagon (target/hexagon) Add overrides for callr
Date: Mon,  6 Mar 2023 21:34:26 -0800
Message-Id: <20230307053438.2416629-6-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jXtlOuTN9dLgI6JkL99YOCBDozK1dbfv
X-Proofpoint-GUID: jXtlOuTN9dLgI6JkL99YOCBDozK1dbfv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=517 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070049
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGxyCiAgICBKMl9jYWxscnQKICAgIEoyX2NhbGxy
ZgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIw
MjMwMzA3MDI1ODI4LjE2MTI4MDktMy10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQv
aGV4YWdvbi9nZW5fdGNnLmggfCAgNiArKysrKysKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICB8
IDEyICstLS0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgIHwgMTggKysrKysrKysr
KysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhh
Z29uL2dlbl90Y2cuaAppbmRleCBmODk4ZjViMzg5Li5mYjIzZDU2ZDRhIDEwMDY0NAotLS0gYS90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBA
IC01ODksMTEgKzU4OSwxNyBAQAogCiAjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGwoU0hPUlRDT0RF
KSBcCiAgICAgZ2VuX2NhbGwoY3R4LCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxyKFNI
T1JUQ09ERSkgXAorICAgIGdlbl9jYWxscihjdHgsIFJzVikKIAogI2RlZmluZSBmR0VOX1RDR19K
Ml9jYWxsdChTSE9SVENPREUpIFwKICAgICBnZW5fY29uZF9jYWxsKGN0eCwgUHVWLCBUQ0dfQ09O
RF9FUSwgcmlWKQogI2RlZmluZSBmR0VOX1RDR19KMl9jYWxsZihTSE9SVENPREUpIFwKICAgICBn
ZW5fY29uZF9jYWxsKGN0eCwgUHVWLCBUQ0dfQ09ORF9ORSwgcmlWKQorI2RlZmluZSBmR0VOX1RD
R19KMl9jYWxscnQoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbHIoY3R4LCBUQ0dfQ09O
RF9FUSwgUHVWLCBSc1YpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxyZihTSE9SVENPREUpIFwK
KyAgICBnZW5fY29uZF9jYWxscihjdHgsIFRDR19DT05EX05FLCBQdVYsIFJzVikKIAogI2RlZmlu
ZSBmR0VOX1RDR19KMl9lbmRsb29wMChTSE9SVENPREUpIFwKICAgICBnZW5fZW5kbG9vcDAoY3R4
KQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQvaGV4YWdvbi9t
YWNyb3MuaAppbmRleCAxN2ZhY2FkYWFkLi42OTc0ZWY2YzllIDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApAQCAtMSw1ICsx
LDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9u
IENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDE5
LTIwMjMgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZl
ZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0
cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNDE1LDE2ICs0MTUs
NiBAQCBzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2
YWwsIGludCBzaGlmdCkKICNkZWZpbmUgZkJSQU5DSChMT0MsIFRZUEUpICAgICAgICAgIGZXUklU
RV9OUEMoTE9DKQogI2RlZmluZSBmSlVNUFIoUkVHTk8sIFRBUkdFVCwgVFlQRSkgZkJSQU5DSChU
QVJHRVQsIENPRl9UWVBFX0pVTVBSKQogI2RlZmluZSBmSElOVEpSKFRBUkdFVCkgeyAvKiBOb3Qg
bW9kZWxsZWQgaW4gcWVtdSAqL30KLSNkZWZpbmUgZkNBTEwoQSkgXAotICAgIGRvIHsgXAotICAg
ICAgICBmV1JJVEVfTFIoZlJFQURfTlBDKCkpOyBcCi0gICAgICAgIGZCUkFOQ0goQSwgQ09GX1RZ
UEVfQ0FMTCk7IFwKLSAgICB9IHdoaWxlICgwKQotI2RlZmluZSBmQ0FMTFIoQSkgXAotICAgIGRv
IHsgXAotICAgICAgICBmV1JJVEVfTFIoZlJFQURfTlBDKCkpOyBcCi0gICAgICAgIGZCUkFOQ0go
QSwgQ09GX1RZUEVfQ0FMTFIpOyBcCi0gICAgfSB3aGlsZSAoMCkKICNkZWZpbmUgZldSSVRFX0xP
T1BfUkVHUzAoU1RBUlQsIENPVU5UKSBcCiAgICAgZG8geyBcCiAgICAgICAgIFdSSVRFX1JSRUco
SEVYX1JFR19MQzAsIENPVU5UKTsgIFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggMmJiZTRlM2E2OC4uNTkyNDM4ZjYx
ZSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMKQEAgLTY4Miw2ICs2ODIsMTMgQEAgc3RhdGljIHZvaWQgZ2VuX2NhbGwoRGlz
YXNDb250ZXh0ICpjdHgsIGludCBwY19vZmYpCiAgICAgZ2VuX3dyaXRlX25ld19wY19wY3JlbChj
dHgsIHBjX29mZiwgVENHX0NPTkRfQUxXQVlTLCBOVUxMKTsKIH0KIAorc3RhdGljIHZvaWQgZ2Vu
X2NhbGxyKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IG5ld19wYykKK3sKKyAgICBUQ0d2IG5leHRf
UEMgPSB0Y2dfY29uc3RhbnRfdGwoY3R4LT5uZXh0X1BDKTsKKyAgICBnZW5fbG9nX3JlZ193cml0
ZShIRVhfUkVHX0xSLCBuZXh0X1BDKTsKKyAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCBu
ZXdfcGMsIFRDR19DT05EX0FMV0FZUywgTlVMTCk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jb25k
X2NhbGwoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgcHJlZCwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVENHQ29uZCBjb25kLCBpbnQgcGNfb2ZmKQogewpAQCAtNjk3LDYgKzcwNCwxNyBAQCBz
dGF0aWMgdm9pZCBnZW5fY29uZF9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IHByZWQsCiAg
ICAgZ2VuX3NldF9sYWJlbChza2lwKTsKIH0KIAorc3RhdGljIHZvaWQgZ2VuX2NvbmRfY2FsbHIo
RGlzYXNDb250ZXh0ICpjdHgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0dDb25kIGNv
bmQsIFRDR3YgcHJlZCwgVENHdiBuZXdfcGMpCit7CisgICAgVENHdiBsc2IgPSB0Y2dfdGVtcF9u
ZXcoKTsKKyAgICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICB0Y2dfZ2Vu
X2FuZGlfdGwobHNiLCBwcmVkLCAxKTsKKyAgICB0Y2dfZ2VuX2JyY29uZGlfdGwoY29uZCwgbHNi
LCAwLCBza2lwKTsKKyAgICBnZW5fY2FsbHIoY3R4LCBuZXdfcGMpOworICAgIGdlbl9zZXRfbGFi
ZWwoc2tpcCk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9lbmRsb29wMChEaXNhc0NvbnRleHQgKmN0
eCkKIHsKICAgICBUQ0d2IGxwY2ZnID0gdGNnX3RlbXBfbmV3KCk7Ci0tIAoyLjI1LjEKCg==

