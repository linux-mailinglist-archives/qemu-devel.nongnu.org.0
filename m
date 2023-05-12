Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ACA701186
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 23:49:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxacB-0002iI-2G; Fri, 12 May 2023 17:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxac4-0002gB-Bj
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:44 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pxabo-000655-9G
 for qemu-devel@nongnu.org; Fri, 12 May 2023 17:47:43 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CKlIVK024395; Fri, 12 May 2023 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ctVbnqkexWg0dt/RjAv7yggqKYuKbLKP6oZwYPRZ784=;
 b=pi9faQc4WEWRPdl1nefoO24H0fNAR/o281nyvDIFLXzOXf72pYULvT2H0a0D5FKjtyUO
 mUhZVKjEYgay5QR+MLhMLAHKPzluqV1NTq83Ja8E68kj07r8vNsplVbjqb/jPa705FDe
 X8VHvRKcL40ctP6cbehp8pTnzNikCPLmMOxE3i5iwTqkSwmqIAC2n84snJRDiuyWomdv
 TSIGQGnamwHutkR92Q2oM1t4yucUz16t6J19rrFqdwiCCAOKVi5Gikq2GasZbA3PGTLv
 lIYYXHzVZ9/EHhMj0EuZ57YKmSr1JylVBH68AiUWNwG1yWczOgo9ikkOEsTZZS5bLwaC hA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhes2261b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:25 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34CLlMxG022107; 
 Fri, 12 May 2023 21:47:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3qf6hg4n43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CLlNji022117;
 Fri, 12 May 2023 21:47:23 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.204.221])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 34CLlMLh022102
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:47:23 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 47164)
 id F34926C3; Fri, 12 May 2023 14:47:21 -0700 (PDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com,
 stefanha@redhat.com, ale@rev.ng, anjo@rev.ng, quic_mliebel@quicinc.com
Subject: [PULL 13/44] Hexagon (target/hexagon) Add overrides for
 allocframe/deallocframe
Date: Fri, 12 May 2023 14:46:35 -0700
Message-Id: <20230512214706.946068-14-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512214706.946068-1-tsimpson@quicinc.com>
References: <20230512214706.946068-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: S3xmm6w3rSvxVhJ9gUdYDu6OwFE-UF4N
X-Proofpoint-GUID: S3xmm6w3rSvxVhJ9gUdYDu6OwFE-UF4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=413 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120183
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
Zz4KTWVzc2FnZS1JZDogPDIwMjMwNDI3MjMwMDEyLjM4MDAzMjctNS10c2ltcHNvbkBxdWljaW5j
LmNvbT4KLS0tCiB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggfCAzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysKIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5jICB8IDQ3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCBiL3RhcmdldC9oZXhh
Z29uL2dlbl90Y2cuaAppbmRleCA4ZDVlOTgyNmEwLi5lZjE3ZjJmMThjIDEwMDY0NAotLS0gYS90
YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCkBA
IC01MDAsNiArNTAwLDM4IEBACiAjZGVmaW5lIGZHRU5fVENHX1kyX2ljaW52YShTSE9SVENPREUp
IFwKICAgICBkbyB7IFJzViA9IFJzVjsgfSB3aGlsZSAoMCkKIAorLyoKKyAqIGFsbG9jZnJhbWUo
I3VpVikKKyAqICAgICBSeFYgPT0gcjI5CisgKi8KKyNkZWZpbmUgZkdFTl9UQ0dfUzJfYWxsb2Nm
cmFtZShTSE9SVENPREUpIFwKKyAgICBnZW5fYWxsb2NmcmFtZShjdHgsIFJ4ViwgdWlWKQorCisv
KiBzdWItaW5zdHJ1Y3Rpb24gdmVyc2lvbiAobm8gUnhWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkp
ICovCisjZGVmaW5lIGZHRU5fVENHX1NTMl9hbGxvY2ZyYW1lKFNIT1JUQ09ERSkgXAorICAgIGRv
IHsgXAorICAgICAgICBUQ0d2IHIyOSA9IHRjZ190ZW1wX25ldygpOyBcCisgICAgICAgIHRjZ19n
ZW5fbW92X3RsKHIyOSwgaGV4X2dwcltIRVhfUkVHX1NQXSk7IFwKKyAgICAgICAgZ2VuX2FsbG9j
ZnJhbWUoY3R4LCByMjksIHVpVik7IFwKKyAgICAgICAgZ2VuX2xvZ19yZWdfd3JpdGUoY3R4LCBI
RVhfUkVHX1NQLCByMjkpOyBcCisgICAgfSB3aGlsZSAoMCkKKworLyoKKyAqIFJkZDMyID0gZGVh
bGxvY2ZyYW1lKFJzMzIpOnJhdworICogICAgIFJkZFYgPT0gcjMxOjMwCisgKiAgICAgUnNWICA9
PSByMzAKKyAqLworI2RlZmluZSBmR0VOX1RDR19MMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBc
CisgICAgZ2VuX2RlYWxsb2NmcmFtZShjdHgsIFJkZFYsIFJzVikKKworLyogc3ViLWluc3RydWN0
aW9uIHZlcnNpb24gKG5vIFJkZFYvUnNWLCBzbyBoYW5kbGUgaXQgbWFudWFsbHkpICovCisjZGVm
aW5lIGZHRU5fVENHX1NMMl9kZWFsbG9jZnJhbWUoU0hPUlRDT0RFKSBcCisgICAgZG8geyBcCisg
ICAgICAgIFRDR3ZfaTY0IHIzMV8zMCA9IHRjZ190ZW1wX25ld19pNjQoKTsgXAorICAgICAgICBn
ZW5fZGVhbGxvY2ZyYW1lKGN0eCwgcjMxXzMwLCBoZXhfZ3ByW0hFWF9SRUdfRlBdKTsgXAorICAg
ICAgICBnZW5fbG9nX3JlZ193cml0ZV9wYWlyKGN0eCwgSEVYX1JFR19GUCwgcjMxXzMwKTsgXAor
ICAgIH0gd2hpbGUgKDApCisKIC8qCiAgKiBkZWFsbG9jX3JldHVybgogICogQXNzZW1ibGVyIG1h
cHBlZCB0bwpkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4
YWdvbi9nZW5wdHIuYwppbmRleCA2ZTU3NjdlYzVlLi5mYTdiMTc1NGJkIDEwMDY0NAotLS0gYS90
YXJnZXQvaGV4YWdvbi9nZW5wdHIuYworKysgYi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYwpAQCAt
NzA5LDYgKzcwOSwxOCBAQCBzdGF0aWMgdm9pZCBnZW5fY29uZF9jYWxscihEaXNhc0NvbnRleHQg
KmN0eCwKICAgICBnZW5fc2V0X2xhYmVsKHNraXApOwogfQogCisjaWZuZGVmIENPTkZJR19IRVhB
R09OX0lERUZfUEFSU0VSCisvKiBmcmFtZSA9ICgoTFIgPDwgMzIpIHwgRlApIF4gKEZSQU1FS0VZ
IDw8IDMyKSkgKi8KK3N0YXRpYyBUQ0d2X2k2NCBnZW5fZnJhbWVfc2NyYW1ibGUodm9pZCkKK3sK
KyAgICBUQ0d2X2k2NCBmcmFtZSA9IHRjZ190ZW1wX25ld19pNjQoKTsKKyAgICBUQ0d2IHRtcCA9
IHRjZ190ZW1wX25ldygpOworICAgIHRjZ19nZW5feG9yX3RsKHRtcCwgaGV4X2dwcltIRVhfUkVH
X0xSXSwgaGV4X2dwcltIRVhfUkVHX0ZSQU1FS0VZXSk7CisgICAgdGNnX2dlbl9jb25jYXRfaTMy
X2k2NChmcmFtZSwgaGV4X2dwcltIRVhfUkVHX0ZQXSwgdG1wKTsKKyAgICByZXR1cm4gZnJhbWU7
Cit9CisjZW5kaWYKKwogLyogZnJhbWUgXj0gKGludDY0X3QpRlJBTUVLRVkgPDwgMzIgKi8KIHN0
YXRpYyB2b2lkIGdlbl9mcmFtZV91bnNjcmFtYmxlKFRDR3ZfaTY0IGZyYW1lKQogewpAQCAtNzI1
LDYgKzczNyw0MSBAQCBzdGF0aWMgdm9pZCBnZW5fbG9hZF9mcmFtZShEaXNhc0NvbnRleHQgKmN0
eCwgVENHdl9pNjQgZnJhbWUsIFRDR3YgRUEpCiAgICAgdGNnX2dlbl9xZW11X2xkX2k2NChmcmFt
ZSwgRUEsIGN0eC0+bWVtX2lkeCwgTU9fVEVVUSk7CiB9CiAKKyNpZm5kZWYgQ09ORklHX0hFWEFH
T05fSURFRl9QQVJTRVIKKy8qIFN0YWNrIG92ZXJmbG93IGNoZWNrICovCitzdGF0aWMgdm9pZCBn
ZW5fZnJhbWVjaGVjayhUQ0d2IEVBLCBpbnQgZnJhbWVzaXplKQoreworICAgIC8qIE5vdCBtb2Rl
bGxlZCBpbiBsaW51eC11c2VyIG1vZGUgKi8KKyAgICAvKiBQbGFjZWhvbGRlciBmb3Igc3lzdGVt
IG1vZGUgKi8KKyNpZm5kZWYgQ09ORklHX1VTRVJfT05MWQorICAgIGdfYXNzZXJ0X25vdF9yZWFj
aGVkKCk7CisjZW5kaWYKK30KKworc3RhdGljIHZvaWQgZ2VuX2FsbG9jZnJhbWUoRGlzYXNDb250
ZXh0ICpjdHgsIFRDR3YgcjI5LCBpbnQgZnJhbWVzaXplKQoreworICAgIFRDR3YgcjMwID0gdGNn
X3RlbXBfbmV3KCk7CisgICAgVENHdl9pNjQgZnJhbWU7CisgICAgdGNnX2dlbl9hZGRpX3RsKHIz
MCwgcjI5LCAtOCk7CisgICAgZnJhbWUgPSBnZW5fZnJhbWVfc2NyYW1ibGUoKTsKKyAgICBnZW5f
c3RvcmU4KGNwdV9lbnYsIHIzMCwgZnJhbWUsIGN0eC0+aW5zbi0+c2xvdCk7CisgICAgZ2VuX2xv
Z19yZWdfd3JpdGUoY3R4LCBIRVhfUkVHX0ZQLCByMzApOworICAgIGdlbl9mcmFtZWNoZWNrKHIz
MCwgZnJhbWVzaXplKTsKKyAgICB0Y2dfZ2VuX3N1YmlfdGwocjI5LCByMzAsIGZyYW1lc2l6ZSk7
Cit9CisKK3N0YXRpYyB2b2lkIGdlbl9kZWFsbG9jZnJhbWUoRGlzYXNDb250ZXh0ICpjdHgsIFRD
R3ZfaTY0IHIzMV8zMCwgVENHdiByMzApCit7CisgICAgVENHdiByMjkgPSB0Y2dfdGVtcF9uZXco
KTsKKyAgICBUQ0d2X2k2NCBmcmFtZSA9IHRjZ190ZW1wX25ld19pNjQoKTsKKyAgICBnZW5fbG9h
ZF9mcmFtZShjdHgsIGZyYW1lLCByMzApOworICAgIGdlbl9mcmFtZV91bnNjcmFtYmxlKGZyYW1l
KTsKKyAgICB0Y2dfZ2VuX21vdl9pNjQocjMxXzMwLCBmcmFtZSk7CisgICAgdGNnX2dlbl9hZGRp
X3RsKHIyOSwgcjMwLCA4KTsKKyAgICBnZW5fbG9nX3JlZ193cml0ZShjdHgsIEhFWF9SRUdfU1As
IHIyOSk7Cit9CisjZW5kaWYKKwogc3RhdGljIHZvaWQgZ2VuX3JldHVybihEaXNhc0NvbnRleHQg
KmN0eCwgVENHdl9pNjQgZHN0LCBUQ0d2IHNyYykKIHsKICAgICAvKgotLSAKMi4yNS4xCgo=

