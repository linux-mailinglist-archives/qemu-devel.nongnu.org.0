Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45561A0F6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:28:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2L6-0001cU-Dw; Fri, 04 Nov 2022 15:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kx-0001Y4-QB
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1or2Kt-0002M6-KP
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:26:43 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A4DuNpP020336; Fri, 4 Nov 2022 19:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=wv9J8nwr6XaNw4/yWT31Jogn+yDTqtBC5WfhL4m+UQ4=;
 b=XGnfVVrNjiJigSnPv8ajxNV/F0ZUuUGwgaKJAmb6s9t8EN9yEmH5f+L88gziYa4FRTUR
 B3uXEPNgXaXhCOfqrkIZPNvpY5lirvZ7mN9+glydpySgDowFLuF2hBH25XQraUFgFGbS
 GAYOF5AOh4ykDBfD5cyCjcyAy75yhjSJJNyT495qUuiiBZigAxg0fz4tFtsMDDweIxhh
 h2QpNoa0jOIc1RleSMwP1+aotWrdv08wEz4zrX6baWjdTk3X+ZYoJALr/Xf5Gi9nzZ6c
 2CK6ogH+5Tis90pz5yLvlrs9kJ0lmCDVdc3gelcM8RP8mOlTgRm5hAaJKuwLa61SZrXN sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kn02s9hpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 19:26:36 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4JLPAU029672; 
 Fri, 4 Nov 2022 19:26:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3khdmjykjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 04 Nov 2022 19:26:34 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4JOAA4032407;
 Fri, 4 Nov 2022 19:26:33 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2A4JQXQa001461;
 Fri, 04 Nov 2022 19:26:33 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id EEE8A5000A7; Fri,  4 Nov 2022 12:26:32 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 00/11] Hexagon (target/hexagon) performance and bug fixes
Date: Fri,  4 Nov 2022 12:26:20 -0700
Message-Id: <20221104192631.29434-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: S8nefSlFe4h7DXMvyY2k7OzEZg3ttfhD
X-Proofpoint-GUID: S8nefSlFe4h7DXMvyY2k7OzEZg3ttfhD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=586 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040121
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
YXJ0IGFkZHJlc3MuCgoKKioqKiBDaGFuZ2VzIGluIFYzICoqKioKTWVyZ2UgcHJldmlvdXNseSBl
bWFpbGVkIHBhdGNoZXMgaW50byBzaW5nbGUgc2VyaWVzCk1lcmdlIGZ1bmN0aW9ucyB0aGF0IGNo
ZWNrIGlmIHZyZWcgaXMgcHJlbG9hZGVkCgoqKioqIENoYW5nZXMgaW4gVjIgKioqKgpVcGRhdGUg
dGVzdCBjYXNlIHRvIHVzZSBib3RoIHRydWUgYW5kIGZhbHNlIHByZWRpY2F0ZXMKQWRkIGZpeCBm
b3IgLmN1cgpTaW1wbGlmeSB0ZXN0IGluIG5lZWRfcGt0X2hhc19tdWx0aV9jb2YKQWRkcmVzcyBm
ZWVkYmFjayBmcm9tIE1hdGhldXMgVGF2YXJlcyBCZXJuYXJkaW5vIDxxdWljX21hdGhiZXJuQHF1
aWNpbmMuY29tPgogICAgUmVhcnJhbmdlIG5ldy12YWx1ZS1qdW1wIG92ZXJyaWRlcwogICAgU2lt
cGxpZnkgZ2VuX3dyaXRlX25ld19wY19hZGRyCgoKClRheWxvciBTaW1wc29uICgxMSk6CiAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIEFkZCBwa3QgYW5kIGluc24gdG8gRGlzYXNDb250ZXh0CiAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEZpeCBwcmVkaWNhdGVkIGFzc2lnbm1lbnQgdG8gLnRt
cCBhbmQgLmN1cgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvcgog
ICAgUzJfYXNyX3Jfcl9zYXQvUzJfYXNsX3Jfcl9zYXQKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdv
bikgT25seSB1c2UgYnJhbmNoX3Rha2VuIHdoZW4gcGFja2V0IGhhcyBtdWx0aQogICAgY29mCiAg
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlbW92ZSBQQyBmcm9tIHRoZSBydW50aW1lIHN0YXRl
CiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlbW92ZSBuZXh0X1BDIGZyb20gcnVudGltZSBz
dGF0ZQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBkaXJlY3Qg
Y2FsbCBpbnN0cnVjdGlvbnMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRl
cyBmb3IgY29tcG91bmQgY29tcGFyZSBhbmQganVtcAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29u
KSBBZGQgb3ZlcnJpZGVzIGZvciB2YXJpb3VzIGZvcm1zIG9mIGp1bXAKICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgVXNlIGRpcmVjdCBibG9jayBjaGFpbmluZyBmb3IgZGlyZWN0CiAgICBqdW1w
L2JyYW5jaAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBVc2UgZGlyZWN0IGJsb2NrIGNoYWlu
aW5nIGZvciB0aWdodCBsb29wcwoKIHRhcmdldC9oZXhhZ29uL2NwdS5oICAgICAgICAgICAgICAg
IHwgIDE4ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAgICB8IDQwMCArKysr
KysrKysrKysrKysrKysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZ19odnguaCAgICAg
ICAgfCAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2luc24uaCAgICAgICAgICAgICAgIHwgICA5ICst
CiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICB8ICAxNiArLQogdGFyZ2V0L2hl
eGFnb24vbW12ZWMvbWFjcm9zLmggICAgICAgfCAgIDQgKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5z
bGF0ZS5oICAgICAgICAgIHwgIDIxICstCiB0YXJnZXQvaGV4YWdvbi9kZWNvZGUuYyAgICAgICAg
ICAgICB8ICAxNSArLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAgICAgfCA0MTkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vb3BfaGVscGVyLmMg
ICAgICAgICAgfCAgMjggKy0KIHRhcmdldC9oZXhhZ29uL3RyYW5zbGF0ZS5jICAgICAgICAgIHwg
MjM1ICsrKysrKysrKysrLS0tLS0KIHRlc3RzL3RjZy9oZXhhZ29uL2h2eF9taXNjLmMgICAgICAg
IHwgIDcyICsrKysrCiB0ZXN0cy90Y2cvaGV4YWdvbi91c3IuYyAgICAgICAgICAgICB8ICAzMCAr
LQogdGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9mdW5jcy5weSAgfCAgMTMgKy0KIHRhcmdldC9o
ZXhhZ29uL2dlbl9oZWxwZXJfcHJvdG9zLnB5IHwgIDE0ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5f
dGNnX2Z1bmNzLnB5ICAgICB8ICAzOCArKy0KIHRhcmdldC9oZXhhZ29uL2hleF9jb21tb24ucHkg
ICAgICAgIHwgIDI5ICstCiAxNyBmaWxlcyBjaGFuZ2VkLCAxMjI5IGluc2VydGlvbnMoKyksIDEz
OCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCg==

