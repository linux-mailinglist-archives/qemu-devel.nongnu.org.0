Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB106EEC65
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 04:33:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prUw7-0002kh-GY; Tue, 25 Apr 2023 22:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvX-0002eP-Mr
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvU-000296-0a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:39 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PLCje8007132; Wed, 26 Apr 2023 02:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z6CdSo3WfD2cTeRn/Rq2e5A2BL3OKRFGzyTrONtXyW8=;
 b=erCTl5PX9Ehm9QKOi/+oNt6J7WVMYVcwilnhJFn00wmqgTL12dKg2HwmPF44Bu/4BIXO
 UwaosTFs7HQS82w/bERtysxGaycrwJWqV72YITXV5GtcboyoIF778ja1x4qQ1lJdfBQL
 +l23JQDaVp7ReMXJqbidlgig3901oWra7CmJ+XDQ7bt+CyLlV2Wxnu41HK0rrxIpSSRL
 BXu3mgkgoXhafnoXt5Dv4hH3d8D30jDa0yszRDplKfl1QTmBHJIOSX063laTZm+TTlIB
 oS018RVw/pFrR5SknQ+O5Q6cRw56RxLnsIo+cnt2m1OFQo8HpNQUmTI3xJGC31lQ0zam dQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6brdtc41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:22 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q2ULtb015845; 
 Wed, 26 Apr 2023 02:30:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmddq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q2ULex015824;
 Wed, 26 Apr 2023 02:30:21 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q2UKeI015814
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id AD5E36A5; Tue, 25 Apr 2023 19:30:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 8/9] Hexagon (target/hexagon) Add v73 scalar instructions
Date: Tue, 25 Apr 2023 19:30:17 -0700
Message-Id: <20230426023018.1742266-9-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426023018.1742266-1-tsimpson@quicinc.com>
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uwlfPbdVpi1tK6XZA49d-mWyNMlsKELD
X-Proofpoint-GUID: uwlfPbdVpi1tK6XZA49d-mWyNMlsKELD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=632 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260020
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

VGhlIGZvbGxvd2luZyBpbnN0cnVjdGlvbnMgYXJlIGFkZGVkCiAgICBKMl9jYWxscmgKICAgIEoy
X2p1bnByaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAgICAgICAgICAgfCA0ICsrKysK
IHRhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jICAgICAgfCAxICsKIHRhcmdldC9oZXhh
Z29uL2ltcG9ydGVkL2JyYW5jaC5pZGVmICAgfCA3ICsrKysrKy0KIHRhcmdldC9oZXhhZ29uL2lt
cG9ydGVkL2VuY29kZV9wcC5kZWYgfCAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNn
LmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggNTk4ZDgwZDNjZS4uNmYxMmY2NjVk
YiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3RhcmdldC9oZXhh
Z29uL2dlbl90Y2cuaApAQCAtNjUzLDYgKzY1Myw4IEBACiAgICAgZ2VuX2NhbGwoY3R4LCByaVYp
CiAjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxyKFNIT1JUQ09ERSkgXAogICAgIGdlbl9jYWxscihj
dHgsIFJzVikKKyNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbHJoKFNIT1JUQ09ERSkgXAorICAgIGdl
bl9jYWxscihjdHgsIFJzVikKIAogI2RlZmluZSBmR0VOX1RDR19KMl9jYWxsdChTSE9SVENPREUp
IFwKICAgICBnZW5fY29uZF9jYWxsKGN0eCwgUHVWLCBUQ0dfQ09ORF9FUSwgcmlWKQpAQCAtODUx
LDYgKzg1Myw4IEBACiAgICAgZ2VuX2p1bXAoY3R4LCByaVYpCiAjZGVmaW5lIGZHRU5fVENHX0oy
X2p1bXByKFNIT1JUQ09ERSkgXAogICAgIGdlbl9qdW1wcihjdHgsIFJzVikKKyNkZWZpbmUgZkdF
Tl9UQ0dfSjJfanVtcHJoKFNIT1JUQ09ERSkgXAorICAgIGdlbl9qdW1wcihjdHgsIFJzVikKICNk
ZWZpbmUgZkdFTl9UQ0dfSjRfanVtcHNldGkoU0hPUlRDT0RFKSBcCiAgICAgZG8geyBcCiAgICAg
ICAgIHRjZ19nZW5fbW92aV90bChSZFYsIFVpVik7IFwKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL2F0dHJpYnNfZGVmLmguaW5jIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMK
aW5kZXggM2JlZjYwYmVmMy4uNjlkYTk3NzZmMCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
YXR0cmlic19kZWYuaC5pbmMKKysrIGIvdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMK
QEAgLTg5LDYgKzg5LDcgQEAgREVGX0FUVFJJQihKVU1QLCAiSnVtcC10eXBlIGluc3RydWN0aW9u
IiwgIiIsICIiKQogREVGX0FUVFJJQihJTkRJUkVDVCwgIkFic29sdXRlIHJlZ2lzdGVyIGp1bXAi
LCAiIiwgIiIpCiBERUZfQVRUUklCKENBTEwsICJGdW5jdGlvbiBjYWxsIGluc3RydWN0aW9uIiwg
IiIsICIiKQogREVGX0FUVFJJQihDT0YsICJDaGFuZ2Utb2YtZmxvdyBpbnN0cnVjdGlvbiIsICIi
LCAiIikKK0RFRl9BVFRSSUIoSElOVEVEX0NPRiwgIlRoaXMgaW5zdHJ1Y3Rpb24gaXMgYSBoaW50
ZWQgY2hhbmdlLW9mLWZsb3ciLCAiIiwgIiIpCiBERUZfQVRUUklCKENPTkRFWEVDLCAiTWF5IGJl
IGNhbmNlbGxlZCBieSBhIHByZWRpY2F0ZSIsICIiLCAiIikKIERFRl9BVFRSSUIoRE9UTkVXVkFM
VUUsICJVc2VzIGEgcmVnaXN0ZXIgdmFsdWUgZ2VuZXJhdGVkIGluIHRoaXMgcGt0IiwgIiIsICIi
KQogREVGX0FUVFJJQihORVdDTVBKVU1QLCAiQ29tcG91bmQgY29tcGFyZSBhbmQganVtcCIsICIi
LCAiIikKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2JyYW5jaC5pZGVmIGIv
dGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvYnJhbmNoLmlkZWYKaW5kZXggODhmNWY0OGNjZS4uOTNl
MmUzNzVhNSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvYnJhbmNoLmlkZWYK
KysrIGIvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvYnJhbmNoLmlkZWYKQEAgLTEsNSArMSw1IEBA
CiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50
ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIz
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAg
KgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTM0LDYgKzM0LDkgQEAgUTZJ
TlNOKEoyX2p1bXAsImp1bXAgI3IyMjoyIixBVFRSSUJTKEFfSkRJUiksICJkaXJlY3QgdW5jb25k
aXRpb25hbCBqdW1wIiwKIFE2SU5TTihKMl9qdW1wciwianVtcHIgUnMzMiIsQVRUUklCUyhBX0pJ
TkRJUiksICJpbmRpcmVjdCB1bmNvbmRpdGlvbmFsIGp1bXAiLAoge2ZKVU1QUihSc04sUnNWLENP
Rl9UWVBFX0pVTVBSKTt9KQogCitRNklOU04oSjJfanVtcHJoLCJqdW1wcmggUnMzMiIsQVRUUklC
UyhBX0pJTkRJUiwgQV9ISU5URURfQ09GKSwgImluZGlyZWN0IHVuY29uZGl0aW9uYWwganVtcCIs
Cit7ZkpVTVBSKFJzTixSc1YsQ09GX1RZUEVfSlVNUFIpO30pCisKICNkZWZpbmUgT0xEQ09ORF9K
VU1QKFRBRyxPUEVSLE9QRVIyLEFUVFJJQixERVNDUixTRU1BTlRJQ1MpIFwKIFE2SU5TTihUQUcj
I3QsImlmIChQdTQpICJPUEVSIjpudCAiT1BFUjIsQVRUUklCLERFU0NSLHtmQlJBTkNIX1NQRUNV
TEFURV9TVEFMTChmTFNCT0xEKFB1ViksLFNQRUNVTEFURV9OT1RfVEFLRU4sMTIsMCk7IGlmIChm
TFNCT0xEKFB1VikpIHsgU0VNQU5USUNTOyB9fSkgXAogUTZJTlNOKFRBRyMjZiwiaWYgKCFQdTQp
ICJPUEVSIjpudCAiT1BFUjIsQVRUUklCLERFU0NSLHtmQlJBTkNIX1NQRUNVTEFURV9TVEFMTChm
TFNCT0xETk9UKFB1ViksLFNQRUNVTEFURV9OT1RfVEFLRU4sMTIsMCk7IGlmIChmTFNCT0xETk9U
KFB1VikpIHsgU0VNQU5USUNTOyB9fSkgXApAQCAtMTk2LDYgKzE5OSw4IEBAIFE2SU5TTihKMl9j
YWxscnQsImlmIChQdTQpIGNhbGxyIFJzMzIiLEFUVFJJQlMoQ0lORElSX1NURCksImluZGlyZWN0
IGNvbmRpdGlvbmFsCiBRNklOU04oSjJfY2FsbHJmLCJpZiAoIVB1NCkgY2FsbHIgUnMzMiIsQVRU
UklCUyhDSU5ESVJfU1REKSwiaW5kaXJlY3QgY29uZGl0aW9uYWwgY2FsbCBpZiBmYWxzZSIsCiB7
ZkJSQU5DSF9TUEVDVUxBVEVfU1RBTEwoZkxTQk9MRE5PVChQdVYpLCxTUEVDVUxBVEVfTk9UX1RB
S0VOLDEyLDApO2lmIChmTFNCT0xETk9UKFB1VikpIHsgZkNBTExSKFJzVik7IH19KQogCitRNklO
U04oSjJfY2FsbHJoLCJjYWxscmggUnMzMiIsQVRUUklCUyhDSU5ESVJfU1RELCBBX0hJTlRFRF9D
T0YpLCAiaGludGVkIGluZGlyZWN0IHVuY29uZGl0aW9uYWwgY2FsbCIsCit7IGZDQUxMUihSc1Yp
OyB9KQogCiAKIApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3Bw
LmRlZiBiL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYKaW5kZXggNzYzZjQ2
NWJmZC4uMGNkMzBhNWU4NSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5j
b2RlX3BwLmRlZgorKysgYi90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmCkBA
IC01MjQsNiArNTI0LDcgQEAgREVGX0ZJRUxEMzIoSUNMQVNTX0oiIDExMC0gLS0tLS0tLS0gUFAt
IS0tLS0gLS0tLS0tLS0iLEpfUFQsIlByZWRpY3QtdGFrZW4iKQogCiBERUZfRklFTERST1dfREVT
QzMyKElDTEFTU19KIiAwMDAwIC0tLS0tLS0tIFBQLS0tLS0tIC0tLS0tLS0tIiwiWyMwXSBQQz0o
UnMpLCBSMzE9cmV0dXJuIikKIERFRl9FTkMzMihKMl9jYWxsciwgICAgIElDTEFTU19KIiAwMDAw
ICAxMDFzc3NzcyAgUFAtLS0tLS0gIC0tLS0tLS0tIikKK0RFRl9FTkMzMihKMl9jYWxscmgsICAg
IElDTEFTU19KIiAwMDAwICAxMTBzc3NzcyAgUFAtLS0tLS0gIC0tLS0tLS0tIikKIAogREVGX0ZJ
RUxEUk9XX0RFU0MzMihJQ0xBU1NfSiIgMDAwMSAtLS0tLS0tLSBQUC0tLS0tLSAtLS0tLS0tLSIs
IlsjMV0gaWYgKFB1KSBQQz0oUnMpLCBSMzE9cmV0dXJuIikKIERFRl9FTkMzMihKMl9jYWxscnQs
ICAgIElDTEFTU19KIiAwMDAxICAwMDBzc3NzcyAgUFAtLS0tdXUgIC0tLS0tLS0tIikKQEAgLTUz
MSw2ICs1MzIsNyBAQCBERUZfRU5DMzIoSjJfY2FsbHJmLCAgICBJQ0xBU1NfSiIgMDAwMSAgMDAx
c3Nzc3MgIFBQLS0tLXV1ICAtLS0tLS0tLSIpCiAKIERFRl9GSUVMRFJPV19ERVNDMzIoSUNMQVNT
X0oiIDAwMTAgLS0tLS0tLS0gUFAtLS0tLS0gLS0tLS0tLS0iLCJbIzJdIFBDPShScyk7ICIpCiBE
RUZfRU5DMzIoSjJfanVtcHIsICAgICAgSUNMQVNTX0oiIDAwMTAgIDEwMHNzc3NzICBQUC0tLS0t
LSAgLS0tLS0tLS0iKQorREVGX0VOQzMyKEoyX2p1bXByaCwgICAgIElDTEFTU19KIiAwMDEwICAx
MTBzc3NzcyAgUFAtLS0tLS0gIC0tLS0tLS0tIikKIERFRl9FTkMzMihKNF9oaW50anVtcHIsICBJ
Q0xBU1NfSiIgMDAxMCAgMTAxc3Nzc3MgIFBQLS0tLS0tICAtLS0tLS0tLSIpCiAKIERFRl9GSUVM
RFJPV19ERVNDMzIoSUNMQVNTX0oiIDAwMTEgLS0tLS0tLS0gUFAtLS0tLS0gLS0tLS0tLS0iLCJb
IzNdIGlmIChQdSkgUEM9KFJzKSAiKQotLSAKMi4yNS4xCgo=

