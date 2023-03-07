Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC276AD6D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 06:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZPyZ-0006jc-F9; Tue, 07 Mar 2023 00:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyM-0006X9-01
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZPyJ-0006Yc-2V
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 00:34:48 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32751N11001629; Tue, 7 Mar 2023 05:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OczhKEgmX9QiOZFj8y6/ABcpVeMnAQsmZmWNEGEE/58=;
 b=Fb/louahiFqQ06OTrXz8C1ncDVBNipVPgKeRjBzHYFzaquo2do7ZANoNffwMo9W1iNyw
 dqXED3CQayx7HuY7CvBYRSyPFaLCLTFie6xBqIMgH21Np2DFGeDTsOkwxFOoFo71Gbac
 JIBZdyRaZCkPEqz4R91c6DJ8/IGAkqLlrSBCE4ZYbua0uc12+Xh//+X7IwCXyM7Zeua2
 9sfVHuyzBqdUNua+eDczDMoK0/EzTp0kKbQyqOySt5IMGdk0WM2SyzWX8K+/SITanwyV
 8P1qYt9Xm71L40zd8555wv2Jn8ijHPMsEuPitc7ME0W/DsObbv0FCQVC3BHnohXLALvm pA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p5rqjru2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:44 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3275VOG8015277; 
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3p4ffd4fyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3275Tv5f011040;
 Tue, 7 Mar 2023 05:34:43 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3275YgFj018550
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 05:34:43 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id 8DB1369B; Mon,  6 Mar 2023 21:34:42 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng
Subject: [PULL 04/17] Hexagon (target/hexagon) Add overrides for jumpr31
 instructions
Date: Mon,  6 Mar 2023 21:34:25 -0800
Message-Id: <20230307053438.2416629-5-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gkAgrzXo9BrOam9K6KP6z387ddBWD38K
X-Proofpoint-GUID: gkAgrzXo9BrOam9K6KP6z387ddBWD38K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=511 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070049
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIFNMMl9qdW1wcjMxICAgICAgICAgICAgVW5jb25kaXRpb25h
bAogICAgU0wyX2p1bXByMzFfdCAgICAgICAgICBQcmVkaWNhdGVkIHRydWUgKG9sZCB2YWx1ZSkK
ICAgIFNMMl9qdW1wcjMxX2YgICAgICAgICAgUHJlZGljYXRlZCBmYWxzZSAob2xkIHZhbHVlKQog
ICAgU0wyX2p1bXByMzFfdG5ldyAgICAgICBQcmVkaWNhdGVkIHRydWUgKG5ldyB2YWx1ZSkKICAg
IFNMMl9qdW1wcjMxX2ZuZXcgICAgICAgUHJlZGljYXRlZCBmYWxzZSAobmV3IHZhbHVlKQoKU2ln
bmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdl
ZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KTWVzc2FnZS1JZDogPDIwMjMwMzA3
MDI1ODI4LjE2MTI4MDktMi10c2ltcHNvbkBxdWljaW5jLmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdv
bi9nZW5fdGNnLmggfCAxNSArKysrKysrKysrKysrKy0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5j
ICB8ICA5ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3Rhcmdl
dC9oZXhhZ29uL2dlbl90Y2cuaAppbmRleCBiMTk1NWEwOGYwLi5mODk4ZjViMzg5IDEwMDY0NAot
LS0gYS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3Rj
Zy5oCkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxj
b21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29w
eXJpZ2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwg
UmlnaHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsg
eW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRoZSB0
ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBA
IC05ODYsNiArOTg2LDE5IEBACiAjZGVmaW5lIGZHRU5fVENHX1MyX2FzbF9yX3Jfc2F0KFNIT1JU
Q09ERSkgXAogICAgIGdlbl9hc2xfcl9yX3NhdChSZFYsIFJzViwgUnRWKQogCisjZGVmaW5lIGZH
RU5fVENHX1NMMl9qdW1wcjMxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9qdW1wcihjdHgsIGhleF9n
cHJbSEVYX1JFR19MUl0pCisKKyNkZWZpbmUgZkdFTl9UQ0dfU0wyX2p1bXByMzFfdChTSE9SVENP
REUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0eCwgVENHX0NPTkRfRVEsIGhleF9wcmVkWzBd
KQorI2RlZmluZSBmR0VOX1RDR19TTDJfanVtcHIzMV9mKFNIT1JUQ09ERSkgXAorICAgIGdlbl9j
b25kX2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9ORSwgaGV4X3ByZWRbMF0pCisKKyNkZWZpbmUgZkdF
Tl9UQ0dfU0wyX2p1bXByMzFfdG5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMx
KGN0eCwgVENHX0NPTkRfRVEsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKyNkZWZpbmUgZkdFTl9U
Q0dfU0wyX2p1bXByMzFfZm5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0
eCwgVENHX0NPTkRfTkUsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKwogLyogRmxvYXRpbmcgcG9p
bnQgKi8KICNkZWZpbmUgZkdFTl9UQ0dfRjJfY29udl9zZjJkZihTSE9SVENPREUpIFwKICAgICBn
ZW5faGVscGVyX2NvbnZfc2YyZGYoUmRkViwgY3B1X2VudiwgUnNWKQpkaWZmIC0tZ2l0IGEvdGFy
Z2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCA4NmJk
MDkzY2U4Li4yYmJlNGUzYTY4IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwor
KysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29w
eXJpZ2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwg
UmlnaHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjMgUXVhbGNvbW0gSW5u
b3ZhdGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBw
cm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBt
b2RpZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNTcxLDYgKzU3MSwxMyBAQCBzdGF0aWMgdm9pZCBn
ZW5fY29uZF9qdW1wcihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBkc3RfcGMsCiAgICAgZ2VuX3dy
aXRlX25ld19wY19hZGRyKGN0eCwgZHN0X3BjLCBjb25kLCBwcmVkKTsKIH0KIAorc3RhdGljIHZv
aWQgZ2VuX2NvbmRfanVtcHIzMShEaXNhc0NvbnRleHQgKmN0eCwgVENHQ29uZCBjb25kLCBUQ0d2
IHByZWQpCit7CisgICAgVENHdiBMU0IgPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICB0Y2dfZ2VuX2Fu
ZGlfdGwoTFNCLCBwcmVkLCAxKTsKKyAgICBnZW5fY29uZF9qdW1wcihjdHgsIGhleF9ncHJbSEVY
X1JFR19MUl0sIGNvbmQsIExTQik7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jb25kX2p1bXAoRGlz
YXNDb250ZXh0ICpjdHgsIFRDR0NvbmQgY29uZCwgVENHdiBwcmVkLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgcGNfb2ZmKQogewotLSAKMi4yNS4xCgo=

