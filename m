Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8576E88C1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 05:29:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppKws-0003gz-C3; Wed, 19 Apr 2023 23:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwl-0003g1-5p
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1ppKwh-0000Ia-A7
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 23:26:58 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33K0sgfI006637; Thu, 20 Apr 2023 03:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pKSrlFYRbLdxYJGeJk4mWIGB6tb1tgJms1So1hTf/Vg=;
 b=Y+U5PAEqLtRQJ5e2RG57pss8a8B2dSVcAiAy6ng6uMwobGZuWT37acRU3a+HYbi7W13L
 eoM771dUDI+7hdOeZ6SMBkrXl3tz9anVCTTaRkp5SU4mI5fm0WmVEl+0LtFrETu8u44t
 sabV/ZMAyEimcCu+bbXoUWuPkBblgaZfX3EVFO8NFr7sykuzIhvbXtyvPmB063EBhoqS
 kLylA8jXYEof90ZQ/9BMZGBCvaO8LpJSkuAyQMfz0J+tTZ/mPgCnwJIJUm5+gAAKHdLA
 RX8o8JwENrnNZYVPEFWRswJw4RyXm2MZ1XOW3Do86giCtoSguje4TRbA6a3yueub1bgZ Rg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2p4v8ss3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:48 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33K3QU23003841; 
 Thu, 20 Apr 2023 03:26:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3q2ax2nv0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:47 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33K3QlQV004392;
 Thu, 20 Apr 2023 03:26:47 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 33K3QlIj004387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 03:26:47 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 047C868E; Wed, 19 Apr 2023 20:26:47 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 04/11] Hexagon (target/hexagon) Remove redundant/unused macros
Date: Wed, 19 Apr 2023 20:26:27 -0700
Message-Id: <20230420032634.105311-5-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: JTKmZlzSzNlgayYN3hhlmVec0QuejQ4B
X-Proofpoint-ORIG-GUID: JTKmZlzSzNlgayYN3hhlmVec0QuejQ4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_16,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 mlxlogscore=423 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

UmVtb3ZlIHRoZSBmb2xsb3dpbmcgbWFjcm9zIChyZW1uYW50cyBvZiB0aGUgb2xkIGdlbmVyYXRv
ciBkZXNpZ24pCiAgICBSRUFEX1JFRwogICAgUkVBRF9QUkVHCiAgICBXUklURV9SUkVHCiAgICBX
UklURV9QUkVHCk1vZGlmeSBtYWNyb3MgdGhhdCByZWx5IG9uIHRoZSBhYm92ZQoKVGhlIGZvbGxv
d2luZyBhcmUgdW51c2VkCiAgICBSRUFEX0lSRUcKICAgIGZHRVRfRklFTEQKICAgIGZTRVRfRklF
TEQKICAgIGZSRUFEX1AzCiAgICBmUkVBRF9OUEMKICAgIGZXUklURV9MQzAKICAgIGZXUklURV9M
QzEKClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4K
UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8u
b3JnPgpNZXNzYWdlLUlkOiA8MjAyMzA0MDUxODMwNDguMTQ3NzY3LTEtdHNpbXBzb25AcXVpY2lu
Yy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggfCA2NSArKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDQzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL21hY3Jvcy5o
IGIvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKaW5kZXggNDgyYTljNzg3Zi4uZjVmMzFiNjkzMCAx
MDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vbWFjcm9zLmgKKysrIGIvdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmgKQEAgLTIyLDE2ICsyMiw2IEBACiAjaW5jbHVkZSAiaGV4X3JlZ3MuaCIKICNpbmNs
dWRlICJyZWdfZmllbGRzLmgiCiAKLSNpZmRlZiBRRU1VX0dFTkVSQVRFCi0jZGVmaW5lIFJFQURf
UkVHKGRlc3QsIE5VTSkgICAgICAgICAgICAgIGdlbl9yZWFkX3JlZyhkZXN0LCBOVU0pCi0jZWxz
ZQotI2RlZmluZSBSRUFEX1JFRyhOVU0pICAgICAgICAgICAgICAgICAgICAoZW52LT5ncHJbKE5V
TSldKQotI2RlZmluZSBSRUFEX1BSRUcoTlVNKSAgICAgICAgICAgICAgICAgICAoZW52LT5wcmVk
W05VTV0pCi0KLSNkZWZpbmUgV1JJVEVfUlJFRyhOVU0sIFZBTCkgICAgICAgICAgICAgbG9nX3Jl
Z193cml0ZShlbnYsIE5VTSwgVkFMLCBzbG90KQotI2RlZmluZSBXUklURV9QUkVHKE5VTSwgVkFM
KSAgICAgICAgICAgICBsb2dfcHJlZF93cml0ZShlbnYsIE5VTSwgVkFMKQotI2VuZGlmCi0KICNk
ZWZpbmUgUENBTElHTiA0CiAjZGVmaW5lIFBDQUxJR05fTUFTSyAoUENBTElHTiAtIDEpCiAKQEAg
LTM2MSwzNyArMzUxLDMwIEBAIHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3Yg
cmVzdWx0LCBUQ0d2IHZhbCwgaW50IHNoaWZ0KQogICAgIHRjZ19nZW5fc2hsaV90bChyZXN1bHQs
IHJlc3VsdCwgc2hpZnQpOwogICAgIHJldHVybiByZXN1bHQ7CiB9Ci0jZGVmaW5lIGZSRUFEX0lS
RUcoVkFMLCBTSElGVCkgZ2VuX3JlYWRfaXJlZyhpcmVnLCAoVkFMKSwgKFNISUZUKSkKLSNlbHNl
Ci0jZGVmaW5lIGZSRUFEX0lSRUcoVkFMKSBcCi0gICAgKGZTWFROKDExLCA2NCwgKCgoVkFMKSAm
IDB4ZjAwMDAwMDApID4+IDIxKSB8ICgoVkFMID4+IDE3KSAmIDB4N2YpKSkKICNlbmRpZgogCi0j
ZGVmaW5lIGZSRUFEX0xSKCkgKFJFQURfUkVHKEhFWF9SRUdfTFIpKQorI2RlZmluZSBmUkVBRF9M
UigpIChlbnYtPmdwcltIRVhfUkVHX0xSXSkKIAotI2RlZmluZSBmV1JJVEVfTFIoQSkgV1JJVEVf
UlJFRyhIRVhfUkVHX0xSLCBBKQotI2RlZmluZSBmV1JJVEVfRlAoQSkgV1JJVEVfUlJFRyhIRVhf
UkVHX0ZQLCBBKQotI2RlZmluZSBmV1JJVEVfU1AoQSkgV1JJVEVfUlJFRyhIRVhfUkVHX1NQLCBB
KQorI2RlZmluZSBmV1JJVEVfTFIoQSkgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfTFIsIEEs
IHNsb3QpCisjZGVmaW5lIGZXUklURV9GUChBKSBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19G
UCwgQSwgc2xvdCkKKyNkZWZpbmUgZldSSVRFX1NQKEEpIGxvZ19yZWdfd3JpdGUoZW52LCBIRVhf
UkVHX1NQLCBBLCBzbG90KQogCi0jZGVmaW5lIGZSRUFEX1NQKCkgKFJFQURfUkVHKEhFWF9SRUdf
U1ApKQotI2RlZmluZSBmUkVBRF9MQzAgKFJFQURfUkVHKEhFWF9SRUdfTEMwKSkKLSNkZWZpbmUg
ZlJFQURfTEMxIChSRUFEX1JFRyhIRVhfUkVHX0xDMSkpCi0jZGVmaW5lIGZSRUFEX1NBMCAoUkVB
RF9SRUcoSEVYX1JFR19TQTApKQotI2RlZmluZSBmUkVBRF9TQTEgKFJFQURfUkVHKEhFWF9SRUdf
U0ExKSkKLSNkZWZpbmUgZlJFQURfRlAoKSAoUkVBRF9SRUcoSEVYX1JFR19GUCkpCisjZGVmaW5l
IGZSRUFEX1NQKCkgKGVudi0+Z3ByW0hFWF9SRUdfU1BdKQorI2RlZmluZSBmUkVBRF9MQzAgKGVu
di0+Z3ByW0hFWF9SRUdfTEMwXSkKKyNkZWZpbmUgZlJFQURfTEMxIChlbnYtPmdwcltIRVhfUkVH
X0xDMV0pCisjZGVmaW5lIGZSRUFEX1NBMCAoZW52LT5ncHJbSEVYX1JFR19TQTBdKQorI2RlZmlu
ZSBmUkVBRF9TQTEgKGVudi0+Z3ByW0hFWF9SRUdfU0ExXSkKKyNkZWZpbmUgZlJFQURfRlAoKSAo
ZW52LT5ncHJbSEVYX1JFR19GUF0pCiAjaWZkZWYgRklYTUUKIC8qIEZpZ3VyZSBvdXQgaG93IHRv
IGdldCBpbnNuLT5leHRlbnNpb25fdmFsaWQgdG8gaGVscGVyICovCiAjZGVmaW5lIGZSRUFEX0dQ
KCkgXAotICAgIChpbnNuLT5leHRlbnNpb25fdmFsaWQgPyAwIDogUkVBRF9SRUcoSEVYX1JFR19H
UCkpCisgICAgKGluc24tPmV4dGVuc2lvbl92YWxpZCA/IDAgOiBlbnYtPmdwcltIRVhfUkVHX0dQ
XSkKICNlbHNlCi0jZGVmaW5lIGZSRUFEX0dQKCkgUkVBRF9SRUcoSEVYX1JFR19HUCkKKyNkZWZp
bmUgZlJFQURfR1AoKSAoZW52LT5ncHJbSEVYX1JFR19HUF0pCiAjZW5kaWYKICNkZWZpbmUgZlJF
QURfUEMoKSAoUEMpCiAKLSNkZWZpbmUgZlJFQURfTlBDKCkgKG5leHRfUEMgJiAoMHhmZmZmZmZm
ZSkpCi0KLSNkZWZpbmUgZlJFQURfUDAoKSAoUkVBRF9QUkVHKDApKQotI2RlZmluZSBmUkVBRF9Q
MygpIChSRUFEX1BSRUcoMykpCisjZGVmaW5lIGZSRUFEX1AwKCkgKGVudi0+cHJlZFswXSkKIAog
I2RlZmluZSBmQ0hFQ0tfUENBTElHTihBKQogCkBAIC00MDIsMjQgKzM4NSwyMiBAQCBzdGF0aWMg
aW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhUQ0d2IHJlc3VsdCwgVENHdiB2YWwsIGludCBzaGlm
dCkKICNkZWZpbmUgZkhJTlRKUihUQVJHRVQpIHsgLyogTm90IG1vZGVsbGVkIGluIHFlbXUgKi99
CiAjZGVmaW5lIGZXUklURV9MT09QX1JFR1MwKFNUQVJULCBDT1VOVCkgXAogICAgIGRvIHsgXAot
ICAgICAgICBXUklURV9SUkVHKEhFWF9SRUdfTEMwLCBDT1VOVCk7ICBcCi0gICAgICAgIFdSSVRF
X1JSRUcoSEVYX1JFR19TQTAsIFNUQVJUKTsgXAorICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwg
SEVYX1JFR19MQzAsIENPVU5ULCBzbG90KTsgIFwKKyAgICAgICAgbG9nX3JlZ193cml0ZShlbnYs
IEhFWF9SRUdfU0EwLCBTVEFSVCwgc2xvdCk7IFwKICAgICB9IHdoaWxlICgwKQogI2RlZmluZSBm
V1JJVEVfTE9PUF9SRUdTMShTVEFSVCwgQ09VTlQpIFwKICAgICBkbyB7IFwKLSAgICAgICAgV1JJ
VEVfUlJFRyhIRVhfUkVHX0xDMSwgQ09VTlQpOyAgXAotICAgICAgICBXUklURV9SUkVHKEhFWF9S
RUdfU0ExLCBTVEFSVCk7XAorICAgICAgICBsb2dfcmVnX3dyaXRlKGVudiwgSEVYX1JFR19MQzEs
IENPVU5ULCBzbG90KTsgIFwKKyAgICAgICAgbG9nX3JlZ193cml0ZShlbnYsIEhFWF9SRUdfU0Ex
LCBTVEFSVCwgc2xvdCk7XAogICAgIH0gd2hpbGUgKDApCi0jZGVmaW5lIGZXUklURV9MQzAoVkFM
KSBXUklURV9SUkVHKEhFWF9SRUdfTEMwLCBWQUwpCi0jZGVmaW5lIGZXUklURV9MQzEoVkFMKSBX
UklURV9SUkVHKEhFWF9SRUdfTEMxLCBWQUwpCiAKICNkZWZpbmUgZlNFVF9PVkVSRkxPVygpIFNF
VF9VU1JfRklFTEQoVVNSX09WRiwgMSkKICNkZWZpbmUgZlNFVF9MUENGRyhWQUwpIFNFVF9VU1Jf
RklFTEQoVVNSX0xQQ0ZHLCAoVkFMKSkKICNkZWZpbmUgZkdFVF9MUENGRyAoR0VUX1VTUl9GSUVM
RChVU1JfTFBDRkcpKQotI2RlZmluZSBmV1JJVEVfUDAoVkFMKSBXUklURV9QUkVHKDAsIFZBTCkK
LSNkZWZpbmUgZldSSVRFX1AxKFZBTCkgV1JJVEVfUFJFRygxLCBWQUwpCi0jZGVmaW5lIGZXUklU
RV9QMihWQUwpIFdSSVRFX1BSRUcoMiwgVkFMKQotI2RlZmluZSBmV1JJVEVfUDMoVkFMKSBXUklU
RV9QUkVHKDMsIFZBTCkKKyNkZWZpbmUgZldSSVRFX1AwKFZBTCkgbG9nX3ByZWRfd3JpdGUoZW52
LCAwLCBWQUwpCisjZGVmaW5lIGZXUklURV9QMShWQUwpIGxvZ19wcmVkX3dyaXRlKGVudiwgMSwg
VkFMKQorI2RlZmluZSBmV1JJVEVfUDIoVkFMKSBsb2dfcHJlZF93cml0ZShlbnYsIDIsIFZBTCkK
KyNkZWZpbmUgZldSSVRFX1AzKFZBTCkgbG9nX3ByZWRfd3JpdGUoZW52LCAzLCBWQUwpCiAjZGVm
aW5lIGZQQVJUMShXT1JLKSBpZiAocGFydDEpIHsgV09SSzsgcmV0dXJuOyB9CiAjZGVmaW5lIGZD
QVNUNHUoQSkgKCh1aW50MzJfdCkoQSkpCiAjZGVmaW5lIGZDQVNUNHMoQSkgKChpbnQzMl90KShB
KSkKQEAgLTU3Niw3ICs1NTcsNyBAQCBzdGF0aWMgaW5saW5lIFRDR3YgZ2VuX3JlYWRfaXJlZyhU
Q0d2IHJlc3VsdCwgVENHdiB2YWwsIGludCBzaGlmdCkKIAogI2RlZmluZSBmTUVNT1AoTlVNLCBT
SVpFLCBTSUdOLCBFQSwgRk5UWVBFLCBWQUxVRSkKIAotI2RlZmluZSBmR0VUX0ZSQU1FS0VZKCkg
UkVBRF9SRUcoSEVYX1JFR19GUkFNRUtFWSkKKyNkZWZpbmUgZkdFVF9GUkFNRUtFWSgpIChlbnYt
PmdwcltIRVhfUkVHX0ZSQU1FS0VZXSkKICNkZWZpbmUgZkZSQU1FX1NDUkFNQkxFKFZBTCkgKChW
QUwpIF4gKGZDQVNUOHUoZkdFVF9GUkFNRUtFWSgpKSA8PCAzMikpCiAjZGVmaW5lIGZGUkFNRV9V
TlNDUkFNQkxFKFZBTCkgZkZSQU1FX1NDUkFNQkxFKFZBTCkKIApAQCAtNjg2LDggKzY2Nyw2IEBA
IHN0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVzdWx0LCBUQ0d2IHZhbCwg
aW50IHNoaWZ0KQogICAgIGZFWFRSQUNUVV9CSVRTKGVudi0+Z3ByW0hFWF9SRUdfIyNSRUddLCBc
CiAgICAgICAgICAgICAgICAgICAgcmVnX2ZpZWxkX2luZm9bRklFTERdLndpZHRoLCBcCiAgICAg
ICAgICAgICAgICAgICAgcmVnX2ZpZWxkX2luZm9bRklFTERdLm9mZnNldCkKLSNkZWZpbmUgZkdF
VF9GSUVMRChWQUwsIEZJRUxEKQotI2RlZmluZSBmU0VUX0ZJRUxEKFZBTCwgRklFTEQsIE5FV1ZB
TCkKICNkZWZpbmUgZkJBUlJJRVIoKQogI2RlZmluZSBmU1lOQ0goKQogI2RlZmluZSBmSVNZTkMo
KQotLSAKMi4yNS4xCgo=

