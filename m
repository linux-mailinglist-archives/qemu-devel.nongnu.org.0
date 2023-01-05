Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688CA65F6DE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYUa-0006yd-Fw; Thu, 05 Jan 2023 17:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUX-0006wb-FG
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:41 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1pDYUU-000284-Ao
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:41 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305M5T2j002433; Thu, 5 Jan 2023 22:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+HnjHbWF3m8nUbYCRwHZ9YFy0lRojRf6wFBOBycKutE=;
 b=TFfz8gbrTlBIdiNvJZefjDDj8BYgoJYGucz7zv1KgrWsfmo5VpAnvI4PYb71r2Ovlm4c
 jAlTiTlocXP1ld7nJyoyQw51DadeycO5etg8RmkJkWe4KqdxdqSgq1/nUgTiS8YhPJ64
 Uk08M5U1+ZItDOmpGRxHZNZt3qmk4RF+hHyKBHhPXVNcGtJzgRBY04kryPI2e4MEbPdy
 QU9Ps+Bj4g5Tj1s9Cja6FpwfiUjuGqEX1O1Wm9Nao2lEi4PTxcqDlfANjWFJqSPJp00M
 jKVXddr8jBZs3N5kt2Z9+gVnmO2swTEY986t8wNqwJyiqZSkQSYeQOTCXHmTD5YArirp tA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwuuusdrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 22:13:36 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 305MDZAE031219; 
 Thu, 5 Jan 2023 22:13:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 3mx2kp91aj-1;
 Thu, 05 Jan 2023 22:13:35 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305MDYrs031202;
 Thu, 5 Jan 2023 22:13:34 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-tsimpson-lv.qualcomm.com
 [10.47.235.220])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 305MDYQ4031198;
 Thu, 05 Jan 2023 22:13:34 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 47164)
 id 3A8FD5000AF; Thu,  5 Jan 2023 14:13:34 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, richard.henderson@linaro.org, philmd@linaro.org,
 ale@rev.ng, anjo@rev.ng, bcain@quicinc.com, quic_mathbern@quicinc.com
Subject: [PATCH v3 3/9] Hexagon (target/hexagon) Add overrides for
 endloop1/endloop01
Date: Thu,  5 Jan 2023 14:13:25 -0800
Message-Id: <20230105221331.12069-4-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230105221331.12069-1-tsimpson@quicinc.com>
References: <20230105221331.12069-1-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mZdBhqaJBykZlRZq2HYBdTrob3-UfHXC
X-Proofpoint-ORIG-GUID: mZdBhqaJBykZlRZq2HYBdTrob3-UfHXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_12,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=657 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301050174
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

U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPgotLS0K
IHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCB8ICA0ICsrCiB0YXJnZXQvaGV4YWdvbi9nZW5wdHIu
YyAgfCA3OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggYi90YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmgKaW5kZXggOWU4ZjMzNzNhZC4uNjI2
N2Y1MWNjYyAxMDA2NDQKLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX3RjZy5oCisrKyBiL3Rhcmdl
dC9oZXhhZ29uL2dlbl90Y2cuaApAQCAtNjI4LDYgKzYyOCwxMCBAQAogCiAjZGVmaW5lIGZHRU5f
VENHX0oyX2VuZGxvb3AwKFNIT1JUQ09ERSkgXAogICAgIGdlbl9lbmRsb29wMChjdHgpCisjZGVm
aW5lIGZHRU5fVENHX0oyX2VuZGxvb3AxKFNIT1JUQ09ERSkgXAorICAgIGdlbl9lbmRsb29wMShj
dHgpCisjZGVmaW5lIGZHRU5fVENHX0oyX2VuZGxvb3AwMShTSE9SVENPREUpIFwKKyAgICBnZW5f
ZW5kbG9vcDAxKGN0eCkKIAogLyoKICAqIENvbXBvdW5kIGNvbXBhcmUgYW5kIGp1bXAgaW5zdHJ1
Y3Rpb25zCmRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhh
Z29uL2dlbnB0ci5jCmluZGV4IGQxNWRmMWRkMjguLjk0MDU0YjEwZTYgMTAwNjQ0Ci0tLSBhL3Rh
cmdldC9oZXhhZ29uL2dlbnB0ci5jCisrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jCkBAIC03
NjMsNiArNzYzLDg1IEBAIHN0YXRpYyB2b2lkIGdlbl9lbmRsb29wMChEaXNhc0NvbnRleHQgKmN0
eCkKICAgICB0Y2dfdGVtcF9mcmVlKGxwY2ZnKTsKIH0KIAorc3RhdGljIHZvaWQgZ2VuX2VuZGxv
b3AxKERpc2FzQ29udGV4dCAqY3R4KQoreworICAgIC8qCisgICAgICogICAgaWYgKGhleF9ncHJb
SEVYX1JFR19MQzFdID4gMSkgeworICAgICAqICAgICAgICBQQyA9IGhleF9ncHJbSEVYX1JFR19T
QTFdOworICAgICAqICAgICAgICBoZXhfbmV3X3ZhbHVlW0hFWF9SRUdfTEMxXSA9IGhleF9ncHJb
SEVYX1JFR19MQzFdIC0gMTsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgVENHTGFiZWwgKmxh
YmVsID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9M
RVUsIGhleF9ncHJbSEVYX1JFR19MQzFdLCAxLCBsYWJlbCk7CisgICAgeworICAgICAgICBnZW5f
anVtcHIoY3R4LCBoZXhfZ3ByW0hFWF9SRUdfU0ExXSk7CisgICAgICAgIHRjZ19nZW5fc3ViaV90
bChoZXhfbmV3X3ZhbHVlW0hFWF9SRUdfTEMxXSwgaGV4X2dwcltIRVhfUkVHX0xDMV0sIDEpOwor
ICAgIH0KKyAgICBnZW5fc2V0X2xhYmVsKGxhYmVsKTsKK30KKworc3RhdGljIHZvaWQgZ2VuX2Vu
ZGxvb3AwMShEaXNhc0NvbnRleHQgKmN0eCkKK3sKKyAgICBUQ0d2IGxwY2ZnID0gdGNnX3RlbXBf
bG9jYWxfbmV3KCk7CisKKyAgICBHRVRfVVNSX0ZJRUxEKFVTUl9MUENGRywgbHBjZmcpOworCisg
ICAgLyoKKyAgICAgKiAgICBpZiAobHBjZmcgPT0gMSkgeworICAgICAqICAgICAgICBoZXhfbmV3
X3ByZWRfdmFsdWVbM10gPSAweGZmOworICAgICAqICAgICAgICBoZXhfcHJlZF93cml0dGVuIHw9
IDEgPDwgMzsKKyAgICAgKiAgICB9CisgICAgICovCisgICAgVENHTGFiZWwgKmxhYmVsMSA9IGdl
bl9uZXdfbGFiZWwoKTsKKyAgICB0Y2dfZ2VuX2JyY29uZGlfdGwoVENHX0NPTkRfTkUsIGxwY2Zn
LCAxLCBsYWJlbDEpOworICAgIHsKKyAgICAgICAgdGNnX2dlbl9tb3ZpX3RsKGhleF9uZXdfcHJl
ZF92YWx1ZVszXSwgMHhmZik7CisgICAgICAgIHRjZ19nZW5fb3JpX3RsKGhleF9wcmVkX3dyaXR0
ZW4sIGhleF9wcmVkX3dyaXR0ZW4sIDEgPDwgMyk7CisgICAgfQorICAgIGdlbl9zZXRfbGFiZWwo
bGFiZWwxKTsKKworICAgIC8qCisgICAgICogICAgaWYgKGxwY2ZnKSB7CisgICAgICogICAgICAg
IFNFVF9VU1JfRklFTEQoVVNSX0xQQ0ZHLCBscGNmZyAtIDEpOworICAgICAqICAgIH0KKyAgICAg
Ki8KKyAgICBUQ0dMYWJlbCAqbGFiZWwyID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRjZ19nZW5f
YnJjb25kaV90bChUQ0dfQ09ORF9FUSwgbHBjZmcsIDAsIGxhYmVsMik7CisgICAgeworICAgICAg
ICB0Y2dfZ2VuX3N1YmlfdGwobHBjZmcsIGxwY2ZnLCAxKTsKKyAgICAgICAgU0VUX1VTUl9GSUVM
RChVU1JfTFBDRkcsIGxwY2ZnKTsKKyAgICB9CisgICAgZ2VuX3NldF9sYWJlbChsYWJlbDIpOwor
CisgICAgLyoKKyAgICAgKiAgICBpZiAoaGV4X2dwcltIRVhfUkVHX0xDMF0gPiAxKSB7CisgICAg
ICogICAgICAgIFBDID0gaGV4X2dwcltIRVhfUkVHX1NBMF07CisgICAgICogICAgICAgIGhleF9u
ZXdfdmFsdWVbSEVYX1JFR19MQzBdID0gaGV4X2dwcltIRVhfUkVHX0xDMF0gLSAxOworICAgICAq
ICAgIH0gZWxzZSB7CisgICAgICogICAgICAgIGlmIChoZXhfZ3ByW0hFWF9SRUdfTEMxXSA+IDEp
IHsKKyAgICAgKiAgICAgICAgICAgIGhleF9uZXh0X3BjID0gaGV4X2dwcltIRVhfUkVHX1NBMV07
CisgICAgICogICAgICAgICAgICBoZXhfbmV3X3ZhbHVlW0hFWF9SRUdfTEMxXSA9IGhleF9ncHJb
SEVYX1JFR19MQzFdIC0gMTsKKyAgICAgKiAgICAgICAgfQorICAgICAqICAgIH0KKyAgICAgKi8K
KyAgICBUQ0dMYWJlbCAqbGFiZWwzID0gZ2VuX25ld19sYWJlbCgpOworICAgIFRDR0xhYmVsICpk
b25lID0gZ2VuX25ld19sYWJlbCgpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9M
RVUsIGhleF9ncHJbSEVYX1JFR19MQzBdLCAxLCBsYWJlbDMpOworICAgIHsKKyAgICAgICAgZ2Vu
X2p1bXByKGN0eCwgaGV4X2dwcltIRVhfUkVHX1NBMF0pOworICAgICAgICB0Y2dfZ2VuX3N1Ymlf
dGwoaGV4X25ld192YWx1ZVtIRVhfUkVHX0xDMF0sIGhleF9ncHJbSEVYX1JFR19MQzBdLCAxKTsK
KyAgICAgICAgdGNnX2dlbl9icihkb25lKTsKKyAgICB9CisgICAgZ2VuX3NldF9sYWJlbChsYWJl
bDMpOworICAgIHRjZ19nZW5fYnJjb25kaV90bChUQ0dfQ09ORF9MRVUsIGhleF9ncHJbSEVYX1JF
R19MQzFdLCAxLCBkb25lKTsKKyAgICB7CisgICAgICAgIGdlbl9qdW1wcihjdHgsIGhleF9ncHJb
SEVYX1JFR19TQTFdKTsKKyAgICAgICAgdGNnX2dlbl9zdWJpX3RsKGhleF9uZXdfdmFsdWVbSEVY
X1JFR19MQzFdLCBoZXhfZ3ByW0hFWF9SRUdfTEMxXSwgMSk7CisgICAgfQorICAgIGdlbl9zZXRf
bGFiZWwoZG9uZSk7CisgICAgdGNnX3RlbXBfZnJlZShscGNmZyk7Cit9CisKIHN0YXRpYyB2b2lk
IGdlbl9jbXBfanVtcG52KERpc2FzQ29udGV4dCAqY3R4LAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVENHQ29uZCBjb25kLCBUQ0d2IHZhbCwgVENHdiBzcmMsIGludCBwY19vZmYpCiB7Ci0t
IAoyLjE3LjEKCg==

