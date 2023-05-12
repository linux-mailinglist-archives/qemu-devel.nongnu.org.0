Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD87701221
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 00:18:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxb4u-0007Ii-18; Fri, 12 May 2023 18:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxb4r-0007HS-Si
 for qemu-devel@nongnu.org; Fri, 12 May 2023 18:17:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxb4p-0003fb-V3
 for qemu-devel@nongnu.org; Fri, 12 May 2023 18:17:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CKIhhH026876; Fri, 12 May 2023 22:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=q8rVk585sqCCCPERi9C3KMMQl+drhCc0mg86va4ZA4M=;
 b=YGEFEumCk9pXCRwYBaaFf3szBgchEhvaAOwCu1szKOTPAJjCXuq0VHJxFsU3987Wj724
 /tD80f7lxWN2LtAdw5Defi7/3N1jc+/xagvuOnsEHU2BFwlbP0uCB7+IoNgRItQ+5Zu4
 BOf7eB+qN2yLQzBv30DMPeUe5p+SrC9VeGRMps9yk6PhtjgK/EwaV57zcxcm8fBtalSg
 lbZ83Mu6m3Ke6AYJx+pwXiRET3APQv4lllgQopPzukOzHf5psb/NPHm6tu+L7Kovu5gw
 blc8yD0eErmygbCaOyUXTniTQndLflHQmSc+8iZDP+WaIeOoAfUtsCd8RiwTEDKuGp1k zA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhfww21r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:24 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CMF2Eu000961; 
 Fri, 12 May 2023 22:17:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3qh5sk7yac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:23 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CMHN3J003604;
 Fri, 12 May 2023 22:17:23 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 34CMHMO4003591
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 22:17:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 58615682; Fri, 12 May 2023 15:17:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com,
 Sid Manning <sidneym@quicinc.com>
Subject: [PULL 42/44] Hexagon (gdbstub): fix p3:0 read and write via stub
Date: Fri, 12 May 2023 14:47:04 -0700
Message-Id: <20230512214706.946068-43-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gJNEcZmF0ukcaFsSncEOhdhT-Y5U59eW
X-Proofpoint-GUID: gJNEcZmF0ukcaFsSncEOhdhT-Y5U59eW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=469 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120186
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

RnJvbTogQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+CgpTaWduZWQtb2ZmLWJ5OiBCcmlh
biBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4KQ28tYXV0aG9yZWQtYnk6IFNpZCBNYW5uaW5nIDxz
aWRuZXltQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBTaWQgTWFubmluZyA8c2lkbmV5bUBx
dWljaW5jLmNvbT4KQ28tYXV0aG9yZWQtYnk6IE1hdGhldXMgVGF2YXJlcyBCZXJuYXJkaW5vIDxx
dWljX21hdGhiZXJuQHF1aWNpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFyZXMg
QmVybmFyZGlubyA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IFRheWxv
ciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNp
bXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpNZXNzYWdlLUlkOiA8MzJlN2RlNTY3Y2RhZTE4
NGE2NzgxNjQ0NDU0YmJiMTk5MTZjOTU1Yi4xNjgzMjE0Mzc1LmdpdC5xdWljX21hdGhiZXJuQHF1
aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2dkYnN0dWIuYyB8IDE2ICsrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vZ2Ric3R1Yi5jIGIvdGFyZ2V0L2hleGFnb24vZ2Ric3R1Yi5jCmluZGV4IDQ2
MDgzZGE2MjAuLmEwNmZlZDlmMTggMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dkYnN0dWIu
YworKysgYi90YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMKQEAgLTI1LDYgKzI1LDE0IEBAIGludCBo
ZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVyKENQVVN0YXRlICpjcywgR0J5dGVBcnJheSAqbWVtX2J1
ZiwgaW50IG4pCiAgICAgSGV4YWdvbkNQVSAqY3B1ID0gSEVYQUdPTl9DUFUoY3MpOwogICAgIENQ
VUhleGFnb25TdGF0ZSAqZW52ID0gJmNwdS0+ZW52OwogCisgICAgaWYgKG4gPT0gSEVYX1JFR19Q
M18wX0FMSUFTRUQpIHsKKyAgICAgICAgdWludDMyX3QgcDNfMCA9IDA7CisgICAgICAgIGZvciAo
aW50IGkgPSAwOyBpIDwgTlVNX1BSRUdTOyBpKyspIHsKKyAgICAgICAgICAgIHAzXzAgPSBkZXBv
c2l0MzIocDNfMCwgaSAqIDgsIDgsIGVudi0+cHJlZFtpXSk7CisgICAgICAgIH0KKyAgICAgICAg
cmV0dXJuIGdkYl9nZXRfcmVnbChtZW1fYnVmLCBwM18wKTsKKyAgICB9CisKICAgICBpZiAobiA8
IFRPVEFMX1BFUl9USFJFQURfUkVHUykgewogICAgICAgICByZXR1cm4gZ2RiX2dldF9yZWdsKG1l
bV9idWYsIGVudi0+Z3ByW25dKTsKICAgICB9CkBAIC0zNyw2ICs0NSwxNCBAQCBpbnQgaGV4YWdv
bl9nZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3RhdGUgKmNzLCB1aW50OF90ICptZW1fYnVmLCBpbnQg
bikKICAgICBIZXhhZ29uQ1BVICpjcHUgPSBIRVhBR09OX0NQVShjcyk7CiAgICAgQ1BVSGV4YWdv
blN0YXRlICplbnYgPSAmY3B1LT5lbnY7CiAKKyAgICBpZiAobiA9PSBIRVhfUkVHX1AzXzBfQUxJ
QVNFRCkgeworICAgICAgICB1aW50MzJfdCBwM18wID0gbGR0dWxfcChtZW1fYnVmKTsKKyAgICAg
ICAgZm9yIChpbnQgaSA9IDA7IGkgPCBOVU1fUFJFR1M7IGkrKykgeworICAgICAgICAgICAgZW52
LT5wcmVkW2ldID0gZXh0cmFjdDMyKHAzXzAsIGkgKiA4LCA4KTsKKyAgICAgICAgfQorICAgICAg
ICByZXR1cm4gc2l6ZW9mKHRhcmdldF91bG9uZyk7CisgICAgfQorCiAgICAgaWYgKG4gPCBUT1RB
TF9QRVJfVEhSRUFEX1JFR1MpIHsKICAgICAgICAgZW52LT5ncHJbbl0gPSBsZHR1bF9wKG1lbV9i
dWYpOwogICAgICAgICByZXR1cm4gc2l6ZW9mKHRhcmdldF91bG9uZyk7Ci0tIAoyLjI1LjEKCg==

