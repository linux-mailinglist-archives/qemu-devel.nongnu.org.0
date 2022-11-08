Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB7621964
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRTU-0006lH-NC; Tue, 08 Nov 2022 11:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osRTT-0006kF-4o
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:29:19 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osRTM-0008TT-BL
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:29:18 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8Fqo0E006645; Tue, 8 Nov 2022 16:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=/MqguGudskmNGFlrwPgqdOLFkvpRO/BPoQoE2qTznJ4=;
 b=hQiD9kCaOYZQDxOz1COsFuxhk6tuDLpExQ/hcbIYbULvX7327rNGY8iepLbG+QSifc6a
 XXdSu3W0+O4LD/yBqIg/1sJv4bSyCEEaLdUDv+DGMdnLXclr5xLIUK/EJzW1IYiDSMfG
 0WO7a5pPGUua9WOr+KWhbNe8l2fH778CzhXBvyqydsZAvCCUgbuop6Q2H19Q4VNa8Zn9
 KqZzN4iKG2CkVdoSvAPdCFB/yh3X+GO2Ak4vDgepmDjcC8savRnaELqjFVel0PYDomKU
 g0tlxfAmydiXHPhXnwR3EsDGRooTgWfyDy3JYV9xCGAPKESReGYBQ/Fm4HlUZOWGxUYF zA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqhktsgmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 16:29:09 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8GT8hn017350; 
 Tue, 8 Nov 2022 16:29:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3kngwm4ds9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 08 Nov 2022 16:29:08 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A8GR3xI015085;
 Tue, 8 Nov 2022 16:29:08 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2A8GT7rR017329;
 Tue, 08 Nov 2022 16:29:08 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 985965000A7; Tue,  8 Nov 2022 08:29:07 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v5 00/11] Hexagon (target/hexagon) performance and bug fixes
Date: Tue,  8 Nov 2022 08:28:55 -0800
Message-Id: <20221108162906.3166-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: 1Qc9u2bbFqD2-PaGInISFlJA6gjMzm_y
X-Proofpoint-ORIG-GUID: 1Qc9u2bbFqD2-PaGInISFlJA6gjMzm_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=645 spamscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080101
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

MSkKUGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQKQWRkIHBrdCBhbmQgaW5zbiB0byBEaXNhc0NvbnRl
eHQKTWFueSBmdW5jdGlvbnMgbmVlZCBpbmZvcm1hdGlvbiBmcm9tIGFsbCAzIHN0cnVjdHVyZXMs
IHNvIG1lcmdlCnRoZW0gdG9nZXRoZXIuCgoyKQpCdWcgZml4CkZpeCBwcmVkaWNhdGVkIGFzc2ln
bm1lbnQgdG8gLnRtcCBhbmQgLmN1cgoKCjMpClBlcmZvcm1hbmNlIGltcHJvdmVtZW50CkFkZCBv
dmVycmlkZXMgZm9yIFMyX2Fzcl9yX3Jfc2F0L1MyX2FzbF9yX3Jfc2F0ClRoZXNlIGZ1bmN0aW9u
cyB3aWxsIG5vdCBiZSBoYW5kbGVkIGJ5IGlkZWYtcGFyc2VyCgo0LTExKQpUaGUgZmluYWwgOCBw
YXRjaGVzIGltcHJvdmUgY2hhbmdlLW9mLWZsb3cgaGFuZGxpbmcuCgpDdXJyZW50bHksIHdlIHNl
dCB0aGUgUEMgdG8gYSBuZXcgYWRkcmVzcyBiZWZvcmUgZXhpdGluZyBhIFRCLiAgVGhlCnVsdGlt
YXRlIGdvYWwgaXMgdG8gdXNlIGRpcmVjdCBibG9jayBjaGFpbmluZy4gIEhvd2V2ZXIsIHNldmVy
YWwgc3RlcHMKYXJlIG5lZWRlZCBhbG9uZyB0aGUgd2F5LgoKNCkKV2hlbiBhIHBhY2tldCBoYXMg
bW9yZSB0aGFuIG9uZSBjaGFuZ2Utb2YtZmxvdyAoQ09GKSBpbnN0cnVjdGlvbiwgb25seQp0aGUg
Zmlyc3Qgb25lIHRha2VuIGlzIGNvbnNpZGVyZWQuICBUaGUgcnVudGltZSBib29ra2VlcGluZyBp
cyBvbmx5Cm5lZWRlZCB3aGVuIHRoZXJlIGlzIG1vcmUgdGhhbiBvbmUgQ09GIGluc3RydWN0aW9u
IGluIGEgcGFja2V0LgoKNSwgNikKUmVtb3ZlIFBDIGFuZCBuZXh0X1BDIGZyb20gdGhlIHJ1bnRp
bWUgc3RhdGUgYW5kIGFsd2F5cyB1c2UgYQp0cmFuc2xhdGlvbi10aW1lIGNvbnN0YW50LiAgTm90
ZSB0aGF0IG5leHRfUEMgaXMgdXNlZCBieSBjYWxsIGluc3RydWN0aW9ucwp0byBzZXQgTFIgYW5k
IGJ5IGNvbmRpdGlvbmFsIENPRiBpbnN0cnVjdGlvbnMgdG8gc2V0IHRoZSBmYWxsLXRocm91Z2gK
YWRkcmVzcy4KCjcsIDgsIDkpCkFkZCBoZWxwZXIgb3ZlcnJpZGVzIGZvciBDT0YgaW5zdHJ1Y3Rp
b25zLiAgSW4gcGFydGljdWxhciwgd2UgbXVzdApkaXN0aW5ndWlzaCB0aG9zZSB0aGF0IHVzZSBh
IFBDLXJlbGF0aXZlIGFkZHJlc3MgZm9yIHRoZSBkZXN0aW5hdGlvbi4KVGhlc2UgYXJlIGNhbmRp
ZGF0ZXMgZm9yIGRpcmVjdCBibG9jayBjaGFpbmluZyBsYXRlci4KCjEwKQpVc2UgZGlyZWN0IGJs
b2NrIGNoYWluaW5nIGZvciBwYWNrZXRzIHRoYXQgaGF2ZSBhIHNpbmdsZSBQQy1yZWxhdGl2ZQpD
T0YgaW5zdHJ1Y3Rpb24uICBJbnN0ZWFkIG9mIGdlbmVyYXRpbmcgdGhlIGNvZGUgd2hpbGUgcHJv
Y2Vzc2luZyB0aGUKaW5zdHJ1Y3Rpb24sIHdlIHJlY29yZCB0aGUgZWZmZWN0IGluIERpc2FzQ29u
dGV4dCBhbmQgZ2VuZXJhdGUgdGhlIGNvZGUKZHVyaW5nIGdlbl9lbmRfdGIuCgoxMSkKVXNlIGRp
cmVjdCBibG9jayBjaGFpbmluZyBmb3IgdGlnaHQgbG9vcHMuICBXZSBsb29rIGZvciBUQnMgdGhh
dCBlbmQKd2l0aCBhbiBlbmRsb29wMCB0aGF0IHdpbGwgYnJhbmNoIGJhY2sgdG8gdGhlIFRCIHN0
YXJ0IGFkZHJlc3MuCgoKKioqKiBDaGFuZ2VzIGluIFY1ICoqKioKQWRkcmVzcyBmZWVkYmFjayBm
cm9tIFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgogICAg
SGFuZGxlIG91dC1vZi1yYW5nZSBzaGlmdHMgaW4gZ2VuX3NobF9zYXQKCioqKiogQ2hhbmdlcyBp
biBWNCAqKioqCkFkZHJlc3MgZmVlZGJhY2sgZnJvbSBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KICAgIFJld3JpdGUgZ2VuX3NhdF9pNjQgdG8gYmUgYnJh
bmNobGVzcwogICAgUmV3cml0ZSBnZW5fc2FyIHRvIGJlIGJyYW5jaGxlc3MKICAgIFJld3JpdGUg
Z2VuX3NobF9zYXQgdG8gYmUgYnJhbmNobGVzcwogICAgUGFzcyBicmFuY2ggY29uZGl0aW9uIGlu
c3RlYWQgb2YgZG9pbmcgeG9yIHdoZW4gZmFsc2UKICAgIFVzZSBoZXhfYnJhbmNoX3Rha2VuIHRv
IGhvbGQgdGhlIHByZWRpY2F0ZSBmb3IgZGlyZWN0IGJyYW5jaGVzCiAgICBSZW1vdmUgSGV4U3Rh
dGVGbGFncyBhbmQgdXNlICJody9yZWdpc3RlcmZpZWxkcy5oIiBtYWNyb3MgaW5zdGVhZAoKKioq
KiBDaGFuZ2VzIGluIFYzICoqKioKTWVyZ2UgcHJldmlvdXNseSBlbWFpbGVkIHBhdGNoZXMgaW50
byBzaW5nbGUgc2VyaWVzCk1lcmdlIGZ1bmN0aW9ucyB0aGF0IGNoZWNrIGlmIHZyZWcgaXMgcHJl
bG9hZGVkCgoqKioqIENoYW5nZXMgaW4gVjIgKioqKgpVcGRhdGUgdGVzdCBjYXNlIHRvIHVzZSBi
b3RoIHRydWUgYW5kIGZhbHNlIHByZWRpY2F0ZXMKQWRkIGZpeCBmb3IgLmN1cgpTaW1wbGlmeSB0
ZXN0IGluIG5lZWRfcGt0X2hhc19tdWx0aV9jb2YKQWRkcmVzcyBmZWVkYmFjayBmcm9tIE1hdGhl
dXMgVGF2YXJlcyBCZXJuYXJkaW5vIDxxdWljX21hdGhiZXJuQHF1aWNpbmMuY29tPgogICAgUmVh
cnJhbmdlIG5ldy12YWx1ZS1qdW1wIG92ZXJyaWRlcwogICAgU2ltcGxpZnkgZ2VuX3dyaXRlX25l
d19wY19hZGRyCgoKClRheWxvciBTaW1wc29uICgxMSk6CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIEFkZCBwa3QgYW5kIGluc24gdG8gRGlzYXNDb250ZXh0CiAgSGV4YWdvbiAodGFyZ2V0L2hl
eGFnb24pIEZpeCBwcmVkaWNhdGVkIGFzc2lnbm1lbnQgdG8gLnRtcCBhbmQgLmN1cgogIEhleGFn
b24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvcgogICAgUzJfYXNyX3Jfcl9zYXQv
UzJfYXNsX3Jfcl9zYXQKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgT25seSB1c2UgYnJhbmNo
X3Rha2VuIHdoZW4gcGFja2V0IGhhcyBtdWx0aQogICAgY29mCiAgSGV4YWdvbiAodGFyZ2V0L2hl
eGFnb24pIFJlbW92ZSBQQyBmcm9tIHRoZSBydW50aW1lIHN0YXRlCiAgSGV4YWdvbiAodGFyZ2V0
L2hleGFnb24pIFJlbW92ZSBuZXh0X1BDIGZyb20gcnVudGltZSBzdGF0ZQogIEhleGFnb24gKHRh
cmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBkaXJlY3QgY2FsbCBpbnN0cnVjdGlvbnMK
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgY29tcG91bmQgY29t
cGFyZSBhbmQganVtcAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZv
ciB2YXJpb3VzIGZvcm1zIG9mIGp1bXAKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVXNlIGRp
cmVjdCBibG9jayBjaGFpbmluZyBmb3IgZGlyZWN0CiAgICBqdW1wL2JyYW5jaAogIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSBVc2UgZGlyZWN0IGJsb2NrIGNoYWluaW5nIGZvciB0aWdodCBsb29w
cwoKIHRhcmdldC9oZXhhZ29uL2NwdS5oICAgICAgICAgICAgICAgIHwgIDE0ICstCiB0YXJnZXQv
aGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICB8IDQxNCArKysrKysrKysrKysrKysrKysrKysr
KysrKystCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oICAgICAgICB8ICAgNiArLQogdGFy
Z2V0L2hleGFnb24vaW5zbi5oICAgICAgICAgICAgICAgfCAgIDkgKy0KIHRhcmdldC9oZXhhZ29u
L21hY3Jvcy5oICAgICAgICAgICAgIHwgIDE2ICstCiB0YXJnZXQvaGV4YWdvbi9tbXZlYy9tYWNy
b3MuaCAgICAgICB8ICAgNCArLQogdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmggICAgICAgICAg
fCAgMjAgKy0KIHRhcmdldC9oZXhhZ29uL2RlY29kZS5jICAgICAgICAgICAgIHwgIDE1ICstCiB0
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyAgICAgICAgICAgICB8IDM5MiArKysrKysrKysrKysrKysr
KysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMgICAgICAgICAgfCAgMjggKy0K
IHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgIHwgMjMxICsrKysrKysrKysrLS0t
LS0KIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMgICAgICAgIHwgIDcyICsrKysrCiB0ZXN0
cy90Y2cvaGV4YWdvbi91c3IuYyAgICAgICAgICAgICB8ICAzNCArKy0KIHRhcmdldC9oZXhhZ29u
L2dlbl9oZWxwZXJfZnVuY3MucHkgIHwgIDEzICstCiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVy
X3Byb3Rvcy5weSB8ICAxNCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgICAg
fCAgMzggKystCiB0YXJnZXQvaGV4YWdvbi9oZXhfY29tbW9uLnB5ICAgICAgICB8ICAyOSArLQog
MTcgZmlsZXMgY2hhbmdlZCwgMTIxMSBpbnNlcnRpb25zKCspLCAxMzggZGVsZXRpb25zKC0pCgot
LSAKMi4xNy4xCgo=

