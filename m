Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B6A6AD534
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 04:00:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXL-0000Tn-NH; Mon, 06 Mar 2023 21:58:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXE-0000A6-OK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXA-0005n5-1a
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:40 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3270obCS032160; Tue, 7 Mar 2023 02:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=DzrwYl9J1SE3kUMcpWzQ+MH3ogFaNa678XNvxwH9rSM=;
 b=aqklRVUJhzieXHGN+DtQ7g7PH4q2GwFKT87O4RyYGuZhJZ8ZYk6W8Dxw8ofr8aPRJzoa
 hsyFYiPcRPsEl4S0EbyosN/OquA+fk69ydrq2Ihmn/B046hJszdFFahOF0bHuCUt9ZSJ
 nJnswWccs5AHhur8z1nAK9RU/HRBBSqKFExLh8xCQ6/ZEpQX9MmSDiw/wpMToAa/fRrS
 I7VjMxt/3AtswTotETkLGCEgGELLWTyya8Sb3TUAGpkpHGVYPOBlvuYDpc5PAP10bM7E
 izrb/E7oT87yD5dyRQwBYa7tGYIBCbFvcwKPzlPEjA1mtMKqTren5JNlfJN8ApdxPWaZ /g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41916qp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272qoSd018008; 
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3p4fjsun8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wVP8023780;
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3272wUQP023777
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id BDA7467A; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 00/14] Hexagon: COF overrides, new generator,
 test/bug update
Date: Mon,  6 Mar 2023 18:58:14 -0800
Message-Id: <20230307025828.1612809-1-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8ge_Cp4k5NxfjbX-Ts9ohxXiFvDl1b3U
X-Proofpoint-GUID: 8ge_Cp4k5NxfjbX-Ts9ohxXiFvDl1b3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=728
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070025
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
bnMsIHNvIGFkZApvdmVycmlkZXMKClRoZSBuZXcgdG9vbGNoYWluIGFsbG93cyB1cyB0byBleGVj
dXRlIHRoZSBIVlggdGVzdHMKCk5ldyBnZW5lcmF0b3IgZW5hYmxlcyBzaWduaWZpY2FudCBpbXBy
b3ZlbWVudCB0byBUQ0cgZ2VuZXJhdGlvbiBmb3IKcHJlZGljYXRlZCBpbnN0cnVjdGlvbnMgYnkg
cmVtb3ZpbmcgdGhlIG5lZWQgZm9yIHNsb3RfY2FuY2VsbGVkCgoqKioqIENoYW5nZXMgaW4gdjIg
KioqKgpBZGQgYSBuZXcgZ2VuZXJhdG9yIGZvciBhbmFseXplXzx0YWc+IGluc3RydWN0aW9ucy4g
IFBvdXBsYXRlIHRoZQpEaXNhc0NvbnRleHQgYWhlYWQgb2YgZ2VuZXJhdGluZyBjb2RlLgoKKioq
KiBDaGFuZ2VzIGluIHYzICoqKioKQ2xlYW51cCBvZiBhbmFseXNpcyBjb2RlOgpBZGRlZCB0ZXN0
IHVwZGF0ZXMgZW5hYmxlZCBieSBuZXcgdG9vbGNoYWluIGNvbnRhaW5lcgoKKioqKiBDaGFuZ2Vz
IGluIHY0ICoqKioKQWRkaXRpb25hbCBwYXRjaCBmb3IgYnVnIGZpeApSZW1vdmUgcGt0X2hhc19z
dG9yZV9zMSBmcm9tIHJ1bnRpbWUgc3RhdGUgd2l0aCBkZWFsbG9jLXJldHVybiBwYXRjaApOZXcg
cGF0Y2hlcyB0byB1dGlsaXplIG5ldyBhbmFseXplciB0byBpbXByb3ZlIHByZWRpY2F0ZWQgaW5z
dHJ1Y3Rpb25zCgoqKioqIENoYW5nZXMgaW4gdjUgKioqKgpEb24ndCByZW1vdmUgY29kZSB0aGF0
IGlzIG5lZWRlZCBmb3IgLS1kaXNhYmxlLWhleGFnb24taWRlZi1wYXJzZXIgY29uZmlnCiAgICBw
a3RfaGFzX3N0b3JlX3MxIHJ1bnRpbWUgZmllbGQgYW5kIG1lbV9sb2FkWzEyNDhdIGZ1bmN0aW9u
cwpBZGQgdW5kZXJzdGFuZGluZyBvZiBpZGVmLXBhcnNlciB0byBhbmFseXplcgpBZGRpdGlvbmFs
IHBhdGNoIHRvIGRldGVybWluZSB3aGVuIHBrdF9oYXNfc3RvcmVfczEgbmVlZHMgdG8gYmUgc2V0
ClVwZGF0ZSBmR0VOX1RDR188dGFnPiB0byBwcmVzZXJ2ZSAtLWRpc2FibGUtaGV4YWdvbi1pZGVm
LXBhcnNlciBjb25maWcKICAgIGluIFJlbW92ZSBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRl
W19wYWlyXSBwYXRjaApNb3ZlIHRjZ190ZW1wX2ZyZWVfaTY0IGludG8gZ2VuX2xvZ192cmVnX3dy
aXRlCkFkZCBnZXRfcmVzdWx0X3FyZWcgZnVuY3Rpb24KCioqKiogQ2hhbmdlcyBpbiB2NiAqKioq
CkFkZHJlc3MgZmVlZGJhY2sgZnJvbSBBbnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPgpBZGFw
dCB0byBSaWNoYXJkIEhlbmRlcnNvbidzIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPiBy
ZWNlbnQgcGF0Y2hlcwotIERvbid0IGNhbGwgdGNnX3RlbXBfbG9jYWxfKgotIERvbid0IGNhbGwg
dGNnX3RlbXBfZnJlZV8qCgoKVGF5bG9yIFNpbXBzb24gKDE0KToKICBIZXhhZ29uICh0YXJnZXQv
aGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IganVtcHIzMSBpbnN0cnVjdGlvbnMKICBIZXhhZ29u
ICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgY2FsbHIKICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgZW5kbG9vcDEvZW5kbG9vcDAxCiAgSGV4YWdv
biAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMgZm9yIGRlYWxsb2MtcmV0dXJuIGluc3Ry
dWN0aW9ucwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBbmFseXplIHBhY2tldCBiZWZvcmUg
Z2VuZXJhdGluZyBUQ0cKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgRG9uJ3Qgc2V0IHBrdF9o
YXNfc3RvcmVfczEgd2hlbiBub3QgbmVlZGVkCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFu
YWx5emUgcGFja2V0IGZvciBIVlgKICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgVXBkYXRl
IHByZWdfYWxpYXMuYwogIEhleGFnb24gKHRlc3RzL3RjZy9oZXhhZ29uKSBSZW1vdmUgX19idWls
dGluIGZyb20gc2NhdHRlcl9nYXRoZXIKICBIZXhhZ29uICh0ZXN0cy90Y2cvaGV4YWdvbikgRW5h
YmxlIEhWWCB0ZXN0cwogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBDaGFuZ2Ugc3VidHJhY3Qg
ZnJvbSB6ZXJvIHRvIGNoYW5nZSBzaWduCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlbW92
ZSBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRlW19wYWlyXQogIEhleGFnb24gKHRhcmdldC9o
ZXhhZ29uKSBSZWR1Y2UgbWFuaXB1bGF0aW9uIG9mIHNsb3RfY2FuY2VsbGVkCiAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIEltcHJvdmUgY29kZSBnZW4gZm9yIHByZWRpY2F0ZWQgSFZYCiAgICBp
bnN0cnVjdGlvbnMKCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAgICAgICAgICAgICAgICAgICAg
IHwgICA1ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICAgICAgICAgIHwg
IDgyICsrKy0KIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfaHZ4LmggICAgICAgICAgICAgICAgfCAg
MTcgKy0KIHRhcmdldC9oZXhhZ29uL21hY3Jvcy5oICAgICAgICAgICAgICAgICAgICAgfCAgMjkg
Ky0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAgIDMgKy0K
IHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5oICAgICAgICAgICAgICAgICAgfCAgODYgKystLQog
dGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaC5pbmMgICAgICAgICAgICB8ICAgMSArCiB0YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICAgICAgICAgIHwgMjk2ICsrKysrKy0tLS0t
CiB0YXJnZXQvaGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgIDEyICstCiB0
YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICAgICAgICAgIHwgIDYwICstLQogdGFy
Z2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICB8IDI4OCArKysrKystLS0t
LQogdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jICAgICAgICAgICAgICAgICB8ICAzMSArLQog
dGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jICAgICAgICAgICAgICB8ICAxMCArLQogdGVz
dHMvdGNnL2hleGFnb24vc2NhdHRlcl9nYXRoZXIuYyAgICAgICAgICB8IDUxMyArKysrKysrKysr
Ky0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vUkVBRE1FICAgICAgICAgICAgICAgICAgICAgICB8
ICAzMSArLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkgICAgICAgICB8IDI1
MiArKysrKysrKysrCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX2Z1bmNzLnB5ICAgICAgICAg
IHwgIDE5ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX3Byb3Rvcy5weSAgICAgICAgIHwg
IDEyICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAgICAgICAgIHwgMTUy
ICsrKy0tLQogdGFyZ2V0L2hleGFnb24vaGV4X2NvbW1vbi5weSAgICAgICAgICAgICAgICB8ICAx
MCArLQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIubGV4ICB8ICAgNCAr
LQogdGFyZ2V0L2hleGFnb24vaWRlZi1wYXJzZXIvaWRlZi1wYXJzZXIueSAgICB8ICAgNyArLQog
dGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICB8ICAxMSArLQogdGVz
dHMvdGNnL2hleGFnb24vTWFrZWZpbGUudGFyZ2V0ICAgICAgICAgICB8ICAxMyArLQogMjQgZmls
ZXMgY2hhbmdlZCwgMTIwMSBpbnNlcnRpb25zKCspLCA3NDMgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA3NTUgdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5emVfZnVuY3MucHkKCi0tIAoyLjI1
LjEKCg==

