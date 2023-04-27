Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED86F0E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 00:42:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAIc-0001vC-Ty; Thu, 27 Apr 2023 18:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIa-0001t9-2P
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIU-0005Lp-AX
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:10 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMEKuj012407; Thu, 27 Apr 2023 22:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1KN2wxnN17RmE8/cVW14I/fcipoQUPEZl0DhPFZLOlI=;
 b=oAA4UsMhLdcgogqTMgeOC0iZE4rps+3NOKnhseOrDPcMUvx9STssB9dQusDTQ69ToasO
 YI6R2JXHob4XXb9DdhFwlzzYZvVqQNo4/4YN0rnw8+N59y/tnPjVBumX9SX5wZU7eSru
 /oW4r/FANq7kURqARW0i14rYC3l7i4vf5d7gY1uYy47szKWV0WPk2o1ZSPkO5XmKrkcj
 m98hX+DXcCRbFaeCNj79fmboS5qmA3dnP1R+A227wpxBqNmr9juzl3ktySd4E6x16gUx
 FuXg3wwPrEZISwseH2n0BR/IZWVs8aHlteCZqpaXubvqqTkLNexMtos5w8E9new2jCR2 Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7dh2jw8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMf02h006413; 
 Thu, 27 Apr 2023 22:41:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3q48nmt1sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:00 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RMf0l5006400;
 Thu, 27 Apr 2023 22:41:00 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 33RMexLA006367
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:00 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D01F368F; Thu, 27 Apr 2023 15:40:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 3/9] Hexagon (tests/tcg/hexagon) Add v68 scalar tests
Date: Thu, 27 Apr 2023 15:40:51 -0700
Message-Id: <20230427224057.3766963-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427224057.3766963-1-tsimpson@quicinc.com>
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cy9f9p00_reDVavacHnFHuUkHMQs7_DI
X-Proofpoint-GUID: Cy9f9p00_reDVavacHnFHuUkHMQs7_DI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxlogscore=900 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270200
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZp
ZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0ZXN0cy90Y2cvaGV4
YWdvbi92Njhfc2NhbGFyLmMgICAgfCAxODYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgfCAgIDIgKwogMiBmaWxlcyBjaGFu
Z2VkLCAxODggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhh
Z29uL3Y2OF9zY2FsYXIuYwoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL3Y2OF9zY2Fs
YXIuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3Y2OF9zY2FsYXIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi43YThhZGIxMTMwCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMv
dGNnL2hleGFnb24vdjY4X3NjYWxhci5jCkBAIC0wLDAgKzEsMTg2IEBACisvKgorICogIENvcHly
aWdodChjKSAyMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqICB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNl
LCBvcgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNl
ZnVsLAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBs
aWVkIHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNv
cHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxvbmcgd2l0aCB0aGlz
IHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyAq
LworCisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRib29sLmg+CisjaW5jbHVkZSA8
c3RkaW50Lmg+CisKKy8qCisgKiAgVGVzdCB0aGUgc2NhbGFyIGNvcmUgaW5zdHJ1Y3Rpb25zIHRo
YXQgYXJlIG5ldyBpbiB2NjgKKyAqLworCitpbnQgZXJyOworCitzdGF0aWMgaW50IGJ1ZmZlcjMy
W10gPSB7IDEsIDIsIDMsIDQgfTsKK3N0YXRpYyBsb25nIGxvbmcgYnVmZmVyNjRbXSA9IHsgNSwg
NiwgNywgOCB9OworCitzdGF0aWMgdm9pZCBfX2NoZWNrMzIoaW50IGxpbmUsIHVpbnQzMl90IHJl
c3VsdCwgdWludDMyX3QgZXhwZWN0KQoreworICAgIGlmIChyZXN1bHQgIT0gZXhwZWN0KSB7Cisg
ICAgICAgIHByaW50ZigiRVJST1IgYXQgbGluZSAlZDogMHglMDh4ICE9IDB4JTA4eFxuIiwKKyAg
ICAgICAgICAgICAgIGxpbmUsIHJlc3VsdCwgZXhwZWN0KTsKKyAgICAgICAgZXJyKys7CisgICAg
fQorfQorCisjZGVmaW5lIGNoZWNrMzIoUkVTLCBFWFApIF9fY2hlY2szMihfX0xJTkVfXywgUkVT
LCBFWFApCisKK3N0YXRpYyB2b2lkIF9fY2hlY2s2NChpbnQgbGluZSwgdWludDY0X3QgcmVzdWx0
LCB1aW50NjRfdCBleHBlY3QpCit7CisgICAgaWYgKHJlc3VsdCAhPSBleHBlY3QpIHsKKyAgICAg
ICAgcHJpbnRmKCJFUlJPUiBhdCBsaW5lICVkOiAweCUwMTZsbHggIT0gMHglMDE2bGx4XG4iLAor
ICAgICAgICAgICAgICAgbGluZSwgcmVzdWx0LCBleHBlY3QpOworICAgICAgICBlcnIrKzsKKyAg
ICB9Cit9CisKKyNkZWZpbmUgY2hlY2s2NChSRVMsIEVYUCkgX19jaGVjazY0KF9fTElORV9fLCBS
RVMsIEVYUCkKKworc3RhdGljIGlubGluZSBpbnQgbG9hZHdfYXEoaW50ICpwKQoreworICAgIGlu
dCByZXM7CisgICAgYXNtIHZvbGF0aWxlKCIlMCA9IG1lbXdfYXEoJTEpXG5cdCIKKyAgICAgICAg
ICAgICAgICAgOiAiPXIiKHJlcykgOiAiciIocCkpOworICAgIHJldHVybiByZXM7Cit9CisKK3N0
YXRpYyB2b2lkIHRlc3RfbG9hZHdfYXEodm9pZCkKK3sKKyAgICBpbnQgcmVzOworCisgICAgcmVz
ID0gbG9hZHdfYXEoJmJ1ZmZlcjMyWzBdKTsKKyAgICBjaGVjazMyKHJlcywgMSk7CisgICAgcmVz
ID0gbG9hZHdfYXEoJmJ1ZmZlcjMyWzFdKTsKKyAgICBjaGVjazMyKHJlcywgMik7Cit9CisKK3N0
YXRpYyBpbmxpbmUgbG9uZyBsb25nIGxvYWRkX2FxKGxvbmcgbG9uZyAqcCkKK3sKKyAgICBsb25n
IGxvbmcgcmVzOworICAgIGFzbSB2b2xhdGlsZSgiJTAgPSBtZW1kX2FxKCUxKVxuXHQiCisgICAg
ICAgICAgICAgICAgIDogIj1yIihyZXMpIDogInIiKHApKTsKKyAgICByZXR1cm4gcmVzOworfQor
CitzdGF0aWMgdm9pZCB0ZXN0X2xvYWRkX2FxKHZvaWQpCit7CisgICAgbG9uZyBsb25nIHJlczsK
KworICAgIHJlcyA9IGxvYWRkX2FxKCZidWZmZXI2NFsyXSk7CisgICAgY2hlY2s2NChyZXMsIDcp
OworICAgIHJlcyA9IGxvYWRkX2FxKCZidWZmZXI2NFszXSk7CisgICAgY2hlY2s2NChyZXMsIDgp
OworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgcmVsZWFzZV9hdChpbnQgKnApCit7CisgICAgYXNt
IHZvbGF0aWxlKCJyZWxlYXNlKCUwKTphdFxuXHQiCisgICAgICAgICAgICAgICAgIDogOiAiciIo
cCkpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X3JlbGVhc2VfYXQodm9pZCkKK3sKKyAgICByZWxl
YXNlX2F0KCZidWZmZXIzMlsyXSk7CisgICAgY2hlY2s2NChidWZmZXIzMlsyXSwgMyk7CisgICAg
cmVsZWFzZV9hdCgmYnVmZmVyMzJbM10pOworICAgIGNoZWNrNjQoYnVmZmVyMzJbM10sIDQpOwor
fQorCitzdGF0aWMgaW5saW5lIHZvaWQgcmVsZWFzZV9zdChpbnQgKnApCit7CisgICAgYXNtIHZv
bGF0aWxlKCJyZWxlYXNlKCUwKTpzdFxuXHQiCisgICAgICAgICAgICAgICAgIDogOiAiciIocCkp
OworfQorCitzdGF0aWMgdm9pZCB0ZXN0X3JlbGVhc2Vfc3Qodm9pZCkKK3sKKyAgICByZWxlYXNl
X3N0KCZidWZmZXIzMlsyXSk7CisgICAgY2hlY2s2NChidWZmZXIzMlsyXSwgMyk7CisgICAgcmVs
ZWFzZV9zdCgmYnVmZmVyMzJbM10pOworICAgIGNoZWNrNjQoYnVmZmVyMzJbM10sIDQpOworfQor
CitzdGF0aWMgaW5saW5lIHZvaWQgc3RvcmV3X3JsX2F0KGludCAqcCwgaW50IHZhbCkKK3sKKyAg
ICBhc20gdm9sYXRpbGUoIm1lbXdfcmwoJTApOmF0ID0gJTFcblx0IgorICAgICAgICAgICAgICAg
ICA6IDogInIiKHApLCAiciIodmFsKSA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIHZvaWQgdGVz
dF9zdG9yZXdfcmxfYXQodm9pZCkKK3sKKyAgICBzdG9yZXdfcmxfYXQoJmJ1ZmZlcjMyWzJdLCA5
KTsKKyAgICBjaGVjazY0KGJ1ZmZlcjMyWzJdLCA5KTsKKyAgICBzdG9yZXdfcmxfYXQoJmJ1ZmZl
cjMyWzNdLCAxMCk7CisgICAgY2hlY2s2NChidWZmZXIzMlszXSwgMTApOworfQorCitzdGF0aWMg
aW5saW5lIHZvaWQgc3RvcmVkX3JsX2F0KGxvbmcgbG9uZyAqcCwgbG9uZyBsb25nIHZhbCkKK3sK
KyAgICBhc20gdm9sYXRpbGUoIm1lbWRfcmwoJTApOmF0ID0gJTFcblx0IgorICAgICAgICAgICAg
ICAgICA6IDogInIiKHApLCAiciIodmFsKSA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIHZvaWQg
dGVzdF9zdG9yZWRfcmxfYXQodm9pZCkKK3sKKyAgICBzdG9yZWRfcmxfYXQoJmJ1ZmZlcjY0WzJd
LCAxMSk7CisgICAgY2hlY2s2NChidWZmZXI2NFsyXSwgMTEpOworICAgIHN0b3JlZF9ybF9hdCgm
YnVmZmVyNjRbM10sIDEyKTsKKyAgICBjaGVjazY0KGJ1ZmZlcjY0WzNdLCAxMik7Cit9CisKK3N0
YXRpYyBpbmxpbmUgdm9pZCBzdG9yZXdfcmxfc3QoaW50ICpwLCBpbnQgdmFsKQoreworICAgIGFz
bSB2b2xhdGlsZSgibWVtd19ybCglMCk6c3QgPSAlMVxuXHQiCisgICAgICAgICAgICAgICAgIDog
OiAiciIocCksICJyIih2YWwpIDogIm1lbW9yeSIpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X3N0
b3Jld19ybF9zdCh2b2lkKQoreworICAgIHN0b3Jld19ybF9zdCgmYnVmZmVyMzJbMF0sIDEzKTsK
KyAgICBjaGVjazY0KGJ1ZmZlcjMyWzBdLCAxMyk7CisgICAgc3RvcmV3X3JsX3N0KCZidWZmZXIz
MlsxXSwgMTQpOworICAgIGNoZWNrNjQoYnVmZmVyMzJbMV0sIDE0KTsKK30KKworc3RhdGljIGlu
bGluZSB2b2lkIHN0b3JlZF9ybF9zdChsb25nIGxvbmcgKnAsIGxvbmcgbG9uZyB2YWwpCit7Cisg
ICAgYXNtIHZvbGF0aWxlKCJtZW1kX3JsKCUwKTpzdCA9ICUxXG5cdCIKKyAgICAgICAgICAgICAg
ICAgOiA6ICJyIihwKSwgInIiKHZhbCkgOiAibWVtb3J5Iik7Cit9CisKK3N0YXRpYyB2b2lkIHRl
c3Rfc3RvcmVkX3JsX3N0KHZvaWQpCit7CisgICAgc3RvcmVkX3JsX3N0KCZidWZmZXI2NFswXSwg
MTUpOworICAgIGNoZWNrNjQoYnVmZmVyNjRbMF0sIDE1KTsKKyAgICBzdG9yZWRfcmxfc3QoJmJ1
ZmZlcjY0WzFdLCAxNSk7CisgICAgY2hlY2s2NChidWZmZXI2NFsxXSwgMTUpOworfQorCitpbnQg
bWFpbigpCit7CisgICAgdGVzdF9sb2Fkd19hcSgpOworICAgIHRlc3RfbG9hZGRfYXEoKTsKKyAg
ICB0ZXN0X3JlbGVhc2VfYXQoKTsKKyAgICB0ZXN0X3JlbGVhc2Vfc3QoKTsKKyAgICB0ZXN0X3N0
b3Jld19ybF9hdCgpOworICAgIHRlc3Rfc3RvcmVkX3JsX2F0KCk7CisgICAgdGVzdF9zdG9yZXdf
cmxfc3QoKTsKKyAgICB0ZXN0X3N0b3JlZF9ybF9zdCgpOworCisgICAgcHV0cyhlcnIgPyAiRkFJ
TCIgOiAiUEFTUyIpOworICAgIHJldHVybiBlcnIgPyAxIDogMDsKK30KZGlmZiAtLWdpdCBhL3Rl
c3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCBiL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2Vm
aWxlLnRhcmdldAppbmRleCA1OWIxYjA3NGU5Li5iNzUyOWUyM2JjIDEwMDY0NAotLS0gYS90ZXN0
cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vTWFr
ZWZpbGUudGFyZ2V0CkBAIC03Niw2ICs3Niw4IEBAIEhFWF9URVNUUyArPSB0ZXN0X3ZtaW5oCiBI
RVhfVEVTVFMgKz0gdGVzdF92cG1weWgKIEhFWF9URVNUUyArPSB0ZXN0X3ZzcGxpY2ViCiAKK0hF
WF9URVNUUyArPSB2Njhfc2NhbGFyCisKIFRFU1RTICs9ICQoSEVYX1RFU1RTKQogCiAjIFRoaXMg
dGVzdCBoYXMgdG8gYmUgY29tcGlsZWQgZm9yIHRoZSAtbXY2N3QgdGFyZ2V0Ci0tIAoyLjI1LjEK
Cg==

