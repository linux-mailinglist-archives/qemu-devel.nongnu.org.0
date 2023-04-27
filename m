Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D76F0EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbK-0001l5-Bp; Thu, 27 Apr 2023 19:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb9-0001k2-Jg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb4-0001LN-KD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:23 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RN0G3C031253; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jsQ9/lwqDp46019M/TQ1+m0bB4X3ILchkut5ZTdnMkk=;
 b=KmtUu8poxg5HXtkmHt9/MI6VFjVTR7Ly+P1xHgz9B7vfm/28hZg0PYCApOLXzTz2FlET
 duhZCGyHb8Hw6mhYh/woQBxM1UwxHphFc68sxDuEtplivKk0wsT1oZIvd6tj+jnTHbJO
 i69k/ikL7gyXRSTYOk15Lab7L17U8pqJDbsNmgr+BQ2r/9M/0Dldgq6hHxnAjjy2i0eX
 KBsJVC0ztd7yJ65sOf25gJfhotrgFUx+YkrMGGAxog9qiclb6/yA3UX5S96ixHeIXq1q
 qyafzkvcfGXUGYDpblLE5BMYwjRPdY0+6rcQGqcAb+665/QcA5dZM5et0yKBIOxg12xR aA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7kqua77y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0F8c014940; 
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q7wcbsb9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FGh014919;
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33RN0ExD014898
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id E43C16CD; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 19/21] Hexagon (target/hexagon) Move pred_written to
 DisasContext
Date: Thu, 27 Apr 2023 16:00:10 -0700
Message-Id: <20230427230012.3800327-20-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: OvUsUO_yRbDS35VTWQvCOCQ3q5UIGnj8
X-Proofpoint-ORIG-GUID: OvUsUO_yRbDS35VTWQvCOCQ3q5UIGnj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=834 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304270203
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

VGhlIHByZWRfd3JpdHRlbiB2YXJpYWJsZSBpbiB0aGUgQ1BVSGV4YWdvblN0YXRlIGlzIG9ubHkg
dXNlZCBmb3IKYm9va2tlZXBpbmcgd2l0aGluIHRoZSB0cmFuc2xhdGlvbiBvZiBhIHBhY2tldC4g
IFdpdGggcmVjZW50IGNoYW5nZXMKdGhhdCBlbGltaW5hdGUgdGhlIG5lZWQgdG8gZnJlZSBUQ0d2
IHZhcmlhYmxlcywgdGhlc2UgbWFrZSBtb3JlIHNlbnNlCnRvIGJlIHRyYW5zaWVudCBhbmQga2Vw
dCBpbiBEaXNhc0NvbnRleHQuCgpTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8
dHNpbXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAg
ICB8IDIgLS0KIHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgIHwgMiArLQogdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmggfCAyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICB8IDIgKy0K
IHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIHwgNSArKystLQogdGFyZ2V0L2hleGFnb24vdHJh
bnNsYXRlLmMgfCA5ICsrKystLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9jcHUuaCBiL3Rh
cmdldC9oZXhhZ29uL2NwdS5oCmluZGV4IDhjZTJjZWVlZTQuLjI2OTUyY2RkY2IgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2NwdS5oCisrKyBiL3RhcmdldC9oZXhhZ29uL2NwdS5oCkBAIC05
NCw4ICs5NCw2IEBAIHR5cGVkZWYgc3RydWN0IENQVUFyY2hTdGF0ZSB7CiAgICAgdGFyZ2V0X3Vs
b25nIHRoaXNfUEM7CiAgICAgdGFyZ2V0X3Vsb25nIHJlZ193cml0dGVuW1RPVEFMX1BFUl9USFJF
QURfUkVHU107CiAKLSAgICB0YXJnZXRfdWxvbmcgcHJlZF93cml0dGVuOwotCiAgICAgTWVtTG9n
IG1lbV9sb2dfc3RvcmVzW1NUT1JFU19NQVhdOwogICAgIHRhcmdldF91bG9uZyBwa3RfaGFzX3N0
b3JlX3MxOwogICAgIHRhcmdldF91bG9uZyBkY3plcm9fYWRkcjsKZGlmZiAtLWdpdCBhL3Rhcmdl
dC9oZXhhZ29uL2hlbHBlci5oIGIvdGFyZ2V0L2hleGFnb24vaGVscGVyLmgKaW5kZXggNGI3NTBk
MDM1MS4uZjNiMjk4YmVlZSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vaGVscGVyLmgKKysr
IGIvdGFyZ2V0L2hleGFnb24vaGVscGVyLmgKQEAgLTIxLDcgKzIxLDcgQEAKIERFRl9IRUxQRVJf
RkxBR1NfMihyYWlzZV9leGNlcHRpb24sIFRDR19DQUxMX05PX1JFVFVSTiwgbm9yZXR1cm4sIGVu
diwgaTMyKQogREVGX0hFTFBFUl8xKGRlYnVnX3N0YXJ0X3BhY2tldCwgdm9pZCwgZW52KQogREVG
X0hFTFBFUl9GTEFHU18zKGRlYnVnX2NoZWNrX3N0b3JlX3dpZHRoLCBUQ0dfQ0FMTF9OT19XRywg
dm9pZCwgZW52LCBpbnQsIGludCkKLURFRl9IRUxQRVJfRkxBR1NfMyhkZWJ1Z19jb21taXRfZW5k
LCBUQ0dfQ0FMTF9OT19XRywgdm9pZCwgZW52LCBpbnQsIGludCkKK0RFRl9IRUxQRVJfRkxBR1Nf
NChkZWJ1Z19jb21taXRfZW5kLCBUQ0dfQ0FMTF9OT19XRywgdm9pZCwgZW52LCBpbnQsIGludCwg
aW50KQogREVGX0hFTFBFUl8yKGNvbW1pdF9zdG9yZSwgdm9pZCwgZW52LCBpbnQpCiBERUZfSEVM
UEVSXzMoZ2F0aGVyX3N0b3JlLCB2b2lkLCBlbnYsIGkzMiwgaW50KQogREVGX0hFTFBFUl8xKGNv
bW1pdF9odnhfc3RvcmVzLCB2b2lkLCBlbnYpCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90
cmFuc2xhdGUuaCBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCmluZGV4IGZkZmExYjZmZTMu
LmE5ZjFjY2VlMjQgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCisrKyBi
L3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCkBAIC03MSw2ICs3MSw3IEBAIHR5cGVkZWYgc3Ry
dWN0IERpc2FzQ29udGV4dCB7CiAgICAgYm9vbCBoYXNfaHZ4X2hlbHBlcjsKICAgICBUQ0d2IG5l
d192YWx1ZVtUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogICAgIFRDR3YgbmV3X3ByZWRfdmFsdWVb
TlVNX1BSRUdTXTsKKyAgICBUQ0d2IHByZWRfd3JpdHRlbjsKIH0gRGlzYXNDb250ZXh0OwogCiBz
dGF0aWMgaW5saW5lIHZvaWQgY3R4X2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBp
bnQgcG51bSkKQEAgLTE5NCw3ICsxOTUsNiBAQCBleHRlcm4gVENHdiBoZXhfc2xvdF9jYW5jZWxs
ZWQ7CiBleHRlcm4gVENHdiBoZXhfYnJhbmNoX3Rha2VuOwogZXh0ZXJuIFRDR3YgaGV4X25ld192
YWx1ZV91c3I7CiBleHRlcm4gVENHdiBoZXhfcmVnX3dyaXR0ZW5bVE9UQUxfUEVSX1RIUkVBRF9S
RUdTXTsKLWV4dGVybiBUQ0d2IGhleF9wcmVkX3dyaXR0ZW47CiBleHRlcm4gVENHdiBoZXhfc3Rv
cmVfYWRkcltTVE9SRVNfTUFYXTsKIGV4dGVybiBUQ0d2IGhleF9zdG9yZV93aWR0aFtTVE9SRVNf
TUFYXTsKIGV4dGVybiBUQ0d2IGhleF9zdG9yZV92YWwzMltTVE9SRVNfTUFYXTsKZGlmZiAtLWdp
dCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKaW5k
ZXggYzcxYmVhMDUzMC4uMWFkNGQ2MzZmOCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2Vu
cHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTE1MSw3ICsxNTEsNyBAQCB2
b2lkIGdlbl9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0sIFRDR3Yg
dmFsKQogICAgICAgICB0Y2dfZ2VuX2FuZF90bChwcmVkLCBwcmVkLCBiYXNlX3ZhbCk7CiAgICAg
fQogICAgIGlmIChIRVhfREVCVUcpIHsKLSAgICAgICAgdGNnX2dlbl9vcmlfdGwoaGV4X3ByZWRf
d3JpdHRlbiwgaGV4X3ByZWRfd3JpdHRlbiwgMSA8PCBwbnVtKTsKKyAgICAgICAgdGNnX2dlbl9v
cmlfdGwoY3R4LT5wcmVkX3dyaXR0ZW4sIGN0eC0+cHJlZF93cml0dGVuLCAxIDw8IHBudW0pOwog
ICAgIH0KICAgICBzZXRfYml0KHBudW0sIGN0eC0+cHJlZ3Nfd3JpdHRlbik7CiB9CmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBl
ci5jCmluZGV4IDI2ZmJhOWY1ZDYuLmY5MDIxZWZjN2UgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL29wX2hlbHBlci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jCkBAIC0yMDMs
NyArMjAzLDggQEAgc3RhdGljIHZvaWQgcHJpbnRfc3RvcmUoQ1BVSGV4YWdvblN0YXRlICplbnYs
IGludCBzbG90KQogfQogCiAvKiBUaGlzIGZ1bmN0aW9uIGlzIGEgaGFuZHkgcGxhY2UgdG8gc2V0
IGEgYnJlYWtwb2ludCAqLwotdm9pZCBIRUxQRVIoZGVidWdfY29tbWl0X2VuZCkoQ1BVSGV4YWdv
blN0YXRlICplbnYsIGludCBoYXNfc3QwLCBpbnQgaGFzX3N0MSkKK3ZvaWQgSEVMUEVSKGRlYnVn
X2NvbW1pdF9lbmQpKENQVUhleGFnb25TdGF0ZSAqZW52LAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50IHByZWRfd3JpdHRlbiwgaW50IGhhc19zdDAsIGludCBoYXNfc3QxKQogewog
ICAgIGJvb2wgcmVnX3ByaW50ZWQgPSBmYWxzZTsKICAgICBib29sIHByZWRfcHJpbnRlZCA9IGZh
bHNlOwpAQCAtMjI1LDcgKzIyNiw3IEBAIHZvaWQgSEVMUEVSKGRlYnVnX2NvbW1pdF9lbmQpKENQ
VUhleGFnb25TdGF0ZSAqZW52LCBpbnQgaGFzX3N0MCwgaW50IGhhc19zdDEpCiAgICAgfQogCiAg
ICAgZm9yIChpID0gMDsgaSA8IE5VTV9QUkVHUzsgaSsrKSB7Ci0gICAgICAgIGlmIChlbnYtPnBy
ZWRfd3JpdHRlbiAmICgxIDw8IGkpKSB7CisgICAgICAgIGlmIChwcmVkX3dyaXR0ZW4gJiAoMSA8
PCBpKSkgewogICAgICAgICAgICAgaWYgKCFwcmVkX3ByaW50ZWQpIHsKICAgICAgICAgICAgICAg
ICBIRVhfREVCVUdfTE9HKCJQcmVkaWNhdGVzIHdyaXR0ZW5cbiIpOwogICAgICAgICAgICAgICAg
IHByZWRfcHJpbnRlZCA9IHRydWU7CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IDg5MGJhZGFjMTAuLmIxODVk
ZGEzNWEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC00Niw3ICs0Niw2IEBAIFRDR3YgaGV4X3Nsb3RfY2Fu
Y2VsbGVkOwogVENHdiBoZXhfYnJhbmNoX3Rha2VuOwogVENHdiBoZXhfbmV3X3ZhbHVlX3VzcjsK
IFRDR3YgaGV4X3JlZ193cml0dGVuW1RPVEFMX1BFUl9USFJFQURfUkVHU107Ci1UQ0d2IGhleF9w
cmVkX3dyaXR0ZW47CiBUQ0d2IGhleF9zdG9yZV9hZGRyW1NUT1JFU19NQVhdOwogVENHdiBoZXhf
c3RvcmVfd2lkdGhbU1RPUkVTX01BWF07CiBUQ0d2IGhleF9zdG9yZV92YWwzMltTVE9SRVNfTUFY
XTsKQEAgLTU0OSw3ICs1NDgsOCBAQCBzdGF0aWMgdm9pZCBnZW5fc3RhcnRfcGFja2V0KERpc2Fz
Q29udGV4dCAqY3R4KQogICAgICAgICB9CiAgICAgfQogICAgIGlmIChIRVhfREVCVUcpIHsKLSAg
ICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9wcmVkX3dyaXR0ZW4sIDApOworICAgICAgICBjdHgt
PnByZWRfd3JpdHRlbiA9IHRjZ190ZW1wX25ldygpOworICAgICAgICB0Y2dfZ2VuX21vdmlfdGwo
Y3R4LT5wcmVkX3dyaXR0ZW4sIDApOwogICAgIH0KIAogICAgIC8qIFByZWxvYWQgdGhlIHByZWRp
Y2F0ZWQgcmVnaXN0ZXJzIGludG8gZ2V0X3Jlc3VsdF9ncHIoY3R4LCBpKSAqLwpAQCAtMTAwNCw3
ICsxMDA0LDggQEAgc3RhdGljIHZvaWQgZ2VuX2NvbW1pdF9wYWNrZXQoRGlzYXNDb250ZXh0ICpj
dHgpCiAgICAgICAgICAgICB0Y2dfY29uc3RhbnRfdGwocGt0LT5wa3RfaGFzX3N0b3JlX3MxICYm
ICFwa3QtPnBrdF9oYXNfZGN6ZXJvYSk7CiAKICAgICAgICAgLyogSGFuZHkgcGxhY2UgdG8gc2V0
IGEgYnJlYWtwb2ludCBhdCB0aGUgZW5kIG9mIGV4ZWN1dGlvbiAqLwotICAgICAgICBnZW5faGVs
cGVyX2RlYnVnX2NvbW1pdF9lbmQoY3B1X2VudiwgaGFzX3N0MCwgaGFzX3N0MSk7CisgICAgICAg
IGdlbl9oZWxwZXJfZGVidWdfY29tbWl0X2VuZChjcHVfZW52LCBjdHgtPnByZWRfd3JpdHRlbiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhhc19zdDAsIGhhc19zdDEpOwog
ICAgIH0KIAogICAgIGlmIChwa3QtPnZoaXN0X2luc24gIT0gTlVMTCkgewpAQCAtMTE5Nyw4ICsx
MTk4LDYgQEAgdm9pZCBoZXhhZ29uX3RyYW5zbGF0ZV9pbml0KHZvaWQpCiAgICAgICAgICAgICBv
ZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHByZWRbaV0pLAogICAgICAgICAgICAgaGV4YWdvbl9w
cmVkbmFtZXNbaV0pOwogICAgIH0KLSAgICBoZXhfcHJlZF93cml0dGVuID0gdGNnX2dsb2JhbF9t
ZW1fbmV3KGNwdV9lbnYsCi0gICAgICAgIG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgcHJlZF93
cml0dGVuKSwgInByZWRfd3JpdHRlbiIpOwogICAgIGhleF90aGlzX1BDID0gdGNnX2dsb2JhbF9t
ZW1fbmV3KGNwdV9lbnYsCiAgICAgICAgIG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgdGhpc19Q
QyksICJ0aGlzX1BDIik7CiAgICAgaGV4X3Nsb3RfY2FuY2VsbGVkID0gdGNnX2dsb2JhbF9tZW1f
bmV3KGNwdV9lbnYsCi0tIAoyLjI1LjEKCg==

