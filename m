Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0F2620809
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 05:08:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osFsH-000702-9T; Mon, 07 Nov 2022 23:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osFsA-0006y2-NC
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:06:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1osFs8-00073k-FM
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:06:02 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A834woC009015; Tue, 8 Nov 2022 04:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=wEd3MNQONA2FwkvbbSc7ibV6oIfSjgkNDStKjW2cALg=;
 b=FiqLotuJG8R9VfDYcZBRmABsvhLbnTFOBWitVK7EwpBXUd1zGtO6iMAIcAbzBNn8MppK
 Lb4u2HXXR08dMNbH0GEe6OmHlo0C/3oR4e83fBLULM/muzZn5rmPNZhQ5r60mAucXW56
 /p8pOMKMHaUAMLI4ZnWlxPp4EQUCvYOOBW0Idk62EIXDdaM3dh3ME8Rw7PtxC/roj+dX
 3/7NlZdvobcxxumguZUUprSoX51tdTiWttyG1ihuNasPXVDg66l0lldJcUQh+snkXQnk
 ZwAO+nYmER0re/o0s4VsKK9j4EJf8G0JF7kJ3GVbAfiOQ6/WMS6Zy7wWqyAL31zNMPDn fQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kq5yq98qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 04:05:56 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A83wPmn017368; 
 Tue, 8 Nov 2022 04:05:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3kngwm1v8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 08 Nov 2022 04:05:55 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A841wMk022039;
 Tue, 8 Nov 2022 04:05:54 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 2A845sO3025731;
 Tue, 08 Nov 2022 04:05:54 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 11DA35000A7; Mon,  7 Nov 2022 20:05:54 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v4 00/11] Hexagon (target/hexagon) performance and bug fixes
Date: Mon,  7 Nov 2022 20:05:41 -0800
Message-Id: <20221108040552.22175-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: pmhmOQjrigLzfErnsOdNS9Op_HXieU-B
X-Proofpoint-ORIG-GUID: pmhmOQjrigLzfErnsOdNS9Op_HXieU-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=671 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080020
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
YXJ0IGFkZHJlc3MuCgoKKioqKiBDaGFuZ2VzIGluIFY0ICoqKioKQWRkcmVzcyBmZWVkYmFjayBm
cm9tIFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgogICAg
UmV3cml0ZSBnZW5fc2F0X2k2NCB0byBiZSBicmFuY2hsZXNzCiAgICBSZXdyaXRlIGdlbl9zYXIg
dG8gYmUgYnJhbmNobGVzcwogICAgUmV3cml0ZSBnZW5fc2hsX3NhdCB0byBiZSBicmFuY2hsZXNz
CiAgICBQYXNzIGJyYW5jaCBjb25kaXRpb24gaW5zdGVhZCBvZiBkb2luZyB4b3Igd2hlbiBmYWxz
ZQogICAgVXNlIGhleF9icmFuY2hfdGFrZW4gdG8gaG9sZCB0aGUgcHJlZGljYXRlIGZvciBkaXJl
Y3QgYnJhbmNoZXMKICAgIFJlbW92ZSBIZXhTdGF0ZUZsYWdzIGFuZCB1c2UgImh3L3JlZ2lzdGVy
ZmllbGRzLmgiIG1hY3JvcyBpbnN0ZWFkCgoqKioqIENoYW5nZXMgaW4gVjMgKioqKgpNZXJnZSBw
cmV2aW91c2x5IGVtYWlsZWQgcGF0Y2hlcyBpbnRvIHNpbmdsZSBzZXJpZXMKTWVyZ2UgZnVuY3Rp
b25zIHRoYXQgY2hlY2sgaWYgdnJlZyBpcyBwcmVsb2FkZWQKCioqKiogQ2hhbmdlcyBpbiBWMiAq
KioqClVwZGF0ZSB0ZXN0IGNhc2UgdG8gdXNlIGJvdGggdHJ1ZSBhbmQgZmFsc2UgcHJlZGljYXRl
cwpBZGQgZml4IGZvciAuY3VyClNpbXBsaWZ5IHRlc3QgaW4gbmVlZF9wa3RfaGFzX211bHRpX2Nv
ZgpBZGRyZXNzIGZlZWRiYWNrIGZyb20gTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8gPHF1aWNf
bWF0aGJlcm5AcXVpY2luYy5jb20+CiAgICBSZWFycmFuZ2UgbmV3LXZhbHVlLWp1bXAgb3ZlcnJp
ZGVzCiAgICBTaW1wbGlmeSBnZW5fd3JpdGVfbmV3X3BjX2FkZHIKCgpUYXlsb3IgU2ltcHNvbiAo
MTEpOgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgcGt0IGFuZCBpbnNuIHRvIERpc2Fz
Q29udGV4dAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBGaXggcHJlZGljYXRlZCBhc3NpZ25t
ZW50IHRvIC50bXAgYW5kIC5jdXIKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJy
aWRlcyBmb3IKICAgIFMyX2Fzcl9yX3Jfc2F0L1MyX2FzbF9yX3Jfc2F0CiAgSGV4YWdvbiAodGFy
Z2V0L2hleGFnb24pIE9ubHkgdXNlIGJyYW5jaF90YWtlbiB3aGVuIHBhY2tldCBoYXMgbXVsdGkK
ICAgIGNvZgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBSZW1vdmUgUEMgZnJvbSB0aGUgcnVu
dGltZSBzdGF0ZQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBSZW1vdmUgbmV4dF9QQyBmcm9t
IHJ1bnRpbWUgc3RhdGUKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBm
b3IgZGlyZWN0IGNhbGwgaW5zdHJ1Y3Rpb25zCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIEFk
ZCBvdmVycmlkZXMgZm9yIGNvbXBvdW5kIGNvbXBhcmUgYW5kIGp1bXAKICBIZXhhZ29uICh0YXJn
ZXQvaGV4YWdvbikgQWRkIG92ZXJyaWRlcyBmb3IgdmFyaW91cyBmb3JtcyBvZiBqdW1wCiAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIFVzZSBkaXJlY3QgYmxvY2sgY2hhaW5pbmcgZm9yIGRpcmVj
dAogICAganVtcC9icmFuY2gKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVXNlIGRpcmVjdCBi
bG9jayBjaGFpbmluZyBmb3IgdGlnaHQgbG9vcHMKCiB0YXJnZXQvaGV4YWdvbi9jcHUuaCAgICAg
ICAgICAgICAgICB8ICAxNCArLQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAg
fCA0MTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogdGFyZ2V0L2hleGFnb24vZ2VuX3Rj
Z19odnguaCAgICAgICAgfCAgIDYgKy0KIHRhcmdldC9oZXhhZ29uL2luc24uaCAgICAgICAgICAg
ICAgIHwgICA5ICstCiB0YXJnZXQvaGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICB8ICAxNiAr
LQogdGFyZ2V0L2hleGFnb24vbW12ZWMvbWFjcm9zLmggICAgICAgfCAgIDQgKy0KIHRhcmdldC9o
ZXhhZ29uL3RyYW5zbGF0ZS5oICAgICAgICAgIHwgIDIwICstCiB0YXJnZXQvaGV4YWdvbi9kZWNv
ZGUuYyAgICAgICAgICAgICB8ICAxNSArLQogdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAg
ICAgICAgfCAzOTIgKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHRhcmdldC9oZXhhZ29uL29w
X2hlbHBlci5jICAgICAgICAgIHwgIDI4ICstCiB0YXJnZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAg
ICAgICAgICB8IDIzMSArKysrKysrKysrKy0tLS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlz
Yy5jICAgICAgICB8ICA3MiArKysrKwogdGVzdHMvdGNnL2hleGFnb24vdXNyLmMgICAgICAgICAg
ICAgfCAgMzAgKy0KIHRhcmdldC9oZXhhZ29uL2dlbl9oZWxwZXJfZnVuY3MucHkgIHwgIDEzICst
CiB0YXJnZXQvaGV4YWdvbi9nZW5faGVscGVyX3Byb3Rvcy5weSB8ICAxNCArLQogdGFyZ2V0L2hl
eGFnb24vZ2VuX3RjZ19mdW5jcy5weSAgICAgfCAgMzggKystCiB0YXJnZXQvaGV4YWdvbi9oZXhf
Y29tbW9uLnB5ICAgICAgICB8ICAyOSArLQogMTcgZmlsZXMgY2hhbmdlZCwgMTIwNyBpbnNlcnRp
b25zKCspLCAxMzggZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgo=

