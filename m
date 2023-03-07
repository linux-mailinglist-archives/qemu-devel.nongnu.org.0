Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC36F6AD530
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:00:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXR-0000VP-Eu; Mon, 06 Mar 2023 21:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXN-0000Uj-63
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:49 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXK-0005nU-7B
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:48 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Ne2tO019316; Tue, 7 Mar 2023 02:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2/hFpQv2Z/4arGriaxpvhxry66xYAOrtUXacBXnPEp8=;
 b=FqdM+4FC+wBEafQ+ACmI1tBlGxwul+8kc42Pezd3CX99fRQSAfZqiHu387yz7tfo9CX4
 +eDcvsVU6kIG3FVD3LgUCwB7FGbXpxzJRLFvQ9SQHwvoHDAeSgWjiJcNag8k1eiFGhKG
 n9VvdUOEVI6vXaT4JmvXrx1+oVtKg8ru6H1fUka44dHufbxdNgWjwakWvlEUNmtA9WOj
 5mxK4z/aOr+wKnCrQr6mA4aRvKib4qQbL+Oe1mII8teogP3JjmV1OkPxetsuyNn+OnI+
 ZdPudFTfNAPWF4mQz4qD1lkb2iYNLPvq9DyG8dRFyLUtSuyOdnfDNORHcxsy01CUjHCW YA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5nkw8yy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:34 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272uGdG020211; 
 Tue, 7 Mar 2023 02:58:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3p4ffd3r7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:33 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wVeT022239;
 Tue, 7 Mar 2023 02:58:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3272wVne022232
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D19F96AD; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 08/14] Hexagon (tests/tcg/hexagon) Update preg_alias.c
Date: Mon,  6 Mar 2023 18:58:22 -0800
Message-Id: <20230307025828.1612809-9-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: XZHKMGgQGYO8xLhNT7Sg3_mE_y_73RIL
X-Proofpoint-ORIG-GUID: XZHKMGgQGYO8xLhNT7Sg3_mE_y_73RIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxlogscore=722 lowpriorityscore=0
 suspectscore=0 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070025
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

QWRkIGNvbnRyb2wgcmVnaXN0ZXJzIChjNCwgYzUpIHRvIGNsb2JiZXJzIGxpc3QKTWFkZSBwb3Nz
aWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNp
bXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4KLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMgfCAxMCAr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9oZXhhZ29uL3ByZWdfYWxpYXMuYyBiL3Rlc3RzL3Rj
Zy9oZXhhZ29uL3ByZWdfYWxpYXMuYwppbmRleCBiNDRhODExMmI0Li44Nzk4ZmJjYWYzIDEwMDY0
NAotLS0gYS90ZXN0cy90Y2cvaGV4YWdvbi9wcmVnX2FsaWFzLmMKKysrIGIvdGVzdHMvdGNnL2hl
eGFnb24vcHJlZ19hbGlhcy5jCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykg
MjAxOS0yMDIyIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVz
ZXJ2ZWQuCisgKiAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENl
bnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICog
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMg
cHVibGlzaGVkIGJ5CkBAIC02NSw3ICs2NSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjcmVnX2Fs
aWFzKGludCBjdmFsLCBQUmVncyAqcHJlZ3MpCiAgICAgICA6ICI9ciIocHJlZ3MtPnByZWdzLnAw
KSwgIj1yIihwcmVncy0+cHJlZ3MucDEpLAogICAgICAgICAiPXIiKHByZWdzLT5wcmVncy5wMiks
ICI9ciIocHJlZ3MtPnByZWdzLnAzKQogICAgICAgOiAiciIoY3ZhbCkKLSAgICAgIDogInAwIiwg
InAxIiwgInAyIiwgInAzIik7CisgICAgICA6ICJjNCIsICJwMCIsICJwMSIsICJwMiIsICJwMyIp
OwogfQogCiBpbnQgZXJyOwpAQCAtOTIsNyArOTIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY3Jl
Z19hbGlhc19wYWlyKHVuc2lnbmVkIGludCBjdmFsLCBQUmVncyAqcHJlZ3MpCiAgICAgICAgOiAi
PXIiKHByZWdzLT5wcmVncy5wMCksICI9ciIocHJlZ3MtPnByZWdzLnAxKSwKICAgICAgICAgICI9
ciIocHJlZ3MtPnByZWdzLnAyKSwgIj1yIihwcmVncy0+cHJlZ3MucDMpLCAiPXIiKGM1KQogICAg
ICAgIDogInIiKGN2YWxfcGFpcikKLSAgICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIpOwor
ICAgICAgIDogImM0IiwgImM1IiwgInAwIiwgInAxIiwgInAyIiwgInAzIik7CiAKICAgY2hlY2so
YzUsIDB4ZGVhZGJlZWYpOwogfQpAQCAtMTE3LDcgKzExNyw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rf
cGFja2V0KHZvaWQpCiAgICAgICAgICAifVxuXHQiCiAgICAgICAgICA6ICIrciIocmVzdWx0KQog
ICAgICAgICAgOiAiciIoMHhmZmZmZmZmZiksICJyIigweGZmMDBmZmZmKSwgInIiKDB4ODM3ZWQ2
NTMpCi0gICAgICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIpOworICAgICAgICAgOiAiYzQi
LCAicDAiLCAicDEiLCAicDIiLCAicDMiKTsKICAgICBjaGVjayhyZXN1bHQsIG9sZF92YWwpOwog
CiAgICAgLyogVGVzdCBhIHByZWRpY2F0ZWQgc3RvcmUgKi8KQEAgLTEyOSw3ICsxMjksNyBAQCBz
dGF0aWMgdm9pZCB0ZXN0X3BhY2tldCh2b2lkKQogICAgICAgICAgIn1cblx0IgogICAgICAgICAg
OgogICAgICAgICAgOiAiciIoMCksICJyIigweGZmZmZmZmZmKSwgInIiKCZyZXN1bHQpCi0gICAg
ICAgICA6ICJwMCIsICJwMSIsICJwMiIsICJwMyIsICJtZW1vcnkiKTsKKyAgICAgICAgIDogImM0
IiwgInAwIiwgInAxIiwgInAyIiwgInAzIiwgIm1lbW9yeSIpOwogICAgIGNoZWNrKHJlc3VsdCwg
MHgwKTsKIH0KIAotLSAKMi4yNS4xCgo=

