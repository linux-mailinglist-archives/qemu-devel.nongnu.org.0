Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3D6AD6DD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:37:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyh-0006pD-9w; Tue, 07 Mar 2023 00:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyR-0006bP-Rm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:56 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyK-0006ZE-1T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:54 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3275DUeB006901; Tue, 7 Mar 2023 05:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/EUUh6iT2GLxy/HWzOs1DxQweIHBP1gBOTxdltIXqSs=;
 b=mo9Woy8V5PkygNfWwPNRt5RI8/a+zYtz6az4dKOtTnFqPwHYVjLQnxqMf9Y83f+uvMR9
 OGm+f2ZNA0DuAbP4hBI0ldXMBphxj8FvKiu+D775t/1YBIg8NVWAXucfIXGkmH7ZQUb0
 EO+mjn/4XjpQcKQRJQz2L8TLy9JsPHavkgVZQEdTXBDAYSrlsTFPzcuHukw6Rr+NRQu2
 C+h00PXrLje0msC9o/mU6BPhwa384FjMiqbYTlBWdjSAeSYe0+QcTlFrdAzdzi8vjtMN
 xD301XsgPZ7ApE27dId4mwMLEPxiOIsTgwE6hCb3tYadwFypSscUkh8Mk+bVeXkH2mfj 9Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p417epx8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275Yhlu000521; 
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3p4fhbm8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275YhM1000506;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3275YgDW000503
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 862383B2; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 01/17] Hexagon (target/hexagon) Restore
 --disable-hexagon-idef-parser build
Date: Mon,  6 Mar 2023 21:34:22 -0800
Message-Id: <20230307053438.2416629-2-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: NKBXWaldSbdo3vgjMBZfZmTe1W45rJIO
X-Proofpoint-GUID: NKBXWaldSbdo3vgjMBZfZmTe1W45rJIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=602 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070050
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

VGhlIC0tZGlzYWJsZS1oZXhhZ29uLWlkZWYtcGFyc2VyIGNvbmZpZ3VyYXRpb24gd2FzIGJyb2tl
biBieSB0aGlzIHBhdGNoCjJmZWFjZjYwYzIzYmE2ICh0YXJnZXQvaGV4YWdvbjogRHJvcCB0Y2df
dGVtcF9mcmVlIGZyb20gQyBjb2RlKQoKVGhhdCBjb25maWcgaXMgbm90IHRlc3RlZCBieSBDSQoK
Rml4IGlzIHNpbXBsZTogTWFyayBhIGZldyBUQ0d2IHZhcmlhYmxlcyBhcyB1bnVzZWQKClNpZ25l
ZC1vZmYtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEFudG9uIEpvaGFuc3NvbiA8YW5qb0ByZXYubmc+Ck1lc3NhZ2UtSWQ6IDwyMDIzMDMwNjE3
MjUxNS4zNDY4MTMtMS10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3Rh
cmdldC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCBiMmU3ODgwYjVjLi5iMTk1NWEwOGYwIDEwMDY0
NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2Vu
X3RjZy5oCkBAIC00MTksMTYgKzQxOSwxNiBAQAogCiAjZGVmaW5lIGZHRU5fVENHX1NUT1JFKFNI
T1JUQ09ERSkgXAogICAgIGRvIHsgXAotICAgICAgICBUQ0d2IEhBTEYgPSB0Y2dfdGVtcF9uZXco
KTsgXAotICAgICAgICBUQ0d2IEJZVEUgPSB0Y2dfdGVtcF9uZXcoKTsgXAorICAgICAgICBUQ0d2
IEhBTEYgR19HTlVDX1VOVVNFRCA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIFRDR3YgQllU
RSBHX0dOVUNfVU5VU0VEID0gdGNnX3RlbXBfbmV3KCk7IFwKICAgICAgICAgU0hPUlRDT0RFOyBc
CiAgICAgfSB3aGlsZSAoMCkKIAogI2RlZmluZSBmR0VOX1RDR19TVE9SRV9wY3IoU0hJRlQsIFNU
T1JFKSBcCiAgICAgZG8geyBcCiAgICAgICAgIFRDR3YgaXJlZyA9IHRjZ190ZW1wX25ldygpOyBc
Ci0gICAgICAgIFRDR3YgSEFMRiA9IHRjZ190ZW1wX25ldygpOyBcCi0gICAgICAgIFRDR3YgQllU
RSA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIFRDR3YgSEFMRiBHX0dOVUNfVU5VU0VEID0g
dGNnX3RlbXBfbmV3KCk7IFwKKyAgICAgICAgVENHdiBCWVRFIEdfR05VQ19VTlVTRUQgPSB0Y2df
dGVtcF9uZXcoKTsgXAogICAgICAgICB0Y2dfZ2VuX21vdl90bChFQSwgUnhWKTsgXAogICAgICAg
ICBnZW5fcmVhZF9pcmVnKGlyZWcsIE11ViwgU0hJRlQpOyBcCiAgICAgICAgIGdlbl9oZWxwZXJf
ZmNpcmNhZGQoUnhWLCBSeFYsIGlyZWcsIE11ViwgaGV4X2dwcltIRVhfUkVHX0NTMCArIE11Tl0p
OyBcCi0tIAoyLjI1LjEKCg==

