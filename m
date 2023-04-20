Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62886E88B0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:28:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKx0-0003la-Bm; Wed, 19 Apr 2023 23:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwt-0003hi-5B
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:27:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwn-0000Iw-T4
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:27:06 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K2etsJ021003; Thu, 20 Apr 2023 03:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GNT3n1LNNI426JlEIBdjoxcxegLBDnBG+9UqA/QTjeU=;
 b=Sc9W24hIjMRZZwoiG4OY9Y13zVMfJZBXteBiUjXiwyh1T/ScZPkPukliclusd2QPVLdK
 D8aIWmS/HpE3LXV8wvrfW2OPqhDBotCdWaEpx8cFPPIL+P+EshTshC/pMyynK4b1xq0I
 X3lujCTZCZBooUkPrjcYZJtZiA3Azbdh7EdaevowDm9TqYb+eNjcvI/OMHCfXW46Mzet
 ICzfzWgxgxMHkFL1Jp91LYymj0YnErlTov3O5nSlflfNYP4tgRRGlGfEBrNMj61jEDFP
 ZG5S4S0y71AEZvhq4smCM44r3BBH01qBycsN9d80dKFa0arSBO3eUaTQttXoHO/2pD7S sw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2ryq0eqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:49 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3MDPY014084; 
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3pyn0mktbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3QmKI018921;
 Thu, 20 Apr 2023 03:26:48 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33K3Qlk7018902
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 13EDC6A5; Wed, 19 Apr 2023 20:26:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 10/11] Hexagon (target/hexagon) Add overrides for
 cache/sync/barrier instructions
Date: Wed, 19 Apr 2023 20:26:33 -0700
Message-Id: <20230420032634.105311-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420032634.105311-1-tsimpson@quicinc.com>
References: <20230420032634.105311-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: x0yltJvNiDVZVKYoKKWod2bSHoVJHwW-
X-Proofpoint-GUID: x0yltJvNiDVZVKYoKKWod2bSHoVJHwW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=425 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200025
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

TW9zdCBvZiB0aGVzZSBhcmUgbm90IG1vZGVsbGVkIGluIFFFTVUsIHNvIHNhdmUgdGhlIG92ZXJo
ZWFkIG9mCmNhbGxpbmcgYSBoZWxwZXIuCgpUaGUgb25seSBleGNlcHRpb24gaXMgZGN6ZXJvYS4g
IEl0IGFzc2lnbnMgdG8gaGV4X2RjemVyb19hZGRyLCB3aGljaAppcyBoYW5kbGVkIGR1cmluZyBw
YWNrZXQgY29tbWl0LgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1
aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDQxMDIwMjQwMi4yODU2ODUyLTEtdHNp
bXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIHwgMjQgKysr
KysrKysrKysrKysrKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgfCAxOCArKysr
LS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0
L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IGIxODlmNzI1ZDcuLjMyOWU3YTEwMjQgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
LmgKQEAgLTQ4Nyw2ICs0ODcsMTkgQEAKICNkZWZpbmUgZkdFTl9UQ0dfUzJfc3RvcmVyaW5ld19w
Y3IoU0hPUlRDT0RFKSBcCiAgICAgZkdFTl9UQ0dfU1RPUkVfcGNyKDIsIGZTVE9SRSgxLCA0LCBF
QSwgTnROKSkKIAorLyogZGN6ZXJvYSBjbGVhcnMgdGhlIDMyIGJ5dGUgY2FjaGUgbGluZSBhdCB0
aGUgYWRkcmVzcyBnaXZlbiAqLworI2RlZmluZSBmR0VOX1RDR19ZMl9kY3plcm9hKFNIT1JUQ09E
RSkgU0hPUlRDT0RFCisKKy8qIEluIGxpbnV4LXVzZXIgbW9kZSwgdGhlc2UgYXJlIG5vdCBtb2Rl
bGxlZCwgc3VwcHJlc3MgY29tcGlsZXIgd2FybmluZyAqLworI2RlZmluZSBmR0VOX1RDR19ZMl9k
Y2ludmEoU0hPUlRDT0RFKSBcCisgICAgZG8geyBSc1YgPSBSc1Y7IH0gd2hpbGUgKDApCisjZGVm
aW5lIGZHRU5fVENHX1kyX2RjY2xlYW5pbnZhKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgUnNWID0g
UnNWOyB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19ZMl9kY2NsZWFuYShTSE9SVENPREUp
IFwKKyAgICBkbyB7IFJzViA9IFJzVjsgfSB3aGlsZSAoMCkKKyNkZWZpbmUgZkdFTl9UQ0dfWTJf
aWNpbnZhKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgUnNWID0gUnNWOyB9IHdoaWxlICgwKQorCiAv
KgogICogZGVhbGxvY19yZXR1cm4KICAqIEFzc2VtYmxlciBtYXBwZWQgdG8KQEAgLTEyMTEsNiAr
MTIyNCwxNyBAQAogICAgIGRvIHsgXAogICAgICAgICBSc1YgPSBSc1Y7IFwKICAgICB9IHdoaWxl
ICgwKQorI2RlZmluZSBmR0VOX1RDR19ZMl9pc3luYyhTSE9SVENPREUpIFwKKyAgICBkbyB7IH0g
d2hpbGUgKDApCisjZGVmaW5lIGZHRU5fVENHX1kyX2JhcnJpZXIoU0hPUlRDT0RFKSBcCisgICAg
ZG8geyB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19ZMl9zeW5jaHQoU0hPUlRDT0RFKSBc
CisgICAgZG8geyB9IHdoaWxlICgwKQorI2RlZmluZSBmR0VOX1RDR19ZMl9kY2ZldGNoYm8oU0hP
UlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAgIFJzViA9IFJzVjsgXAorICAgICAgICB1aVYg
PSB1aVY7IFwKKyAgICB9IHdoaWxlICgwKQogCiAjZGVmaW5lIGZHRU5fVENHX0oyX3RyYXAwKFNI
T1JUQ09ERSkgXAogICAgIGRvIHsgXApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vbWFjcm9z
LmggYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaAppbmRleCA5ZGRmYzkxYjFkLi4zZTE2MmRlM2E3
IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaAorKysgYi90YXJnZXQvaGV4YWdv
bi9tYWNyb3MuaApAQCAtNjU5LDIwICs2NTksMTAgQEAgc3RhdGljIGlubGluZSBUQ0d2IGdlbl9y
ZWFkX2lyZWcoVENHdiByZXN1bHQsIFRDR3YgdmFsLCBpbnQgc2hpZnQpCiAgICAgZkVYVFJBQ1RV
X0JJVFMoZW52LT5ncHJbSEVYX1JFR18jI1JFR10sIFwKICAgICAgICAgICAgICAgICAgICByZWdf
ZmllbGRfaW5mb1tGSUVMRF0ud2lkdGgsIFwKICAgICAgICAgICAgICAgICAgICByZWdfZmllbGRf
aW5mb1tGSUVMRF0ub2Zmc2V0KQotI2RlZmluZSBmQkFSUklFUigpCi0jZGVmaW5lIGZTWU5DSCgp
Ci0jZGVmaW5lIGZJU1lOQygpCi0jZGVmaW5lIGZEQ0ZFVENIKFJFRykgXAotICAgIGRvIHsgKHZv
aWQpUkVHOyB9IHdoaWxlICgwKSAvKiBOb3RoaW5nIHRvIGRvIGluIHFlbXUgKi8KLSNkZWZpbmUg
ZklDSU5WQShSRUcpIFwKLSAgICBkbyB7ICh2b2lkKVJFRzsgfSB3aGlsZSAoMCkgLyogTm90aGlu
ZyB0byBkbyBpbiBxZW11ICovCi0jZGVmaW5lIGZMMkZFVENIKEFERFIsIEhFSUdIVCwgV0lEVEgs
IFNUUklERSwgRkxBR1MpCi0jZGVmaW5lIGZEQ0NMRUFOQShSRUcpIFwKLSAgICBkbyB7ICh2b2lk
KVJFRzsgfSB3aGlsZSAoMCkgLyogTm90aGluZyB0byBkbyBpbiBxZW11ICovCi0jZGVmaW5lIGZE
Q0NMRUFOSU5WQShSRUcpIFwKLSAgICBkbyB7ICh2b2lkKVJFRzsgfSB3aGlsZSAoMCkgLyogTm90
aGluZyB0byBkbyBpbiBxZW11ICovCi0KLSNkZWZpbmUgZkRDWkVST0EoUkVHKSBkbyB7IGVudi0+
ZGN6ZXJvX2FkZHIgPSAoUkVHKTsgfSB3aGlsZSAoMCkKKworI2lmZGVmIFFFTVVfR0VORVJBVEUK
KyNkZWZpbmUgZkRDWkVST0EoUkVHKSB0Y2dfZ2VuX21vdl90bChoZXhfZGN6ZXJvX2FkZHIsIChS
RUcpKQorI2VuZGlmCiAKICNkZWZpbmUgZkJSQU5DSF9TUEVDVUxBVEVfU1RBTEwoRE9UTkVXVkFM
LCBKVU1QX0NPTkQsIFNQRUNfRElSLCBISU5UQklUTlVNLCBcCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFNUUkJJVE5VTSkgLyogTm90aGluZyAqLwotLSAKMi4yNS4xCgo=

