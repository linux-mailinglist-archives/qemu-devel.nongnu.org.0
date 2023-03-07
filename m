Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E636AD6D0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyZ-0006io-2i; Tue, 07 Mar 2023 00:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyL-0006X8-T4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyJ-0006Ym-3l
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:49 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3274M1JL021740; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=R3ix0+3f8UCzpg67JIDLcm+RdLSqaS5xA6Gr4vs1tmk=;
 b=DrcHPu2C3mVpw5eoNAOfLz0hLfWL3fLuMWB8MBSqecFaqbXCAEWbjVVz+/YuCSU8x5SI
 2l/vhTQM0ulX4v5yZuexVaMXkYlA9IYo2kjGMUNr7CHAzUrj9vmjS8+KByJnNz32SXha
 3hNYtieMO8NZtV4OYbwlh8F+tlgyHPlY2GEj2raynawEVGsgvGeNFloVBZ7YxL6mj04d
 fBiwStwpx5LVH5uF/2UXuBhwJepphlA1HKbagS0jevyDljfcolKbEUm8H29sXfLHTBEp
 XF6YVPDVjU8z3nKhBxxZKNgtOtvFjAGpAHWiIXokV8ojA82KylqKfOJdj49GCRIm/Zgv lA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p4g3mwskv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:45 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275Yi9D000545; 
 Tue, 7 Mar 2023 05:34:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3p4fhbm8nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275YhVn000522;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3275Yhm0000513
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id A466CA83; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 13/17] Hexagon (tests/tcg/hexagon) Enable HVX tests
Date: Mon,  6 Mar 2023 21:34:34 -0800
Message-Id: <20230307053438.2416629-14-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: CPZrl1QKbm0S1p9smGna3QmVXSUnt8MJ
X-Proofpoint-GUID: CPZrl1QKbm0S1p9smGna3QmVXSUnt8MJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=699 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070049
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
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24g
Sm9oYW5zc29uIDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIwMjMwMzA3MDI1ODI4LjE2MTI4
MDktMTEtdHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGVzdHMvdGNnL2hleGFnb24vTWFrZWZp
bGUudGFyZ2V0IHwgMTMgKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvaGV4YWdvbi9NYWtl
ZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJnZXQKaW5kZXggMThl
NmE1OTY5ZS4uMGQ4MmRmYTc2ZSAxMDA2NDQKLS0tIGEvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZp
bGUudGFyZ2V0CisrKyBiL3Rlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRhcmdldApAQCAtMSw1
ICsxLDUgQEAKICMjCi0jIyAgQ29weXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyMgIENvcHlyaWdodChjKSAy
MDE5LTIwMjMgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNl
cnZlZC4KICMjCiAjIyAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKICMjICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNDUsNiArNDUs
MTAgQEAgSEVYX1RFU1RTICs9IGZwc3R1ZmYKIEhFWF9URVNUUyArPSBvdmVyZmxvdwogSEVYX1RF
U1RTICs9IHNpZ25hbF9jb250ZXh0CiBIRVhfVEVTVFMgKz0gcmVnX211dAorSEVYX1RFU1RTICs9
IHZlY3Rvcl9hZGRfaW50CitIRVhfVEVTVFMgKz0gc2NhdHRlcl9nYXRoZXIKK0hFWF9URVNUUyAr
PSBodnhfbWlzYworSEVYX1RFU1RTICs9IGh2eF9oaXN0b2dyYW0KIAogSEVYX1RFU1RTICs9IHRl
c3RfYWJzCiBIRVhfVEVTVFMgKz0gdGVzdF9iaXRjbnQKQEAgLTc4LDMgKzgyLDEwIEBAIFRFU1RT
ICs9ICQoSEVYX1RFU1RTKQogdXNyOiB1c3IuYwogCSQoQ0MpICQoQ0ZMQUdTKSAtbXY2N3QgLU8y
IC1Xbm8taW5saW5lLWFzbSAtV25vLWV4cGFuc2lvbi10by1kZWZpbmVkICQ8IC1vICRAICQoTERG
TEFHUykKIAorc2NhdHRlcl9nYXRoZXI6IENGTEFHUyArPSAtbWh2eAordmVjdG9yX2FkZF9pbnQ6
IENGTEFHUyArPSAtbWh2eCAtZnZlY3Rvcml6ZQoraHZ4X21pc2M6IENGTEFHUyArPSAtbWh2eAor
aHZ4X2hpc3RvZ3JhbTogQ0ZMQUdTICs9IC1taHZ4IC1Xbm8tZ251LWZvbGRpbmctY29uc3RhbnQK
KworaHZ4X2hpc3RvZ3JhbTogaHZ4X2hpc3RvZ3JhbS5jIGh2eF9oaXN0b2dyYW1fcm93LlMKKwkk
KENDKSAkKENGTEFHUykgJChDUk9TU19DQ19HVUVTVF9DRkxBR1MpICReIC1vICRAICQoTERGTEFH
UykKLS0gCjIuMjUuMQoK

