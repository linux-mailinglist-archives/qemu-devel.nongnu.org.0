Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6256EEB91
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTEe-0007bb-1W; Tue, 25 Apr 2023 20:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEY-0007ao-1M
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEJ-0006HC-Rt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:06 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PNkLv6030667; Wed, 26 Apr 2023 00:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=hBA5aspym26M7quIBoWKd4bOqZykb8+1w9FnZ38ra3c=;
 b=IlhFVks+kN6GCYfEZifKnf7vrX0buuY1b/HuA4PeXAsLsi55pxG/UGmvis56jLXPFzLc
 xkdgmbgJTaCPebPJDFz0hMJbkA3uWRw8/mTG3+Q4wXw2an5MhBVR5TQFG4FKcCCAbrtE
 MgYx4pOjDHMlcYp4jMKKYcyg1EU4yABx8famGxfBIkAOPcNboXMGQdwZ1DPmrmMv7meC
 ZrJCIvMW7gWkkYRunYnGcF/HRMcgDUiLMjH6A+X9gV2e0nvp4mzlgQyUJDP+pclAXdHn
 g6X2MlnlN0zXUlW32ac7rF/LDBAyQu7v5gl53lafyPxvQHqWbpLjGe1gsjsF/MNeslQ2 1Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6rk0r3v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:48 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fl4n024260; 
 Wed, 26 Apr 2023 00:41:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmcy24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:47 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0flpe024255;
 Wed, 26 Apr 2023 00:41:47 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q0fk3T024254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:47 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id E2F6A532; Tue, 25 Apr 2023 17:41:46 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 06/21] Hexagon (target/hexagon) Remove log_reg_write from
 op_helper.[ch]
Date: Tue, 25 Apr 2023 17:41:45 -0700
Message-Id: <20230426004145.1319112-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: MSYwgbL1c_WAYNC3ORAymw87SaRbLXwi
X-Proofpoint-ORIG-GUID: MSYwgbL1c_WAYNC3ORAymw87SaRbLXwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=616 lowpriorityscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

V2l0aCB0aGUgb3ZlcnJpZGVzIGFkZGVkIGluIHByaW9yIGNvbW1pdHMsIHRoaXMgZnVuY3Rpb24g
aXMgbm90IHVzZWQKUmVtb3ZlIHJlZmVyZW5jZXMgaW4gbWFjcm9zLmgKClNpZ25lZC1vZmYtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9tYWNyb3MuaCAgICB8IDE0IC0tLS0tLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9vcF9oZWxw
ZXIuaCB8ICA0IC0tLS0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIHwgMTcgLS0tLS0tLS0t
LS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMzUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2hleGFnb24vbWFjcm9zLmggYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaAppbmRleCAy
Y2IwNjQ3Y2UyLi45NGE2NzZmYmY5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9tYWNyb3Mu
aAorKysgYi90YXJnZXQvaGV4YWdvbi9tYWNyb3MuaApAQCAtMzQzLDEwICszNDMsNiBAQCBzdGF0
aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2YWwsIGludCBz
aGlmdCkKIAogI2RlZmluZSBmUkVBRF9MUigpIChlbnYtPmdwcltIRVhfUkVHX0xSXSkKIAotI2Rl
ZmluZSBmV1JJVEVfTFIoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTFIsIEEpCi0jZGVm
aW5lIGZXUklURV9GUChBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19GUCwgQSkKLSNkZWZp
bmUgZldSSVRFX1NQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX1NQLCBBKQotCiAjZGVm
aW5lIGZSRUFEX1NQKCkgKGVudi0+Z3ByW0hFWF9SRUdfU1BdKQogI2RlZmluZSBmUkVBRF9MQzAg
KGVudi0+Z3ByW0hFWF9SRUdfTEMwXSkKICNkZWZpbmUgZlJFQURfTEMxIChlbnYtPmdwcltIRVhf
UkVHX0xDMV0pCkBAIC0zNzEsMTYgKzM2Nyw2IEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVh
ZF9pcmVnKFRDR3YgcmVzdWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogI2RlZmluZSBmQlJBTkNI
KExPQywgVFlQRSkgICAgICAgICAgZldSSVRFX05QQyhMT0MpCiAjZGVmaW5lIGZKVU1QUihSRUdO
TywgVEFSR0VULCBUWVBFKSBmQlJBTkNIKFRBUkdFVCwgQ09GX1RZUEVfSlVNUFIpCiAjZGVmaW5l
IGZISU5USlIoVEFSR0VUKSB7IC8qIE5vdCBtb2RlbGxlZCBpbiBxZW11ICovfQotI2RlZmluZSBm
V1JJVEVfTE9PUF9SRUdTMChTVEFSVCwgQ09VTlQpIFwKLSAgICBkbyB7IFwKLSAgICAgICAgbG9n
X3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTEMwLCBDT1VOVCk7ICBcCi0gICAgICAgIGxvZ19yZWdf
d3JpdGUoZW52LCBIRVhfUkVHX1NBMCwgU1RBUlQpOyBcCi0gICAgfSB3aGlsZSAoMCkKLSNkZWZp
bmUgZldSSVRFX0xPT1BfUkVHUzEoU1RBUlQsIENPVU5UKSBcCi0gICAgZG8geyBcCi0gICAgICAg
IGxvZ19yZWdfd3JpdGUoZW52LCBIRVhfUkVHX0xDMSwgQ09VTlQpOyAgXAotICAgICAgICBsb2df
cmVnX3dyaXRlKGVudiwgSEVYX1JFR19TQTEsIFNUQVJUKTtcCi0gICAgfSB3aGlsZSAoMCkKIAog
I2RlZmluZSBmU0VUX09WRVJGTE9XKCkgU0VUX1VTUl9GSUVMRChVU1JfT1ZGLCAxKQogI2RlZmlu
ZSBmU0VUX0xQQ0ZHKFZBTCkgU0VUX1VTUl9GSUVMRChVU1JfTFBDRkcsIChWQUwpKQpkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmggYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxw
ZXIuaAppbmRleCBkYjIyYjU0NDAxLi42YmQ0YjA3ODQ5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuaAorKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuaApAQCAtMTks
MTUgKzE5LDExIEBACiAjZGVmaW5lIEhFWEFHT05fT1BfSEVMUEVSX0gKIAogLyogTWlzYyBmdW5j
dGlvbnMgKi8KLXZvaWQgd3JpdGVfbmV3X3BjKENQVUhleGFnb25TdGF0ZSAqZW52LCBib29sIHBr
dF9oYXNfbXVsdGlfY29mLCB0YXJnZXRfdWxvbmcgYWRkcik7Ci0KIHVpbnQ4X3QgbWVtX2xvYWQx
KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LCB0YXJnZXRfdWxvbmcgdmFkZHIp
OwogdWludDE2X3QgbWVtX2xvYWQyKENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90
LCB0YXJnZXRfdWxvbmcgdmFkZHIpOwogdWludDMyX3QgbWVtX2xvYWQ0KENQVUhleGFnb25TdGF0
ZSAqZW52LCB1aW50MzJfdCBzbG90LCB0YXJnZXRfdWxvbmcgdmFkZHIpOwogdWludDY0X3QgbWVt
X2xvYWQ4KENQVUhleGFnb25TdGF0ZSAqZW52LCB1aW50MzJfdCBzbG90LCB0YXJnZXRfdWxvbmcg
dmFkZHIpOwogCi12b2lkIGxvZ19yZWdfd3JpdGUoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBy
bnVtLAotICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YWwpOwogdm9pZCBsb2dfc3Rv
cmU2NChDUFVIZXhhZ29uU3RhdGUgKmVudiwgdGFyZ2V0X3Vsb25nIGFkZHIsCiAgICAgICAgICAg
ICAgICAgIGludDY0X3QgdmFsLCBpbnQgd2lkdGgsIGludCBzbG90KTsKIHZvaWQgbG9nX3N0b3Jl
MzIoQ1BVSGV4YWdvblN0YXRlICplbnYsIHRhcmdldF91bG9uZyBhZGRyLApkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpp
bmRleCAzY2M3MWI2OWQ5Li43ZTllM2YzMDVlIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9v
cF9oZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtNTIsMjMgKzUy
LDYgQEAgR19OT1JFVFVSTiB2b2lkIEhFTFBFUihyYWlzZV9leGNlcHRpb24pKENQVUhleGFnb25T
dGF0ZSAqZW52LCB1aW50MzJfdCBleGNwKQogICAgIGRvX3JhaXNlX2V4Y2VwdGlvbl9lcnIoZW52
LCBleGNwLCAwKTsKIH0KIAotdm9pZCBsb2dfcmVnX3dyaXRlKENQVUhleGFnb25TdGF0ZSAqZW52
LCBpbnQgcm51bSwKLSAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsKQotewotICAg
IEhFWF9ERUJVR19MT0coImxvZ19yZWdfd3JpdGVbJWRdID0gIiBUQVJHRVRfRk1UX2xkICIgKDB4
IiBUQVJHRVRfRk1UX2x4ICIpIiwKLSAgICAgICAgICAgICAgICAgIHJudW0sIHZhbCwgdmFsKTsK
LSAgICBpZiAodmFsID09IGVudi0+Z3ByW3JudW1dKSB7Ci0gICAgICAgIEhFWF9ERUJVR19MT0co
IiBOTyBDSEFOR0UiKTsKLSAgICB9Ci0gICAgSEVYX0RFQlVHX0xPRygiXG4iKTsKLQotICAgIGVu
di0+bmV3X3ZhbHVlW3JudW1dID0gdmFsOwotICAgIGlmIChIRVhfREVCVUcpIHsKLSAgICAgICAg
LyogRG8gdGhpcyBzbyBIRUxQRVIoZGVidWdfY29tbWl0X2VuZCkgd2lsbCBrbm93ICovCi0gICAg
ICAgIGVudi0+cmVnX3dyaXR0ZW5bcm51bV0gPSAxOwotICAgIH0KLX0KLQogc3RhdGljIHZvaWQg
bG9nX3ByZWRfd3JpdGUoQ1BVSGV4YWdvblN0YXRlICplbnYsIGludCBwbnVtLCB0YXJnZXRfdWxv
bmcgdmFsKQogewogICAgIEhFWF9ERUJVR19MT0coImxvZ19wcmVkX3dyaXRlWyVkXSA9ICIgVEFS
R0VUX0ZNVF9sZAotLSAKMi4yNS4xCgo=

