Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9286961A0FB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2L4-0001aO-15; Fri, 04 Nov 2022 15:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kx-0001Y5-Up
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kt-0002Lx-L8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:43 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A4Ixsqb003074; Fri, 4 Nov 2022 19:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LjO8WfFlN6bf+ak6EUUeRlFtPrsdsFhkCE6dIMDuetk=;
 b=Dfw1T3lqiaXZDanw2jeO6hGlpQGUR/oM8vVR1LDpjKyDxqgOnBDAHgeOYw45krcFLjQM
 P59yePzWTYibXwp6J7RqIKPA9jHEyaQXlnT4836B3P6LF7bqFXN9BZgEr+Kp96p0tLQ7
 4qZ4aHInNe7Jt/hXHUiglTZZpd72bjYB4tJ+4SZ241wCnG6JEALJNX+yuJu31j16gk1l
 Ghk/5sFS5EBcdZcWXPtNrn3KMvc6Rfuc9EG+P7/WR5b1cyybC2o9OPjct3k+Nc/pnnbb
 21y5R1vOen4+DhtcvQWZsYglBrDVf65KYzLDOsPsi9T5HyhENdFwLpGRRkMf9zRAFuZM QA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kn6swr7y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 19:26:36 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4JQZlE032327; 
 Fri, 4 Nov 2022 19:26:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3khdn57m53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 04 Nov 2022 19:26:35 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4JQYt9032321;
 Fri, 4 Nov 2022 19:26:34 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 2A4JQYAf032317;
 Fri, 04 Nov 2022 19:26:34 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 1459B500117; Fri,  4 Nov 2022 12:26:33 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 10/11] Hexagon (target/hexagon) Use direct block chaining
 for direct jump/branch
Date: Fri,  4 Nov 2022 12:26:30 -0700
Message-Id: <20221104192631.29434-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221104192631.29434-1-tsimpson@quicinc.com>
References: <20221104192631.29434-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MiBT503tJMrzbxfZvG196bYZ0uNvf7uz
X-Proofpoint-GUID: MiBT503tJMrzbxfZvG196bYZ0uNvf7uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=875 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040121
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
KysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAzOSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggOTY1MDlhNGRhNy4uMDg0MWU4
NDE4ZSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIvdGFyZ2V0
L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTU3LDYgKzU3LDkgQEAgdHlwZWRlZiBzdHJ1Y3QgRGlz
YXNDb250ZXh0IHsKICAgICBib29sIHFyZWdfaXNfcHJlZGljYXRlZFtOVU1fUVJFR1NdOwogICAg
IGludCBxcmVnX2xvZ19pZHg7CiAgICAgYm9vbCBwcmVfY29tbWl0OworICAgIGJvb2wgaGFzX3Np
bmdsZV9kaXJlY3RfYnJhbmNoOworICAgIFRDR3YgYnJhbmNoX2NvbmQ7CisgICAgdGFyZ2V0X3Vs
b25nIGJyYW5jaF9kZXN0OwogfSBEaXNhc0NvbnRleHQ7CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBj
dHhfbG9nX3JlZ193cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJudW0pCmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4
IDgxYzJhZTQ2NGQuLjIzNWVhOWQyMTAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0
ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC00ODIsNyArNDgyLDE4IEBAIHN0
YXRpYyB2b2lkIGdlbl93cml0ZV9uZXdfcGNfYWRkcihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBh
ZGRyLCBUQ0d2IHByZWQpCiBzdGF0aWMgdm9pZCBnZW5fd3JpdGVfbmV3X3BjX3BjcmVsKERpc2Fz
Q29udGV4dCAqY3R4LCBpbnQgcGNfb2ZmLCBUQ0d2IHByZWQpCiB7CiAgICAgdGFyZ2V0X3Vsb25n
IGRlc3QgPSBjdHgtPnBrdC0+cGMgKyBwY19vZmY7Ci0gICAgZ2VuX3dyaXRlX25ld19wY19hZGRy
KGN0eCwgdGNnX2NvbnN0YW50X3RsKGRlc3QpLCBwcmVkKTsKKyAgICBpZiAoY3R4LT5wa3QtPnBr
dF9oYXNfbXVsdGlfY29mKSB7CisgICAgICAgIGdlbl93cml0ZV9uZXdfcGNfYWRkcihjdHgsIHRj
Z19jb25zdGFudF90bChkZXN0KSwgcHJlZCk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgLyogRGVm
ZXIgdGhpcyBqdW1wIHRvIHRoZSBlbmQgb2YgdGhlIFRCICovCisgICAgICAgIGdfYXNzZXJ0KGN0
eC0+YnJhbmNoX2NvbmQgPT0gTlVMTCk7CisgICAgICAgIGN0eC0+aGFzX3NpbmdsZV9kaXJlY3Rf
YnJhbmNoID0gdHJ1ZTsKKyAgICAgICAgaWYgKHByZWQgIT0gTlVMTCkgeworICAgICAgICAgICAg
Y3R4LT5icmFuY2hfY29uZCA9IHRjZ190ZW1wX2xvY2FsX25ldygpOworICAgICAgICAgICAgdGNn
X2dlbl9tb3ZfdGwoY3R4LT5icmFuY2hfY29uZCwgcHJlZCk7CisgICAgICAgIH0KKyAgICAgICAg
Y3R4LT5icmFuY2hfZGVzdCA9IGRlc3Q7CisgICAgfQogfQogCiBzdGF0aWMgdm9pZCBnZW5fc2V0
X3Vzcl9maWVsZChpbnQgZmllbGQsIFRDR3YgdmFsKQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCBmYTY0MTU5
MzZjLi44YzAwN2M2ZjA3IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwor
KysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwpAQCAtMTE2LDEwICsxMTYsNDQgQEAgc3Rh
dGljIHZvaWQgZ2VuX2V4ZWNfY291bnRlcnMoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgICAgICAg
ICAgICAgICAgIGhleF9ncHJbSEVYX1JFR19RRU1VX0hWWF9DTlRdLCBjdHgtPm51bV9odnhfaW5z
bnMpOwogfQogCitzdGF0aWMgYm9vbCB1c2VfZ290b190YihEaXNhc0NvbnRleHQgKmN0eCwgdGFy
Z2V0X3Vsb25nIGRlc3QpCit7CisgICAgcmV0dXJuIHRyYW5zbGF0b3JfdXNlX2dvdG9fdGIoJmN0
eC0+YmFzZSwgZGVzdCk7Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9nb3RvX3RiKERpc2FzQ29udGV4
dCAqY3R4LCBpbnQgaWR4LCB0YXJnZXRfdWxvbmcgZGVzdCkKK3sKKyAgICBpZiAodXNlX2dvdG9f
dGIoY3R4LCBkZXN0KSkgeworICAgICAgICB0Y2dfZ2VuX2dvdG9fdGIoaWR4KTsKKyAgICAgICAg
dGNnX2dlbl9tb3ZpX3RsKGhleF9ncHJbSEVYX1JFR19QQ10sIGRlc3QpOworICAgICAgICB0Y2df
Z2VuX2V4aXRfdGIoY3R4LT5iYXNlLnRiLCBpZHgpOworICAgIH0gZWxzZSB7CisgICAgICAgIHRj
Z19nZW5fbW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsKKyAgICAgICAgdGNnX2dl
bl9sb29rdXBfYW5kX2dvdG9fcHRyKCk7CisgICAgfQorfQorCiBzdGF0aWMgdm9pZCBnZW5fZW5k
X3RiKERpc2FzQ29udGV4dCAqY3R4KQogewogICAgIGdlbl9leGVjX2NvdW50ZXJzKGN0eCk7Ci0g
ICAgdGNnX2dlbl9leGl0X3RiKE5VTEwsIDApOworCisgICAgaWYgKGN0eC0+aGFzX3NpbmdsZV9k
aXJlY3RfYnJhbmNoKSB7CisgICAgICAgIGlmIChjdHgtPmJyYW5jaF9jb25kICE9IE5VTEwpIHsK
KyAgICAgICAgICAgIFRDR0xhYmVsICpza2lwID0gZ2VuX25ld19sYWJlbCgpOworICAgICAgICAg
ICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX0VRLCBjdHgtPmJyYW5jaF9jb25kLCAwLCBz
a2lwKTsKKyAgICAgICAgICAgIGdlbl9nb3RvX3RiKGN0eCwgMCwgY3R4LT5icmFuY2hfZGVzdCk7
CisgICAgICAgICAgICBnZW5fc2V0X2xhYmVsKHNraXApOworICAgICAgICAgICAgZ2VuX2dvdG9f
dGIoY3R4LCAxLCBjdHgtPm5leHRfUEMpOworICAgICAgICAgICAgdGNnX3RlbXBfZnJlZShjdHgt
PmJyYW5jaF9jb25kKTsKKyAgICAgICAgICAgIGN0eC0+YnJhbmNoX2NvbmQgPSBOVUxMOworICAg
ICAgICB9IGVsc2UgeworICAgICAgICAgICAgZ2VuX2dvdG9fdGIoY3R4LCAwLCBjdHgtPmJyYW5j
aF9kZXN0KTsKKyAgICAgICAgfQorICAgIH0gZWxzZSB7CisgICAgICAgIHRjZ19nZW5fbG9va3Vw
X2FuZF9nb3RvX3B0cigpOworICAgIH0KKworICAgIGdfYXNzZXJ0KGN0eC0+YnJhbmNoX2NvbmQg
PT0gTlVMTCk7CiAgICAgY3R4LT5iYXNlLmlzX2ptcCA9IERJU0FTX05PUkVUVVJOOwogfQogCkBA
IC04MTEsNiArODQ1LDkgQEAgc3RhdGljIHZvaWQgaGV4YWdvbl90cl9pbml0X2Rpc2FzX2NvbnRl
eHQoRGlzYXNDb250ZXh0QmFzZSAqZGNiYXNlLAogCiBzdGF0aWMgdm9pZCBoZXhhZ29uX3RyX3Ri
X3N0YXJ0KERpc2FzQ29udGV4dEJhc2UgKmRiLCBDUFVTdGF0ZSAqY3B1KQogeworICAgIERpc2Fz
Q29udGV4dCAqY3R4ID0gY29udGFpbmVyX29mKGRiLCBEaXNhc0NvbnRleHQsIGJhc2UpOworICAg
IGN0eC0+aGFzX3NpbmdsZV9kaXJlY3RfYnJhbmNoID0gZmFsc2U7CisgICAgY3R4LT5icmFuY2hf
Y29uZCA9IE5VTEw7CiB9CiAKIHN0YXRpYyB2b2lkIGhleGFnb25fdHJfaW5zbl9zdGFydChEaXNh
c0NvbnRleHRCYXNlICpkY2Jhc2UsIENQVVN0YXRlICpjcHUpCi0tIAoyLjE3LjEKCg==

