Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC9B6F0EA5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 01:01:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psAb9-0001jb-N7; Thu, 27 Apr 2023 19:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb6-0001hh-BQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1psAb3-0001Kr-O3
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 19:00:20 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RMuN91004207; Thu, 27 Apr 2023 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=s0km/rwl6RXTP7qjDLzDAmoIgh3G1i2o41uXDUJ2itg=;
 b=oJvHg4h3TljP2Wp/o45SnzW9y9FIIffPSxUOMVptwSETTGo6CEbIGbLoZxDiItRTsw7K
 cX2hnKA7qc/+gj9/avXSW9jrwrSsbCM4yIEtOQcd5EiGfTtdHM9T84aeqwmKKDv9JUeL
 Y5/cIyefDPa+HpsNPjcDIqSFhqoiWBz3wG9HXF8NUBJFEBjFeokbIzmBEeBBKujqaB+t
 DXq6b5LIdjZ3Y4TqYw1IajnIas/bDx6nymDyCfKy1u5uZ5TcY1KGxFe1xy4KD4prv+1c
 5v7nk4wTi4/Yeq8IuiQOUjZZjGvP/SX9d10Lh6oavdmOybN9W+d9BlDBpWAQJ9Arc3BA 0Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7thv1574-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:16 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33RN0E1k026452; 
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3q48nmt3xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33RN0EeY026435;
 Thu, 27 Apr 2023 23:00:14 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 33RN0DeO026418
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 23:00:14 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id BD3F2690; Thu, 27 Apr 2023 16:00:13 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v2 04/21] Hexagon (target/hexagon) Add overrides for
 allocframe/deallocframe
Date: Thu, 27 Apr 2023 15:59:55 -0700
Message-Id: <20230427230012.3800327-5-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427230012.3800327-1-tsimpson@quicinc.com>
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: awSvKEzDnHZQODsffhRpX9CK2TayCkxX
X-Proofpoint-ORIG-GUID: awSvKEzDnHZQODsffhRpX9CK2TayCkxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_09,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxlogscore=502
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270202
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

VGhlc2UgaW5zdHJ1Y3Rpb25zIGhhdmUgaW1wbGljaXQgd3JpdGVzIHRvIHJlZ2lzdGVycywgc28g
d2UgZG9uJ3QKd2FudCB0aGVtIHRvIGJlIGhlbHBlcnMgd2hlbiBpZGVmLXBhcnNlciBpcyBvZmYu
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+ClJl
dmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9y
Zz4KLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8IDQ3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhhZ29u
L2dlbl90Y2cuaAppbmRleCA1Nzc0YWY0YTU5Li43YzVjYjkzMjk3IDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBAIC01
MDAsNiArNTAwLDM4IEBACiAjZGVmaW5lIGZHRU5fVENHX1kyX2ljaW52YShTSE9SVENPREUpIFwK
ICAgICBkbyB7IFJzViA9IFJzVjsgfSB3aGlsZSAoMCkKIAorLyoKKyAqIGFsbG9jZnJhbWUoI3Vp
VikKKyAqICAgICBSeFYgPT0gcjI5CisgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfUzJfYWxsb2NmcmFt
ZShTSE9SVENPREUpIFwKKyAgICBnZW5fYWxsb2NmcmFtZShjdHgsIFJ4ViwgdWlWKQorCisvKiBz
dWItaW5zdHJ1Y3Rpb24gdmVyc2lvbiAobm8gUnhWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkpICov
CisjZGVmaW5lIGZHRU5fVENHX1NTMl9hbGxvY2ZyYW1lKFNIT1JUQ09ERSkgXAorICAgIGRvIHsg
XAorICAgICAgICBUQ0d2IHIyOSA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIHRjZ19nZW5f
bW92X3RsKHIyOSwgaGV4X2dwcltIRVhfUkVHX1NQXSk7IFwKKyAgICAgICAgZ2VuX2FsbG9jZnJh
bWUoY3R4LCByMjksIHVpVik7IFwKKyAgICAgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhf
UkVHX1NQLCByMjkpOyBcCisgICAgfSB3aGlsZSAoMCkKKworLyoKKyAqIFJkZDMyID0gZGVhbGxv
Y2ZyYW1lKFJzMzIpOnJhdworICogICAgIFJkZFYgPT0gcjMxOjMwCisgKiAgICAgUnNWICA9PSBy
MzAKKyAqLworI2RlZmluZSBmR0VOX1RDR19MMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBcCisg
ICAgZ2VuX2RlYWxsb2NmcmFtZShjdHgsIFJkZFYsIFJzVikKKworLyogc3ViLWluc3RydWN0aW9u
IHZlcnNpb24gKG5vIFJkZFYvUnNWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkpICovCisjZGVmaW5l
IGZHRU5fVENHX1NMMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAg
ICAgIFRDR3ZfaTY0IHIzMV8zMCA9IHRjZ190ZW1wX25ld19pNjQoKTsgXAorICAgICAgICBnZW5f
ZGVhbGxvY2ZyYW1lKGN0eCwgcjMxXzMwLCBoZXhfZ3ByW0hFWF9SRUdfRlBdKTsgXAorICAgICAg
ICBnZW5fbG9nX3JlZ193cml0ZV9wYWlyKGN0eCwgSEVYX1JFR19GUCwgcjMxXzMwKTsgXAorICAg
IH0gd2hpbGUgKDApCisKIC8qCiAgKiBkZWFsbG9jX3JldHVybgogICogQXNzZW1ibGVyIG1hcHBl
ZCB0bwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYwppbmRleCA0YzM0ZGE4NDA3Li40M2Y2YzZmYjlmIDEwMDY0NAotLS0gYS90YXJn
ZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtNzA5
LDYgKzcwOSwxOCBAQCBzdGF0aWMgdm9pZCBnZW5fY29uZF9jYWxscihEaXNhc0NvbnRleHQgKmN0
eCwKICAgICBnZW5fc2V0X2xhYmVsKHNraXApOwogfQogCisjaWZuZGVmIENPTkZJR19IRVhBR09O
X0lERUZfUEFSU0VSCisvKiBmcmFtZSA9ICgoTFIgPDwgMzIpIHwgRlApIF4gKEZSQU1FS0VZIDw8
IDMyKSkgKi8KK3N0YXRpYyBUQ0d2X2k2NCBnZW5fZnJhbWVfc2NyYW1ibGUodm9pZCkKK3sKKyAg
ICBUQ0d2X2k2NCBmcmFtZSA9IHRjZ190ZW1wX25ld19pNjQoKTsKKyAgICBUQ0d2IHRtcCA9IHRj
Z190ZW1wX25ldygpOworICAgIHRjZ19nZW5feG9yX3RsKHRtcCwgaGV4X2dwcltIRVhfUkVHX0xS
XSwgaGV4X2dwcltIRVhfUkVHX0ZSQU1FS0VZXSk7CisgICAgdGNnX2dlbl9jb25jYXRfaTMyX2k2
NChmcmFtZSwgaGV4X2dwcltIRVhfUkVHX0ZQXSwgdG1wKTsKKyAgICByZXR1cm4gZnJhbWU7Cit9
CisjZW5kaWYKKwogLyogZnJhbWUgXj0gKGludDY0X3QpRlJBTUVLRVkgPDwgMzIgKi8KIHN0YXRp
YyB2b2lkIGdlbl9mcmFtZV91bnNjcmFtYmxlKFRDR3ZfaTY0IGZyYW1lKQogewpAQCAtNzI1LDYg
KzczNyw0MSBAQCBzdGF0aWMgdm9pZCBnZW5fbG9hZF9mcmFtZShEaXNhc0NvbnRleHQgKmN0eCwg
VENHdl9pNjQgZnJhbWUsIFRDR3YgRUEpCiAgICAgdGNnX2dlbl9xZW11X2xkNjQoZnJhbWUsIEVB
LCBjdHgtPm1lbV9pZHgpOwogfQogCisjaWZuZGVmIENPTkZJR19IRVhBR09OX0lERUZfUEFSU0VS
CisvKiBTdGFjayBvdmVyZmxvdyBjaGVjayAqLworc3RhdGljIHZvaWQgZ2VuX2ZyYW1lY2hlY2so
VENHdiBFQSwgaW50IGZyYW1lc2l6ZSkKK3sKKyAgICAvKiBOb3QgbW9kZWxsZWQgaW4gbGludXgt
dXNlciBtb2RlICovCisgICAgLyogUGxhY2Vob2xkZXIgZm9yIHN5c3RlbSBtb2RlICovCisjaWZu
ZGVmIENPTkZJR19VU0VSX09OTFkKKyAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOworI2VuZGlm
Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9hbGxvY2ZyYW1lKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2
IHIyOSwgaW50IGZyYW1lc2l6ZSkKK3sKKyAgICBUQ0d2IHIzMCA9IHRjZ190ZW1wX25ldygpOwor
ICAgIFRDR3ZfaTY0IGZyYW1lOworICAgIHRjZ19nZW5fYWRkaV90bChyMzAsIHIyOSwgLTgpOwor
ICAgIGZyYW1lID0gZ2VuX2ZyYW1lX3NjcmFtYmxlKCk7CisgICAgZ2VuX3N0b3JlOChjcHVfZW52
LCByMzAsIGZyYW1lLCBjdHgtPmluc24tPnNsb3QpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0
eCwgSEVYX1JFR19GUCwgcjMwKTsKKyAgICBnZW5fZnJhbWVjaGVjayhyMzAsIGZyYW1lc2l6ZSk7
CisgICAgdGNnX2dlbl9zdWJpX3RsKHIyOSwgcjMwLCBmcmFtZXNpemUpOworfQorCitzdGF0aWMg
dm9pZCBnZW5fZGVhbGxvY2ZyYW1lKERpc2FzQ29udGV4dCAqY3R4LCBUQ0d2X2k2NCByMzFfMzAs
IFRDR3YgcjMwKQoreworICAgIFRDR3YgcjI5ID0gdGNnX3RlbXBfbmV3KCk7CisgICAgVENHdl9p
NjQgZnJhbWUgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7CisgICAgZ2VuX2xvYWRfZnJhbWUoY3R4LCBm
cmFtZSwgcjMwKTsKKyAgICBnZW5fZnJhbWVfdW5zY3JhbWJsZShmcmFtZSk7CisgICAgdGNnX2dl
bl9tb3ZfaTY0KHIzMV8zMCwgZnJhbWUpOworICAgIHRjZ19nZW5fYWRkaV90bChyMjksIHIzMCwg
OCk7CisgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX1NQLCByMjkpOworfQorI2Vu
ZGlmCisKIHN0YXRpYyB2b2lkIGdlbl9yZXR1cm4oRGlzYXNDb250ZXh0ICpjdHgsIFRDR3ZfaTY0
IGRzdCwgVENHdiBzcmMpCiB7CiAgICAgLyoKLS0gCjIuMjUuMQoK

