Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D1765C0FD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:40:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChW5-00018T-PL; Tue, 03 Jan 2023 08:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pCgXF-0000fN-At
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:36:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pCgXD-0003qS-1r
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:36:53 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303CT3ZF005849; Tue, 3 Jan 2023 12:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=js8mQ0I4ytqJqL4yENo7nXvAUlDnN71JwsQrsICKZcY=;
 b=E+Pv/PEtdyvGjvKolprmbBBEFlt5LgsQg5bgmQCiMOukOaWlSCVCwenme4c5jhU0GJLG
 NMb+3je2Oa49eJMN/rXNBTP1qbuiNAUlrayqEDMKTwqS8sEQ/IRPVgJvjpzNL94jkw+K
 nli9g3rOy+Gr6JHv7fDK3VaoZPPyO89REg13dbmawF6eEsBllAg1HRD1TZYD7wHl7DLQ
 YPR90dc6iQn2RAJcJuHm5TrKHy72D49DfYXN44IU2KhmHFzSKT6B7pluhXYZFg1KGEL2
 f/Who+iuPlBFenFepGR+rjBcxwYNBZKHR6qOKZ+Pk83NJXMRMhsuKS/7JAnnaouJt6l1 tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvefhqbkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 12:36:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 303COI0M024734;
 Tue, 3 Jan 2023 12:36:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvefhqbk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 12:36:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3038nhNc020202;
 Tue, 3 Jan 2023 12:36:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mtcq6btkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 12:36:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 303CahX550462982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Jan 2023 12:36:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5F8720049;
 Tue,  3 Jan 2023 12:36:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97BB920043;
 Tue,  3 Jan 2023 12:36:42 +0000 (GMT)
Received: from [9.171.55.107] (unknown [9.171.55.107])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  3 Jan 2023 12:36:42 +0000 (GMT)
Message-ID: <dc3235d7309656dcd2815717b91352bd601fe838.camel@linux.ibm.com>
Subject: PING: [PATCH v2 0/1] tcg: add perfmap and jitdump
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "Vanderson M . do Rosario" <vandersonmr2@gmail.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Date: Tue, 03 Jan 2023 13:36:42 +0100
In-Reply-To: <20221114161321.3364875-1-iii@linux.ibm.com>
References: <20221114161321.3364875-1-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dPwMiX_hHGchbBEnr7uETIT4AgpMfnmR
X-Proofpoint-GUID: ECHR_VzBaUeSNZJEl_hfQDgktsVfEMCM
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_03,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:39:41 -0500
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

T24gTW9uLCAyMDIyLTExLTE0IGF0IDE3OjEzICswMTAwLCBJbHlhIExlb3Noa2V2aWNoIHdyb3Rl
Ogo+IHYxOgo+IGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZl
bC8yMDIyLTEwL21zZzAxODI0Lmh0bWwKPiBodHRwczovL2xpc3RzLm5vbmdudS5vcmcvYXJjaGl2
ZS9odG1sL3FlbXUtZGV2ZWwvMjAyMi0xMS9tc2cwMTA3My5odG1sCj4gCj4gdjEgLT4gdjI6Cj4g
KiBVc2UgUUVNVV9MT0NLX0dVQVJEIChBbGV4KS4KPiAqIEhhbmRsZSBUQVJHRVRfVEJfUENSRUwg
KEFsZXgpLgo+ICogU3VwcG9ydCBFTEYgLWtlcm5lbHMsIGFkZCBhIG5vdGUgYWJvdXQgdGhpcyAo
QWxleCkuIFRlc3RlZCB3aXRoCj4gwqAgcWVtdS1zeXN0ZW0teDg2XzY0IGFuZCBMaW51eCBrZXJu
ZWwgLSBpdCdzIG5vdCBmYXN0LCBidXQgaXQgd29ya3MuCj4gKiBNaW5vciBjb25zdCBjb3JyZWN0
bmVzcyBhbmQgc3R5bGUgaW1wcm92ZW1lbnRzLgo+IAo+IElseWEgTGVvc2hrZXZpY2ggKDEpOgo+
IMKgIHRjZzogYWRkIHBlcmZtYXAgYW5kIGppdGR1bXAKPiAKPiDCoGFjY2VsL3RjZy9kZWJ1Z2lu
Zm8uY8KgwqDCoMKgIHzCoCA5OSArKysrKysrKysrKwo+IMKgYWNjZWwvdGNnL2RlYnVnaW5mby5o
wqDCoMKgwqAgfMKgIDUyICsrKysrKwo+IMKgYWNjZWwvdGNnL21lc29uLmJ1aWxkwqDCoMKgwqAg
fMKgwqAgMiArCj4gwqBhY2NlbC90Y2cvcGVyZi5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzM0Cj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiDCoGFjY2VsL3RjZy9wZXJm
LmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDI4ICsrKysKPiDCoGFjY2VsL3RjZy90cmFuc2xhdGUt
YWxsLmMgfMKgwqAgOCArCj4gwqBkb2NzL2RldmVsL3RjZy5yc3TCoMKgwqDCoMKgwqDCoCB8wqAg
MjMgKysrCj4gwqBody9jb3JlL2xvYWRlci5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKwo+
IMKgaW5jbHVkZS90Y2cvdGNnLmjCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoGxpbnV4
LXVzZXIvZWxmbG9hZC5jwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDCoGxpbnV4LXVzZXIvZXhpdC5j
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsKPiDCoGxpbnV4LXVzZXIvbWFpbi5jwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMTUgKysKPiDCoGxpbnV4LXVzZXIvbWVzb24uYnVpbGTCoMKgwqAgfMKgwqAg
MSArCj4gwqBtZXNvbi5idWlsZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOCAr
Cj4gwqBxZW11LW9wdGlvbnMuaHjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjAgKysrCj4gwqBz
b2Z0bW11L3ZsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTEgKysKPiDCoHRjZy9y
ZWdpb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoHRjZy90Y2cu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+IMKgMTggZmlsZXMg
Y2hhbmdlZCwgNjE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgYWNjZWwvdGNnL2RlYnVnaW5mby5jCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYWNj
ZWwvdGNnL2RlYnVnaW5mby5oCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYWNjZWwvdGNnL3BlcmYu
Ywo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFjY2VsL3RjZy9wZXJmLmgKPiAKCkhpLAoKSSB3b3Vs
ZCBsaWtlIHRvIHBpbmcgdGhpcyBwYXRjaDoKCmh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvcWVtdS1kZXZlbC8yMDIyLTExL21zZzAyMzg1Lmh0bWwKaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9RRU1VLzIwMjIxMTE0MTYxMzIxLjMzNjQ4NzUtMS1paWlAbGludXguaWJtLmNvbS8KCkJlc3Qg
cmVnYXJkcywKSWx5YQo=

