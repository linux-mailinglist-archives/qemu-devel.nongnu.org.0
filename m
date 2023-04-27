Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25E6F0E67
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 00:42:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAIh-0001w0-0w; Thu, 27 Apr 2023 18:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAId-0001vV-IB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAIV-0005M0-8v
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 18:41:15 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RKwPl6000769; Thu, 27 Apr 2023 22:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LsJG/dcVcX69QnUbDp1qPO/i+Uq2wmIm+gXtXO0usPQ=;
 b=Kx5YLBGxTvvh0NLkTtHbjvjrKQzuSPJ14gyQgbhCG/co4P9DWP2PIKpHav7Sx+ZMO2dg
 LQcci1HXN7mUs1/vlAZastd0ypVh2d0xiNqDbhE1yjAwZNk3Xr+UbPv0TGgCUB87fybI
 6tmjfk99JopSE79E8SlKJl6Phi31eA8n8t/OFWottbc3z/dT7BuZ2aOhorZpCyFOhYFz
 GhURyay9lWr8eyH9mC3VCk4GNIexXsL1p/aefloEXENEJzTQHi4V7PwdnmVoKhTPSiqF
 DFYIE6V0aY6G2tiWKsmiVDjaSgRmUmWvYGgYLHR5az1mw5HEJZCeYqz4+pB0UEIEyP1j 2w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7wq88fvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:02 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMf1Wt027454; 
 Thu, 27 Apr 2023 22:41:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q7wcbs943-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RMf18N027441;
 Thu, 27 Apr 2023 22:41:01 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33RMf0CW027423
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 22:41:01 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id E129F6A9; Thu, 27 Apr 2023 15:40:59 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 9/9] Hexagon (tests/tcg/hexagon) Add v73 scalar tests
Date: Thu, 27 Apr 2023 15:40:57 -0700
Message-Id: <20230427224057.3766963-10-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: cP7bQMG8caABGkCcdibQjAEA42f9fAJ-
X-Proofpoint-ORIG-GUID: cP7bQMG8caABGkCcdibQjAEA42f9fAJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0t
CiB0ZXN0cy90Y2cvaGV4YWdvbi92NzNfc2NhbGFyLmMgICAgfCA5NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQgfCAgMiAr
CiAyIGZpbGVzIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
ZXN0cy90Y2cvaGV4YWdvbi92NzNfc2NhbGFyLmMKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4
YWdvbi92NzNfc2NhbGFyLmMgYi90ZXN0cy90Y2cvaGV4YWdvbi92NzNfc2NhbGFyLmMKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZmVlNjdmYzUzMQotLS0gL2Rldi9udWxs
CisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL3Y3M19zY2FsYXIuYwpAQCAtMCwwICsxLDk2IEBACisv
KgorICogIENvcHlyaWdodChjKSAyMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMu
IEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiAgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQg
YnkKKyAqICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9m
IHRoZSBMaWNlbnNlLCBvcgorICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
CisgKgorICogIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0
IHdpbGwgYmUgdXNlZnVsLAorICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5F
U1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorICogIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiAgYWxv
bmcgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGlj
ZW5zZXMvPi4KKyAqLworCisjaW5jbHVkZSA8c3RkaW8uaD4KKyNpbmNsdWRlIDxzdGRib29sLmg+
CisjaW5jbHVkZSA8c3RkaW50Lmg+CisKKy8qCisgKiAgVGVzdCB0aGUgc2NhbGFyIGNvcmUgaW5z
dHJ1Y3Rpb25zIHRoYXQgYXJlIG5ldyBpbiB2NzMKKyAqLworCitpbnQgZXJyOworCitzdGF0aWMg
dm9pZCBfX2NoZWNrMzIoaW50IGxpbmUsIHVpbnQzMl90IHJlc3VsdCwgdWludDMyX3QgZXhwZWN0
KQoreworICAgIGlmIChyZXN1bHQgIT0gZXhwZWN0KSB7CisgICAgICAgIHByaW50ZigiRVJST1Ig
YXQgbGluZSAlZDogMHglMDh4ICE9IDB4JTA4eFxuIiwKKyAgICAgICAgICAgICAgIGxpbmUsIHJl
c3VsdCwgZXhwZWN0KTsKKyAgICAgICAgZXJyKys7CisgICAgfQorfQorCisjZGVmaW5lIGNoZWNr
MzIoUkVTLCBFWFApIF9fY2hlY2szMihfX0xJTkVfXywgUkVTLCBFWFApCisKK3N0YXRpYyB2b2lk
IF9fY2hlY2s2NChpbnQgbGluZSwgdWludDY0X3QgcmVzdWx0LCB1aW50NjRfdCBleHBlY3QpCit7
CisgICAgaWYgKHJlc3VsdCAhPSBleHBlY3QpIHsKKyAgICAgICAgcHJpbnRmKCJFUlJPUiBhdCBs
aW5lICVkOiAweCUwMTZsbHggIT0gMHglMDE2bGx4XG4iLAorICAgICAgICAgICAgICAgbGluZSwg
cmVzdWx0LCBleHBlY3QpOworICAgICAgICBlcnIrKzsKKyAgICB9Cit9CisKKyNkZWZpbmUgY2hl
Y2s2NChSRVMsIEVYUCkgX19jaGVjazY0KF9fTElORV9fLCBSRVMsIEVYUCkKKworc3RhdGljIGJv
b2wgbXlfZnVuY19jYWxsZWQ7CisKK3N0YXRpYyB2b2lkIG15X2Z1bmModm9pZCkKK3sKKyAgICBt
eV9mdW5jX2NhbGxlZCA9IHRydWU7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBjYWxscmgodm9p
ZCAqZnVuYykKK3sKKyAgICBhc20gdm9sYXRpbGUoImNhbGxyaCAlMFxuXHQiCisgICAgICAgICAg
ICAgICAgIDogOiAiciIoZnVuYykKKyAgICAgICAgICAgICAgICAgLyogTWFyayB0aGUgY2FsbGVy
LXNhdmUgcmVnaXN0ZXJzIGFzIGNsb2JiZXJlZCAqLworICAgICAgICAgICAgICAgICA6ICJyMCIs
ICJyMSIsICJyMiIsICJyMyIsICJyNCIsICJyNSIsICJyNiIsICJyNyIsICJyOCIsICJyOSIsCisg
ICAgICAgICAgICAgICAgICAgInIxMCIsICJyMTEiLCAicjEyIiwgInIxMyIsICJyMTQiLCAicjE1
IiwgInIyOCIsCisgICAgICAgICAgICAgICAgICAgInAwIiwgInAxIiwgInAyIiwgInAzIik7Cit9
CisKK3N0YXRpYyB2b2lkIHRlc3RfY2FsbHJoKHZvaWQpCit7CisgICAgbXlfZnVuY19jYWxsZWQg
PSBmYWxzZTsKKyAgICBjYWxscmgoJm15X2Z1bmMpOworICAgIGNoZWNrMzIobXlfZnVuY19jYWxs
ZWQsIHRydWUpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X2p1bXByaCh2b2lkKQoreworICAgIHVp
bnQzMl90IHJlczsKKyAgICBhc20gKCIlMCA9ICM1XG5cdCIKKyAgICAgICAgICJyMCA9ICMjMWZc
blx0IgorICAgICAgICAgImp1bXByaCByMFxuXHQiCisgICAgICAgICAiJTAgPSAjM1xuXHQiCisg
ICAgICAgICAianVtcCAyZlxuXHQiCisgICAgICAgICAiMTpcblx0IgorICAgICAgICAgIiUwID0g
IzFcblx0IgorICAgICAgICAgIjI6XG5cdCIKKyAgICAgICAgIDogIj1yIihyZXMpIDogOiAicjAi
KTsKKyAgICBjaGVjazMyKHJlcywgMSk7Cit9CisKK2ludCBtYWluKCkKK3sKKyAgICB0ZXN0X2Nh
bGxyaCgpOworICAgIHRlc3RfanVtcHJoKCk7CisKKyAgICBwdXRzKGVyciA/ICJGQUlMIiA6ICJQ
QVNTIik7CisgICAgcmV0dXJuIGVyciA/IDEgOiAwOworfQpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNn
L2hleGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFy
Z2V0CmluZGV4IDU1OGMwNTYxNDguLjMxNzJmMmU0ZGIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9o
ZXhhZ29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50
YXJnZXQKQEAgLTc5LDYgKzc5LDcgQEAgSEVYX1RFU1RTICs9IHRlc3RfdnNwbGljZWIKIEhFWF9U
RVNUUyArPSB2Njhfc2NhbGFyCiBIRVhfVEVTVFMgKz0gdjY4X2h2eAogSEVYX1RFU1RTICs9IHY2
OV9odngKK0hFWF9URVNUUyArPSB2NzNfc2NhbGFyCiAKIFRFU1RTICs9ICQoSEVYX1RFU1RTKQog
CkBAIC05OCw2ICs5OSw3IEBAIHY2OF9odng6IHY2OF9odnguYyBodnhfbWlzYy5oIHY2bXB5X3Jl
Zi5jLmluYwogdjY4X2h2eDogQ0ZMQUdTICs9IC1taHZ4IC1Xbm8tdW51c2VkLWZ1bmN0aW9uCiB2
NjlfaHZ4OiB2NjlfaHZ4LmMgaHZ4X21pc2MuaAogdjY5X2h2eDogQ0ZMQUdTICs9IC1taHZ4IC1X
bm8tdW51c2VkLWZ1bmN0aW9uCit2NzNfc2NhbGFyOiBDRkxBR1MgKz0gLVduby11bnVzZWQtZnVu
Y3Rpb24KIAogaHZ4X2hpc3RvZ3JhbTogaHZ4X2hpc3RvZ3JhbS5jIGh2eF9oaXN0b2dyYW1fcm93
LlMKIAkkKENDKSAkKENGTEFHUykgJChDUk9TU19DQ19HVUVTVF9DRkxBR1MpICReIC1vICRAICQo
TERGTEFHUykKLS0gCjIuMjUuMQoK

