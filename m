Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242877011A8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:54:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxacY-0002xQ-Rt; Fri, 12 May 2023 17:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxacE-0002mW-Ub
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxaby-00065c-JE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:54 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CKqin3027365; Fri, 12 May 2023 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NR1Kng4lUvXOSG0/0nPqw1LSLSYuKgBpeN3BhrHV1UQ=;
 b=M+HTPVO0Z45tqlYny/jGsiWng7RvrcYr8q14UiueJ01oVfUy+M2MgpqMlg7pl6v09U/s
 80No9kvyfXwZP1Ny6Qn11F1Wy7ZtDWP06paViHv2j/pnWd9HWBoL6INdDaZErHbTyBFx
 MF/gxp9UInbl3SEwi1wf+RieJFqH3KjmS7xN1uOC6uEWsoMl5S0ysE/87hx+2hE9zxzZ
 ex+Vn6qEtk7cIHJl/v7LgdlcBngMYxn3izXof25m4bajiyW+r8KTJtaBvzyuxuKIZwhA
 eCZpnerN/q5l/NoV1ilPM7LaTG16vgFwylvibAwKbW2tSU2rTJWlBKZE/qzZJV8eFtIk Dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qh8hm2t6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlOH6024175; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3qf6j64ms7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlNCo024146;
 Fri, 12 May 2023 21:47:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 34CLlN2k024117
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 235976D3; Fri, 12 May 2023 14:47:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 26/44] Hexagon (target/hexagon) Move new_value to DisasContext
Date: Fri, 12 May 2023 14:46:48 -0700
Message-Id: <20230512214706.946068-27-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: smCInOozKhw-12HOxohctyt-taxBfQCe
X-Proofpoint-ORIG-GUID: smCInOozKhw-12HOxohctyt-taxBfQCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=740 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120183
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

VGhlIG5ld192YWx1ZSBhcnJheSBpbiB0aGUgQ1BVSGV4YWdvblN0YXRlIGlzIG9ubHkgdXNlZCBm
b3IgYm9va2tlZXBpbmcKd2l0aGluIHRoZSB0cmFuc2xhdGlvbiBvZiBhIHBhY2tldC4gIFdpdGgg
cmVjZW50IGNoYW5nZXMgdGhhdCBlbGltaW5hdGUKdGhlIG5lZWQgdG8gZnJlZSBUQ0d2IHZhcmlh
YmxlcywgdGhlc2UgbWFrZSBtb3JlIHNlbnNlIHRvIGJlIHRyYW5zaWVudAphbmQga2VwdCBpbiBE
aXNhc0NvbnRleHQuCgpTdWdnZXN0ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhl
bmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIwMjMwNDI3MjMwMDEyLjM4MDAzMjct
MTgtdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAg
fCAgMSAtCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCB8ICAyICstCiB0YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYyAgICB8ICA2ICsrKysrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCAx
NCArKystLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2NwdS5oIGIvdGFyZ2V0L2hl
eGFnb24vY3B1LmgKaW5kZXggZjg2YzlmMDEzMS4uMGVmNmQ3MTdkMCAxMDA2NDQKLS0tIGEvdGFy
Z2V0L2hleGFnb24vY3B1LmgKKysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LmgKQEAgLTg5LDcgKzg5
LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgQ1BVQXJjaFN0YXRlIHsKICAgICB0YXJnZXRfdWxvbmcgc3Rh
Y2tfc3RhcnQ7CiAKICAgICB1aW50OF90IHNsb3RfY2FuY2VsbGVkOwotICAgIHRhcmdldF91bG9u
ZyBuZXdfdmFsdWVbVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKICAgICB0YXJnZXRfdWxvbmcgbmV3
X3ZhbHVlX3VzcjsKIAogICAgIC8qCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xh
dGUuaCBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCmluZGV4IDRjMTc0MzNhNmYuLjZkZGU0
ODc1NjYgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL3RyYW5zbGF0ZS5oCkBAIC02OSw2ICs2OSw3IEBAIHR5cGVkZWYgc3RydWN0IERp
c2FzQ29udGV4dCB7CiAgICAgYm9vbCBuZWVkX3BrdF9oYXNfc3RvcmVfczE7CiAgICAgYm9vbCBz
aG9ydF9jaXJjdWl0OwogICAgIGJvb2wgaGFzX2h2eF9oZWxwZXI7CisgICAgVENHdiBuZXdfdmFs
dWVbVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKIH0gRGlzYXNDb250ZXh0OwogCiBzdGF0aWMgaW5s
aW5lIHZvaWQgY3R4X2xvZ19wcmVkX3dyaXRlKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcG51bSkK
QEAgLTE5MCw3ICsxOTEsNiBAQCBleHRlcm4gVENHdiBoZXhfcHJlZFtOVU1fUFJFR1NdOwogZXh0
ZXJuIFRDR3YgaGV4X3RoaXNfUEM7CiBleHRlcm4gVENHdiBoZXhfc2xvdF9jYW5jZWxsZWQ7CiBl
eHRlcm4gVENHdiBoZXhfYnJhbmNoX3Rha2VuOwotZXh0ZXJuIFRDR3YgaGV4X25ld192YWx1ZVtU
T1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogZXh0ZXJuIFRDR3YgaGV4X25ld192YWx1ZV91c3I7CiBl
eHRlcm4gVENHdiBoZXhfcmVnX3dyaXR0ZW5bVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKIGV4dGVy
biBUQ0d2IGhleF9uZXdfcHJlZF92YWx1ZVtOVU1fUFJFR1NdOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCBiZmNiOTYy
YTNkLi4zNzIxMGU2ZjA5IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysg
Yi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtNzQsNyArNzQsMTEgQEAgVENHdiBnZXRfcmVz
dWx0X2dwcihEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJudW0pCiAgICAgICAgIGlmIChybnVtID09
IEhFWF9SRUdfVVNSKSB7CiAgICAgICAgICAgICByZXR1cm4gaGV4X25ld192YWx1ZV91c3I7CiAg
ICAgICAgIH0gZWxzZSB7Ci0gICAgICAgICAgICByZXR1cm4gaGV4X25ld192YWx1ZVtybnVtXTsK
KyAgICAgICAgICAgIGlmIChjdHgtPm5ld192YWx1ZVtybnVtXSA9PSBOVUxMKSB7CisgICAgICAg
ICAgICAgICAgY3R4LT5uZXdfdmFsdWVbcm51bV0gPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICAgICAg
ICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoY3R4LT5uZXdfdmFsdWVbcm51bV0sIDApOworICAgICAg
ICAgICAgfQorICAgICAgICAgICAgcmV0dXJuIGN0eC0+bmV3X3ZhbHVlW3JudW1dOwogICAgICAg
ICB9CiAgICAgfSBlbHNlIHsKICAgICAgICAgcmV0dXJuIGhleF9ncHJbcm51bV07CmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5jCmluZGV4IGU3M2MwMDY2ZGQuLmJjYTQyNzk3YzAgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhh
Z29uL3RyYW5zbGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC00NCw3
ICs0NCw2IEBAIFRDR3YgaGV4X3ByZWRbTlVNX1BSRUdTXTsKIFRDR3YgaGV4X3RoaXNfUEM7CiBU
Q0d2IGhleF9zbG90X2NhbmNlbGxlZDsKIFRDR3YgaGV4X2JyYW5jaF90YWtlbjsKLVRDR3YgaGV4
X25ld192YWx1ZVtUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwogVENHdiBoZXhfbmV3X3ZhbHVlX3Vz
cjsKIFRDR3YgaGV4X3JlZ193cml0dGVuW1RPVEFMX1BFUl9USFJFQURfUkVHU107CiBUQ0d2IGhl
eF9uZXdfcHJlZF92YWx1ZVtOVU1fUFJFR1NdOwpAQCAtNTEzLDYgKzUxMiw5IEBAIHN0YXRpYyB2
b2lkIGdlbl9zdGFydF9wYWNrZXQoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgfQogICAgIGN0eC0+
czFfc3RvcmVfcHJvY2Vzc2VkID0gZmFsc2U7CiAgICAgY3R4LT5wcmVfY29tbWl0ID0gdHJ1ZTsK
KyAgICBmb3IgKGkgPSAwOyBpIDwgVE9UQUxfUEVSX1RIUkVBRF9SRUdTOyBpKyspIHsKKyAgICAg
ICAgY3R4LT5uZXdfdmFsdWVbaV0gPSBOVUxMOworICAgIH0KIAogICAgIGFuYWx5emVfcGFja2V0
KGN0eCk7CiAKQEAgLTExNTksNyArMTE2MSw2IEBAIHZvaWQgZ2VuX2ludGVybWVkaWF0ZV9jb2Rl
KENQVVN0YXRlICpjcywgVHJhbnNsYXRpb25CbG9jayAqdGIsIGludCAqbWF4X2luc25zLAogfQog
CiAjZGVmaW5lIE5BTUVfTEVOICAgICAgICAgICAgICAgNjQKLXN0YXRpYyBjaGFyIG5ld192YWx1
ZV9uYW1lc1tUT1RBTF9QRVJfVEhSRUFEX1JFR1NdW05BTUVfTEVOXTsKIHN0YXRpYyBjaGFyIHJl
Z193cml0dGVuX25hbWVzW1RPVEFMX1BFUl9USFJFQURfUkVHU11bTkFNRV9MRU5dOwogc3RhdGlj
IGNoYXIgbmV3X3ByZWRfdmFsdWVfbmFtZXNbTlVNX1BSRUdTXVtOQU1FX0xFTl07CiBzdGF0aWMg
Y2hhciBzdG9yZV9hZGRyX25hbWVzW1NUT1JFU19NQVhdW05BTUVfTEVOXTsKQEAgLTExODEsMTUg
KzExODIsNiBAQCB2b2lkIGhleGFnb25fdHJhbnNsYXRlX2luaXQodm9pZCkKICAgICAgICAgICAg
IG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgZ3ByW2ldKSwKICAgICAgICAgICAgIGhleGFnb25f
cmVnbmFtZXNbaV0pOwogCi0gICAgICAgIGlmIChpID09IEhFWF9SRUdfVVNSKSB7Ci0gICAgICAg
ICAgICBoZXhfbmV3X3ZhbHVlW2ldID0gTlVMTDsKLSAgICAgICAgfSBlbHNlIHsKLSAgICAgICAg
ICAgIHNucHJpbnRmKG5ld192YWx1ZV9uYW1lc1tpXSwgTkFNRV9MRU4sICJuZXdfJXMiLCBoZXhh
Z29uX3JlZ25hbWVzW2ldKTsKLSAgICAgICAgICAgIGhleF9uZXdfdmFsdWVbaV0gPSB0Y2dfZ2xv
YmFsX21lbV9uZXcoY3B1X2VudiwKLSAgICAgICAgICAgICAgICBvZmZzZXRvZihDUFVIZXhhZ29u
U3RhdGUsIG5ld192YWx1ZVtpXSksCi0gICAgICAgICAgICAgICAgbmV3X3ZhbHVlX25hbWVzW2ld
KTsKLSAgICAgICAgfQotCiAgICAgICAgIGlmIChIRVhfREVCVUcpIHsKICAgICAgICAgICAgIHNu
cHJpbnRmKHJlZ193cml0dGVuX25hbWVzW2ldLCBOQU1FX0xFTiwgInJlZ193cml0dGVuXyVzIiwK
ICAgICAgICAgICAgICAgICAgICAgIGhleGFnb25fcmVnbmFtZXNbaV0pOwotLSAKMi4yNS4xCgo=

