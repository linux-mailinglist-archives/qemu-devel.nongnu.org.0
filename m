Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A12B6EEBA5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:46:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTFO-0007oG-8b; Tue, 25 Apr 2023 20:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTFJ-0007lM-2B
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTEy-0006L4-GU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:42:53 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33Q0f54U017628; Wed, 26 Apr 2023 00:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=TD8YvUnXjNJf+UH8HVrOMMZX+qlc8eTuHDNfq3pTPio=;
 b=Qh6ZaO9Bj590a1c8t+3JH8kIUZFhfYfppCXpsHtF8X//JIEBrlNl218xDGDza5EXanlY
 4XgRugYyixVusw0qmqec1KAlJQgHpW3J8c3qnoNWYstAK+JoYMEjk/3fGHV7Jrn5SlJp
 XH+fWvmml0PlmrBcAUPXfvAzuOdgQbTeqMDwo/iMG1gVkwUQZcy30z6S6T+CfPrwCJiq
 iQ8EgwB40xBcFkDsJAQLQM3AUQgUaS0EcMSXadJsTP5/stRHNtbMZaos6vKCuayULxwO
 uBWK07f9ZHtKHbyCtkhVweBeDXH9uMN2KOL/6Ggy55aum0P6SWu4sodp4UJtyHV56rrA PQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6fs2sfbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:20 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gKZ3025010; 
 Wed, 26 Apr 2023 00:42:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmcy55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:20 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0gJJ2025003;
 Wed, 26 Apr 2023 00:42:20 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q0gJBa024995
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:42:19 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 7E2E7532; Tue, 25 Apr 2023 17:42:19 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 09/21] Hexagon (target/hexagon) Don't overlap dest writes with
 source reads
Date: Tue, 25 Apr 2023 17:42:17 -0700
Message-Id: <20230426004217.1319317-1-tsimpson@quicinc.com>
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
X-Proofpoint-GUID: lyzlWkslQeHKY_ssKYvC9WF69vJ2Sl8h
X-Proofpoint-ORIG-GUID: lyzlWkslQeHKY_ssKYvC9WF69vJ2Sl8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=885 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

V2hlbiBnZW5lcmF0aW5nIFRDRywgbWFrZSBzdXJlIHdlIGhhdmUgcmVhZCBhbGwgdGhlIG9wZXJh
bmQgcmVnaXN0ZXJzCmJlZm9yZSB3cml0aW5nIHRvIHRoZSBkZXN0aW5hdGlvbiByZWdpc3RlcnMu
CgpUaGlzIGlzIGEgcHJlcmVxdWVzaXRlIGZvciBzaG9ydC1jaXJjdWl0aW5nIHdoZXJlIHRoZSBz
b3VyY2UgYW5kIGRlc3QKb3BlcmFuZHMgY291bGQgYmUgdGhlIHNhbWUuCgpTaWduZWQtb2ZmLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0tLQogdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRy
LmMKaW5kZXggYjljNGE0NmUzYS4uZTRjMTE2ZWRjMCAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFn
b24vZ2VucHRyLmMKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMKQEAgLTk2OCw2ICs5Njgs
NyBAQCBzdGF0aWMgdm9pZCBnZW5fY21waV9qdW1wbnYoRGlzYXNDb250ZXh0ICpjdHgsCiAvKiBT
aGlmdCBsZWZ0IHdpdGggc2F0dXJhdGlvbiAqLwogc3RhdGljIHZvaWQgZ2VuX3NobF9zYXQoRGlz
YXNDb250ZXh0ICpjdHgsIFRDR3YgZHN0LCBUQ0d2IHNyYywgVENHdiBzaGlmdF9hbXQpCiB7Cisg
ICAgVENHdiB0bXAgPSB0Y2dfdGVtcF9uZXcoKTsgICAgLyogSW4gY2FzZSBkc3QgPT0gc3JjICov
CiAgICAgVENHdiB1c3IgPSBnZXRfcmVzdWx0X2dwcihjdHgsIEhFWF9SRUdfVVNSKTsKICAgICBU
Q0d2IHNoMzIgPSB0Y2dfdGVtcF9uZXcoKTsKICAgICBUQ0d2IGRzdF9zYXIgPSB0Y2dfdGVtcF9u
ZXcoKTsKQEAgLTk5MiwxNyArOTkzLDE3IEBAIHN0YXRpYyB2b2lkIGdlbl9zaGxfc2F0KERpc2Fz
Q29udGV4dCAqY3R4LCBUQ0d2IGRzdCwgVENHdiBzcmMsIFRDR3Ygc2hpZnRfYW10KQogICAgICAq
LwogCiAgICAgdGNnX2dlbl9hbmRpX3RsKHNoMzIsIHNoaWZ0X2FtdCwgMzEpOwotICAgIHRjZ19n
ZW5fbW92Y29uZF90bChUQ0dfQ09ORF9FUSwgZHN0LCBzaDMyLCBzaGlmdF9hbXQsCisgICAgdGNn
X2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCB0bXAsIHNoMzIsIHNoaWZ0X2FtdCwKICAgICAg
ICAgICAgICAgICAgICAgICAgc3JjLCB0Y2dfY29uc3RhbnRfdGwoMCkpOwotICAgIHRjZ19nZW5f
c2hsX3RsKGRzdCwgZHN0LCBzaDMyKTsKLSAgICB0Y2dfZ2VuX3Nhcl90bChkc3Rfc2FyLCBkc3Qs
IHNoMzIpOworICAgIHRjZ19nZW5fc2hsX3RsKHRtcCwgdG1wLCBzaDMyKTsKKyAgICB0Y2dfZ2Vu
X3Nhcl90bChkc3Rfc2FyLCB0bXAsIHNoMzIpOwogICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0df
Q09ORF9MVCwgc2F0dmFsLCBzcmMsIHRjZ19jb25zdGFudF90bCgwKSwgbWluLCBtYXgpOwogCiAg
ICAgdGNnX2dlbl9zZXRjb25kX3RsKFRDR19DT05EX05FLCBvdmYsIGRzdF9zYXIsIHNyYyk7CiAg
ICAgdGNnX2dlbl9zaGxpX3RsKG92Ziwgb3ZmLCByZWdfZmllbGRfaW5mb1tVU1JfT1ZGXS5vZmZz
ZXQpOwogICAgIHRjZ19nZW5fb3JfdGwodXNyLCB1c3IsIG92Zik7CiAKLSAgICB0Y2dfZ2VuX21v
dmNvbmRfdGwoVENHX0NPTkRfRVEsIGRzdCwgZHN0X3Nhciwgc3JjLCBkc3QsIHNhdHZhbCk7Cisg
ICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0VRLCBkc3QsIGRzdF9zYXIsIHNyYywgdG1w
LCBzYXR2YWwpOwogfQogCiBzdGF0aWMgdm9pZCBnZW5fc2FyKFRDR3YgZHN0LCBUQ0d2IHNyYywg
VENHdiBzaGlmdF9hbXQpCkBAIC0xMjI1LDIyICsxMjI2LDI4IEBAIHZvaWQgZ2VuX3NhdF9pMzIo
VENHdiBkZXN0LCBUQ0d2IHNvdXJjZSwgaW50IHdpZHRoKQogCiB2b2lkIGdlbl9zYXRfaTMyX292
ZmwoVENHdiBvdmZsLCBUQ0d2IGRlc3QsIFRDR3Ygc291cmNlLCBpbnQgd2lkdGgpCiB7Ci0gICAg
Z2VuX3NhdF9pMzIoZGVzdCwgc291cmNlLCB3aWR0aCk7Ci0gICAgdGNnX2dlbl9zZXRjb25kX3Rs
KFRDR19DT05EX05FLCBvdmZsLCBzb3VyY2UsIGRlc3QpOworICAgIFRDR3YgdG1wID0gdGNnX3Rl
bXBfbmV3KCk7ICAgIC8qIEluIGNhc2UgZGVzdCA9PSBzb3VyY2UgKi8KKyAgICBnZW5fc2F0X2kz
Mih0bXAsIHNvdXJjZSwgd2lkdGgpOworICAgIHRjZ19nZW5fc2V0Y29uZF90bChUQ0dfQ09ORF9O
RSwgb3ZmbCwgc291cmNlLCB0bXApOworICAgIHRjZ19nZW5fbW92X3RsKGRlc3QsIHRtcCk7CiB9
CiAKIHZvaWQgZ2VuX3NhdHVfaTMyKFRDR3YgZGVzdCwgVENHdiBzb3VyY2UsIGludCB3aWR0aCkK
IHsKKyAgICBUQ0d2IHRtcCA9IHRjZ190ZW1wX25ldygpOyAgICAvKiBJbiBjYXNlIGRlc3QgPT0g
c291cmNlICovCiAgICAgVENHdiBtYXhfdmFsID0gdGNnX2NvbnN0YW50X3RsKCgxIDw8IHdpZHRo
KSAtIDEpOwogICAgIFRDR3YgemVybyA9IHRjZ19jb25zdGFudF90bCgwKTsKLSAgICB0Y2dfZ2Vu
X21vdmNvbmRfdGwoVENHX0NPTkRfR1RVLCBkZXN0LCBzb3VyY2UsIG1heF92YWwsIG1heF92YWws
IHNvdXJjZSk7Ci0gICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRDR19DT05EX0xULCBkZXN0LCBzb3Vy
Y2UsIHplcm8sIHplcm8sIGRlc3QpOworICAgIHRjZ19nZW5fbW92Y29uZF90bChUQ0dfQ09ORF9H
VFUsIHRtcCwgc291cmNlLCBtYXhfdmFsLCBtYXhfdmFsLCBzb3VyY2UpOworICAgIHRjZ19nZW5f
bW92Y29uZF90bChUQ0dfQ09ORF9MVCwgdG1wLCBzb3VyY2UsIHplcm8sIHplcm8sIHRtcCk7Cisg
ICAgdGNnX2dlbl9tb3ZfdGwoZGVzdCwgdG1wKTsKIH0KIAogdm9pZCBnZW5fc2F0dV9pMzJfb3Zm
bChUQ0d2IG92ZmwsIFRDR3YgZGVzdCwgVENHdiBzb3VyY2UsIGludCB3aWR0aCkKIHsKLSAgICBn
ZW5fc2F0dV9pMzIoZGVzdCwgc291cmNlLCB3aWR0aCk7Ci0gICAgdGNnX2dlbl9zZXRjb25kX3Rs
KFRDR19DT05EX05FLCBvdmZsLCBzb3VyY2UsIGRlc3QpOworICAgIFRDR3YgdG1wID0gdGNnX3Rl
bXBfbmV3KCk7ICAgIC8qIEluIGNhc2UgZGVzdCA9PSBzb3VyY2UgKi8KKyAgICBnZW5fc2F0dV9p
MzIodG1wLCBzb3VyY2UsIHdpZHRoKTsKKyAgICB0Y2dfZ2VuX3NldGNvbmRfdGwoVENHX0NPTkRf
TkUsIG92ZmwsIHNvdXJjZSwgdG1wKTsKKyAgICB0Y2dfZ2VuX21vdl90bChkZXN0LCB0bXApOwog
fQogCiB2b2lkIGdlbl9zYXRfaTY0KFRDR3ZfaTY0IGRlc3QsIFRDR3ZfaTY0IHNvdXJjZSwgaW50
IHdpZHRoKQpAQCAtMTI1MywyNyArMTI2MCwzMyBAQCB2b2lkIGdlbl9zYXRfaTY0KFRDR3ZfaTY0
IGRlc3QsIFRDR3ZfaTY0IHNvdXJjZSwgaW50IHdpZHRoKQogCiB2b2lkIGdlbl9zYXRfaTY0X292
ZmwoVENHdiBvdmZsLCBUQ0d2X2k2NCBkZXN0LCBUQ0d2X2k2NCBzb3VyY2UsIGludCB3aWR0aCkK
IHsKKyAgICBUQ0d2X2k2NCB0bXAgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7IC8qIEluIGNhc2UgZGVz
dCA9PSBzb3VyY2UgKi8KICAgICBUQ0d2X2k2NCBvdmZsXzY0OwotICAgIGdlbl9zYXRfaTY0KGRl
c3QsIHNvdXJjZSwgd2lkdGgpOworICAgIGdlbl9zYXRfaTY0KHRtcCwgc291cmNlLCB3aWR0aCk7
CiAgICAgb3ZmbF82NCA9IHRjZ190ZW1wX25ld19pNjQoKTsKLSAgICB0Y2dfZ2VuX3NldGNvbmRf
aTY0KFRDR19DT05EX05FLCBvdmZsXzY0LCBkZXN0LCBzb3VyY2UpOworICAgIHRjZ19nZW5fc2V0
Y29uZF9pNjQoVENHX0NPTkRfTkUsIG92ZmxfNjQsIHRtcCwgc291cmNlKTsKKyAgICB0Y2dfZ2Vu
X21vdl9pNjQoZGVzdCwgdG1wKTsKICAgICB0Y2dfZ2VuX3RydW5jX2k2NF90bChvdmZsLCBvdmZs
XzY0KTsKIH0KIAogdm9pZCBnZW5fc2F0dV9pNjQoVENHdl9pNjQgZGVzdCwgVENHdl9pNjQgc291
cmNlLCBpbnQgd2lkdGgpCiB7CisgICAgVENHdl9pNjQgdG1wID0gdGNnX3RlbXBfbmV3X2k2NCgp
OyAgICAvKiBJbiBjYXNlIGRlc3QgPT0gc291cmNlICovCiAgICAgVENHdl9pNjQgbWF4X3ZhbCA9
IHRjZ19jb25zdGFudF9pNjQoKDFMTCA8PCB3aWR0aCkgLSAxTEwpOwogICAgIFRDR3ZfaTY0IHpl
cm8gPSB0Y2dfY29uc3RhbnRfaTY0KDApOwotICAgIHRjZ19nZW5fbW92Y29uZF9pNjQoVENHX0NP
TkRfR1RVLCBkZXN0LCBzb3VyY2UsIG1heF92YWwsIG1heF92YWwsIHNvdXJjZSk7Ci0gICAgdGNn
X2dlbl9tb3Zjb25kX2k2NChUQ0dfQ09ORF9MVCwgZGVzdCwgc291cmNlLCB6ZXJvLCB6ZXJvLCBk
ZXN0KTsKKyAgICB0Y2dfZ2VuX21vdmNvbmRfaTY0KFRDR19DT05EX0dUVSwgdG1wLCBzb3VyY2Us
IG1heF92YWwsIG1heF92YWwsIHNvdXJjZSk7CisgICAgdGNnX2dlbl9tb3Zjb25kX2k2NChUQ0df
Q09ORF9MVCwgdG1wLCBzb3VyY2UsIHplcm8sIHplcm8sIHRtcCk7CisgICAgdGNnX2dlbl9tb3Zf
aTY0KGRlc3QsIHRtcCk7CiB9CiAKIHZvaWQgZ2VuX3NhdHVfaTY0X292ZmwoVENHdiBvdmZsLCBU
Q0d2X2k2NCBkZXN0LCBUQ0d2X2k2NCBzb3VyY2UsIGludCB3aWR0aCkKIHsKKyAgICBUQ0d2X2k2
NCB0bXAgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7ICAgIC8qIEluIGNhc2UgZGVzdCA9PSBzb3VyY2Ug
Ki8KICAgICBUQ0d2X2k2NCBvdmZsXzY0OwotICAgIGdlbl9zYXR1X2k2NChkZXN0LCBzb3VyY2Us
IHdpZHRoKTsKKyAgICBnZW5fc2F0dV9pNjQodG1wLCBzb3VyY2UsIHdpZHRoKTsKICAgICBvdmZs
XzY0ID0gdGNnX3RlbXBfbmV3X2k2NCgpOwotICAgIHRjZ19nZW5fc2V0Y29uZF9pNjQoVENHX0NP
TkRfTkUsIG92ZmxfNjQsIGRlc3QsIHNvdXJjZSk7CisgICAgdGNnX2dlbl9zZXRjb25kX2k2NChU
Q0dfQ09ORF9ORSwgb3ZmbF82NCwgdG1wLCBzb3VyY2UpOworICAgIHRjZ19nZW5fbW92X2k2NChk
ZXN0LCB0bXApOwogICAgIHRjZ19nZW5fdHJ1bmNfaTY0X3RsKG92ZmwsIG92ZmxfNjQpOwogfQog
Ci0tIAoyLjI1LjEKCg==

