Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4EF624F21
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 01:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otIHd-00008H-Ta; Thu, 10 Nov 2022 19:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1otIHb-00007S-Uu
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:52:35 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1otIHY-0008JV-6i
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 19:52:35 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB0kDfP022237; Fri, 11 Nov 2022 00:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f/5XoOWkY+B8MJbX/Rlms3w5yqUQ22WpwvmMVPaDPqg=;
 b=p310rLmJKo02IHgEO3r7Kw+m1fxIrD1JuTHK8n0Hx0L2xZRaOI/EgFuAQ8NiSG1kCMit
 Ee6Fm11Z40huh8S1N8mAP/hxHRu27N6Y5m69RQQBLg1QZsHJFwZEbA2IQ1fsGBaY/B1l
 De+gU3inqBaP0SYY1/eodvrhBmgFV+7CXs4xAFSgVNj3C22X3B5NW+ocMnA2P+MIDUio
 7tFRUttj+ZMafE921kuVpDzca8N9jb+1q2Qz3KRxvFGf6bnu8WHccHEUcCI1cc7pvrKU
 qdi2EuUh71ZwOTiC3ZgiUgFkzYQLWnzr4Oc4Siojgrm9tFlZXwFkBaaN0W3bXBEmoa41 ng== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksam306se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 00:52:20 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2AB0qIYJ021272; 
 Fri, 11 Nov 2022 00:52:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3kngwm6u7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 11 Nov 2022 00:52:19 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AB0qHkA021252;
 Fri, 11 Nov 2022 00:52:17 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 2AB0qGeS021242;
 Fri, 11 Nov 2022 00:52:17 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 5D63E500117; Thu, 10 Nov 2022 16:52:16 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 10/11] Hexagon (target/hexagon) Use direct block chaining for
 direct jump/branch
Date: Thu, 10 Nov 2022 16:52:13 -0800
Message-Id: <20221111005214.22764-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111005214.22764-1-tsimpson@quicinc.com>
References: <20221111005214.22764-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nWXMiTIAuivZM7NJ_0oz7R7lZI5yPuS7
X-Proofpoint-GUID: nWXMiTIAuivZM7NJ_0oz7R7lZI5yPuS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_14,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=820 bulkscore=0 impostorscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RGlyZWN0IGJsb2NrIGNoYWluaW5nIGlzIGRvY3VtZW50ZWQgaGVyZQpodHRwczovL3FlbXUucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RldmVsL3RjZy5odG1sI2RpcmVjdC1ibG9jay1jaGFpbmlu
ZwoKUmVjYWxsIHRoYXQgSGV4YWdvbiBhbGxvd3MgcGFja2V0cyB3aXRoIG11bHRpcGxlIGp1bXBz
IHdoZXJlIG9ubHkgdGhlCmZpcnN0IG9uZSB3aXRoIGEgdHJ1ZSBwcmVkaWNhdGUgd2lsbCBhY3R1
YWxseSBqdW1wLiAgV2UgY2FuICB1c2UKdGNnX2dlbl9nb3RvX3RiL3RjZ19nZW5fZXhpdF90YiB3
aGVuIHRoZSBwYWNrZXQgY29udGFpbnMgYSBzaW5nbGUKUEMtcmVsYXRpdmUgYnJhbmNoIG9yIGp1
bXAuICBJZiBub3QsIHdlIHVzZSB0Y2dfZ2VuX2xvb2t1cF9hbmRfZ290b19wdHIuCgpXZSBhZGQg
dGhlIGZvbGxvd2luZyB0byBEaXNhc0NvbnRleHQgaW4gb3JkZXIgdG8gZGVsYXkgdGhlIGJyYW5j
aGluZwp1bnRpbCB0aGUgZW5kIG9mIHBhY2tldCBjb21taXQgKGluIGdlbl9lbmRfdGIpCiAgICBi
cmFuY2hfY29uZAogICAgICAgIFRoZSBUQ0dDb25kIGNvbmRpdGlvbiB1bmRlciB3aGljaCB0aGUg
YnJhbmNoIGlzIHRha2VuCiAgICAgICAgV2hlbiBicmFuY2hfY29uZCA9PSBUQ0dfQ09ORF9ORVZF
UiwgdGhlcmUgaXNuJ3QgYSBzaW5nbGUKICAgICAgICBkaXJlY3QgYnJhbmNoIGluIHRoaXMgcGFj
a2V0LgogICAgICAgIFdoZW4gYnJhbmNoX2NvbmQgIT0gVENHX0NPTkRfQUxXQVlTLCB0aGUgdmFs
dWUgaXMgaW4KICAgICAgICBoZXhfYnJhbmNoX3Rha2VuCiAgICBicmFuY2hfZGVzdAogICAgICAg
IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgYnJhbmNoCgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPDIwMjIxMTA4MTYy
OTA2LjMxNjYtMTEtdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFnb24vdHJh
bnNsYXRlLmggfCAgMiArKwogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgfCAxMiArKysrKysr
KysrKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIHwgMzQgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oIGIvdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggOTY1MDlhNGRhNy4uYWFjZjBiMDkyMSAxMDA2
NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIvdGFyZ2V0L2hleGFnb24v
dHJhbnNsYXRlLmgKQEAgLTU3LDYgKzU3LDggQEAgdHlwZWRlZiBzdHJ1Y3QgRGlzYXNDb250ZXh0
IHsKICAgICBib29sIHFyZWdfaXNfcHJlZGljYXRlZFtOVU1fUVJFR1NdOwogICAgIGludCBxcmVn
X2xvZ19pZHg7CiAgICAgYm9vbCBwcmVfY29tbWl0OworICAgIFRDR0NvbmQgYnJhbmNoX2NvbmQ7
CisgICAgdGFyZ2V0X3Vsb25nIGJyYW5jaF9kZXN0OwogfSBEaXNhc0NvbnRleHQ7CiAKIHN0YXRp
YyBpbmxpbmUgdm9pZCBjdHhfbG9nX3JlZ193cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHJu
dW0pCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29u
L2dlbnB0ci5jCmluZGV4IGJlOWM3MTVlYTguLmVlMGY4NmZhYjIgMTAwNjQ0Ci0tLSBhL3Rhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC00ODQs
NyArNDg0LDE3IEBAIHN0YXRpYyB2b2lkIGdlbl93cml0ZV9uZXdfcGNfcGNyZWwoRGlzYXNDb250
ZXh0ICpjdHgsIGludCBwY19vZmYsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFRDR0NvbmQgY29uZCwgVENHdiBwcmVkKQogewogICAgIHRhcmdldF91bG9uZyBkZXN0ID0gY3R4
LT5wa3QtPnBjICsgcGNfb2ZmOwotICAgIGdlbl93cml0ZV9uZXdfcGNfYWRkcihjdHgsIHRjZ19j
b25zdGFudF90bChkZXN0KSwgY29uZCwgcHJlZCk7CisgICAgaWYgKGN0eC0+cGt0LT5wa3RfaGFz
X211bHRpX2NvZikgeworICAgICAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCB0Y2dfY29u
c3RhbnRfdGwoZGVzdCksIGNvbmQsIHByZWQpOworICAgIH0gZWxzZSB7CisgICAgICAgIC8qIERl
ZmVyIHRoaXMganVtcCB0byB0aGUgZW5kIG9mIHRoZSBUQiAqLworICAgICAgICBjdHgtPmJyYW5j
aF9jb25kID0gVENHX0NPTkRfQUxXQVlTOworICAgICAgICBpZiAocHJlZCAhPSBOVUxMKSB7Cisg
ICAgICAgICAgICBjdHgtPmJyYW5jaF9jb25kID0gY29uZDsKKyAgICAgICAgICAgIHRjZ19nZW5f
bW92X3RsKGhleF9icmFuY2hfdGFrZW4sIHByZWQpOworICAgICAgICB9CisgICAgICAgIGN0eC0+
YnJhbmNoX2Rlc3QgPSBkZXN0OworICAgIH0KIH0KIAogc3RhdGljIHZvaWQgZ2VuX2NvbXBhcmUo
VENHQ29uZCBjb25kLCBUQ0d2IHJlcywgVENHdiBhcmcxLCBUQ0d2IGFyZzIpCmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5j
CmluZGV4IGZhNjQxNTkzNmMuLmY1ZWY1NGYwMzkgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0xMTYsMTAg
KzExNiw0MSBAQCBzdGF0aWMgdm9pZCBnZW5fZXhlY19jb3VudGVycyhEaXNhc0NvbnRleHQgKmN0
eCkKICAgICAgICAgICAgICAgICAgICAgaGV4X2dwcltIRVhfUkVHX1FFTVVfSFZYX0NOVF0sIGN0
eC0+bnVtX2h2eF9pbnNucyk7CiB9CiAKK3N0YXRpYyBib29sIHVzZV9nb3RvX3RiKERpc2FzQ29u
dGV4dCAqY3R4LCB0YXJnZXRfdWxvbmcgZGVzdCkKK3sKKyAgICByZXR1cm4gdHJhbnNsYXRvcl91
c2VfZ290b190YigmY3R4LT5iYXNlLCBkZXN0KTsKK30KKworc3RhdGljIHZvaWQgZ2VuX2dvdG9f
dGIoRGlzYXNDb250ZXh0ICpjdHgsIGludCBpZHgsIHRhcmdldF91bG9uZyBkZXN0KQoreworICAg
IGlmICh1c2VfZ290b190YihjdHgsIGRlc3QpKSB7CisgICAgICAgIHRjZ19nZW5fZ290b190Yihp
ZHgpOworICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoaGV4X2dwcltIRVhfUkVHX1BDXSwgZGVzdCk7
CisgICAgICAgIHRjZ19nZW5fZXhpdF90YihjdHgtPmJhc2UudGIsIGlkeCk7CisgICAgfSBlbHNl
IHsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9ncHJbSEVYX1JFR19QQ10sIGRlc3QpOwor
ICAgICAgICB0Y2dfZ2VuX2xvb2t1cF9hbmRfZ290b19wdHIoKTsKKyAgICB9Cit9CisKIHN0YXRp
YyB2b2lkIGdlbl9lbmRfdGIoRGlzYXNDb250ZXh0ICpjdHgpCiB7CiAgICAgZ2VuX2V4ZWNfY291
bnRlcnMoY3R4KTsKLSAgICB0Y2dfZ2VuX2V4aXRfdGIoTlVMTCwgMCk7CisKKyAgICBpZiAoY3R4
LT5icmFuY2hfY29uZCAhPSBUQ0dfQ09ORF9ORVZFUikgeworICAgICAgICBpZiAoY3R4LT5icmFu
Y2hfY29uZCAhPSBUQ0dfQ09ORF9BTFdBWVMpIHsKKyAgICAgICAgICAgIFRDR0xhYmVsICpza2lw
ID0gZ2VuX25ld19sYWJlbCgpOworICAgICAgICAgICAgdGNnX2dlbl9icmNvbmRpX3RsKGN0eC0+
YnJhbmNoX2NvbmQsIGhleF9icmFuY2hfdGFrZW4sIDAsIHNraXApOworICAgICAgICAgICAgZ2Vu
X2dvdG9fdGIoY3R4LCAwLCBjdHgtPmJyYW5jaF9kZXN0KTsKKyAgICAgICAgICAgIGdlbl9zZXRf
bGFiZWwoc2tpcCk7CisgICAgICAgICAgICBnZW5fZ290b190YihjdHgsIDEsIGN0eC0+bmV4dF9Q
Qyk7CisgICAgICAgIH0gZWxzZSB7CisgICAgICAgICAgICBnZW5fZ290b190YihjdHgsIDAsIGN0
eC0+YnJhbmNoX2Rlc3QpOworICAgICAgICB9CisgICAgfSBlbHNlIHsKKyAgICAgICAgdGNnX2dl
bl9sb29rdXBfYW5kX2dvdG9fcHRyKCk7CisgICAgfQorCiAgICAgY3R4LT5iYXNlLmlzX2ptcCA9
IERJU0FTX05PUkVUVVJOOwogfQogCkBAIC04MDcsNiArODM4LDcgQEAgc3RhdGljIHZvaWQgaGV4
YWdvbl90cl9pbml0X2Rpc2FzX2NvbnRleHQoRGlzYXNDb250ZXh0QmFzZSAqZGNiYXNlLAogICAg
IGN0eC0+bnVtX3BhY2tldHMgPSAwOwogICAgIGN0eC0+bnVtX2luc25zID0gMDsKICAgICBjdHgt
Pm51bV9odnhfaW5zbnMgPSAwOworICAgIGN0eC0+YnJhbmNoX2NvbmQgPSBUQ0dfQ09ORF9ORVZF
UjsKIH0KIAogc3RhdGljIHZvaWQgaGV4YWdvbl90cl90Yl9zdGFydChEaXNhc0NvbnRleHRCYXNl
ICpkYiwgQ1BVU3RhdGUgKmNwdSkKLS0gCjIuMTcuMQoK

