Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289026F0E6C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 00:43:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAIc-0001u8-Cf; Thu, 27 Apr 2023 18:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIZ-0001t5-0o
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIU-0005M7-Ar
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:10 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMPXKB018824; Thu, 27 Apr 2023 22:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f7pGfnikSoRgON62441tCL3qPslt4G3ymdc69o4x5TI=;
 b=KAkP0W2fUkj9hzQqN+0im/QTIuM6HWnAR2b2kbJ4mOaOiQcBzqRBJ+LFZxaqfGqy1D3A
 7Zz/c/g+yR0dEVRDAEUhBoSJEqv0bz7bnhqS4koflAkH3Qi3IQptYFH8xrY7iLcHV0H+
 07EPHc9ZPomP0j3l7oYY4mLomvhoUOeeVNq7GQ0yTKyqlLQM7YSV6bPeQH8sEI6t1WEx
 bXRfugPA6OEciCtMS+SzWDiIaGwWtUiaADS4ygDvGNyLZbs4kCGYU7XUFkYs1I4VeADz
 XA8tTs25YXlXf4TARHERMkDGJRc449kQ8g+y0xu6nEzAd3ssWiQNBj7VTs/DUC9CnfA2 Nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7m4ya4gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:02 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMbm24002100; 
 Thu, 27 Apr 2023 22:41:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmt75g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RMf1pq005642;
 Thu, 27 Apr 2023 22:41:01 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33RMf0XG005392
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id DEA876A5; Thu, 27 Apr 2023 15:40:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 8/9] Hexagon (target/hexagon) Add v73 scalar instructions
Date: Thu, 27 Apr 2023 15:40:56 -0700
Message-Id: <20230427224057.3766963-9-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427224057.3766963-1-tsimpson@quicinc.com>
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wbF_RjIbfm4rw_bkWN2K4IwQiqxTjXek
X-Proofpoint-ORIG-GUID: wbF_RjIbfm4rw_bkWN2K4IwQiqxTjXek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=702
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270200
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

VGhlIGZvbGxvd2luZyBpbnN0cnVjdGlvbnMgYXJlIGFkZGVkCiAgICBKMl9jYWxscmgKICAgIEoy
X2p1bnByaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgIHwgNCArKysrCiB0YXJnZXQvaGV4YWdv
bi9hdHRyaWJzX2RlZi5oLmluYyAgICAgIHwgMSArCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9i
cmFuY2guaWRlZiAgIHwgNyArKysrKystCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVf
cHAuZGVmIHwgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZy5oCmluZGV4IDU5OGQ4MGQzY2UuLjZmMTJmNjY1ZGIgMTAwNjQ0Ci0tLSBh
L3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgK
QEAgLTY1Myw2ICs2NTMsOCBAQAogICAgIGdlbl9jYWxsKGN0eCwgcmlWKQogI2RlZmluZSBmR0VO
X1RDR19KMl9jYWxscihTSE9SVENPREUpIFwKICAgICBnZW5fY2FsbHIoY3R4LCBSc1YpCisjZGVm
aW5lIGZHRU5fVENHX0oyX2NhbGxyaChTSE9SVENPREUpIFwKKyAgICBnZW5fY2FsbHIoY3R4LCBS
c1YpCiAKICNkZWZpbmUgZkdFTl9UQ0dfSjJfY2FsbHQoU0hPUlRDT0RFKSBcCiAgICAgZ2VuX2Nv
bmRfY2FsbChjdHgsIFB1ViwgVENHX0NPTkRfRVEsIHJpVikKQEAgLTg1MSw2ICs4NTMsOCBAQAog
ICAgIGdlbl9qdW1wKGN0eCwgcmlWKQogI2RlZmluZSBmR0VOX1RDR19KMl9qdW1wcihTSE9SVENP
REUpIFwKICAgICBnZW5fanVtcHIoY3R4LCBSc1YpCisjZGVmaW5lIGZHRU5fVENHX0oyX2p1bXBy
aChTSE9SVENPREUpIFwKKyAgICBnZW5fanVtcHIoY3R4LCBSc1YpCiAjZGVmaW5lIGZHRU5fVENH
X0o0X2p1bXBzZXRpKFNIT1JUQ09ERSkgXAogICAgIGRvIHsgXAogICAgICAgICB0Y2dfZ2VuX21v
dmlfdGwoUmRWLCBVaVYpOyBcCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2Rl
Zi5oLmluYyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCmluZGV4IDNiZWY2MGJl
ZjMuLjY5ZGE5Nzc2ZjAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmgu
aW5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCkBAIC04OSw2ICs4OSw3
IEBAIERFRl9BVFRSSUIoSlVNUCwgIkp1bXAtdHlwZSBpbnN0cnVjdGlvbiIsICIiLCAiIikKIERF
Rl9BVFRSSUIoSU5ESVJFQ1QsICJBYnNvbHV0ZSByZWdpc3RlciBqdW1wIiwgIiIsICIiKQogREVG
X0FUVFJJQihDQUxMLCAiRnVuY3Rpb24gY2FsbCBpbnN0cnVjdGlvbiIsICIiLCAiIikKIERFRl9B
VFRSSUIoQ09GLCAiQ2hhbmdlLW9mLWZsb3cgaW5zdHJ1Y3Rpb24iLCAiIiwgIiIpCitERUZfQVRU
UklCKEhJTlRFRF9DT0YsICJUaGlzIGluc3RydWN0aW9uIGlzIGEgaGludGVkIGNoYW5nZS1vZi1m
bG93IiwgIiIsICIiKQogREVGX0FUVFJJQihDT05ERVhFQywgIk1heSBiZSBjYW5jZWxsZWQgYnkg
YSBwcmVkaWNhdGUiLCAiIiwgIiIpCiBERUZfQVRUUklCKERPVE5FV1ZBTFVFLCAiVXNlcyBhIHJl
Z2lzdGVyIHZhbHVlIGdlbmVyYXRlZCBpbiB0aGlzIHBrdCIsICIiLCAiIikKIERFRl9BVFRSSUIo
TkVXQ01QSlVNUCwgIkNvbXBvdW5kIGNvbXBhcmUgYW5kIGp1bXAiLCAiIiwgIiIpCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9icmFuY2guaWRlZiBiL3RhcmdldC9oZXhhZ29u
L2ltcG9ydGVkL2JyYW5jaC5pZGVmCmluZGV4IDg4ZjVmNDhjY2UuLjkzZTJlMzc1YTUgMTAwNjQ0
Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2JyYW5jaC5pZGVmCisrKyBiL3RhcmdldC9o
ZXhhZ29uL2ltcG9ydGVkL2JyYW5jaC5pZGVmCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5
cmlnaHQoYykgMjAxOS0yMDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5v
dmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHBy
b2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1v
ZGlmeQogICogIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC0zNCw2ICszNCw5IEBAIFE2SU5TTihKMl9qdW1wLCJq
dW1wICNyMjI6MiIsQVRUUklCUyhBX0pESVIpLCAiZGlyZWN0IHVuY29uZGl0aW9uYWwganVtcCIs
CiBRNklOU04oSjJfanVtcHIsImp1bXByIFJzMzIiLEFUVFJJQlMoQV9KSU5ESVIpLCAiaW5kaXJl
Y3QgdW5jb25kaXRpb25hbCBqdW1wIiwKIHtmSlVNUFIoUnNOLFJzVixDT0ZfVFlQRV9KVU1QUik7
fSkKIAorUTZJTlNOKEoyX2p1bXByaCwianVtcHJoIFJzMzIiLEFUVFJJQlMoQV9KSU5ESVIsIEFf
SElOVEVEX0NPRiksICJpbmRpcmVjdCB1bmNvbmRpdGlvbmFsIGp1bXAiLAore2ZKVU1QUihSc04s
UnNWLENPRl9UWVBFX0pVTVBSKTt9KQorCiAjZGVmaW5lIE9MRENPTkRfSlVNUChUQUcsT1BFUixP
UEVSMixBVFRSSUIsREVTQ1IsU0VNQU5USUNTKSBcCiBRNklOU04oVEFHIyN0LCJpZiAoUHU0KSAi
T1BFUiI6bnQgIk9QRVIyLEFUVFJJQixERVNDUix7ZkJSQU5DSF9TUEVDVUxBVEVfU1RBTEwoZkxT
Qk9MRChQdVYpLCxTUEVDVUxBVEVfTk9UX1RBS0VOLDEyLDApOyBpZiAoZkxTQk9MRChQdVYpKSB7
IFNFTUFOVElDUzsgfX0pIFwKIFE2SU5TTihUQUcjI2YsImlmICghUHU0KSAiT1BFUiI6bnQgIk9Q
RVIyLEFUVFJJQixERVNDUix7ZkJSQU5DSF9TUEVDVUxBVEVfU1RBTEwoZkxTQk9MRE5PVChQdVYp
LCxTUEVDVUxBVEVfTk9UX1RBS0VOLDEyLDApOyBpZiAoZkxTQk9MRE5PVChQdVYpKSB7IFNFTUFO
VElDUzsgfX0pIFwKQEAgLTE5Niw2ICsxOTksOCBAQCBRNklOU04oSjJfY2FsbHJ0LCJpZiAoUHU0
KSBjYWxsciBSczMyIixBVFRSSUJTKENJTkRJUl9TVEQpLCJpbmRpcmVjdCBjb25kaXRpb25hbAog
UTZJTlNOKEoyX2NhbGxyZiwiaWYgKCFQdTQpIGNhbGxyIFJzMzIiLEFUVFJJQlMoQ0lORElSX1NU
RCksImluZGlyZWN0IGNvbmRpdGlvbmFsIGNhbGwgaWYgZmFsc2UiLAoge2ZCUkFOQ0hfU1BFQ1VM
QVRFX1NUQUxMKGZMU0JPTEROT1QoUHVWKSwsU1BFQ1VMQVRFX05PVF9UQUtFTiwxMiwwKTtpZiAo
ZkxTQk9MRE5PVChQdVYpKSB7IGZDQUxMUihSc1YpOyB9fSkKIAorUTZJTlNOKEoyX2NhbGxyaCwi
Y2FsbHJoIFJzMzIiLEFUVFJJQlMoQ0lORElSX1NURCwgQV9ISU5URURfQ09GKSwgImhpbnRlZCBp
bmRpcmVjdCB1bmNvbmRpdGlvbmFsIGNhbGwiLAoreyBmQ0FMTFIoUnNWKTsgfSkKIAogCiAKZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYgYi90YXJnZXQv
aGV4YWdvbi9pbXBvcnRlZC9lbmNvZGVfcHAuZGVmCmluZGV4IDc2M2Y0NjViZmQuLjBjZDMwYTVl
ODUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2ltcG9ydGVkL2VuY29kZV9wcC5kZWYKKysr
IGIvdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3BwLmRlZgpAQCAtNTI0LDYgKzUyNCw3
IEBAIERFRl9GSUVMRDMyKElDTEFTU19KIiAxMTAtIC0tLS0tLS0tIFBQLSEtLS0tIC0tLS0tLS0t
IixKX1BULCJQcmVkaWN0LXRha2VuIikKIAogREVGX0ZJRUxEUk9XX0RFU0MzMihJQ0xBU1NfSiIg
MDAwMCAtLS0tLS0tLSBQUC0tLS0tLSAtLS0tLS0tLSIsIlsjMF0gUEM9KFJzKSwgUjMxPXJldHVy
biIpCiBERUZfRU5DMzIoSjJfY2FsbHIsICAgICBJQ0xBU1NfSiIgMDAwMCAgMTAxc3Nzc3MgIFBQ
LS0tLS0tICAtLS0tLS0tLSIpCitERUZfRU5DMzIoSjJfY2FsbHJoLCAgICBJQ0xBU1NfSiIgMDAw
MCAgMTEwc3Nzc3MgIFBQLS0tLS0tICAtLS0tLS0tLSIpCiAKIERFRl9GSUVMRFJPV19ERVNDMzIo
SUNMQVNTX0oiIDAwMDEgLS0tLS0tLS0gUFAtLS0tLS0gLS0tLS0tLS0iLCJbIzFdIGlmIChQdSkg
UEM9KFJzKSwgUjMxPXJldHVybiIpCiBERUZfRU5DMzIoSjJfY2FsbHJ0LCAgICBJQ0xBU1NfSiIg
MDAwMSAgMDAwc3Nzc3MgIFBQLS0tLXV1ICAtLS0tLS0tLSIpCkBAIC01MzEsNiArNTMyLDcgQEAg
REVGX0VOQzMyKEoyX2NhbGxyZiwgICAgSUNMQVNTX0oiIDAwMDEgIDAwMXNzc3NzICBQUC0tLS11
dSAgLS0tLS0tLS0iKQogCiBERUZfRklFTERST1dfREVTQzMyKElDTEFTU19KIiAwMDEwIC0tLS0t
LS0tIFBQLS0tLS0tIC0tLS0tLS0tIiwiWyMyXSBQQz0oUnMpOyAiKQogREVGX0VOQzMyKEoyX2p1
bXByLCAgICAgIElDTEFTU19KIiAwMDEwICAxMDBzc3NzcyAgUFAtLS0tLS0gIC0tLS0tLS0tIikK
K0RFRl9FTkMzMihKMl9qdW1wcmgsICAgICBJQ0xBU1NfSiIgMDAxMCAgMTEwc3Nzc3MgIFBQLS0t
LS0tICAtLS0tLS0tLSIpCiBERUZfRU5DMzIoSjRfaGludGp1bXByLCAgSUNMQVNTX0oiIDAwMTAg
IDEwMXNzc3NzICBQUC0tLS0tLSAgLS0tLS0tLS0iKQogCiBERUZfRklFTERST1dfREVTQzMyKElD
TEFTU19KIiAwMDExIC0tLS0tLS0tIFBQLS0tLS0tIC0tLS0tLS0tIiwiWyMzXSBpZiAoUHUpIFBD
PShScykgIikKLS0gCjIuMjUuMQoK

