Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2E6839D6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 23:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMzYq-0000hZ-NH; Tue, 31 Jan 2023 17:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYj-0000ew-Ti
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:01 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pMzYg-0003tW-7M
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 17:57:01 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30VMoS0h024227; Tue, 31 Jan 2023 22:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/0hXh5/kLr2BWylSRFYEQ9ZJ/o1MI7D7LRBYNjLTMyc=;
 b=lbGrFzOBfKe4MOsSomfS08K7PI95ikjSDTGoMqyqBbgDG9/BVkxGPGuYnAoYH5Vb2fSI
 gwt5h2Usc9ijNeU/ee3JgrnJxOCBXwjDE1IOaz+T0U6KvebC29ItjdbeqdX9nLlx8t/3
 gnJDhA7RG/yvqVK45EY8RUZ7fUdHBRbxN3xbS6kvSTpCCyvOMJGQt9wkj2SdP/O9L/t+
 Ko25BdBPSQo+ghZuvzEriInKvTrh5cAKGMZz2SU0D/rsSGPGWHPiCawg3Ei0Esyukz81
 7L5DaQ03VaD1wlx12Hhelb3g8/0Xv7mqP2+8er03AUnwyoheJx6H+V+cAFymU2A5fawX yQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3neuwcaehs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 22:56:55 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30VMusdl016262; 
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3ncvskts09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Jan 2023 22:56:54 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VMusZH016242;
 Tue, 31 Jan 2023 22:56:54 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 30VMurP8016234;
 Tue, 31 Jan 2023 22:56:54 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 0FA47500117; Tue, 31 Jan 2023 14:56:53 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Date: Tue, 31 Jan 2023 14:56:43 -0800
Message-Id: <20230131225647.25274-11-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225647.25274-1-tsimpson@quicinc.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X49jnLnX_nWH_ANPrdAjClms5ohZJfVv
X-Proofpoint-ORIG-GUID: X49jnLnX_nWH_ANPrdAjClms5ohZJfVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=802 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310197
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

TWFkZSBwb3NzaWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTog
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRlc3RzL3RjZy9oZXhh
Z29uL01ha2VmaWxlLnRhcmdldCB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hl
eGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0
CmluZGV4IDE4ZTZhNTk2OWUuLmY3NTNiMzlkOTEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhh
Z29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJn
ZXQKQEAgLTEsNSArMSw1IEBACiAjIwotIyMgIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMjICBDb3B5
cmlnaHQoYykgMjAxOS0yMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCiAjIwogIyMgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAjIyAgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAg
LTQ1LDYgKzQ1LDEwIEBAIEhFWF9URVNUUyArPSBmcHN0dWZmCiBIRVhfVEVTVFMgKz0gb3ZlcmZs
b3cKIEhFWF9URVNUUyArPSBzaWduYWxfY29udGV4dAogSEVYX1RFU1RTICs9IHJlZ19tdXQKK0hF
WF9URVNUUyArPSB2ZWN0b3JfYWRkX2ludAorSEVYX1RFU1RTICs9IHNjYXR0ZXJfZ2F0aGVyCitI
RVhfVEVTVFMgKz0gaHZ4X21pc2MKK0hFWF9URVNUUyArPSBodnhfaGlzdG9ncmFtCiAKIEhFWF9U
RVNUUyArPSB0ZXN0X2FicwogSEVYX1RFU1RTICs9IHRlc3RfYml0Y250CkBAIC03OCwzICs4Miwx
MCBAQCBURVNUUyArPSAkKEhFWF9URVNUUykKIHVzcjogdXNyLmMKIAkkKENDKSAkKENGTEFHUykg
LW12Njd0IC1PMiAtV25vLWlubGluZS1hc20gLVduby1leHBhbnNpb24tdG8tZGVmaW5lZCAkPCAt
byAkQCAkKExERkxBR1MpCiAKK3NjYXR0ZXJfZ2F0aGVyOiBDRkxBR1MgKz0gLW1odngKK3ZlY3Rv
cl9hZGRfaW50OiBDRkxBR1MgKz0gLW1odnggLWZ2ZWN0b3JpemUKK2h2eF9taXNjOiBDRkxBR1Mg
Kz0gLW1odngKK2h2eF9oaXN0b2dyYW06IENGTEFHUyArPSAtbWh2eCAtV25vLWdudS1mb2xkaW5n
LWNvbnN0YW50CisKK2h2eF9oaXN0b2dyYW06IGh2eF9oaXN0b2dyYW0uYyBodnhfaGlzdG9ncmFt
X3Jvdy5TCisJJChDQykgJChDRkxBR1MpICQoQ1JPU1NfQ0NfR1VFU1RfQ0ZMQUdTKSAkXiAtbyAk
QAotLSAKMi4xNy4xCgo=

