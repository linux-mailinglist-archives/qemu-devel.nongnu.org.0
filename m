Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A9701195
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:51:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxac2-0002e3-MD; Fri, 12 May 2023 17:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabr-0002cl-2l
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabn-00065d-VY
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:30 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CLeht6032396; Fri, 12 May 2023 21:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2Hmdz411SWjv7pWuRPjFp5tE58zEPOVD40fQ2PKKY8c=;
 b=VdFbhoq4wpHrLHcoJA9JHq+i3/ixiSe/M62KMB/nBOb9JpG/OOueL4OL0Qg5p+b9vll8
 Ddk88mWZtBvO7xTsT3Tb91LI/XiJ2MVtw2f4oDS9XYqQk4JCOspRd0R2QYKr3ET1SnUP
 p93hMB/kD0znWH7PaqD9A/OTpT6AD8qP2BW3AB4Bhn1YxBKY+StMOZ/mtTiUGjlmDP32
 btXJLLY2QvSKKxLVnscosJDY0nJRc/9nYtSBXvrbXgaVeLC5HHJm+nW9yvYGiq63/CqZ
 VoRZdtrk0Zdx96R2F9tpydtKipk859WnITti0F5QKiGs6H6IF9hzF9Vf/WtMFKvDInbX UQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhpsds1pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLkuQ7001993; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3qh5sk7u5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:24 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlNnH002320;
 Fri, 12 May 2023 21:47:24 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 34CLlNWE002300
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 33A3D6D9; Fri, 12 May 2023 14:47:22 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 32/44] target/hexagon: fix = vs. == mishap
Date: Fri, 12 May 2023 14:46:54 -0700
Message-Id: <20230512214706.946068-33-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 8PgYN13_Lpw9JYyPJ-jUMymq5FPRlmJs
X-Proofpoint-ORIG-GUID: 8PgYN13_Lpw9JYyPJ-jUMymq5FPRlmJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=791 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120183
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

RnJvbTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KCioqKiogQ2hhbmdlcyBp
biB2MiAqKioqCkZpeCB5eWFzc2VydCdzIGZvciBzaWduIGFuZCB6ZXJvIGV4dGVuZHMKCkNvdmVy
aXR5IHJlcG9ydHMgYSBwYXJhbWV0ZXIgdGhhdCBpcyAic2V0IGJ1dCBuZXZlciB1c2VkIi4gIFRo
aXMgaXMgY2F1c2VkCmJ5IGFuIGFzc2lnbm1lbnQgb3BlcmF0b3IgYmVpbmcgdXNlZCBpbnN0ZWFk
IG9mIGVxdWFsaXR5LgoKQ28tYXV0aG9yZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBx
dWljaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KVGVzdGVkLWJ5OiBB
bnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPgpNZXNzYWdlLUlkOiA8MjAyMzA0MjgyMDQ0MTEu
MTQwMDkzMS0xLXRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYt
cGFyc2VyL3BhcnNlci1oZWxwZXJzLmMgfCAyICstCiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNl
ci9pZGVmLXBhcnNlci55ICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9pZGVmLXBh
cnNlci9wYXJzZXItaGVscGVycy5jIGIvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvcGFyc2Vy
LWhlbHBlcnMuYwppbmRleCA5NTUwMDk3MjY5Li43YjVlYmFmZWMyIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jCisrKyBiL3RhcmdldC9oZXhh
Z29uL2lkZWYtcGFyc2VyL3BhcnNlci1oZWxwZXJzLmMKQEAgLTExMjAsNyArMTEyMCw3IEBAIEhl
eFZhbHVlIGdlbl9leHRlbmRfb3AoQ29udGV4dCAqYywKICAgICAgICAgICAgICAgICAgICAgICAg
SGV4VmFsdWUgKnZhbHVlLAogICAgICAgICAgICAgICAgICAgICAgICBIZXhTaWduZWRuZXNzIHNp
Z25lZG5lc3MpCiB7Ci0gICAgdW5zaWduZWQgYml0X3dpZHRoID0gKGRzdF93aWR0aCA9IDY0KSA/
IDY0IDogMzI7CisgICAgdW5zaWduZWQgYml0X3dpZHRoID0gKGRzdF93aWR0aCA9PSA2NCkgPyA2
NCA6IDMyOwogICAgIEhleFZhbHVlIHZhbHVlX20gPSAqdmFsdWU7CiAgICAgSGV4VmFsdWUgc3Jj
X3dpZHRoX20gPSAqc3JjX3dpZHRoOwogCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9pZGVm
LXBhcnNlci9pZGVmLXBhcnNlci55IGIvdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1w
YXJzZXIueQppbmRleCA1ZjM5MDdlYjI4Li41Yzk4Mzk1NGVkIDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9pZGVmLXBhcnNlci9pZGVmLXBhcnNlci55CisrKyBiL3RhcmdldC9oZXhhZ29uL2lk
ZWYtcGFyc2VyL2lkZWYtcGFyc2VyLnkKQEAgLTY4Myw3ICs2ODMsNyBAQCBydmFsdWUgOiBGQUlM
CiAgICAgICAgICAgICAgeXlhc3NlcnQoYywgJkAxLCAkNS50eXBlID09IElNTUVESUFURSAmJgog
ICAgICAgICAgICAgICAgICAgICAgICQ1LmltbS50eXBlID09IFZBTFVFLAogICAgICAgICAgICAg
ICAgICAgICAgICJTWFQgZXhwZWN0cyBpbW1lZGlhdGUgdmFsdWVzXG4iKTsKLSAgICAgICAgICAg
ICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAxLCAmJDMsICQ1LmltbS52YWx1ZSwgJiQ3LCBTSUdO
RUQpOworICAgICAgICAgICAgICQkID0gZ2VuX2V4dGVuZF9vcChjLCAmQDEsICYkMywgNjQsICYk
NywgU0lHTkVEKTsKICAgICAgICAgIH0KICAgICAgICB8IFpYVCAnKCcgcnZhbHVlICcsJyBJTU0g
JywnIHJ2YWx1ZSAnKScKICAgICAgICAgIHsKQEAgLTY5MSw3ICs2OTEsNyBAQCBydmFsdWUgOiBG
QUlMCiAgICAgICAgICAgICAgeXlhc3NlcnQoYywgJkAxLCAkNS50eXBlID09IElNTUVESUFURSAm
JgogICAgICAgICAgICAgICAgICAgICAgICQ1LmltbS50eXBlID09IFZBTFVFLAogICAgICAgICAg
ICAgICAgICAgICAgICJaWFQgZXhwZWN0cyBpbW1lZGlhdGUgdmFsdWVzXG4iKTsKLSAgICAgICAg
ICAgICAkJCA9IGdlbl9leHRlbmRfb3AoYywgJkAxLCAmJDMsICQ1LmltbS52YWx1ZSwgJiQ3LCBV
TlNJR05FRCk7CisgICAgICAgICAgICAgJCQgPSBnZW5fZXh0ZW5kX29wKGMsICZAMSwgJiQzLCA2
NCwgJiQ3LCBVTlNJR05FRCk7CiAgICAgICAgICB9CiAgICAgICAgfCAnKCcgcnZhbHVlICcpJwog
ICAgICAgICAgewotLSAKMi4yNS4xCgo=

