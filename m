Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0B6AD527
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXL-0000TT-5E; Mon, 06 Mar 2023 21:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXD-00007P-BM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNX9-0005n9-Q3
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:39 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3270o8bO029892; Tue, 7 Mar 2023 02:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=um2cRlrFGakU+1EuBzOdNvSGAD0XRrwvwgSnrmSqOiY=;
 b=JHFJhmdrotEgWc5QWUmwT+h3cEUOPquaL6X7qOACMPj4dVgDIK9chQlCquAbijeHL7dj
 cab90RIu7UP0z09RrhF8d5zgbN+wzInnurmQJ+4IX5IIz0XgXI6OY/2q0X0B9uM4uUUw
 JTVFmdMRYHnVruwg1Oc45VZFznbk2FpnEFy+D9hJjFMB2R7Zkyp1EoFAkI7KwJfTQyVx
 k37YpMJYqtfwyPgxQsPgAga1g8lalN4Iy9hM9vi/MCmWPamT2jvi+ILByxtURZ48NTYK
 /PyjCkJiOVvAxA67tcxYSpfcxxglBPCM0T/UoZxSYuMQOLwQ+FU0Wr5RlAJmzSazSSkX 0A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41916qp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272qODh016180; 
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3p4ffd3r7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wVb3022223;
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3272wUKi022221
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id C1B8F687; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 02/14] Hexagon (target/hexagon) Add overrides for callr
Date: Mon,  6 Mar 2023 18:58:16 -0800
Message-Id: <20230307025828.1612809-3-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: X2wGXtjqg3umStBdu1VB1DIepaPrdv_h
X-Proofpoint-GUID: X2wGXtjqg3umStBdu1VB1DIepaPrdv_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=701
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGxyCiAgICBKMl9jYWxscnQKICAgIEoyX2NhbGxy
ZgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0YXJnZXQvaGV4
YWdvbi9nZW5fdGNnLmggfCAgNiArKysrKysKIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICB8IDEy
ICstLS0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgIHwgMTggKysrKysrKysrKysr
KysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2cuaAppbmRleCA1ZjYxYzk1YjQwLi5mYTBkYmJlYzdkIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBAIC01
ODksMTEgKzU4OSwxNyBAQAogCiAjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGwoU0hPUlRDT0RFKSBc
CiAgICAgZ2VuX2NhbGwoY3R4LCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxyKFNIT1JU
Q09ERSkgXAorICAgIGdlbl9jYWxscihjdHgsIFJzVikKIAogI2RlZmluZSBmR0VOX1RDR19KMl9j
YWxsdChTSE9SVENPREUpIFwKICAgICBnZW5fY29uZF9jYWxsKGN0eCwgUHVWLCBUQ0dfQ09ORF9F
USwgcmlWKQogI2RlZmluZSBmR0VOX1RDR19KMl9jYWxsZihTSE9SVENPREUpIFwKICAgICBnZW5f
Y29uZF9jYWxsKGN0eCwgUHVWLCBUQ0dfQ09ORF9ORSwgcmlWKQorI2RlZmluZSBmR0VOX1RDR19K
Ml9jYWxscnQoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NvbmRfY2FsbHIoY3R4LCBUQ0dfQ09ORF9F
USwgUHVWLCBSc1YpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxyZihTSE9SVENPREUpIFwKKyAg
ICBnZW5fY29uZF9jYWxscihjdHgsIFRDR19DT05EX05FLCBQdVYsIFJzVikKIAogI2RlZmluZSBm
R0VOX1RDR19KMl9lbmRsb29wMChTSE9SVENPREUpIFwKICAgICBnZW5fZW5kbG9vcDAoY3R4KQpk
aWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQvaGV4YWdvbi9tYWNy
b3MuaAppbmRleCAxN2ZhY2FkYWFkLi42OTc0ZWY2YzllIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4
YWdvbi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApAQCAtMSw1ICsxLDUg
QEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENl
bnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDE5LTIw
MjMgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4K
ICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNDE1LDE2ICs0MTUsNiBA
QCBzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2YWws
IGludCBzaGlmdCkKICNkZWZpbmUgZkJSQU5DSChMT0MsIFRZUEUpICAgICAgICAgIGZXUklURV9O
UEMoTE9DKQogI2RlZmluZSBmSlVNUFIoUkVHTk8sIFRBUkdFVCwgVFlQRSkgZkJSQU5DSChUQVJH
RVQsIENPRl9UWVBFX0pVTVBSKQogI2RlZmluZSBmSElOVEpSKFRBUkdFVCkgeyAvKiBOb3QgbW9k
ZWxsZWQgaW4gcWVtdSAqL30KLSNkZWZpbmUgZkNBTEwoQSkgXAotICAgIGRvIHsgXAotICAgICAg
ICBmV1JJVEVfTFIoZlJFQURfTlBDKCkpOyBcCi0gICAgICAgIGZCUkFOQ0goQSwgQ09GX1RZUEVf
Q0FMTCk7IFwKLSAgICB9IHdoaWxlICgwKQotI2RlZmluZSBmQ0FMTFIoQSkgXAotICAgIGRvIHsg
XAotICAgICAgICBmV1JJVEVfTFIoZlJFQURfTlBDKCkpOyBcCi0gICAgICAgIGZCUkFOQ0goQSwg
Q09GX1RZUEVfQ0FMTFIpOyBcCi0gICAgfSB3aGlsZSAoMCkKICNkZWZpbmUgZldSSVRFX0xPT1Bf
UkVHUzAoU1RBUlQsIENPVU5UKSBcCiAgICAgZG8geyBcCiAgICAgICAgIFdSSVRFX1JSRUcoSEVY
X1JFR19MQzAsIENPVU5UKTsgIFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5j
IGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggMmJiZTRlM2E2OC4uNTkyNDM4ZjYxZSAx
MDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMKQEAgLTY4Miw2ICs2ODIsMTMgQEAgc3RhdGljIHZvaWQgZ2VuX2NhbGwoRGlzYXND
b250ZXh0ICpjdHgsIGludCBwY19vZmYpCiAgICAgZ2VuX3dyaXRlX25ld19wY19wY3JlbChjdHgs
IHBjX29mZiwgVENHX0NPTkRfQUxXQVlTLCBOVUxMKTsKIH0KIAorc3RhdGljIHZvaWQgZ2VuX2Nh
bGxyKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IG5ld19wYykKK3sKKyAgICBUQ0d2IG5leHRfUEMg
PSB0Y2dfY29uc3RhbnRfdGwoY3R4LT5uZXh0X1BDKTsKKyAgICBnZW5fbG9nX3JlZ193cml0ZShI
RVhfUkVHX0xSLCBuZXh0X1BDKTsKKyAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCBuZXdf
cGMsIFRDR19DT05EX0FMV0FZUywgTlVMTCk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jb25kX2Nh
bGwoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgcHJlZCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgVENHQ29uZCBjb25kLCBpbnQgcGNfb2ZmKQogewpAQCAtNjk3LDYgKzcwNCwxNyBAQCBzdGF0
aWMgdm9pZCBnZW5fY29uZF9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IHByZWQsCiAgICAg
Z2VuX3NldF9sYWJlbChza2lwKTsKIH0KIAorc3RhdGljIHZvaWQgZ2VuX2NvbmRfY2FsbHIoRGlz
YXNDb250ZXh0ICpjdHgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0dDb25kIGNvbmQs
IFRDR3YgcHJlZCwgVENHdiBuZXdfcGMpCit7CisgICAgVENHdiBsc2IgPSB0Y2dfdGVtcF9uZXco
KTsKKyAgICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICB0Y2dfZ2VuX2Fu
ZGlfdGwobHNiLCBwcmVkLCAxKTsKKyAgICB0Y2dfZ2VuX2JyY29uZGlfdGwoY29uZCwgbHNiLCAw
LCBza2lwKTsKKyAgICBnZW5fY2FsbHIoY3R4LCBuZXdfcGMpOworICAgIGdlbl9zZXRfbGFiZWwo
c2tpcCk7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9lbmRsb29wMChEaXNhc0NvbnRleHQgKmN0eCkK
IHsKICAgICBUQ0d2IGxwY2ZnID0gdGNnX3RlbXBfbmV3KCk7Ci0tIAoyLjI1LjEKCg==

