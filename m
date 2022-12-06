Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58CF64487A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 16:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aLg-0005UG-Cu; Tue, 06 Dec 2022 10:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2aLb-0005U3-Bj
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:59:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2aLZ-0006Ot-LH
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 10:59:07 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6E3F28007943; Tue, 6 Dec 2022 15:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+f4Jz67/s2YdfBX2gO1KptWgK//RiOULpqlIzx9L10k=;
 b=g05Vw2Pbc8h9VbQfQDOarIwREqloE5F+TGEkdSsetGKh5FGtQCZm2XJG3B/r8BXTx2kj
 jNlYI20ryia2t3cfPYJnQ8sR0jwPeT3tX7MDuxw4GBFtTVZwhwVySwqrcj0tCm+tNfWb
 CMceFyiI+uS4jG0vj2uvAVUsv3WBJ5yiEqxfd2N/KfdIvlBM6ihCnZkdY/yY5zLTglfy
 jXTVaQytvK1wvCol6L7zEFDhBlziE1a5ztaTXK5s7Ujb9l7tSfuJ6DVPhco7zckUILmE
 E5MuXRxJW2Z4Djbd30WNY4Tb7iUJKb5EgnYuyNn0AqnN7YrKZoUaRTJ0o+L07Sr1ybd7 mw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m9tqmn47j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 15:59:03 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6DHowF008101;
 Tue, 6 Dec 2022 15:59:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3m9ktqh72j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 15:59:00 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6FwwTK36372842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 15:58:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CBD620043;
 Tue,  6 Dec 2022 15:58:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4669520040;
 Tue,  6 Dec 2022 15:58:58 +0000 (GMT)
Received: from [9.171.16.157] (unknown [9.171.16.157])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  6 Dec 2022 15:58:58 +0000 (GMT)
Message-ID: <f5056c7fbfeb79531f4279a854a25030f7759cd5.camel@linux.ibm.com>
Subject: Re: [PATCH v3 29/34] tcg: Reorg function calls
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Date: Tue, 06 Dec 2022 16:58:58 +0100
In-Reply-To: <1dbf75a3-a4b5-2f2d-5dfe-417dafb13b8d@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
 <20221202053958.223890-30-richard.henderson@linaro.org>
 <20221206152815.okaikikteop3cduk@heavy>
 <1dbf75a3-a4b5-2f2d-5dfe-417dafb13b8d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NvFbKYUWsXf3yfY9D-IY2EvsDzPFWwcQ
X-Proofpoint-ORIG-GUID: NvFbKYUWsXf3yfY9D-IY2EvsDzPFWwcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_10,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 mlxlogscore=892 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060129
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gVHVlLCAyMDIyLTEyLTA2IGF0IDA5OjQ5IC0wNjAwLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90
ZToKPiBPbiAxMi82LzIyIDA5OjI4LCBJbHlhIExlb3Noa2V2aWNoIHdyb3RlOgo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKFRDR19UQVJHRVRfQ0FMTF9BUkdfSTY0KSB7Cj4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgVENHX0NBTExfQVJHX0VWRU46Cj4gPiAK
PiA+IE9uIGEgczM5MHggaG9zdCB3aXRoIGdjYy0xMS4wLjEtMC4zLjEuaWJtLmZjMzQuczM5MHgg
SSBnZXQ6Cj4gPiAKPiA+IEZBSUxFRDogbGlicWVtdS1hYXJjaDY0LXNvZnRtbXUuZmEucC90Y2df
dGNnLmMubwo+ID4gLi4vdGNnL3RjZy5jOiBJbiBmdW5jdGlvbiDigJhpbml0X2NhbGxfbGF5b3V0
4oCZOgo+ID4gLi4vdGNnL3RjZy5jOjczOToxMzogZXJyb3I6IGNhc2UgdmFsdWUg4oCYMeKAmSBu
b3QgaW4gZW51bWVyYXRlZCB0eXBlCj4gPiBbLVdlcnJvcj1zd2l0Y2hdCj4gPiDCoMKgIDczOSB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgVENHX0NBTExfQVJHX0VWRU46Cj4gPiDCoMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+Cj4gPiAKPiA+IFRoZSBmb2xs
b3dpbmcgaGVscHM6Cj4gCj4gWWVzLCBJIGZvdW5kIGFuZCBmaXhlZCB0aGlzIHNpbmNlLgo+IAo+
ID4gLS0tIGEvdGNnL3RjZy5jCj4gPiArKysgYi90Y2cvdGNnLmMKPiA+IEBAIC03MzUsNyArNzM1
LDcgQEAgc3RhdGljIHZvaWQgaW5pdF9jYWxsX2xheW91dChUQ0dIZWxwZXJJbmZvCj4gPiAqaW5m
bykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gwqAgCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqAgY2FzZSBUQ0dfVFlQRV9JNjQ6Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzd2l0Y2ggKFRDR19UQVJHRVRfQ0FMTF9BUkdfSTY0KSB7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzd2l0Y2ggKChUQ0dDYWxsQXJndW1lbnRLaW5kKVRDR19UQVJHRVRfQ0FMTF9B
UkdfSTY0KQo+ID4gewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSBUQ0dfQ0FM
TF9BUkdfRVZFTjoKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGF5b3V0
X2FyZ19ldmVuKCZjdW0pOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBmYWxsIHRocm91Z2ggKi8KPiA+IAo+ID4gVGhpcyBsb29rcyBsaWtlIGEgZ2NjIGJ1ZyB0byBt
ZS4KPiAKPiBUaGUgZ2NjICJidWciIGlzIG9ubHkgaW4gbm90IGJlaW5nIHN1ZmZpY2llbnRseSB2
ZXJib3NlLsKgIEl0IHNob3VsZAo+IHNheSBzb21ldGhpbmcgYWJvdXQgCj4gKmRpZmZlcmluZyog
ZW51bWVyYXRlZCB0eXBlcywgYW5kIHBlcmhhcHMgbmFtZSB0aGVtLgo+IAo+IEJhY2sgaW4gcGF0
Y2ggMjAsIHRjZy9zMzkweC90Y2ctdGFyZ2V0LmgsCj4gCj4gLSNkZWZpbmUgVENHX1RBUkdFVF9D
QUxMX0FSR19JNjTCoMKgwqDCoMKgwqDCoMKgIFRDR19DQUxMX1JFVF9OT1JNQUwKPiArI2RlZmlu
ZSBUQ0dfVEFSR0VUX0NBTExfQVJHX0k2NMKgwqDCoMKgwqDCoMKgwqAgVENHX0NBTExfQVJHX05P
Uk1BTAo+IAo+IAo+IHJ+CgpJIGxvb2tlZCBhdCB0aGlzIGxpbmUgYW5kIGNvbXBsZXRlbHkgbWlz
c2VkIHRoZSBSRVQgdnMgQVJHIGRpZmZlcmVuY2UuCllvdXIgZGlmZiBmaXhlcyB0aGUgaXNzdWUg
Zm9yIG1lIHRvbywgb2YgY291cnNlLgpUaGFua3MhCg==


