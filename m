Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF6965F6A4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:22:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYUd-00071o-7E; Thu, 05 Jan 2023 17:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUY-0006xm-Rv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUU-00028W-UB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:42 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305KOckk021321; Thu, 5 Jan 2023 22:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=O4IBHqwhtRzPQ8aVZT1s1W1wRgUnZr/G86NGze6Ead0=;
 b=SRitKlaVZaNrqDNnv5Yb8EjE/Jf44TOaWZT942/GkJs/al0YCvOOcy1C3Wo/dMi9rl1T
 sK6i3XjmwzDYaiqdCSKAIj7MHK7NV9K+L8FXgu7d9bdfO475SvNjAOzqoGLjYL0Ci0UQ
 GFjZFqWOw5dw/zDn8uWFqgB8hFobF/YoOlXBxqQ7hWqJ7awVaGFXnCCz+fXIjj6LslKQ
 1H2FoLibu5NBpMcYctHkGRVVpl9PQyyBBuglCDCDKkFli6lmP5pTAMboSh5+sZIrXZek
 /fJ7LZBKVMzqnAtohSoIeA7tqfT5YmOhtxwTbDgsgKAtvi1KA3ArS4ZiOEXWf4G8VXmI 4A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mx57e07aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:13:36 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305MDZaY002030; 
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 3mte5kxjve-1;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305MDZlJ002024;
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTP id 305MDYIG002019;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 4E43A500116; Thu,  5 Jan 2023 14:13:34 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 9/9] Hexagon (tests/tcg/hexagon) Enable HVX tests
Date: Thu,  5 Jan 2023 14:13:31 -0800
Message-Id: <20230105221331.12069-10-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105221331.12069-1-tsimpson@quicinc.com>
References: <20230105221331.12069-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: w118u5vPOoPqAZfIMZYVJKvsldoK-R4I
X-Proofpoint-ORIG-GUID: w118u5vPOoPqAZfIMZYVJKvsldoK-R4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=838
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050174
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

TWFkZSBwb3NzaWJsZSBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKU2lnbmVkLW9mZi1ieTog
VGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRlc3RzL3RjZy9oZXhh
Z29uL01ha2VmaWxlLnRhcmdldCB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL2hl
eGFnb24vTWFrZWZpbGUudGFyZ2V0IGIvdGVzdHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0
CmluZGV4IDllZTFmYWExZTEuLmFkY2E4MzI2YmYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3RjZy9oZXhh
Z29uL01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cvaGV4YWdvbi9NYWtlZmlsZS50YXJn
ZXQKQEAgLTEsNSArMSw1IEBACiAjIwotIyMgIENvcHlyaWdodChjKSAyMDE5LTIwMjIgUXVhbGNv
bW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMjICBDb3B5
cmlnaHQoYykgMjAxOS0yMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuCiAjIwogIyMgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAjIyAgaXQgdW5kZXIgdGhlIHRl
cm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKQEAg
LTQzLDYgKzQzLDEwIEBAIEhFWF9URVNUUyArPSBsb2FkX2FsaWduCiBIRVhfVEVTVFMgKz0gYXRv
bWljcwogSEVYX1RFU1RTICs9IGZwc3R1ZmYKIEhFWF9URVNUUyArPSBvdmVyZmxvdworSEVYX1RF
U1RTICs9IHZlY3Rvcl9hZGRfaW50CitIRVhfVEVTVFMgKz0gc2NhdHRlcl9nYXRoZXIKK0hFWF9U
RVNUUyArPSBodnhfbWlzYworSEVYX1RFU1RTICs9IGh2eF9oaXN0b2dyYW0KIAogSEVYX1RFU1RT
ICs9IHRlc3RfYWJzCiBIRVhfVEVTVFMgKz0gdGVzdF9iaXRjbnQKQEAgLTc2LDMgKzgwLDEwIEBA
IFRFU1RTICs9ICQoSEVYX1RFU1RTKQogdXNyOiB1c3IuYwogCSQoQ0MpICQoQ0ZMQUdTKSAtbXY2
N3QgLU8yIC1Xbm8taW5saW5lLWFzbSAtV25vLWV4cGFuc2lvbi10by1kZWZpbmVkICQ8IC1vICRA
ICQoTERGTEFHUykKIAorc2NhdHRlcl9nYXRoZXI6IENGTEFHUyArPSAtbWh2eAordmVjdG9yX2Fk
ZF9pbnQ6IENGTEFHUyArPSAtbWh2eCAtZnZlY3Rvcml6ZQoraHZ4X21pc2M6IENGTEFHUyArPSAt
bWh2eAoraHZ4X2hpc3RvZ3JhbTogQ0ZMQUdTICs9IC1taHZ4IC1Xbm8tZ251LWZvbGRpbmctY29u
c3RhbnQKKworaHZ4X2hpc3RvZ3JhbTogaHZ4X2hpc3RvZ3JhbS5jIGh2eF9oaXN0b2dyYW1fcm93
LlMKKwkkKENDKSAkKENGTEFHUykgJChDUk9TU19DQ19HVUVTVF9DRkxBR1MpICReIC1vICRACi0t
IAoyLjE3LjEKCg==

