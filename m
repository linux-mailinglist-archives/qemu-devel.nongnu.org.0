Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F16EEB9B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:44:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTF4-0007kb-9h; Tue, 25 Apr 2023 20:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEw-0007ib-Sg
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEf-0006JM-3I
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:32 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0f741020171; Wed, 26 Apr 2023 00:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=YxkbL8SJGmcIeSbKC0InFPh3yWhhYm9ioyWtx8RIazg=;
 b=CI5P6APzy1PXTLG70F8i//AWalHUdmXeW6+fA6HRCxu6exSfvOIBmejlNmIhAy/ydiBW
 TWSkU8nn4SwQKHsHydms4AMm5J3CeB42xiIc9aLumDZRq0Yd/RDplMeWmiiFyb+BG7J4
 CT1EO46j1ShqiWdrKgc4KPqgWJfMWrBD57XIOwfE5207EpdPXzctXOLPYF3yI8g/cgvc
 PEueiYQYEeSWkwszAjw2Ks+FshfEYK8x98CkOR3Qvmx9sJFvOBWcrwE/zjP3uc4u3N4m
 E/uH2ss+X4+oBBKPFEvJcDjXyEHKMljDps/r3G6MB6++5XYyO8pIFugSDCXkDKngvYs2 4Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6bdra8bq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:08 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0eE68015736; 
 Wed, 26 Apr 2023 00:42:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q48nm4yac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:07 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0g7cw016834;
 Wed, 26 Apr 2023 00:42:07 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33Q0g6YC016831
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:07 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A1E97532; Tue, 25 Apr 2023 17:42:06 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 08/21] Hexagon (target/hexagon) Clean up pred_written usage
Date: Tue, 25 Apr 2023 17:42:02 -0700
Message-Id: <20230426004202.1319250-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1iadS7T3sqxrsfhcu7LlCUD8s1oGhExV
X-Proofpoint-ORIG-GUID: 1iadS7T3sqxrsfhcu7LlCUD8s1oGhExV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=402 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

T25seSBlbmRsb29wIGluc3RydWN0aW9ucyB3aWxsIGNvbmRpdGlvbmFsbHkgd3JpdGUgdG8gYSBw
cmVkaWNhdGUuCldoZW4gdGhlcmUgaXMgYW4gZW5kbG9vcCBpbnN0cnVjdGlvbiwgd2UgcHJlbG9h
ZCB0aGUgdmFsdWVzIGludG8KbmV3X3ByZWRfdmFsdWUuCgpUaGUgb25seSBwbGFjZSBwcmVkX3dy
aXR0ZW4gaXMgbmVlZGVkIGlzIHdoZW4gSEVYX0RFQlVHIGlzIG9uLgoKV2UgcmVtb3ZlIHRoZSBs
YXN0IHVzZSBvZiBjaGVja19mb3JfYXR0cmliLiAgSG93ZXZlciwgbmV3IHVzZXMgd2lsbCBiZQpp
bnRyb2R1Y2VkIGxhdGVyIGluIHRoaXMgc2VyaWVzLCBzbyB3ZSBjaGFuZ2UgaXQgdG8gInN0YXRp
YyBpbmxpbmUiLgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTYgKysrKystLS0tLS0t
CiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyB8IDUzICsrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQ2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0
L2hleGFnb24vZ2VucHRyLmMKaW5kZXggMTA0ZmYwNjFmNS4uYjljNGE0NmUzYSAxMDA2NDQKLS0t
IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMK
QEAgLTEzNyw3ICsxMzcsOSBAQCB2b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQg
KmN0eCwgaW50IHBudW0sIFRDR3YgdmFsKQogICAgICAgICB0Y2dfZ2VuX2FuZF90bChoZXhfbmV3
X3ByZWRfdmFsdWVbcG51bV0sCiAgICAgICAgICAgICAgICAgICAgICAgIGhleF9uZXdfcHJlZF92
YWx1ZVtwbnVtXSwgYmFzZV92YWwpOwogICAgIH0KLSAgICB0Y2dfZ2VuX29yaV90bChoZXhfcHJl
ZF93cml0dGVuLCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IHBudW0pOworICAgIGlmIChIRVhfREVC
VUcpIHsKKyAgICAgICAgdGNnX2dlbl9vcmlfdGwoaGV4X3ByZWRfd3JpdHRlbiwgaGV4X3ByZWRf
d3JpdHRlbiwgMSA8PCBwbnVtKTsKKyAgICB9CiAgICAgc2V0X2JpdChwbnVtLCBjdHgtPnByZWdz
X3dyaXR0ZW4pOwogfQogCkBAIC04MjMsMTUgKzgyNSwxMyBAQCBzdGF0aWMgdm9pZCBnZW5fZW5k
bG9vcDAoRGlzYXNDb250ZXh0ICpjdHgpCiAKICAgICAvKgogICAgICAqICAgIGlmIChscGNmZyA9
PSAxKSB7Ci0gICAgICogICAgICAgIGhleF9uZXdfcHJlZF92YWx1ZVszXSA9IDB4ZmY7Ci0gICAg
ICogICAgICAgIGhleF9wcmVkX3dyaXR0ZW4gfD0gMSA8PCAzOworICAgICAqICAgICAgICBwMyA9
IDB4ZmY7CiAgICAgICogICAgfQogICAgICAqLwogICAgIFRDR0xhYmVsICpsYWJlbDEgPSBnZW5f
bmV3X2xhYmVsKCk7CiAgICAgdGNnX2dlbl9icmNvbmRpX3RsKFRDR19DT05EX05FLCBscGNmZywg
MSwgbGFiZWwxKTsKICAgICB7Ci0gICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfbmV3X3ByZWRf
dmFsdWVbM10sIDB4ZmYpOwotICAgICAgICB0Y2dfZ2VuX29yaV90bChoZXhfcHJlZF93cml0dGVu
LCBoZXhfcHJlZF93cml0dGVuLCAxIDw8IDMpOworICAgICAgICBnZW5fbG9nX3ByZWRfd3JpdGUo
Y3R4LCAzLCB0Y2dfY29uc3RhbnRfdGwoMHhmZikpOwogICAgIH0KICAgICBnZW5fc2V0X2xhYmVs
KGxhYmVsMSk7CiAKQEAgLTkwMCwxNCArOTAwLDEyIEBAIHN0YXRpYyB2b2lkIGdlbl9lbmRsb29w
MDEoRGlzYXNDb250ZXh0ICpjdHgpCiAKICAgICAvKgogICAgICAqICAgIGlmIChscGNmZyA9PSAx
KSB7Ci0gICAgICogICAgICAgIGhleF9uZXdfcHJlZF92YWx1ZVszXSA9IDB4ZmY7Ci0gICAgICog
ICAgICAgIGhleF9wcmVkX3dyaXR0ZW4gfD0gMSA8PCAzOworICAgICAqICAgICAgICBwMyA9IDB4
ZmY7CiAgICAgICogICAgfQogICAgICAqLwogICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09O
RF9ORSwgbHBjZmcsIDEsIGxhYmVsMSk7CiAgICAgewotICAgICAgICB0Y2dfZ2VuX21vdmlfdGwo
aGV4X25ld19wcmVkX3ZhbHVlWzNdLCAweGZmKTsKLSAgICAgICAgdGNnX2dlbl9vcmlfdGwoaGV4
X3ByZWRfd3JpdHRlbiwgaGV4X3ByZWRfd3JpdHRlbiwgMSA8PCAzKTsKKyAgICAgICAgZ2VuX2xv
Z19wcmVkX3dyaXRlKGN0eCwgMywgdGNnX2NvbnN0YW50X3RsKDB4ZmYpKTsKICAgICB9CiAgICAg
Z2VuX3NldF9sYWJlbChsYWJlbDEpOwogCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IGMwODdmMTgzZDAuLjFm
MDQ1NTlmOTEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCisrKyBiL3Rh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0yMzksNyArMjM5LDcgQEAgc3RhdGljIGludCBy
ZWFkX3BhY2tldF93b3JkcyhDUFVIZXhhZ29uU3RhdGUgKmVudiwgRGlzYXNDb250ZXh0ICpjdHgs
CiAgICAgcmV0dXJuIG53b3JkczsKIH0KIAotc3RhdGljIGJvb2wgY2hlY2tfZm9yX2F0dHJpYihQ
YWNrZXQgKnBrdCwgaW50IGF0dHJpYikKK3N0YXRpYyBpbmxpbmUgYm9vbCBjaGVja19mb3JfYXR0
cmliKFBhY2tldCAqcGt0LCBpbnQgYXR0cmliKQogewogICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
cGt0LT5udW1faW5zbnM7IGkrKykgewogICAgICAgICBpZiAoR0VUX0FUVFJJQihwa3QtPmluc25b
aV0ub3Bjb2RlLCBhdHRyaWIpKSB7CkBAIC0yNjIsMTEgKzI2Miw2IEBAIHN0YXRpYyBib29sIG5l
ZWRfc2xvdF9jYW5jZWxsZWQoUGFja2V0ICpwa3QpCiAgICAgcmV0dXJuIGZhbHNlOwogfQogCi1z
dGF0aWMgYm9vbCBuZWVkX3ByZWRfd3JpdHRlbihQYWNrZXQgKnBrdCkKLXsKLSAgICByZXR1cm4g
Y2hlY2tfZm9yX2F0dHJpYihwa3QsIEFfV1JJVEVTX1BSRURfUkVHKTsKLX0KLQogc3RhdGljIGJv
b2wgbmVlZF9uZXh0X1BDKERpc2FzQ29udGV4dCAqY3R4KQogewogICAgIFBhY2tldCAqcGt0ID0g
Y3R4LT5wa3Q7CkBAIC00MTQsNyArNDA5LDcgQEAgc3RhdGljIHZvaWQgZ2VuX3N0YXJ0X3BhY2tl
dChEaXNhc0NvbnRleHQgKmN0eCkKICAgICAgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3By
W0hFWF9SRUdfUENdLCBuZXh0X1BDKTsKICAgICAgICAgfQogICAgIH0KLSAgICBpZiAobmVlZF9w
cmVkX3dyaXR0ZW4ocGt0KSkgeworICAgIGlmIChIRVhfREVCVUcpIHsKICAgICAgICAgdGNnX2dl
bl9tb3ZpX3RsKGhleF9wcmVkX3dyaXR0ZW4sIDApOwogICAgIH0KIApAQCAtNDI4LDYgKzQyMywx
NyBAQCBzdGF0aWMgdm9pZCBnZW5fc3RhcnRfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQogICAg
ICAgICB9CiAgICAgfQogCisgICAgLyoKKyAgICAgKiBQcmVsb2FkIHRoZSBwcmVkaWNhdGVkIHBy
ZWQgcmVnaXN0ZXJzIGludG8gaGV4X25ld19wcmVkX3ZhbHVlW3ByZWRfbnVtXQorICAgICAqIE9u
bHkgZW5kbG9vcCBpbnN0cnVjdGlvbnMgY29uZGl0aW9uYWxseSB3cml0ZSB0byBwcmVkIHJlZ2lz
dGVycworICAgICAqLworICAgIGlmIChwa3QtPnBrdF9oYXNfZW5kbG9vcCkgeworICAgICAgICBm
b3IgKGludCBpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2dfaWR4OyBpKyspIHsKKyAgICAgICAgICAg
IGludCBwcmVkX251bSA9IGN0eC0+cHJlZ19sb2dbaV07CisgICAgICAgICAgICB0Y2dfZ2VuX21v
dl90bChoZXhfbmV3X3ByZWRfdmFsdWVbcHJlZF9udW1dLCBoZXhfcHJlZFtwcmVkX251bV0pOwor
ICAgICAgICB9CisgICAgfQorCiAgICAgLyogUHJlbG9hZCB0aGUgcHJlZGljYXRlZCBIVlggcmVn
aXN0ZXJzIGludG8gZnV0dXJlX1ZSZWdzIGFuZCB0bXBfVlJlZ3MgKi8KICAgICBpZiAoIWJpdG1h
cF9lbXB0eShjdHgtPnByZWRpY2F0ZWRfZnV0dXJlX3ZyZWdzLCBOVU1fVlJFR1MpKSB7CiAgICAg
ICAgIGludCBpID0gZmluZF9maXJzdF9iaXQoY3R4LT5wcmVkaWNhdGVkX2Z1dHVyZV92cmVncywg
TlVNX1ZSRUdTKTsKQEAgLTUzMiw0MSArNTM4LDE0IEBAIHN0YXRpYyB2b2lkIGdlbl9yZWdfd3Jp
dGVzKERpc2FzQ29udGV4dCAqY3R4KQogCiBzdGF0aWMgdm9pZCBnZW5fcHJlZF93cml0ZXMoRGlz
YXNDb250ZXh0ICpjdHgpCiB7Ci0gICAgaW50IGk7Ci0KICAgICAvKiBFYXJseSBleGl0IGlmIHRo
ZSBsb2cgaXMgZW1wdHkgKi8KICAgICBpZiAoIWN0eC0+cHJlZ19sb2dfaWR4KSB7CiAgICAgICAg
IHJldHVybjsKICAgICB9CiAKLSAgICAvKgotICAgICAqIE9ubHkgZW5kbG9vcCBpbnN0cnVjdGlv
bnMgd2lsbCBjb25kaXRpb25hbGx5Ci0gICAgICogd3JpdGUgYSBwcmVkaWNhdGUuICBJZiB0aGVy
ZSBhcmUgbm8gZW5kbG9vcAotICAgICAqIGluc3RydWN0aW9ucywgd2UgY2FuIHVzZSB0aGUgbm9u
LWNvbmRpdGlvbmFsCi0gICAgICogd3JpdGUgb2YgdGhlIHByZWRpY2F0ZXMuCi0gICAgICovCi0g
ICAgaWYgKGN0eC0+cGt0LT5wa3RfaGFzX2VuZGxvb3ApIHsKLSAgICAgICAgVENHdiB6ZXJvID0g
dGNnX2NvbnN0YW50X3RsKDApOwotICAgICAgICBUQ0d2IHByZWRfd3JpdHRlbiA9IHRjZ190ZW1w
X25ldygpOwotICAgICAgICBmb3IgKGkgPSAwOyBpIDwgY3R4LT5wcmVnX2xvZ19pZHg7IGkrKykg
ewotICAgICAgICAgICAgaW50IHByZWRfbnVtID0gY3R4LT5wcmVnX2xvZ1tpXTsKLQotICAgICAg
ICAgICAgdGNnX2dlbl9hbmRpX3RsKHByZWRfd3JpdHRlbiwgaGV4X3ByZWRfd3JpdHRlbiwgMSA8
PCBwcmVkX251bSk7Ci0gICAgICAgICAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfTkUs
IGhleF9wcmVkW3ByZWRfbnVtXSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmVk
X3dyaXR0ZW4sIHplcm8sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGV4X25ld19w
cmVkX3ZhbHVlW3ByZWRfbnVtXSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZXhf
cHJlZFtwcmVkX251bV0pOwotICAgICAgICB9Ci0gICAgfSBlbHNlIHsKLSAgICAgICAgZm9yIChp
ID0gMDsgaSA8IGN0eC0+cHJlZ19sb2dfaWR4OyBpKyspIHsKLSAgICAgICAgICAgIGludCBwcmVk
X251bSA9IGN0eC0+cHJlZ19sb2dbaV07Ci0gICAgICAgICAgICB0Y2dfZ2VuX21vdl90bChoZXhf
cHJlZFtwcmVkX251bV0sIGhleF9uZXdfcHJlZF92YWx1ZVtwcmVkX251bV0pOwotICAgICAgICAg
ICAgaWYgKEhFWF9ERUJVRykgewotICAgICAgICAgICAgICAgIC8qIERvIHRoaXMgc28gSEVMUEVS
KGRlYnVnX2NvbW1pdF9lbmQpIHdpbGwga25vdyAqLwotICAgICAgICAgICAgICAgIHRjZ19nZW5f
b3JpX3RsKGhleF9wcmVkX3dyaXR0ZW4sIGhleF9wcmVkX3dyaXR0ZW4sCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgMSA8PCBwcmVkX251bSk7Ci0gICAgICAgICAgICB9Ci0gICAgICAg
IH0KKyAgICBmb3IgKGludCBpID0gMDsgaSA8IGN0eC0+cHJlZ19sb2dfaWR4OyBpKyspIHsKKyAg
ICAgICAgaW50IHByZWRfbnVtID0gY3R4LT5wcmVnX2xvZ1tpXTsKKyAgICAgICAgdGNnX2dlbl9t
b3ZfdGwoaGV4X3ByZWRbcHJlZF9udW1dLCBoZXhfbmV3X3ByZWRfdmFsdWVbcHJlZF9udW1dKTsK
ICAgICB9CiB9CiAKLS0gCjIuMjUuMQoK

