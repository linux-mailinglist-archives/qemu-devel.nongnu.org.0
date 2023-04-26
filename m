Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CD6EEC62
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 04:32:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prUw6-0002iw-Mp; Tue, 25 Apr 2023 22:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvX-0002eG-FX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prUvT-000297-W4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 22:30:39 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0rQvt008515; Wed, 26 Apr 2023 02:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ftTVLszdqEFi80gZkJB0HN967v3HAQntkNvMjNfmrz8=;
 b=D/jFCFJVGBos4/ln/LiuGYk+mYYq1OwnR0MSsETEj99ZKXQ+IzYcQs9iuNejfidU5LzL
 ONgnwIx+Q+mpD0WzwI9SAWiW1HXd1SM93y9aeuyoGvTTRyPsUaG/Ss4NoNf3UlPi7ivN
 w5ElDPtmtE6iBWRbfFoEst44HYvBoEhZu/rInEg664cB+FKcQr/ZvrsJSsOUYyIqgTao
 pOmwUCeXOwq4geYs8jPL9bSjxwZaaf4fMyHE5RVWFNcLaLnTu/Ye+bpamu7Nav5jo1ZP
 2tVJYbHwza0QTd4+K1/7IL0vvqCLrsCtJLABLyyMn3dWdaExAY0kottdzkE8+0x0auuk Qw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6bgpaejx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:22 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q2ULRx015844; 
 Wed, 26 Apr 2023 02:30:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmddq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q2ULmL015823;
 Wed, 26 Apr 2023 02:30:21 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q2UKW1015815
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 02:30:21 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id AFB626A9; Tue, 25 Apr 2023 19:30:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 9/9] Hexagon (tests/tcg/hexagon) Add v73 scalar tests
Date: Tue, 25 Apr 2023 19:30:18 -0700
Message-Id: <20230426023018.1742266-10-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: ME4ku2W1fekGlVZPf1rHWvYopxswQWus
X-Proofpoint-ORIG-GUID: ME4ku2W1fekGlVZPf1rHWvYopxswQWus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260020
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

VGVzdHMgYWRkZWQgZm9yIHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zCiAgICBKMl9jYWxscmgK
ICAgIEoyX2p1bXByaAoKU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1
aWNpbmMuY29tPgotLS0KIHRlc3RzL3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYyAgICB8IDk2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxl
LnRhcmdldCB8ICAyICsKIDIgZmlsZXMgY2hhbmdlZCwgOTggaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYwoKZGlmZiAtLWdpdCBh
L3Rlc3RzL3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3Y3M19z
Y2FsYXIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5mZWU2N2ZjNTMx
Ci0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvdGNnL2hleGFnb24vdjczX3NjYWxhci5jCkBAIC0w
LDAgKzEsOTYgQEAKKy8qCisgKiAgQ29weXJpZ2h0KGMpIDIwMjMgUXVhbGNvbW0gSW5ub3ZhdGlv
biBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyAqCisgKiAgVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
KyAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQorICogIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhl
ciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAgKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KKyAqCisgKiAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJB
TlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqICBNRVJDSEFOVEFC
SUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiAg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiAgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UKKyAqICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHA6Ly93
d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICovCisKKyNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1
ZGUgPHN0ZGJvb2wuaD4KKyNpbmNsdWRlIDxzdGRpbnQuaD4KKworLyoKKyAqICBUZXN0IHRoZSBz
Y2FsYXIgY29yZSBpbnN0cnVjdGlvbnMgdGhhdCBhcmUgbmV3IGluIHY3MworICovCisKK2ludCBl
cnI7CisKK3N0YXRpYyB2b2lkIF9fY2hlY2szMihpbnQgbGluZSwgdWludDMyX3QgcmVzdWx0LCB1
aW50MzJfdCBleHBlY3QpCit7CisgICAgaWYgKHJlc3VsdCAhPSBleHBlY3QpIHsKKyAgICAgICAg
cHJpbnRmKCJFUlJPUiBhdCBsaW5lICVkOiAweCUwOHggIT0gMHglMDh4XG4iLAorICAgICAgICAg
ICAgICAgbGluZSwgcmVzdWx0LCBleHBlY3QpOworICAgICAgICBlcnIrKzsKKyAgICB9Cit9CisK
KyNkZWZpbmUgY2hlY2szMihSRVMsIEVYUCkgX19jaGVjazMyKF9fTElORV9fLCBSRVMsIEVYUCkK
Kworc3RhdGljIHZvaWQgX19jaGVjazY0KGludCBsaW5lLCB1aW50NjRfdCByZXN1bHQsIHVpbnQ2
NF90IGV4cGVjdCkKK3sKKyAgICBpZiAocmVzdWx0ICE9IGV4cGVjdCkgeworICAgICAgICBwcmlu
dGYoIkVSUk9SIGF0IGxpbmUgJWQ6IDB4JTAxNmxseCAhPSAweCUwMTZsbHhcbiIsCisgICAgICAg
ICAgICAgICBsaW5lLCByZXN1bHQsIGV4cGVjdCk7CisgICAgICAgIGVycisrOworICAgIH0KK30K
KworI2RlZmluZSBjaGVjazY0KFJFUywgRVhQKSBfX2NoZWNrNjQoX19MSU5FX18sIFJFUywgRVhQ
KQorCitzdGF0aWMgYm9vbCBteV9mdW5jX2NhbGxlZDsKKworc3RhdGljIHZvaWQgbXlfZnVuYyh2
b2lkKQoreworICAgIG15X2Z1bmNfY2FsbGVkID0gdHJ1ZTsKK30KKworc3RhdGljIGlubGluZSB2
b2lkIGNhbGxyaCh2b2lkICpmdW5jKQoreworICAgIGFzbSB2b2xhdGlsZSgiY2FsbHJoICUwXG5c
dCIKKyAgICAgICAgICAgICAgICAgOiA6ICJyIihmdW5jKQorICAgICAgICAgICAgICAgICAvKiBN
YXJrIHRoZSBjYWxsZXItc2F2ZSByZWdpc3RlcnMgYXMgY2xvYmJlcmVkICovCisgICAgICAgICAg
ICAgICAgIDogInIwIiwgInIxIiwgInIyIiwgInIzIiwgInI0IiwgInI1IiwgInI2IiwgInI3Iiwg
InI4IiwgInI5IiwKKyAgICAgICAgICAgICAgICAgICAicjEwIiwgInIxMSIsICJyMTIiLCAicjEz
IiwgInIxNCIsICJyMTUiLCAicjI4IiwKKyAgICAgICAgICAgICAgICAgICAicDAiLCAicDEiLCAi
cDIiLCAicDMiKTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9jYWxscmgodm9pZCkKK3sKKyAgICBt
eV9mdW5jX2NhbGxlZCA9IGZhbHNlOworICAgIGNhbGxyaCgmbXlfZnVuYyk7CisgICAgY2hlY2sz
MihteV9mdW5jX2NhbGxlZCwgdHJ1ZSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfanVtcHJoKHZv
aWQpCit7CisgICAgdWludDMyX3QgcmVzOworICAgIGFzbSAoIiUwID0gIzVcblx0IgorICAgICAg
ICAgInIwID0gIyMxZlxuXHQiCisgICAgICAgICAianVtcHJoIHIwXG5cdCIKKyAgICAgICAgICIl
MCA9ICMzXG5cdCIKKyAgICAgICAgICJqdW1wIDJmXG5cdCIKKyAgICAgICAgICIxOlxuXHQiCisg
ICAgICAgICAiJTAgPSAjMVxuXHQiCisgICAgICAgICAiMjpcblx0IgorICAgICAgICAgOiAiPXIi
KHJlcykgOiA6ICJyMCIpOworICAgIGNoZWNrMzIocmVzLCAxKTsKK30KKworaW50IG1haW4oKQor
eworICAgIHRlc3RfY2FsbHJoKCk7CisgICAgdGVzdF9qdW1wcmgoKTsKKworICAgIHB1dHMoZXJy
ID8gIkZBSUwiIDogIlBBU1MiKTsKKyAgICByZXR1cm4gZXJyID8gMSA6IDA7Cit9CmRpZmYgLS1n
aXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvaGV4YWdv
bi9NYWtlZmlsZS50YXJnZXQKaW5kZXggOGNkOTVjYjRhNy4uMjhlZjUwOTY4OSAxMDA2NDQKLS0t
IGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0CisrKyBiL3Rlc3RzL3RjZy9oZXhh
Z29uL01ha2VmaWxlLnRhcmdldApAQCAtNzksNiArNzksNyBAQCBIRVhfVEVTVFMgKz0gdGVzdF92
c3BsaWNlYgogSEVYX1RFU1RTICs9IHY2OF9zY2FsYXIKIEhFWF9URVNUUyArPSB2NjhfaHZ4CiBI
RVhfVEVTVFMgKz0gdjY5X2h2eAorSEVYX1RFU1RTICs9IHY3M19zY2FsYXIKIAogVEVTVFMgKz0g
JChIRVhfVEVTVFMpCiAKQEAgLTk4LDYgKzk5LDcgQEAgdjY4X2h2eDogdjY4X2h2eC5jIGh2eF9t
aXNjLmggdjZtcHlfcmVmLmgKIHY2OF9odng6IENGTEFHUyArPSAtbWh2eCAtV25vLXVudXNlZC1m
dW5jdGlvbgogdjY5X2h2eDogdjY5X2h2eC5jIGh2eF9taXNjLmgKIHY2OV9odng6IENGTEFHUyAr
PSAtbWh2eCAtV25vLXVudXNlZC1mdW5jdGlvbgordjczX3NjYWxhcjogQ0ZMQUdTICs9IC1Xbm8t
dW51c2VkLWZ1bmN0aW9uCiAKIGh2eF9oaXN0b2dyYW06IGh2eF9oaXN0b2dyYW0uYyBodnhfaGlz
dG9ncmFtX3Jvdy5TCiAJJChDQykgJChDRkxBR1MpICQoQ1JPU1NfQ0NfR1VFU1RfQ0ZMQUdTKSAk
XiAtbyAkQCAkKExERkxBR1MpCi0tIAoyLjI1LjEKCg==

