Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF106EEC5F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 04:31:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prUvh-0002ec-Ri; Tue, 25 Apr 2023 22:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvV-0002dO-R1
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvT-000295-RF
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0ucD5011511; Wed, 26 Apr 2023 02:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2rwPvCxU+RAoscK6g+IT4+bNQC4KMuv40OSFf/I2128=;
 b=er+7QMz5VihvnyvXz/LMiPvty4SV4k5xszHgz/Uhy16f5HUqedVF2GoCv2ba/QJnUXJ9
 Fw53oj8OO0ffedUP+0oHw8yyGViRTEazFMsje8y5wF0bEQJTWwBvd3rxBihRX9G+F4Mh
 ZvFIcg0exkEKYo52bImz3Q+VcSjfd+zsHyU2wDPJFUaPvgfp+xflMk5voJdelVJnLR9G
 i+NEWF/yQEsK6Nz9tePpARyW6oG+1uIs55GhW4gOqHp3aucXMBBvnSSYe+8BSZ4EeXWR
 cqkIzSdPZ+geneLcgKkeIfax9qJHGdL0w0cnNVd1fUCkwNA20p/0efuga2/dxgThZKfN Mg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6brdtc3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q2UKUw008607; 
 Wed, 26 Apr 2023 02:30:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3q48nm5e14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:20 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q2UKpw008579;
 Wed, 26 Apr 2023 02:30:20 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 33Q2UJcE008563
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:20 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A1A9268F; Tue, 25 Apr 2023 19:30:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 3/9] Hexagon (tests/tcg/hexagon) Add v68 scalar tests
Date: Tue, 25 Apr 2023 19:30:12 -0700
Message-Id: <20230426023018.1742266-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230426023018.1742266-1-tsimpson@quicinc.com>
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FpiTFyh-4dTAK5B_VUrUNqO3GTmBCYc4
X-Proofpoint-GUID: FpiTFyh-4dTAK5B_VUrUNqO3GTmBCYc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=846 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260020
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRlc3RzL3RjZy9oZXhhZ29uL3Y2OF9zY2FsYXIuYyAgICB8IDE4NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldCB8ICAgMiAr
CiAyIGZpbGVzIGNoYW5nZWQsIDE4OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
dGVzdHMvdGNnL2hleGFnb24vdjY4X3NjYWxhci5jCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hl
eGFnb24vdjY4X3NjYWxhci5jIGIvdGVzdHMvdGNnL2hleGFnb24vdjY4X3NjYWxhci5jCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjdhOGFkYjExMzAKLS0tIC9kZXYvbnVs
bAorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi92Njhfc2NhbGFyLmMKQEAgLTAsMCArMSwxODYgQEAK
Ky8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMjMgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIElu
Yy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqICBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIg
b2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lv
bi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0
IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiAgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiAgWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqICBh
bG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy8+LgorICovCisKKyNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPHN0ZGJvb2wu
aD4KKyNpbmNsdWRlIDxzdGRpbnQuaD4KKworLyoKKyAqICBUZXN0IHRoZSBzY2FsYXIgY29yZSBp
bnN0cnVjdGlvbnMgdGhhdCBhcmUgbmV3IGluIHY2OAorICovCisKK2ludCBlcnI7CisKK3N0YXRp
YyBpbnQgYnVmZmVyMzJbXSA9IHsgMSwgMiwgMywgNCB9Oworc3RhdGljIGxvbmcgbG9uZyBidWZm
ZXI2NFtdID0geyA1LCA2LCA3LCA4IH07CisKK3N0YXRpYyB2b2lkIF9fY2hlY2szMihpbnQgbGlu
ZSwgdWludDMyX3QgcmVzdWx0LCB1aW50MzJfdCBleHBlY3QpCit7CisgICAgaWYgKHJlc3VsdCAh
PSBleHBlY3QpIHsKKyAgICAgICAgcHJpbnRmKCJFUlJPUiBhdCBsaW5lICVkOiAweCUwOHggIT0g
MHglMDh4XG4iLAorICAgICAgICAgICAgICAgbGluZSwgcmVzdWx0LCBleHBlY3QpOworICAgICAg
ICBlcnIrKzsKKyAgICB9Cit9CisKKyNkZWZpbmUgY2hlY2szMihSRVMsIEVYUCkgX19jaGVjazMy
KF9fTElORV9fLCBSRVMsIEVYUCkKKworc3RhdGljIHZvaWQgX19jaGVjazY0KGludCBsaW5lLCB1
aW50NjRfdCByZXN1bHQsIHVpbnQ2NF90IGV4cGVjdCkKK3sKKyAgICBpZiAocmVzdWx0ICE9IGV4
cGVjdCkgeworICAgICAgICBwcmludGYoIkVSUk9SIGF0IGxpbmUgJWQ6IDB4JTAxNmxseCAhPSAw
eCUwMTZsbHhcbiIsCisgICAgICAgICAgICAgICBsaW5lLCByZXN1bHQsIGV4cGVjdCk7CisgICAg
ICAgIGVycisrOworICAgIH0KK30KKworI2RlZmluZSBjaGVjazY0KFJFUywgRVhQKSBfX2NoZWNr
NjQoX19MSU5FX18sIFJFUywgRVhQKQorCitzdGF0aWMgaW5saW5lIGludCBsb2Fkd19hcShpbnQg
KnApCit7CisgICAgaW50IHJlczsKKyAgICBhc20gdm9sYXRpbGUoIiUwID0gbWVtd19hcSglMSlc
blx0IgorICAgICAgICAgICAgICAgICA6ICI9ciIocmVzKSA6ICJyIihwKSk7CisgICAgcmV0dXJu
IHJlczsKK30KKworc3RhdGljIHZvaWQgdGVzdF9sb2Fkd19hcSh2b2lkKQoreworICAgIGludCBy
ZXM7CisKKyAgICByZXMgPSBsb2Fkd19hcSgmYnVmZmVyMzJbMF0pOworICAgIGNoZWNrMzIocmVz
LCAxKTsKKyAgICByZXMgPSBsb2Fkd19hcSgmYnVmZmVyMzJbMV0pOworICAgIGNoZWNrMzIocmVz
LCAyKTsKK30KKworc3RhdGljIGlubGluZSBsb25nIGxvbmcgbG9hZGRfYXEobG9uZyBsb25nICpw
KQoreworICAgIGxvbmcgbG9uZyByZXM7CisgICAgYXNtIHZvbGF0aWxlKCIlMCA9IG1lbWRfYXEo
JTEpXG5cdCIKKyAgICAgICAgICAgICAgICAgOiAiPXIiKHJlcykgOiAiciIocCkpOworICAgIHJl
dHVybiByZXM7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfbG9hZGRfYXEodm9pZCkKK3sKKyAgICBs
b25nIGxvbmcgcmVzOworCisgICAgcmVzID0gbG9hZGRfYXEoJmJ1ZmZlcjY0WzJdKTsKKyAgICBj
aGVjazY0KHJlcywgNyk7CisgICAgcmVzID0gbG9hZGRfYXEoJmJ1ZmZlcjY0WzNdKTsKKyAgICBj
aGVjazY0KHJlcywgOCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCByZWxlYXNlX2F0KGludCAq
cCkKK3sKKyAgICBhc20gdm9sYXRpbGUoInJlbGVhc2UoJTApOmF0XG5cdCIKKyAgICAgICAgICAg
ICAgICAgOiA6ICJyIihwKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfcmVsZWFzZV9hdCh2b2lk
KQoreworICAgIHJlbGVhc2VfYXQoJmJ1ZmZlcjMyWzJdKTsKKyAgICBjaGVjazY0KGJ1ZmZlcjMy
WzJdLCAzKTsKKyAgICByZWxlYXNlX2F0KCZidWZmZXIzMlszXSk7CisgICAgY2hlY2s2NChidWZm
ZXIzMlszXSwgNCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCByZWxlYXNlX3N0KGludCAqcCkK
K3sKKyAgICBhc20gdm9sYXRpbGUoInJlbGVhc2UoJTApOnN0XG5cdCIKKyAgICAgICAgICAgICAg
ICAgOiA6ICJyIihwKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfcmVsZWFzZV9zdCh2b2lkKQor
eworICAgIHJlbGVhc2Vfc3QoJmJ1ZmZlcjMyWzJdKTsKKyAgICBjaGVjazY0KGJ1ZmZlcjMyWzJd
LCAzKTsKKyAgICByZWxlYXNlX3N0KCZidWZmZXIzMlszXSk7CisgICAgY2hlY2s2NChidWZmZXIz
MlszXSwgNCk7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzdG9yZXdfcmxfYXQoaW50ICpwLCBp
bnQgdmFsKQoreworICAgIGFzbSB2b2xhdGlsZSgibWVtd19ybCglMCk6YXQgPSAlMVxuXHQiCisg
ICAgICAgICAgICAgICAgIDogOiAiciIocCksICJyIih2YWwpIDogIm1lbW9yeSIpOworfQorCitz
dGF0aWMgdm9pZCB0ZXN0X3N0b3Jld19ybF9hdCh2b2lkKQoreworICAgIHN0b3Jld19ybF9hdCgm
YnVmZmVyMzJbMl0sIDkpOworICAgIGNoZWNrNjQoYnVmZmVyMzJbMl0sIDkpOworICAgIHN0b3Jl
d19ybF9hdCgmYnVmZmVyMzJbM10sIDEwKTsKKyAgICBjaGVjazY0KGJ1ZmZlcjMyWzNdLCAxMCk7
Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBzdG9yZWRfcmxfYXQobG9uZyBsb25nICpwLCBsb25n
IGxvbmcgdmFsKQoreworICAgIGFzbSB2b2xhdGlsZSgibWVtZF9ybCglMCk6YXQgPSAlMVxuXHQi
CisgICAgICAgICAgICAgICAgIDogOiAiciIocCksICJyIih2YWwpIDogIm1lbW9yeSIpOworfQor
CitzdGF0aWMgdm9pZCB0ZXN0X3N0b3JlZF9ybF9hdCh2b2lkKQoreworICAgIHN0b3JlZF9ybF9h
dCgmYnVmZmVyNjRbMl0sIDExKTsKKyAgICBjaGVjazY0KGJ1ZmZlcjY0WzJdLCAxMSk7CisgICAg
c3RvcmVkX3JsX2F0KCZidWZmZXI2NFszXSwgMTIpOworICAgIGNoZWNrNjQoYnVmZmVyNjRbM10s
IDEyKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHN0b3Jld19ybF9zdChpbnQgKnAsIGludCB2
YWwpCit7CisgICAgYXNtIHZvbGF0aWxlKCJtZW13X3JsKCUwKTpzdCA9ICUxXG5cdCIKKyAgICAg
ICAgICAgICAgICAgOiA6ICJyIihwKSwgInIiKHZhbCkgOiAibWVtb3J5Iik7Cit9CisKK3N0YXRp
YyB2b2lkIHRlc3Rfc3RvcmV3X3JsX3N0KHZvaWQpCit7CisgICAgc3RvcmV3X3JsX3N0KCZidWZm
ZXIzMlswXSwgMTMpOworICAgIGNoZWNrNjQoYnVmZmVyMzJbMF0sIDEzKTsKKyAgICBzdG9yZXdf
cmxfc3QoJmJ1ZmZlcjMyWzFdLCAxNCk7CisgICAgY2hlY2s2NChidWZmZXIzMlsxXSwgMTQpOwor
fQorCitzdGF0aWMgaW5saW5lIHZvaWQgc3RvcmVkX3JsX3N0KGxvbmcgbG9uZyAqcCwgbG9uZyBs
b25nIHZhbCkKK3sKKyAgICBhc20gdm9sYXRpbGUoIm1lbWRfcmwoJTApOnN0ID0gJTFcblx0Igor
ICAgICAgICAgICAgICAgICA6IDogInIiKHApLCAiciIodmFsKSA6ICJtZW1vcnkiKTsKK30KKwor
c3RhdGljIHZvaWQgdGVzdF9zdG9yZWRfcmxfc3Qodm9pZCkKK3sKKyAgICBzdG9yZWRfcmxfc3Qo
JmJ1ZmZlcjY0WzBdLCAxNSk7CisgICAgY2hlY2s2NChidWZmZXI2NFswXSwgMTUpOworICAgIHN0
b3JlZF9ybF9zdCgmYnVmZmVyNjRbMV0sIDE1KTsKKyAgICBjaGVjazY0KGJ1ZmZlcjY0WzFdLCAx
NSk7Cit9CisKK2ludCBtYWluKCkKK3sKKyAgICB0ZXN0X2xvYWR3X2FxKCk7CisgICAgdGVzdF9s
b2FkZF9hcSgpOworICAgIHRlc3RfcmVsZWFzZV9hdCgpOworICAgIHRlc3RfcmVsZWFzZV9zdCgp
OworICAgIHRlc3Rfc3RvcmV3X3JsX2F0KCk7CisgICAgdGVzdF9zdG9yZWRfcmxfYXQoKTsKKyAg
ICB0ZXN0X3N0b3Jld19ybF9zdCgpOworICAgIHRlc3Rfc3RvcmVkX3JsX3N0KCk7CisKKyAgICBw
dXRzKGVyciA/ICJGQUlMIiA6ICJQQVNTIik7CisgICAgcmV0dXJuIGVyciA/IDEgOiAwOworfQpk
aWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNn
L2hleGFnb24vTWFrZWZpbGUudGFyZ2V0CmluZGV4IDU5YjFiMDc0ZTkuLmI3NTI5ZTIzYmMgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90
Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKQEAgLTc2LDYgKzc2LDggQEAgSEVYX1RFU1RTICs9
IHRlc3Rfdm1pbmgKIEhFWF9URVNUUyArPSB0ZXN0X3ZwbXB5aAogSEVYX1RFU1RTICs9IHRlc3Rf
dnNwbGljZWIKIAorSEVYX1RFU1RTICs9IHY2OF9zY2FsYXIKKwogVEVTVFMgKz0gJChIRVhfVEVT
VFMpCiAKICMgVGhpcyB0ZXN0IGhhcyB0byBiZSBjb21waWxlZCBmb3IgdGhlIC1tdjY3dCB0YXJn
ZXQKLS0gCjIuMjUuMQoK

