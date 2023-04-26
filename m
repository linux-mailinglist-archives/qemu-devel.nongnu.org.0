Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A46EEBA8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:47:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFm-0000Ha-6S; Tue, 25 Apr 2023 20:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFc-00088H-8B
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTF8-0006Pi-K7
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:43:15 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PNkfj4016320; Wed, 26 Apr 2023 00:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aHFTVwtogTVFChp3grsLrv0V3aMK3ayiJUS+IJgyC/c=;
 b=LCbrokAv9I0IurmcX/Ao9ieDDWM1Un+rRnnEMPboEo5OJMmplACe5yCp/3Xkr7Uba3OI
 Naw5U7wtZgh9cu/9CgQC0xFqpVfLZNIr9OEiBId7IyE9QiEOM4nU6QK5ajQfs/7o6hRU
 t6r3vogZ0ltjyV6d5uIfyRKppQs8SRpot0R60il4GA2IdbAmQRy3p0rbowhdWxPQqxyg
 gvLAhT5tf2Rp2YY4ZIAKq3s9Pc8qSxPC58i9bhJA2CHHwXl4sbyJBtitY232PovnJdUU
 RfGf+jbB8Nw5cBBVNfM9420FpNF2WFFm0sWop1U4ZZpPPcrlAb6VrdiatpjGmoUTkMcM Zw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6kw08ntg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:38 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0eK2i023353; 
 Wed, 26 Apr 2023 00:42:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmcy6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:37 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gaUD025132;
 Wed, 26 Apr 2023 00:42:36 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q0gacU025124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:36 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id B1A776A5; Tue, 25 Apr 2023 17:42:35 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 19/21] Hexagon (target/hexagon) Move pred_written to
 DisasContext
Date: Tue, 25 Apr 2023 17:42:34 -0700
Message-Id: <20230426004234.1319401-10-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: wVkF5VXTtRpNfUjHYxrwVB8b_6G9ol8G
X-Proofpoint-ORIG-GUID: wVkF5VXTtRpNfUjHYxrwVB8b_6G9ol8G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=805
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAgfCAy
IC0tCiB0YXJnZXQvaGV4YWdvbi9oZWxwZXIuaCAgICB8IDIgKy0KIHRhcmdldC9oZXhhZ29uL3Ry
YW5zbGF0ZS5oIHwgMiArLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgfCAyICstCiB0YXJn
ZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyB8IDUgKysrLS0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5jIHwgOSArKysrLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vY3B1LmggYi90YXJnZXQv
aGV4YWdvbi9jcHUuaAppbmRleCA4Y2UyY2VlZWU0Li4yNjk1MmNkZGNiIDEwMDY0NAotLS0gYS90
YXJnZXQvaGV4YWdvbi9jcHUuaAorKysgYi90YXJnZXQvaGV4YWdvbi9jcHUuaApAQCAtOTQsOCAr
OTQsNiBAQCB0eXBlZGVmIHN0cnVjdCBDUFVBcmNoU3RhdGUgewogICAgIHRhcmdldF91bG9uZyB0
aGlzX1BDOwogICAgIHRhcmdldF91bG9uZyByZWdfd3JpdHRlbltUT1RBTF9QRVJfVEhSRUFEX1JF
R1NdOwogCi0gICAgdGFyZ2V0X3Vsb25nIHByZWRfd3JpdHRlbjsKLQogICAgIE1lbUxvZyBtZW1f
bG9nX3N0b3Jlc1tTVE9SRVNfTUFYXTsKICAgICB0YXJnZXRfdWxvbmcgcGt0X2hhc19zdG9yZV9z
MTsKICAgICB0YXJnZXRfdWxvbmcgZGN6ZXJvX2FkZHI7CmRpZmYgLS1naXQgYS90YXJnZXQvaGV4
YWdvbi9oZWxwZXIuaCBiL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oCmluZGV4IDRiNzUwZDAzNTEu
LmYzYjI5OGJlZWUgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2hlbHBlci5oCisrKyBiL3Rh
cmdldC9oZXhhZ29uL2hlbHBlci5oCkBAIC0yMSw3ICsyMSw3IEBACiBERUZfSEVMUEVSX0ZMQUdT
XzIocmFpc2VfZXhjZXB0aW9uLCBUQ0dfQ0FMTF9OT19SRVRVUk4sIG5vcmV0dXJuLCBlbnYsIGkz
MikKIERFRl9IRUxQRVJfMShkZWJ1Z19zdGFydF9wYWNrZXQsIHZvaWQsIGVudikKIERFRl9IRUxQ
RVJfRkxBR1NfMyhkZWJ1Z19jaGVja19zdG9yZV93aWR0aCwgVENHX0NBTExfTk9fV0csIHZvaWQs
IGVudiwgaW50LCBpbnQpCi1ERUZfSEVMUEVSX0ZMQUdTXzMoZGVidWdfY29tbWl0X2VuZCwgVENH
X0NBTExfTk9fV0csIHZvaWQsIGVudiwgaW50LCBpbnQpCitERUZfSEVMUEVSX0ZMQUdTXzQoZGVi
dWdfY29tbWl0X2VuZCwgVENHX0NBTExfTk9fV0csIHZvaWQsIGVudiwgaW50LCBpbnQsIGludCkK
IERFRl9IRUxQRVJfMihjb21taXRfc3RvcmUsIHZvaWQsIGVudiwgaW50KQogREVGX0hFTFBFUl8z
KGdhdGhlcl9zdG9yZSwgdm9pZCwgZW52LCBpMzIsIGludCkKIERFRl9IRUxQRVJfMShjb21taXRf
aHZ4X3N0b3Jlcywgdm9pZCwgZW52KQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmggYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaAppbmRleCBmZGZhMWI2ZmUzLi5hOWYx
Y2NlZTI0IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaAorKysgYi90YXJn
ZXQvaGV4YWdvbi90cmFuc2xhdGUuaApAQCAtNzEsNiArNzEsNyBAQCB0eXBlZGVmIHN0cnVjdCBE
aXNhc0NvbnRleHQgewogICAgIGJvb2wgaGFzX2h2eF9oZWxwZXI7CiAgICAgVENHdiBuZXdfdmFs
dWVbVE9UQUxfUEVSX1RIUkVBRF9SRUdTXTsKICAgICBUQ0d2IG5ld19wcmVkX3ZhbHVlW05VTV9Q
UkVHU107CisgICAgVENHdiBwcmVkX3dyaXR0ZW47CiB9IERpc2FzQ29udGV4dDsKIAogc3RhdGlj
IGlubGluZSB2b2lkIGN0eF9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBu
dW0pCkBAIC0xOTQsNyArMTk1LDYgQEAgZXh0ZXJuIFRDR3YgaGV4X3Nsb3RfY2FuY2VsbGVkOwog
ZXh0ZXJuIFRDR3YgaGV4X2JyYW5jaF90YWtlbjsKIGV4dGVybiBUQ0d2IGhleF9uZXdfdmFsdWVf
dXNyOwogZXh0ZXJuIFRDR3YgaGV4X3JlZ193cml0dGVuW1RPVEFMX1BFUl9USFJFQURfUkVHU107
Ci1leHRlcm4gVENHdiBoZXhfcHJlZF93cml0dGVuOwogZXh0ZXJuIFRDR3YgaGV4X3N0b3JlX2Fk
ZHJbU1RPUkVTX01BWF07CiBleHRlcm4gVENHdiBoZXhfc3RvcmVfd2lkdGhbU1RPUkVTX01BWF07
CiBleHRlcm4gVENHdiBoZXhfc3RvcmVfdmFsMzJbU1RPUkVTX01BWF07CmRpZmYgLS1naXQgYS90
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCmluZGV4IGU1
ODA1NGU3YzkuLmIyZmE5MWM1YTMgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5j
CisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC0xNTEsNyArMTUxLDcgQEAgdm9pZCBn
ZW5fbG9nX3ByZWRfd3JpdGUoRGlzYXNDb250ZXh0ICpjdHgsIGludCBwbnVtLCBUQ0d2IHZhbCkK
ICAgICAgICAgdGNnX2dlbl9hbmRfdGwocHJlZCwgcHJlZCwgYmFzZV92YWwpOwogICAgIH0KICAg
ICBpZiAoSEVYX0RFQlVHKSB7Ci0gICAgICAgIHRjZ19nZW5fb3JpX3RsKGhleF9wcmVkX3dyaXR0
ZW4sIGhleF9wcmVkX3dyaXR0ZW4sIDEgPDwgcG51bSk7CisgICAgICAgIHRjZ19nZW5fb3JpX3Rs
KGN0eC0+cHJlZF93cml0dGVuLCBjdHgtPnByZWRfd3JpdHRlbiwgMSA8PCBwbnVtKTsKICAgICB9
CiAgICAgc2V0X2JpdChwbnVtLCBjdHgtPnByZWdzX3dyaXR0ZW4pOwogfQpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpp
bmRleCAyNmZiYTlmNWQ2Li5mOTAyMWVmYzdlIDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9v
cF9oZWxwZXIuYworKysgYi90YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYwpAQCAtMjAzLDcgKzIw
Myw4IEBAIHN0YXRpYyB2b2lkIHByaW50X3N0b3JlKENQVUhleGFnb25TdGF0ZSAqZW52LCBpbnQg
c2xvdCkKIH0KIAogLyogVGhpcyBmdW5jdGlvbiBpcyBhIGhhbmR5IHBsYWNlIHRvIHNldCBhIGJy
ZWFrcG9pbnQgKi8KLXZvaWQgSEVMUEVSKGRlYnVnX2NvbW1pdF9lbmQpKENQVUhleGFnb25TdGF0
ZSAqZW52LCBpbnQgaGFzX3N0MCwgaW50IGhhc19zdDEpCit2b2lkIEhFTFBFUihkZWJ1Z19jb21t
aXRfZW5kKShDUFVIZXhhZ29uU3RhdGUgKmVudiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBwcmVkX3dyaXR0ZW4sIGludCBoYXNfc3QwLCBpbnQgaGFzX3N0MSkKIHsKICAgICBi
b29sIHJlZ19wcmludGVkID0gZmFsc2U7CiAgICAgYm9vbCBwcmVkX3ByaW50ZWQgPSBmYWxzZTsK
QEAgLTIyNSw3ICsyMjYsNyBAQCB2b2lkIEhFTFBFUihkZWJ1Z19jb21taXRfZW5kKShDUFVIZXhh
Z29uU3RhdGUgKmVudiwgaW50IGhhc19zdDAsIGludCBoYXNfc3QxKQogICAgIH0KIAogICAgIGZv
ciAoaSA9IDA7IGkgPCBOVU1fUFJFR1M7IGkrKykgewotICAgICAgICBpZiAoZW52LT5wcmVkX3dy
aXR0ZW4gJiAoMSA8PCBpKSkgeworICAgICAgICBpZiAocHJlZF93cml0dGVuICYgKDEgPDwgaSkp
IHsKICAgICAgICAgICAgIGlmICghcHJlZF9wcmludGVkKSB7CiAgICAgICAgICAgICAgICAgSEVY
X0RFQlVHX0xPRygiUHJlZGljYXRlcyB3cml0dGVuXG4iKTsKICAgICAgICAgICAgICAgICBwcmVk
X3ByaW50ZWQgPSB0cnVlOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMg
Yi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCBjMmU2NTU3OTU3Li43NjM2YzYwNGM5
IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYworKysgYi90YXJnZXQvaGV4
YWdvbi90cmFuc2xhdGUuYwpAQCAtNDYsNyArNDYsNiBAQCBUQ0d2IGhleF9zbG90X2NhbmNlbGxl
ZDsKIFRDR3YgaGV4X2JyYW5jaF90YWtlbjsKIFRDR3YgaGV4X25ld192YWx1ZV91c3I7CiBUQ0d2
IGhleF9yZWdfd3JpdHRlbltUT1RBTF9QRVJfVEhSRUFEX1JFR1NdOwotVENHdiBoZXhfcHJlZF93
cml0dGVuOwogVENHdiBoZXhfc3RvcmVfYWRkcltTVE9SRVNfTUFYXTsKIFRDR3YgaGV4X3N0b3Jl
X3dpZHRoW1NUT1JFU19NQVhdOwogVENHdiBoZXhfc3RvcmVfdmFsMzJbU1RPUkVTX01BWF07CkBA
IC01NDksNyArNTQ4LDggQEAgc3RhdGljIHZvaWQgZ2VuX3N0YXJ0X3BhY2tldChEaXNhc0NvbnRl
eHQgKmN0eCkKICAgICAgICAgfQogICAgIH0KICAgICBpZiAoSEVYX0RFQlVHKSB7Ci0gICAgICAg
IHRjZ19nZW5fbW92aV90bChoZXhfcHJlZF93cml0dGVuLCAwKTsKKyAgICAgICAgY3R4LT5wcmVk
X3dyaXR0ZW4gPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGN0eC0+
cHJlZF93cml0dGVuLCAwKTsKICAgICB9CiAKICAgICAvKiBQcmVsb2FkIHRoZSBwcmVkaWNhdGVk
IHJlZ2lzdGVycyBpbnRvIGdldF9yZXN1bHRfZ3ByKGN0eCwgaSkgKi8KQEAgLTEwMDQsNyArMTAw
NCw4IEBAIHN0YXRpYyB2b2lkIGdlbl9jb21taXRfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQog
ICAgICAgICAgICAgdGNnX2NvbnN0YW50X3RsKHBrdC0+cGt0X2hhc19zdG9yZV9zMSAmJiAhcGt0
LT5wa3RfaGFzX2RjemVyb2EpOwogCiAgICAgICAgIC8qIEhhbmR5IHBsYWNlIHRvIHNldCBhIGJy
ZWFrcG9pbnQgYXQgdGhlIGVuZCBvZiBleGVjdXRpb24gKi8KLSAgICAgICAgZ2VuX2hlbHBlcl9k
ZWJ1Z19jb21taXRfZW5kKGNwdV9lbnYsIGhhc19zdDAsIGhhc19zdDEpOworICAgICAgICBnZW5f
aGVscGVyX2RlYnVnX2NvbW1pdF9lbmQoY3B1X2VudiwgY3R4LT5wcmVkX3dyaXR0ZW4sCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYXNfc3QwLCBoYXNfc3QxKTsKICAgICB9
CiAKICAgICBpZiAocGt0LT52aGlzdF9pbnNuICE9IE5VTEwpIHsKQEAgLTExOTcsOCArMTE5OCw2
IEBAIHZvaWQgaGV4YWdvbl90cmFuc2xhdGVfaW5pdCh2b2lkKQogICAgICAgICAgICAgb2Zmc2V0
b2YoQ1BVSGV4YWdvblN0YXRlLCBwcmVkW2ldKSwKICAgICAgICAgICAgIGhleGFnb25fcHJlZG5h
bWVzW2ldKTsKICAgICB9Ci0gICAgaGV4X3ByZWRfd3JpdHRlbiA9IHRjZ19nbG9iYWxfbWVtX25l
dyhjcHVfZW52LAotICAgICAgICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHByZWRfd3JpdHRl
biksICJwcmVkX3dyaXR0ZW4iKTsKICAgICBoZXhfdGhpc19QQyA9IHRjZ19nbG9iYWxfbWVtX25l
dyhjcHVfZW52LAogICAgICAgICBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIHRoaXNfUEMpLCAi
dGhpc19QQyIpOwogICAgIGhleF9zbG90X2NhbmNlbGxlZCA9IHRjZ19nbG9iYWxfbWVtX25ldyhj
cHVfZW52LAotLSAKMi4yNS4xCgo=

