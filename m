Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463B620802
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 05:07:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osFsK-000740-9R; Mon, 07 Nov 2022 23:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osFsD-0006yf-4r
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:06:06 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osFs8-00073t-HP
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:06:04 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A81WOox005573; Tue, 8 Nov 2022 04:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=telpnskSzxqBvA6n6f/U+OSLtf980INmm6cDcWVTFNM=;
 b=PEsXIQNEiByNcfqNDxV6FQ9+mxIQeMn+I1QC+GQA+PKjAwHO5hk1goJ13FBU8XaLZ9Ag
 5RwlZ8ycwx7emHlkvk1RW8BExHKKet5+BVYpTymH5duiKA8aZSMnQQdL2sPIX1T/PKoP
 h/V7zfKbrLHHL2+SOO1ZOMcrnVyLxIXnRJweyWVipCnYts6RwN11VXWe25WWZh7v03zf
 mcpDEuk4y9ry3AvpnWjChDaKQ3RweO4XfS0mm8Q9ZgUZAroMMIIka1OSsklwJz8xNxGb
 m5MRPc84yeVUKT5vV3xlYtzYm9/FsuwizciQG+UJ9Jn0GVykRiiZUsrVPIferct+jdBW fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqby8rey8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 04:05:56 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A845tHs022938; 
 Tue, 8 Nov 2022 04:05:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3kngwksv3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 08 Nov 2022 04:05:55 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A845tQk022914;
 Tue, 8 Nov 2022 04:05:55 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 2A845sKN022908;
 Tue, 08 Nov 2022 04:05:55 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 23A4D500102; Mon,  7 Nov 2022 20:05:54 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v4 07/11] Hexagon (target/hexagon) Add overrides for direct
 call instructions
Date: Mon,  7 Nov 2022 20:05:48 -0800
Message-Id: <20221108040552.22175-8-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221108040552.22175-1-tsimpson@quicinc.com>
References: <20221108040552.22175-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: umpnZ7NSaF05Qm8QTKVdycbmMRg7t5qu
X-Proofpoint-GUID: umpnZ7NSaF05Qm8QTKVdycbmMRg7t5qu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=723 bulkscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080020
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIEoyX2NhbGwKICAgIEoyX2NhbGx0CiAgICBKMl9jYWxsZgoK
U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA4ICsrKysrKwogdGFyZ2V0L2hleGFnb24vZ2Vu
cHRyLmMgIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vZ2VuX3RjZy5oIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCmluZGV4IGRmMjc5YWI0M2Iu
LjFiZGM3ODdhMDIgMTAwNjQ0Ci0tLSBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaAorKysgYi90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKQEAgLTYxMiw2ICs2MTIsMTQgQEAKICAgICAgICAgdGNn
X3RlbXBfZnJlZSh0bXApOyBcCiAgICAgfSB3aGlsZSAoMCkKIAorI2RlZmluZSBmR0VOX1RDR19K
Ml9jYWxsKFNIT1JUQ09ERSkgXAorICAgIGdlbl9jYWxsKGN0eCwgcmlWKQorCisjZGVmaW5lIGZH
RU5fVENHX0oyX2NhbGx0KFNIT1JUQ09ERSkgXAorICAgIGdlbl9jb25kX2NhbGwoY3R4LCBQdVYs
IFRDR19DT05EX0VRLCByaVYpCisjZGVmaW5lIGZHRU5fVENHX0oyX2NhbGxmKFNIT1JUQ09ERSkg
XAorICAgIGdlbl9jb25kX2NhbGwoY3R4LCBQdVYsIFRDR19DT05EX05FLCByaVYpCisKICNkZWZp
bmUgZkdFTl9UQ0dfSjJfcGF1c2UoU0hPUlRDT0RFKSBcCiAgICAgZG8geyBcCiAgICAgICAgIHVp
ViA9IHVpVjsgXApkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYwppbmRleCBjY2ZlZDlkNjQzLi5mZmFlYTVhNjM5IDEwMDY0NAotLS0g
YS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpA
QCAtNDU2LDYgKzQ1Niw2MSBAQCBzdGF0aWMgVENHdiBnZW5fOGJpdHNvZihUQ0d2IHJlc3VsdCwg
VENHdiB2YWx1ZSkKICAgICByZXR1cm4gcmVzdWx0OwogfQogCitzdGF0aWMgdm9pZCBnZW5fd3Jp
dGVfbmV3X3BjX2FkZHIoRGlzYXNDb250ZXh0ICpjdHgsIFRDR3YgYWRkciwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBUQ0dDb25kIGNvbmQsIFRDR3YgcHJlZCkKK3sKKyAgICBU
Q0dMYWJlbCAqcHJlZF9mYWxzZSA9IE5VTEw7CisgICAgaWYgKGNvbmQgIT0gVENHX0NPTkRfQUxX
QVlTKSB7CisgICAgICAgIHByZWRfZmFsc2UgPSBnZW5fbmV3X2xhYmVsKCk7CisgICAgICAgIHRj
Z19nZW5fYnJjb25kaV90bChjb25kLCBwcmVkLCAwLCBwcmVkX2ZhbHNlKTsKKyAgICB9CisKKyAg
ICBpZiAoY3R4LT5wa3QtPnBrdF9oYXNfbXVsdGlfY29mKSB7CisgICAgICAgIC8qIElmIHRoZXJl
IGFyZSBtdWx0aXBsZSBicmFuY2hlcyBpbiBhIHBhY2tldCwgaWdub3JlIHRoZSBzZWNvbmQgb25l
ICovCisgICAgICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9ORSwgaGV4X2dwcltIRVhf
UkVHX1BDXSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGhleF9icmFuY2hfdGFrZW4sIHRj
Z19jb25zdGFudF90bCgwKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGhleF9ncHJbSEVY
X1JFR19QQ10sIGFkZHIpOworICAgICAgICB0Y2dfZ2VuX21vdmlfdGwoaGV4X2JyYW5jaF90YWtl
biwgMSk7CisgICAgfSBlbHNlIHsKKyAgICAgICAgdGNnX2dlbl9tb3ZfdGwoaGV4X2dwcltIRVhf
UkVHX1BDXSwgYWRkcik7CisgICAgfQorCisgICAgaWYgKGNvbmQgIT0gVENHX0NPTkRfQUxXQVlT
KSB7CisgICAgICAgIGdlbl9zZXRfbGFiZWwocHJlZF9mYWxzZSk7CisgICAgfQorfQorCitzdGF0
aWMgdm9pZCBnZW5fd3JpdGVfbmV3X3BjX3BjcmVsKERpc2FzQ29udGV4dCAqY3R4LCBpbnQgcGNf
b2ZmLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQ0dDb25kIGNvbmQsIFRD
R3YgcHJlZCkKK3sKKyAgICB0YXJnZXRfdWxvbmcgZGVzdCA9IGN0eC0+cGt0LT5wYyArIHBjX29m
ZjsKKyAgICBnZW5fd3JpdGVfbmV3X3BjX2FkZHIoY3R4LCB0Y2dfY29uc3RhbnRfdGwoZGVzdCks
IGNvbmQsIHByZWQpOworfQorCitzdGF0aWMgdm9pZCBnZW5fY2FsbChEaXNhc0NvbnRleHQgKmN0
eCwgaW50IHBjX29mZikKK3sKKyAgICBUQ0d2IG5leHRfUEMgPQorICAgICAgICB0Y2dfY29uc3Rh
bnRfdGwoY3R4LT5wa3QtPnBjICsgY3R4LT5wa3QtPmVuY29kX3BrdF9zaXplX2luX2J5dGVzKTsK
KyAgICBnZW5fbG9nX3JlZ193cml0ZShIRVhfUkVHX0xSLCBuZXh0X1BDKTsKKyAgICBnZW5fd3Jp
dGVfbmV3X3BjX3BjcmVsKGN0eCwgcGNfb2ZmLCBUQ0dfQ09ORF9BTFdBWVMsIE5VTEwpOworfQor
CitzdGF0aWMgdm9pZCBnZW5fY29uZF9jYWxsKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2IHByZWQs
CisgICAgICAgICAgICAgICAgICAgICAgICAgIFRDR0NvbmQgY29uZCwgaW50IHBjX29mZikKK3sK
KyAgICBUQ0d2IG5leHRfUEM7CisgICAgVENHdiBsc2IgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTsK
KyAgICBUQ0dMYWJlbCAqc2tpcCA9IGdlbl9uZXdfbGFiZWwoKTsKKyAgICB0Y2dfZ2VuX2FuZGlf
dGwobHNiLCBwcmVkLCAxKTsKKyAgICBnZW5fd3JpdGVfbmV3X3BjX3BjcmVsKGN0eCwgcGNfb2Zm
LCBjb25kLCBsc2IpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChjb25kLCBsc2IsIDAsIHNraXAp
OworICAgIHRjZ190ZW1wX2ZyZWUobHNiKTsKKyAgICBuZXh0X1BDID0KKyAgICAgICAgdGNnX2Nv
bnN0YW50X3RsKGN0eC0+cGt0LT5wYyArIGN0eC0+cGt0LT5lbmNvZF9wa3Rfc2l6ZV9pbl9ieXRl
cyk7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoSEVYX1JFR19MUiwgbmV4dF9QQyk7CisgICAgZ2Vu
X3NldF9sYWJlbChza2lwKTsKK30KKwogLyogU2hpZnQgbGVmdCB3aXRoIHNhdHVyYXRpb24gKi8K
IHN0YXRpYyB2b2lkIGdlbl9zaGxfc2F0KFRDR3YgZHN0LCBUQ0d2IHNyYywgVENHdiBzaGlmdF9h
bXQpCiB7Ci0tIAoyLjE3LjEKCg==

