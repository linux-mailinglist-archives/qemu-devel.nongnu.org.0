Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D406AD6E1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyd-0006nq-JF; Tue, 07 Mar 2023 00:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyR-0006bU-Sp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyK-0006ZC-0P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3275FNFA016737; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ogf3UYBlzmf/pVCuj1e7sq0k8AVVkVCj28FDcUQH7GM=;
 b=Cv06zTf0kQsDcykgy5E4VAH+GIvSm3EM836Gi9hq9BvxqdhZnAbd9AeVg55tkT169pH6
 WrEkZpt/AJLdMqNCK2SN0rhWaIrfoeEtPH04PzYxzvg6tU5bKd/HHqaHlRE1tYTT/IOF
 k0r+l2IrsaeRaIrjkM6e2SFsBCCFsPV7pnwf5s3RUkYXCQbSdc18AKOxvvo92clMdQGf
 vrRK7fkD2DULGUu8U3GkAq4Dha6aEF8fXyvYVAJMgvi/AXR+jfYgohGWUDlyi7FMz5i6
 be2TNN8aPImAbQiOt8N22BsJ17eHTcw8UE2FEdprk9ZFuiwVkOkQO0U8Jkt1HPNGyt5m pA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p419d6yb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:45 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275UIcq026157; 
 Tue, 7 Mar 2023 05:34:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3p4fhbm8nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275YhQk000515;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3275YhdO000507
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 9A2B16EA; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 09/17] Hexagon (target/hexagon) Don't set pkt_has_store_s1 when
 not needed
Date: Mon,  6 Mar 2023 21:34:30 -0800
Message-Id: <20230307053438.2416629-10-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mg5G4Ml2_zhUaSPXXfxMoSA7TjUycI_I
X-Proofpoint-GUID: mg5G4Ml2_zhUaSPXXfxMoSA7TjUycI_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 mlxlogscore=437 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070050
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
eTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIwMjMwMzA3MDI1
ODI4LjE2MTI4MDktNy10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi90
cmFuc2xhdGUuaCAgICAgICAgICB8IDEgKwogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5p
bmMgICAgfCAxICsKIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgIHwgNiArKysr
Ky0KIHRhcmdldC9oZXhhZ29uL2dlbl9hbmFseXplX2Z1bmNzLnB5IHwgNSArKysrKwogdGFyZ2V0
L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgfCAxICsKIDUgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L3RyYW5zbGF0ZS5oIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKaW5kZXggZDQ1ZDNhNGJi
MC4uMzQzNjhiMjE4NiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKKysr
IGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmgKQEAgLTYxLDYgKzYxLDcgQEAgdHlwZWRlZiBz
dHJ1Y3QgRGlzYXNDb250ZXh0IHsKICAgICBUQ0dDb25kIGJyYW5jaF9jb25kOwogICAgIHRhcmdl
dF91bG9uZyBicmFuY2hfZGVzdDsKICAgICBib29sIGlzX3RpZ2h0X2xvb3A7CisgICAgYm9vbCBu
ZWVkX3BrdF9oYXNfc3RvcmVfczE7CiB9IERpc2FzQ29udGV4dDsKIAogc3RhdGljIGlubGluZSB2
b2lkIGN0eF9sb2dfcHJlZF93cml0ZShEaXNhc0NvbnRleHQgKmN0eCwgaW50IHBudW0pCmRpZmYg
LS1naXQgYS90YXJnZXQvaGV4YWdvbi9hdHRyaWJzX2RlZi5oLmluYyBiL3RhcmdldC9oZXhhZ29u
L2F0dHJpYnNfZGVmLmguaW5jCmluZGV4IDVkMmExMDJjMTguLjk4NzRkMTY1OGYgMTAwNjQ0Ci0t
LSBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnNfZGVmLmguaW5jCisrKyBiL3RhcmdldC9oZXhhZ29u
L2F0dHJpYnNfZGVmLmguaW5jCkBAIC00NCw2ICs0NCw3IEBAIERFRl9BVFRSSUIoTUVNU0laRV8x
QiwgIk1lbW9yeSB3aWR0aCBpcyAxIGJ5dGUiLCAiIiwgIiIpCiBERUZfQVRUUklCKE1FTVNJWkVf
MkIsICJNZW1vcnkgd2lkdGggaXMgMiBieXRlcyIsICIiLCAiIikKIERFRl9BVFRSSUIoTUVNU0la
RV80QiwgIk1lbW9yeSB3aWR0aCBpcyA0IGJ5dGVzIiwgIiIsICIiKQogREVGX0FUVFJJQihNRU1T
SVpFXzhCLCAiTWVtb3J5IHdpZHRoIGlzIDggYnl0ZXMiLCAiIiwgIiIpCitERUZfQVRUUklCKFND
QUxBUl9MT0FELCAiTG9hZCBpcyBzY2FsYXIiLCAiIiwgIiIpCiBERUZfQVRUUklCKFNDQUxBUl9T
VE9SRSwgIlN0b3JlIGlzIHNjYWxhciIsICIiLCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpFXzFC
LCAiTWVtb3J5IHdpZHRoIGlzIDEgYnl0ZSIsICIiLCAiIikKIERFRl9BVFRSSUIoUkVHV1JTSVpF
XzJCLCAiTWVtb3J5IHdpZHRoIGlzIDIgYnl0ZXMiLCAiIiwgIiIpCmRpZmYgLS1naXQgYS90YXJn
ZXQvaGV4YWdvbi90cmFuc2xhdGUuYyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCmluZGV4
IDllNWZjZWUxZWUuLjAxNjcxZDU0NTEgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL3RyYW5z
bGF0ZS5jCisrKyBiL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jCkBAIC0zMzMsNiArMzMzLDcg
QEAgc3RhdGljIHZvaWQgbWFya19pbXBsaWNpdF9wcmVkX3dyaXRlcyhEaXNhc0NvbnRleHQgKmN0
eCkKIHN0YXRpYyB2b2lkIGFuYWx5emVfcGFja2V0KERpc2FzQ29udGV4dCAqY3R4KQogewogICAg
IFBhY2tldCAqcGt0ID0gY3R4LT5wa3Q7CisgICAgY3R4LT5uZWVkX3BrdF9oYXNfc3RvcmVfczEg
PSBmYWxzZTsKICAgICBmb3IgKGludCBpID0gMDsgaSA8IHBrdC0+bnVtX2luc25zOyBpKyspIHsK
ICAgICAgICAgSW5zbiAqaW5zbiA9ICZwa3QtPmluc25baV07CiAgICAgICAgIGN0eC0+aW5zbiA9
IGluc247CkBAIC0zNjcsMTIgKzM2OCwxNSBAQCBzdGF0aWMgdm9pZCBnZW5fc3RhcnRfcGFja2V0
KERpc2FzQ29udGV4dCAqY3R4KQogICAgIGZvciAoaSA9IDA7IGkgPCBTVE9SRVNfTUFYOyBpKysp
IHsKICAgICAgICAgY3R4LT5zdG9yZV93aWR0aFtpXSA9IDA7CiAgICAgfQotICAgIHRjZ19nZW5f
bW92aV90bChoZXhfcGt0X2hhc19zdG9yZV9zMSwgcGt0LT5wa3RfaGFzX3N0b3JlX3MxKTsKICAg
ICBjdHgtPnMxX3N0b3JlX3Byb2Nlc3NlZCA9IGZhbHNlOwogICAgIGN0eC0+cHJlX2NvbW1pdCA9
IHRydWU7CiAKICAgICBhbmFseXplX3BhY2tldChjdHgpOwogCisgICAgaWYgKGN0eC0+bmVlZF9w
a3RfaGFzX3N0b3JlX3MxKSB7CisgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfcGt0X2hhc19z
dG9yZV9zMSwgcGt0LT5wa3RfaGFzX3N0b3JlX3MxKTsKKyAgICB9CisKICAgICAvKgogICAgICAq
IHByZWdzX3dyaXR0ZW4gaXMgdXNlZCBib3RoIGluIHRoZSBhbmFseXplIHBoYXNlIGFzIHdlbGwg
YXMgdGhlIGNvZGUKICAgICAgKiBnZW4gcGhhc2UsIHNvIGNsZWFyIGl0IGFnYWluLgpkaWZmIC0t
Z2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkgYi90YXJnZXQvaGV4YWdv
bi9nZW5fYW5hbHl6ZV9mdW5jcy5weQppbmRleCAzN2MxNjZkYzBkLi43ZTFmMjIxYjNjIDEwMDc1
NQotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weQorKysgYi90YXJnZXQv
aGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weQpAQCAtMjAwLDYgKzIwMCwxMSBAQCBkZWYgZ2Vu
X2FuYWx5emVfZnVuYyhmLCB0YWcsIHJlZ3MsIGltbXMpOgogICAgICAgICBhbmFseXplX29wbihm
LCB0YWcsIHJlZ3R5cGUsIHJlZ2lkLCB0b3NzLCBudW1yZWdzLCBpKQogICAgICAgICBpICs9IDEK
IAorICAgIGhhc19nZW5lcmF0ZWRfaGVscGVyID0gKG5vdCBoZXhfY29tbW9uLnNraXBfcWVtdV9o
ZWxwZXIodGFnKSBhbmQKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBub3QgaGV4X2NvbW1v
bi5pc19pZGVmX3BhcnNlcl9lbmFibGVkKHRhZykpCisgICAgaWYgKGhhc19nZW5lcmF0ZWRfaGVs
cGVyIGFuZAorICAgICAgICAnQV9TQ0FMQVJfTE9BRCcgaW4gaGV4X2NvbW1vbi5hdHRyaWJkaWN0
W3RhZ10pOgorICAgICAgICBmLndyaXRlKCIgICAgY3R4LT5uZWVkX3BrdF9oYXNfc3RvcmVfczEg
PSB0cnVlO1xuIikKIAogICAgIGYud3JpdGUoIn1cblxuIikKIApkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2hleGFnb24vaGV4X2NvbW1vbi5weSBiL3RhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkKaW5k
ZXggYTI5ZjYxYmI0Zi4uNzZkYTM2MmMxMSAxMDA3NTUKLS0tIGEvdGFyZ2V0L2hleGFnb24vaGV4
X2NvbW1vbi5weQorKysgYi90YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5CkBAIC04OSw2ICs4
OSw3IEBAIGRlZiBjYWxjdWxhdGVfYXR0cmlicygpOgogICAgIGFkZF9xZW11X21hY3JvX2F0dHJp
YignZldSSVRFX1AzJywgJ0FfV1JJVEVTX1BSRURfUkVHJykKICAgICBhZGRfcWVtdV9tYWNyb19h
dHRyaWIoJ2ZTRVRfT1ZFUkZMT1cnLCAnQV9JTVBMSUNJVF9XUklURVNfVVNSJykKICAgICBhZGRf
cWVtdV9tYWNyb19hdHRyaWIoJ2ZTRVRfTFBDRkcnLCAnQV9JTVBMSUNJVF9XUklURVNfVVNSJykK
KyAgICBhZGRfcWVtdV9tYWNyb19hdHRyaWIoJ2ZMT0FEJywgJ0FfU0NBTEFSX0xPQUQnKQogICAg
IGFkZF9xZW11X21hY3JvX2F0dHJpYignZlNUT1JFJywgJ0FfU0NBTEFSX1NUT1JFJykKIAogICAg
ICMgUmVjdXJzZSBkb3duIG1hY3JvcywgZmluZCBhdHRyaWJ1dGVzIGZyb20gc3ViLW1hY3Jvcwot
LSAKMi4yNS4xCgo=

