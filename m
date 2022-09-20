Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194A85BDFA7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:17:28 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYRa-0005gX-VT
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaYIT-0000Mi-Io
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:08:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:46722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oaYIN-0005ZT-Uw
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:07:57 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7xcV2003256;
 Tue, 20 Sep 2022 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=K/uMfbc1xjwfE0U2XZi6x76mgV7luuiZs2gTG4F1QAs=;
 b=B/r47ClsGOgwfu7Jx+jBu4GB/s9w2MRDCj9ukf5hFmPr6ZzdNlgctLVgre3AQNkMg3fk
 aI8cdSvz3aisLVvhNpF9WeSNwmVWILRDcXEdsYxP88v8A7D1D59ByHKs1xyqNS/y7aMH
 yoq2cDffIedXJ1IvwAhdRAo1INZjiiH6tWdHbkOJAE+hs/lkiKNKAFtZqKAFtNKLT4Ou
 P043jtANbZDOOdOAbV0hFuKfx0BT7iM+sg3AeUuZw5ey/FZtP6ph6Z+5wUgTqz5xoEyL
 rlI0GvnncvoF2o+V1Pu1kvECEHzNGata6RICiM1WOPU2ky6LvvqeeOIw0Bks94/J+Jmm vw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jpw78a80p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 08:07:50 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28K87omT003128; 
 Tue, 20 Sep 2022 08:07:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3jnqmj02c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 20 Sep 2022 08:07:50 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28K87n5j002970;
 Tue, 20 Sep 2022 08:07:49 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 28K87nbf002926;
 Tue, 20 Sep 2022 08:07:49 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 4A4B75000A7; Tue, 20 Sep 2022 01:07:49 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, mlambert@quicinc.com
Subject: [PATCH 0/3] Hexagon (target/hexagon) improve store handling
Date: Tue, 20 Sep 2022 01:07:43 -0700
Message-Id: <20220920080746.26791-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4x9UaxfabrtOaclQSTnuYkV3FqZ_cd50
X-Proofpoint-GUID: 4x9UaxfabrtOaclQSTnuYkV3FqZ_cd50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=326
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200049
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TWFrZSBzdG9yZSBoYW5kbGluZyBmYXN0ZXIgYW5kIG1vcmUgcm9idXN0CgpUYXlsb3IgU2ltcHNv
biAoMyk6CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFkZCBpbnN0cnVjdGlvbiBhdHRyaWJ1
dGVzIGZyb20gYXJjaGxpYgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBtb3ZlIHN0b3JlIHNp
emUgdHJhY2tpbmcgdG8gdHJhbnNsYXRpb24KICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQ2hh
bmdlIGRlY2lzaW9uIHRvIHNldCBwa3RfaGFzX3N0b3JlX3NbMDFdCgogdGFyZ2V0L2hleGFnb24v
bWFjcm9zLmggICAgICAgICAgICAgICB8ICAgOCArLQogdGFyZ2V0L2hleGFnb24vYXR0cmlic19k
ZWYuaC5pbmMgICAgICB8ICAzOCArKysrKysrLQogdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgICAg
ICAgICAgICAgICB8ICAxNyArKy0tCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAg
ICAgIHwgIDM2ICsrKy0tLS0tCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAg
IHwgIDM2ICsrKysrKystCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICAgIHwg
ICAzICstCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9sZHN0LmlkZWYgICAgIHwgMTIyICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9zdWJpbnNucy5p
ZGVmIHwgIDcyICsrKysrKystLS0tLS0tLQogOCBmaWxlcyBjaGFuZ2VkLCAxOTYgaW5zZXJ0aW9u
cygrKSwgMTM2IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoK

