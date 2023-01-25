Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1721D67A8EF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVkJ-0006lu-Bu; Tue, 24 Jan 2023 21:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVkB-0006jG-6N
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:35 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pKVk8-00079M-HC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:42:34 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30P2Gijm002862; Wed, 25 Jan 2023 02:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=Npkkt2s5n+wnWg3gQZV/FF7MpZOP+C9Dlmj3tkr5HRE=;
 b=RmpjLXg6lGoQNYJ0sXTuhKXvZUyAAekCaitCEnuZ6ufx0lGQe1/sPT4M6HmjkuXHumI4
 LQ/m4qxxHU2bdUktKXjd17VwtdWy56RzPuQGbACVdPPxghOXBSVJ24U7naI7SM+Yo72C
 68PGsobif5m0XUeP5A00t0fE7qI2Brl2B9dVAfycspIGY8mk/ZaftQzEzpxTy8UVeTBr
 Tt1Yuu5pPu8tZQ0lYw2c8Wj/w2gZkvRGrwmolhdQyBVHD2zzPmqG4W7va5nmDFdw64ff
 2msaWzyA8Fljw3l0mog9Jl9RkxU+GUJLKqzKU/UncDoF9xoh3efdS2cdgIwvr2AwZAd7 TQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89hk6aph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 02:42:18 +0000
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30P2gHdU026506; 
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 3n894kr76n-1;
 Wed, 25 Jan 2023 02:42:17 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30P2gGQP026499;
 Wed, 25 Jan 2023 02:42:17 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 30P2gGhP026496;
 Wed, 25 Jan 2023 02:42:16 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 732C35000A7; Tue, 24 Jan 2023 18:42:16 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v4 00/13] Hexagon: COF overrides, new generator,
 test/bug update
Date: Tue, 24 Jan 2023 18:42:02 -0800
Message-Id: <20230125024215.10430-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 1jFXW-0vNqFqw0TYTHNN_sn8pX1VVVcq
X-Proofpoint-ORIG-GUID: 1jFXW-0vNqFqw0TYTHNN_sn8pX1VVVcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=565 phishscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250020
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
bnMsIHNvIGFkZApvdmVycmlkZXMKCioqKiogQ2hhbmdlcyBpbiB2MiAqKioqCkFkZCBhIG5ldyBn
ZW5lcmF0b3IgZm9yIGFuYWx5emVfPHRhZz4gaW5zdHJ1Y3Rpb25zLiAgUG91cGxhdGUgdGhlCkRp
c2FzQ29udGV4dCBhaGVhZCBvZiBnZW5lcmF0aW5nIGNvZGUuCgoqKioqIENoYW5nZXMgaW4gdjMg
KioqKgpDbGVhbnVwIG9mIGFuYWx5c2lzIGNvZGUKQWRkZWQgdGVzdCB1cGRhdGVzIGVuYWJsZWQg
YnkgbmV3IHRvb2xjaGFpbiBjb250YWluZXIKCioqKiogQ2hhbmdlcyBpbiB2NCAqKioqCkFkZGl0
aW9uYWwgcGF0Y2ggZm9yIGJ1ZyBmaXgKUmVtb3ZlIHBrdF9oYXNfc3RvcmVfczEgZnJvbSBydW50
aW1lIHN0YXRlIHdpdGggZGVhbGxvYy1yZXR1cm4gcGF0Y2gKTmV3IHBhdGNoZXMgdG8gdXRpbGl6
ZSBuZXcgYW5hbHl6ZXIgdG8gaW1wcm92ZSBwcmVkaWNhdGVkIGluc3RydWN0aW9ucwoKClRheWxv
ciBTaW1wc29uICgxMyk6CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlkZXMg
Zm9yIGp1bXByMzEgaW5zdHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBv
dmVycmlkZXMgZm9yIGNhbGxyCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBvdmVycmlk
ZXMgZm9yIGVuZGxvb3AxL2VuZGxvb3AwMQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQg
b3ZlcnJpZGVzIGZvciBkZWFsbG9jLXJldHVybiBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgQW5hbHl6ZSBwYWNrZXQgYmVmb3JlIGdlbmVyYXRpbmcgVENHCiAgSGV4YWdv
biAodGFyZ2V0L2hleGFnb24pIEFuYWx5emUgcGFja2V0IGZvciBIVlgKICBIZXhhZ29uICh0ZXN0
cy90Y2cvaGV4YWdvbikgVXBkYXRlIHByZWdfYWxpYXMuYwogIEhleGFnb24gKHRlc3RzL3RjZy9o
ZXhhZ29uKSBSZW1vdmUgX19idWlsdGluIGZyb20gc2NhdHRlcl9nYXRoZXIKICBIZXhhZ29uICh0
ZXN0cy90Y2cvaGV4YWdvbikgRW5hYmxlIEhWWCB0ZXN0cwogIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uKSBDaGFuZ2Ugc3VidHJhY3QgZnJvbSB6ZXJvIHRvIGNoYW5nZSBzaWduCiAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIFJlbW92ZSBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRlW19wYWly
XQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBSZWR1Y2UgbWFuaXB1bGF0aW9uIG9mIHNsb3Rf
Y2FuY2VsbGVkCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEltcHJvdmUgY29kZSBnZW4gZm9y
IHByZWRpY2F0ZWQgSFZYCiAgICBpbnN0cnVjdGlvbnMKCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgg
ICAgICAgICAgICAgICAgICAgIHwgIDc4ICsrLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odngu
aCAgICAgICAgICAgICAgICB8ICAxNyArLQogdGFyZ2V0L2hleGFnb24vbWFjcm9zLmggICAgICAg
ICAgICAgICAgICAgICB8ICAxNCArLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmggICAgICAg
ICAgICAgICAgICB8ICAgMSAtCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuaCAgICAgICAgICAg
ICAgICAgIHwgIDc2ICstLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAgICAgICAg
ICAgICB8IDMwNyArKysrKysrLS0tLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL3BhcnNl
ci1oZWxwZXJzLmMgfCAgMTIgKy0KIHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAg
ICAgICAgICAgfCAgOTYgKy0tLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAg
ICAgICAgICB8IDI3MSArKysrKystLS0tLQogdGVzdHMvdGNnL2hleGFnb24vZnBzdHVmZi5jICAg
ICAgICAgICAgICAgICB8ICAzMSArLQogdGVzdHMvdGNnL2hleGFnb24vcHJlZ19hbGlhcy5jICAg
ICAgICAgICAgICB8ICAxMCArLQogdGVzdHMvdGNnL2hleGFnb24vc2NhdHRlcl9nYXRoZXIuYyAg
ICAgICAgICB8IDUxMyArKysrKysrKysrKy0tLS0tLS0tLQogdGFyZ2V0L2hleGFnb24vUkVBRE1F
ICAgICAgICAgICAgICAgICAgICAgICB8ICAzOCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX2FuYWx5
emVfZnVuY3MucHkgICAgICAgICB8IDIzNSArKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dlbl90
Y2dfZnVuY3MucHkgICAgICAgICAgICAgfCAxMjggKystLS0KIHRhcmdldC9oZXhhZ29uL2lkZWYt
cGFyc2VyL2lkZWYtcGFyc2VyLmxleCAgfCAgIDQgKy0KIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFy
c2VyL2lkZWYtcGFyc2VyLnkgICAgfCAgIDcgKy0KIHRhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxk
ICAgICAgICAgICAgICAgICAgfCAgMTEgKy0KIHRlc3RzL3RjZy9oZXhhZ29uL01ha2VmaWxlLnRh
cmdldCAgICAgICAgICAgfCAgMTMgKy0KIDIwIGZpbGVzIGNoYW5nZWQsIDEwOTggaW5zZXJ0aW9u
cygrKSwgNzcwIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNzU1IHRhcmdldC9oZXhhZ29u
L2dlbl9hbmFseXplX2Z1bmNzLnB5CgotLSAKMi4xNy4xCgo=

