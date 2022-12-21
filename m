Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAF6538F9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mP-0007zv-Da; Wed, 21 Dec 2022 17:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p87mL-0007sU-5Q
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:37 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p87mI-0000kL-Pg
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:36 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLMfVIZ018180; Wed, 21 Dec 2022 22:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=c2buYTN3Ml36yDslMl7tX5zhBn2YGjjC8lpusQNObUE=;
 b=V1PPtE1dp/dAXbtY8lxoMPiOwLZBZsLxz9f3a3vcSPJzK1kEs5sWvYd/VZhJSPQgnG7I
 eHEI14XC7todyaDjc9KpPRjC3FOteJgn0axcgbABuwM4mJy8Sc6nFgb90cmcF21omLqO
 +Kf3CvVTIUDg4YWPpDOLj4P8/0UYx/sjvMEKI6t3bb2HrUaYF9gnJnxC0UDag8l++8n3
 SeyjzDCJkCbqp2hiJBAEvbycm3zlP1oUHq/0wk+K9ayHSHTkQ/iplIaCr713tUn/AyME
 XxH5nUoYoCRXTtR9co3CQh8UL3Bv7Vuk1WKB6l6WvIz7HA18edU7elJjuSjMwzclkWLE Xg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm2brs67u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 22:41:31 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BLMfUmF025811; 
 Wed, 21 Dec 2022 22:41:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3mh6um3yaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 21 Dec 2022 22:41:30 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLMfTEw025806;
 Wed, 21 Dec 2022 22:41:29 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 2BLMfTjM025693;
 Wed, 21 Dec 2022 22:41:29 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0B43F5000AE; Wed, 21 Dec 2022 14:41:29 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 2/4] Hexagon (target/hexagon) Add overrides for callr
Date: Wed, 21 Dec 2022 14:41:25 -0800
Message-Id: <20221221224127.20916-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221224127.20916-1-tsimpson@quicinc.com>
References: <20221221224127.20916-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Gg7TxknuV0FcxZLW5pORW0WUQlsfXFF0
X-Proofpoint-GUID: Gg7TxknuV0FcxZLW5pORW0WUQlsfXFF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_12,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=593 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210192
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
ZgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgot
LS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA2ICsrKysrKwogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggIHwgMTAgLS0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgIHwgMjAg
KysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIv
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IDNlZTUzMGY1ZDkuLjIzMTY1NGU2YzEgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmgKQEAgLTYxNCwxMSArNjE0LDE3IEBACiAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfY2Fs
bChTSE9SVENPREUpIFwKICAgICBnZW5fY2FsbChjdHgsIHJpVikKKyNkZWZpbmUgZkdFTl9UQ0df
SjJfY2FsbHIoU0hPUlRDT0RFKSBcCisgICAgZ2VuX2NhbGxyKGN0eCwgUnNWKQogCiAjZGVmaW5l
IGZHRU5fVENHX0oyX2NhbGx0KFNIT1JUQ09ERSkgXAogICAgIGdlbl9jb25kX2NhbGwoY3R4LCBQ
dVYsIFRDR19DT05EX0VRLCByaVYpCiAjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxmKFNIT1JUQ09E
RSkgXAogICAgIGdlbl9jb25kX2NhbGwoY3R4LCBQdVYsIFRDR19DT05EX05FLCByaVYpCisjZGVm
aW5lIGZHRU5fVENHX0oyX2NhbGxydChTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9jYWxscihj
dHgsIFRDR19DT05EX0VRLCBQdVYsIFJzVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbHJmKFNI
T1JUQ09ERSkgXAorICAgIGdlbl9jb25kX2NhbGxyKGN0eCwgVENHX0NPTkRfTkUsIFB1ViwgUnNW
KQogCiAjZGVmaW5lIGZHRU5fVENHX0oyX2VuZGxvb3AwKFNIT1JUQ09ERSkgXAogICAgIGdlbl9l
bmRsb29wMChjdHgpCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCBiL3Rhcmdl
dC9oZXhhZ29uL21hY3Jvcy5oCmluZGV4IGNkNjRiYjhlZWMuLmY2Y2MwZTk1MGMgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5oCisrKyBiL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5o
CkBAIC00MjEsMTYgKzQyMSw2IEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRD
R3YgcmVzdWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogI2RlZmluZSBmQlJBTkNIKExPQywgVFlQ
RSkgICAgICAgICAgZldSSVRFX05QQyhMT0MpCiAjZGVmaW5lIGZKVU1QUihSRUdOTywgVEFSR0VU
LCBUWVBFKSBmQlJBTkNIKFRBUkdFVCwgQ09GX1RZUEVfSlVNUFIpCiAjZGVmaW5lIGZISU5USlIo
VEFSR0VUKSB7IC8qIE5vdCBtb2RlbGxlZCBpbiBxZW11ICovfQotI2RlZmluZSBmQ0FMTChBKSBc
Ci0gICAgZG8geyBcCi0gICAgICAgIGZXUklURV9MUihmUkVBRF9OUEMoKSk7IFwKLSAgICAgICAg
ZkJSQU5DSChBLCBDT0ZfVFlQRV9DQUxMKTsgXAotICAgIH0gd2hpbGUgKDApCi0jZGVmaW5lIGZD
QUxMUihBKSBcCi0gICAgZG8geyBcCi0gICAgICAgIGZXUklURV9MUihmUkVBRF9OUEMoKSk7IFwK
LSAgICAgICAgZkJSQU5DSChBLCBDT0ZfVFlQRV9DQUxMUik7IFwKLSAgICB9IHdoaWxlICgwKQog
I2RlZmluZSBmV1JJVEVfTE9PUF9SRUdTMChTVEFSVCwgQ09VTlQpIFwKICAgICBkbyB7IFwKICAg
ICAgICAgV1JJVEVfUlJFRyhIRVhfUkVHX0xDMCwgQ09VTlQpOyAgXApkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCBlZTY3
Y2IwMDY5Li45ZTMxZjM0MThiIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwor
KysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtNjcwLDYgKzY3MCwxNCBAQCBzdGF0aWMg
dm9pZCBnZW5fY2FsbChEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBjX29mZikKICAgICBnZW5fd3Jp
dGVfbmV3X3BjX3BjcmVsKGN0eCwgcGNfb2ZmLCBUQ0dfQ09ORF9BTFdBWVMsIE5VTEwpOwogfQog
CitzdGF0aWMgdm9pZCBnZW5fY2FsbHIoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgbmV3X3BjKQor
eworICAgIFRDR3YgbmV4dF9QQyA9CisgICAgICAgIHRjZ19jb25zdGFudF90bChjdHgtPnBrdC0+
cGMgKyBjdHgtPnBrdC0+ZW5jb2RfcGt0X3NpemVfaW5fYnl0ZXMpOworICAgIGdlbl9sb2dfcmVn
X3dyaXRlKEhFWF9SRUdfTFIsIG5leHRfUEMpOworICAgIGdlbl93cml0ZV9uZXdfcGNfYWRkcihj
dHgsIG5ld19wYywgVENHX0NPTkRfQUxXQVlTLCBOVUxMKTsKK30KKwogc3RhdGljIHZvaWQgZ2Vu
X2NvbmRfY2FsbChEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBwcmVkLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICBUQ0dDb25kIGNvbmQsIGludCBwY19vZmYpCiB7CkBAIC02ODYsNiArNjk0LDE4
IEBAIHN0YXRpYyB2b2lkIGdlbl9jb25kX2NhbGwoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgcHJl
ZCwKICAgICBnZW5fc2V0X2xhYmVsKHNraXApOwogfQogCitzdGF0aWMgdm9pZCBnZW5fY29uZF9j
YWxscihEaXNhc0NvbnRleHQgKmN0eCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR0Nv
bmQgY29uZCwgVENHdiBwcmVkLCBUQ0d2IG5ld19wYykKK3sKKyAgICBUQ0d2IGxzYiA9IHRjZ190
ZW1wX25ldygpOworICAgIFRDR0xhYmVsICpza2lwID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRj
Z19nZW5fYW5kaV90bChsc2IsIHByZWQsIDEpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChjb25k
LCBsc2IsIDAsIHNraXApOworICAgIHRjZ190ZW1wX2ZyZWUobHNiKTsKKyAgICBnZW5fY2FsbHIo
Y3R4LCBuZXdfcGMpOworICAgIGdlbl9zZXRfbGFiZWwoc2tpcCk7Cit9CisKIHN0YXRpYyB2b2lk
IGdlbl9lbmRsb29wMChEaXNhc0NvbnRleHQgKmN0eCkKIHsKICAgICBUQ0d2IGxwY2ZnID0gdGNn
X3RlbXBfbG9jYWxfbmV3KCk7Ci0tIAoyLjE3LjEKCg==

