Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492AB605358
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 00:46:40 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olHpf-0005vO-ED
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 18:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHhP-0002LZ-C2
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:38:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1olHh8-00029k-Qe
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 18:38:07 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JBr80Q000949;
 Wed, 19 Oct 2022 22:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4DTUFPONS7mCcCdC7LBzEnEQ0eZqxeJWfwGgc4iR6cg=;
 b=NBHdLLlfA9r8Gff8YsoSPDI0FVhQgQywWmioAd5T/mBrnzqaLKPwOV/zHiK1m7OQoGHo
 R+U/p6f0R+iquFVM7zUJXCYo6+eTWAVBRIZZtdNlvSWIDkJrbN10CU/j3tMpc7Famiza
 uA38RiRIjPICG4Wqf0WelIZxPxoHkg+NX/OJGAyuAr1i0MGTTxPWd9zrwyyKfFNdVrsA
 GBOR2JZcwJwRipORmTxeoIFRTtwJk6dDzIANMGnWQTThtvtFmloYuXEFEursHdQRWi3I
 zP0GRqKzCe/2T9U6VYLNP+mj/1R9/S/ufLv/slgnSG0vkpgLCKU06wFZ1WQOfnNUv7IK GA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ka5emmaf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 22:37:43 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 29JMbhVI030406; 
 Wed, 19 Oct 2022 22:37:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 3k7nxkwatw-1;
 Wed, 19 Oct 2022 22:37:43 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JMbgT2030401;
 Wed, 19 Oct 2022 22:37:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 29JMbggL030397;
 Wed, 19 Oct 2022 22:37:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id C3D04500102; Wed, 19 Oct 2022 15:37:41 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 7/8] Hexagon (target/hexagon) Use direct block chaining for
 direct jump/branch
Date: Wed, 19 Oct 2022 15:37:38 -0700
Message-Id: <20221019223739.3868-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019223739.3868-1-tsimpson@quicinc.com>
References: <20221019223739.3868-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0tii88ODWwxRxK7jqe5xBPoGAKSnp7-k
X-Proofpoint-GUID: 0tii88ODWwxRxK7jqe5xBPoGAKSnp7-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=881 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210190125
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RGlyZWN0IGJsb2NrIGNoYWluaW5nIGlzIGRvY3VtZW50ZWQgaGVyZQpodHRwczovL3FlbXUucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RldmVsL3RjZy5odG1sI2RpcmVjdC1ibG9jay1jaGFpbmlu
ZwoKUmVjYWxsIHRoYXQgSGV4YWdvbiBhbGxvd3MgcGFja2V0cyB3aXRoIG11bHRpcGxlIGp1bXBz
IHdoZXJlIG9ubHkgdGhlIGZpcnN0Cm9uZSB3aXRoIGEgdHJ1ZSBwcmVkaWNhdGUgd2lsbCBhY3R1
YWxseSBqdW1wLiAgU28sIHdlIGNhbiBvbmx5IHVzZSBkaXJlY3QKYmxvY2sgY2hhaW5pbmcgd2hl
biB0aGUgcGFja2V0IGNvbnRhaW5zIGEgc2luZ2xlIFBDLXJlbGF0aXZlIGp1bXAuICBXZSBhZGQK
dGhlIGZvbGxvd2luZyB0byBEaXNhc0NvbnRleHQgaW4gb3JkZXIgdG8gcGVyZm9ybSBkaXJlY3Qg
YmxvY2sgY2hhaW5pbmcgYXQKdGhlIGVuZCBvZiBwYWNrZXQgY29tbWl0IChpbiBnZW5fZW5kX3Ri
KQogICAgaGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoCiAgICAgICAgSW5kaWNhdGVzIHRoYXQgd2Ug
Y2FuIHVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcKICAgIGJyYW5jaF9jb25kCiAgICAgICAgVGhl
IGNvbmRpdGlvbiB1bmRlciB3aGljaCB0aGUgYnJhbmNoIGlzIHRha2VuCiAgICBicmFuY2hfZGVz
dAogICAgICAgIFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgYnJhbmNoCgpTaWduZWQtb2ZmLWJ5OiBU
YXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24v
dHJhbnNsYXRlLmggfCAgMyArKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTMgKysr
KysrLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggZWFlMzU4Y2YzMy4uZTYwZGJm
MGU3YSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIvdGFyZ2V0
L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTU0LDYgKzU0LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgRGlz
YXNDb250ZXh0IHsKICAgICBib29sIHFyZWdfaXNfcHJlZGljYXRlZFtOVU1fUVJFR1NdOwogICAg
IGludCBxcmVnX2xvZ19pZHg7CiAgICAgYm9vbCBwcmVfY29tbWl0OworICAgIGJvb2wgaGFzX3Np
bmdsZV9kaXJlY3RfYnJhbmNoOworICAgIFRDR3YgYnJhbmNoX2NvbmQ7CisgICAgdGFyZ2V0X3Vs
b25nIGJyYW5jaF9kZXN0OwogfSBEaXNhc0NvbnRleHQ7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBj
dHhfbG9nX3JlZ193cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJudW0pCmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4
IGZiYTc2ZDNiMzguLjA3YjQzMjZlNTYgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC01MDUsMTUgKzUwNSwxNCBAQCBz
dGF0aWMgdm9pZCBnZW5fd3JpdGVfbmV3X3BjX3BjcmVsKERpc2FzQ29udGV4dCAqY3R4LCBQYWNr
ZXQgKnBrdCwKICAgICAgICAgICAgIGdlbl9zZXRfbGFiZWwocHJlZF9mYWxzZSk7CiAgICAgICAg
IH0KICAgICB9IGVsc2UgewotICAgICAgICBUQ0dMYWJlbCAqcHJlZF9mYWxzZSA9IE5VTEw7Cisg
ICAgICAgIC8qIERlZmVyIHRoaXMganVtcCB0byB0aGUgZW5kIG9mIHRoZSBUQiAqLworICAgICAg
ICBnX2Fzc2VydChjdHgtPmJyYW5jaF9jb25kID09IE5VTEwpOworICAgICAgICBjdHgtPmhhc19z
aW5nbGVfZGlyZWN0X2JyYW5jaCA9IHRydWU7CiAgICAgICAgIGlmIChwcmVkICE9IE5VTEwpIHsK
LSAgICAgICAgICAgIHByZWRfZmFsc2UgPSBnZW5fbmV3X2xhYmVsKCk7Ci0gICAgICAgICAgICB0
Y2dfZ2VuX2JyY29uZGlfdGwoVENHX0NPTkRfRVEsIHByZWQsIDAsIHByZWRfZmFsc2UpOwotICAg
ICAgICB9Ci0gICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0
KTsKLSAgICAgICAgaWYgKHByZWQgIT0gTlVMTCkgewotICAgICAgICAgICAgZ2VuX3NldF9sYWJl
bChwcmVkX2ZhbHNlKTsKKyAgICAgICAgICAgIGN0eC0+YnJhbmNoX2NvbmQgPSB0Y2dfdGVtcF9s
b2NhbF9uZXcoKTsKKyAgICAgICAgICAgIHRjZ19nZW5fbW92X3RsKGN0eC0+YnJhbmNoX2NvbmQs
IHByZWQpOwogICAgICAgICB9CisgICAgICAgIGN0eC0+YnJhbmNoX2Rlc3QgPSBkZXN0OwogICAg
IH0KIH0KIApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgYi90YXJnZXQv
aGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCA3MWFkMmRhNjgyLi4yOWUyY2FhZjBmIDEwMDY0NAot
LS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYworKysgYi90YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuYwpAQCAtMTE2LDEwICsxMTYsNDQgQEAgc3RhdGljIHZvaWQgZ2VuX2V4ZWNfY291bnRl
cnMoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgICAgICAgICAgICAgICAgIGhleF9ncHJbSEVYX1JF
R19RRU1VX0hWWF9DTlRdLCBjdHgtPm51bV9odnhfaW5zbnMpOwogfQogCitzdGF0aWMgYm9vbCB1
c2VfZ290b190YihEaXNhc0NvbnRleHQgKmN0eCwgdGFyZ2V0X3Vsb25nIGRlc3QpCit7CisgICAg
cmV0dXJuIHRyYW5zbGF0b3JfdXNlX2dvdG9fdGIoJmN0eC0+YmFzZSwgZGVzdCk7Cit9CisKK3N0
YXRpYyB2b2lkIGdlbl9nb3RvX3RiKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgaWR4LCB0YXJnZXRf
dWxvbmcgZGVzdCkKK3sKKyAgICBpZiAodXNlX2dvdG9fdGIoY3R4LCBkZXN0KSkgeworICAgICAg
ICB0Y2dfZ2VuX2dvdG9fdGIoaWR4KTsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9ncHJb
SEVYX1JFR19QQ10sIGRlc3QpOworICAgICAgICB0Y2dfZ2VuX2V4aXRfdGIoY3R4LT5iYXNlLnRi
LCBpZHgpOworICAgIH0gZWxzZSB7CisgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3ByW0hF
WF9SRUdfUENdLCBkZXN0KTsKKyAgICAgICAgdGNnX2dlbl9sb29rdXBfYW5kX2dvdG9fcHRyKCk7
CisgICAgfQorfQorCiBzdGF0aWMgdm9pZCBnZW5fZW5kX3RiKERpc2FzQ29udGV4dCAqY3R4KQog
ewogICAgIGdlbl9leGVjX2NvdW50ZXJzKGN0eCk7Ci0gICAgdGNnX2dlbl9leGl0X3RiKE5VTEws
IDApOworCisgICAgaWYgKGN0eC0+aGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoKSB7CisgICAgICAg
IGlmIChjdHgtPmJyYW5jaF9jb25kICE9IE5VTEwpIHsKKyAgICAgICAgICAgIFRDR0xhYmVsICpz
a2lwID0gZ2VuX25ld19sYWJlbCgpOworICAgICAgICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRD
R19DT05EX0VRLCBjdHgtPmJyYW5jaF9jb25kLCAwLCBza2lwKTsKKyAgICAgICAgICAgIGdlbl9n
b3RvX3RiKGN0eCwgMCwgY3R4LT5icmFuY2hfZGVzdCk7CisgICAgICAgICAgICBnZW5fc2V0X2xh
YmVsKHNraXApOworICAgICAgICAgICAgZ2VuX2dvdG9fdGIoY3R4LCAxLCBjdHgtPm5leHRfUEMp
OworICAgICAgICAgICAgdGNnX3RlbXBfZnJlZShjdHgtPmJyYW5jaF9jb25kKTsKKyAgICAgICAg
ICAgIGN0eC0+YnJhbmNoX2NvbmQgPSBOVUxMOworICAgICAgICB9IGVsc2UgeworICAgICAgICAg
ICAgZ2VuX2dvdG9fdGIoY3R4LCAwLCBjdHgtPmJyYW5jaF9kZXN0KTsKKyAgICAgICAgfQorICAg
IH0gZWxzZSB7CisgICAgICAgIHRjZ19nZW5fbG9va3VwX2FuZF9nb3RvX3B0cigpOworICAgIH0K
KworICAgIGdfYXNzZXJ0KGN0eC0+YnJhbmNoX2NvbmQgPT0gTlVMTCk7CiAgICAgY3R4LT5iYXNl
LmlzX2ptcCA9IERJU0FTX05PUkVUVVJOOwogfQogCkBAIC04MDMsNiArODM3LDkgQEAgc3RhdGlj
IHZvaWQgaGV4YWdvbl90cl9pbml0X2Rpc2FzX2NvbnRleHQoRGlzYXNDb250ZXh0QmFzZSAqZGNi
YXNlLAogCiBzdGF0aWMgdm9pZCBoZXhhZ29uX3RyX3RiX3N0YXJ0KERpc2FzQ29udGV4dEJhc2Ug
KmRiLCBDUFVTdGF0ZSAqY3B1KQogeworICAgIERpc2FzQ29udGV4dCAqY3R4ID0gY29udGFpbmVy
X29mKGRiLCBEaXNhc0NvbnRleHQsIGJhc2UpOworICAgIGN0eC0+aGFzX3NpbmdsZV9kaXJlY3Rf
YnJhbmNoID0gZmFsc2U7CisgICAgY3R4LT5icmFuY2hfY29uZCA9IE5VTEw7CiB9CiAKIHN0YXRp
YyB2b2lkIGhleGFnb25fdHJfaW5zbl9zdGFydChEaXNhc0NvbnRleHRCYXNlICpkY2Jhc2UsIENQ
VVN0YXRlICpjcHUpCi0tIAoyLjE3LjEKCg==

