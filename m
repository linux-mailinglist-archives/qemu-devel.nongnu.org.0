Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B776F0EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:03:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAbT-0001pI-A9; Thu, 27 Apr 2023 19:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbM-0001nR-OV
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAbE-0001ME-MV
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:36 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMfiNT003016; Thu, 27 Apr 2023 23:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ehjRJ5ugKKkO1z9bbLzDdHbTLQehuow8zCRz065boDs=;
 b=NQaEhjZdJ4w2OowcsiEirCgmA89TvIGeQPu60DMB3hqIZWPErPVyWKrvuDOzJR4K2Izc
 cfMO3vsEQAF1Fi7Pjc3Ae+R6iBl4cE/VDiZcAd9xIfApCtbebA1PQYbSSvs7vx2il00U
 +2GdJe4xiFNdWla/drPBd18RXVtHvcmJwmX3238qyS1sGKJCz8uuRGuwWubIcJrvrTTX
 LvA6LEDPKlZLpKF/CJJwm9gBSf2py1v4sC5v3PZRqMWM/oK00pCXftKKzeqxS4IEvsy/
 kHolFt5fJCi5C3+fADc7iG/ikEzUzsooBHT5t8WYjqHSNI+dbxbQoq5ayihc8HkINq4z vA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7thv1579-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:17 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RMutn8021358; 
 Thu, 27 Apr 2023 23:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmt9er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0FuZ025303;
 Thu, 27 Apr 2023 23:00:15 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33RN0Ejo025278
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:15 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D40196C6; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 13/21] Hexagon (target/hexagon) Short-circuit packet HVX
 writes
Date: Thu, 27 Apr 2023 16:00:04 -0700
Message-Id: <20230427230012.3800327-14-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QY5GOwcw99F7-2hk2t-AQ3aH2M8kbkq3
X-Proofpoint-ORIG-GUID: QY5GOwcw99F7-2hk2t-AQ3aH2M8kbkq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=803
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
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

SW4gY2VydGFpbiBjYXNlcywgd2UgY2FuIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiB3cml0aW5nIHRv
IGZ1dHVyZV9WUmVncwphbmQgd3JpdGUgZGlyZWN0bHkgdG8gVlJlZ3MuICBXZSBjb25zaWRlciBI
VlggcmVhZHMvd3JpdGVzIHdoZW4gY29tcHV0aW5nCmN0eC0+bmVlZF9jb21taXQuICBUaGVuLCB3
ZSBjYW4gZWFybHktZXhpdCBmcm9tIGdlbl9jb21taXRfaHZ4LgoKU2lnbmVkLW9mZi1ieTogVGF5
bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+Ci0tLQogdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMgICAgfCAgNiArKysrLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgfCA0
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2Vk
LCA1MCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9o
ZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKaW5kZXggMzNmOWQ3OGFl
ZC4uZDEzNGQ4MDgyYSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKKysrIGIv
dGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTExMDQsNyArMTEwNCwxMSBAQCBzdGF0aWMgdm9p
ZCBnZW5fbG9nX3ZyZWdfd3JpdGVfcGFpcihEaXNhc0NvbnRleHQgKmN0eCwgaW50cHRyX3Qgc3Jj
b2ZmLCBpbnQgbnVtLAogCiBzdGF0aWMgaW50cHRyX3QgZ2V0X3Jlc3VsdF9xcmVnKERpc2FzQ29u
dGV4dCAqY3R4LCBpbnQgcW51bSkKIHsKLSAgICByZXR1cm4gIG9mZnNldG9mKENQVUhleGFnb25T
dGF0ZSwgZnV0dXJlX1FSZWdzW3FudW1dKTsKKyAgICBpZiAoY3R4LT5uZWVkX2NvbW1pdCkgewor
ICAgICAgICByZXR1cm4gIG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwgZnV0dXJlX1FSZWdzW3Fu
dW1dKTsKKyAgICB9IGVsc2UgeworICAgICAgICByZXR1cm4gIG9mZnNldG9mKENQVUhleGFnb25T
dGF0ZSwgUVJlZ3NbcW51bV0pOworICAgIH0KIH0KIAogc3RhdGljIHZvaWQgZ2VuX3ZyZWdfbG9h
ZChEaXNhc0NvbnRleHQgKmN0eCwgaW50cHRyX3QgZHN0b2ZmLCBUQ0d2IHNyYywKZGlmZiAtLWdp
dCBhL3RhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRl
LmMKaW5kZXggNDUzMmI4ZDA1ZS4uYjcxNGE4ZGE5NiAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vdHJhbnNsYXRlLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMKQEAgLTcwLDYg
KzcwLDEwIEBAIGludHB0cl90IGN0eF9mdXR1cmVfdnJlZ19vZmYoRGlzYXNDb250ZXh0ICpjdHgs
IGludCByZWdudW0sCiB7CiAgICAgaW50cHRyX3Qgb2Zmc2V0OwogCisgICAgaWYgKCFjdHgtPm5l
ZWRfY29tbWl0KSB7CisgICAgICAgIHJldHVybiBvZmZzZXRvZihDUFVIZXhhZ29uU3RhdGUsIFZS
ZWdzW3JlZ251bV0pOworICAgIH0KKwogICAgIC8qIFNlZSBpZiBpdCBpcyBhbHJlYWR5IGFsbG9j
YXRlZCAqLwogICAgIGZvciAoaW50IGkgPSAwOyBpIDwgY3R4LT5mdXR1cmVfdnJlZ3NfaWR4OyBp
KyspIHsKICAgICAgICAgaWYgKGN0eC0+ZnV0dXJlX3ZyZWdzX251bVtpXSA9PSByZWdudW0pIHsK
QEAgLTM3NCw3ICszNzgsNyBAQCBzdGF0aWMgYm9vbCBuZWVkX2NvbW1pdChEaXNhc0NvbnRleHQg
KmN0eCkKICAgICAgICAgcmV0dXJuIHRydWU7CiAgICAgfQogCi0gICAgaWYgKHBrdC0+bnVtX2lu
c25zID09IDEpIHsKKyAgICBpZiAocGt0LT5udW1faW5zbnMgPT0gMSAmJiAhcGt0LT5wa3RfaGFz
X2h2eCkgewogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQogCkBAIC0zOTQsNiArMzk4LDQw
IEBAIHN0YXRpYyBib29sIG5lZWRfY29tbWl0KERpc2FzQ29udGV4dCAqY3R4KQogICAgICAgICB9
CiAgICAgfQogCisgICAgLyogQ2hlY2sgZm9yIG92ZXJsYXAgYmV0d2VlbiBIVlggcmVhZHMgYW5k
IHdyaXRlcyAqLworICAgIGZvciAoaW50IGkgPSAwOyBpIDwgY3R4LT52cmVnX2xvZ19pZHg7IGkr
KykgeworICAgICAgICBpbnQgdm51bSA9IGN0eC0+dnJlZ19sb2dbaV07CisgICAgICAgIGlmICh0
ZXN0X2JpdCh2bnVtLCBjdHgtPnZyZWdzX3JlYWQpKSB7CisgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKKyAgICAgICAgfQorICAgIH0KKyAgICBpZiAoIWJpdG1hcF9lbXB0eShjdHgtPnZyZWdzX3Vw
ZGF0ZWRfdG1wLCBOVU1fVlJFR1MpKSB7CisgICAgICAgIGludCBpID0gZmluZF9maXJzdF9iaXQo
Y3R4LT52cmVnc191cGRhdGVkX3RtcCwgTlVNX1ZSRUdTKTsKKyAgICAgICAgd2hpbGUgKGkgPCBO
VU1fVlJFR1MpIHsKKyAgICAgICAgICAgIGlmICh0ZXN0X2JpdChpLCBjdHgtPnZyZWdzX3JlYWQp
KSB7CisgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7CisgICAgICAgICAgICB9CisgICAgICAg
ICAgICBpID0gZmluZF9uZXh0X2JpdChjdHgtPnZyZWdzX3VwZGF0ZWRfdG1wLCBOVU1fVlJFR1Ms
IGkgKyAxKTsKKyAgICAgICAgfQorICAgIH0KKyAgICBpZiAoIWJpdG1hcF9lbXB0eShjdHgtPnZy
ZWdzX3NlbGVjdCwgTlVNX1ZSRUdTKSkgeworICAgICAgICBpbnQgaSA9IGZpbmRfZmlyc3RfYml0
KGN0eC0+dnJlZ3Nfc2VsZWN0LCBOVU1fVlJFR1MpOworICAgICAgICB3aGlsZSAoaSA8IE5VTV9W
UkVHUykgeworICAgICAgICAgICAgaWYgKHRlc3RfYml0KGksIGN0eC0+dnJlZ3NfcmVhZCkpIHsK
KyAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKKyAgICAgICAgICAgIH0KKyAgICAgICAgICAg
IGkgPSBmaW5kX25leHRfYml0KGN0eC0+dnJlZ3Nfc2VsZWN0LCBOVU1fVlJFR1MsIGkgKyAxKTsK
KyAgICAgICAgfQorICAgIH0KKworICAgIC8qIENoZWNrIGZvciBvdmVybGFwIGJldHdlZW4gSFZY
IHByZWRpY2F0ZSByZWFkcyBhbmQgd3JpdGVzICovCisgICAgZm9yIChpbnQgaSA9IDA7IGkgPCBj
dHgtPnFyZWdfbG9nX2lkeDsgaSsrKSB7CisgICAgICAgIGludCBxbnVtID0gY3R4LT5xcmVnX2xv
Z1tpXTsKKyAgICAgICAgaWYgKHRlc3RfYml0KHFudW0sIGN0eC0+cXJlZ3NfcmVhZCkpIHsKKyAg
ICAgICAgICAgIHJldHVybiB0cnVlOworICAgICAgICB9CisgICAgfQorCiAgICAgcmV0dXJuIGZh
bHNlOwogfQogCkBAIC03ODcsNiArODI1LDEyIEBAIHN0YXRpYyB2b2lkIGdlbl9jb21taXRfaHZ4
KERpc2FzQ29udGV4dCAqY3R4KQogewogICAgIGludCBpOwogCisgICAgLyogRWFybHkgZXhpdCBp
ZiBub3QgbmVlZGVkICovCisgICAgaWYgKCFjdHgtPm5lZWRfY29tbWl0KSB7CisgICAgICAgIGdf
YXNzZXJ0KCFwa3RfaGFzX2h2eF9zdG9yZShjdHgtPnBrdCkpOworICAgICAgICByZXR1cm47Cisg
ICAgfQorCiAgICAgLyoKICAgICAgKiAgICBmb3IgKGkgPSAwOyBpIDwgY3R4LT52cmVnX2xvZ19p
ZHg7IGkrKykgewogICAgICAqICAgICAgICBpbnQgcm51bSA9IGN0eC0+dnJlZ19sb2dbaV07Ci0t
IAoyLjI1LjEKCg==

