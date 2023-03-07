Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C76AD533
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:00:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXR-0000VL-2T; Mon, 06 Mar 2023 21:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXM-0000UF-0A
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:48 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXK-0005nB-5F
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:47 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3270nqCo002235; Tue, 7 Mar 2023 02:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=djYZoTvaUI5SEvEENviV/omAQBxJvxsTHUrvgVDMd8U=;
 b=RFOLp24ZOUNnoNf8CkyKpIj9+oGSzPts8Mf1tGz66QHfc4Xef6RJC+e9LSJBJ6EHVm8g
 /EAd73cs/aJuySEQAfH6Cp/3SFyA3gqlvbC6UjLGkdPpFvkZ9M09V/MC12hkUFhKb7SK
 pEpFx6OYHVeJ8whvJFRM5zTa94l6V3DjtnT+B6U+QNi4EZB5oxBuIzWpN/OuUAiHUJtn
 DyG/n63YL1RbGT1F7nJ304x0WiXc6CNdRQgdFy+XPhuzHCcqIR6Kq1j5f4rIDMhWii1a
 Hjr5SyohA/iqC+uiRThvm/D7xvNYroOJfxe+DtEhebdjeVXYtZrNP0rJKLnZ9ubfMySK KQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p417epn5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:33 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272uZ1R000624; 
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3p4fhbkh8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wVa2002441;
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3272wV66002432
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id CC80B6AB; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 06/14] Hexagon (target/hexagon) Don't set pkt_has_store_s1
 when not needed
Date: Mon,  6 Mar 2023 18:58:20 -0800
Message-Id: <20230307025828.1612809-7-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307025828.1612809-1-tsimpson@quicinc.com>
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PLqn0CrAJYlpnEzgGUmzBuj5PnR_e-M5
X-Proofpoint-GUID: PLqn0CrAJYlpnEzgGUmzBuj5PnR_e-M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=621 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070025
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VGhlIHBrdF9oYXNfc3RvcmVfczEgZmllbGQgaW4gQ1BVSGV4YWdvblN0YXRlIGlzIG9ubHkgbmVl
ZGVkIGluIGdlbmVyYXRlZApoZWxwZXJzIGZvciBzY2FsYXIgbG9hZCBpbnN0cnVjdGlvbnMuICBT
ZWUgY2hlY2tfbm9zaHVmIGFuZCBtZW1fbG9hZFsxMjQ4XQppbiBvcF9oZWxwZXIuYy4KCldlIGFk
ZCBsb2dpYyBpbiBnZW5fYW5hbHl6ZV9mdW5jcy5weSB0byBzZXQgbmVlZF9wa3RfaGFzX3N0b3Jl
X3MxIGluCkRpc2FzQ29udGV4dCB3aGVuIGl0IGlzIG5lZWRlZCBhdCBydW50aW1lLgoKU2lnbmVk
LW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1i
eTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuaCAgICAgICAgICB8IDEgKwogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMg
ICAgfCAxICsKIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgIHwgNiArKysrKy0K
IHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5IHwgNSArKysrKwogdGFyZ2V0L2hl
eGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgfCAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL3Ry
YW5zbGF0ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggZDQ1ZDNhNGJiMC4u
MzQzNjhiMjE4NiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysrIGIv
dGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTYxLDYgKzYxLDcgQEAgdHlwZWRlZiBzdHJ1
Y3QgRGlzYXNDb250ZXh0IHsKICAgICBUQ0dDb25kIGJyYW5jaF9jb25kOwogICAgIHRhcmdldF91
bG9uZyBicmFuY2hfZGVzdDsKICAgICBib29sIGlzX3RpZ2h0X2xvb3A7CisgICAgYm9vbCBuZWVk
X3BrdF9oYXNfc3RvcmVfczE7CiB9IERpc2FzQ29udGV4dDsKIAogc3RhdGljIGlubGluZSB2b2lk
IGN0eF9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0pCmRpZmYgLS1n
aXQgYS90YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyBiL3RhcmdldC9oZXhhZ29uL2F0
dHJpYnNfZGVmLmguaW5jCmluZGV4IDVkMmExMDJjMTguLjk4NzRkMTY1OGYgMTAwNjQ0Ci0tLSBh
L3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2F0
dHJpYnNfZGVmLmguaW5jCkBAIC00NCw2ICs0NCw3IEBAIERFRl9BVFRSSUIoTUVNU0laRV8xQiwg
Ik1lbW9yeSB3aWR0aCBpcyAxIGJ5dGUiLCAiIiwgIiIpCiBERUZfQVRUUklCKE1FTVNJWkVfMkIs
ICJNZW1vcnkgd2lkdGggaXMgMiBieXRlcyIsICIiLCAiIikKIERFRl9BVFRSSUIoTUVNU0laRV80
QiwgIk1lbW9yeSB3aWR0aCBpcyA0IGJ5dGVzIiwgIiIsICIiKQogREVGX0FUVFJJQihNRU1TSVpF
XzhCLCAiTWVtb3J5IHdpZHRoIGlzIDggYnl0ZXMiLCAiIiwgIiIpCitERUZfQVRUUklCKFNDQUxB
Ul9MT0FELCAiTG9hZCBpcyBzY2FsYXIiLCAiIiwgIiIpCiBERUZfQVRUUklCKFNDQUxBUl9TVE9S
RSwgIlN0b3JlIGlzIHNjYWxhciIsICIiLCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpFXzFCLCAi
TWVtb3J5IHdpZHRoIGlzIDEgYnl0ZSIsICIiLCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpFXzJC
LCAiTWVtb3J5IHdpZHRoIGlzIDIgYnl0ZXMiLCAiIiwgIiIpCmRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4IDll
NWZjZWUxZWUuLjAxNjcxZDU0NTEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0
ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0zMzMsNiArMzMzLDcgQEAg
c3RhdGljIHZvaWQgbWFya19pbXBsaWNpdF9wcmVkX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0eCkK
IHN0YXRpYyB2b2lkIGFuYWx5emVfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQogewogICAgIFBh
Y2tldCAqcGt0ID0gY3R4LT5wa3Q7CisgICAgY3R4LT5uZWVkX3BrdF9oYXNfc3RvcmVfczEgPSBm
YWxzZTsKICAgICBmb3IgKGludCBpID0gMDsgaSA8IHBrdC0+bnVtX2luc25zOyBpKyspIHsKICAg
ICAgICAgSW5zbiAqaW5zbiA9ICZwa3QtPmluc25baV07CiAgICAgICAgIGN0eC0+aW5zbiA9IGlu
c247CkBAIC0zNjcsMTIgKzM2OCwxNSBAQCBzdGF0aWMgdm9pZCBnZW5fc3RhcnRfcGFja2V0KERp
c2FzQ29udGV4dCAqY3R4KQogICAgIGZvciAoaSA9IDA7IGkgPCBTVE9SRVNfTUFYOyBpKyspIHsK
ICAgICAgICAgY3R4LT5zdG9yZV93aWR0aFtpXSA9IDA7CiAgICAgfQotICAgIHRjZ19nZW5fbW92
aV90bChoZXhfcGt0X2hhc19zdG9yZV9zMSwgcGt0LT5wa3RfaGFzX3N0b3JlX3MxKTsKICAgICBj
dHgtPnMxX3N0b3JlX3Byb2Nlc3NlZCA9IGZhbHNlOwogICAgIGN0eC0+cHJlX2NvbW1pdCA9IHRy
dWU7CiAKICAgICBhbmFseXplX3BhY2tldChjdHgpOwogCisgICAgaWYgKGN0eC0+bmVlZF9wa3Rf
aGFzX3N0b3JlX3MxKSB7CisgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfcGt0X2hhc19zdG9y
ZV9zMSwgcGt0LT5wa3RfaGFzX3N0b3JlX3MxKTsKKyAgICB9CisKICAgICAvKgogICAgICAqIHBy
ZWdzX3dyaXR0ZW4gaXMgdXNlZCBib3RoIGluIHRoZSBhbmFseXplIHBoYXNlIGFzIHdlbGwgYXMg
dGhlIGNvZGUKICAgICAgKiBnZW4gcGhhc2UsIHNvIGNsZWFyIGl0IGFnYWluLgpkaWZmIC0tZ2l0
IGEvdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkgYi90YXJnZXQvaGV4YWdvbi9n
ZW5fYW5hbHl6ZV9mdW5jcy5weQppbmRleCAzN2MxNjZkYzBkLi43ZTFmMjIxYjNjIDEwMDc1NQot
LS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weQorKysgYi90YXJnZXQvaGV4
YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weQpAQCAtMjAwLDYgKzIwMCwxMSBAQCBkZWYgZ2VuX2Fu
YWx5emVfZnVuYyhmLCB0YWcsIHJlZ3MsIGltbXMpOgogICAgICAgICBhbmFseXplX29wbihmLCB0
YWcsIHJlZ3R5cGUsIHJlZ2lkLCB0b3NzLCBudW1yZWdzLCBpKQogICAgICAgICBpICs9IDEKIAor
ICAgIGhhc19nZW5lcmF0ZWRfaGVscGVyID0gKG5vdCBoZXhfY29tbW9uLnNraXBfcWVtdV9oZWxw
ZXIodGFnKSBhbmQKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBub3QgaGV4X2NvbW1vbi5p
c19pZGVmX3BhcnNlcl9lbmFibGVkKHRhZykpCisgICAgaWYgKGhhc19nZW5lcmF0ZWRfaGVscGVy
IGFuZAorICAgICAgICAnQV9TQ0FMQVJfTE9BRCcgaW4gaGV4X2NvbW1vbi5hdHRyaWJkaWN0W3Rh
Z10pOgorICAgICAgICBmLndyaXRlKCIgICAgY3R4LT5uZWVkX3BrdF9oYXNfc3RvcmVfczEgPSB0
cnVlO1xuIikKIAogICAgIGYud3JpdGUoIn1cblxuIikKIApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vaGV4X2NvbW1vbi5weSBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKaW5kZXgg
YTI5ZjYxYmI0Zi4uNzZkYTM2MmMxMSAxMDA3NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vaGV4X2Nv
bW1vbi5weQorKysgYi90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5CkBAIC04OSw2ICs4OSw3
IEBAIGRlZiBjYWxjdWxhdGVfYXR0cmlicygpOgogICAgIGFkZF9xZW11X21hY3JvX2F0dHJpYign
ZldSSVRFX1AzJywgJ0FfV1JJVEVTX1BSRURfUkVHJykKICAgICBhZGRfcWVtdV9tYWNyb19hdHRy
aWIoJ2ZTRVRfT1ZFUkZMT1cnLCAnQV9JTVBMSUNJVF9XUklURVNfVVNSJykKICAgICBhZGRfcWVt
dV9tYWNyb19hdHRyaWIoJ2ZTRVRfTFBDRkcnLCAnQV9JTVBMSUNJVF9XUklURVNfVVNSJykKKyAg
ICBhZGRfcWVtdV9tYWNyb19hdHRyaWIoJ2ZMT0FEJywgJ0FfU0NBTEFSX0xPQUQnKQogICAgIGFk
ZF9xZW11X21hY3JvX2F0dHJpYignZlNUT1JFJywgJ0FfU0NBTEFSX1NUT1JFJykKIAogICAgICMg
UmVjdXJzZSBkb3duIG1hY3JvcywgZmluZCBhdHRyaWJ1dGVzIGZyb20gc3ViLW1hY3JvcwotLSAK
Mi4yNS4xCgo=

