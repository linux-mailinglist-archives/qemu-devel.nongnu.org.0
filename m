Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF96EEB8E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 02:43:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prTE6-0006nI-CW; Tue, 25 Apr 2023 20:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTE3-0006mf-HN
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1prTE1-0006AQ-Pp
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 20:41:39 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PNlUbS005175; Wed, 26 Apr 2023 00:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=AYpnu9D9DbBK1nYABjoi+vfyfbSE1hAcQQpsiPAZsMw=;
 b=LCnm4M22kZHeM8J6QMD1HM87ODdfas5/EkMkPdSvszBTv1nJHb4zvr8+G+YivltGFazc
 1qvmJpNvSeU8vStE7hO8A1JYJo0rgucoMJnz+HogtqpJYTxnIfBaAZK19DTXhmbzdgtC
 5OeVmeMu2wiIZrAwclWGDeDxQRbeL5Uy005Y/T5vUNbD/HMHXCmd/rNDzOnHnZEefS8K
 GREMPotkd5bTzGNZ3Yd+ZNUyJhvUVp3eAxdLHLnbGsoOI2dV0EVJ4KqkBSi0GeC2xohK
 TJR1BvTusvM0tBUrOu3EdM7ZAS3ylsycvC5THEjN8PZJE8htjJV12epH+DwPy0RYH47F Fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q6f6cskky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:33 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 33Q0eKll023344; 
 Wed, 26 Apr 2023 00:41:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q48nmcy1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:32 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33Q0fW6Q024207;
 Wed, 26 Apr 2023 00:41:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 33Q0fVcU024206
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 00:41:32 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id D9D03532; Tue, 25 Apr 2023 17:41:31 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH 04/21] Hexagon (target/hexagon) Add overrides for
 allocframe/deallocframe
Date: Tue, 25 Apr 2023 17:41:30 -0700
Message-Id: <20230426004130.1318973-1-tsimpson@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GqG3ezlUh3LsI5vAwlZnbA6pnA_Fz1uL
X-Proofpoint-GUID: GqG3ezlUh3LsI5vAwlZnbA6pnA_Fz1uL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=475
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260004
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
CgpTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+Ci0t
LQogdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8IDQ0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhhZ29uL2dl
bl90Y2cuaAppbmRleCA1Nzc0YWY0YTU5Li43YzVjYjkzMjk3IDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBAIC01MDAs
NiArNTAwLDM4IEBACiAjZGVmaW5lIGZHRU5fVENHX1kyX2ljaW52YShTSE9SVENPREUpIFwKICAg
ICBkbyB7IFJzViA9IFJzVjsgfSB3aGlsZSAoMCkKIAorLyoKKyAqIGFsbG9jZnJhbWUoI3VpVikK
KyAqICAgICBSeFYgPT0gcjI5CisgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfUzJfYWxsb2NmcmFtZShT
SE9SVENPREUpIFwKKyAgICBnZW5fYWxsb2NmcmFtZShjdHgsIFJ4ViwgdWlWKQorCisvKiBzdWIt
aW5zdHJ1Y3Rpb24gdmVyc2lvbiAobm8gUnhWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkpICovCisj
ZGVmaW5lIGZHRU5fVENHX1NTMl9hbGxvY2ZyYW1lKFNIT1JUQ09ERSkgXAorICAgIGRvIHsgXAor
ICAgICAgICBUQ0d2IHIyOSA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIHRjZ19nZW5fbW92
X3RsKHIyOSwgaGV4X2dwcltIRVhfUkVHX1NQXSk7IFwKKyAgICAgICAgZ2VuX2FsbG9jZnJhbWUo
Y3R4LCByMjksIHVpVik7IFwKKyAgICAgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBIRVhfUkVH
X1NQLCByMjkpOyBcCisgICAgfSB3aGlsZSAoMCkKKworLyoKKyAqIFJkZDMyID0gZGVhbGxvY2Zy
YW1lKFJzMzIpOnJhdworICogICAgIFJkZFYgPT0gcjMxOjMwCisgKiAgICAgUnNWICA9PSByMzAK
KyAqLworI2RlZmluZSBmR0VOX1RDR19MMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBcCisgICAg
Z2VuX2RlYWxsb2NmcmFtZShjdHgsIFJkZFYsIFJzVikKKworLyogc3ViLWluc3RydWN0aW9uIHZl
cnNpb24gKG5vIFJkZFYvUnNWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkpICovCisjZGVmaW5lIGZH
RU5fVENHX1NMMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisgICAgICAg
IFRDR3ZfaTY0IHIzMV8zMCA9IHRjZ190ZW1wX25ld19pNjQoKTsgXAorICAgICAgICBnZW5fZGVh
bGxvY2ZyYW1lKGN0eCwgcjMxXzMwLCBoZXhfZ3ByW0hFWF9SRUdfRlBdKTsgXAorICAgICAgICBn
ZW5fbG9nX3JlZ193cml0ZV9wYWlyKGN0eCwgSEVYX1JFR19GUCwgcjMxXzMwKTsgXAorICAgIH0g
d2hpbGUgKDApCisKIC8qCiAgKiBkZWFsbG9jX3JldHVybgogICogQXNzZW1ibGVyIG1hcHBlZCB0
bwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4YWdvbi9n
ZW5wdHIuYwppbmRleCA0YzM0ZGE4NDA3Li41NzA3NzBiN2Q1IDEwMDY0NAotLS0gYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAtNzA5LDYg
KzcwOSwxOCBAQCBzdGF0aWMgdm9pZCBnZW5fY29uZF9jYWxscihEaXNhc0NvbnRleHQgKmN0eCwK
ICAgICBnZW5fc2V0X2xhYmVsKHNraXApOwogfQogCisjaWZuZGVmIENPTkZJR19IRVhBR09OX0lE
RUZfUEFSU0VSCisvKiBmcmFtZSA9ICgoTFIgPDwgMzIpIHwgRlApIF4gKEZSQU1FS0VZIDw8IDMy
KSkgKi8KK3N0YXRpYyB2b2lkIGdlbl9mcmFtZV9zY3JhbWJsZShUQ0d2X2k2NCByZXN1bHQpCit7
CisgICAgVENHdl9pNjQgZnJhbWVrZXkgPSB0Y2dfdGVtcF9uZXdfaTY0KCk7CisgICAgdGNnX2dl
bl9leHR1X2kzMl9pNjQoZnJhbWVrZXksIGhleF9ncHJbSEVYX1JFR19GUkFNRUtFWV0pOworICAg
IHRjZ19nZW5fc2hsaV9pNjQoZnJhbWVrZXksIGZyYW1la2V5LCAzMik7CisgICAgdGNnX2dlbl9j
b25jYXRfaTMyX2k2NChyZXN1bHQsIGhleF9ncHJbSEVYX1JFR19GUF0sIGhleF9ncHJbSEVYX1JF
R19MUl0pOworICAgIHRjZ19nZW5feG9yX2k2NChyZXN1bHQsIHJlc3VsdCwgZnJhbWVrZXkpOwor
fQorI2VuZGlmCisKIC8qIGZyYW1lIF49IChpbnQ2NF90KUZSQU1FS0VZIDw8IDMyICovCiBzdGF0
aWMgdm9pZCBnZW5fZnJhbWVfdW5zY3JhbWJsZShUQ0d2X2k2NCBmcmFtZSkKIHsKQEAgLTcyNSw2
ICs3MzcsMzggQEAgc3RhdGljIHZvaWQgZ2VuX2xvYWRfZnJhbWUoRGlzYXNDb250ZXh0ICpjdHgs
IFRDR3ZfaTY0IGZyYW1lLCBUQ0d2IEVBKQogICAgIHRjZ19nZW5fcWVtdV9sZDY0KGZyYW1lLCBF
QSwgY3R4LT5tZW1faWR4KTsKIH0KIAorI2lmbmRlZiBDT05GSUdfSEVYQUdPTl9JREVGX1BBUlNF
UgorLyogU3RhY2sgb3ZlcmZsb3cgY2hlY2sgKi8KK3N0YXRpYyB2b2lkIGdlbl9mcmFtZWNoZWNr
KFRDR3YgRUEsIGludCBmcmFtZXNpemUpCit7CisgICAgLyogTm90IG1vZGVsbGVkIGluIGxpbnV4
LXVzZXIgbW9kZSAqLworICAgIC8qIFBsYWNlaG9sZGVyIGZvciBzeXN0ZW0gbW9kZSAqLworfQor
CitzdGF0aWMgdm9pZCBnZW5fYWxsb2NmcmFtZShEaXNhc0NvbnRleHQgKmN0eCwgVENHdiByMjks
IGludCBmcmFtZXNpemUpCit7CisgICAgVENHdiByMzAgPSB0Y2dfdGVtcF9uZXcoKTsKKyAgICBU
Q0d2X2k2NCBmcmFtZSA9IHRjZ190ZW1wX25ld19pNjQoKTsKKyAgICB0Y2dfZ2VuX2FkZGlfdGwo
cjMwLCByMjksIC04KTsKKyAgICBnZW5fZnJhbWVfc2NyYW1ibGUoZnJhbWUpOworICAgIGdlbl9z
dG9yZTgoY3B1X2VudiwgcjMwLCBmcmFtZSwgY3R4LT5pbnNuLT5zbG90KTsKKyAgICBnZW5fbG9n
X3JlZ193cml0ZShjdHgsIEhFWF9SRUdfRlAsIHIzMCk7CisgICAgZ2VuX2ZyYW1lY2hlY2socjMw
LCBmcmFtZXNpemUpOworICAgIHRjZ19nZW5fc3ViaV90bChyMjksIHIzMCwgZnJhbWVzaXplKTsK
K30KKworc3RhdGljIHZvaWQgZ2VuX2RlYWxsb2NmcmFtZShEaXNhc0NvbnRleHQgKmN0eCwgVENH
dl9pNjQgcjMxXzMwLCBUQ0d2IHIzMCkKK3sKKyAgICBUQ0d2IHIyOSA9IHRjZ190ZW1wX25ldygp
OworICAgIFRDR3ZfaTY0IGZyYW1lID0gdGNnX3RlbXBfbmV3X2k2NCgpOworICAgIGdlbl9sb2Fk
X2ZyYW1lKGN0eCwgZnJhbWUsIHIzMCk7CisgICAgZ2VuX2ZyYW1lX3Vuc2NyYW1ibGUoZnJhbWUp
OworICAgIHRjZ19nZW5fbW92X2k2NChyMzFfMzAsIGZyYW1lKTsKKyAgICB0Y2dfZ2VuX2FkZGlf
dGwocjI5LCByMzAsIDgpOworICAgIGdlbl9sb2dfcmVnX3dyaXRlKGN0eCwgSEVYX1JFR19TUCwg
cjI5KTsKK30KKyNlbmRpZgorCiBzdGF0aWMgdm9pZCBnZW5fcmV0dXJuKERpc2FzQ29udGV4dCAq
Y3R4LCBUQ0d2X2k2NCBkc3QsIFRDR3Ygc3JjKQogewogICAgIC8qCi0tIAoyLjI1LjEKCg==

