Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D126F0EB5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:07:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbX-0001r8-Cw; Thu, 27 Apr 2023 19:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbM-0001nQ-O1
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbE-0001LO-85
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:36 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RLSX0u024999; Thu, 27 Apr 2023 23:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XeGFV8V7hwjZX4sbPp5ePdNXo4ZbYQM0vG/ot2omjE8=;
 b=Wrs4yB61MgT40w1bcdpi81r8HItfbhR9mhr70dzOamTqawJnpwVCuxwd5Qyo1R9tGSB5
 YRs26LYHE5MJ9lqXLjLo4UZBZ8uD3Pdk6PT9N25w3ZW7kM4AGIhDWm+k1Zyhti0ijEgi
 obCdYRcsmgyG1wMHMK2t1fclV0pEQPLdYIOWP5M4EImxMjRgb1L0sEdP4tLW3FBvjLXN
 oCRoeuv4YewWc1mmwEuYlcb5WMSwe1vikaTD8DrX+w+O+ptZpESS6A1nBy1gaw5uV8od
 qm7gLkTxSgAwz+kWVLupe7wpNdSnr0HwYziFmO3koUbwfz247P+NhwAk4yFS6P0YqN2Y NQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7wq88gpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FJV014941; 
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q7wcbsb9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FRd014922;
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33RN0Ei6014897
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id DE48F6CB; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 17/21] Hexagon (target/hexagon) Move new_value to
 DisasContext
Date: Thu, 27 Apr 2023 16:00:08 -0700
Message-Id: <20230427230012.3800327-18-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vZKg6mxams1_jTUbzpi1mDMWxkMsKLcz
X-Proofpoint-ORIG-GUID: vZKg6mxams1_jTUbzpi1mDMWxkMsKLcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=829
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
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

VGhlIG5ld192YWx1ZSBhcnJheSBpbiB0aGUgQ1BVSGV4YWdvblN0YXRlIGlzIG9ubHkgdXNlZCBm
b3IgYm9va2tlZXBpbmcKd2l0aGluIHRoZSB0cmFuc2xhdGlvbiBvZiBhIHBhY2tldC4gIFdpdGgg
cmVjZW50IGNoYW5nZXMgdGhhdCBlbGltaW5hdGUKdGhlIG5lZWQgdG8gZnJlZSBUQ0d2IHZhcmlh
YmxlcywgdGhlc2UgbWFrZSBtb3JlIHNlbnNlIHRvIGJlIHRyYW5zaWVudAphbmQga2VwdCBpbiBE
aXNhc0NvbnRleHQuCgpTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAgICB8ICAx
IC0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oIHwgIDIgKy0KIHRhcmdldC9oZXhhZ29uL2dl
bnB0ci5jICAgIHwgIDYgKysrKystCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyB8IDE0ICsr
Ky0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vY3B1LmggYi90YXJnZXQvaGV4YWdv
bi9jcHUuaAppbmRleCAzNjg3ZjJjYWEyLi4yMmFiYTIwYmUyIDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9jcHUuaAorKysgYi90YXJnZXQvaGV4YWdvbi9jcHUuaApAQCAtODUsNyArODUsNiBA
QCB0eXBlZGVmIHN0cnVjdCBDUFVBcmNoU3RhdGUgewogICAgIHRhcmdldF91bG9uZyBzdGFja19z
dGFydDsKIAogICAgIHVpbnQ4X3Qgc2xvdF9jYW5jZWxsZWQ7Ci0gICAgdGFyZ2V0X3Vsb25nIG5l
d192YWx1ZVtUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogICAgIHRhcmdldF91bG9uZyBuZXdfdmFs
dWVfdXNyOwogCiAgICAgLyoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5o
IGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggNGMxNzQzM2E2Zi4uNmRkZTQ4NzU2
NiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmgKQEAgLTY5LDYgKzY5LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgRGlzYXND
b250ZXh0IHsKICAgICBib29sIG5lZWRfcGt0X2hhc19zdG9yZV9zMTsKICAgICBib29sIHNob3J0
X2NpcmN1aXQ7CiAgICAgYm9vbCBoYXNfaHZ4X2hlbHBlcjsKKyAgICBUQ0d2IG5ld192YWx1ZVtU
T1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogfSBEaXNhc0NvbnRleHQ7CiAKIHN0YXRpYyBpbmxpbmUg
dm9pZCBjdHhfbG9nX3ByZWRfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBwbnVtKQpAQCAt
MTkwLDcgKzE5MSw2IEBAIGV4dGVybiBUQ0d2IGhleF9wcmVkW05VTV9QUkVHU107CiBleHRlcm4g
VENHdiBoZXhfdGhpc19QQzsKIGV4dGVybiBUQ0d2IGhleF9zbG90X2NhbmNlbGxlZDsKIGV4dGVy
biBUQ0d2IGhleF9icmFuY2hfdGFrZW47Ci1leHRlcm4gVENHdiBoZXhfbmV3X3ZhbHVlW1RPVEFM
X1BFUl9USFJFQURfUkVHU107CiBleHRlcm4gVENHdiBoZXhfbmV3X3ZhbHVlX3VzcjsKIGV4dGVy
biBUQ0d2IGhleF9yZWdfd3JpdHRlbltUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogZXh0ZXJuIFRD
R3YgaGV4X25ld19wcmVkX3ZhbHVlW05VTV9QUkVHU107CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGVkZTE0NzRlYTUu
LmM3YThlMmNlNTUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3Rh
cmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC03NCw3ICs3NCwxMSBAQCBUQ0d2IGdldF9yZXN1bHRf
Z3ByKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcm51bSkKICAgICAgICAgaWYgKHJudW0gPT0gSEVY
X1JFR19VU1IpIHsKICAgICAgICAgICAgIHJldHVybiBoZXhfbmV3X3ZhbHVlX3VzcjsKICAgICAg
ICAgfSBlbHNlIHsKLSAgICAgICAgICAgIHJldHVybiBoZXhfbmV3X3ZhbHVlW3JudW1dOworICAg
ICAgICAgICAgaWYgKGN0eC0+bmV3X3ZhbHVlW3JudW1dID09IE5VTEwpIHsKKyAgICAgICAgICAg
ICAgICBjdHgtPm5ld192YWx1ZVtybnVtXSA9IHRjZ190ZW1wX25ldygpOworICAgICAgICAgICAg
ICAgIHRjZ19nZW5fbW92aV90bChjdHgtPm5ld192YWx1ZVtybnVtXSwgMCk7CisgICAgICAgICAg
ICB9CisgICAgICAgICAgICByZXR1cm4gY3R4LT5uZXdfdmFsdWVbcm51bV07CiAgICAgICAgIH0K
ICAgICB9IGVsc2UgewogICAgICAgICByZXR1cm4gaGV4X2dwcltybnVtXTsKZGlmZiAtLWdpdCBh
L3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMK
aW5kZXggZDQ2YTcyNGMxYi4uNWYzNWJiMjBlNyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24v
dHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTQ0LDcgKzQ0
LDYgQEAgVENHdiBoZXhfcHJlZFtOVU1fUFJFR1NdOwogVENHdiBoZXhfdGhpc19QQzsKIFRDR3Yg
aGV4X3Nsb3RfY2FuY2VsbGVkOwogVENHdiBoZXhfYnJhbmNoX3Rha2VuOwotVENHdiBoZXhfbmV3
X3ZhbHVlW1RPVEFMX1BFUl9USFJFQURfUkVHU107CiBUQ0d2IGhleF9uZXdfdmFsdWVfdXNyOwog
VENHdiBoZXhfcmVnX3dyaXR0ZW5bVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKIFRDR3YgaGV4X25l
d19wcmVkX3ZhbHVlW05VTV9QUkVHU107CkBAIC01MTMsNiArNTEyLDkgQEAgc3RhdGljIHZvaWQg
Z2VuX3N0YXJ0X3BhY2tldChEaXNhc0NvbnRleHQgKmN0eCkKICAgICB9CiAgICAgY3R4LT5zMV9z
dG9yZV9wcm9jZXNzZWQgPSBmYWxzZTsKICAgICBjdHgtPnByZV9jb21taXQgPSB0cnVlOworICAg
IGZvciAoaSA9IDA7IGkgPCBUT1RBTF9QRVJfVEhSRUFEX1JFR1M7IGkrKykgeworICAgICAgICBj
dHgtPm5ld192YWx1ZVtpXSA9IE5VTEw7CisgICAgfQogCiAgICAgYW5hbHl6ZV9wYWNrZXQoY3R4
KTsKIApAQCAtMTE1Niw3ICsxMTU4LDYgQEAgdm9pZCBnZW5faW50ZXJtZWRpYXRlX2NvZGUoQ1BV
U3RhdGUgKmNzLCBUcmFuc2xhdGlvbkJsb2NrICp0YiwgaW50ICptYXhfaW5zbnMsCiB9CiAKICNk
ZWZpbmUgTkFNRV9MRU4gICAgICAgICAgICAgICA2NAotc3RhdGljIGNoYXIgbmV3X3ZhbHVlX25h
bWVzW1RPVEFMX1BFUl9USFJFQURfUkVHU11bTkFNRV9MRU5dOwogc3RhdGljIGNoYXIgcmVnX3dy
aXR0ZW5fbmFtZXNbVE9UQUxfUEVSX1RIUkVBRF9SRUdTXVtOQU1FX0xFTl07CiBzdGF0aWMgY2hh
ciBuZXdfcHJlZF92YWx1ZV9uYW1lc1tOVU1fUFJFR1NdW05BTUVfTEVOXTsKIHN0YXRpYyBjaGFy
IHN0b3JlX2FkZHJfbmFtZXNbU1RPUkVTX01BWF1bTkFNRV9MRU5dOwpAQCAtMTE3OCwxNSArMTE3
OSw2IEBAIHZvaWQgaGV4YWdvbl90cmFuc2xhdGVfaW5pdCh2b2lkKQogICAgICAgICAgICAgb2Zm
c2V0b2YoQ1BVSGV4YWdvblN0YXRlLCBncHJbaV0pLAogICAgICAgICAgICAgaGV4YWdvbl9yZWdu
YW1lc1tpXSk7CiAKLSAgICAgICAgaWYgKGkgPT0gSEVYX1JFR19VU1IpIHsKLSAgICAgICAgICAg
IGhleF9uZXdfdmFsdWVbaV0gPSBOVUxMOwotICAgICAgICB9IGVsc2UgewotICAgICAgICAgICAg
c25wcmludGYobmV3X3ZhbHVlX25hbWVzW2ldLCBOQU1FX0xFTiwgIm5ld18lcyIsIGhleGFnb25f
cmVnbmFtZXNbaV0pOwotICAgICAgICAgICAgaGV4X25ld192YWx1ZVtpXSA9IHRjZ19nbG9iYWxf
bWVtX25ldyhjcHVfZW52LAotICAgICAgICAgICAgICAgIG9mZnNldG9mKENQVUhleGFnb25TdGF0
ZSwgbmV3X3ZhbHVlW2ldKSwKLSAgICAgICAgICAgICAgICBuZXdfdmFsdWVfbmFtZXNbaV0pOwot
ICAgICAgICB9Ci0KICAgICAgICAgaWYgKEhFWF9ERUJVRykgewogICAgICAgICAgICAgc25wcmlu
dGYocmVnX3dyaXR0ZW5fbmFtZXNbaV0sIE5BTUVfTEVOLCAicmVnX3dyaXR0ZW5fJXMiLAogICAg
ICAgICAgICAgICAgICAgICAgaGV4YWdvbl9yZWduYW1lc1tpXSk7Ci0tIAoyLjI1LjEKCg==

