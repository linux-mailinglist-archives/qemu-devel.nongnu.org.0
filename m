Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F36EEB86
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:41:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTCQ-0005pY-Pq; Tue, 25 Apr 2023 20:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTCP-0005pN-0c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:39:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTCM-0005hL-C9
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:39:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PLCjai007132; Wed, 26 Apr 2023 00:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=6R77nA7zk3FpQAt5zIY8c78zW9eK3HBEHkTQioHjFbI=;
 b=HQSZAi+ctfYZlv29j7NQ0oLllIY8FdvH19lJZlkMWxPSWKU4OXuM5M2a3PyjpYpeHT6N
 J4BTFhP4SGrNQofGUqKp/M8YdnsBGnBs0K7Sh2dLFSis/Td/qb9NEwOnWiR9yE6Z3hRb
 DpDzZ3beLwwxOXia0CC4rDoEKVgOtphj1pkg3c2aDVCDAnJ+alnSjxlXp9KQYB92wPgH
 U/9okuyK55vHUW37qk+/V5+KcjhcKk67T7LeKPOfuER8c7+B0FTm8z9RwrREPh2Eqcjr
 bLbQ5xI5Bka1ehzSSIlQtseI3no4LkNeaJqaNV0Z9L35YA7dOSN9YtWiukcXT/bF5A6u KA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6brdt6e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:39:50 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0dnJg031135; 
 Wed, 26 Apr 2023 00:39:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3q48nmcyrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:39:49 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0dnjF031130;
 Wed, 26 Apr 2023 00:39:49 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 33Q0dmqt031129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:39:49 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id AEDD2532; Tue, 25 Apr 2023 17:39:48 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 00/21] Hexagon (target/hexagon) short-circuit and move to
 DisasContext
Date: Tue, 25 Apr 2023 17:39:45 -0700
Message-Id: <20230426003945.1318446-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: G_1a0CdeEMRJtRIancNdJo26YCpIQwgJ
X-Proofpoint-GUID: G_1a0CdeEMRJtRIancNdJo26YCpIQwgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=524 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260003
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

VGhpcyBwYXRjaCBzZXJpZXMgYWNoaWV2ZXMgdHdvIG1ham9yIGdvYWxzCkdvYWwgMTogIFNob3J0
LWNpcmN1aXQgcGFja2V0IHNlbWFudGljcwogICAgSW4gY2VydGFpbiBjYXNlcywgd2UgY2FuIGF2
b2lkIHRoZSBvdmVyaGVhZCBvZiB3cml0aW5nIHRvCiAgICBoZXhfbmV3X3ZhbHVlIGFuZCB3cml0
ZSBkaXJlY3RseSB0byBoZXhfZ3ByLgoKICAgIEhlcmUncyBhIHNpbXBsZSBleGFtcGxlIG9mIHRo
ZSBUQ0cgZ2VuZXJhdGVkIGZvcgogICAgMHgwMDQwMDBiNDogIDB4NzgwMGMwMjAgeyAgICAgICBS
MCA9ICMweDEgfQoKICAgIEJFRk9SRToKICAgICAtLS0tIDAwNDAwMGI0CiAgICAgbW92aV9pMzIg
bmV3X3IwLCQweDEKICAgICBtb3ZfaTMyIHIwLG5ld19yMAoKICAgIEFGVEVSOgogICAgIC0tLS0g
MDA0MDAwYjQKICAgICBtb3ZpX2kzMiByMCwkMHgxCkdvYWwgMjogIE1vdmUgYm9va2tlZXBpbmcg
aXRlbXMgZnJvbSBDUFVIZXhhZ29uU3RhdGUgdG8gRGlzYXNDb250ZXh0CiAgICBTdWdnZXN0ZWQt
Ynk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgogICAg
U2V2ZXJhbCBmaWVsZHMgaW4gQ1BVSGV4YWdvblN0YXRlIGFyZSBvbmx5IHVzZWQgZm9yIGJvb2tr
ZWVwaW5nCiAgICB3aXRoaW4gdGhlIHRyYW5zbGF0aW9uIG9mIGEgcGFja2V0LiAgV2l0aCByZWNl
bnQgY2hhbmdlcyB0byBlbGltaW5hdGUKICAgIHRoZSBuZWVkIHRvIGZyZWUgVENHdiB2YXJpYWJs
ZXMsIHRoZXNlIG1ha2UgbW9yZSBzZW5zZSB0byBiZQogICAgdHJhbnNpZW50IGFuZCBrZXB0IGlu
IERpc2FzQ29udGV4dC4KCgpUaGlzIHBhdGNoIHNlcmllcyBjYW4gYmUgZGl2aWRlZCBpbnRvIDMg
bWFpbiBwYXJ0cwpQYXJ0IDE6ICBQYXRjaGVzIDEtOQogICAgQ2xlYW51cCBpbiBwcmVwYXJhdGlv
biBmb3IgcGFydHMgMiBhbmQgMwogICAgVGhlIG1haW4gZ29hbCBpcyB0byBtb3ZlIGZ1bmN0aW9u
YWxpdHkgb3V0IG9mIGdlbmVyYXRlZCBoZWxwZXJzClBhcnQgMjogIFBhdGNoZXMgMTAtMTUKICAg
IFNob3J0LWNpcmN1aXQgcGFja2V0IHNlbWFudGljcwpQYXJ0IDM6ICBQYXRjaGVzIDE2LTIxCiAg
ICBNb3ZlIGJvb2trZWVwaW5nIGl0ZW1zIGZyb20gQ1BVSGV4YWdvblN0YXRlIHRvIERpc2FzQ29u
dGV4dAoKCgpUYXlsb3IgU2ltcHNvbiAoMjEpOgogIG1lc29uLmJ1aWxkIEFkZCBDT05GSUdfSEVY
QUdPTl9JREVGX1BBUlNFUgogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgRGlzYXNDb250
ZXh0IGFyZyB0byBnZW5fbG9nX3JlZ193cml0ZQogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBB
ZGQgb3ZlcnJpZGVzIGZvciBsb29wIHNldHVwIGluc3RydWN0aW9ucwogIEhleGFnb24gKHRhcmdl
dC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBhbGxvY2ZyYW1lL2RlYWxsb2NmcmFtZQogIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBBZGQgb3ZlcnJpZGVzIGZvciBjbHJbdGZdbmV3CiAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIFJlbW92ZSBsb2dfcmVnX3dyaXRlIGZyb20gb3BfaGVscGVy
LltjaF0KICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgRWxpbWluYXRlIHVzZXMgb2YgbG9nX3By
ZWRfd3JpdGUgZnVuY3Rpb24KICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgQ2xlYW4gdXAgcHJl
ZF93cml0dGVuIHVzYWdlCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIERvbid0IG92ZXJsYXAg
ZGVzdCB3cml0ZXMgd2l0aCBzb3VyY2UgcmVhZHMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
TWFyayByZWdpc3RlcnMgYXMgcmVhZCBkdXJpbmcgcGFja2V0IGFuYWx5c2lzCiAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIFNob3J0LWNpcmN1aXQgcGFja2V0IHJlZ2lzdGVyIHdyaXRlcwogIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBTaG9ydC1jaXJjdWl0IHBhY2tldCBwcmVkaWNhdGUgd3Jp
dGVzCiAgSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIFNob3J0LWNpcmN1aXQgcGFja2V0IEhWWCB3
cml0ZXMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgU2hvcnQtY2lyY3VpdCBtb3JlIEhWWCBz
aW5nbGUgaW5zdHJ1Y3Rpb24KICAgIHBhY2tldHMKICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikg
QWRkIG92ZXJyaWRlcyBmb3IgZGlzYWJsZWQgaWRlZi1wYXJzZXIgaW5zbnMKICBIZXhhZ29uICh0
YXJnZXQvaGV4YWdvbikgTWFrZSBzcGVjaWFsIG5ld192YWx1ZSBmb3IgVVNSCiAgSGV4YWdvbiAo
dGFyZ2V0L2hleGFnb24pIE1vdmUgbmV3X3ZhbHVlIHRvIERpc2FzQ29udGV4dAogIEhleGFnb24g
KHRhcmdldC9oZXhhZ29uKSBNb3ZlIG5ld19wcmVkX3ZhbHVlIHRvIERpc2FzQ29udGV4dAogIEhl
eGFnb24gKHRhcmdldC9oZXhhZ29uKSBNb3ZlIHByZWRfd3JpdHRlbiB0byBEaXNhc0NvbnRleHQK
ICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgTW92ZSBwa3RfaGFzX3N0b3JlX3MxIHRvIERpc2Fz
Q29udGV4dAogIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBNb3ZlIGl0ZW1zIHRvIERpc2FzQ29u
dGV4dAoKIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEg
KwogdGFyZ2V0L2hleGFnb24vY3B1LmggICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQog
dGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oICAgICAgICAgICAgICAgICAgICB8IDExOCArKysrKyst
CiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnX2h2eC5oICAgICAgICAgICAgICAgIHwgIDIzICsrCiB0
YXJnZXQvaGV4YWdvbi9nZW5wdHIuaCAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB0YXJn
ZXQvaGV4YWdvbi9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB0YXJnZXQv
aGV4YWdvbi9tYWNyb3MuaCAgICAgICAgICAgICAgICAgICAgIHwgIDU3ICsrLS0KIHRhcmdldC9o
ZXhhZ29uL29wX2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAgMTYgKy0KIHRhcmdldC9oZXhh
Z29uL3RyYW5zbGF0ZS5oICAgICAgICAgICAgICAgICAgfCAgNTIgKystCiB0YXJnZXQvaGV4YWdv
bi9hdHRyaWJzX2RlZi5oLmluYyAgICAgICAgICAgIHwgICA2ICstCiB0YXJnZXQvaGV4YWdvbi9h
cmNoLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiB0YXJnZXQvaGV4YWdvbi9jcHUu
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIu
YyAgICAgICAgICAgICAgICAgICAgIHwgMzQ3ICsrKysrKysrKysrKysrKystLS0tCiB0YXJnZXQv
aGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgICA0ICstCiB0YXJnZXQvaGV4
YWdvbi9vcF9oZWxwZXIuYyAgICAgICAgICAgICAgICAgIHwgMTU0ICsrKysrKy0tLQogdGFyZ2V0
L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICAgICAgICAgICAgICB8IDI3NCArKysrKysrKysrKy0t
LS0tCiB0ZXN0cy90Y2cvaGV4YWdvbi9odnhfbWlzYy5jICAgICAgICAgICAgICAgIHwgIDIxICsr
CiB0ZXN0cy90Y2cvaGV4YWdvbi9yZWFkX3dyaXRlX292ZXJsYXAuYyAgICAgIHwgMTM2ICsrKysr
KysrCiB0YXJnZXQvaGV4YWdvbi9SRUFETUUgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICst
CiB0YXJnZXQvaGV4YWdvbi9nZW5fYW5hbHl6ZV9mdW5jcy5weSAgICAgICAgIHwgIDUxICsrLQog
dGFyZ2V0L2hleGFnb24vZ2VuX2hlbHBlcl9mdW5jcy5weSAgICAgICAgICB8ICAgOSArLQogdGFy
Z2V0L2hleGFnb24vZ2VuX2hlbHBlcl9wcm90b3MucHkgICAgICAgICB8ICAxMCArLQogdGFyZ2V0
L2hleGFnb24vZ2VuX2lkZWZfcGFyc2VyX2Z1bmNzLnB5ICAgICB8ICAgNyArCiB0YXJnZXQvaGV4
YWdvbi9nZW5fdGNnX2Z1bmNzLnB5ICAgICAgICAgICAgIHwgIDIxICstCiB0YXJnZXQvaGV4YWdv
bi9oZXhfY29tbW9uLnB5ICAgICAgICAgICAgICAgIHwgIDE2ICstCiB0ZXN0cy90Y2cvaGV4YWdv
bi9NYWtlZmlsZS50YXJnZXQgICAgICAgICAgIHwgICAxICsKIDI2IGZpbGVzIGNoYW5nZWQsIDEw
NjYgaW5zZXJ0aW9ucygrKSwgMjk0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRl
c3RzL3RjZy9oZXhhZ29uL3JlYWRfd3JpdGVfb3ZlcmxhcC5jCgotLSAKMi4yNS4xCgo=

