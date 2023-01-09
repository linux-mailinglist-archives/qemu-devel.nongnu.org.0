Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C1662081
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:48:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnmy-0007XF-9x; Mon, 09 Jan 2023 03:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEnmo-0007VC-1k; Mon, 09 Jan 2023 03:45:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1pEnml-0003pl-Ta; Mon, 09 Jan 2023 03:45:41 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3098bJdq015859; Mon, 9 Jan 2023 08:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FR9m/RSKY6yRm2VYaAO4HwchXmvVQH51xKESo+LA8Ys=;
 b=Z7ayXE/uWK1y8p3sgRmkZVOwJKcBRrnf8nq1l9tGvvxumxjvBc8JXOMFfVXRqJBZtkDW
 JwxkRrSOh3pe3PqKNEGZBWPz1e/nqKIsP/sjltQW/ZlI8VG4416nAPb7ZQYlbKRMDnd8
 iT9ix6aOOkoKe132bTEIJU9bA0OVwE1k1FAPpMgUT7Z31VWRduiR+Tln0Eq4XBb4jGsw
 dhJtfjz6ClmlF1MKmrjav3rreh9vD+NyHwLJD9MTCXs56hnUR04E6UHg2dSszmH1fwQ6
 XJM9ZhrOHKuPwPRvUOM8bkbjE/ppfkFIJ8Twe7hxBsk0cWVY6CRxEGFi+nOnAxM6GtdV UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6j81kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 08:45:26 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30986AbG021277;
 Mon, 9 Jan 2023 08:45:26 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myj6j81js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 08:45:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 308GYiv5000520;
 Mon, 9 Jan 2023 08:45:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3my0c6jmmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 08:45:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3098jJMm45416790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 08:45:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB8F42004B;
 Mon,  9 Jan 2023 08:45:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70CC520040;
 Mon,  9 Jan 2023 08:45:18 +0000 (GMT)
Received: from [9.171.16.4] (unknown [9.171.16.4])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 08:45:18 +0000 (GMT)
Message-ID: <2b69a682-692b-7151-caec-132182fa2e08@linux.ibm.com>
Date: Mon, 9 Jan 2023 09:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/4] s390x/pv: Check for support on the host
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-3-clg@kaod.org>
Content-Language: en-US
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <20230106075330.3662549-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IOEKvc3hq1QJhC1PRxNJcDd1S-B_b1Zy
X-Proofpoint-GUID: 9O4BLOafjMkujlx3CPfz7Vcsc5qD4Tel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_03,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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

T24gMS82LzIzIDA4OjUzLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4gRnJvbTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0ByZWRoYXQuY29tPg0KPiANCj4gU3VwcG9ydCBmb3IgcHJv
dGVjdGVkIFZNcyBzaG91bGQgaGF2ZSBiZWVuIGVuYWJsZWQgb24gdGhlIGhvc3Qgd2l0aA0K
PiB0aGUga2VybmVsIHBhcmFtZXRlciAncHJvdF92aXJ0PTEnLiBJZiB0aGUgaGFyZHdhcmUg
c3VwcG9ydHMgdGhlDQo+IGZlYXR1cmUsIGl0IGlzIHJlZmxlY3RlZCB1bmRlciBzeXNmcy4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0ByZWRoYXQuY29tPg0KDQpB
bnkgcmVhc29uIHdoeSB5b3UgZGlkbid0IHVzZSBLVk1fQ0FQX1MzOTBfUFJPVEVDVEVEPw0K
DQpUaGUgc3lzZnMgaW50ZXJmYWNlIGlzbid0IG1lYW50IHRvIGJlIHBhcnNlZCBieSBwcm9n
cmFtcywgaXQncyBiZWVuIA0KaW50cm9kdWNlZCBmb3IgaHVtYW5zLiBNb3N0IG9mIHRoZSBp
bnRlcmZhY2UncyBkYXRhIGhhcyB0aGVyZWZvcmUgYmVlbiANCm1hZGUgYXZhaWxhYmxlIHZp
YSB0aGUgVVYgaW5mbyBBUEkuDQoNCj4gLS0tDQo+ICAgaHcvczM5MHgvcHYuYyB8IDIzICsr
KysrKysrKysrKysrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9zMzkweC9wdi5j
IGIvaHcvczM5MHgvcHYuYw0KPiBpbmRleCA4YTFjNzE0MzZiLi5kNTNlZjhmZDM4IDEwMDY0
NA0KPiAtLS0gYS9ody9zMzkweC9wdi5jDQo+ICsrKyBiL2h3L3MzOTB4L3B2LmMNCj4gQEAg
LTE0LDYgKzE0LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgva3ZtLmg+DQo+ICAgDQo+ICAg
I2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4gKyNpbmNsdWRlICJxZW11L2N1dGlscy5oIg0K
PiAgICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIg0KPiAgICNpbmNsdWRlICJzeXNl
bXUva3ZtLmgiDQo+ICAgI2luY2x1ZGUgInFvbS9vYmplY3RfaW50ZXJmYWNlcy5oIg0KPiBA
QCAtMjgwLDkgKzI4MSwyOSBAQCBzdGF0aWMgYm9vbCBzMzkwX3B2X2NoZWNrX2NwdXMoRXJy
b3IgKiplcnJwKQ0KPiAgICAgICByZXR1cm4gdHJ1ZTsNCj4gICB9DQo+ICAgDQo+ICsjZGVm
aW5lIFMzOTBfUFZfSE9TVCAiL3N5cy9maXJtd2FyZS91di9wcm90X3ZpcnRfaG9zdCINCj4g
Kw0KPiArc3RhdGljIGJvb2wgczM5MF9wdl9jaGVja19ob3N0KEVycm9yICoqZXJycCkNCj4g
K3sNCj4gKyAgICBnY2hhciAqcyA9IE5VTEw7DQo+ICsgICAgdWludDY0X3QgcHZfaG9zdCA9
IDA7DQo+ICsNCj4gKyAgICBpZiAoZ19maWxlX2dldF9jb250ZW50cyhTMzkwX1BWX0hPU1Qs
ICZzLCBOVUxMLCBOVUxMKSkgew0KPiArICAgICAgICBwdl9ob3N0ID0gZ19hc2NpaV9zdHJ0
b3VsbChzLCBOVUxMLCAxMCk7DQo+ICsgICAgfQ0KPiArICAgIGdfZnJlZShzKTsNCj4gKw0K
PiArICAgIGlmIChwdl9ob3N0ICE9IDEpIHsNCj4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJw
LCAiSG9zdCBkb2VzIG5vdCBzdXBwb3J0IHByb3RlY3RlZCBWTXMiKTsNCj4gKyAgICAgICAg
cmV0dXJuIGZhbHNlOw0KPiArICAgIH0NCj4gKw0KPiArICAgIHJldHVybiB0cnVlOw0KPiAr
fQ0KPiArDQo+ICAgc3RhdGljIGJvb2wgczM5MF9wdl9ndWVzdF9jaGVjayhDb25maWRlbnRp
YWxHdWVzdFN1cHBvcnQgKmNncywgRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gLSAgICByZXR1
cm4gczM5MF9wdl9jaGVja19jcHVzKGVycnApOw0KPiArICAgIHJldHVybiBzMzkwX3B2X2No
ZWNrX2NwdXMoZXJycCkgJiYgczM5MF9wdl9jaGVja19ob3N0KGVycnApOw0KPiAgIH0NCj4g
ICANCj4gICBpbnQgczM5MF9wdl9rdm1faW5pdChDb25maWRlbnRpYWxHdWVzdFN1cHBvcnQg
KmNncywgRXJyb3IgKiplcnJwKQ0KDQo=

