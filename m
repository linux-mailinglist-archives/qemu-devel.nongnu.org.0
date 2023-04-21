Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D66EAF7E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:50:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptx4-0005tI-72; Fri, 21 Apr 2023 12:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptx2-0005sk-GB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:36 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptwy-000443-N8
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:36 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LEoXhi012355; Fri, 21 Apr 2023 16:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FHe3f44LkutvmBXvMJkNPAZxuo0lFYUsVll1B1Hg3HA=;
 b=DD+IaysKr4fVd3Yw+aMfGss46bL90ZVH/Jpg1I2wxdHG7gsgW2lnRTXAGSls8WhNc+UY
 2a0u2U62Xq+z7+2k31dqH7P8g71uBEg29yNLlaWMtMXzGGC3SM2jJOEJNDEDu3QZLJo7
 rIypLb6eVO199ZnqnaUm6rYym4Y8xnjIaZlC7mjFMH8Ivq2k3WYpBwu7OXpBI4C6BWDq
 ZcgtPV9ZVbb5ijJCQfaTb/qGcClKOeUa35sROBbkhMAaZsuIkbgYDN2EZxumHy3sGJTr
 ON6lZnNfqEthqSj7ro0DSqELqFKAzJWpaa09+i+MPOky+TxjwBYGigItGVi+bGo/mmKC mQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3tmerk1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:28 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33LGnRq6014051; 
 Fri, 21 Apr 2023 16:49:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q2e9679nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:27 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33LGnR7K014039;
 Fri, 21 Apr 2023 16:49:27 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33LGnQrV014016
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:27 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 22EE3690; Fri, 21 Apr 2023 09:49:26 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL v2 05/10] Hexagon (target/hexagon) Merge arguments to
 probe_pkt_scalar_hvx_stores
Date: Fri, 21 Apr 2023 09:49:17 -0700
Message-Id: <20230421164922.3608183-6-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421164922.3608183-1-tsimpson@quicinc.com>
References: <20230421164922.3608183-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RopsADLV3_mqqUPiGgKneowqDg7rUlrs
X-Proofpoint-ORIG-GUID: RopsADLV3_mqqUPiGgKneowqDg7rUlrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=517 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210147
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

UmVkdWNpbmcgdGhlIG51bWJlciBvZiBhcmd1bWVudHMgcmVkdWNlcyB0aGUgb3ZlcmhlYWQgb2Yg
dGhlIGhlbHBlcgpjYWxsCgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QGxpbmFyby5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDQwNTE2NDIxMS4zMDAxNS0yLXRzaW1wc29u
QHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgIHwgIDQgKystLQog
dGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggfCAgMSArCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxw
ZXIuYyB8ICA0ICsrLS0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIHwgMTAgKysrKystLS0t
LQogNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oIGIvdGFyZ2V0L2hleGFnb24vaGVscGVy
LmgKaW5kZXggMzY4ZjBiNTcwOC4uZWQ3Zjk4NDJmNiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vaGVscGVyLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vaGVscGVyLmgKQEAgLTEsNSArMSw1IEBA
CiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50
ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIz
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAg
KgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTEwNyw0ICsxMDcsNCBAQCBE
RUZfSEVMUEVSXzIodndoaXN0MTI4cW0sIHZvaWQsIGVudiwgczMyKQogREVGX0hFTFBFUl80KHBy
b2JlX25vc2h1Zl9sb2FkLCB2b2lkLCBlbnYsIGkzMiwgaW50LCBpbnQpCiBERUZfSEVMUEVSXzIo
cHJvYmVfcGt0X3NjYWxhcl9zdG9yZV9zMCwgdm9pZCwgZW52LCBpbnQpCiBERUZfSEVMUEVSXzIo
cHJvYmVfaHZ4X3N0b3Jlcywgdm9pZCwgZW52LCBpbnQpCi1ERUZfSEVMUEVSXzMocHJvYmVfcGt0
X3NjYWxhcl9odnhfc3RvcmVzLCB2b2lkLCBlbnYsIGludCwgaW50KQorREVGX0hFTFBFUl8yKHBy
b2JlX3BrdF9zY2FsYXJfaHZ4X3N0b3Jlcywgdm9pZCwgZW52LCBpbnQpCmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCmlu
ZGV4IGRiODMyYjBmODguLjRiOWYyMWM0MWQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3Ry
YW5zbGF0ZS5oCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCkBAIC0xNzgsNSArMTc4
LDYgQEAgRklFTEQoUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBIQVNfU1QxLCAgICAgICAg
MSwgMSkKIEZJRUxEKFBST0JFX1BLVF9TQ0FMQVJfSFZYX1NUT1JFUywgSEFTX0hWWF9TVE9SRVMs
IDIsIDEpCiBGSUVMRChQUk9CRV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIFMwX0lTX1BSRUQsICAg
ICAzLCAxKQogRklFTEQoUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBTMV9JU19QUkVELCAg
ICAgNCwgMSkKK0ZJRUxEKFBST0JFX1BLVF9TQ0FMQVJfSFZYX1NUT1JFUywgTU1VX0lEWCwgICAg
ICAgIDUsIDIpCiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVy
LmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwppbmRleCBjOWExNTYwMzBlLi4wOTljMTEx
YThjIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYworKysgYi90YXJnZXQv
aGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtNDg4LDggKzQ4OCw3IEBAIHZvaWQgSEVMUEVSKHByb2Jl
X2h2eF9zdG9yZXMpKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQgbW11X2lkeCkKICAgICB9CiB9
CiAKLXZvaWQgSEVMUEVSKHByb2JlX3BrdF9zY2FsYXJfaHZ4X3N0b3JlcykoQ1BVSGV4YWdvblN0
YXRlICplbnYsIGludCBtYXNrLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnQgbW11X2lkeCkKK3ZvaWQgSEVMUEVSKHByb2JlX3BrdF9zY2FsYXJfaHZ4X3N0b3Jl
cykoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBtYXNrKQogewogICAgIGJvb2wgaGFzX3N0MCA9
IEZJRUxEX0VYMzIobWFzaywgUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBIQVNfU1QwKTsK
ICAgICBib29sIGhhc19zdDEgPSBGSUVMRF9FWDMyKG1hc2ssIFBST0JFX1BLVF9TQ0FMQVJfSFZY
X1NUT1JFUywgSEFTX1NUMSk7CkBAIC00OTcsNiArNDk2LDcgQEAgdm9pZCBIRUxQRVIocHJvYmVf
cGt0X3NjYWxhcl9odnhfc3RvcmVzKShDUFVIZXhhZ29uU3RhdGUgKmVudiwgaW50IG1hc2ssCiAg
ICAgICAgIEZJRUxEX0VYMzIobWFzaywgUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBIQVNf
SFZYX1NUT1JFUyk7CiAgICAgYm9vbCBzMF9pc19wcmVkID0gRklFTERfRVgzMihtYXNrLCBQUk9C
RV9QS1RfU0NBTEFSX0hWWF9TVE9SRVMsIFMwX0lTX1BSRUQpOwogICAgIGJvb2wgczFfaXNfcHJl
ZCA9IEZJRUxEX0VYMzIobWFzaywgUFJPQkVfUEtUX1NDQUxBUl9IVlhfU1RPUkVTLCBTMV9JU19Q
UkVEKTsKKyAgICBpbnQgbW11X2lkeCA9IEZJRUxEX0VYMzIobWFzaywgUFJPQkVfUEtUX1NDQUxB
Ul9IVlhfU1RPUkVTLCBNTVVfSURYKTsKIAogICAgIGlmIChoYXNfc3QwKSB7CiAgICAgICAgIHBy
b2JlX3N0b3JlKGVudiwgMCwgbW11X2lkeCwgczBfaXNfcHJlZCk7CmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4
IDU4ZDYzOGY3MzQuLmMwODdmMTgzZDAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5z
bGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC04MDgsMTMgKzgwOCwx
MSBAQCBzdGF0aWMgdm9pZCBnZW5fY29tbWl0X3BhY2tldChEaXNhc0NvbnRleHQgKmN0eCkKICAg
ICAgICAgZ19hc3NlcnQoIWhhc19zdG9yZV9zMSAmJiAhaGFzX2h2eF9zdG9yZSk7CiAgICAgICAg
IHByb2Nlc3NfZGN6ZXJvYShjdHgpOwogICAgIH0gZWxzZSBpZiAoaGFzX2h2eF9zdG9yZSkgewot
ICAgICAgICBUQ0d2IG1lbV9pZHggPSB0Y2dfY29uc3RhbnRfdGwoY3R4LT5tZW1faWR4KTsKLQog
ICAgICAgICBpZiAoIWhhc19zdG9yZV9zMCAmJiAhaGFzX3N0b3JlX3MxKSB7CisgICAgICAgICAg
ICBUQ0d2IG1lbV9pZHggPSB0Y2dfY29uc3RhbnRfdGwoY3R4LT5tZW1faWR4KTsKICAgICAgICAg
ICAgIGdlbl9oZWxwZXJfcHJvYmVfaHZ4X3N0b3JlcyhjcHVfZW52LCBtZW1faWR4KTsKICAgICAg
ICAgfSBlbHNlIHsKICAgICAgICAgICAgIGludCBtYXNrID0gMDsKLSAgICAgICAgICAgIFRDR3Yg
bWFza190Y2d2OwogCiAgICAgICAgICAgICBpZiAoaGFzX3N0b3JlX3MwKSB7CiAgICAgICAgICAg
ICAgICAgbWFzayA9CkBAIC04MzksOCArODM3LDEwIEBAIHN0YXRpYyB2b2lkIGdlbl9jb21taXRf
cGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQogICAgICAgICAgICAgICAgICAgICBGSUVMRF9EUDMy
KG1hc2ssIFBST0JFX1BLVF9TQ0FMQVJfSFZYX1NUT1JFUywKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBTMV9JU19QUkVELCAxKTsKICAgICAgICAgICAgIH0KLSAgICAgICAgICAgIG1h
c2tfdGNndiA9IHRjZ19jb25zdGFudF90bChtYXNrKTsKLSAgICAgICAgICAgIGdlbl9oZWxwZXJf
cHJvYmVfcGt0X3NjYWxhcl9odnhfc3RvcmVzKGNwdV9lbnYsIG1hc2tfdGNndiwgbWVtX2lkeCk7
CisgICAgICAgICAgICBtYXNrID0gRklFTERfRFAzMihtYXNrLCBQUk9CRV9QS1RfU0NBTEFSX0hW
WF9TVE9SRVMsIE1NVV9JRFgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHgtPm1l
bV9pZHgpOworICAgICAgICAgICAgZ2VuX2hlbHBlcl9wcm9iZV9wa3Rfc2NhbGFyX2h2eF9zdG9y
ZXMoY3B1X2VudiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRjZ19jb25zdGFudF90bChtYXNrKSk7CiAgICAgICAgIH0KICAgICB9IGVsc2UgaWYg
KGhhc19zdG9yZV9zMCAmJiBoYXNfc3RvcmVfczEpIHsKICAgICAgICAgLyoKLS0gCjIuMjUuMQoK

