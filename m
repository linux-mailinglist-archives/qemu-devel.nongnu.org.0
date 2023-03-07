Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B26AD52A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZNXJ-0000Rh-Rg; Mon, 06 Mar 2023 21:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNXD-00007R-C0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pZNX9-0005n8-VO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:58:39 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3270o2mg007916; Tue, 7 Mar 2023 02:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4TLbhMxdqbr2oPz/rI1B+eAzLhmIhleiwwnb31Ufx7w=;
 b=ockYonKW8MiLTVPRBGK7oqEbnwF3rhyQYad88JGgfIQLfC51xtjc2jUq6IPUeWDv2Q4N
 RHj+37HH+S2xiR69c0S/F28ZsBDEkKwG4lPKOvCBtjmK182HsiJYTjbRWqGuCQ4p/rCQ
 GC2gv3M34KNSKMgfXKCn9z9ZAEXd1Oel/fyTO4R3By/3M330yweyllh8yfq/m06Hlcp/
 1fAdrWK7Ctf39RsU4gM+ArErk3dOo0CJ6lde+HR/1GGV32MnvhiRQNjA4/qF9/pVIcvg
 T8b4+J5bT8NfMtg7hpZwU+0BswfDmvrVl8gjHIai+M/8/N36ItgmP5x2hDg7cjogrU7P 6A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p419d6p7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:32 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3272tF2l024873; 
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3p4fg0bjtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272wV8n028389;
 Tue, 7 Mar 2023 02:58:31 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3272wU2u028386
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Mar 2023 02:58:31 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id BEF24532; Mon,  6 Mar 2023 18:58:30 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v6 01/14] Hexagon (target/hexagon) Add overrides for jumpr31
 instructions
Date: Mon,  6 Mar 2023 18:58:15 -0800
Message-Id: <20230307025828.1612809-2-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307025828.1612809-1-tsimpson@quicinc.com>
References: <20230307025828.1612809-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Y4WJK6y7dqtsCsJbSv2pWOIn_LUPmN0E
X-Proofpoint-GUID: Y4WJK6y7dqtsCsJbSv2pWOIn_LUPmN0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 mlxlogscore=695 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

QWRkIG92ZXJyaWRlcyBmb3IKICAgIFNMMl9qdW1wcjMxICAgICAgICAgICAgVW5jb25kaXRpb25h
bAogICAgU0wyX2p1bXByMzFfdCAgICAgICAgICBQcmVkaWNhdGVkIHRydWUgKG9sZCB2YWx1ZSkK
ICAgIFNMMl9qdW1wcjMxX2YgICAgICAgICAgUHJlZGljYXRlZCBmYWxzZSAob2xkIHZhbHVlKQog
ICAgU0wyX2p1bXByMzFfdG5ldyAgICAgICBQcmVkaWNhdGVkIHRydWUgKG5ldyB2YWx1ZSkKICAg
IFNMMl9qdW1wcjMxX2ZuZXcgICAgICAgUHJlZGljYXRlZCBmYWxzZSAobmV3IHZhbHVlKQoKU2ln
bmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgpSZXZpZXdl
ZC1ieTogQW50b24gSm9oYW5zc29uIDxhbmpvQHJldi5uZz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggfCAxNSArKysrKysrKysrKysrKy0KIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8
ICA5ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9o
ZXhhZ29uL2dlbl90Y2cuaAppbmRleCBiMmU3ODgwYjVjLi41ZjYxYzk1YjQwIDEwMDY0NAotLS0g
YS90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5o
CkBAIC0xLDUgKzEsNSBAQAogLyoKLSAqICBDb3B5cmlnaHQoYykgMjAxOS0yMDIyIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisgKiAgQ29weXJp
Z2h0KGMpIDIwMTktMjAyMyBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmln
aHRzIFJlc2VydmVkLgogICoKICAqICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQogICogIGl0IHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CkBAIC05
ODYsNiArOTg2LDE5IEBACiAjZGVmaW5lIGZHRU5fVENHX1MyX2FzbF9yX3Jfc2F0KFNIT1JUQ09E
RSkgXAogICAgIGdlbl9hc2xfcl9yX3NhdChSZFYsIFJzViwgUnRWKQogCisjZGVmaW5lIGZHRU5f
VENHX1NMMl9qdW1wcjMxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9qdW1wcihjdHgsIGhleF9ncHJb
SEVYX1JFR19MUl0pCisKKyNkZWZpbmUgZkdFTl9UQ0dfU0wyX2p1bXByMzFfdChTSE9SVENPREUp
IFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0eCwgVENHX0NPTkRfRVEsIGhleF9wcmVkWzBdKQor
I2RlZmluZSBmR0VOX1RDR19TTDJfanVtcHIzMV9mKFNIT1JUQ09ERSkgXAorICAgIGdlbl9jb25k
X2p1bXByMzEoY3R4LCBUQ0dfQ09ORF9ORSwgaGV4X3ByZWRbMF0pCisKKyNkZWZpbmUgZkdFTl9U
Q0dfU0wyX2p1bXByMzFfdG5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0
eCwgVENHX0NPTkRfRVEsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKyNkZWZpbmUgZkdFTl9UQ0df
U0wyX2p1bXByMzFfZm5ldyhTSE9SVENPREUpIFwKKyAgICBnZW5fY29uZF9qdW1wcjMxKGN0eCwg
VENHX0NPTkRfTkUsIGhleF9uZXdfcHJlZF92YWx1ZVswXSkKKwogLyogRmxvYXRpbmcgcG9pbnQg
Ki8KICNkZWZpbmUgZkdFTl9UQ0dfRjJfY29udl9zZjJkZihTSE9SVENPREUpIFwKICAgICBnZW5f
aGVscGVyX2NvbnZfc2YyZGYoUmRkViwgY3B1X2VudiwgUnNWKQpkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwppbmRleCA4NmJkMDkz
Y2U4Li4yYmJlNGUzYTY4IDEwMDY0NAotLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysg
Yi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgQ29weXJp
Z2h0KGMpIDIwMTktMjAyMiBRdWFsY29tbSBJbm5vdmF0aW9uIENlbnRlciwgSW5jLiBBbGwgUmln
aHRzIFJlc2VydmVkLgorICogIENvcHlyaWdodChjKSAyMDE5LTIwMjMgUXVhbGNvbW0gSW5ub3Zh
dGlvbiBDZW50ZXIsIEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICAqCiAgKiAgVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2Rp
ZnkKICAqICBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQpAQCAtNTcxLDYgKzU3MSwxMyBAQCBzdGF0aWMgdm9pZCBnZW5f
Y29uZF9qdW1wcihEaXNhc0NvbnRleHQgKmN0eCwgVENHdiBkc3RfcGMsCiAgICAgZ2VuX3dyaXRl
X25ld19wY19hZGRyKGN0eCwgZHN0X3BjLCBjb25kLCBwcmVkKTsKIH0KIAorc3RhdGljIHZvaWQg
Z2VuX2NvbmRfanVtcHIzMShEaXNhc0NvbnRleHQgKmN0eCwgVENHQ29uZCBjb25kLCBUQ0d2IHBy
ZWQpCit7CisgICAgVENHdiBMU0IgPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICB0Y2dfZ2VuX2FuZGlf
dGwoTFNCLCBwcmVkLCAxKTsKKyAgICBnZW5fY29uZF9qdW1wcihjdHgsIGhleF9ncHJbSEVYX1JF
R19MUl0sIGNvbmQsIExTQik7Cit9CisKIHN0YXRpYyB2b2lkIGdlbl9jb25kX2p1bXAoRGlzYXND
b250ZXh0ICpjdHgsIFRDR0NvbmQgY29uZCwgVENHdiBwcmVkLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgcGNfb2ZmKQogewotLSAKMi4yNS4xCgo=

