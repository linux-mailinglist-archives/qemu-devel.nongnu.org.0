Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D24653934
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mP-000805-Ce; Wed, 21 Dec 2022 17:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p87mM-0007w3-6n
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1p87mJ-0000kJ-9J
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:37 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLM7qxH007685; Wed, 21 Dec 2022 22:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=XPfAvJmhE+NR59BcwkFyrYPXm8TuiXtuByQ5JjevzHE=;
 b=j7SbKDP5CZk5OsbyY1Kqz5+5rmLertKe/DmRxNNnR9L6xA2DZG1pxhmCGSsfR6+fYPhE
 1L7/b3IybJhd8dJRewBRV+ZuHF1P/xrETWl3E2e5IznAyRJABK6smxdrN9USYeRPqQxL
 SXyfPSMVUdO4cOiqOIF5LqFAwK1b07PBSUSuga6QdsHMiNkbWWtyr4PxgLgp/dbTIwuq
 1T+Dsxc+n7CODTd088PRTl/l9Os1fwf0SKHeRX7gn+ME3RJyQtIQK67J243KF6hrJfYB
 XmDI01Xs6uLa0nMNa7IC7NSyA4OXqVkQ2oeDOEx9h8v2AVQEm92Z1Ak3MF7rklQ+RE8j kA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkmvtatsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 22:41:30 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2BLMcG8L009979; 
 Wed, 21 Dec 2022 22:41:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3mh6ukuyp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 21 Dec 2022 22:41:30 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLMeIfY011515;
 Wed, 21 Dec 2022 22:41:29 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2BLMfTM9012658;
 Wed, 21 Dec 2022 22:41:29 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 05FB95000A7; Wed, 21 Dec 2022 14:41:29 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 0/4] exagon (target/hexagon) Add overrides for COF insns
Date: Wed, 21 Dec 2022 14:41:23 -0800
Message-Id: <20221221224127.20916-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: zayr59DjwO1JDR7G_CXdMlFANxxBcjCo
X-Proofpoint-GUID: zayr59DjwO1JDR7G_CXdMlFANxxBcjCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_12,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxlogscore=251
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210192
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

VGhlIGlkZWYtcGFyc2VyIHNraXBzIHRoZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlv
bnMsIHNvIGFkZApvdmVycmlkZXMKClRheWxvciBTaW1wc29uICg0KToKICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IganVtcHIzMSBpbnN0cnVjdGlvbnMKICBIZXhh
Z29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgY2FsbHIKICBIZXhhZ29uICh0
YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgZW5kbG9vcDEvZW5kbG9vcDAxCiAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGRlYWxsb2MtcmV0dXJuIGlu
c3RydWN0aW9ucwoKIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgIHwgIDc3ICsrKysrKysrKysr
KysrKwogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgfCAgMTAgLS0KIHRhcmdldC9oZXhhZ29u
L2dlbnB0ci5jICAgIHwgMTkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jIHwgIDI0IC0tLS0tCiA0IGZpbGVzIGNoYW5nZWQs
IDI3MCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCg==

