Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA75BE05A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:38:52 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYmI-000153-Rw
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaYId-0000NF-Vs
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:08:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaYIT-0005Ze-9c
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:08:10 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7xbqp009331;
 Tue, 20 Sep 2022 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OFo2epCxN4q7anz5k5MFCwzlLf97rfJ7oDoGgDgxqgg=;
 b=SZ1A0onyt7H34i0AF1McC4xTSS1bjCngXUAsXrdrXxLrILF88luDoe0I9blfoI7uKlXc
 k05Jg3fAPfMeyYtPmJVdkwmAZKH/rdj7OBgtjnKwD+dtCNBqo/d0rLE/Wz1D8Jv1xyeZ
 N6UtCPiXTYxv/9xECFsYFNkVQTj+oEDdV+Z+OWeKp5ly5NVz+zJN133YlUANmu/NMZQ5
 G/FgjJpkVBhJc4iT9jfvkZ4A6PjFUQ9oVIEZ8kdKtED3JTlRwwVGJitOWNzn70hm74Gr
 GWkZ3xP2YQYaQ1+SeUwPN7B7y9ddLpFsJs0PcTIzQDH+wwGthoW6n8Y9B71SoLtdrS17 vQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpt21k8bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 08:07:51 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28K83D4Z001852; 
 Tue, 20 Sep 2022 08:07:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3jnqp901nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Sep 2022 08:07:50 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28K87nlj006907;
 Tue, 20 Sep 2022 08:07:49 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 28K87nP9006905;
 Tue, 20 Sep 2022 08:07:49 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 52B765000AF; Tue, 20 Sep 2022 01:07:49 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH 3/3] Hexagon (target/hexagon) Change decision to set
 pkt_has_store_s[01]
Date: Tue, 20 Sep 2022 01:07:46 -0700
Message-Id: <20220920080746.26791-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920080746.26791-1-tsimpson@quicinc.com>
References: <20220920080746.26791-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Cry4YMRgT8B3TpfsYngfeZIxuxo2KgA9
X-Proofpoint-GUID: Cry4YMRgT8B3TpfsYngfeZIxuxo2KgA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=523
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200049
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
cmlidXRlIGlzIGF0dGFjaGVkIHRvIHRoZSBmU1RPUkUgbWFjcm8gKGhleF9jb21tb24ucHkpClNp
bXBsaWZ5IHRoZSBsb2dpYyBpbiBkZWNvZGUuYyB0aGF0IHNldHMgcGt0X2hhc19zdG9yZV9zWzAx
XQoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgot
LS0KIHRhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jIHwgIDEgKwogdGFyZ2V0L2hleGFn
b24vZGVjb2RlLmMgICAgICAgICAgfCAxNyArKysrKysrKysrKystLS0tLQogdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMgICAgICAgfCAxMCArKysrKystLS0tCiB0YXJnZXQvaGV4YWdvbi9oZXhf
Y29tbW9uLnB5ICAgICB8ICAzICsrLQogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
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
YXJnZXQvaGV4YWdvbi9kZWNvZGUuYwppbmRleCA2ZjBmMjdiNGJhLi4yYmE5NGE3N2RlIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9kZWNvZGUuYworKysgYi90YXJnZXQvaGV4YWdvbi9kZWNv
ZGUuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMSBRdWFs
Y29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorICogIENv
cHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxs
IFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICAqICBpdCB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpA
QCAtNDAyLDEwICs0MDIsMTcgQEAgc3RhdGljIHZvaWQgZGVjb2RlX3NldF9pbnNuX2F0dHJfZmll
bGRzKFBhY2tldCAqcGt0KQogICAgICAgICB9CiAKICAgICAgICAgaWYgKEdFVF9BVFRSSUIob3Bj
b2RlLCBBX1NUT1JFKSkgewotICAgICAgICAgICAgaWYgKHBrdC0+aW5zbltpXS5zbG90ID09IDAp
IHsKLSAgICAgICAgICAgICAgICBwa3QtPnBrdF9oYXNfc3RvcmVfczAgPSB0cnVlOwotICAgICAg
ICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgICAgICBwa3QtPnBrdF9oYXNfc3RvcmVfczEgPSB0
cnVlOworICAgICAgICAgICAgaWYgKEdFVF9BVFRSSUIob3Bjb2RlLCBBX1NDQUxBUl9TVE9SRSkg
JiYKKyAgICAgICAgICAgICAgICAhR0VUX0FUVFJJQihvcGNvZGUsIEFfTUVNU0laRV8wQikpIHsK
KyAgICAgICAgICAgICAgICBnX2Fzc2VydChHRVRfQVRUUklCKG9wY29kZSwgQV9NRU1TSVpFXzFC
KSB8fAorICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9BVFRSSUIob3Bjb2RlLCBBX01FTVNJ
WkVfMkIpIHx8CisgICAgICAgICAgICAgICAgICAgICAgICAgR0VUX0FUVFJJQihvcGNvZGUsIEFf
TUVNU0laRV80QikgfHwKKyAgICAgICAgICAgICAgICAgICAgICAgICBHRVRfQVRUUklCKG9wY29k
ZSwgQV9NRU1TSVpFXzhCKSk7CisgICAgICAgICAgICAgICAgaWYgKHBrdC0+aW5zbltpXS5zbG90
ID09IDApIHsKKyAgICAgICAgICAgICAgICAgICAgcGt0LT5wa3RfaGFzX3N0b3JlX3MwID0gdHJ1
ZTsKKyAgICAgICAgICAgICAgICB9IGVsc2UgeworICAgICAgICAgICAgICAgICAgICBwa3QtPnBr
dF9oYXNfc3RvcmVfczEgPSB0cnVlOworICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgIH0K
ICAgICAgICAgfQogCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3Rh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IGJjMDI4NzBiOWYuLmVmZTdkMjI2NGUgMTAw
NjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0y
MDIxIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQu
CisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwg
SW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlz
aGVkIGJ5CkBAIC01MjUsMTAgKzUyNSwxMiBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzX3N0b3JlX2xv
ZyhEaXNhc0NvbnRleHQgKmN0eCwgUGFja2V0ICpwa3QpCiAgICAgICogIHNsb3QgMSBhbmQgdGhl
biBzbG90IDAuICBUaGlzIHdpbGwgYmUgaW1wb3J0YW50IHdoZW4KICAgICAgKiAgdGhlIG1lbW9y
eSBhY2Nlc3NlcyBvdmVybGFwLgogICAgICAqLwotICAgIGlmIChwa3QtPnBrdF9oYXNfc3RvcmVf
czEgJiYgIXBrdC0+cGt0X2hhc19kY3plcm9hKSB7CisgICAgaWYgKHBrdC0+cGt0X2hhc19zdG9y
ZV9zMSkgeworICAgICAgICBnX2Fzc2VydCghcGt0LT5wa3RfaGFzX2RjemVyb2EpOwogICAgICAg
ICBwcm9jZXNzX3N0b3JlKGN0eCwgcGt0LCAxKTsKICAgICB9Ci0gICAgaWYgKHBrdC0+cGt0X2hh
c19zdG9yZV9zMCAmJiAhcGt0LT5wa3RfaGFzX2RjemVyb2EpIHsKKyAgICBpZiAocGt0LT5wa3Rf
aGFzX3N0b3JlX3MwKSB7CisgICAgICAgIGdfYXNzZXJ0KCFwa3QtPnBrdF9oYXNfZGN6ZXJvYSk7
CiAgICAgICAgIHByb2Nlc3Nfc3RvcmUoY3R4LCBwa3QsIDApOwogICAgIH0KIH0KQEAgLTY5MSw3
ICs2OTMsNyBAQCBzdGF0aWMgdm9pZCBnZW5fY29tbWl0X3BhY2tldChDUFVIZXhhZ29uU3RhdGUg
KmVudiwgRGlzYXNDb250ZXh0ICpjdHgsCiAgICAgICAgICAqIFRoZSBkY3plcm9hIHdpbGwgYmUg
dGhlIHN0b3JlIGluIHNsb3QgMCwgY2hlY2sgdGhhdCB3ZSBkb24ndCBoYXZlCiAgICAgICAgICAq
IGEgc3RvcmUgaW4gc2xvdCAxIG9yIGFuIEhWWCBzdG9yZS4KICAgICAgICAgICovCi0gICAgICAg
IGdfYXNzZXJ0KGhhc19zdG9yZV9zMCAmJiAhaGFzX3N0b3JlX3MxICYmICFoYXNfaHZ4X3N0b3Jl
KTsKKyAgICAgICAgZ19hc3NlcnQoIWhhc19zdG9yZV9zMSAmJiAhaGFzX2h2eF9zdG9yZSk7CiAg
ICAgICAgIHByb2Nlc3NfZGN6ZXJvYShjdHgsIHBrdCk7CiAgICAgfSBlbHNlIGlmIChoYXNfaHZ4
X3N0b3JlKSB7CiAgICAgICAgIFRDR3YgbWVtX2lkeCA9IHRjZ19jb25zdGFudF90bChjdHgtPm1l
bV9pZHgpOwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSBiL3Rhcmdl
dC9oZXhhZ29uL2hleF9jb21tb24ucHkKaW5kZXggYzgxYWNhOGQyYS4uZDliYTdkZjc4NiAxMDA3
NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weQorKysgYi90YXJnZXQvaGV4YWdv
bi9oZXhfY29tbW9uLnB5CkBAIC0xLDcgKzEsNyBAQAogIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwog
CiAjIwotIyMgIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50
ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMjICBDb3B5cmlnaHQoYykgMjAxOS0yMDIy
IFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCiAj
IwogIyMgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IgbW9kaWZ5CiAjIyAgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAgLTc1LDYgKzc1LDcgQEAgZGVm
IGNhbGN1bGF0ZV9hdHRyaWJzKCk6CiAgICAgYWRkX3FlbXVfbWFjcm9fYXR0cmliKCdmV1JJVEVf
UDMnLCAnQV9XUklURVNfUFJFRF9SRUcnKQogICAgIGFkZF9xZW11X21hY3JvX2F0dHJpYignZlNF
VF9PVkVSRkxPVycsICdBX0lNUExJQ0lUX1dSSVRFU19VU1InKQogICAgIGFkZF9xZW11X21hY3Jv
X2F0dHJpYignZlNFVF9MUENGRycsICdBX0lNUExJQ0lUX1dSSVRFU19VU1InKQorICAgIGFkZF9x
ZW11X21hY3JvX2F0dHJpYignZlNUT1JFJywgJ0FfU0NBTEFSX1NUT1JFJykKIAogICAgICMgUmVj
dXJzZSBkb3duIG1hY3JvcywgZmluZCBhdHRyaWJ1dGVzIGZyb20gc3ViLW1hY3JvcwogICAgIG1h
Y3JvVmFsdWVzID0gbGlzdChtYWNyb3MudmFsdWVzKCkpCi0tIAoyLjE3LjEKCg==

