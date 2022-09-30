Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7025F11C2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 20:44:48 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeL0B-00031c-Am
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 14:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oeKxc-0006i3-Vg
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 14:42:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:14312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1oeKxa-0006Zg-Ct
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 14:42:07 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UI1Xji018536;
 Fri, 30 Sep 2022 18:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Q4QGeJWOvfEP3b7XuAH/cVYJO4BBOzCzxYJrowtZe7w=;
 b=H0y3UIafng0c3fyxHGS86m/QCNOCKC21OvsISe6Z04Y8xYxUhagwUkwsO3yyrRmvc/Oa
 gaP6BsOUfxaFZoBEcsTLu2qMO2n2Rk2gqw1Q8UmUhxt/vQEGxCK1DR9TEBdYUqIPRE1Y
 q50cpu0+N75Mb3X18MqDEiKPaQYBYgZRLAbXQHLq2sbqKaHnoB9V/I7VftdqBx+V3Asr
 aS8t4IxJG1+z2oU6L/OpmbQ4h4c+w7bt0tSGihE8EarJ1EfMxr+BqYplBEUvinZYGQb1
 xq96T5PF3XyQeogs6BZjG42nfqXoRn0IeXKI8+tyKyKcnfkdsGi49sCqs91VNnqNqhzI bw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jwegf40c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 18:42:01 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 28UIbcQ1031462; 
 Fri, 30 Sep 2022 18:42:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 3jwt90jxr4-1;
 Fri, 30 Sep 2022 18:42:00 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UIg01Y003505;
 Fri, 30 Sep 2022 18:42:00 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTP id 28UIg0WI003498;
 Fri, 30 Sep 2022 18:42:00 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 07E325000A7; Fri, 30 Sep 2022 11:42:00 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, f4bug@amsat.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com
Subject: [PULL v2 0/3] Hexagon (target/hexagon) improve store handling
Date: Fri, 30 Sep 2022 11:41:54 -0700
Message-Id: <20220930184157.30429-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: i6OoyiD49xi5GZA_L4r-u5SfWAlmmzby
X-Proofpoint-ORIG-GUID: i6OoyiD49xi5GZA_L4r-u5SfWAlmmzby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 mlxlogscore=432 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300117
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjOGRlNmVjNjNkNzY2Y2ExOTk4YzVh
ZjQ2ODQ4M2NlOTEyZmRjMGMyOgoKICBNZXJnZSB0YWcgJ3B1bGwtcmVxdWVzdC0yMDIyLTA5LTI4
JyBvZiBodHRwczovL2dpdGxhYi5jb20vdGh1dGgvcWVtdSBpbnRvIHN0YWdpbmcgKDIwMjItMDkt
MjggMTc6MDQ6MTEgLTA0MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0YWdzL3B1bGwtaGV4LTIwMjIwOTMw
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNjYxYWQ5OTljNTU0ZDFjYzk5ZmY5NmIz
YmFmM2ZmNGFjYmUyZWNlZToKCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIG1vdmUgc3RvcmUg
c2l6ZSB0cmFja2luZyB0byB0cmFuc2xhdGlvbiAoMjAyMi0wOS0zMCAxMToyNTozNyAtMDcwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KTWFrZSBzdG9yZSBoYW5kbGluZyBmYXN0ZXIgYW5kIG1vcmUgcm9idXN0CgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tClRheWxvciBTaW1wc29uICgzKToKICAgICAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGFk
ZCBpbnN0cnVjdGlvbiBhdHRyaWJ1dGVzIGZyb20gYXJjaGxpYgogICAgICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgQ2hhbmdlIGRlY2lzaW9uIHRvIHNldCBwa3RfaGFzX3N0b3JlX3NbMDFdCiAg
ICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBtb3ZlIHN0b3JlIHNpemUgdHJhY2tpbmcgdG8g
dHJhbnNsYXRpb24KCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgIHwgICA4
ICstLQogdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgICAgICB8ICAzOCArKysrKysr
KysrLQogdGFyZ2V0L2hleGFnb24vZGVjb2RlLmMgICAgICAgICAgICAgICB8ICAxMyArKy0tCiB0
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgIHwgIDM2ICsrKystLS0tLS0KIHRh
cmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgICAgfCAgMzUgKysrKysrKystLQogdGFy
Z2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgICB8ICAgMyArLQogdGFyZ2V0L2hleGFn
b24vaW1wb3J0ZWQvbGRzdC5pZGVmICAgICB8IDEyMiArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tCiB0YXJnZXQvaGV4YWdvbi9pbXBvcnRlZC9zdWJpbnNucy5pZGVmIHwgIDcyICsr
KysrKysrKystLS0tLS0tLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDE5MSBpbnNlcnRpb25zKCspLCAx
MzYgZGVsZXRpb25zKC0pCg==

