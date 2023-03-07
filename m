Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F312B6AD6DC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyc-0006mg-HG; Tue, 07 Mar 2023 00:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyL-0006X7-Vv
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyJ-0006Yd-2Q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:48 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3274KPP7029385; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-type : content-transfer-encoding; s=qcppdkim1;
 bh=fXUO3+z//s0qOrHjzGePRFosSuJNgVAbZL4I/3MD2fc=;
 b=g3S5MdqAD6haPyxIfGKGlpjuKvjY1Yij5ltf4RgIoRN9wBRREP1fB+cqMSD9W1F2dNI7
 xS2twd38VxUaOF++mOTrgt1+yMSHgpl/RlIZ3hP6VySFab+DNYqWcY0vnLrkA2hdrBMv
 RnlavAO/B1OWxHmTDluQDD8PO/AAS83/fX6atB+/cdXeMF/TDNRbwEojU0nKI2v+eDLd
 unGutRva0WPtRSI5IuRdekfifw3SRw12iXSIFcqupr3DDhgtWVTe5d0OJ8JqngsJOeXh
 Hviwjd1lqetBPueeI9Thl6YWa9cIb2D59bGU3ifJ6C2u7DNoyU9TO8iCJCMpbIIrSkpQ xA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5x5c847r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275Yh22004489; 
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3p4few49ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275Yhg6004479;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 3275YgIH004474
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 887F5687; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 02/17] target/hexagon/idef-parser: Elide mov in gen_pred_assign
Date: Mon,  6 Mar 2023 21:34:23 -0800
Message-Id: <20230307053438.2416629-3-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: V7BclWyuWEKh9_yryZF1CJ-Yjb_U6LOc
X-Proofpoint-GUID: V7BclWyuWEKh9_yryZF1CJ-Yjb_U6LOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=351
 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070049
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

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+CgpN
ZXJnZSBtb3Ygd2l0aCBhbmRpLgoKU3VnZ2VzdGVkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNp
bXBzb25AcXVpY2luYy5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25A
cXVpY2luYy5jb20+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDMwNjIyNTcyNC4yMTA1MjYzLTEtcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9w
YXJzZXItaGVscGVycy5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIv
cGFyc2VyLWhlbHBlcnMuYyBiL3RhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxw
ZXJzLmMKaW5kZXggZTFhNTU0MTJjOC4uN2I0OTRjMmY5ZSAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hl
eGFnb24vaWRlZi1wYXJzZXIvcGFyc2VyLWhlbHBlcnMuYworKysgYi90YXJnZXQvaGV4YWdvbi9p
ZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jCkBAIC0xNzIyLDkgKzE3MjIsNyBAQCB2b2lkIGdl
bl9wcmVkX2Fzc2lnbihDb250ZXh0ICpjLCBZWUxUWVBFICpsb2NwLCBIZXhWYWx1ZSAqbGVmdF9w
cmVkLAogICAgICAgICAqbGVmdF9wcmVkID0gZ2VuX3RtcChjLCBsb2NwLCAzMiwgVU5TSUdORUQp
OwogICAgIH0KICAgICAvKiBFeHRyYWN0IGZpcnN0IDggYml0cywgYW5kIHN0b3JlIG5ldyBwcmVk
aWNhdGUgdmFsdWUgKi8KLSAgICBPVVQoYywgbG9jcCwgInRjZ19nZW5fbW92X2kzMigiLCBsZWZ0
X3ByZWQsICIsICIsICZyLCAiKTtcbiIpOwotICAgIE9VVChjLCBsb2NwLCAidGNnX2dlbl9hbmRp
X2kzMigiLCBsZWZ0X3ByZWQsICIsICIsIGxlZnRfcHJlZCwKLSAgICAgICAgIiwgMHhmZik7XG4i
KTsKKyAgICBPVVQoYywgbG9jcCwgInRjZ19nZW5fYW5kaV9pMzIoIiwgbGVmdF9wcmVkLCAiLCAi
LCAmciwgIiwgMHhmZik7XG4iKTsKICAgICBpZiAoaXNfZGlyZWN0KSB7CiAgICAgICAgIE9VVChj
LCBsb2NwLCAiZ2VuX2xvZ19wcmVkX3dyaXRlKGN0eCwgIiwgcHJlZF9pZCwgIiwgIiwgbGVmdF9w
cmVkLAogICAgICAgICAgICAgIik7XG4iKTsKLS0gCjIuMjUuMQoK

