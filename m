Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D75EEAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 03:08:55 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odi2o-0000TT-L0
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 21:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odhyb-0004LL-Th
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:04:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:5150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1odhyZ-0007ND-Sz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 21:04:33 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T0Gacq001263;
 Thu, 29 Sep 2022 01:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XcCCrsGS+gQDFT35maPSM6jMFb5BD5e74UqZcQc3aMw=;
 b=k8CXWwVixdcMoOqr5zMzk2aXWVwwvfaitc1pTRKdqrnWhkHZcJaf88xRpmQnw7q/Udh/
 FMG1ivr3i5pgXNX/+8r0R0IwVx21miY+62kJEPy0apZIhRQf++9vMH2eiJ4+tUWlV0tr
 aOf4bSC5R+gQ3TU4pE/V0u1ApqUGgXGUlkgGzE1ShwqSe/9lqKFS5GO+9+sgN716IcDp
 zC7r0ypvnI/5w7URYvNKYe2XCg1grAJJ9ymHA4AM8rG1bNXksIsozbWIyjL2WUgf5PUy
 FsUBF6aQYb1zuGFpipuJQxF+aHYpEQ2zQJpdyJ5ZFuJpoRtziPvQ5uV3U3eY0MOECAP6 aQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvpuv9v4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 01:04:25 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28T13WrY010728; 
 Thu, 29 Sep 2022 01:04:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3jw169r14q-1;
 Thu, 29 Sep 2022 01:04:24 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28T14OKr012143;
 Thu, 29 Sep 2022 01:04:24 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 28T14N2r012142;
 Thu, 29 Sep 2022 01:04:24 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id D15665000AF; Wed, 28 Sep 2022 18:04:23 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL 3/3] Hexagon (target/hexagon) Change decision to set
 pkt_has_store_s[01]
Date: Wed, 28 Sep 2022 18:04:16 -0700
Message-Id: <20220929010416.7418-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929010416.7418-1-tsimpson@quicinc.com>
References: <20220929010416.7418-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _yqe0dfAi9s4lycBAqYTyPiBiqhvqHyQ
X-Proofpoint-ORIG-GUID: _yqe0dfAi9s4lycBAqYTyPiBiqhvqHyQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_11,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=444 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209290005
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2UgaGF2ZSBmb3VuZCBjYXNlcyB3aGVyZSBwa3RfaGFzX3N0b3JlX3NbMDFdIGlzIHNldCBpbmNv
cnJlY3RseS4KVGhpcyBsZWFkcyB0byBnZW5lcmF0aW5nIGFuIHVubmVjZXNzYXJ5IHN0b3JlIHRo
YXQgaXMgbGVmdCBvdmVyCmZyb20gYSBwcmV2aW91cyBwYWNrZXQuCgpBZGQgYW4gYXR0cmlidXRl
IHRvIGRldGVybWluZSBpZiBhbiBpbnN0cnVjdGlvbiBpcyBhIHNjYWxhciBzdG9yZQpUaGUgYXR0
cmlidXRlIGlzIGF0dGFjaGVkIHRvIHRoZSBmU1RPUkUgbWFjcm8gKGhleF9jb21tb24ucHkpClVw
ZGF0ZSB0aGUgbG9naWMgaW4gZGVjb2RlLmMgdGhhdCBzZXRzIHBrdF9oYXNfc3RvcmVfc1swMV0K
ClNpZ25lZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
PgpNZXNzYWdlLUlkOiA8MjAyMjA5MjAwODA3NDYuMjY3OTEtNC10c2ltcHNvbkBxdWljaW5jLmNv
bT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyB8ICAxICsKIHRhcmdldC9o
ZXhhZ29uL2RlY29kZS5jICAgICAgICAgIHwgMTMgKysrKysrKystLS0tLQogdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMgICAgICAgfCAxMCArKysrKystLS0tCiB0YXJnZXQvaGV4YWdvbi9oZXhf
Y29tbW9uLnB5ICAgICB8ICAzICsrLQogNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2Rl
Zi5oLmluYyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCmluZGV4IDIyMmFkOTVm
YjAuLjVkMmExMDJjMTggMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmgu
aW5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCkBAIC00NCw2ICs0NCw3
IEBAIERFRl9BVFRSSUIoTUVNU0laRV8xQiwgIk1lbW9yeSB3aWR0aCBpcyAxIGJ5dGUiLCAiIiwg
IiIpCiBERUZfQVRUUklCKE1FTVNJWkVfMkIsICJNZW1vcnkgd2lkdGggaXMgMiBieXRlcyIsICIi
LCAiIikKIERFRl9BVFRSSUIoTUVNU0laRV80QiwgIk1lbW9yeSB3aWR0aCBpcyA0IGJ5dGVzIiwg
IiIsICIiKQogREVGX0FUVFJJQihNRU1TSVpFXzhCLCAiTWVtb3J5IHdpZHRoIGlzIDggYnl0ZXMi
LCAiIiwgIiIpCitERUZfQVRUUklCKFNDQUxBUl9TVE9SRSwgIlN0b3JlIGlzIHNjYWxhciIsICIi
LCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpFXzFCLCAiTWVtb3J5IHdpZHRoIGlzIDEgYnl0ZSIs
ICIiLCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpFXzJCLCAiTWVtb3J5IHdpZHRoIGlzIDIgYnl0
ZXMiLCAiIiwgIiIpCiBERUZfQVRUUklCKFJFR1dSU0laRV80QiwgIk1lbW9yeSB3aWR0aCBpcyA0
IGJ5dGVzIiwgIiIsICIiKQpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgYi90
YXJnZXQvaGV4YWdvbi9kZWNvZGUuYwppbmRleCA2ZjBmMjdiNGJhLi42YjczYjVjNjBjIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9kZWNvZGUuYworKysgYi90YXJnZXQvaGV4YWdvbi9kZWNv
ZGUuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFs
Y29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENv
cHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpA
QCAtNDAyLDEwICs0MDIsMTMgQEAgc3RhdGljIHZvaWQgZGVjb2RlX3NldF9pbnNuX2F0dHJfZmll
bGRzKFBhY2tldCAqcGt0KQogICAgICAgICB9CiAKICAgICAgICAgaWYgKEdFVF9BVFRSSUIob3Bj
b2RlLCBBX1NUT1JFKSkgewotICAgICAgICAgICAgaWYgKHBrdC0+aW5zbltpXS5zbG90ID09IDAp
IHsKLSAgICAgICAgICAgICAgICBwa3QtPnBrdF9oYXNfc3RvcmVfczAgPSB0cnVlOwotICAgICAg
ICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgICAgICBwa3QtPnBrdF9oYXNfc3RvcmVfczEgPSB0
cnVlOworICAgICAgICAgICAgaWYgKEdFVF9BVFRSSUIob3Bjb2RlLCBBX1NDQUxBUl9TVE9SRSkg
JiYKKyAgICAgICAgICAgICAgICAhR0VUX0FUVFJJQihvcGNvZGUsIEFfTUVNU0laRV8wQikpIHsK
KyAgICAgICAgICAgICAgICBpZiAocGt0LT5pbnNuW2ldLnNsb3QgPT0gMCkgeworICAgICAgICAg
ICAgICAgICAgICBwa3QtPnBrdF9oYXNfc3RvcmVfczAgPSB0cnVlOworICAgICAgICAgICAgICAg
IH0gZWxzZSB7CisgICAgICAgICAgICAgICAgICAgIHBrdC0+cGt0X2hhc19zdG9yZV9zMSA9IHRy
dWU7CisgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQogICAgICAgICB9CiAKZGlmZiAt
LWdpdCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNs
YXRlLmMKaW5kZXggNTRiODBjNDE1Ny4uY2U1N2VlMWVmMCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTEs
NSArMSw1IEBACiAvKgotICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3Zh
dGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqICBDb3B5cmlnaHQoYykg
MjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuCiAgKgogICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAgKiAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTUyNCwxMCAr
NTI0LDEyIEBAIHN0YXRpYyB2b2lkIHByb2Nlc3Nfc3RvcmVfbG9nKERpc2FzQ29udGV4dCAqY3R4
LCBQYWNrZXQgKnBrdCkKICAgICAgKiAgc2xvdCAxIGFuZCB0aGVuIHNsb3QgMC4gIFRoaXMgd2ls
bCBiZSBpbXBvcnRhbnQgd2hlbgogICAgICAqICB0aGUgbWVtb3J5IGFjY2Vzc2VzIG92ZXJsYXAu
CiAgICAgICovCi0gICAgaWYgKHBrdC0+cGt0X2hhc19zdG9yZV9zMSAmJiAhcGt0LT5wa3RfaGFz
X2RjemVyb2EpIHsKKyAgICBpZiAocGt0LT5wa3RfaGFzX3N0b3JlX3MxKSB7CisgICAgICAgIGdf
YXNzZXJ0KCFwa3QtPnBrdF9oYXNfZGN6ZXJvYSk7CiAgICAgICAgIHByb2Nlc3Nfc3RvcmUoY3R4
LCBwa3QsIDEpOwogICAgIH0KLSAgICBpZiAocGt0LT5wa3RfaGFzX3N0b3JlX3MwICYmICFwa3Qt
PnBrdF9oYXNfZGN6ZXJvYSkgeworICAgIGlmIChwa3QtPnBrdF9oYXNfc3RvcmVfczApIHsKKyAg
ICAgICAgZ19hc3NlcnQoIXBrdC0+cGt0X2hhc19kY3plcm9hKTsKICAgICAgICAgcHJvY2Vzc19z
dG9yZShjdHgsIHBrdCwgMCk7CiAgICAgfQogfQpAQCAtNjkwLDcgKzY5Miw3IEBAIHN0YXRpYyB2
b2lkIGdlbl9jb21taXRfcGFja2V0KENQVUhleGFnb25TdGF0ZSAqZW52LCBEaXNhc0NvbnRleHQg
KmN0eCwKICAgICAgICAgICogVGhlIGRjemVyb2Egd2lsbCBiZSB0aGUgc3RvcmUgaW4gc2xvdCAw
LCBjaGVjayB0aGF0IHdlIGRvbid0IGhhdmUKICAgICAgICAgICogYSBzdG9yZSBpbiBzbG90IDEg
b3IgYW4gSFZYIHN0b3JlLgogICAgICAgICAgKi8KLSAgICAgICAgZ19hc3NlcnQoaGFzX3N0b3Jl
X3MwICYmICFoYXNfc3RvcmVfczEgJiYgIWhhc19odnhfc3RvcmUpOworICAgICAgICBnX2Fzc2Vy
dCghaGFzX3N0b3JlX3MxICYmICFoYXNfaHZ4X3N0b3JlKTsKICAgICAgICAgcHJvY2Vzc19kY3pl
cm9hKGN0eCwgcGt0KTsKICAgICB9IGVsc2UgaWYgKGhhc19odnhfc3RvcmUpIHsKICAgICAgICAg
VENHdiBtZW1faWR4ID0gdGNnX2NvbnN0YW50X3RsKGN0eC0+bWVtX2lkeCk7CmRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5IGIvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1v
bi5weQppbmRleCBjODFhY2E4ZDJhLi5kOWJhN2RmNzg2IDEwMDc1NQotLS0gYS90YXJnZXQvaGV4
YWdvbi9oZXhfY29tbW9uLnB5CisrKyBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKQEAg
LTEsNyArMSw3IEBACiAjIS91c3IvYmluL2VudiBweXRob24zCiAKICMjCi0jIyAgQ29weXJpZ2h0
KGMpIDIwMTktMjAyMSBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRz
IFJlc2VydmVkLgorIyMgIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICMjCiAjIyAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
ICMjICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQpAQCAtNzUsNiArNzUsNyBAQCBkZWYgY2FsY3VsYXRlX2F0dHJpYnMo
KToKICAgICBhZGRfcWVtdV9tYWNyb19hdHRyaWIoJ2ZXUklURV9QMycsICdBX1dSSVRFU19QUkVE
X1JFRycpCiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdmU0VUX09WRVJGTE9XJywgJ0FfSU1Q
TElDSVRfV1JJVEVTX1VTUicpCiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdmU0VUX0xQQ0ZH
JywgJ0FfSU1QTElDSVRfV1JJVEVTX1VTUicpCisgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdm
U1RPUkUnLCAnQV9TQ0FMQVJfU1RPUkUnKQogCiAgICAgIyBSZWN1cnNlIGRvd24gbWFjcm9zLCBm
aW5kIGF0dHJpYnV0ZXMgZnJvbSBzdWItbWFjcm9zCiAgICAgbWFjcm9WYWx1ZXMgPSBsaXN0KG1h
Y3Jvcy52YWx1ZXMoKSkKLS0gCjIuMTcuMQoK

