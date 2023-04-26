Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CE66EEB9D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:44:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFj-0008Dq-TV; Tue, 25 Apr 2023 20:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFY-00083T-H9
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTF8-0006Pj-Bk
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:10 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PLOjr7015281; Wed, 26 Apr 2023 00:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SspOxHWUMSJmBmMuAB/hxZuhwmEoUqlmwCMvLO/NM3k=;
 b=ltws5T60wdmu6hvorcnbe5iUo1WaMaV6KCwDMJ0uYu2uLInUAmX6y2wms0M3FYIA//fp
 1rj8ELQxVc+ID+6AmpQUll4LGt4aA9WEnv0an8GiRaa6J1bEWlYVjL0XqfgyvPDsZaim
 OL6kmSatIDT1OfMr6dAYyBQzYXuQs9uWNOy/h2i7f5pjEQP3Lde1CjbkKcYwJ2LxYYNZ
 ohMThVesLD2CQUGYiLmDcCmlrE1DsoVc1QNd1Mt8YYV5UYoVB1AhQ0zoGIiexPz069cJ
 jUgz+YH5huzqPEz4zM68vte+xx+qTudWuLFYVMX0YG8eqL5YIFsXPK4/mEIyXPJGwpzU Wg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6a4wtddq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:38 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gbNZ004668; 
 Wed, 26 Apr 2023 00:42:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3q48nm4yu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:37 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0f9MT003641;
 Wed, 26 Apr 2023 00:42:37 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 33Q0gagE004655
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id AD161694; Tue, 25 Apr 2023 17:42:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 17/21] Hexagon (target/hexagon) Move new_value to DisasContext
Date: Tue, 25 Apr 2023 17:42:32 -0700
Message-Id: <20230426004234.1319401-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426004234.1319401-1-tsimpson@quicinc.com>
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kv6R3Id938o89Wt0Nijey2dMH9oIA-_8
X-Proofpoint-GUID: kv6R3Id938o89Wt0Nijey2dMH9oIA-_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxlogscore=799
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
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
b25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAgfCAgMSAtCiB0
YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCB8ICAyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIu
YyAgICB8ICA2ICsrKysrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAxNCArKystLS0t
LS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2NwdS5oIGIvdGFyZ2V0L2hleGFnb24vY3B1
LmgKaW5kZXggMzY4N2YyY2FhMi4uMjJhYmEyMGJlMiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vY3B1LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmgKQEAgLTg1LDcgKzg1LDYgQEAgdHlw
ZWRlZiBzdHJ1Y3QgQ1BVQXJjaFN0YXRlIHsKICAgICB0YXJnZXRfdWxvbmcgc3RhY2tfc3RhcnQ7
CiAKICAgICB1aW50OF90IHNsb3RfY2FuY2VsbGVkOwotICAgIHRhcmdldF91bG9uZyBuZXdfdmFs
dWVbVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKICAgICB0YXJnZXRfdWxvbmcgbmV3X3ZhbHVlX3Vz
cjsKIAogICAgIC8qCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCBiL3Rh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCmluZGV4IDRjMTc0MzNhNmYuLjZkZGU0ODc1NjYgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCisrKyBiL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5oCkBAIC02OSw2ICs2OSw3IEBAIHR5cGVkZWYgc3RydWN0IERpc2FzQ29udGV4
dCB7CiAgICAgYm9vbCBuZWVkX3BrdF9oYXNfc3RvcmVfczE7CiAgICAgYm9vbCBzaG9ydF9jaXJj
dWl0OwogICAgIGJvb2wgaGFzX2h2eF9oZWxwZXI7CisgICAgVENHdiBuZXdfdmFsdWVbVE9UQUxf
UEVSX1RIUkVBRF9SRUdTXTsKIH0gRGlzYXNDb250ZXh0OwogCiBzdGF0aWMgaW5saW5lIHZvaWQg
Y3R4X2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcG51bSkKQEAgLTE5MCw3
ICsxOTEsNiBAQCBleHRlcm4gVENHdiBoZXhfcHJlZFtOVU1fUFJFR1NdOwogZXh0ZXJuIFRDR3Yg
aGV4X3RoaXNfUEM7CiBleHRlcm4gVENHdiBoZXhfc2xvdF9jYW5jZWxsZWQ7CiBleHRlcm4gVENH
diBoZXhfYnJhbmNoX3Rha2VuOwotZXh0ZXJuIFRDR3YgaGV4X25ld192YWx1ZVtUT1RBTF9QRVJf
VEhSRUFEX1JFR1NdOwogZXh0ZXJuIFRDR3YgaGV4X25ld192YWx1ZV91c3I7CiBleHRlcm4gVENH
diBoZXhfcmVnX3dyaXR0ZW5bVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKIGV4dGVybiBUQ0d2IGhl
eF9uZXdfcHJlZF92YWx1ZVtOVU1fUFJFR1NdOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCBlNjMyNzQyNWNkLi40N2Q0
NzJmNTg2IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYwpAQCAtNzQsNyArNzQsMTEgQEAgVENHdiBnZXRfcmVzdWx0X2dwcihE
aXNhc0NvbnRleHQgKmN0eCwgaW50IHJudW0pCiAgICAgICAgIGlmIChybnVtID09IEhFWF9SRUdf
VVNSKSB7CiAgICAgICAgICAgICByZXR1cm4gaGV4X25ld192YWx1ZV91c3I7CiAgICAgICAgIH0g
ZWxzZSB7Ci0gICAgICAgICAgICByZXR1cm4gaGV4X25ld192YWx1ZVtybnVtXTsKKyAgICAgICAg
ICAgIGlmIChjdHgtPm5ld192YWx1ZVtybnVtXSA9PSBOVUxMKSB7CisgICAgICAgICAgICAgICAg
Y3R4LT5uZXdfdmFsdWVbcm51bV0gPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICAgICAgICAgICAgICB0
Y2dfZ2VuX21vdmlfdGwoY3R4LT5uZXdfdmFsdWVbcm51bV0sIDApOworICAgICAgICAgICAgfQor
ICAgICAgICAgICAgcmV0dXJuIGN0eC0+bmV3X3ZhbHVlW3JudW1dOwogICAgICAgICB9CiAgICAg
fSBlbHNlIHsKICAgICAgICAgcmV0dXJuIGhleF9ncHJbcm51bV07CmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4
IDBhZmIzYTA5OTMuLjNkNmIyMmE1NzcgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5z
bGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC00NCw3ICs0NCw2IEBA
IFRDR3YgaGV4X3ByZWRbTlVNX1BSRUdTXTsKIFRDR3YgaGV4X3RoaXNfUEM7CiBUQ0d2IGhleF9z
bG90X2NhbmNlbGxlZDsKIFRDR3YgaGV4X2JyYW5jaF90YWtlbjsKLVRDR3YgaGV4X25ld192YWx1
ZVtUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogVENHdiBoZXhfbmV3X3ZhbHVlX3VzcjsKIFRDR3Yg
aGV4X3JlZ193cml0dGVuW1RPVEFMX1BFUl9USFJFQURfUkVHU107CiBUQ0d2IGhleF9uZXdfcHJl
ZF92YWx1ZVtOVU1fUFJFR1NdOwpAQCAtNTEzLDYgKzUxMiw5IEBAIHN0YXRpYyB2b2lkIGdlbl9z
dGFydF9wYWNrZXQoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgfQogICAgIGN0eC0+czFfc3RvcmVf
cHJvY2Vzc2VkID0gZmFsc2U7CiAgICAgY3R4LT5wcmVfY29tbWl0ID0gdHJ1ZTsKKyAgICBmb3Ig
KGkgPSAwOyBpIDwgVE9UQUxfUEVSX1RIUkVBRF9SRUdTOyBpKyspIHsKKyAgICAgICAgY3R4LT5u
ZXdfdmFsdWVbaV0gPSBOVUxMOworICAgIH0KIAogICAgIGFuYWx5emVfcGFja2V0KGN0eCk7CiAK
QEAgLTExNTYsNyArMTE1OCw2IEBAIHZvaWQgZ2VuX2ludGVybWVkaWF0ZV9jb2RlKENQVVN0YXRl
ICpjcywgVHJhbnNsYXRpb25CbG9jayAqdGIsIGludCAqbWF4X2luc25zLAogfQogCiAjZGVmaW5l
IE5BTUVfTEVOICAgICAgICAgICAgICAgNjQKLXN0YXRpYyBjaGFyIG5ld192YWx1ZV9uYW1lc1tU
T1RBTF9QRVJfVEhSRUFEX1JFR1NdW05BTUVfTEVOXTsKIHN0YXRpYyBjaGFyIHJlZ193cml0dGVu
X25hbWVzW1RPVEFMX1BFUl9USFJFQURfUkVHU11bTkFNRV9MRU5dOwogc3RhdGljIGNoYXIgbmV3
X3ByZWRfdmFsdWVfbmFtZXNbTlVNX1BSRUdTXVtOQU1FX0xFTl07CiBzdGF0aWMgY2hhciBzdG9y
ZV9hZGRyX25hbWVzW1NUT1JFU19NQVhdW05BTUVfTEVOXTsKQEAgLTExNzgsMTUgKzExNzksNiBA
QCB2b2lkIGhleGFnb25fdHJhbnNsYXRlX2luaXQodm9pZCkKICAgICAgICAgICAgIG9mZnNldG9m
KENQVUhleGFnb25TdGF0ZSwgZ3ByW2ldKSwKICAgICAgICAgICAgIGhleGFnb25fcmVnbmFtZXNb
aV0pOwogCi0gICAgICAgIGlmIChpID09IEhFWF9SRUdfVVNSKSB7Ci0gICAgICAgICAgICBoZXhf
bmV3X3ZhbHVlW2ldID0gTlVMTDsKLSAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgIHNucHJp
bnRmKG5ld192YWx1ZV9uYW1lc1tpXSwgTkFNRV9MRU4sICJuZXdfJXMiLCBoZXhhZ29uX3JlZ25h
bWVzW2ldKTsKLSAgICAgICAgICAgIGhleF9uZXdfdmFsdWVbaV0gPSB0Y2dfZ2xvYmFsX21lbV9u
ZXcoY3B1X2VudiwKLSAgICAgICAgICAgICAgICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIG5l
d192YWx1ZVtpXSksCi0gICAgICAgICAgICAgICAgbmV3X3ZhbHVlX25hbWVzW2ldKTsKLSAgICAg
ICAgfQotCiAgICAgICAgIGlmIChIRVhfREVCVUcpIHsKICAgICAgICAgICAgIHNucHJpbnRmKHJl
Z193cml0dGVuX25hbWVzW2ldLCBOQU1FX0xFTiwgInJlZ193cml0dGVuXyVzIiwKICAgICAgICAg
ICAgICAgICAgICAgIGhleGFnb25fcmVnbmFtZXNbaV0pOwotLSAKMi4yNS4xCgo=

