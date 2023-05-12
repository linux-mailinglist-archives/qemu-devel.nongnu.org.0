Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B897011B1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:57:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxacR-0002nm-DC; Fri, 12 May 2023 17:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxacB-0002kF-PD
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxaby-00065b-C5
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:50 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CKQ3ou016270; Fri, 12 May 2023 21:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=XO+PTLUuIKsfm+hUT+BJ5RaYUUS9yjRB7c7q5ZdIgec=;
 b=eDYYCOUPinaQk6R1e9ovp2l9kZzcXjw4/TMJxboRNEg+FR9CEtN+NeEWkRxFn7BMmjWA
 LVYg9KlqjMc6RWgS0Kzj8MlzmOvxdIedPPiA2wHJ87rnh5dML+7c4g0jmSzeRqOJF99/
 Q3Y4cMZQk5GaCTFKubF8gSL+d8q7/CDbLpVY9ystLzx4VQ2YWUav/YumyP+GkycMffJU
 YC9sQBPO5WxqRSqkJcKBLBSCu5yeDfUW+RB9CoQTxCVUD4bEh5RLAfdm50xuJ84oyCtk
 8TC62gErIzHeEdY+pdZcBbXjYQeaSQkkA0we0dpHBNFG4ZL6k/NVklSiVRHt0bsuYd5j Rw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhes2261d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlOav011708; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3qhurt0jnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlODc011686;
 Fri, 12 May 2023 21:47:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 34CLlNvs011660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 3BB846DC; Fri, 12 May 2023 14:47:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 35/44] Hexagon: append eflags to unknown cpu model string
Date: Fri, 12 May 2023 14:46:57 -0700
Message-Id: <20230512214706.946068-36-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7mompawfwk02143deiBFxTl5BXdyopcF
X-Proofpoint-GUID: 7mompawfwk02143deiBFxTl5BXdyopcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=471 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120183
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpSdW5uaW5nIHFlbXUtaGV4YWdvbiB3aXRoIGEgYmluYXJ5IHRoYXQgd2FzIGNvbXBpbGVk
IGZvciBhbiBhcmNoIHZlcnNpb24KdW5rbm93biBieSBxZW11IGNhbiBwcm9kdWNlIGEgc29tZXdo
YXQgY29uZnVzaW5nIG1lc3NhZ2U6CgogIHFlbXUtaGV4YWdvbjogdW5hYmxlIHRvIGZpbmQgQ1BV
IG1vZGVsICd1bmtub3duJwoKTGV0J3MgZ2l2ZSBhIGJpdCBtb3JlIGluZm8gYnkgYXBwZW5kaW5n
IHRoZSBlZmxhZ3Mgc28gdGhhdCB0aGUgbWVzc2FnZQpiZWNvbWVzOgoKICBxZW11LWhleGFnb246
IHVuYWJsZSB0byBmaW5kIENQVSBtb2RlbCAndW5rbm93biAoMHg2OSknCgpTaWduZWQtb2ZmLWJ5
OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4K
U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpUZXN0
ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6
IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KTWVzc2FnZS1JZDogPDhhOGQw
MTNjYzYxOWI5NGZkNGZiNTc3YWU2YThkZjI2Y2VkYjk3MmIuMTY4MzIyNTgwNC5naXQucXVpY19t
YXRoYmVybkBxdWljaW5jLmNvbT4KLS0tCiBsaW51eC11c2VyL2hleGFnb24vdGFyZ2V0X2VsZi5o
IHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9oZXhhZ29uL3RhcmdldF9lbGYuaCBiL2xpbnV4
LXVzZXIvaGV4YWdvbi90YXJnZXRfZWxmLmgKaW5kZXggYTAyNzFhMGEyYS4uMzYwNTZmYzlmMCAx
MDA2NDQKLS0tIGEvbGludXgtdXNlci9oZXhhZ29uL3RhcmdldF9lbGYuaAorKysgYi9saW51eC11
c2VyL2hleGFnb24vdGFyZ2V0X2VsZi5oCkBAIC0yMCw2ICsyMCw5IEBACiAKIHN0YXRpYyBpbmxp
bmUgY29uc3QgY2hhciAqY3B1X2dldF9tb2RlbCh1aW50MzJfdCBlZmxhZ3MpCiB7CisgICAgc3Rh
dGljIGNoYXIgYnVmWzMyXTsKKyAgICBpbnQgZXJyOworCiAgICAgLyogRm9yIG5vdywgdHJlYXQg
YW55dGhpbmcgbmV3ZXIgdGhhbiB2NSBhcyBhIHY3MyAqLwogICAgIC8qIEZJWE1FIC0gRGlzYWJs
ZSBpbnN0cnVjdGlvbnMgdGhhdCBhcmUgbmV3ZXIgdGhhbiB0aGUgc3BlY2lmaWVkIGFyY2ggKi8K
ICAgICBpZiAoZWZsYWdzID09IDB4MDQgfHwgICAgLyogdjUgICovCkBAIC0zOSw3ICs0Miw5IEBA
IHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqY3B1X2dldF9tb2RlbCh1aW50MzJfdCBlZmxhZ3Mp
CiAgICAgICAgKSB7CiAgICAgICAgIHJldHVybiAidjczIjsKICAgICB9Ci0gICAgcmV0dXJuICJ1
bmtub3duIjsKKworICAgIGVyciA9IHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJ1bmtub3du
ICgweCV4KSIsIGVmbGFncyk7CisgICAgcmV0dXJuIGVyciA+PSAwICYmIGVyciA8IHNpemVvZihi
dWYpID8gYnVmIDogInVua25vd24iOwogfQogCiAjZW5kaWYKLS0gCjIuMjUuMQoK

