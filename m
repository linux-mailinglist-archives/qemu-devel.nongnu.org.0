Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70386EAF8B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:51:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptx8-0005vz-G9; Fri, 21 Apr 2023 12:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptx3-0005tL-Qu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pptwz-000441-TL
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:49:37 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LFR59h028050; Fri, 21 Apr 2023 16:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IULUecdqOUMqOfBRqIM011h7Ehuy3VYgmfShtqRTYUE=;
 b=hyvGmi5Ub0Te9WHYPWcsLVNLe+L4bEtbIy7P49lgHNCvFCWTPK04YmKPUxjyyufBZLMU
 DVfb/Tvg4HfkveErZ9ssPJEsfpT4IimwXlqHgXKsugypa6xYVdnNlKSK/hj/oT3Hfz+p
 cca9bXT7a0ts0xm/NEkoLi1bWGnaj9LTr0Kt7eD/CPqkc9f8teaKC2FjOytXuuUJ8iFy
 NIVxldM7FVUnsPEM6mEAgo4vAY160w8T8rc0Lhlr16RzP0sYFYu7unvLKUbySAokShsV
 mmaallK1c+Bf1p54lRMY7If6yQM5SoRU05Vy0/UVj2Sszk9cVFZl/DavBrc0673a3FJl YA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q3phdh55m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:27 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33LGm5sn005049; 
 Fri, 21 Apr 2023 16:49:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q3ncgk2um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:26 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33LGnGsM006064;
 Fri, 21 Apr 2023 16:49:26 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33LGnQnL006194
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 16:49:26 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 194AD665; Fri, 21 Apr 2023 09:49:26 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL v2 01/10] Hexagon (translate.c): avoid redundant PC updates on
 COF
Date: Fri, 21 Apr 2023 09:49:13 -0700
Message-Id: <20230421164922.3608183-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421164922.3608183-1-tsimpson@quicinc.com>
References: <20230421164922.3608183-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7TLQLF2nZbbVLRC-pKH2d7n4dCCNeTbY
X-Proofpoint-ORIG-GUID: 7TLQLF2nZbbVLRC-pKH2d7n4dCCNeTbY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxlogscore=850 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210147
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

RnJvbTogTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNfbWF0aGJlcm5AcXVpY2luYy5j
b20+CgpXaGVuIHRoZXJlIGlzIGEgY29uZGl0aW9uYWwgY2hhbmdlIG9mIGZsb3cgb3IgYW4gZW5k
bG9vcCBpbnN0cnVjdGlvbiwgd2UKcHJlbG9hZCBIRVhfUkVHX1BDIHdpdGggY3R4LT5uZXh0X1BD
IGF0IGdlbl9zdGFydF9wYWNrZXQoKS4gTm9uZXRoZWxlc3MsCndlIHN0aWxsIGdlbmVyYXRlIFRD
RyBjb2RlIHRvIGRvIHRoaXMgdXBkYXRlIGFnYWluIGF0IGdlbl9nb3RvX3RiKCkgd2hlbgp0aGUg
Y29uZGl0aW9uIGZvciB0aGUgQ09GIGlzIG5vdCBtZXQsIHRodXMgcHJvZHVjaW5nIHJlZHVuZGFu
dAppbnN0cnVjdGlvbnMuIFRoaXMgY2FuIGJlIHNlZW4gd2l0aCB0aGUgZm9sbG93aW5nIHBhY2tl
dDoKCiAweDAwNDAwMmU0OiAgMHg1YzIwZDAwMCB7ICAgICAgIGlmICghUDApIGp1bXA6dCBQQysw
IH0KCldoaWNoIGdlbmVyYXRlcyB0aGlzIFRDRyBjb2RlOgoKICAgLS0tLSAwMDQwMDJlNAotPiBt
b3ZfaTMyIHBjLCQweDQwMDJlOAogICBhbmRfaTMyIGxvYzkscDAsJDB4MQogICBtb3ZfaTMyIGJy
YW5jaF90YWtlbixsb2M5CiAgIGFkZF9pMzIgcGt0X2NudCxwa3RfY250LCQweDIKICAgYWRkX2kz
MiBpbnNuX2NudCxpbnNuX2NudCwkMHgyCiAgIGJyY29uZF9pMzIgYnJhbmNoX3Rha2VuLCQweDAs
bmUsJEwxCiAgIGdvdG9fdGIgJDB4MAogICBtb3ZfaTMyIHBjLCQweDQwMDJlNAogICBleGl0X3Ri
ICQweDdmYjBjMzZlNTIwMAogICBzZXRfbGFiZWwgJEwxCiAgIGdvdG9fdGIgJDB4MQotPiBtb3Zf
aTMyIHBjLCQweDQwMDJlOAogICBleGl0X3RiICQweDdmYjBjMzZlNTIwMQogICBzZXRfbGFiZWwg
JEwwCiAgIGV4aXRfdGIgJDB4N2ZiMGMzNmU1MjAzCgpOb3RlIHRoYXQgZXZlbiBhZnRlciBvcHRp
bWl6YXRpb25zLCB0aGUgcmVkdW5kYW50IFBDIHVwZGF0ZSBpcyBzdGlsbApwcmVzZW50OgoKICAg
LS0tLSAwMDQwMDJlNAotPiBtb3ZfaTMyIHBjLCQweDQwMDJlOCAgICAgICAgICAgICAgICAgICAg
IHN5bmM6IDAgIGRlYWQ6IDAgMSAgcHJlZj0weGZmZmYKICAgbW92X2kzMiBicmFuY2hfdGFrZW4s
JDB4MSAgICAgICAgICAgICAgICBzeW5jOiAwICBkZWFkOiAwIDEgIHByZWY9MHhmZmZmCiAgIGFk
ZF9pMzIgcGt0X2NudCxwa3RfY250LCQweDIgICAgICAgICAgICAgc3luYzogMCAgZGVhZDogMCAx
ICBwcmVmPTB4ZmZmZgogICBhZGRfaTMyIGluc25fY250LGluc25fY250LCQweDIgICAgICAgICAg
IHN5bmM6IDAgIGRlYWQ6IDAgMSAyICBwcmVmPTB4ZmZmZgogICBnb3RvX3RiICQweDEKLT4gbW92
X2kzMiBwYywkMHg0MDAyZTggICAgICAgICAgICAgICAgICAgICBzeW5jOiAwICBkZWFkOiAwIDEg
IHByZWY9MHhmZmZmCiAgIGV4aXRfdGIgJDB4N2ZiMGMzNmU1MjAxCiAgIHNldF9sYWJlbCAkTDAK
ICAgZXhpdF90YiAkMHg3ZmIwYzM2ZTUyMDMKCldpdGggdGhpcyBwYXRjaCwgdGhlIHNlY29uZCBy
ZWR1bmRhbnQgdXBkYXRlIGlzIHByb3Blcmx5IGRpc2NhcmRlZC4KCk5vdGUgdGhhdCB3ZSBuZWVk
IHRoZSBhZGRpdGlvbmFsICJtb3ZlX3RvX3BjIiBmbGFnIGluc3RlYWQgb2YganVzdAphdm9pZGlu
ZyB0aGUgdXBkYXRlIHdoZW5ldmVyIGBkZXN0ID09IGN0eC0+bmV4dF9QQ2AsIGFzIHRoYXQgY291
bGQKcG90ZW50aWFsbHkgc2tpcCB1cGRhdGVzIGZyb20gYSBDT0Ygd2l0aCBtZXQgY29uZGl0aW9u
LCB3aG9zZQpjdHgtPmJyYW5jaF9kZXN0IGp1c3QgaGFwcGVucyB0byBiZSBlcXVhbCB0byBjdHgt
Pm5leHRfUEMuCgpTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlubyA8cXVp
Y19tYXRoYmVybkBxdWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRz
aW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJl
di5uZz4KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4K
TWVzc2FnZS1JZDogPGZjMDU5MTUzYzNmMDUyNmQ5N2I3ZjEzNDUwYzAyYjI3NmIwOTA4ZTEuMTY3
OTUxOTM0MS5naXQucXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdv
bi90cmFuc2xhdGUuYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hl
eGFnb24vdHJhbnNsYXRlLmMgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwppbmRleCA2NjU0
NzZhYjQ4Li41OGQ2MzhmNzM0IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUu
YworKysgYi90YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYwpAQCAtMTI4LDE0ICsxMjgsMTkgQEAg
c3RhdGljIGJvb2wgdXNlX2dvdG9fdGIoRGlzYXNDb250ZXh0ICpjdHgsIHRhcmdldF91bG9uZyBk
ZXN0KQogICAgIHJldHVybiB0cmFuc2xhdG9yX3VzZV9nb3RvX3RiKCZjdHgtPmJhc2UsIGRlc3Qp
OwogfQogCi1zdGF0aWMgdm9pZCBnZW5fZ290b190YihEaXNhc0NvbnRleHQgKmN0eCwgaW50IGlk
eCwgdGFyZ2V0X3Vsb25nIGRlc3QpCitzdGF0aWMgdm9pZCBnZW5fZ290b190YihEaXNhc0NvbnRl
eHQgKmN0eCwgaW50IGlkeCwgdGFyZ2V0X3Vsb25nIGRlc3QsIGJvb2wKKyAgICAgICAgICAgICAg
ICAgICAgICAgIG1vdmVfdG9fcGMpCiB7CiAgICAgaWYgKHVzZV9nb3RvX3RiKGN0eCwgZGVzdCkp
IHsKICAgICAgICAgdGNnX2dlbl9nb3RvX3RiKGlkeCk7Ci0gICAgICAgIHRjZ19nZW5fbW92aV90
bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsKKyAgICAgICAgaWYgKG1vdmVfdG9fcGMpIHsK
KyAgICAgICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsK
KyAgICAgICAgfQogICAgICAgICB0Y2dfZ2VuX2V4aXRfdGIoY3R4LT5iYXNlLnRiLCBpZHgpOwog
ICAgIH0gZWxzZSB7Ci0gICAgICAgIHRjZ19nZW5fbW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENd
LCBkZXN0KTsKKyAgICAgICAgaWYgKG1vdmVfdG9fcGMpIHsKKyAgICAgICAgICAgIHRjZ19nZW5f
bW92aV90bChoZXhfZ3ByW0hFWF9SRUdfUENdLCBkZXN0KTsKKyAgICAgICAgfQogICAgICAgICB0
Y2dfZ2VuX2xvb2t1cF9hbmRfZ290b19wdHIoKTsKICAgICB9CiB9CkBAIC0xNTAsMTEgKzE1NSwx
MSBAQCBzdGF0aWMgdm9pZCBnZW5fZW5kX3RiKERpc2FzQ29udGV4dCAqY3R4KQogICAgICAgICBp
ZiAoY3R4LT5icmFuY2hfY29uZCAhPSBUQ0dfQ09ORF9BTFdBWVMpIHsKICAgICAgICAgICAgIFRD
R0xhYmVsICpza2lwID0gZ2VuX25ld19sYWJlbCgpOwogICAgICAgICAgICAgdGNnX2dlbl9icmNv
bmRpX3RsKGN0eC0+YnJhbmNoX2NvbmQsIGhleF9icmFuY2hfdGFrZW4sIDAsIHNraXApOwotICAg
ICAgICAgICAgZ2VuX2dvdG9fdGIoY3R4LCAwLCBjdHgtPmJyYW5jaF9kZXN0KTsKKyAgICAgICAg
ICAgIGdlbl9nb3RvX3RiKGN0eCwgMCwgY3R4LT5icmFuY2hfZGVzdCwgdHJ1ZSk7CiAgICAgICAg
ICAgICBnZW5fc2V0X2xhYmVsKHNraXApOwotICAgICAgICAgICAgZ2VuX2dvdG9fdGIoY3R4LCAx
LCBjdHgtPm5leHRfUEMpOworICAgICAgICAgICAgZ2VuX2dvdG9fdGIoY3R4LCAxLCBjdHgtPm5l
eHRfUEMsIGZhbHNlKTsKICAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgIGdlbl9nb3RvX3Ri
KGN0eCwgMCwgY3R4LT5icmFuY2hfZGVzdCk7CisgICAgICAgICAgICBnZW5fZ290b190YihjdHgs
IDAsIGN0eC0+YnJhbmNoX2Rlc3QsIHRydWUpOwogICAgICAgICB9CiAgICAgfSBlbHNlIGlmIChj
dHgtPmlzX3RpZ2h0X2xvb3AgJiYKICAgICAgICAgICAgICAgIHBrdC0+aW5zbltwa3QtPm51bV9p
bnNucyAtIDFdLm9wY29kZSA9PSBKMl9lbmRsb29wMCkgewpAQCAtMTY1LDkgKzE3MCw5IEBAIHN0
YXRpYyB2b2lkIGdlbl9lbmRfdGIoRGlzYXNDb250ZXh0ICpjdHgpCiAgICAgICAgIFRDR0xhYmVs
ICpza2lwID0gZ2VuX25ld19sYWJlbCgpOwogICAgICAgICB0Y2dfZ2VuX2JyY29uZGlfdGwoVENH
X0NPTkRfTEVVLCBoZXhfZ3ByW0hFWF9SRUdfTEMwXSwgMSwgc2tpcCk7CiAgICAgICAgIHRjZ19n
ZW5fc3ViaV90bChoZXhfZ3ByW0hFWF9SRUdfTEMwXSwgaGV4X2dwcltIRVhfUkVHX0xDMF0sIDEp
OwotICAgICAgICBnZW5fZ290b190YihjdHgsIDAsIGN0eC0+YmFzZS50Yi0+cGMpOworICAgICAg
ICBnZW5fZ290b190YihjdHgsIDAsIGN0eC0+YmFzZS50Yi0+cGMsIHRydWUpOwogICAgICAgICBn
ZW5fc2V0X2xhYmVsKHNraXApOwotICAgICAgICBnZW5fZ290b190YihjdHgsIDEsIGN0eC0+bmV4
dF9QQyk7CisgICAgICAgIGdlbl9nb3RvX3RiKGN0eCwgMSwgY3R4LT5uZXh0X1BDLCBmYWxzZSk7
CiAgICAgfSBlbHNlIHsKICAgICAgICAgdGNnX2dlbl9sb29rdXBfYW5kX2dvdG9fcHRyKCk7CiAg
ICAgfQotLSAKMi4yNS4xCgo=

